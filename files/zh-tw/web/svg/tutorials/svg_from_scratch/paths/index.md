---
title: 路徑
slug: Web/SVG/Tutorials/SVG_from_scratch/Paths
l10n:
  sourceCommit: de39ed75ea3d8b4c65e1610131f6257b89045ce9
---

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Basic_shapes", "Web/SVG/Tutorials/SVG_from_scratch/Fills_and_strokes") }}

{{SVGElement('path')}} 元素是 SVG [基本形狀](/zh-TW/docs/Web/SVG/Tutorials/SVG_from_scratch/Basic_shapes)函式庫中最強大的元素。它可以用來建立線條、曲線、弧形等等。

路徑透過組合多條直線或曲線來建立複雜的形狀。只由直線組成的複雜形狀可以建立為 [`<polyline>`](/zh-TW/docs/Web/SVG/Tutorials/SVG_from_scratch/Basic_shapes#polyline) 元素。雖然 `<polyline>` 和 `<path>` 元素可以建立外觀相似的形狀，但 `<polyline>` 元素需要許多小直線來模擬曲線，且在放大時效果不佳。

在繪製 SVG 時，充分理解路徑是很重要的。雖然不建議使用 XML 編輯器或文字編輯器來建立複雜的路徑，但了解其運作原理將有助於識別和修復 SVG 中的顯示問題。

`<path>` 元素的形狀由一個參數定義：{{ SVGAttr("d") }}。（更多資訊請參見[基本形狀](/zh-TW/docs/Web/SVG/Tutorials/SVG_from_scratch/Basic_shapes)）。`d` 屬性包含一系列指令以及這些指令所使用的參數。

每個指令都由一個特定的字母實例化（例如，建立一個類別、命名並定位它）。舉例來說，我們要移動到 x 和 y 座標（`10`, `10`）。「Move to」指令用字母 `M` 呼叫。當解析器遇到這個字母時，它就知道需要移動到一個點。所以，要移動到（`10`, `10`），使用的指令會是 `M 10 10`。之後，解析器會開始讀取下一個指令。

所有指令也都有兩種變體。**大寫字母**指定頁面上的絕對座標，而**小寫字母**指定相對座標（例如，從上一個點*向上移動 10px 並向左移動 7px*）。

`d` 參數中的座標**永遠沒有單位**，因此是在使用者座標系統中。稍後，我們將學習如何轉換路徑以滿足其他需求。

## 線條指令

{{SVGElement("path")}} 節點有五個線條指令。第一個指令是「Move To」或 `M`，前面已經描述過。它需要兩個參數，一個要移動到的 `x` 座標和 `y` 座標。如果游標已經在頁面上的某個位置，不會繪製線條來連接這兩個位置。「Move To」指令出現在路徑的開頭，用來指定繪圖的起點。例如：

```plain
M x y
（或）
m dx dy
```

在下面的範例中，只有一個在（`10`, `10`）的點。不過請注意，如果只是正常繪製路徑，這個點是不會顯示出來的。例如：

```html live-sample___move-to
<svg width="100" height="100" xmlns="http://www.w3.org/2000/svg">
  <path d="M10 10" />
</svg>
```

```html hidden live-sample___move-to
<svg style="display:none" xmlns="http://www.w3.org/2000/svg">
  <g id="reference">
    <circle cx="10" cy="10" r="3" fill="red" />
  </g>
</svg>
<button>顯示／隱藏參考點和線條</button>
```

```js hidden live-sample___move-to
const g = document.querySelector("#reference");
const svg = document.querySelector("svg");
const button = document.querySelector("button");
let isHidden = true;
button.addEventListener("click", () => {
  isHidden = !isHidden;
  if (isHidden) {
    svg.querySelector("#reference").remove();
  } else {
    svg.appendChild(g.cloneNode(true));
  }
});
```

{{ EmbedLiveSample('move-to', 100, 130) }}

有三個指令可以繪製線條。最通用的是「Line To」指令，用 `L` 呼叫。`L` 需要兩個參數——x 和 y 座標——並從目前位置繪製一條線到新位置。

```plain
L x y
（或）
l dx dy
```

有兩種繪製水平和垂直線的縮寫形式。`H` 繪製水平線，`V` 繪製垂直線。這兩個指令都只需要一個參數，因為它們只在一個方向上移動。

```plain
H x
（或）
h dx

V y
（或）
v dy
```

一個簡單的起點是繪製一個形狀。我們將從一個矩形開始（這種矩形用 {{SVGElement("rect")}} 元素可以更容易地製作）。它只由水平和垂直線條組成。

```html live-sample___rectangle-lines
<svg width="100" height="100" xmlns="http://www.w3.org/2000/svg">
  <path d="M 10 10 H 90 V 90 H 10 L 10 10" />
</svg>
```

```html hidden live-sample___rectangle-lines
<svg style="display:none" xmlns="http://www.w3.org/2000/svg">
  <g id="reference">
    <circle cx="10" cy="10" r="3" fill="red" />
    <circle cx="90" cy="90" r="3" fill="red" />
    <circle cx="90" cy="10" r="3" fill="red" />
    <circle cx="10" cy="90" r="3" fill="red" />
  </g>
</svg>
<button>顯示／隱藏參考點和線條</button>
```

```js hidden live-sample___rectangle-lines
const g = document.querySelector("#reference");
const svg = document.querySelector("svg");
const button = document.querySelector("button");
let isHidden = true;
button.addEventListener("click", () => {
  isHidden = !isHidden;
  if (isHidden) {
    svg.querySelector("#reference").remove();
  } else {
    svg.appendChild(g.cloneNode(true));
  }
});
```

{{ EmbedLiveSample('rectangle-lines', 100, 130) }}

我們可以使用「Close Path」指令（用 `Z` 呼叫）來稍微縮短上面的路徑宣告。這個指令會從目前位置畫一條直線回到路徑的第一個點。它通常放在路徑節點的末尾，但並非總是如此。大寫和小寫指令之間沒有區別。

```plain
Z
（或）
z
```

所以我們上面的路徑可以縮短為：

```xml
<path d="M 10 10 H 90 V 90 H 10 Z" fill="transparent" stroke="black" />
```

這些指令的相對形式也可以用來繪製相同的圖形。相對指令是使用小寫字母呼叫的，它們不是將游標移動到一個確切的座標，而是相對於其最後位置移動。例如，由於我們的矩形是 80×80，`<path>` 元素可以寫成：

```xml
<path d="M 10 10 h 80 v 80 h -80 Z" fill="transparent" stroke="black" />
```

路徑將移動到點（`10`, `10`），然後水平向右移動 80 點，然後向下 80 點，然後向左 80 點，最後回到起點。

在這些範例中，使用 {{SVGElement("polygon")}} 或 {{SVGElement("polyline")}} 元素可能會更直觀。然而，在繪製 SVG 時，路徑的使用非常頻繁，開發者可能會更習慣使用它們。使用其中一種並沒有真正的效能懲罰或獎勵。

## 曲線指令

有三個不同的指令可以用來建立平滑的曲線。其中兩個是[貝茲曲線](/zh-TW/docs/Glossary/Bezier_curve)，第三個是「弧形」或圓的一部分。你可能已經在 Inkscape、Illustrator 或 Photoshop 中使用路徑工具獲得了貝茲曲線的實踐經驗。貝茲曲線有無數種，但在 `<path>` 元素中只有兩種可用：三次曲線（用 `C` 呼叫）和二次曲線（用 `Q` 呼叫）。

### 貝茲曲線

三次曲線 `C` 是稍微複雜一點的曲線。三次貝茲曲線為每個點取兩個控制點。因此，要建立一個三次貝茲曲線，需要指定三組座標。

```plain
C x1 y1, x2 y2, x y
（或）
c dx1 dy1, dx2 dy2, dx dy
```

這裡的最後一組座標（`x`, `y`）指定線條的終點。另外兩組是控制點。（`x1`, `y1`）是曲線起點的控制點，而（`x2`, `y2`）是終點的控制點。控制點基本上描述了從每個點開始的線條斜率。然後，貝茲函數會建立一條平滑的曲線，從線條開頭建立的斜率過渡到另一端的斜率。

```html live-sample___cubic_bezier_curves
<svg width="190" height="160" xmlns="http://www.w3.org/2000/svg">
  <path d="M 10 10 C 20 20, 40 20, 50 10" stroke="black" fill="transparent" />
  <path d="M 70 10 C 70 20, 110 20, 110 10" stroke="black" fill="transparent" />
  <path
    d="M 130 10 C 120 20, 180 20, 170 10"
    stroke="black"
    fill="transparent" />
  <path d="M 10 60 C 20 80, 40 80, 50 60" stroke="black" fill="transparent" />
  <path d="M 70 60 C 70 80, 110 80, 110 60" stroke="black" fill="transparent" />
  <path
    d="M 130 60 C 120 80, 180 80, 170 60"
    stroke="black"
    fill="transparent" />
  <path
    d="M 10 110 C 20 140, 40 140, 50 110"
    stroke="black"
    fill="transparent" />
  <path
    d="M 70 110 C 70 140, 110 140, 110 110"
    stroke="black"
    fill="transparent" />
  <path
    d="M 130 110 C 120 140, 180 140, 170 110"
    stroke="black"
    fill="transparent" />
</svg>
```

```html hidden live-sample___cubic_bezier_curves
<svg style="display:none" xmlns="http://www.w3.org/2000/svg">
  <g id="reference"></g>
</svg>
<button>顯示／隱藏參考點和線條</button>
```

```js hidden live-sample___cubic_bezier_curves
const g = document.querySelector("#reference");
const svg = document.querySelector("svg");
const button = document.querySelector("button");

// prettier-ignore
const points = [
  [[10, 10], [20, 20], [40, 20], [50, 10]],
  [[70, 10], [70, 20], [110, 20], [110, 10]],
  [[130, 10], [120, 20], [180, 20], [170, 10]],
  [[10, 60], [20, 80], [40, 80], [50, 60]],
  [[70, 60], [70, 80], [110, 80], [110, 60]],
  [[130, 60], [120, 80], [180, 80], [170, 60]],
  [[10, 110], [20, 140], [40, 140], [50, 110]],
  [[70, 110], [70, 140], [110, 140], [110, 110]],
  [[130, 110], [120, 140], [180, 140], [170, 110]],
];

for (const curvePoints of points) {
  for (const p of curvePoints) {
    const circle = document.createElementNS(
      "http://www.w3.org/2000/svg",
      "circle",
    );
    circle.setAttribute("cx", p[0]);
    circle.setAttribute("cy", p[1]);
    circle.setAttribute("r", 1.5);
    circle.setAttribute("fill", "red");
    g.appendChild(circle);
  }
  const line1 = document.createElementNS("http://www.w3.org/2000/svg", "line");
  line1.setAttribute("x1", curvePoints[0][0]);
  line1.setAttribute("y1", curvePoints[0][1]);
  line1.setAttribute("x2", curvePoints[1][0]);
  line1.setAttribute("y2", curvePoints[1][1]);
  line1.setAttribute("stroke", "red");
  g.appendChild(line1);
  const line2 = document.createElementNS("http://www.w3.org/2000/svg", "line");
  line2.setAttribute("x1", curvePoints[2][0]);
  line2.setAttribute("y1", curvePoints[2][1]);
  line2.setAttribute("x2", curvePoints[3][0]);
  line2.setAttribute("y2", curvePoints[3][1]);
  line2.setAttribute("stroke", "red");
  g.appendChild(line2);
}

let isHidden = true;
button.addEventListener("click", () => {
  isHidden = !isHidden;
  if (isHidden) {
    svg.querySelector("#reference").remove();
  } else {
    svg.appendChild(g.cloneNode(true));
  }
});
```

{{ EmbedLiveSample('cubic_bezier_curves', 190, 190) }}

上面的範例建立了九條三次貝茲曲線。當曲線向右移動時，控制點在水平方向上變得分散。當曲線向下移動時，它們與端點的距離變得更遠。這裡要注意的是，曲線從第一個控制點的方向開始，然後彎曲，以便沿著第二個控制點的方向到達。

可以將多條貝茲曲線串連起來，以建立延伸的平滑形狀。通常，一個點一側的控制點會是另一側使用的控制點的鏡像，以保持斜率恆定。在這種情況下，可以使用三次貝茲曲線的簡寫版本，由指令 `S`（或 `s`）指定。

```plain
S x2 y2, x y
（或）
s dx2 dy2, dx dy
```

`S` 產生的曲線類型與前面相同——但如果它跟在另一個 `S` 指令或 `C` 指令之後，第一個控制點會被假定為前一個使用過的控制點的鏡像。如果 `S` 指令沒有跟在另一個 `S` 或 `C` 指令之後，則游標的目前位置將被用作第一個控制點。結果與使用相同參數的 `Q` 指令產生的結果不同，但很相似。

下面顯示了這個語法的一個範例，在左側的圖中，指定的控制點以紅色顯示，推斷出的控制點以藍色顯示。

```html live-sample___shortcut_cubic_bezier
<svg width="190" height="160" xmlns="http://www.w3.org/2000/svg">
  <path
    d="M 10 80 C 40 10, 65 10, 95 80 S 150 150, 180 80"
    stroke="black"
    fill="transparent" />
</svg>
```

```html hidden live-sample___shortcut_cubic_bezier
<svg style="display:none" xmlns="http://www.w3.org/2000/svg">
  <g id="reference">
    <line x1="10" y1="80" x2="40" y2="10" stroke="red" />
    <line x1="65" y1="10" x2="95" y2="80" stroke="red" />
    <line x1="95" y1="80" x2="125" y2="150" stroke="blue" />
    <line x1="150" y1="150" x2="180" y2="80" stroke="red" />
    <circle cx="10" cy="80" r="3" fill="red" />
    <circle cx="40" cy="10" r="3" fill="red" />
    <circle cx="65" cy="10" r="3" fill="red" />
    <circle cx="95" cy="80" r="3" fill="red" />
    <circle cx="125" cy="150" r="3" fill="blue" />
    <circle cx="150" cy="150" r="3" fill="red" />
    <circle cx="180" cy="80" r="3" fill="red" />
  </g>
</svg>
<button>顯示／隱藏參考點和線條</button>
```

```js hidden live-sample___shortcut_cubic_bezier
const g = document.querySelector("#reference");
const svg = document.querySelector("svg");
const button = document.querySelector("button");
let isHidden = true;
button.addEventListener("click", () => {
  isHidden = !isHidden;
  if (isHidden) {
    svg.querySelector("#reference").remove();
  } else {
    svg.appendChild(g.cloneNode(true));
  }
});
```

{{ EmbedLiveSample('shortcut_cubic_bezier', 190, 190) }}

另一種貝茲曲線，即用 `Q` 呼叫的二次曲線，實際上比三次曲線更簡單。它需要一個控制點，該控制點決定了曲線在起點和終點的斜率。它需要兩個參數：控制點和曲線的終點。

> [!NOTE]
> `q` 的座標增量都是相對於前一個點（也就是說，`dx` 和 `dy` 不是相對於 `dx1` 和 `dy1`）。

```plain
Q x1 y1, x y
（或）
q dx1 dy1, dx dy
```

```html live-sample___quadratic_bezier
<svg width="190" height="160" xmlns="http://www.w3.org/2000/svg">
  <path d="M 10 80 Q 95 10 180 80" stroke="black" fill="transparent" />
</svg>
```

```html hidden live-sample___quadratic_bezier
<svg style="display:none" xmlns="http://www.w3.org/2000/svg">
  <g id="reference">
    <line x1="10" y1="80" x2="95" y2="10" stroke="red" />
    <line x1="95" y1="10" x2="180" y2="80" stroke="red" />
    <circle cx="10" cy="80" r="3" fill="red" />
    <circle cx="180" cy="80" r="3" fill="red" />
    <circle cx="95" cy="10" r="3" fill="red" />
  </g>
</svg>
<button>顯示／隱藏參考點和線條</button>
```

```js hidden live-sample___quadratic_bezier
const g = document.querySelector("#reference");
const svg = document.querySelector("svg");
const button = document.querySelector("button");
let isHidden = true;
button.addEventListener("click", () => {
  isHidden = !isHidden;
  if (isHidden) {
    svg.querySelector("#reference").remove();
  } else {
    svg.appendChild(g.cloneNode(true));
  }
});
```

{{ EmbedLiveSample('quadratic_bezier', 190, 190) }}

與三次貝茲曲線一樣，也有一個用於串連多個二次貝茲曲線的簡寫，用 `T` 呼叫。

```plain
T x y
（或）
t dx dy
```

這個簡寫會查看前一個使用的控制點，並從中推斷出一個新的控制點。這意味著在第一個控制點之後，只需指定終點就可以製作出相當複雜的形狀。

這只在前面的指令是 `Q` 或 `T` 指令時才有效。如果不是，則控制點會被假定為與前一個點相同，並且只會繪製直線。

```html live-sample___shortcut_quadratic_bezier
<svg width="190" height="160" xmlns="http://www.w3.org/2000/svg">
  <path
    d="M 10 80 Q 52.5 10, 95 80 T 180 80"
    stroke="black"
    fill="transparent" />
</svg>
```

```html hidden live-sample___shortcut_quadratic_bezier
<svg style="display:none" xmlns="http://www.w3.org/2000/svg">
  <g id="reference">
    <line x1="10" y1="80" x2="52.5" y2="10" stroke="red" />
    <line x1="52.5" y1="10" x2="95" y2="80" stroke="red" />
    <line x1="95" y1="80" x2="137.5" y2="150" stroke="blue" />
    <line x1="137.5" y1="150" x2="180" y2="80" stroke="blue" />
    <circle cx="10" cy="80" r="3" fill="red" />
    <circle cx="52.5" cy="10" r="3" fill="red" />
    <circle cx="95" cy="80" r="3" fill="red" />
    <circle cx="137.5" cy="150" r="3" fill="blue" />
    <circle cx="180" cy="80" r="3" fill="blue" />
  </g>
</svg>
<button>顯示／隱藏參考點和線條</button>
```

```js hidden live-sample___shortcut_quadratic_bezier
const g = document.querySelector("#reference");
const svg = document.querySelector("svg");
const button = document.querySelector("button");
let isHidden = true;
button.addEventListener("click", () => {
  isHidden = !isHidden;
  if (isHidden) {
    svg.querySelector("#reference").remove();
  } else {
    svg.appendChild(g.cloneNode(true));
  }
});
```

{{ EmbedLiveSample('shortcut_quadratic_bezier', 190, 190) }}

兩種曲線產生的結果相似，儘管三次曲線在曲線外觀的精確度上提供了更大的自由度。決定使用哪種曲線取決於具體情況以及線條的對稱程度。

### 弧形

另一種可以使用 SVG 建立的曲線是弧形，用 `A` 指令呼叫。弧形是圓形或橢圓形的一部分。

對於給定的 x 半徑和 y 半徑，有兩個橢圓可以連接任意兩點（只要這兩點在圓的半徑範圍內）。沿著這兩個圓中的任何一個，都有兩條可能的路徑可以連接這兩點——因此在任何情況下，都有四種可能的弧形可用。

因此，弧形需要相當多的參數：

```plain
A rx ry x-axis-rotation large-arc-flag sweep-flag x y
a rx ry x-axis-rotation large-arc-flag sweep-flag dx dy
```

一開始，弧形元素需要兩個參數，分別是 x 半徑和 y 半徑。如果需要，可以參見 {{SVGElement("ellipse")}} 及其行為。最後兩個參數指定了筆劃結束的 x 和 y 座標。這四個值共同定義了弧形的基本結構。

第三個參數描述了弧形的旋轉。這最好用一個範例來解釋：

```html live-sample___arcs_axis_rotation
<svg width="320" height="320" xmlns="http://www.w3.org/2000/svg">
  <path
    d="M 10 315
       L 110 215
       A 30 50 0 0 1 162.55 162.45
       L 172.55 152.45
       A 30 50 -45 0 1 215.1 109.9
       L 315 10"
    stroke="black"
    fill="green"
    stroke-width="2"
    fill-opacity="0.5" />
</svg>
```

```html hidden live-sample___arcs_axis_rotation
<svg style="display:none" xmlns="http://www.w3.org/2000/svg">
  <g id="reference">
    <ellipse
      cx="136.225"
      cy="188.275"
      rx="30"
      ry="50"
      stroke="red"
      fill="none" />
    <ellipse
      cx="193.5"
      cy="131.5"
      rx="30"
      ry="50"
      stroke="red"
      fill="none"
      transform="rotate(-45)"
      transform-origin="193.5 131.5" />
  </g>
</svg>
<button>顯示／隱藏參考點和線條</button>
```

```js hidden live-sample___arcs_axis_rotation
const g = document.querySelector("#reference");
const svg = document.querySelector("svg");
const button = document.querySelector("button");
let isHidden = true;
button.addEventListener("click", () => {
  isHidden = !isHidden;
  if (isHidden) {
    svg.querySelector("#reference").remove();
  } else {
    svg.appendChild(g.cloneNode(true));
  }
});
```

{{ EmbedLiveSample('arcs_axis_rotation', 320, 350) }}

該範例顯示了一個對角線穿過頁面的 `<path>` 元素。在其中心，切出了兩個橢圓弧（x 半徑 = `30`，y 半徑 = `50`）。在第一個弧中，x 軸旋轉保持為 `0`，因此弧形所環繞的橢圓（以灰色顯示）是垂直方向的。然而，對於第二個弧，x 軸旋轉設定為 `-45` 度。這會旋轉橢圓，使其短軸與路徑方向對齊，如範例圖像中的第二個橢圓所示。

對於上圖中未旋轉的橢圓，只有兩種不同的弧形可供選擇，而不是四種，因為從弧的起點和終點繪製的線穿過了橢圓的中心。在一個稍微修改過的範例中，可以看到形成四種不同弧形的兩個橢圓：

```html live-sample___arcs_axis_rotation_2
<svg xmlns="http://www.w3.org/2000/svg" width="320" height="320">
  <path
    d="M 10 315
       L 110 215
       A 36 60 0 0 1 150.71 170.29
       L 172.55 152.45
       A 30 50 -45 0 1 215.1 109.9
       L 315 10"
    stroke="black"
    fill="green"
    stroke-width="2"
    fill-opacity="0.5" />
</svg>
```

```html hidden live-sample___arcs_axis_rotation_2
<svg style="display:none" xmlns="http://www.w3.org/2000/svg">
  <g id="reference">
    <circle cx="150.71" cy="170.29" r="3" fill="red" />
    <circle cx="110" cy="215" r="3" fill="red" />
    <ellipse
      cx="144.931"
      cy="229.512"
      rx="36"
      ry="60"
      fill="transparent"
      stroke="red" />
    <ellipse
      cx="115.779"
      cy="155.778"
      rx="36"
      ry="60"
      fill="transparent"
      stroke="red" />
  </g>
</svg>
<button>顯示／隱藏參考點和線條</button>
```

```js hidden live-sample___arcs_axis_rotation_2
const g = document.querySelector("#reference");
const svg = document.querySelector("svg");
const button = document.querySelector("button");
let isHidden = true;
button.addEventListener("click", () => {
  isHidden = !isHidden;
  if (isHidden) {
    svg.querySelector("#reference").remove();
  } else {
    svg.appendChild(g.cloneNode(true));
  }
});
```

{{ EmbedLiveSample('arcs_axis_rotation_2', 320, 350) }}

請注意，每個藍色橢圓都由兩個弧形組成，取決於是順時針還是逆時針行進。每個橢圓都有一個短弧和一個長弧。這兩個橢圓只是彼此的鏡像。它們沿著從起點→終點形成的線翻轉。

如果起點→終點的距離超出了橢圓的 `x` 和 `y` 半徑所能及的範圍，橢圓的半徑將被最小程度地擴大，以便能夠到達起點→終點。本頁底部的互動式 codepen 很好地展示了這一點。要確定橢圓的半徑是否足夠大以至於需要擴大，需要求解一個方程組，例如[在 wolfram alpha 上的這個](https://www.wolframalpha.com/input/?i=solve+((110+-+x)%5E2%2F36%5E2)+%2B+((215+-+y)%5E2%2F60%5E2)+%3D+1,+((150.71+-+x)%5E2%2F36%5E2)+%2B+((170.29+-+y)%5E2%2F60%5E2)+%3D+1)。這個計算是針對未旋轉的橢圓，其起點→終點為 (`110`, `215`)→(`150.71`, `170.29`)。解 (`x`, `y`) 是橢圓的中心。如果橢圓的半徑太小，解將是[虛數](https://www.wolframalpha.com/input/?i=solve+((110+-+x)%5E2%2F30%5E2)+%2B+((215+-+y)%5E2%2F50%5E2)+%3D+1,+((162.55+-+x)%5E2%2F30%5E2)+%2B+((162.45+-+y)%5E2%2F50%5E2)+%3D+1)。第二次計算是針對未旋轉的橢圓，其起點→終點為 (`110`, `215`)→(`162.55`, `162.45`)。解有一個很小的虛數部分，因為橢圓只是被勉強擴大了一點。

上面提到的四種不同路徑由接下來的兩個參數旗標決定。如前所述，路徑仍然有兩個可能的橢圓可以環繞，並且在兩個橢圓上都有兩種不同的可能路徑，從而產生四種可能的路徑。第一個參數是 `large-arc-flag`。它決定了弧形應該大於還是小於 180 度；最終，這個旗標決定了弧形將圍繞給定圓形以哪個方向行進。第二個參數是 `sweep-flag`。它決定了弧形應該以正角度還是負角度開始移動，這基本上選擇了將要環繞的兩個圓形中的哪一個。下面的範例顯示了所有四種可能的組合，以及每種情況下的兩個圓形。

```html live-sample___arcs_flags
<svg width="360" height="360" xmlns="http://www.w3.org/2000/svg">
  <path
    d="M 100 100
       A 45 45, 0, 0, 0, 145 145
       L 145 100 Z"
    fill="#00FF00A0"
    stroke="black"
    stroke-width="2" />
  <path
    d="M 250 100
       A 45 45, 0, 1, 0, 295 145
       L 295 100 Z"
    fill="#FF0000A0"
    stroke="black"
    stroke-width="2" />
  <path
    d="M 100 250
       A 45 45, 0, 0, 1, 145 295
       L 145 250 Z"
    fill="#FF00FFA0"
    stroke="black"
    stroke-width="2" />
  <path
    d="M 250 250
       A 45 45, 0, 1, 1, 295 295
       L 295 250 Z"
    fill="#0000FFA0"
    stroke="black"
    stroke-width="2" />
  <path
    d="M 45 45 L 345 45 L 345 345 L 45 345 Z M 195 45 L 195 345 M 45 195 L 345 195"
    fill="none"
    stroke="black" />
  <text x="140" y="20" font-size="20" fill="black">大弧旗標</text>
  <text
    x="-15"
    y="195"
    font-size="20"
    fill="black"
    transform="rotate(-90)"
    transform-origin="20 195">
    掃描旗標
  </text>
  <text x="120" y="40" font-size="20" fill="black">0</text>
  <text x="270" y="40" font-size="20" fill="black">1</text>
  <text x="30" y="120" font-size="20" fill="black">0</text>
  <text x="30" y="270" font-size="20" fill="black">1</text>
</svg>
```

```html hidden live-sample___arcs_flags
<svg style="display:none" xmlns="http://www.w3.org/2000/svg">
  <g id="reference">
    <circle cx="145" cy="100" r="45" stroke="#888888E0" fill="none" />
    <circle cx="100" cy="145" r="45" stroke="#888888E0" fill="none" />
    <circle cx="295" cy="100" r="45" stroke="#888888E0" fill="none" />
    <circle cx="250" cy="145" r="45" stroke="#888888E0" fill="none" />
    <circle cx="145" cy="250" r="45" stroke="#888888E0" fill="none" />
    <circle cx="100" cy="295" r="45" stroke="#888888E0" fill="none" />
    <circle cx="295" cy="250" r="45" stroke="#888888E0" fill="none" />
    <circle cx="250" cy="295" r="45" stroke="#888888E0" fill="none" />
  </g>
</svg>
<button>顯示／隱藏參考點和線條</button>
```

```js hidden live-sample___arcs_flags
const g = document.querySelector("#reference");
const svg = document.querySelector("svg");
const button = document.querySelector("button");
let isHidden = true;
button.addEventListener("click", () => {
  isHidden = !isHidden;
  if (isHidden) {
    svg.querySelector("#reference").remove();
  } else {
    svg.appendChild(g.cloneNode(true));
  }
});
```

{{ EmbedLiveSample('arcs_flags', 360, 390) }}

弧形是在繪圖中建立圓形或橢圓形片段的簡單方法。例如，一個圓餅圖的每個部分都需要一個不同的弧形。

如果從 {{HTMLElement("canvas")}} 過渡到 SVG，弧形可能是最難學習的部分，但也更為強大。完整的圓形和橢圓形是 SVG 弧形難以繪製的唯一形狀。因為任何環繞圓形的路徑的起點和終點都是同一個點，所以有無數個圓形可供選擇，而實際路徑是未定義的。可以透過使路徑的起點和終點稍微錯開，然後用另一段路徑段連接它們來近似繪製。例如，可以用每個半圓的弧形來製作一個圓。在這種情況下，通常更容易使用真正的 {{SVGElement("circle")}} 或 {{SVGElement("ellipse")}} 節點。這個互動式示範可能有助於理解 SVG 弧形背後的概念。

```html hidden live-sample___arcs_interactive
<script src="https://cdn.rawgit.com/lingtalfi/simpledrag/master/simpledrag.js"></script>
<div class="ui">
  <div class="controls">
    X 半徑： <input id="rx" type="range" min="0" max="500" /><br />
    Y 半徑： <input id="ry" type="range" min="0" max="500" /><br />
    旋轉：
    <input id="rot" type="range" min="0" max="360" value="0" /><br />
    大弧旗標： <input id="laf" type="checkbox" /><br />
    掃描旗標： <input id="sf" type="checkbox" /><br />
    弧形指令： <span id="arc-value"></span><br />
  </div>
  <div class="results">
    滑鼠： pageX <span id="page-x"></span>, pageY <span id="page-y"></span
    ><br />
    A： <span id="ax-value"></span>, <span id="ay-value"></span><br />
    B： <span id="bx-value"></span>, <span id="by-value"></span><br />
    m： <span id="m-value"></span><br />
    b(A)： <span id="ba-value"></span><br />
    b(B)： <span id="bb-value"></span><br />
    contextWidth： <span id="cw-value"></span><br />
  </div>
</div>

<svg width="100%" height="100%" id="svg-context">
  <path id="arc2" d="" fill="none" stroke="green" stroke-width="2"></path>
  <path id="arc3" d="" fill="none" stroke="green" stroke-width="2"></path>
  <path id="arc4" d="" fill="none" stroke="green" stroke-width="2"></path>

  <path
    id="arc"
    d="M100 100 A 100 100 0 1 0 200 100"
    fill="none"
    stroke="red"
    stroke-width="4"></path>

  <line
    id="line0"
    x1="0"
    y1="0"
    x2="0"
    y2="0"
    fill="none"
    stroke="black"
    stroke-width="2"></line>
  <line
    id="line"
    x1="0"
    y1="0"
    x2="0"
    y2="0"
    fill="none"
    stroke="black"
    stroke-width="2"></line>
  <line
    id="line2"
    x1="0"
    y1="0"
    x2="0"
    y2="0"
    fill="none"
    stroke="black"
    stroke-width="2"></line>

  <circle
    id="circle1"
    cx="100"
    cy="100"
    r="5"
    fill="red"
    stroke="red"
    stroke-width="2"></circle>

  <circle
    id="circle2"
    cx="200"
    cy="100"
    r="5"
    fill="red"
    stroke="red"
    stroke-width="2"></circle>
</svg>
```

```css hidden live-sample___arcs_interactive
body {
  position: fixed;
  width: 100%;
  height: 100%;
  background: #eee;
}

.ui {
  display: flex;
}

.ui > div {
  margin: 0 10px;
}

.ui .controls input {
  vertical-align: middle;
}

#circle1,
#circle2 {
  cursor: pointer;
}

svg {
  background: #ddd;
}
```

```js hidden live-sample___arcs_interactive
const svgContext = document.getElementById("svg-context");
let rect = svgContext.getBoundingClientRect(); // helper to enclose mouse coordinates into svg box

const pageXEl = document.getElementById("page-x");
const pageYEl = document.getElementById("page-y");
const mEl = document.getElementById("m-value");
const rxEl = document.getElementById("rx");
const ryEl = document.getElementById("ry");
const rotEl = document.getElementById("rot");
const lafEl = document.getElementById("laf");
const sfEl = document.getElementById("sf");
const axEl = document.getElementById("ax-value");
const ayEl = document.getElementById("ay-value");
const bxEl = document.getElementById("bx-value");
const byEl = document.getElementById("by-value");
const baEl = document.getElementById("ba-value");
const bbEl = document.getElementById("bb-value");
const circle1 = document.getElementById("circle1");
const circle2 = document.getElementById("circle2");
const line = document.getElementById("line");
const line0 = document.getElementById("line0");
const line2 = document.getElementById("line2");
const cwEl = document.getElementById("cw-value");
const arcCmdEl = document.getElementById("arc-value");
const arcEl = document.getElementById("arc");
const arc2El = document.getElementById("arc2");
const arc3El = document.getElementById("arc3");
const arc4El = document.getElementById("arc4");

function updatePaths(pageX, pageY) {
  pageXEl.textContent = pageX;
  pageYEl.textContent = pageY;

  // line between two points
  line.setAttribute("x1", circle1.getAttribute("cx"));
  line.setAttribute("y1", circle1.getAttribute("cy"));
  line.setAttribute("x2", circle2.getAttribute("cx"));
  line.setAttribute("y2", circle2.getAttribute("cy"));

  axEl.textContent = circle1.getAttribute("cx");
  ayEl.textContent = circle1.getAttribute("cy");
  bxEl.textContent = circle2.getAttribute("cx");
  byEl.textContent = circle2.getAttribute("cy");

  // y = mx + b
  let m, b, run; // m = rise/run = (y2-y1) / (x2-x1)
  if (circle1.getAttribute("cx") <= circle2.getAttribute("cx")) {
    run = circle2.getAttribute("cx") - circle1.getAttribute("cx");
    if (run !== 0) {
      m = (circle2.getAttribute("cy") - circle1.getAttribute("cy")) / run;
    }
  } else {
    run = circle1.getAttribute("cx") - circle2.getAttribute("cx");
    if (run !== 0) {
      m = (circle1.getAttribute("cy") - circle2.getAttribute("cy")) / run;
    }
  }

  if (run !== 0) {
    // b = y - mx
    b = circle1.getAttribute("cy") - m * circle1.getAttribute("cx");
    b2 = circle2.getAttribute("cy") - m * circle2.getAttribute("cx");
    baEl.textContent = b;
    bbEl.textContent = b2;
    mEl.textContent = m;

    // draw segment from the left vertical axis (x=0) to the left most point (A or B).
    // x=0 ----> y = b
    let leftMost, rightMost;
    if (circle1.getAttribute("cx") <= circle2.getAttribute("cx")) {
      leftMost = circle1;
      rightMost = circle2;
    } else {
      leftMost = circle2;
      rightMost = circle1;
    }

    line0.setAttribute("x1", 0);
    line0.setAttribute("y1", b);
    line0.setAttribute("x2", leftMost.getAttribute("cx"));
    line0.setAttribute("y2", leftMost.getAttribute("cy"));

    // draw segment from point B to the right vertical axis (x=rect.width)
    // representing the end of the svg box.
    // y = mx + b
    const y = m * rect.width + b;
    line2.setAttribute("x1", rightMost.getAttribute("cx"));
    line2.setAttribute("y1", rightMost.getAttribute("cy"));
    line2.setAttribute("x2", rect.width);
    line2.setAttribute("y2", y);

    // now update the arc
    const arcCmd = getArcCommand(
      leftMost,
      rightMost,
      lafEl.checked,
      sfEl.checked,
    );
    arcCmdEl.textContent = arcCmd;
    arcEl.setAttribute("d", arcCmd);

    // now update the other helper arcs
    const combo = [
      [true, true],
      [true, false],
      [false, true],
      [false, false],
    ].filter(
      (item) => !(item[0] === lafEl.checked && item[1] === sfEl.checked),
    );
    arc2El.setAttribute(
      "d",
      getArcCommand(leftMost, rightMost, combo[0][0], combo[0][1]),
    );
    arc3El.setAttribute(
      "d",
      getArcCommand(leftMost, rightMost, combo[1][0], combo[1][1]),
    );
    arc4El.setAttribute(
      "d",
      getArcCommand(leftMost, rightMost, combo[2][0], combo[2][1]),
    );
  }
}

function getArcCommand(leftMost, rightMost, lafChecked, sfChecked) {
  return `M${leftMost.getAttribute("cx")} ${leftMost.getAttribute("cy")} A ${rxEl.value} ${ryEl.value} ${rotEl.value} ${lafChecked ? "1" : "0"} ${sfChecked ? "1" : "0"} ${rightMost.getAttribute("cx")} ${rightMost.getAttribute("cy")}`;
}

function updateScreen() {
  rect = svgContext.getBoundingClientRect();
  cwEl.textContent = rect.width;
}

circle1.sdrag((el, pageX, startX, pageY, startY) => {
  pageX -= rect.left;
  pageY -= rect.top;

  el.setAttribute("cx", pageX);
  el.setAttribute("cy", pageY);
  updatePaths(pageX, pageY);
});

circle2.sdrag((el, pageX, startX, pageY, startY) => {
  pageX -= rect.left;
  pageY -= rect.top;

  el.setAttribute("cx", pageX);
  el.setAttribute("cy", pageY);
  updatePaths(pageX, pageY);
});

window.addEventListener("resize", updateScreen);

// sliders
["rx", "ry", "rot"].forEach((id) => {
  document.getElementById(id).addEventListener("input", (e) => {
    updatePaths();
  });
});

// checkboxes
["laf", "sf"].forEach((id) => {
  document.getElementById(id).addEventListener("change", (e) => {
    updatePaths();
  });
});

updatePaths();
updateScreen();
```

{{EmbedLiveSample("arcs_interactive", "", 600)}}

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Basic_shapes", "Web/SVG/Tutorials/SVG_from_scratch/Fills_and_strokes") }}
