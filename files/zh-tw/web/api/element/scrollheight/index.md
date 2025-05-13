---
title: Element：scrollHeight 屬性
short-title: scrollHeight
slug: Web/API/Element/scrollHeight
page-type: web-api-instance-property
browser-compat: api.Element.scrollHeight
---

{{APIRef("DOM")}}

**`scrollHeight`** 是 {{domxref("Element")}} 介面的唯讀屬性，用來測量元素內容的總高度，即使有部分內容因為溢出而在畫面上不可見也會包含在內。

![使用者的檢視區是一個包含四個區塊（padding-top、border-top、border-bottom、padding-bottom）的元素。scrollHeight 從容器的 padding-top 開始，一直到 padding-bottom 結束，遠超過檢視區的上下邊界。](scrollheight.png)

`scrollHeight` 的值等於元素在不顯示垂直捲軸的情況下，完整容納其所有內容所需的最小高度。它的測量方式與 {{domxref("Element.clientHeight", "clientHeight")}} 相同：包含元素的內距（padding），但不包含邊框（border）、外距（margin）或（如果存在的話）水平捲軸。它也可能包含像 {{cssxref("::before")}} 或 {{cssxref("::after")}} 這類偽元素的高度。如果內容本身就能完全顯示，沒有捲動需求，則 `scrollHeight` 會等於 {{domxref("Element.clientHeight", "clientHeight")}}。

## 值

一個整數。

## 問題與解法

### 判斷元素是否已被完全捲動

`scrollTop` 是非取整的數值，而 `scrollHeight` 和 `clientHeight` 是整數值 — 因此要判斷是否已捲到最底部，應比較它們是否在某個容許誤差內（例如這裡使用的 `1`）：

```js
Math.abs(element.scrollHeight - element.clientHeight - element.scrollTop) <= 1;
```

以下寫法 _並不總是_ 正確，因為 `scrollTop` 可能包含小數：

```js
element.scrollHeight - Math.abs(element.scrollTop) === element.clientHeight;
```

### 判斷內容是否溢出元素邊界

這個函式會回傳布林值，表示內容是否超出元素本身的可視高度：

```js
function isOverflowing(element) {
  return element.scrollHeight > element.clientHeight;
}
```

你也可以進一步確認元素是否實際具有可捲動性：

```js
function isScrollable(element) {
  return (
    isOverflowing(element) &&
    ["scroll", "auto"].includes(window.getComputedStyle(element).overflowY)
  );
}
```

## 範例

### 確認使用者是否已閱讀完整段文字

這個範例配合 {{domxref("Element.scroll_event", "scroll")}} 事件，能用來確認使用者是否真的閱讀了整段內容（也請參考 {{domxref("element.scrollTop")}} 與 {{domxref("element.clientHeight")}} 屬性）。

下方範例中，核取方塊在未閱讀完畢前是無法勾選的；一旦閱讀完成，就可以勾選「我同意」，並啟用「下一步」按鈕。

#### HTML

```html
<form id="form" name="registration">
  <p id="info">閱讀完所有內容以啟用同意選項</p>
  <div id="very-important-read">
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit, ...
    </p>
    <p>
      Sit amet volutpat consequat mauris nunc congue nisi vitae. ...
    </p>
    <p>
      Cras adipiscing enim eu turpis egestas. ...
    </p>
    <p>
      Fames ac turpis egestas sed tempus. ...
    </p>
  </div>
  <p>
    <input type="checkbox" id="agree" name="accept" disabled />
    <label for="agree">我同意</label>
    <input type="submit" id="next-step" value="下一步" disabled />
  </p>
</form>
```

#### CSS

```css
#info {
  margin: 5px;
  display: inline-block;
  font-style: italic;
}

#very-important-read {
  height: 130px;
  padding: 5px;
  border: 2px solid #00b4c5;
  border-radius: 5px;
  overflow: scroll;
}
```

#### JavaScript

```js
const info = document.getElementById("info");
const toAgree = document.getElementById("agree");
const toNextStep = document.getElementById("next-step");
const veryImportantRead = document.getElementById("very-important-read");

// 判斷是否已經捲動到底
function isRead(element) {
  return (
    Math.abs(element.scrollHeight - element.clientHeight - element.scrollTop) <= 1
  );
}

function checkScrollToBottom(element) {
  if (isRead(element)) {
    info.innerText = "你已閱讀完所有內容，可同意繼續。";
    toAgree.disabled = false;
  }
}

toAgree.addEventListener("change", (e) => {
  toNextStep.disabled = !e.target.checked;
});

veryImportantRead.addEventListener("scroll", () => {
  checkScrollToBottom(veryImportantRead);
});

toNextStep.addEventListener("click", () => {
  if (toAgree.checked) {
    toNextStep.value = "完成！";
  }
});
```

#### 結果

{{EmbedLiveSample('Checking_that_the_user_has_read_a_text', 640, 250)}}

## 規範

{{Specifications}}

## 瀏覽器相容性

{{Compat}}

## 參見

- [判斷元素尺寸](/zh-TW/docs/Web/API/CSS_Object_Model/Determining_the_dimensions_of_elements)
- {{domxref("HTMLElement.offsetHeight")}}
- {{domxref("Element.clientHeight")}}
- {{domxref("Element.scrollWidth")}}
- {{domxref("Element.scrollLeft")}}
- {{domxref("Element.scrollTop")}}
- {{domxref("Element.getBoundingClientRect()")}}
- {{domxref("Element.scrollTo()")}}
