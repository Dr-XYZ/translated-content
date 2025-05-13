---
title: Element：clientHeight 屬性
slug: Web/API/Element/clientHeight
l10n:
  sourceCommit: 0916e1754652f3a7c663ef031faa26c98f492023
---

{{APIRef("DOM")}}

{{domxref("Element")}} 介面的 **`clientHeight`** 唯讀屬性對於沒有 CSS 或行內排版框的元素會是 0；否則，它會回傳元素的內部高度（以像素為單位）。這個高度包含內邊距，但不包含邊框、外邊距與水平捲軸（如果有的話）。

`clientHeight` 的計算方式為：CSS 的 `height` + CSS 的 `padding` − 水平捲軸的高度（如果有的話）。

當 `clientHeight` 用於根元素（即 `<html>` 元素）（或在怪異模式中用於 `<body>` 元素）時，會回傳視區的高度（不包含任何捲軸）。

## 值

一個整數。

## 範例

![clientHeight 屬性如何根據高度與內邊距決定元素的內部高度](dimensions-client.png)

## 規範

{{Specifications}}

## 瀏覽器相容性

{{Compat}}

## 參見

- [判斷元素的尺寸](/zh-TW/docs/Web/API/CSS_Object_Model/Determining_the_dimensions_of_elements)
- {{domxref("HTMLElement.offsetHeight")}}
- {{domxref("Element.scrollHeight")}}
- {{domxref("Element.clientWidth")}}
- {{domxref("Element.clientLeft")}}
- {{domxref("Element.clientTop")}}
- {{domxref("Element.getBoundingClientRect()")}}
