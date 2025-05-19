---
title: "Element：keyup 事件"
short-title: keyup
slug: Web/API/Element/keyup_event
page-type: web-api-event
browser-compat: api.Element.keyup_event
---

{{APIRef}}

**`keyup`** 事件會在按鍵被放開時觸發。

[`keydown`](/zh-TW/docs/Web/API/Element/keydown_event) 與 `keyup` 事件會提供一個程式碼，用來指示按下的是哪個按鍵，而 `keypress` 則會指示輸入的是哪個字元。例如，小寫「a」在 `keydown` 與 `keyup` 中會回報為 65，但在 `keypress` 中會是 97。大寫「A」則在所有事件中皆回報為 65。

按鍵事件的事件目標為目前取得焦點、正在處理鍵盤操作的元素。這包括：{{HTMLElement("input")}}、{{HTMLElement("textarea")}}、任何具有 [`contentEditable`](/zh-TW/docs/Web/HTML/Reference/Global_attributes/contenteditable) 屬性的元素，以及任何能透過鍵盤互動的元素，例如 {{HTMLElement("a")}}、{{HTMLElement("button")}} 與 {{HTMLElement("summary")}}。若沒有適當的元素取得焦點，則事件目標將會是 {{HTMLElement("body")}} 或根元素。該事件具備[冒泡](/zh-TW/docs/Learn_web_development/Core/Scripting/Event_bubbling)能力，能夠傳遞至 {{domxref("Document")}} 與 {{domxref("Window")}}。

在不同的鍵盤事件中，事件目標可能會有所變化。例如，按下 <kbd>Tab</kbd> 鍵時，`keydown` 的事件目標與 `keyup` 的事件目標可能會不同，因為焦點已經改變。

## 語法

使用事件名稱於方法中，如 {{domxref("EventTarget.addEventListener", "addEventListener()")}}，或是設定事件處理屬性。

```js-nolint
addEventListener("keyup", (event) => { })

onkeyup = (event) => { }
```

## 事件類型

為 {{domxref("KeyboardEvent")}}。繼承自 {{domxref("UIEvent")}} 與 {{domxref("Event")}}。

{{InheritanceDiagram("KeyboardEvent")}}

## 事件屬性

_此介面同時繼承其父類別 {{domxref("UIEvent")}} 與 {{domxref("Event")}} 的屬性。_

- {{domxref("KeyboardEvent.altKey")}} {{ReadOnlyInline}}

  - ：若事件產生時 <kbd>Alt</kbd> 鍵（在 macOS 為 <kbd>Option</kbd> 或 <kbd>⌥</kbd>）處於作用中，則回傳布林值 `true`。

- {{domxref("KeyboardEvent.code")}} {{ReadOnlyInline}}

  - ：回傳一個字串，為事件所代表的實體按鍵的程式碼值。

    > [!WARNING]
    > 此值忽略使用者的鍵盤配置，因此若使用者按下 QWERTY 鍵盤佈局中「Y」的位置，即使使用的是 QWERTZ 鍵盤（使用者預期輸入「Z」）或 Dvorak 鍵盤（使用者預期輸入「F」），也會始終回傳 "KeyY"。若你希望向使用者顯示正確的按鍵，可使用 {{domxref("Keyboard.getLayoutMap()")}}。

- {{domxref("KeyboardEvent.ctrlKey")}} {{ReadOnlyInline}}

  - ：若事件產生時 <kbd>Ctrl</kbd> 鍵處於作用中，則回傳布林值 `true`。

- {{domxref("KeyboardEvent.isComposing")}} {{ReadOnlyInline}}
  - ：若事件於 `compositionstart` 與 `compositionend` 之間觸發，則回傳布林值 `true`。
- {{domxref("KeyboardEvent.key")}} {{ReadOnlyInline}}
  - ：回傳代表該事件所代表按鍵的字串。
- {{domxref("KeyboardEvent.location")}} {{ReadOnlyInline}}
  - ：回傳一個數字，代表該按鍵在鍵盤或其他輸入裝置上的位置。各個位置的常數可參見[鍵盤位置](/zh-TW/docs/Web/API/KeyboardEvent#keyboard_locations)。
- {{domxref("KeyboardEvent.metaKey")}} {{ReadOnlyInline}}

  - ：若事件產生時 <kbd>Meta</kbd> 鍵處於作用中（在 Mac 鍵盤為 <kbd>⌘ Command</kbd> 鍵，在 Windows 鍵盤為 <kbd>⊞</kbd> 鍵），則回傳布林值 `true`。

- {{domxref("KeyboardEvent.repeat")}} {{ReadOnlyInline}}
  - ：若按鍵被持續按住以至於自動重複輸出，則回傳布林值 `true`。
- {{domxref("KeyboardEvent.shiftKey")}} {{ReadOnlyInline}}

  - ：若事件產生時 <kbd>Shift</kbd> 鍵處於作用中，則回傳布林值 `true`。

## 範例

### addEventListener keyup 範例

此範例會在你於 {{HtmlElement("input")}} 元素中放開按鍵時，記錄 {{domxref("KeyboardEvent.code")}} 的值。

```html
<input placeholder="點擊此處，然後按下並放開一個按鍵。" size="40" />
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

### 與輸入法相關的 keyup 事件

自 Firefox 65 起，[`keydown`](/zh-TW/docs/Web/API/Element/keydown_event) 與 `keyup` 事件會在 {{glossary("Input method editor")}} 組字期間觸發，以改善 CJKT 使用者的跨瀏覽器相容性（[Firefox 錯誤 354358](https://bugzil.la/354358)）。若要忽略組字期間的所有 `keyup` 事件，可這樣處理：

```js
eventTarget.addEventListener("keyup", (event) => {
  if (event.isComposing) {
    return;
  }
  // 執行操作
});
```

> [!NOTE]
> 不同於 `keydown`，`keyup` 事件並不會為輸入法事件提供特殊的 {{domxref("KeyboardEvent/keyCode", "keyCode")}} 值。但與 `keydown` 類似，當輸入第一個會開啟輸入法的字元時，`compositionstart` 可能在 `keyup` 之後才觸發，而輸入最後一個會關閉輸入法的字元時，`compositionend` 可能在 `keyup` 之前觸發。在這些情況下，即使事件屬於組字過程的一部分，`isComposing` 仍可能是 false。

## 規範

{{Specifications}}

## 瀏覽器相容性

{{Compat}}

## 參見

- [`input`](/zh-TW/docs/Web/API/Element/input_event)
- [`keydown`](/zh-TW/docs/Web/API/Element/keydown_event)
- [`keypress`](/zh-TW/docs/Web/API/Element/keypress_event)