---
title: MathML
slug: Web/MathML
l10n:
  sourceCommit: d37026a4d0e1e3a5a2ab82d34566689aada039f7
---

**數學標記式語言（MathML）**是一種基於 [XML](/zh-TW/docs/Web/XML) 的語言，用於描述數學符號。

[MathML](https://w3c.github.io/mathml/) 最初被設計為一個通用規範，適用於瀏覽器、辦公室套件、[電腦代數系統](https://https://zh.wikipedia.org/wiki/計算機代數系統)、[EPUB](https://www.w3.org/publishing/epub33/) 閱讀器、以及基於 [LaTeX](https://zh.wikipedia.org/wiki/LaTeX) 的產生器。然而，這種方法並不太適應 Web：專注於語意的[子集](https://w3c.github.io/mathml/#contm)從未在瀏覽器中實作，而專注於數學排版的[子集](https://w3c.github.io/mathml/#presm)則導致了瀏覽器實作的不完整和不一致。

[MathML Core](https://w3c.github.io/mathml-core/) 是一個子集，增加了基於 [LaTeX](https://zh.wikipedia.org/wiki/LaTeX) 和 [Open Font Format](https://learn.microsoft.com/en-us/typography/opentype/spec/math) 規則的實作細節。它專為瀏覽器量身打造，並特別設計來與其他 Web 標準良好協作，包括 [HTML](/zh-TW/docs/Web/HTML)、[CSS](/zh-TW/docs/Web/CSS)、[DOM](/zh-TW/docs/Web/API/Document_Object_Model)、[JavaScript](/zh-TW/docs/Web/JavaScript)。

下方你將找到使用 MathML 的文件、範例和工具連結。MDN 使用 [MathML Core](https://w3c.github.io/mathml-core/) 作為參考規範，但由於標準化歷史的不穩定，舊版的 MathML 功能可能仍會出現在現有的實作和 Web 內容中。

> [!NOTE]
> 強烈建議開發者和作者切換到 MathML Core，或許可以依賴其他 Web 技術來涵蓋缺少的使用案例。Math WG 正在維護一套 [MathML polyfills](https://github.com/w3c/mathml-polyfills) 以促進此轉換。

## 教學

[MathML 教學](/zh-TW/docs/Web/MathML/Tutorials)旨在引導你學習各個主題，假設你沒有任何先前的經驗，從基礎開始，逐步進展到更進階的技術。

- [MathML 入門](/zh-TW/docs/Web/MathML/Tutorials/For_beginners)
  - : 本教學將引導你使用結構化標記來建立數學公式。它從將 MathML 加入 HTML 文件的介紹開始，接著深入探討關鍵組件：分數和根號、腳本元素和文字容器。然後，教學會涵蓋用於矩陣的表格佈局和進階數學格式。最後，透過一個挑戰來測試你的理解，要求你使用所學概念重現三個著名的數學公式。

## 指南

[MathML 指南](/zh-TW/docs/Web/MathML/Guides)是幫助你在網頁上編寫 MathML 的資源，包括關於寫作、編輯器、字型等方面的指導。

- [編寫 MathML](/zh-TW/docs/Web/MathML/Guides/Authoring)
  - : 編寫 MathML 的建議和技巧，包括建議的 MathML 編輯器以及如何將其輸出整合到 Web 內容中。
- [MathML 字型](/zh-TW/docs/Web/MathML/Guides/Fonts)
  - : 使用者如何安裝這些數學字型，以便在瀏覽器中正確顯示 MathML。

## 參考

[MathML 參考](/zh-TW/docs/Web/MathML/Reference)是 MDN 上記錄的 MathML 元素和屬性的完整列表。

- [MathML 元素參考](/zh-TW/docs/Web/MathML/Reference/Element)
  - : 關於每個 MathML 元素的詳細資訊，以及桌面和行動瀏覽器的相容性訊息。
- [MathML 全域屬性參考](/zh-TW/docs/Web/MathML/Reference/Global_attributes)
  - : 關於適用於所有元素的全域 MathML 屬性的訊息。
- [MathML 屬性參考](/zh-TW/docs/Web/MathML/Reference/Attribute)
  - : 關於修改元素外觀或行為的 MathML 屬性的訊息。
- [MathML 屬性值](/zh-TW/docs/Web/MathML/Reference/Values)
  - : 關於 MathML 屬性值的進一步訊息。

## 範例

下方你將找到一些範例，可以幫助你了解如何使用 MathML。

### MathML 公式

以下示範在 Web 內容中展示了日益複雜的數學概念。

- [證明畢氏定理](/zh-TW/docs/Web/MathML/Guides/Proving_the_Pythagorean_theorem)
  - : 一個展示畢氏定理證明的小範例。
- [推導一元二次方程式公式解](/zh-TW/docs/Web/MathML/Guides/Deriving_the_quadratic_formula)
  - : 概述了一元二次方程式公式解的推導過程。
- [Mozilla MathML 測試](https://fred-wang.github.io/MathFonts/mozilla_mathml_test/)
  - : 來自 Mozilla MathML 專案的原始測試。它包含來自 [TeXbook](https://en.wikipedia.org/wiki/Computers_and_Typesetting) 的範例，並附有由 TeX 產生的圖片參考。
- [MathML 瀏覽器測試](http://eyeasme.com/Joe/MathML/MathML_browser_test.html)
  - : 一個類似的測試，其中包含取自維基百科的具體公式。

### 其他 Web 技術

以下示範將 MathML 與其他 Web 技術結合，以產生進階內容。

- [`<la-tex>` 自訂元素](https://fred-wang.github.io/TeXZilla/examples/customElement.html)
  - : 一個接受 [LaTeX](https://zh.wikipedia.org/wiki/LaTeX) 內容的[自訂元素](/zh-TW/docs/Web/API/Web_components/Using_custom_elements)。
- [磁場示範](https://fred-wang.github.io/TeXZilla/examples/toImageWebGL.html)
  - : 使用 [SVG](/zh-TW/docs/Web/SVG) 和 [WebGL](/zh-TW/docs/Web/API/WebGL_API) 的磁場 3D 表示。
- [Συνάρτηση ζήτα Ρήμαν（el）](https://fred-wang.github.io/MathFonts/%CE%A3%CF%85%CE%BD%CE%AC%CF%81%CF%84%CE%B7%CF%83%CE%B7_%CE%B6%CE%AE%CF%84%CE%B1_%CE%A1%CE%AE%CE%BC%CE%B1%CE%BD.html)
  - : 一篇關於黎曼 ζ 函數的希臘文文章，使用了來自 [Greek Font Society](https://greekfontsociety-gfs.gr/) 的 [Web 字型](/zh-TW/docs/Learn_web_development/Core/Text_styling/Web_fonts)。
- [佩爾方程式](https://people.igalia.com/fwang/pell-bigint-mathml/)
  - : 一個使用 [`BigInt`](/zh-TW/docs/Web/JavaScript/Reference/Global_Objects/BigInt) 解決佩爾方程式的 JavaScript 程式。
- [Lovelace 的白努利數程式](https://people.igalia.com/fwang/lovelace-jsclass-mathml/)
  - : 一個模擬 Ada Lovelace 計算白努利數程式的模擬器，使用了[私有屬性](/zh-TW/docs/Web/JavaScript/Reference/Classes/Private_properties)。

## 從社群獲得幫助

- [W3C Math 首頁](https://www.w3.org/Math/)
- [在 GitHub w3c/mathml 倉儲提出問題](https://github.com/w3c/mathml/issues)
- [www-math w3.org 郵件存檔](https://lists.w3.org/Archives/Public/www-math/)

## 工具

- [W3C 驗證器](https://validator.w3.org/)
- [W3C 的 wiki 頁面](https://www.w3.org/wiki/Math_Tools)

## 相關主題

- [CSS](/zh-TW/docs/Web/CSS)
- [HTML](/zh-TW/docs/Web/HTML)
- [SVG](/zh-TW/docs/Web/SVG)

## 規範

{{Specifications}}

## 瀏覽器相容性

{{Compat}}
