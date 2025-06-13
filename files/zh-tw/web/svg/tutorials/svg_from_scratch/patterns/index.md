---
title: 圖樣
slug: Web/SVG/Tutorials/SVG_from_scratch/Patterns
l10n:
  sourceCommit: c2fd97474834e061404b992c8397d4ccc4439a71
---

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Gradients", "Web/SVG/Tutorials/SVG_from_scratch/Texts") }}

## 圖樣

圖樣可以說是 SVG 中較為混亂的填充類型之一。它們也非常強大，所以值得我們討論並至少對其有基本的掌握。如同漸層，{{SVGElement('pattern')}} 元素應該放在你 SVG 檔案的 {{SVGElement("defs")}} 區段中。

```html
<svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="Gradient1">
      <stop offset="5%" stop-color="white" />
      <stop offset="95%" stop-color="blue" />
    </linearGradient>
    <linearGradient id="Gradient2" x1="0" x2="0" y1="0" y2="1">
      <stop offset="5%" stop-color="red" />
      <stop offset="95%" stop-color="orange" />
    </linearGradient>

    <pattern id="Pattern" x="0" y="0" width=".25" height=".25">
      <rect x="0" y="0" width="50" height="50" fill="skyblue" />
      <rect x="0" y="0" width="25" height="25" fill="url(#Gradient2)" />
      <circle
        cx="25"
        cy="25"
        r="20"
        fill="url(#Gradient1)"
        fill-opacity="0.5" />
    </pattern>
  </defs>

  <rect fill="url(#Pattern)" stroke="black" width="200" height="200" />
</svg>
```

{{ EmbedLiveSample('圖樣','220','240') }}

在 {{SVGElement("pattern")}} 元素內部，你可以包含任何你之前用過的其他基本形狀，且每個形狀都可以使用你之前學過的任何樣式來設定，包含漸層和不透明度。在這裡，我們只在圖樣中繪製了兩個矩形元素（它們重疊，其中一個是另一個的兩倍大，用來填滿整個圖樣）和一個圓形。

關於圖樣，令人困惑的是定義單位系統及其尺寸。在上面的範例中，我們在圖樣元素上定義了 `width` 和 `height` 屬性，用來描述圖樣在開始重複之前應該延伸多遠。如果你想將這個矩形的起點偏移到繪圖中的某個位置，也可以使用 `x` 和 `y` 屬性。下面會說明在這裡使用它們的原因。

如同上面用到的 `gradientUnits` 屬性，圖樣也有一個 `patternUnits` 屬性，它指定了這些屬性將採用的單位。它預設為 `"objectBoundingBox"`，就像上面一樣，所以 `1` 的值會被縮放到你應用圖樣的物件的 `width` 和 `height`。在這種情況下，因為我們希望圖樣在水平和垂直方向上重複 4 次，所以 `height` 和 `width` 被設定為 `0.25`。這表示圖樣的 `width` 和 `height` 只有總方框大小的 `0.25`。

與漸層不同，圖樣有第二個屬性 `patternContentUnits`，它描述了在圖樣元素內部、基本形狀本身所使用的單位系統。這個屬性預設為 `"userSpaceOnUse"`，與 `patternUnits` 屬性相反。這意味著，除非你指定這兩個屬性中的一個或兩個（`patternContentUnits` 和 `patternUnits`），否則你在圖樣內繪製的形狀所使用的座標系統，會與圖樣元素使用的不同，這在你手動編寫時可能會造成一些混亂。

為了讓上面的範例能正常運作，我們必須考慮到方框的大小（200 像素）以及我們希望圖樣在水平和垂直方向上重複 4 次的事實。這表示每個圖樣單位都是一個 50×50 的正方形。圖樣內的兩個矩形和圓形的大小接著被設定為能放進一個 50×50 的方框中。任何繪製在該方框外的東西都不會顯示。圖樣也必須偏移 10 像素，才能從我們方框的左上角開始，所以 `pattern` 的 `x` 和 `y` 屬性必須調整為 10÷200 = 0.05。

這裡的警告是，如果物件改變大小，圖樣本身會縮放以適應它，但內部的物件不會。所以，雖然我們在圖樣中仍然會有 4 個重複的單位，但構成該圖樣的物件會保持相同的大小，最終你將在它們之間看到大片的空白區域。透過改變 `patternContentUnits` 屬性，我們可以將所有元素放入同一個單位系統中：

```xml
 <pattern id="Pattern" width=".25" height=".25" patternContentUnits="objectBoundingBox">
   <rect x="0" y="0" width=".25" height=".25" fill="skyblue"/>
   <rect x="0" y="0" width=".125" height=".125" fill="url(#Gradient2)"/>
   <circle cx=".125" cy=".125" r=".1" fill="url(#Gradient1)" fill-opacity="0.5"/>
 </pattern>
```

現在，因為圖樣內容與圖樣本身在同一個單位系統中，我們就不需要偏移方框來讓圖樣從正確的位置開始，而且如果物件的大小被改成更大的尺寸，圖樣會自動縮放，使其內部包含相同數量的物件和重複次數。這與 `"userSpaceOnUse"` 系統形成對比，在該系統中，如果物件改變大小，圖樣會保持不變，只是重複更多次來填滿方框。

稍微離題一下，在 Gecko 中，如果圓形的半徑設定小於 `0.075`，似乎會出現繪製問題（目前尚不清楚這是否為圖樣元素的錯誤）。為了避開這個問題，除非必要，否則最好避免使用 `"objectBoundingBox"` 單位來繪圖。

這兩種用法都不是人們想到圖樣時通常會想到的。圖樣通常有固定的尺寸，並且獨立於物件的形狀進行重複。要建立這樣的東西，圖樣及其內容都必須在目前的 userSpace 中繪製，這樣它們就不會因為物件的改變而改變形狀：

```xml
 <pattern id="Pattern" x="10" y="10" width="50" height="50" patternUnits="userSpaceOnUse">
   <rect x="0" y="0" width="50" height="50" fill="skyblue"/>
   <rect x="0" y="0" width="25" height="25" fill="url(#Gradient2)"/>
   <circle cx="25" cy="25" r="20" fill="url(#Gradient1)" fill-opacity="0.5"/>
 </pattern>
```

當然，這意味著如果你之後改變物件的大小，圖樣將不會縮放。下面展示了前面三個範例應用在一個 `height` 稍微拉長到 `300px` 的矩形上的情況，但我應該指出，這並不是一個詳盡的畫面，根據你的應用程式，還有其他可用的選項。

![三個範例顯示 patternUnits 的預設值和 userSpaceOnUse 值，以及 patternContentUnits 的預設值和 objectBoundingBox 值。當兩者都設定為預設值時，長寬比會被維持，並顯示空白區域。將 patternContentUnits 設定為 objectBoundingBox 會影響長寬比以移除空白區域。將 patternUnits 設定為 userSpaceOnUse 會維持長寬比並消除空白區域。](svg_pattern_comparison_of_units.png)

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Gradients", "Web/SVG/Tutorials/SVG_from_scratch/Texts") }}
