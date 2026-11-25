---
title: Document：createRange() 方法
short-title: createRange()
slug: Web/API/Document/createRange
l10n:
  sourceCommit: 1abe075be40cd938aa9131a42b4e03b21b78627c
---

{{APIRef("DOM")}}

**`Document.createRange()`** 方法會回傳一個新的 {{domxref("Range")}} 物件，其起點與終點皆位於呼叫此方法的 {{domxref("Document")}} 物件中偏移量為 0 的位置。

## 語法

```js-nolint
createRange()
```

### 參數

無。

### 回傳值

建立的 {{domxref("Range")}} 物件。

## 範例

```js
const range = document.createRange();

range.setStart(startNode, startOffset);
range.setEnd(endNode, endOffset);
```

## 備註

一旦建立了 `Range`，你需要設定其邊界點，才能使用其大多數的方法。

## 規範

{{Specifications}}

## 瀏覽器相容性

{{Compat}}
