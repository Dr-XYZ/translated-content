---
title: Event：Event() 建構子
short-title: Event()
slug: Web/API/Event/Event
page-type: web-api-constructor
browser-compat: api.Event.Event
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

**`Event()`** 建構子會建立一個新的 {{domxref("Event")}} 物件。這種方式建立的事件稱為_合成事件_（synthetic event），與瀏覽器觸發的事件不同，可由腳本[派發](/zh-TW/docs/Web/Events/Creating_and_triggering_events)。

## 語法

```js-nolint
new Event(type)
new Event(type, options)
```

### 參數

- `type`
  - ：事件名稱的字串。
- `options` {{optional_inline}}
  - ：一個包含以下屬性的物件：
    - `bubbles` {{optional_inline}}
      - ：一個布林值，表示事件是否會冒泡。預設為 `false`。
    - `cancelable` {{optional_inline}}
      - ：一個布林值，表示事件是否可以取消。預設為 `false`。
    - `composed` {{optional_inline}}
      - ：一個布林值，表示事件是否會觸發影子 DOM 根節點之外的監聽器（詳見 {{domxref("Event.composed")}}）。預設為 `false`。

### 回傳值

一個新的 {{domxref("Event")}} 物件。

## 範例

```js
// 建立一個冒泡但不可取消的 look 事件

const evt = new Event("look", { bubbles: true, cancelable: false });
document.dispatchEvent(evt);

// 事件可以從任意元素派發，不僅限於 document
myDiv.dispatchEvent(evt);
```

## 規範

{{Specifications}}

## 瀏覽器相容性

{{Compat}}

## 參見

- {{domxref("Event")}}
- {{domxref("EventTarget.dispatchEvent()")}}
- [建立與觸發事件](/zh-TW/docs/Web/Events/Creating_and_triggering_events)
