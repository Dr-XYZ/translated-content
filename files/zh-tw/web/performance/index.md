---
title: 網頁效能
short-title: 效能
slug: Web/Performance
l10n:
  sourceCommit: d37026a4d0e1e3a5a2ab82d34566689aada039f7
---

網頁效能是載入時間和執行時間的客觀測量值，以及使用者感知到的體驗。
網頁效能是指網站載入、變得可互動和有回應所需的時間，以及在使用者互動期間內容的流暢度。
效能涉及的問題像是：捲動是否流暢？按鈕是否有回應？彈出視窗是否能快速載入並流暢地播放動畫？
客觀測量值包括載入時間、每秒影格數，以及變得可互動的時間；而主觀體驗則是指使用者感覺內容載入花了多長時間。

網站回應時間越長，越多使用者會放棄該網站。因此，最小化載入和回應時間非常重要，並應加入額外功能來隱藏延遲，盡快讓體驗變得可用和可互動，同時非同步地載入體驗中較耗時的部分。

有許多工具、API 和最佳實踐可以幫助我們測量和改善網頁效能。我們將在接下來的頁面中介紹它們。

## 網頁效能指南

「[效能指南](/zh-TW/docs/Web/Performance/Guides)」是描述瀏覽器如何運作、哪些因素會影響效能，以及如何測量、最佳化和監控應用程式各方面效能的資源。

- [效能基礎](/zh-TW/docs/Web/Performance/Guides/Fundamentals)
  - : 效能意味著效率。在開放網路應用程式的背景下，本文件概括解釋了什麼是效能、瀏覽器平台如何幫助改善效能，以及你可以使用哪些工具和流程來測試和改善它。
- [填入頁面：瀏覽器如何運作](/zh-TW/docs/Web/Performance/Guides/How_browsers_work)
  - : 使用者希望網頁體驗的內容載入快速且互動流暢。因此，開發者應努力實現這兩個目標。
    要了解如何改善效能和感知效能，了解瀏覽器如何運作會很有幫助。
- [了解延遲](/zh-TW/docs/Web/Performance/Guides/Understanding_latency)
  - : **延遲**是指一個資料封包從來源傳輸到目的地所需的時間。在效能最佳化方面，重要的是要進行最佳化以減少造成延遲的原因，並透過模擬高延遲來測試網站效能，以便為連線速度慢或不穩定的使用者進行最佳化。
- [建議的網頁效能時間：多久算太久？](/zh-TW/docs/Web/Performance/Guides/How_long_is_too_long)
  - : 關於載入頁面時什麼構成緩慢的速度，沒有明確的規定，但有具體的指導方針，用於指示內容將載入（1 秒）、閒置（50 毫秒）、動畫（16.7 毫秒）以及回應使用者輸入（50 到 200 毫秒）。
- [使用 dns-prefetch](/zh-TW/docs/Web/Performance/Guides/dns-prefetch)
  - : **`DNS-prefetch`** 是一種在資源被請求前嘗試解析網域名稱的作法。這可能是一個稍後載入的檔案，或是使用者試圖點擊的連結目標。
- [導覽與資源時間](/zh-TW/docs/Web/Performance/Guides/Navigation_and_resource_timings)
  - : **導覽時間**是測量瀏覽器文件導覽事件的指標。**資源時間**是關於應用程式資源載入的詳細網路時間測量。兩者都提供相同的唯讀屬性，但導覽時間測量主文件的時間，而資源時間則提供主文件所呼叫的所有資產或資源，以及這些資源所請求的資源的時間。
- [最佳化啟動效能](/zh-TW/docs/Web/Performance/Guides/Optimizing_startup_performance)
  - : 改善你的啟動效能通常是可進行的最高價值的效能最佳化之一。
    良好的使用者體驗包括確保你的應用程式快速載入。本文為撰寫新應用程式和將應用程式從其他平台移植到網頁提供了效能提示和建議。
- [關鍵算繪路徑](/zh-TW/docs/Web/Performance/Guides/Critical_rendering_path)
  - : 關鍵算繪路徑是瀏覽器將 HTML、CSS 和 JavaScript 轉換為螢幕上像素的一系列步驟。最佳化關鍵算繪路徑可以改善算繪效能。
    關鍵算繪路徑包括[文件物件模型](/zh-TW/docs/Web/API/Document_Object_Model)（DOM）、[CSS 物件模型](/zh-TW/docs/Web/API/CSS_Object_Model)（CSSOM）、算繪樹和版面配置。
- [延遲載入](/zh-TW/docs/Web/Performance/Guides/Lazy_loading)
  - : **延遲載入**是一種將資源識別為非阻塞（非關鍵）並僅在需要時才載入這些資源的策略。這是一種縮短[關鍵算繪路徑](/zh-TW/docs/Web/Performance/Guides/Critical_rendering_path)長度的方法，從而減少頁面載入時間。
- [推測性載入](/zh-TW/docs/Web/Performance/Guides/Speculative_loading)
  - : **推測性載入**是指根據對使用者最可能接下來訪問哪些頁面的預測，在實際訪問相關頁面之前執行導覽操作（例如 DNS 擷取、擷取資源或算繪文件）的做法。
- [效能預算](/zh-TW/docs/Web/Performance/Guides/Performance_budgets)
  - : 效能預算是防止效能退化的限制。它可以應用於一個檔案、一種檔案類型、頁面上載入的所有檔案、一個特定的指標（例如[可互動時間](/zh-TW/docs/Glossary/Time_to_interactive)）、一個自訂指標（例如，英雄元素時間），或一段時間內的閾值。
- [效能監控：RUM 與綜合監控](/zh-TW/docs/Web/Performance/Guides/Rum-vs-Synthetic)
  - : **綜合監控**和**真實使用者監控（RUM）**是監控和提供網頁效能洞察的兩種方法。RUM 和綜合監控提供了不同的效能視角，各有其優點、好的使用案例和缺點。RUM 通常最適合了解長期趨勢，而綜合監控則非常適合迴歸測試和在開發過程中緩解短期效能問題。在本文中，我們定義並比較這兩種效能監控方法。
- [CSS 與 JavaScript 動畫效能](/zh-TW/docs/Web/Performance/Guides/CSS_JavaScript_animation_performance)
  - : 動畫對於許多應用程式的愉快使用者體驗至關重要。實現網頁動畫的方法有很多，例如 CSS {{cssxref("transition","transitions")}}／{{cssxref("animation","animations")}} 或基於 JavaScript 的動畫（使用 {{domxref("Window.requestAnimationFrame","requestAnimationFrame()")}}）。在本文中，我們分析了基於 CSS 和基於 JavaScript 的動畫之間的效能差異。
- [動畫效能與影格率](/zh-TW/docs/Web/Performance/Guides/Animation_performance_and_frame_rate)
  - : 網頁上的動畫可以透過 {{domxref('SVGAnimationElement', 'SVG')}}、{{domxref('Window.requestAnimationFrame','JavaScript')}}（包括 {{htmlelement('canvas')}} 和 {{domxref('WebGL_API', 'WebGL')}}）、CSS {{cssxref('animation')}}、{{htmlelement('video')}}、動畫 GIF，甚至動畫 PNG 和其他圖片類型來實現。
    動畫化一個 CSS 屬性的效能成本可能因屬性而異，動畫化昂貴的 CSS 屬性可能會導致{{glossary('Jank', '卡頓')}}，因為瀏覽器難以達到流暢的{{glossary("FPS", "影格率")}}。

## 新手教學

MDN 的[網頁效能學習區](/zh-TW/docs/Learn_web_development/Extensions/Performance)包含涵蓋效能基礎的現代化、最新教學。如果你是效能領域的新手，請從這裡開始：

- [網頁效能：簡要概覽](/zh-TW/docs/Learn_web_development/Extensions/Performance/What_is_web_performance)
  - : 網頁效能學習路徑的概覽。從這裡開始你的旅程。
- [什麼是網頁效能？](/zh-TW/docs/Learn_web_development/Extensions/Performance/What_is_web_performance)
  - : 本文從深入探討效能的實際含義開始本模組——這包括我們在思考效能時需要考慮的工具、指標、API、網路和人群，以及我們如何將效能納入我們的網頁開發工作流程。
- [使用者如何感知效能？](/zh-TW/docs/Learn_web_development/Extensions/Performance/Perceived_performance)
  - : 比你的網站在毫秒級別上有多快更重要的是，你的使用者感知到你的網站有多快。這些感知受到實際頁面載入時間、閒置時間、對使用者互動的回應性以及捲動和其他動畫的流暢度影響。在本文中，我們討論了各種載入指標、動畫和回應性指標，以及改善使用者感知（如果不是實際時間）的最佳實踐。
- [網頁效能基礎](/zh-TW/docs/Learn_web_development/Extensions/Performance/Web_Performance_Basics)
  - : 除了 HTML、CSS、JavaScript 和媒體檔案等前端組件外，還有一些特性可以使應用程式變慢，也有一些特性可以使應用程式在主觀和客觀上更快。有許多與網頁效能相關的 API、開發者工具、最佳實踐和不良實踐。在這裡，我們將介紹許多這些特性的基礎知識，並提供深入探討每個主題以改善效能的連結。
- [HTML 效能特性](/zh-TW/docs/Learn_web_development/Extensions/Performance/HTML)
  - : 某些屬性和你的標記的原始碼順序會影響你網站的效能。透過最小化 DOM 節點的數量，確保使用最佳的順序和屬性來包含樣式、腳本、媒體和第三方腳本等內容，你可以大幅改善使用者體驗。本文詳細探討了如何使用 HTML 來確保最大效能。
- [多媒體：圖片與視訊](/zh-TW/docs/Learn_web_development/Extensions/Performance/Multimedia)
  - : 網頁效能中最容易達成的目標通常是媒體最佳化。根據每個使用者代理程式的能力、大小和像素密度來提供不同的媒體檔案是可能的。額外的提示，如從背景視訊中移除音訊軌道，可以進一步改善效能。在本文中，我們討論了視訊、音訊和圖片內容對效能的影響，以及確保這種影響盡可能小的方法。
- [CSS 效能特性](/zh-TW/docs/Learn_web_development/Extensions/Performance/CSS)
  - : CSS 可能不是改善效能的重要最佳化重點，但有些 CSS 特性比其他特性對效能的影響更大。在本文中，我們將探討一些影響效能的 CSS 屬性，並建議處理樣式的方法，以確保效能不受負面影響。
- [JavaScript 效能最佳實踐](/zh-TW/docs/Learn_web_development/Extensions/Performance/JavaScript)
  - : JavaScript 若使用得當，可以實現互動式和沉浸式的網頁體驗——或者它也可能嚴重損害下載時間、算繪時間、應用程式內效能、電池壽命和使用者體驗。本文概述了一些應考慮的 JavaScript 最佳實踐，以確保即使是複雜的內容也能盡可能地高效能。

## Performance API

[Performance API](/zh-TW/docs/Web/API/Performance_API) 是一組用於測量 Web 應用程式效能的標準。
以下頁面提供了 Performance API 的概覽，包括如何使用它們的訊息：

- [高精度計時](/zh-TW/docs/Web/API/Performance_API/High_precision_timing)
  - : Performance API 允許基於時間的高精度測量，其解析度可能達到亞毫秒級，並使用一個穩定的單調時鐘，不受系統時鐘偏差或調整的影響。
    需要高解析度計時器來進行準確的基準測試，而不是使用較不精確且非單調的 {{jsxref("Date")}} 時間戳。
- [長動畫影格計時](/zh-TW/docs/Web/API/Performance_API/Long_animation_frame_timing)
  - : **長動畫影格**（LoAFs）會影響網站的使用者體驗。
    它們可能導致使用者介面（UI）更新緩慢，造成看似無回應的控制項和[卡頓](/zh-TW/docs/Glossary/Jank)（或不流暢）的動畫效果和捲動，從而導致使用者挫折。
    [長動畫影格 API](https://w3c.github.io/long-animation-frames/) 允許開發者獲取有關長動畫影格的訊息，並更好地了解其根本原因。本文展示了如何使用長動畫影格 API。
- [監控 bfcache 封鎖原因](/zh-TW/docs/Web/API/Performance_API/Monitoring_bfcache_blocking_reasons)
  - : {{domxref("PerformanceNavigationTiming.notRestoredReasons")}} 屬性報告了有關當前文件在導覽時為何被阻止使用 {{Glossary("bfcache")}} 的訊息。
    開發者可以使用此訊息來識別需要更新以使其與 bfcache 相容的頁面，從而改善網站效能。
- [導覽計時](/zh-TW/docs/Web/API/Performance_API/Navigation_timing)
  - : 導覽計時透過 [PerformanceNavigationTiming](/zh-TW/docs/Web/API/PerformanceNavigationTiming) API 提供與從一個頁面導覽到另一個頁面相關的指標。
    例如，你可以確定載入或卸載文件需要多少時間，或記錄直到 {{Glossary("DOM")}} 建構完成且可以與 DOM 互動所需的時間。
- [效能資料](/zh-TW/docs/Web/API/Performance_API/Performance_data)
  - : Performance API 不提供效能資料分析或視覺化。
    然而，Performance API 與開發者工具整合良好，其資料通常會發送到分析端點和函式庫，以記錄效能指標，幫助你評估資料以找到影響使用者的效能瓶頸。
    本頁概述了存在哪些類型的 Performance API 資料、如何收集以及如何存取。
- [資源計時 API](/zh-TW/docs/Web/API/Performance_API/Resource_timing)
  - : 資源計時能夠擷取和分析應用程式資源載入的詳細網路計時資料。
    應用程式可以使用計時指標來確定，例如，載入特定資源（如圖片或腳本）所需的時間長度，無論是作為頁面載入的一部分隱式載入，還是透過 JavaScript 明確載入，例如使用 {{domxref("Window/fetch", "fetch()")}} API。
- [伺服器計時](/zh-TW/docs/Web/API/Performance_API/Server_timing)
  - : 伺服器計時允許伺服器將有關請求-回應週期的指標傳達給使用者代理程式。
    你可以收集此訊息，並以與使用 Performance API 處理的所有其他指標相同的方式對伺服器端指標採取行動。
- [使用者計時 API](/zh-TW/docs/Web/API/Performance_API/User_timing)
  - : 使用[使用者計時 API](/zh-TW/docs/Web/API/Performance_API/User_timing) 的「mark」和「measure」項目類型，利用屬於瀏覽器效能時間軸一部分的[高精度時間戳](/zh-TW/docs/Web/API/DOMHighResTimeStamp)來建立應用程式特定的時間戳。

### 相關 API

以下 API 對於測量和影響頁面效能也很有用：

- [頁面可見度 API](/zh-TW/docs/Web/API/Page_Visibility_API)
  - : 提供你可以監聽的事件，以了解文件何時變得可見或隱藏，以及查看頁面當前可見性狀態的功能。
- [背景任務 API](/zh-TW/docs/Web/API/Background_Tasks_API)
  - : **背景任務協同排程 API**（也稱為背景任務 API 或 [`requestIdleCallback()`](/zh-TW/docs/Web/API/Window/requestIdleCallback) API）提供了將任務排入佇列的能力，當使用者代理程式確定有空閒時間時，會自動執行這些任務。
- [Beacon API](/zh-TW/docs/Web/API/Beacon_API)
  - : [Beacon](/zh-TW/docs/Web/API/Beacon_API) 介面會排程一個非同步且非阻塞的請求到網頁伺服器。
- [Intersection Observer API](/zh-TW/docs/Web/API/Intersection_Observer_API)
  - : Intersection Observer API 提供了一種非同步觀察目標元素與祖先元素或頂層文件{{Glossary("Viewport", "視口")}}交集變化的方法。
    這使得[計時元素可見度](/zh-TW/docs/Web/API/Intersection_Observer_API/Timing_element_visibility)等使用案例成為可能，以便在感興趣的元素變得可見時非同步地收到通知。
- [媒體能力 API](/zh-TW/docs/Web/API/Media_Capabilities_API/Using_the_Media_Capabilities_API)
  - : 揭示用戶端裝置的解碼和編碼能力，例如媒體是否受支援，以及播放是否應該流暢且省電，並提供有關播放的即時回饋，以更好地實現自適應串流，並存取顯示屬性訊息。
- [網路訊息 API](/zh-TW/docs/Web/API/Network_Information_API)
  - : 關於系統連線的一般連線類型（例如，「wifi」、「cellular」等）的訊息。
    這可以用於根據使用者的連線選擇高畫質內容或低畫質內容。
- [電池狀態 API](/zh-TW/docs/Web/API/Battery_Status_API)
  - : **電池 API** 提供有關系統電池電量的訊息，並讓你透過在電池電量或充電狀態改變時發送的事件得到通知。
    這可以用於在電池電量低時調整應用程式的資源使用以減少電池消耗，或在電池耗盡前儲存變更以防止資料遺失。
- [Navigator.deviceMemory](/zh-TW/docs/Web/API/Navigator/deviceMemory)
  - : {{domxref("Navigator")}} 介面的唯讀屬性 **`deviceMemory`** 回傳裝置記憶體的大約數量（以 GB 為單位）。
- [FetchEvent.preloadResponse](/zh-TW/docs/Web/API/FetchEvent/preloadResponse)
  - : {{domxref("FetchEvent")}} 介面的唯讀屬性 **`preloadResponse`** 回傳一個 {{jsxref("Promise")}}，如果[導覽預載](/zh-TW/docs/Web/API/NavigationPreloadManager)被觸發，則解析為導覽預載的 {{domxref("Response")}}，否則為 `undefined`。

## 分析與工具

- [Firefox Profiler 效能特性](https://profiler.firefox.com/docs/#/)
  - : 這個網站提供了如何使用和理解開發者工具中效能特性的訊息，包括[呼叫樹](https://profiler.firefox.com/docs/#/./guide-ui-tour-panels?id=the-call-tree)、[火焰圖](https://profiler.firefox.com/docs/#/./guide-ui-tour-panels?id=the-flame-graph)、[堆疊圖](https://profiler.firefox.com/docs/#/./guide-ui-tour-panels?id=the-stack-chart)、[標記圖](https://profiler.firefox.com/docs/#/./guide-ui-tour-panels?id=the-marker-chart)和[網路圖](https://profiler.firefox.com/docs/#/./guide-ui-tour-panels?id=the-network-chart)。
- [使用內建分析器進行分析](https://profiler.firefox.com/docs/#/./guide-getting-started)
  - : 學習如何使用 Firefox 的內建分析器來分析應用程式效能。

## 參考資料

### HTML

- [`<picture>`](/zh-TW/docs/Web/HTML/Reference/Elements/picture) 元素
- [`<video>`](/zh-TW/docs/Web/HTML/Reference/Elements/video) 元素
- [`<source>`](/zh-TW/docs/Web/HTML/Reference/Elements/source) 元素
- [`<img>`](/zh-TW/docs/Web/HTML/Reference/Elements/img#attributes) 屬性（如 `srcset`）用於響應式圖片
- [`rel="preload"`](/zh-TW/docs/Web/HTML/Reference/Attributes/rel/preload) 屬性用於透過 HTML 預載內容

### CSS

- [will-change](/zh-TW/docs/Web/CSS/will-change)

### JavaScript

- [DOMContentLoaded](/zh-TW/docs/Web/API/Document/DOMContentLoaded_event)
- [垃圾回收](/zh-TW/docs/Glossary/Garbage_collection)
- [requestAnimationFrame](/zh-TW/docs/Web/API/Window/requestAnimationFrame)

### HTTP

- [Content-encoding](/zh-TW/docs/Web/HTTP/Reference/Headers/Content-Encoding)
- 透過 [dns-prefetch](/zh-TW/docs/Web/HTTP/Reference/Headers/X-DNS-Prefetch-Control)、[preconnect](/zh-TW/docs/Web/HTML/Reference/Attributes/rel/preconnect)、[prefetch](/zh-TW/docs/Glossary/Prefetch) 和 prerender 的資源提示
- [HTTP/2](/zh-TW/docs/Web/HTTP/Guides/Messages#http2_messages)
- [用戶端提示](/zh-TW/docs/Web/HTTP/Guides/Client_hints)

## 參見

- [響應式圖片](/zh-TW/docs/Web/HTML/Guides/Responsive_images) HTML 指南
- [Web Workers API](/zh-TW/docs/Web/API/Web_Workers_API)，包括[使用 Service Workers](/zh-TW/docs/Web/API/Service_Worker_API/Using_Service_Workers) 和[使用 Web Workers](/zh-TW/docs/Web/API/Web_Workers_API/Using_web_workers)
- [離線與背景操作](/zh-TW/docs/Web/Progressive_web_apps/Guides/Offline_and_background_operation)
- [快取](/zh-TW/docs/Web/HTTP/Guides/Caching)
- [用戶端提示](/zh-TW/docs/Web/HTTP/Guides/Client_hints)
- 術語：
  - {{glossary('Beacon', '信標')}}
  - {{glossary('Brotli compression', 'Brotli 壓縮')}}
  - {{glossary('CDN', '內容傳遞網路（CDN）')}}
  - {{glossary('CLS', '累計版面配置位移（CLS）')}}
  - {{glossary('Code splitting', '程式碼分割')}}
  - {{glossary('CSSOM')}}
  - {{glossary('Domain sharding', '網域分片')}}
  - {{glossary('Effective connection type', '有效連線類型')}}
  - {{glossary('First contentful paint', '首次內容繪製（FCP）')}}
  - {{glossary('First CPU idle', '首次 CPU 閒置')}}
  - {{glossary('First paint', '首次繪製')}}
  - {{glossary('gzip_compression', 'gzip 壓縮')}}
  - {{glossary('HTTP_2', 'HTTP/2')}}
  - {{glossary('HTTP')}}
  - {{glossary('Interaction to next paint', '下次繪製互動（INP）')}}
  - {{glossary('Jank', '卡頓')}}
  - {{glossary('Largest contentful paint', '最大內容繪製（LCP）')}}
  - {{glossary('Latency', '延遲')}}
  - {{glossary('Lazy load', '延遲載入')}}
  - {{glossary('Long task', '長任務')}}
  - {{glossary('Lossless compression', '無損壓縮')}}
  - {{glossary('Lossy compression', '有損壓縮')}}
  - {{glossary('Main thread', '主執行緒')}}
  - {{glossary('Minification', '最小化')}}
  - {{glossary('Network throttling', '網路節流')}}
  - {{glossary('Packet', '封包')}}
  - {{glossary('Page load time', '頁面載入時間')}}
  - {{glossary('Page prediction', '頁面預測')}}
  - {{glossary('Parse', '解析')}}
  - {{glossary('Perceived performance', '感知效能')}}
  - {{glossary('Prefetch', '預先擷取')}}
  - {{glossary('Prerender', '預先算繪')}}
  - {{glossary('QUIC')}}
  - {{glossary('RAIL')}}
  - {{glossary('Real User Monitoring', '真實使用者監控（RUM）')}}
  - {{glossary('Resource Timing', '資源計時')}}
  - {{glossary('Round Trip Time', '來回通訊時間（RTT）')}}
  - {{glossary('Server Timing', '伺服器計時')}}
  - {{glossary('Speculative parsing', '推測性解析')}}
  - {{glossary('Speed index', '速度指數')}}（以及感知速度指數）
  - {{glossary('SSL')}}
  - {{glossary('Synthetic monitoring', '綜合監控')}}
  - {{glossary('TCP handshake', 'TCP 交握')}}
  - {{glossary('TCP slow start', 'TCP 慢啟動')}}
  - {{glossary('TCP', '傳輸控制協定（TCP）')}}
  - {{glossary('Time to first byte', '首位元組時間（TTFB）')}}
  - {{glossary('Time to interactive', '可互動時間（TTI）')}}
  - {{glossary('TLS')}}
  - {{glossary('Tree shaking', '搖樹優化')}}
  - {{glossary('Web performance', '網頁效能')}}
- [Firefox 開發者工具中的效能](https://profiler.firefox.com/docs/#/)
