---
title: 填色與描邊
slug: Web/SVG/Tutorials/SVG_from_scratch/Fills_and_strokes
l10n:
  sourceCommit: c1564acf160ef4b320fb7b89ab65211b9c50cf1b
---

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Paths", "Web/SVG/Tutorials/SVG_from_scratch/Gradients") }}

有幾種方法可以為形狀上色（包含在物件上指定屬性）：使用行內 [CSS](/zh-TW/docs/Glossary/CSS)、嵌入的 CSS 區塊或外部 CSS 檔案。你在網路上找到的大多數 [SVG](/zh-TW/docs/Glossary/SVG) 都使用行內 CSS，但每種類型都有其優缺點。

## 填色與描邊屬性

### 著色

基本的著色可以透過在節點上設定兩個屬性來完成：`fill` 和 `stroke`。使用 `fill` 可以設定物件內部的顏色，而 `stroke` 則設定圍繞物件繪製的線條顏色。你可以使用與 HTML 中相同的 CSS 顏色命名方案，無論是顏色名稱（如 `red`）、rgb 值（如 `rgb(255 0 0)`）、十六進位值等。

```html
<?xml version="1.0" standalone="no"?>
<svg width="160" height="140" xmlns="http://www.w3.org/2000/svg" version="1.1">
  <rect
    x="10"
    y="10"
    width="100"
    height="100"
    stroke="blue"
    fill="purple"
    fill-opacity="0.5"
    stroke-opacity="0.8"
    stroke-width="15" />
</svg>
```

{{EmbedLiveSample("著色", "100%", 150)}}

此外，你可以在 SVG 中分別指定 `fill` 或 `stroke` 的不透明度。這些是由 `fill-opacity` 和 `stroke-opacity` 屬性控制的。

### 描邊

除了顏色屬性外，還有一些其他屬性可用來控制描邊在線條上的繪製方式。

![stroke-linecap 屬性改變了這些描邊端點的外觀：square 增加了一個方形端點，round 提供了一個圓形端點，而 butt 則移除了端點樣式](svg_stroke_linecap_example.png)

```xml
<?xml version="1.0" standalone="no"?>
<svg width="160" height="140" xmlns="http://www.w3.org/2000/svg" version="1.1">
  <line x1="40" x2="120" y1="20" y2="20" stroke="black" stroke-width="20" stroke-linecap="butt"/>
  <line x1="40" x2="120" y1="60" y2="60" stroke="black" stroke-width="20" stroke-linecap="square"/>
  <line x1="40" x2="120" y1="100" y2="100" stroke="black" stroke-width="20" stroke-linecap="round"/>
</svg>
```

`stroke-width` 屬性定義了此描邊的寬度。描邊是圍繞路徑置中繪製的。在上面的範例中，路徑以粉紅色顯示，描邊以黑色顯示。

第二個影響描邊的屬性是 `stroke-linecap` 屬性，如上所示。它控制線條端點的形狀。

`stroke-linecap` 有三個可能的值：

- `butt` 用一條與描邊方向垂直（成 90 度）並穿過其端點的直線來封閉線條。
- `square` 的外觀基本相同，但會將描邊稍微延伸到實際路徑之外。描邊超出路徑的距離是 `stroke-width` 的一半。
- `round` 在描邊的末端產生圓角效果。這個曲線的半徑也由 `stroke-width` 控制。

使用 `stroke-linejoin` 來控制兩個線段之間的接合處如何繪製。

![stroke-linejoin 屬性改變了兩條線條交會點的外觀，miter 建立了一個有角度的接合，round 將角落變圓，而 bevel 則建立了一個斜角邊緣，使角落變平。](svg_stroke_linejoin_example.png)

```xml
<?xml version="1.0" standalone="no"?>
<svg width="160" height="280" xmlns="http://www.w3.org/2000/svg" version="1.1">
  <polyline points="40 60 80 20 120 60" stroke="black" stroke-width="20"
      stroke-linecap="butt" fill="none" stroke-linejoin="miter"/>

  <polyline points="40 140 80 100 120 140" stroke="black" stroke-width="20"
      stroke-linecap="round" fill="none" stroke-linejoin="round"/>

  <polyline points="40 220 80 180 120 220" stroke="black" stroke-width="20"
      stroke-linecap="square" fill="none" stroke-linejoin="bevel"/>
</svg>
```

這些折線中的每一條都有兩個線段。兩者相交的接合處由 `stroke-linejoin` 屬性控制。此屬性有三個可能的值。`miter` 將線條稍微延伸到其正常寬度之外，以建立一個只使用一個角度的方角。`round` 建立一個圓角的線段。`bevel` 建立一個新的角度以幫助兩個線段之間的過渡。

最後，你還可以透過指定 `stroke-dasharray` 屬性在描邊上使用虛線類型。

![兩條自訂的虛線，一條是等距的虛線，另一條是使用 stroke-dasharray 屬性值設定的長短虛線。](svg_stroke_dasharray_example.png)

```xml
<?xml version="1.0" standalone="no"?>
<svg width="200" height="150" xmlns="http://www.w3.org/2000/svg" version="1.1">
  <path d="M 10 75 Q 50 10 100 75 T 190 75" stroke="black"
    stroke-linecap="round" stroke-dasharray="5,10,5" fill="none"/>
  <path d="M 10 75 L 190 75" stroke="red"
    stroke-linecap="round" stroke-width="1" stroke-dasharray="5,5" fill="none"/>
</svg>
```

`stroke-dasharray` 屬性可以接受一系列以逗號和／或空白分隔的數字作為其參數。

第一個數字指定填滿區域的距離，第二個數字指定未填滿區域的距離。因此，在上面的範例中，第二個路徑填滿 5 個像素單位，然後是 5 個空白單位，直到下一個 5 個單位的虛線。如果你想要更複雜的虛線圖案，可以指定更多數字。第一個範例指定了三個數字，在這種情況下，算繪器會將數字循環兩次以建立一個均勻的圖案。因此，第一個路徑算繪 5 個填滿、10 個空白、5 個填滿，然後循環回來建立 5 個空白、10 個填滿、5 個空白。然後圖案重複。

還有其他可用的 `stroke` 和 `fill` 屬性，包括 `fill-rule`，它指定如何為自我重疊的形狀上色；[`stroke-miterlimit`](/zh-TW/docs/Web/SVG/Reference/Attribute/stroke-miterlimit)，它決定描邊是否應該繪製斜接；以及 [stroke-dashoffset](/zh-TW/docs/Web/SVG/Reference/Attribute/stroke-dashoffset)，它指定在線條上從何處開始虛線陣列。

### 繪製順序

填色和描邊的繪製順序可以使用 [`paint-order`](/zh-TW/docs/Web/SVG/Reference/Attribute/paint-order) 屬性來控制。

```html
<?xml version="1.0" standalone="no"?>
<svg width="400" height="180" xmlns="http://www.w3.org/2000/svg" version="1.1">
  <polyline
    points="40 80 80 40 120 80"
    stroke-width="15"
    stroke="black"
    fill="coral"
    paint-order="fill" />

  <polyline
    points="40 140 80 100 120 140"
    stroke-width="15"
    stroke="black"
    fill="coral"
    paint-order="stroke" />
</svg>
```

{{EmbedLiveSample("繪製順序", "100%", 180)}}

在第一個形狀的情況下，填色在描邊之前被算繪，所以黑色的描邊出現在填色之上。在第二個形狀的情況下，描邊在填色之前被算繪。

## 使用 CSS

除了在物件上設定屬性外，你還可以使用 CSS 來為填色和描邊設定樣式。並非所有屬性都可以透過 CSS 設定。與著色和填色相關的屬性通常是可用的，因此 `fill`、`stroke`、`stroke-dasharray` 等都可以用這種方式設定，此外還有下面顯示的漸層和圖案版本。像 `width`、`height` 或 {{SVGElement("path")}} 命令這樣的屬性不能透過 CSS 設定。最簡單的方法就是測試一下，找出哪些可用，哪些不可用。

> [!NOTE]
> [SVG 規範](https://svgwg.org/svg2-draft/propidx.html)嚴格區分了作為*特性*（properties）的屬性（attributes）與其他屬性。前者可以用 CSS 修改，後者則不行。

CSS 可以透過 `style` 屬性以行內方式插入到元素中：

```xml
 <rect x="10" height="180" y="10" width="180" style="stroke: black; fill: red;"/>
```

或者，它可以被移動到你包含的一個特殊的樣式區塊中。不過，它不是像在 HTML 中那樣將這樣的區塊塞進 `<head>` 區塊，而是包含在一個名為 {{SVGElement("defs")}} 的區域中。

{{SVGElement("defs")}} 代表定義（definitions），在這裡你可以建立不會直接出現在 SVG 中，但會被其他元素使用的元素。

```xml
<?xml version="1.0" standalone="no"?>
<svg width="200" height="200" xmlns="http://www.w3.org/2000/svg" version="1.1">
  <defs>
    <style><![CDATA[
       #MyRect {
         stroke: black;
         fill: red;
         paint-order: stroke;
       }
    ]]></style>
  </defs>
  <rect x="10" height="180" y="10" width="180" id="MyRect"/>
</svg>
```

將樣式移動到像這樣的區域可以更容易地調整大量元素的屬性。你還可以使用像是 **`:hover` 偽類別**來建立滑鼠懸停效果：

```css
#MyRect:hover {
  stroke: black;
  fill: blue;
}
```

你也可以透過[標準的 XML 樣式表語法](https://www.w3.org/TR/xml-stylesheet/)為你的 CSS 規則指定一個外部樣式表：

```xml
<?xml version="1.0" standalone="no"?>
<?xml-stylesheet type="text/css" href="style.css"?>

<svg width="200" height="150" xmlns="http://www.w3.org/2000/svg" version="1.1">
  <rect height="10" width="10" id="MyRect"/>
</svg>
```

其中 `style.css` 的內容大致如下：

```css
#MyRect {
  fill: red;
  stroke: black;
}
```

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Paths", "Web/SVG/Tutorials/SVG_from_scratch/Gradients") }}
