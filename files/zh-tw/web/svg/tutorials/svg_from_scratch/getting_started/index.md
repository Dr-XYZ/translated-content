---
title: 入門
slug: Web/SVG/Tutorials/SVG_from_scratch/Getting_started
l10n:
  sourceCommit: e488eba036b2fee56444fd579c3759ef45ff2ca8
---

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Introduction", "Web/SVG/Tutorials/SVG_from_scratch/Positions") }}

## 一個基本範例

讓我們直接來看一個範例。請看下方的程式碼。

```xml
<svg version="1.1"
     width="300" height="200"
     xmlns="http://www.w3.org/2000/svg">

  <rect width="100%" height="100%" fill="red" />

  <circle cx="150" cy="100" r="80" fill="green" />

  <text x="150" y="125" font-size="60" text-anchor="middle" fill="white">SVG</text>

</svg>
```

複製這段程式碼並貼到一個名為 demo1.svg 的檔案中。然後在瀏覽器中開啟這個檔案。它會如下方截圖所示進行算繪。（或[在此觀看實際效果](https://mdn.dev/archives/media/attachments/2012/07/09/3075/89b1e0a26e8421e19f907e0522b188bd/svgdemo1.xml)）

![紅色背景上，有一個置中的綠色圓形。圓形內有置中的白色文字 SVG。](svgdemo1.png)

算繪過程包含以下步驟：

1.  我們從 {{SVGElement("svg")}} 根元素開始：

    -   如同（X）HTML 所知，doctype 宣告應該省略，因為基於 DTD 的 SVG 驗證所帶來的問題比解決的還多。
    -   在 SVG 2 之前，為了識別 SVG 版本以進行其他類型的驗證，應改用 `version` 和 `baseProfile` 屬性。`version` 和 `baseProfile` 這兩個屬性在 SVG 2 中都已被棄用。
    -   作為一種 XML 方言，SVG 必須始終正確地綁定命名空間（在 `xmlns` 屬性中）。更多資訊請參見[命名空間速成班](/zh-TW/docs/Web/SVG/Guides/Namespaces_crash_course)頁面。

2.  透過繪製一個覆蓋整個圖片區域的矩形 {{SVGElement("rect")}}，將背景設定為紅色。
3.  在紅色矩形的中央上方，繪製一個半徑為 80px 的綠色圓形 {{SVGElement("circle")}}（圓心從左上角向右偏移 150px，向下偏移 100px）。
4.  繪製文字「SVG」。每個字母的內部都填滿白色。透過設定錨點來定位文字，我們希望錨點的中點位於綠色圓形的中心。可以對字體大小和垂直位置進行微調，以確保最終結果美觀。

## SVG 檔案的基本屬性

-   首先要注意的重要事項是元素的算繪順序。SVG 檔案的通用規則是，*後面*的元素會算繪在*前面*的元素之上。元素在文件中的位置越後面，就越會被看見。
-   網頁上的 SVG 檔案可以直接在瀏覽器中顯示，或透過以下幾種方法嵌入 HTML 檔案中：
    -   如果 HTML 是 XHTML 且以 `application/xhtml+xml` 類型傳送，SVG 可以直接嵌入 XML 原始碼中。
    -   SVG 也可以直接嵌入 HTML 中。
    -   可以使用 `img` 元素。
    -   可以使用 `object` 元素來參照 SVG 檔案：
        ```html
        <object data="image.svg" type="image/svg+xml"></object>
        ```
    -   同樣地，也可以使用 `iframe` 元素：
        ```html
        <iframe src="image.svg"></iframe>
        ```
    -   最後，SVG 可以用 JavaScript 動態建立並注入到 HTML DOM 中。
-   SVG 如何處理大小和單位將在[下一頁](/zh-TW/docs/Web/SVG/Tutorials/SVG_from_scratch/Positions)中解釋。

## SVG 檔案類型

SVG 檔案有兩種。一般的 SVG 檔案是包含 SVG 標記的文字檔。這些檔案建議的副檔名是「.svg」（全小寫）。

由於 SVG 檔案在某些應用（例如地理應用）中可能會變得非常大，SVG 規範也允許使用 gzip 壓縮的 SVG 檔案。這些檔案建議的副檔名是「.svgz」（全小寫）。不幸的是，當從 Microsoft IIS 伺服器提供服務時，要讓 gzip 壓縮的 SVG 檔案在所有支援 SVG 的使用者代理中可靠地運作是非常有問題的，而且 Firefox 無法從本機電腦載入 gzip 壓縮的 SVG。除非你發布到一個你知道會正確提供服務的網頁伺服器上（見下文），否則請避免使用 gzip 壓縮的 SVG。

## 關於提供 .svgz 檔案的網頁伺服器

現在你已經知道如何建立基本的 SVG 檔案，下一步是將它們上傳到網頁伺服器。不過，在這個階段有一些陷阱。對於一般的 SVG 檔案，伺服器應傳送以下 HTTP 標頭：

```http
Content-Type: image/svg+xml
Vary: Accept-Encoding
```

對於 gzip 壓縮的 SVG 檔案，伺服器應傳送以下 HTTP 標頭：

```http
Content-Type: image/svg+xml
Content-Encoding: gzip
Vary: Accept-Encoding
```

你可以使用[網路監控面板](https://firefox-source-docs.mozilla.org/devtools-user/network_monitor/index.html#headers)或像 [websniffer.com](https://websniffer.com/) 這樣的網站來檢查你的伺服器是否為 SVG 檔案傳送了正確的 HTTP 標頭。提交你其中一個 SVG 檔案的 URL，並查看 HTTP 回應標頭。如果你發現你的伺服器沒有傳送具有上述值的標頭，那麼你應該聯繫你的網站主機商。如果你在說服他們為 SVG 正確組態伺服器時遇到問題，可能有一些方法可以自己動手。請參見 w3.org 上的[伺服器組態頁面](https://www.w3.org/services/svg-server/)以尋找一系列解決方案。

伺服器組態錯誤是 SVG 載入失敗的一個非常常見的原因，所以請務必檢查你的設定。如果你的伺服器沒有被組態為在提供 SVG 檔案時傳送正確的標頭，那麼 Firefox 很可能會將檔案的標記顯示為文字或亂碼，甚至會要求檢視者選擇一個應用程式來開啟它們。

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Introduction", "Web/SVG/Tutorials/SVG_from_scratch/Positions") }}
