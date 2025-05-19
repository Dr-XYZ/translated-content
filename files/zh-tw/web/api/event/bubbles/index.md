---
title: Event：bubbles 屬性
slug: Web/API/Event/bubbles
l10n:
  sourceCommit: 5b20f5f4265f988f80f513db0e4b35c7e0cd70dc
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

{{domxref("Event")}} 介面的 **`bubbles`** 唯讀屬性表示此事件是否會在 DOM 樹中冒泡傳遞。

> [!NOTE]
> 更多關於冒泡的資訊，參見[事件冒泡](/zh-TW/docs/Learn_web_development/Core/Scripting/Event_bubbling)。

## 值

一個布林值，若事件會在 DOM 樹中冒泡傳遞，則為 `true`。

## 範例

```js
function handleInput(e) {
  // 檢查事件是否冒泡以傳遞事件
  if (!e.bubbles) {
    passItOn(e);
  }

  // 已在冒泡中
  doOutput(e);
}
```

## 規範

{{Specifications}}

## 瀏覽器相容性

{{Compat}}

## 參見

- {{domxref("Event.stopPropagation", "stopPropagation()")}} 在捕獲或冒泡階段中阻止當前事件繼續傳遞。
- {{domxref("Event.stopImmediatePropagation", "stopImmediatePropagation()")}} 阻止在同一層級中執行任何其他事件監聽器。
- {{domxref("Event.preventDefault", "preventDefault()")}} 允許事件繼續傳遞，但阻止瀏覽器在無監聽器處理事件時執行預設行為。
