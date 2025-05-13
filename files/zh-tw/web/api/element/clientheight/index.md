---
title: Element：clientHeight 屬性
short-title: clientHeight
slug: Web/API/Element/clientHeight
page-type: web-api-instance-property
browser-compat: api.Element.clientHeight
---

{{APIRef("DOM")}}

**`clientHeight`** 是 {{domxref("Element")}} 介面的唯讀屬性，對於沒有 CSS 或行內排版框的元素會是 0；否則，它會回傳元素的內部高度（以像素為單位）。這個高度包含內邊距（padding），但不包含邊框（border）、外邊距（margin）與水平捲軸（如果有的話）。

`clientHeight` 的計算方式為：CSS 的 `height` + CSS 的 `padding` − 水平捲軸的高度（如果有的話）。

當 `clientHeight` 用於根元素（即 `<html>` 元素）（或在怪異模式中用於 `<body>` 元素）時，會回傳視口的高度（不包含任何捲軸）。

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
