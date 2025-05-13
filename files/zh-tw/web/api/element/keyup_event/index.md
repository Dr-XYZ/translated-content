---
title: Element：keyup 事件
short-title: keyup
slug: Web/API/Element/keyup_event
page-type: web-api-event
browser-compat: api.Element.keyup_event
---

{{APIRef}}

**`keyup`** 事件會在釋放鍵盤按鍵時被觸發。

[`keydown`](/zh-TW/docs/Web/API/Element/keydown_event) 和 `keyup` 事件提供一個碼值來指出按下的是哪個鍵，而 `keypress` 則指出輸入的是哪個字元。例如，小寫「a」在 `keydown` 和 `keyup` 中會被報告為 65，但在 `keypress` 中會是 97。大寫「A」則會在所有事件中都報告為 65。

鍵盤事件的事件目標是目前獲得焦點、正在處理鍵盤活動的元素。這包括：{{HTMLElement("input")}}、{{HTMLElement("textarea")}}、任何設為 [`contentEditable`](/zh-TW/docs/Web/HTML/Global_attributes/contenteditable) 的元素，以及任何可以透過鍵盤互動的其他元素，例如 {{HTMLElement("a")}}、{{HTMLElement("button")}} 與 {{HTMLElement("summary")}}。如果沒有適合的元素獲得焦點，事件目標會是 {{HTMLElement("body")}} 或根元素。此事件具有[冒泡](/zh-TW/docs/Learn/JavaScript/Building_blocks/Events#事件冒泡)特性，可傳遞至 {{domxref("Document")}} 與 {{domxref("Window")}}。

不同鍵盤事件的事件目標可能會有所不同。例如，當按下 <kbd>Tab</kbd> 鍵時，`keydown` 的事件目標會與 `keyup` 不同，因為焦點已經改變。

## 語法

可以透過 {{domxref("EventTarget.addEventListener", "addEventListener()")}} 方法註冊事件，或直接設定事件處理屬性。

```js-nolint
addEventListener("keyup", (event) => { })

onkeyup = (event) => { }
```

## 事件類型

{{domxref("KeyboardEvent")}}。繼承自 {{domxref("UIEvent")}} 與 {{domxref("Event")}}。

{{InheritanceDiagram("KeyboardEvent")}}

## 事件屬性

_此介面也會繼承其父介面 {{domxref("UIEvent")}} 與 {{domxref("Event")}} 的屬性。_

- {{domxref("KeyboardEvent.altKey")}} {{ReadOnlyInline}}

  - ：回傳一個布林值，當事件產生時 <kbd>Alt</kbd>（macOS 上為 <kbd>Option</kbd> 或 <kbd>⌥</kbd>）鍵處於啟用狀態時為 `true`。

- {{domxref("KeyboardEvent.code")}} {{ReadOnlyInline}}

  - ：回傳一個字串，表示事件所代表的實體鍵位的碼值。

    > [!WARNING]
    > 這個值不會考慮使用者的鍵盤配置。因此，即使使用者使用 QWERTZ 鍵盤（預期輸入為「Z」）或 Dvorak 鍵盤（預期輸入為「F」），若按下 QWERTY 鍵盤中「Y」鍵的位置，這裡仍會回傳 "KeyY"。如果你需要向使用者顯示正確的按鍵內容，可以使用 {{domxref("Keyboard.getLayoutMap()")}}。

- {{domxref("KeyboardEvent.ctrlKey")}} {{ReadOnlyInline}}

  - ：回傳一個布林值，當事件產生時 <kbd>Ctrl</kbd> 鍵處於啟用狀態時為 `true`。

- {{domxref("KeyboardEvent.isComposing")}} {{ReadOnlyInline}}
  - ：回傳一個布林值，若事件是在 `compositionstart` 與 `compositionend` 間觸發，則為 `true`。

- {{domxref("KeyboardEvent.key")}} {{ReadOnlyInline}}
  - ：回傳一個字串，表示事件所代表的按鍵值。

- {{domxref("KeyboardEvent.location")}} {{ReadOnlyInline}}
  - ：回傳一個數值，表示該按鍵在鍵盤或其他輸入裝置上的位置。參見 [鍵盤位置](/zh-TW/docs/Web/API/KeyboardEvent#keyboard_locations) 以查看可用常數列表。

- {{domxref("KeyboardEvent.metaKey")}} {{ReadOnlyInline}}

  - ：回傳一個布林值，當事件產生時 <kbd>Meta</kbd> 鍵處於啟用狀態時為 `true`。在 Mac 鍵盤上是 <kbd>⌘ Command</kbd> 鍵，在 Windows 鍵盤上是 Windows 鍵（<kbd>⊞</kbd>）。

- {{domxref("KeyboardEvent.repeat")}} {{ReadOnlyInline}}
  - ：回傳一個布林值，若該鍵處於持續按壓狀態，導致自動重複觸發事件，則為 `true`。

- {{domxref("KeyboardEvent.shiftKey")}} {{ReadOnlyInline}}

  - ：回傳一個布林值，當事件產生時 <kbd>Shift</kbd> 鍵處於啟用狀態時為 `true`。

## 範例

### addEventListener keyup 範例

此範例會在你於 {{HtmlElement("input")}} 元素內釋放任一按鍵時，記錄其 {{domxref("KeyboardEvent.code")}} 值。

```html
<input placeholder="點一下這裡，然後按下並釋放任一鍵。" size="40" />
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

### 搭配輸入法的 keyup 事件

自 Firefox 65 起，為了改善 CJKT 使用者的跨瀏覽器相容性，在輸入法（{{glossary("Input method editor")}}）組字期間也會觸發 [`keydown`](/zh-TW/docs/Web/API/Element/keydown_event) 與 `keyup` 事件（[Firefox bug 354358](https://bugzil.la/354358)）。若你想忽略所有與組字有關的 `keyup` 事件，可這樣處理：

```js
eventTarget.addEventListener("keyup", (event) => {
  if (event.isComposing) {
    return;
  }
  // 執行你的處理邏輯
});
```

> [!NOTE]
> 與 `keydown` 不同，`keyup` 事件不會針對輸入法事件給出特別的 {{domxref("KeyboardEvent/keyCode", "keyCode")}} 值。然而，和 `keydown` 一樣，`compositionstart` 可能會在輸入第一個開啟輸入法的字元後才觸發，而 `compositionend` 也可能在輸入最後一個字元關閉輸入法前就觸發。在這些情況下，即便該事件實際上屬於組字階段，`isComposing` 仍會是 false。

## 規範

{{Specifications}}

## 瀏覽器相容性

{{Compat}}

## 參見

- [`input`](/zh-TW/docs/Web/API/Element/input_event)
- [`keydown`](/zh-TW/docs/Web/API/Element/keydown_event)
- [`keypress`](/zh-TW/docs/Web/API/Element/keypress_event)
