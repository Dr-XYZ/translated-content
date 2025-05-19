---
title: "Event：currentTarget 屬性"
short-title: currentTarget
slug: Web/API/Event/currentTarget
page-type: web-api-instance-property
browser-compat: api.Event.currentTarget
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

{{domxref("Event")}} 介面的 **`currentTarget`** 唯讀屬性表示事件處理器所綁定的元素。

這個元素不一定與觸發事件的元素相同，因為事件可能是在處理器綁定元素的後代元素上觸發，然後[冒泡](/zh-TW/docs/Learn_web_development/Core/Scripting/Event_bubbling)到有處理器的元素。觸發事件的元素由 {{domxref("Event.target")}} 指定。

注意 `currentTarget` 的值只有在事件處理器內部才可取得。在事件處理器外部，它的值為 `null`。這表示，例如你在事件處理器中取得 `Event` 物件的參考，並在事件處理器外部存取它的 `currentTarget` 屬性時，會得到 `null`。

## 值

一個 {{domxref("EventTarget")}} 物件，代表目前事件處理器所綁定的物件。

## 範例

### currentTarget 與 target 的比較

此範例說明 `currentTarget` 與 `target` 的差異。

#### HTML

此頁面包含一個「父層」{{htmlelement("div")}}，裡面嵌套一個「子層」 `<div>`。

```html
<div id="parent">
  Click parent
  <div id="child">Click child</div>
</div>

<button id="reset">Reset</button>
<pre id="output"></pre>
```

```css hidden
button,
div,
pre {
  margin: 0.5rem;
}

div {
  padding: 1rem;
  border: 1px solid black;
}
```

#### JavaScript

事件處理器綁定在父層元素上，會記錄 `event.currentTarget` 與 `event.target` 的值。

我們也加上一個「Reset」按鈕來重新載入範例。

```js
const output = document.querySelector("#output");
const parent = document.querySelector("#parent");
parent.addEventListener("click", (event) => {
  const currentTarget = event.currentTarget.getAttribute("id");
  const target = event.target.getAttribute("id");
  output.textContent = `Current target: ${currentTarget}\n`;
  output.textContent += `Target: ${target}`;
});

const reset = document.querySelector("#reset");
reset.addEventListener("click", () => document.location.reload());
```

#### 結果

如果你點擊子層 `<div>`，`target` 會顯示為子層；如果你點擊父層 `<div>`，則 `target` 會顯示為父層。

而在這兩種情況下，`currentTarget` 都會顯示為父層，因為事件處理器是綁定在父層元素上的。

{{EmbedLiveSample("currentTarget versus target", 100, 250)}}

## 規範

{{Specifications}}

## 瀏覽器相容性

{{Compat}}

## 參見

- [學習：事件冒泡](/zh-TW/docs/Learn_web_development/Core/Scripting/Event_bubbling)
