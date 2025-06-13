---
title: 介紹
slug: Web/SVG/Tutorials/SVG_from_scratch/Introduction
l10n:
  sourceCommit: c1564acf160ef4b320fb7b89ab65211b9c50cf1b
---

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch", "Web/SVG/Tutorials/SVG_from_scratch/Getting_started") }}

[SVG](/zh-TW/docs/Web/SVG) 是一種 [XML](/zh-TW/docs/Web/XML) 語言，類似於 [XHTML](/zh-TW/docs/Glossary/XHTML)，可用於繪製向量圖形，如下方所示。你可以透過指定所有必要的線條和形狀、修改現有的點陣圖，或結合兩者來建立圖像。圖像及其組件也可以進行變形、合成或套用濾鏡，以完全改變其外觀。

![Mozilla 恐龍標誌](dino.svg)

SVG 於 1999 年問世，在此之前，有多個相互競爭的格式提交給 [W3C](https://www.w3.org/)，但都未能完全獲得批准。所有主流[瀏覽器](https://caniuse.com/#search=svg)都支援 SVG。一個缺點是載入 SVG 可能會很慢。SVG 確實提供了一些好處，其中包括可用的 [DOM 介面](/zh-TW/docs/Web/API)，且不需要第三方擴充功能。是否使用它通常取決於你的特定使用情境。

## 基本要素

[HTML](/zh-TW/docs/Web/HTML) 提供了用於定義標題、段落、表格等的元素。同樣地，SVG 提供了用於圓形、矩形以及簡單和複雜曲線的元素。一個基本的 SVG 文件僅由 {{ SVGElement('svg') }} 根元素和幾個共同建構圖形的基本形狀所組成。此外，還有 {{ SVGElement('g') }} 元素，用於將多個基本形狀群組在一起。

從這個基本結構開始，SVG 圖像可以變得任意複雜。SVG 支援漸層、旋轉、濾鏡效果、動畫、與 JavaScript 的互動性等等。但所有這些語言的額外功能都依賴於這組相對較小的元素來定義圖形區域。

## 開始之前

市面上有許多繪圖應用程式，例如免費的 [Inkscape](https://inkscape.org/)，它使用 SVG 作為其原生檔案格式。然而，本教學將依賴可靠的 XML 或文字編輯器（由你選擇）。我們的想法是向那些想了解 SVG 的人教授其內部原理，而最好的方法就是親自動手寫一些標記。不過，你應該注意你的最終目標。並非所有的 SVG 檢視器都一樣，因此很有可能為某個應用程式編寫的內容在另一個應用程式中無法完全相同地顯示，因為它們支援不同層級的 SVG 規範，或你與 SVG 一起使用的其他規範（即 [JavaScript](/zh-TW/docs/Web/JavaScript) 或 [CSS](/zh-TW/docs/Web/CSS)）。

所有現代瀏覽器都支援 SVG，在某些情況下，甚至回溯幾個版本也支援。在 [Can I use](https://caniuse.com/svg) 上可以找到一個相當完整的瀏覽器支援表。Firefox 從 1.5 版開始就支援部分 SVG 內容，且支援程度自那時起隨著每個版本的發布而增加。希望透過本教學，MDN 能幫助開發者跟上 Gecko 與其他一些主要實作之間的差異。

在開始之前，你應該對 XML 或其他標記語言（如 HTML）有基本的了解。如果你對 XML 不太熟悉，這裡有一些準則需要記住：

- SVG 元素和屬性都應按照此處顯示的大小寫輸入，因為 XML 是區分大小寫的（與 HTML 不同）。
- SVG 中的屬性值必須放在引號內，即使它們是數字。

SVG 是一個龐大的規範。本教學試圖涵蓋基礎知識。一旦你熟悉了，你就可以使用[元素參考](/zh-TW/docs/Web/SVG/Reference/Element)和[介面參考](/zh-TW/docs/Web/API/Document_Object_Model#svg_dom)來查找你需要知道的任何其他內容。

## SVG 的各種版本

自 2003 年成為推薦標準以來，最新的「完整」SVG 版本是 1.1。它建立在 SVG 1.0 之上，但增加了更多的模組化以簡化實作。[SVG 1.1 的第二版](https://www.w3.org/TR/SVG11/)於 2011 年成為推薦標準。「完整」的 SVG 1.2 原本預計是 SVG 的下一個主要版本。但它被 [SVG 2.0](https://svgwg.org/svg2-draft/) 規範所取代，SVG 2.0 是目前的標準，並採用了類似 CSS 3 的方法，將組件拆分為幾個鬆散耦合的規範。

除了完整的 SVG 推薦標準外，W3C 的工作小組在 2003 年推出了 SVG Tiny 和 SVG Basic。這兩個設定檔主要針對行動裝置。第一個是 SVG Tiny，它應為功能較弱的小型裝置提供圖形基元。SVG Basic 提供了完整 SVG 的許多功能，但不包括那些難以實作或算繪負擔較重的功能（如動畫）。2008 年，SVG Tiny 1.2 成為 W3C 推薦標準。

曾經有制定 SVG Print 規範的計畫，該規範將增加對多頁面和增強色彩管理的支援。這項工作已經中止。

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch", "Web/SVG/Tutorials/SVG_from_scratch/Getting_started") }}
