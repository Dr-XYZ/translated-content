---
title: SVG 中的漸層
slug: Web/SVG/Tutorials/SVG_from_scratch/Gradients
l10n:
  sourceCommit: c2fd97474834e061404b992c8397d4ccc4439a71
---

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Fills_and_strokes", "Web/SVG/Tutorials/SVG_from_scratch/Patterns") }}

除了單純的填色與描邊，更令人興奮的是你也可以建立漸層並將其應用為填色或描邊。

SVG 漸層有兩種：線性和放射狀。它們的定義與使用之處是分開的，這有助於重複使用。你**必須**為每個漸層提供一個 `id` 屬性，以允許其他元素參照它。漸層定義可以放在 {{SVGElement('defs')}} 元素或 {{SVGElement('svg')}} 元素中。

## 線性漸層

線性漸層沿著直線變化。要插入一個線性漸層，你需要在 SVG 檔案的 `<defs>` 區塊內建立一個 {{SVGElement('linearGradient')}} 節點。

### 基本範例

```html
<svg width="120" height="240" version="1.1" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="Gradient1">
      <stop class="stop1" offset="0%" />
      <stop class="stop2" offset="50%" />
      <stop class="stop3" offset="100%" />
    </linearGradient>
    <linearGradient id="Gradient2" x1="0" x2="0" y1="0" y2="1">
      <stop offset="0%" stop-color="red" />
      <stop offset="50%" stop-color="black" stop-opacity="0" />
      <stop offset="100%" stop-color="blue" />
    </linearGradient>
  </defs>
  <style>
    #rect1 {
      fill: url(#Gradient1);
    }
    .stop1 {
      stop-color: red;
    }
    .stop2 {
      stop-color: black;
      stop-opacity: 0;
    }
    .stop3 {
      stop-color: blue;
    }
  </style>

  <rect id="rect1" x="10" y="10" rx="15" ry="15" width="100" height="100" />
  <rect
    x="10"
    y="120"
    rx="15"
    ry="15"
    width="100"
    height="100"
    fill="url(#Gradient2)" />
</svg>
```

{{ EmbedLiveSample('線性漸層','120','280') }}

上面是一個將線性漸層應用於 `<rect>` 元素的範例。在線性漸層內部有數個 {{SVGElement('stop')}} 節點。這些節點透過指定位置的 `offset` 屬性和 `stop-color` 屬性，來告訴漸層在特定位置應該是什麼顏色。這可以直接指派，也可以透過 CSS 指派。為了本範例的目的，這兩種方法被混合使用。例如，這個範例告訴漸層從紅色開始，在中間變為透明的黑色，並以藍色結束。你可以插入任意數量的色標（stop colors），以建立你所需要的、無論是美麗還是醜陋的混合效果，但 `offset` 應始終從 0%（或 0，如果你想省略 % 符號）增加到 100%（或 1）。重複的值將使用在 XML 樹中指派在最下方的色標。此外，與填色和描邊一樣，你可以指定 `stop-opacity` 屬性來設定該位置的不透明度（同樣地，在 FF3 中你也可以使用 rgba 值來做到這一點）。

```svg
<stop offset="100%" stop-color="yellow" stop-opacity="0.5"/>
```

要使用漸層，你必須從物件的 `fill` 或 `stroke` 屬性中參照它。這與你在 CSS 中參照元素的方式相同，都是使用 `url`。在這種情況下，url 只是對我們漸層的一個參照，這個漸層有個很有創意的 ID，叫做「Gradient1」。要附加它，將 `fill` 設定為 `url(#Gradient1)`，瞧！我們的物件現在是彩色的了。你也可以對 `stroke` 做同樣的事。

```svg
<style>
  #rect1 { fill: url(#Gradient1); }
</style>
```

`<linearGradient>` 元素也接受其他幾個屬性，用來指定漸層的大小和外觀。漸層的方向由兩個點控制，由 `x1`、`x2`、`y1` 和 `y2` 屬性指定。這些屬性定義了漸層行進的線條。漸層預設為水平方向，但可以透過改變這些屬性來旋轉它。上述範例中的 Gradient2 就是設計來建立一個垂直漸層。

```html
<linearGradient id="Gradient2" x1="0" x2="0" y1="0" y2="1"></linearGradient>
```

> [!NOTE]
> 你也可以在漸層上使用 `href` 屬性。當使用它時，一個漸層的屬性和色標可以被包含在另一個漸層中。在上面的範例中，你就不需要在 Gradient2 中重新建立所有的色標。
>
> ```html
> <linearGradient id="Gradient1">
>   <stop id="stop1" offset="0%" />
>   <stop id="stop2" offset="50%" />
>   <stop id="stop3" offset="100%" />
> </linearGradient>
> <linearGradient
>   id="Gradient2"
>   x1="0"
>   x2="0"
>   y1="0"
>   y2="1"
>   xmlns:xlink="http://www.w3.org/1999/xlink"
>   href="#Gradient1" />
> ```
>
> 我們在這裡直接在節點上包含了 xlink 命名空間，雖然通常你應該在文件的頂部定義它。關於這一點，我們在[討論圖片](/zh-TW/docs/Web/SVG/Tutorials/SVG_from_scratch/Other_content_in_SVG)時會談到更多。

## 放射狀漸層

放射狀漸層與線性漸層相似，但它繪製的是從一個點向外輻射的漸層。要建立一個放射狀漸層，你需要在文件的 `<defs>` 區塊中加入一個 {{SVGElement('radialGradient')}} 元素。

### 基本範例

```html
<?xml version="1.0" standalone="no"?>
<svg width="120" height="240" version="1.1" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <radialGradient id="RadialGradient1">
      <stop offset="0%" stop-color="red" />
      <stop offset="100%" stop-color="blue" />
    </radialGradient>
    <radialGradient id="RadialGradient2" cx="0.25" cy="0.25" r="0.25">
      <stop offset="0%" stop-color="red" />
      <stop offset="100%" stop-color="blue" />
    </radialGradient>
  </defs>

  <rect
    x="10"
    y="10"
    rx="15"
    ry="15"
    width="100"
    height="100"
    fill="url(#RadialGradient1)" />
  <rect
    x="10"
    y="120"
    rx="15"
    ry="15"
    width="100"
    height="100"
    fill="url(#RadialGradient2)" />
</svg>
```

{{ EmbedLiveSample('基本範例_2','120','280') }}

這裡使用的色標與之前相同，但現在物件的中心將是紅色，並在所有方向上逐漸向邊緣變為藍色。與線性漸層一樣，`<radialGradient>` 節點可以接受幾個屬性來描述其位置和方向。然而，與線性漸層不同，它要複雜一些。放射狀漸層同樣由兩個點定義，這兩個點決定了其邊緣的位置。第一個點定義了一個圓，漸層在此圓周結束。它需要一個中心點，由 `cx` 和 `cy` 屬性指定，以及一個半徑 `r`。設定這三個屬性將允許你移動漸層並改變其大小，如上面第二個 `<rect>` 所示。

第二個點稱為焦點，由 `fx` 和 `fy` 屬性定義。第一個點描述了漸層的邊緣在哪裡，而焦點則描述了它的中心在哪裡。透過一個範例會更容易理解。

### 中心點與焦點

```html
<?xml version="1.0" standalone="no"?>

<svg width="120" height="120" version="1.1" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <radialGradient id="Gradient" cx="0.5" cy="0.5" r="0.5" fx="0.25" fy="0.25">
      <stop offset="0%" stop-color="red" />
      <stop offset="100%" stop-color="blue" />
    </radialGradient>
  </defs>

  <rect
    x="10"
    y="10"
    rx="15"
    ry="15"
    width="100"
    height="100"
    fill="url(#Gradient)"
    stroke="black"
    stroke-width="2" />

  <circle
    cx="60"
    cy="60"
    r="50"
    fill="transparent"
    stroke="white"
    stroke-width="2" />
  <circle cx="35" cy="35" r="2" fill="white" stroke="white" />
  <circle cx="60" cy="60" r="2" fill="white" stroke="white" />
  <text x="38" y="40" fill="white" font-family="sans-serif" font-size="10pt">
    (fx,fy)
  </text>
  <text x="63" y="63" fill="white" font-family="sans-serif" font-size="10pt">
    (cx,cy)
  </text>
</svg>
```

{{ EmbedLiveSample('中心點與焦點','120','160') }}

如果焦點被移到前面描述的圓圈之外，漸層將無法正確算繪，因此該點將被假定在圓的邊緣之內。如果完全沒有給定焦點，則假定它與中心點在同一位置。

線性和放射狀漸層也都接受一些其他屬性來描述它們可能經歷的變換。在這裡我想提到的另一個屬性是 `spreadMethod`。這個屬性控制當漸層到達其終點，但物件尚未被填滿時會發生什麼。它可以接受三個值之一：`"pad"`、`"reflect"` 或 `"repeat"`。`"pad"` 是你目前為止所看到的。當漸層到達其終點時，最後的色標顏色將被用來填滿物件的其餘部分。`"reflect"` 會使漸層繼續，但會反向反射，從 100% 的色標顏色開始，回到 0% 的色標顏色，然後再反覆。`"repeat"` 也讓漸層繼續，但不是向後，而是直接跳回開頭重新開始。

### spreadMethod

```html
<?xml version="1.0" standalone="no"?>

<svg width="220" height="220" version="1.1" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <radialGradient
      id="GradientPad"
      cx="0.5"
      cy="0.5"
      r="0.4"
      fx="0.75"
      fy="0.75"
      spreadMethod="pad">
      <stop offset="0%" stop-color="red" />
      <stop offset="100%" stop-color="blue" />
    </radialGradient>
    <radialGradient
      id="GradientRepeat"
      cx="0.5"
      cy="0.5"
      r="0.4"
      fx="0.75"
      fy="0.75"
      spreadMethod="repeat">
      <stop offset="0%" stop-color="red" />
      <stop offset="100%" stop-color="blue" />
    </radialGradient>
    <radialGradient
      id="GradientReflect"
      cx="0.5"
      cy="0.5"
      r="0.4"
      fx="0.75"
      fy="0.75"
      spreadMethod="reflect">
      <stop offset="0%" stop-color="red" />
      <stop offset="100%" stop-color="blue" />
    </radialGradient>
  </defs>

  <rect
    x="10"
    y="10"
    rx="15"
    ry="15"
    width="100"
    height="100"
    fill="url(#GradientPad)" />
  <rect
    x="10"
    y="120"
    rx="15"
    ry="15"
    width="100"
    height="100"
    fill="url(#GradientRepeat)" />
  <rect
    x="120"
    y="120"
    rx="15"
    ry="15"
    width="100"
    height="100"
    fill="url(#GradientReflect)" />

  <text x="15" y="30" fill="white" font-family="sans-serif" font-size="12pt">
    Pad
  </text>
  <text x="15" y="140" fill="white" font-family="sans-serif" font-size="12pt">
    Repeat
  </text>
  <text x="125" y="140" fill="white" font-family="sans-serif" font-size="12pt">
    Reflect
  </text>
</svg>
```

{{ EmbedLiveSample('spreadMethod','220','260') }}

兩種漸層也都有一個名為 `gradientUnits` 的屬性，它描述了你在描述漸層大小或方向時將要使用的單位系統。這裡有兩個可能的值可以使用：`"userSpaceOnUse"` 或 `"objectBoundingBox"`。`"objectBoundingBox"` 是預設值，所以目前為止展示的都是這種情況。它基本上會將漸層縮放到物件的大小，所以你只需要指定從 0 到 1 的座標值，它們就會自動為你縮放到物件的大小。`userSpaceOnUse` 基本上是採用絕對單位。所以你必須知道你的物件在哪裡，並將漸層放在相同的位置。上面的放射狀漸層將被重寫為：

```html
<radialGradient
  id="Gradient"
  cx="60"
  cy="60"
  r="50"
  fx="35"
  fy="35"
  gradientUnits="userSpaceOnUse"></radialGradient>
```

你也可以使用 `gradientTransform` 屬性對漸層應用另一個變換，但由於我們還沒有[介紹變換](/zh-TW/docs/Web/SVG/Tutorials/SVG_from_scratch/Basic_transformations)，所以我們稍後再談。

當物件的邊界框不是正方形時，處理 `gradientUnits="objectBoundingBox"` 還有一些其他的注意事項，但它們相當複雜，需要等待更了解的人來解釋。

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Fills_and_strokes", "Web/SVG/Tutorials/SVG_from_scratch/Patterns") }}
