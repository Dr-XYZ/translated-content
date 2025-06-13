---
title: 基本形狀
slug: Web/SVG/Tutorials/SVG_from_scratch/Basic_shapes
l10n:
  sourceCommit: c2fd97474834e061404b992c8397d4ccc4439a71
---

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Positions", "Web/SVG/Tutorials/SVG_from_scratch/Paths") }}

有幾種基本形狀用於大多數的 SVG 繪圖。這些形狀的用途從它們的名稱就能輕易看出。這裡會提供一些決定其位置和大小的參數，但元素參考文件可能會包含更準確、更完整的描述以及此處未涵蓋的其他屬性。然而，由於它們在大多數 SVG 文件中都會使用，因此有必要對它們進行一些介紹。

要插入一個形狀，你需要在文件中建立一個元素。不同的元素對應不同的形狀，並使用不同的參數來描述這些形狀的大小和位置。有些形狀稍嫌多餘，因為它們可以由其他形狀建立，但它們的存在是為了方便你，並讓你的 SVG 文件盡可能簡短易讀。所有基本形狀如下圖所示。

![連續八個不同的形狀和圖形。左上角是一個黑色外框的正方形，其後是一個黑色圓角外框的正方形。左下方是一個紅色外框的圓形，其後是一個紅色外框的橢圓形。左下方是一條黃色的線，其後是一條黃色的鋸齒線。黃色線條下方是一個綠色外框的星星，圖像末端是一條藍色的波浪線。](shapes.png)

產生該圖像的程式碼大致如下：

```xml
<?xml version="1.0" standalone="no"?>
<svg width="200" height="250" version="1.1" xmlns="http://www.w3.org/2000/svg">

  <rect x="10" y="10" width="30" height="30" stroke="black" fill="transparent" stroke-width="5"/>
  <rect x="60" y="10" rx="10" ry="10" width="30" height="30" stroke="black" fill="transparent" stroke-width="5"/>

  <circle cx="25" cy="75" r="20" stroke="red" fill="transparent" stroke-width="5"/>
  <ellipse cx="75" cy="75" rx="20" ry="5" stroke="red" fill="transparent" stroke-width="5"/>

  <line x1="10" x2="50" y1="110" y2="150" stroke="orange" stroke-width="5"/>
  <polyline points="60 110 65 120 70 115 75 130 80 125 85 140 90 135 95 150 100 145"
      stroke="orange" fill="transparent" stroke-width="5"/>

  <polygon points="50 160 55 180 70 180 60 190 65 205 50 195 35 205 40 190 30 180 45 180"
      stroke="green" fill="transparent" stroke-width="5"/>

  <path d="M20,230 Q40,205 50,230 T90,230" fill="none" stroke="blue" stroke-width="5"/>
</svg>
```

> [!NOTE]
> `stroke`、`stroke-width` 和 `fill` 屬性將在本教學的後續部分解釋。

## 矩形

{{SVGElement("rect")}} 元素會在螢幕上繪製一個矩形。有六個基本屬性可以控制矩形在螢幕上的位置和形狀。右邊的矩形設定了 `rx` 和 `ry` 參數，使其具有圓角。如果未設定它們，則預設為 `0`。

```xml
<rect x="10" y="10" width="30" height="30"/>
<rect x="60" y="10" rx="10" ry="10" width="30" height="30"/>
```

- `x`
  - : 矩形左上角的 x 座標。
- `y`
  - : 矩形左上角的 y 座標。
- `width`
  - : 矩形的寬度。
- `height`
  - : 矩形的高度。
- `rx`
  - : 矩形圓角的 x 軸半徑。
- `ry`
  - : 矩形圓角的 y 軸半徑。

## 圓形

{{SVGElement("circle")}} 元素會在螢幕上繪製一個圓形。它需要三個基本參數來決定元素的大小和形狀。

```xml
<circle cx="25" cy="75" r="20"/>
```

- `r`
  - : 圓形的半徑。
- `cx`
  - : 圓心點的 x 座標。
- `cy`
  - : 圓心點的 y 座標。

## 橢圓形

{{SVGElement("ellipse")}} 是 {{SVGElement("circle")}} 元素更通用的形式，你可以分別縮放圓形的 x 和 y 軸半徑（在數學上通常稱為*半長軸*和*半短軸*）。

```xml
<ellipse cx="75" cy="75" rx="20" ry="5"/>
```

- `rx`
  - : 橢圓的 x 軸半徑。
- `ry`
  - : 橢圓的 y 軸半徑。
- `cx`
  - : 橢圓中心點的 x 座標。
- `cy`
  - : 橢圓中心點的 y 座標。

## 線條

{{SVGElement("line")}} 元素以兩個點的位置作為參數，並在它們之間繪製一條直線。

```xml
<line x1="10" x2="50" y1="110" y2="150" stroke="black" stroke-width="5"/>
```

- `x1`
  - : 點 1 的 x 座標。
- `y1`
  - : 點 1 的 y 座標。
- `x2`
  - : 點 2 的 x 座標。
- `y2`
  - : 點 2 的 y 座標。

## 折線

{{SVGElement("polyline")}} 是一組相連的直線。由於點的列表可能會很長，所以所有的點都包含在一個屬性中：

```xml
<polyline points="60, 110 65, 120 70, 115 75, 130 80, 125 85, 140 90, 135 95, 150 100, 145"/>
```

- `points`
  - : 一個點的列表。每個數字之間必須用空格、逗號、EOL（行尾符）或換行符分隔，也允許額外的空白字元。每個點必須包含兩個數字：一個 x 座標和一個 y 座標。所以，列表 `(0,0)`、`(1,1)` 和 `(2,2)` 可以寫成 `0, 0 1, 1 2, 2`。

## 多邊形

{{SVGElement("polygon")}} 與 {{SVGElement("polyline")}} 相似，它是由連接一系列點的直線段組成。但對於多邊形，路徑會自動將最後一個點與第一個點相連，從而建立一個封閉的形狀。

> [!NOTE]
> 矩形是一種多邊形，所以可以用多邊形來建立一個沒有圓角的 `<rect/>` 元素。

```xml
<polygon points="50, 160 55, 180 70, 180 60, 190 65, 205 50, 195 35, 205 40, 190 30, 180 45, 180"/>
```

- `points`
  - : 一個點的列表，每個數字之間用空格、逗號、EOL（行尾符）或換行符分隔，也允許額外的空白字元。每個點必須包含兩個數字：一個 x 座標和一個 y 座標。所以，列表 `(0,0)`、`(1,1)` 和 `(2,2)` 可以寫成 `0, 0 1, 1 2, 2`。然後繪圖會封閉路徑，所以會從 `(2,2)` 到 `(0,0)` 繪製最後一條直線。

## 路徑

{{SVGElement("path")}} 是 SVG 中可以使用的最通用的形狀。使用 `path` 元素，你可以繪製矩形（有或沒有圓角）、圓形、橢圓形、折線和多邊形。基本上任何其他類型的形狀、貝茲曲線、二次曲線等等都可以。

因此，本教學的[下一節](/zh-TW/docs/Web/SVG/Tutorials/SVG_from_scratch/Paths)將專注於路徑。但現在，請注意只有一個參數用於控制其形狀。

```xml
<path d="M20,230 Q40,205 50,230 T90,230" fill="none" stroke="blue" stroke-width="5"/>
```

- `d`
  - : 一個點的列表以及關於如何繪製路徑的其他訊息。請參閱[路徑](/zh-TW/docs/Web/SVG/Tutorials/SVG_from_scratch/Paths)一節以獲取更多訊息。

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Positions", "Web/SVG/Tutorials/SVG_from_scratch/Paths") }}
