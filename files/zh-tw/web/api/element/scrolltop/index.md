---
title: Element：scrollTop 屬性
slug: Web/API/Element/scrollTop
l10n:
   sourceCommit: 0916e1754652f3a7c663ef031faa26c98f492023
---

{{APIRef("DOM")}}

{{domxref("Element")}} 介面的 **`scrollTop`** 屬性用來用於取得或設定元素內容自頂部邊緣起捲動的像素數。此屬性在現代瀏覽器中具備次像素精度，這表示它的值不一定是整數。

## 值

一個雙精度浮點數，表示元素內容目前從頂部被捲動的像素量。正值代表往下捲動（以顯示底部的更多內容），若元素未垂直捲動，則 `scrollTop` 值為 `0`。如果文件不是目前活動的文件，回傳值會是 `0`。若文件是在具有次像素算繪的裝置上顯示，則 `scrollTop` 也可能包含小數點。

如果元素可以從初始包含區塊向上捲動，則 `scrollTop` 有可能為負值，例如當元素的 {{cssxref("flex-direction")}} 為 `column-reverse` 且內容向上增長時，`scrollTop` 為 `0` 表示捲軸在最底部（內容的起點），當你向上捲動到內容結尾時，`scrollTop` 會變成負值。

Safari 在過度捲動時會將 `scrollTop` 的值更新為超過最大捲動位置的數值（除非關閉預設的「彈跳」效果，例如將 {{cssxref(“overscroll-behavior”)}} 設為 `none`），而 Chrome 與 Firefox 則不會這樣處理。例如，在 Safari 中，即使元素已經捲動到頂部，只要繼續向上捲動，`scrollTop` 就可能變成負值。

`scrollTop` 屬性也可以設定，這會讓元素捲動到指定的垂直位置，行為等同於使用 {{domxref("Element.scroll()")}} 並設定 `behavior: "auto"`。

## 範例

### 捲動元素

在這個範例中，試著捲動帶有虛線邊框的容器，你會看到 `scrollTop` 的值會隨著捲動變化。

#### HTML

```html
<div id="container">
  <p>
    遠在銀河系西螺旋臂不受關注的盡頭，有一顆小小不起眼的黃色恆星。在其約九千二百萬英哩外的軌道上，有一顆藍綠色的小行星，它上面的猿類後裔如此原始，居然還覺得數位手錶很酷。
  </p>
</div>

<div id="output">scrollTop: 0</div>
```

#### CSS

```css
#container {
  overflow: scroll;
  height: 150px;
  width: 150px;
  border: 5px dashed orange;
}

#output {
  padding: 1rem 0;
}
```

#### JavaScript

```js
const container = document.querySelector("#container");
const output = document.querySelector("#output");

container.addEventListener("scroll", () => {
  output.textContent = `scrollTop: ${container.scrollTop}`;
});
```

#### 結果

{{EmbedLiveSample("捲動元素", 400, 250)}}

## 規範

{{Specifications}}

## 瀏覽器相容性

{{Compat}}

## 參見

- [判斷元素的尺寸](/zh-TW/docs/Web/API/CSS_Object_Model/Determining_the_dimensions_of_elements)
- {{domxref("HTMLElement.offsetTop")}}
- {{domxref("Element.clientTop")}}
- {{domxref("Element.scrollHeight")}}
- {{domxref("Element.scrollWidth")}}
- {{domxref("Element.scrollLeft")}}
- {{domxref("Element.getBoundingClientRect()")}}
- {{domxref("Element.scrollTo()")}}
