---
title: 安裝基本軟體
short-title: 安裝軟體
slug: Learn_web_development/Getting_started/Environment_setup/Installing_software
l10n:
  sourceCommit: 51f9f1329e9d05233d39daaa9d5e4f89d77e57b5
---

{{NextMenu("Learn_web_development/Getting_started/Environment_setup/Browsing_the_web", "Learn_web_development/Getting_started/Environment_setup")}}

在本文中，我們將討論需要哪些軟體來進行簡單的 Web 開發，以及現在需要安裝哪些軟體，包括程式碼編輯器和一些現代 Web 瀏覽器。

<table>
  <tbody>
    <tr>
      <th scope="row">先備知識：</th>
      <td>
        對所使用的電腦作業系統（OS）有基本認識。
      </td>
    </tr>
    <tr>
      <th scope="row">學習成果：</th>
      <td>
        <ul>
          <li>了解開始所需軟體。</li>
          <li>安裝程式碼編輯器、一些現代瀏覽器，以及本機測試伺服器。</li>
          <li>探索其他常見應用程式的選項。</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## 程式碼編輯器

一個體面的程式碼編輯器是任何開發者在其機器上必備的重要工具之一。程式碼編輯器不僅是撰寫程式碼的地方，它還具備許多其他功能。我們在後續的系列中專門撰寫了一篇關於程式碼編輯器的文章。

目前，我們建議安裝 [Visual Studio Code](https://code.visualstudio.com/)，因為它支援多個平台、擁有優秀的功能集和支援，且是大多數人主要使用的編輯器。你應該現在就安裝它，以便後續跟著本文操作。

## 現代 Web 瀏覽器

擁有現代 Web 瀏覽器對 Web 開發至關重要，這樣才能在訪客使用的瀏覽器上測試你所建立的 Web 或應用程式。你也需要保持瀏覽器更新，以確保它們支援最新的網頁技術並套用最新的安全修補。

最常見的瀏覽器如下：

- 桌面瀏覽器：
  - 基於 [Chromium](<https://en.wikipedia.org/wiki/Chromium_(web_browser)>)：[Google Chrome](https://www.google.com/chrome/)、[Opera](https://www.opera.com/opera)、[Brave](https://brave.com/download/)、[Microsoft Edge](https://www.microsoft.com/zh-tw/edge)、[Vivaldi](https://vivaldi.com/zh-hant)。
  - 基於 [Gecko](<https://en.wikipedia.org/wiki/Gecko_(software)>)：[Mozilla Firefox](https://www.mozilla.org/zh-TW/firefox/new/)。
  - 基於 [WebKit](https://en.wikipedia.org/wiki/WebKit)：[Apple Safari](https://www.apple.com/safari/)。
- 行動／其他裝置瀏覽器：
  - 基於 Chromium（Android）：[Google Chrome](https://www.google.com/chrome/go-mobile/)、[Opera](https://www.opera.com/opera)、[Brave](https://brave.com/download/)、[Microsoft Edge](https://www.microsoft.com/zh-tw/edge/mobile)、[Samsung Internet](https://www.samsung.com/us/support/owners/app/samsung-internet)、[Vivaldi](https://vivaldi.com/zh-hant/android/)。
  - 基於 Gecko（Android）：[Mozilla Firefox](https://www.mozilla.org/zh-TW/firefox/browsers/mobile/android/)。
  - 基於 WebKit（iOS）：[Apple Safari](https://www.apple.com/safari/)。
    > [!NOTE]
    > 上述大部分 Android 瀏覽器在 iOS 上都有版本，但由於蘋果的 App Store 規定，歷史上它們皆使用蘋果的 WebKit 引擎。撰寫本文時，由於規範變更，各瀏覽器正開始推出基於自家渲染引擎的 iOS 版本。請參閱 [Apple 終於允許 iPhone 上運行完整版本的 Chrome 和 Firefox](https://www.theverge.com/2024/1/25/24050478/apple-ios-17-4-browser-engines-eu)。

多數現代瀏覽器會自動安裝更新，並在重新啟動時套用變更。你通常可以在瀏覽器的「關於」頁面檢查更新，但該頁面在不同瀏覽器和作業系統中的位置略有不同，例如：

- Firefox：在 macOS 上，依序選擇 _Firefox_ > _關於 Firefox_；在 Windows 上，依序選擇選單圖示 > _說明_ > _關於 Firefox_。
- Chrome：在 macOS 上，依序選擇 _Chrome_ > _關於 Google Chrome_；在 Windows 上，依序選擇選單圖示 > _說明_ > _關於 Google Chrome_。

### 應該安裝哪些瀏覽器

目前，你應該安裝幾款桌面及行動／其他裝置的瀏覽器來測試程式碼。請至少安裝使用兩種不同渲染引擎（例如 Chromium 與 Gecko）的瀏覽器，避免只在使用相同渲染引擎的不同瀏覽器上測試。這很重要，因為程式碼可能存在只會影響其中一種渲染引擎的錯誤。

基於 WebKit 的瀏覽器無法在 Windows、Linux 和 Android 作業系統上使用。如果你的電腦使用 Windows，卻想測試全部三種主要渲染引擎，就需要使用 macOS 或 iOS 測試裝置，或透過虛擬機器、測試平台等軟體方案。不過現階段不必擔心全面性的測試——只要知道應該跨不同渲染引擎測試，並實際練習就足夠了。

你會在後續的[測試](/zh-TW/docs/Learn_web_development/Extensions/Testing)模組中更深入了解測試策略。

## 本機 Web 伺服器

通常當你在瀏覽器中輸入網址以載入網站時，組成該網站的檔案會從遠端網頁伺服器（位於世界其他地方的伺服器電腦上）取得，再由瀏覽器組合渲染。你將在系列的下一篇文章中進一步了解這個過程。

當你在本機（自己的電腦）上建立網站時，你通常可以直接在瀏覽器中載入主要 HTML 索引檔進行測試。然而，部分範例需要透過本機安裝的網頁伺服器才能正確運作。

### 安裝本機 Web 伺服器

我們發現其中一個最簡單的方法是使用程式碼編輯器擴充功能——如此一來，它就能直接在你的程式碼編輯器內運作。請在 Visual Studio Code 中依照以下步驟操作：

1. 使用*檢視* > *擴充功能*選單選項開啟*擴充功能*面板。
2. 在此面板頂部的「搜尋...」欄位中輸入「live preview」。搜尋結果最上方應該會顯示由 Microsoft 所建立的 [_Live Preview_](https://marketplace.visualstudio.com/items?itemName=ms-vscode.live-server) 擴充功能。
3. 點選該選項以開啟包含使用說明的頁面。
4. 按下*安裝*按鈕以安裝此擴充功能。
5. 現在，當你在編輯器中處理 HTML 檔案時，你應該可以點擊「顯示預覽」按鈕，在另一個分頁中開啟即時範例。

上述方法雖簡單，但彈性有限。未來你可能會希望擁有更具彈性的本機伺服器選項，以便在任何可用的瀏覽器中載入範例。關於其他選項（以及更多有關為何需要本機伺服器的背景資訊），請參見[如何設定本機測試伺服器？](/zh-TW/docs/Learn_web_development/Howto/Tools_and_setup/set_up_a_local_testing_server)。

## 圖形編輯器

網頁開發者常常需要處理用於網站的影像，這可能意味著設計／建立圖形資產；但同時，這些圖形也可能由圖形設計師（可能是團隊成員或第三方）提供，此時你可能需要裁切或調整接收到的檔案大小。

MDN 的學習文章均不要求你自行建立圖形，但部分文章可能要求你處理我們所提供的檔案。

我們建議你等到學習過程中真正需要圖形編輯器時再安裝。除非你確定昂貴的商業軟體確實能帶來額外價值，否則不必花錢購買。

目前有許多免費軟體工具和線上服務可能就已足夠使用，例如：

- macOS 附帶一個名為 [Preview](https://support.apple.com/zh-tw/guide/preview/welcome/mac) 的工具。該工具主要用於檢視影像和 PDF，但也提供調整大小、旋轉、裁切、註記以及不同檔案類型轉換等實用的影像編輯功能。
- 內建於 Windows 的[相片應用程式](https://support.microsoft.com/en-us/windows/apps/photos/manage-photos-and-videos-with-microsoft-photos-app)具備許多類似功能。
- [tinypng](https://tinypng.com/) 網站提供免費服務，讓你壓縮 PNG、JPEG 等檔案。這是在準備網站資產時你常需執行的任務。

就商業產品而言，[Adobe Photoshop](https://www.adobe.com/products/photoshop.html) 長期以來一直是業界標準，特別適合進行照片編輯，而像 [Sketch](https://www.sketch.com/) 這類程式則更適合用於圖示與使用者介面設計。另有一些近年來頗受歡迎的新興工具，如 [Figma](https://www.figma.com/)、[Affinity 套裝軟體](https://www.affinity.studio/)以及 [Canva](https://www.canva.com/)。

上述多數應用程式都有值得嘗試的試用版或免費模式。也有一些備受推崇的免費應用程式，例如 [GIMP](https://www.gimp.org/)、[Adobe Express](https://www.adobe.com/express/) 以及 [Paint.NET](https://paint.net/)。

## 版本控制工具

**版本控制**工具讓開發者能夠管理伺服器上的檔案、與團隊協作、分享程式碼和資產，以及避免編輯衝突。目前，[Git](https://git-scm.com/) 是最流行的版本控制系統，還有 [GitHub](https://github.com/) 或 [GitLab](https://about.gitlab.com/) 等託管服務。

雖然版本控制工具對網頁開發團隊至關重要，但目前你暫時不需要關注這一部份。我們在核心模組系列的後段有專門介紹[版本控制](/zh-TW/docs/Learn_web_development/Core/Version_control)。

## 網站部署應用程式

當你完成在本機或開發伺服器上的網站或應用程式開發後，你會希望將它部署到遠端 Web 伺服器上，讓用戶可以輸入與它相關的網址，並在網路上檢視它！

你可以透過多種方式進行部署，例如購買網站託管服務並使用 [(S)FTP 用戶端](/zh-TW/docs/Glossary/FTP)、使用 [GitHub Pages](https://pages.github.com/) 或 [Netlify](https://www.netlify.com/) 等服務，甚至使用 [CodePen](https://codepen.io/) 或 [JSFiddle](https://jsfiddle.net/) 快速建立展示版與他人分享。

這樣的選項清單可能看起來令人眼花繚亂，但請放心——目前你無需了解任何有關網站發布的知識。我們在後續課程中會多次探討這個主題。你很快就會在[你的第一個網站](/zh-TW/docs/Learn_web_development/Getting_started/Your_first_website)模組中獲得實際經驗，特別是[發布你的網站](/zh-TW/docs/Learn_web_development/Getting_started/Your_first_website/Publishing_your_website)這篇文章。

{{NextMenu("Learn_web_development/Getting_started/Environment_setup/Browsing_the_web", "Learn_web_development/Getting_started/Environment_setup")}}
