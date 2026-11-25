---
title: Event：isTrusted 屬性
short-title: isTrusted
slug: Web/API/Event/isTrusted
l10n:
  sourceCommit: 2fcbc06a9c381dac235dec2fa3528e33c8261a0f
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

{{domxref("Event")}} 介面的 **`isTrusted`** 唯讀屬性是一個布林值，當事件是由使用者代理（包含透過使用者行為與程式方法，例如 {{domxref("HTMLElement.focus()")}}）產生時為 `true`，而當事件是透過 {{domxref("EventTarget.dispatchEvent()")}} 發送時則為 `false`。透過 {{domxref("HTMLElement.click()")}} 觸發的 `click` 事件，其 `isTrusted` 屬性為 `false`。

## 值

一個布林值。

## 範例

```js
if (e.isTrusted) {
  /* 事件是受信任的 */
} else {
  /* 事件不受信任 */
}
```

## 規範

{{Specifications}}

## 瀏覽器相容性

{{Compat}}
