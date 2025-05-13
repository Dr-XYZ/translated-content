---
title: Element：clientWidth 屬性
short-title: clientWidth
slug: Web/API/Element/clientWidth
page-type: web-api-instance-property
browser-compat: api.Element.clientWidth
---

{{APIRef("DOM")}}

{{domxref("Element")}} 介面的 **`clientWidth`** 唯讀屬性對於行內元素與沒有 CSS 的元素會是 0；否則，它會回傳元素的內部寬度（以像素為單位）。這個寬度包含內邊距，但不包含邊框、外邊距與垂直捲軸（如果有的話）。

當 `clientWidth` 用於根元素（即 `<html>` 元素）（或在怪異模式中用於 `<body>` 元素）時，會回傳視區的寬度（不包含任何捲軸）。

## 值

一個整數。

## 範例

![一個具有大量內距、邊框與外距的範例元素。clientWidth 是元素的內部寬度，包含其內距，但不包含外距、邊框與垂直捲軸。](dimensions-client.png)

## 規範

{{Specifications}}

## 瀏覽器相容性

{{Compat}}

## 參見

- [判斷元素的尺寸](/zh-TW/docs/Web/API/CSS_Object_Model/Determining_the_dimensions_of_elements)
- {{domxref("HTMLElement.offsetWidth")}}
- {{domxref("Element.scrollWidth")}}
- {{domxref("Element.clientHeight")}}
- {{domxref("Element.clientLeft")}}
- {{domxref("Element.clientTop")}}
- {{domxref("Element.getBoundingClientRect()")}}
