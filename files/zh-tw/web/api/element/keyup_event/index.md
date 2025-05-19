---
title: Element：keyup 事件
slug: Web/API/Element/keyup_event
l10n:
  sourceCommut: 
---

{{APIRef}}

**`keyup`** 事件會在按鍵釋放時被觸發。

[`keydown`](/zh-TW/docs/Web/API/Element/keydown_event) 和 `keyup` 事件提供一個程式碼來指示按下了哪個鍵，而 `keypress` 事件則指示輸入了哪個字元。舉例來說，小寫字母「a」會由 `keydown` 和 `keyup` 報告為 65，但由 `keypress` 報告為 97。大寫字母「A」則由所有事件報告為 65。

按鍵事件的事件目標（event target）是目前正在處理鍵盤活動的、獲得焦點的元件。這包含了：{{HTMLElement("input")}}、{{HTMLElement("textarea")}}、任何具有 [`contentEditable`](/zh-TW/docs/Web/HTML/Reference/Global_attributes/contenteditable) 屬性的項目，以及任何其他可以透過鍵盤互動的項目，例如 {{HTMLElement("a")}}、{{HTMLElement("button")}} 和 {{HTMLElement("summary")}}。如果沒有合適的元件獲得焦點，事件目標將會是 {{HTMLElement("body")}} 或根元素。該事件會[冒泡](/zh-TW/docs/Learn_web_development/Core/Scripting/Event_bubbling)。它可以到達 {{domxref("Document")}} 和 {{domxref("Window")}}。

事件目標可能會在不同的按鍵事件之間發生改變。例如，按下 <kbd>Tab</kbd> 鍵的 `keydown` 目標可能會與 `keyup` 目標不同，因為焦點已經改變了。

## 形式語法

在 {{domxref("EventTarget.addEventListener", "addEventListener()")}} 等方法中使用事件名稱，或設定事件處理屬性。

```js-nolint
addEventListener("keyup", (event) => { })

onkeyup = (event) => { }
```

## 事件類型

一個 {{domxref("KeyboardEvent")}}。繼承自 {{domxref("UIEvent")}} 和 {{domxref("Event")}}。

{{InheritanceDiagram("KeyboardEvent")}}

## 事件屬性

_此介面也繼承其父系 {{domxref("UIEvent")}} 和 {{domxref("Event")}} 的屬性。_

- {{domxref("KeyboardEvent.altKey")}} {{ReadOnlyInline}}
  - : 回傳一個布林值，如果按鍵事件產生時 <kbd>Alt</kbd> 鍵（在 macOS 上是 <kbd>Option</kbd> 或 <kbd>⌥</kbd>）是作用中的，則回傳 `true`。
- {{domxref("KeyboardEvent.code")}} {{ReadOnlyInline}}
  - : 回傳一個字串，其中包含事件所代表的實體按鍵的程式碼值。

    > [!WARNING]
    > 這會忽略使用者的鍵盤布局，因此如果使用者在 QWERTY 鍵盤布局中按下「Y」位置的按鍵（靠近 home row 上方一排的中間），這將始終回傳「KeyY」，即使使用者是 QWERTZ 鍵盤（這意味著使用者期望的是「Z」，並且所有其他屬性都會指示「Z」）或 Dvorak 鍵盤布局（使用者期望的是「F」）。如果你想向使用者顯示正確的按鍵，你可以使用 {{domxref("Keyboard.getLayoutMap()")}}。

- {{domxref("KeyboardEvent.ctrlKey")}} {{ReadOnlyInline}}
  - : 回傳一個布林值，如果按鍵事件產生時 <kbd>Ctrl</kbd> 鍵是作用中的，則回傳 `true`。
- {{domxref("KeyboardEvent.isComposing")}} {{ReadOnlyInline}}
  - : 回傳一個布林值，如果事件在 `compositionstart` 之後但在 `compositionend` 之前被觸發，則回傳 `true`。
- {{domxref("KeyboardEvent.key")}} {{ReadOnlyInline}}
  - : 回傳一個字串，表示事件所代表的按鍵的按鍵值。
- {{domxref("KeyboardEvent.location")}} {{ReadOnlyInline}}
  - : 回傳一個數字，表示按鍵在鍵盤或其他輸入裝置上的位置。識別位置的常數列表顯示在 [Keyboard locations](/zh-TW/docs/Web/API/KeyboardEvent#keyboard_locations) 中。
- {{domxref("KeyboardEvent.metaKey")}} {{ReadOnlyInline}}
  - : 回傳一個布林值，如果按鍵事件產生時 <kbd>Meta</kbd> 鍵（在 Mac 鍵盤上是 <kbd>⌘ Command</kbd> 鍵；在 Windows 鍵盤上是 Windows 鍵（<kbd>⊞</kbd>））是作用中的，則回傳 `true`。
- {{domxref("KeyboardEvent.repeat")}} {{ReadOnlyInline}}
  - : 回傳一個布林值，如果按鍵被按住導致自動重複，則回傳 `true`。
- {{domxref("KeyboardEvent.shiftKey")}} {{ReadOnlyInline}}
  - : 回傳一個布林值，如果按鍵事件產生時 <kbd>Shift</kbd> 鍵是作用中的，則回傳 `true`。

## 範例

### addEventListener keyup 範例

此範例在你於 {{HtmlElement("input")}} 元件內部放開按鍵時，記錄 {{domxref("KeyboardEvent.code")}} 的值。

```html
<input placeholder="點擊這裡，然後按下並放開一個鍵。" size="40" />
<p id="log"></p>
```

```js
const input = document.querySelector("input");
const log = document.getElementById("log");

input.addEventListener("keyup", logKey);

function logKey(e) {
  log.textContent += ` ${e.code}`;
}
```

{{EmbedLiveSample("addEventListener_keyup_example")}}

### keyup 事件與 IME

自 Firefox 65 起，[`keydown`](/zh-TW/docs/Web/API/Element/keydown_event) 和 `keyup` 事件現在會在 {{glossary("Input method editor")}} 組合期間觸發，以改善 CJKT 使用者的跨瀏覽器相容性（[Firefox bug 354358](https://bugzil.la/354358)）。要忽略所有屬於組合部分的 `keyup` 事件，請執行類似以下的操作：

```js
eventTarget.addEventListener("keyup", (event) => {
  if (event.isComposing) {
    return;
  }
  // do something
});
```

> [!NOTE]
> 與 `keydown` 不同，`keyup` 事件對於 IME 事件沒有特殊的 {{domxref("KeyboardEvent/keyCode", "keyCode")}} 值。然而，與 `keydown` 類似，當輸入開啟 IME 的第一個字元時，`compositionstart` 可能在 `keyup` **之後**觸發；當輸入關閉 IME 的最後一個字元時，`compositionend` 可能在 `keyup` **之前**觸發。在這些情況下，即使事件是組合的一部分，`isComposing` 仍為 false。

## 規範

{{Specifications}}

## 瀏覽器相容性

{{Compat}}

## 參見

- [`input`](/zh-TW/docs/Web/API/Element/input_event)
- [`keydown`](/zh-TW/docs/Web/API/Element/keydown_event)
- [`keypress`](/zh-TW/docs/Web/API/Element/keypress_event)
