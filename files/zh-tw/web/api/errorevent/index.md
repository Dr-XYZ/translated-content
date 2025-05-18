---
title: ErrorEvent
slug: Web/API/ErrorEvent
l10n:
  sourceCommit: c51a68c737afbd68787f4450f0c00da2dbdd5317
---

{{APIRef("HTML DOM")}}{{AvailableInWorkers}}

**`ErrorEvent`** 介面代表與腳本或檔案中的錯誤相關的事件，並提供相關資訊。

{{InheritanceDiagram}}

## 建構子

- {{domxref("ErrorEvent.ErrorEvent", "ErrorEvent()")}}
  - ：使用指定的參數建立一個 `ErrorEvent` 事件。

## 實例屬性

_亦繼承其父介面 {{domxref("Event")}} 的屬性。_

- {{domxref("ErrorEvent.message")}} {{ReadOnlyInline}}
  - : 包含可讀性高的錯誤訊息的字串，用以描述問題。
- {{domxref("ErrorEvent.filename")}} {{ReadOnlyInline}}
  - : 包含發生錯誤的腳本檔案名稱的字串。
- {{domxref("ErrorEvent.lineno")}} {{ReadOnlyInline}}
  - : 一個整數，表示發生錯誤的腳本檔案行號。
- {{domxref("ErrorEvent.colno")}} {{ReadOnlyInline}}
  - : 一個整數，表示發生錯誤的腳本檔案欄位號。
- {{domxref("ErrorEvent.error")}} {{ReadOnlyInline}}
  - : 一個 JavaScript 值，例如 {{jsxref("Error")}} 或 {{domxref("DOMException")}}，代表與此事件相關的錯誤。

## 實例方法

_繼承自其父介面 {{domxref("Event")}} 的方法。_

## 規範

{{Specifications}}

## 瀏覽器相容性

{{Compat}}

## 參見

- [使用 Web Worker](/zh-TW/docs/Web/API/Web_Workers_API/Using_web_workers)：最可能觸發此類事件的物件。
- {{domxref("Window")}}：{{domxref("Window/error_event", "error")}} 事件
- {{domxref("Navigation")}}：{{domxref("Navigation/navigateerror_event", "navigateerror")}} 事件
