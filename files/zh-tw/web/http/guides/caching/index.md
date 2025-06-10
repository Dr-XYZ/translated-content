---
title: HTTP 快取
slug: Web/HTTP/Guides/Caching
page-type: guide
---

{{HTTPSidebar}}

HTTP 快取會儲存與請求相關的回應，並在後續請求中重用已儲存的回應。

可重用性有幾個優點。首先，由於不需要將請求傳遞到來源伺服器，用戶端和快取越近，回應就越快。最典型的例子是瀏覽器本身為瀏覽器請求儲存快取。

此外，當回應可重用時，來源伺服器不需要處理請求——因此它不需要解析和路由請求、根據 cookie 還原工作階段、查詢資料庫以取得結果，或算繪樣板引擎。這減少了伺服器的負載。

快取的正常運作對系統的健康至關重要。

## 快取類型

在 [HTTP Caching](https://httpwg.org/specs/rfc9111.html) 規範中，有兩種主要類型的快取：**私有快取**和**共享快取**。

### 私有快取

私有快取是與特定用戶端綁定的快取——通常是瀏覽器快取。由於儲存的回應不與其他用戶端共享，私有快取可以為該使用者儲存個人化回應。

另一方面，如果個人化內容儲存在私有快取以外的快取中，那麼其他使用者可能會擷取到這些內容——這可能會導致無意的資訊洩漏。

如果回應包含個人化內容，且你只想將回應儲存在私有快取中，則必須指定 `private` 指令。

```http
Cache-Control: private
```

個人化內容通常由 cookie 控制，但 cookie 的存在並不總是表示它是私有的，因此僅憑 cookie 並不能使回應成為私有。

### 共享快取

共享快取位於用戶端和伺服器之間，可以儲存可在使用者之間共享的回應。共享快取可以進一步細分為**代理伺服器快取**和**受控快取**。

#### 代理伺服器快取

除了存取控制的功能外，一些代理伺服器還會實作快取以減少網路外部的流量。這通常不由服務開發者管理，因此必須由適當的 HTTP 標頭等來控制。然而，在過去，過時的代理伺服器快取實作——例如那些不能正確理解 HTTP 快取標準的實作——經常給開發者帶來問題。

像下面這樣的**大雜燴標頭**被用來試圖解決那些不理解當前 HTTP 快取規範指令（如 `no-store`）的「老舊且未更新的代理伺服器快取」實作。

```http
Cache-Control: no-store, no-cache, max-age=0, must-revalidate, proxy-revalidate
```

然而，近年來，隨著 HTTPS 變得更加普遍，用戶端／伺服器通訊變得加密，路徑中的代理伺服器快取在許多情況下只能隧道化回應，而不能作為快取。因此，在這種情況下，無需擔心那些甚至看不到回應的過時代理伺服器快取實作。

另一方面，如果一個 {{Glossary("TLS", "TLS")}} 橋接代理伺服器透過在個人電腦上安裝由組織管理的 {{Glossary("Certificate_authority", "CA（憑證授權中心）")}} 的憑證，以中間人方式解密所有通訊，並執行存取控制等——它就有可能看到回應的內容並將其快取。然而，由於近年來 [CT（憑證透明度）](/zh-TW/docs/Web/Security/Certificate_Transparency) 已變得普遍，且一些瀏覽器只允許使用帶有 SCT（簽署憑證時間戳）的憑證，這種方法需要應用企業政策。在這樣一個受控的環境中，無需擔心代理伺服器快取會「過時且未更新」。

#### 受控快取

受控快取由服務開發者明確部署，以卸載來源伺服器的負載並有效率地傳遞內容。例子包括反向代理伺服器、CDN，以及與 Cache API 結合使用的 Service Worker。

受控快取的特性因部署的產品而異。在大多數情況下，你可以透過 `Cache-Control` 標頭和你自己的組態檔或儀表板來控制快取的行為。

例如，HTTP 快取規範基本上沒有定義明確刪除快取的方法——但對於受控快取，儲存的回應可以隨時透過儀表板操作、API 呼叫、重新啟動等方式刪除。這允許更主動的快取策略。

也可以忽略標準的 HTTP 快取規範協定，轉而採用明確的操作。例如，可以指定以下內容以選擇退出私有快取或代理伺服器快取，同時使用你自己的策略僅在受控快取中進行快取。

```http
Cache-Control: no-store
```

例如，Varnish Cache 使用 VCL（Varnish 組態語言，一種 {{Glossary("DSL/Domain_specific_language", "DSL")}}）邏輯來處理快取儲存，而與 Cache API 結合使用的 Service Worker 則允許你用 JavaScript 建立該邏輯。

這意味著，如果一個受控快取故意忽略 `no-store` 指令，沒有必要將其視為「不符合」標準。你應該做的是，避免使用大雜燴標頭，而是仔細閱讀你正在使用的任何受控快取機制的說明文件，並確保你以該機制提供的方式正確控制快取。

請注意，一些 CDN 提供了自己的標頭，這些標頭僅對該 CDN 有效（例如 `Surrogate-Control`）。目前，正在進行定義 [`CDN-Cache-Control`](https://httpwg.org/specs/rfc9213.html) 標頭的工作，以將其標準化。

![快取類型，包括瀏覽器中的私有快取、共享（代理伺服器）快取、反向代理伺服器快取，以及 CDN 中的共享（受控）快取，最終指向來源伺服器的快取](https://mdn.github.io/shared-assets/images/diagrams/http/cache/type-of-cache.svg)

## 啟發式快取

HTTP 的設計是盡可能地快取，所以即使沒有給定 `Cache-Control`，如果滿足某些條件，回應也會被儲存和重用。這被稱為**啟發式快取**。

例如，看以下的回應。這個回應最後一次更新是在 1 年前。

```http
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 1024
Date: Tue, 22 Feb 2022 22:22:22 GMT
Last-Modified: Tue, 22 Feb 2021 22:22:22 GMT

<!doctype html>
…
```

根據啟發式規則，我們知道一年未更新的內容在此後的一段時間內也不會更新。因此，用戶端會儲存這個回應（儘管缺乏 `max-age`）並重用一段時間。重用多長時間取決於實作，但規範建議大約是儲存後時間的 10%（在本例中為 0.1 年）。

啟發式快取是在 `Cache-Control` 支援被廣泛採用之前的一種權宜之計，基本上所有的回應都應該明確指定一個 `Cache-Control` 標頭。

## 基於存留時間的新鮮與過時

儲存的 HTTP 回應有兩種狀態：**新鮮**和**過時**。_新鮮_狀態通常表示回應仍然有效且可以重用，而_過時_狀態則表示快取的回應已經過期。

判斷回應是新鮮還是過時的標準是**存留時間**。在 HTTP 中，存留時間是自回應生成以來經過的時間。這類似於其他快取機制中的 {{Glossary("TTL", "TTL")}}。

看以下的回應範例（604800 秒為一週）：

```http
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 1024
Date: Tue, 22 Feb 2022 22:22:22 GMT
Cache-Control: max-age=604800

<!doctype html>
…
```

儲存範例回應的快取會計算自回應生成以來經過的時間，並將結果作為回應的_存留時間_。

對於範例回應，`max-age` 的意思是：

- 如果回應的存留時間_小於_一週，則回應是_新鮮的_。
- 如果回應的存留時間_大於_一週，則回應是_過時的_。

只要儲存的回應保持新鮮，它就會被用來滿足用戶端請求。

當回應儲存在共享快取中時，可以告知用戶端回應的存留時間。繼續以上面的例子，如果共享快取儲存了回應一天，共享快取會向後續的用戶端請求發送以下回應。

```http
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 1024
Date: Tue, 22 Feb 2022 22:22:22 GMT
Cache-Control: max-age=604800
Age: 86400

<!doctype html>
…
```

接收到該回應的用戶端會發現它在剩餘的 518400 秒內是新鮮的，這是回應的 `max-age` 和 `Age` 之間的差值。

## Expires 或 max-age

在 HTTP/1.0 中，新鮮度過去是由 `Expires` 標頭指定的。

`Expires` 標頭使用明確的時間而不是指定經過的時間來指定快取的生命週期。

```http
Expires: Tue, 28 Feb 2022 22:22:22 GMT
```

然而，時間格式難以解析，發現了許多實作錯誤，並且可以透過故意改變系統時鐘來引發問題；因此，在 HTTP/1.1 中，`Cache-Control` 採用了 `max-age`——用於指定經過的時間。

如果 `Expires` 和 `Cache-Control: max-age` 都可用，則定義為優先使用 `max-age`。因此，既然 HTTP/1.1 已被廣泛使用，就沒有必要提供 `Expires` 了。

## Vary

回應之間區分的方式基本上是基於它們的 URL：

| URL | 回應主體 |
| --- | --- |
| `https://example.com/index.html` | `<!doctype html>...` |
| `https://example.com/style.css` | `body { ...` |
| `https://example.com/script.js` | `function main () { ...` |

但即使 URL 相同，回應的內容也並不總是相同的。特別是當執行內容協商時，來自伺服器的回應可能取決於 `Accept`、`Accept-Language` 和 `Accept-Encoding` 請求標頭的值。

例如，對於以 `Accept-Language: en` 標頭回傳並快取的英文內容，不希望將該快取的回應重用於具有 `Accept-Language: ja` 請求標頭的請求。在這種情況下，你可以透過將 `Accept-Language` 加入到 `Vary` 標頭的值中，使回應根據語言分開快取。

```http
Vary: Accept-Language
```

這會導致快取基於回應 URL 和 `Accept-Language` 請求標頭的複合鍵，而不是僅基於回應 URL。

| URL | `Accept-Language` | 回應主體 |
| --- | --- | --- |
| `https://example.com/index.html` | `ja-JP` | `<!doctype html>...` |
| `https://example.com/index.html` | `en-US` | `<!doctype html>...` |
| `https://example.com/style.css` | `ja-JP` | `body { ...` |
| `https://example.com/script.js` | `ja-JP` | `function main () { ...` |

此外，如果你正在根據使用者代理提供內容優化（例如，用於響應式設計），你可能會想在 `Vary` 標頭的值中包含 `User-Agent`。然而，`User-Agent` 請求標頭通常有非常多的變體，這會大大降低快取被重用的機會。因此，如果可能的話，請考慮一種基於功能偵測而不是基於 `User-Agent` 請求標頭來改變行為的方法。

對於使用 cookie 來防止他人重用快取的個人化內容的應用程式，你應該指定 `Cache-Control: private` 而不是為 `Vary` 指定 cookie。

## 驗證

過時的回應不會立即被丟棄。HTTP 有一種機制，可以透過詢問來源伺服器將過時的回應轉換為新鮮的回應。這被稱為**驗證**，有時也稱為**重新驗證**。

驗證是透過使用包含 `If-Modified-Since` 或 `If-None-Match` 請求標頭的**條件式請求**來完成的。

### If-Modified-Since

以下回應是在 22:22:22 生成的，`max-age` 為 1 小時，所以你知道它在 23:22:22 之前是新鮮的。

```http
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 1024
Date: Tue, 22 Feb 2022 22:22:22 GMT
Last-Modified: Tue, 22 Feb 2022 22:00:00 GMT
Cache-Control: max-age=3600

<!doctype html>
…
```

在 23:22:22，回應變得過時，快取無法重用。因此，下面的請求顯示用戶端發送一個帶有 `If-Modified-Since` 請求標頭的請求，以詢問伺服器自指定時間以來是否有任何更改。

```http
GET /index.html HTTP/1.1
Host: example.com
Accept: text/html
If-Modified-Since: Tue, 22 Feb 2022 22:00:00 GMT
```

如果內容自指定時間以來沒有更改，伺服器將以 `304 Not Modified` 回應。

由於此回應僅表示「無更改」，因此沒有回應主體——只有一個狀態碼——所以傳輸大小非常小。

```http
HTTP/1.1 304 Not Modified
Content-Type: text/html
Date: Tue, 22 Feb 2022 23:22:22 GMT
Last-Modified: Tue, 22 Feb 2022 22:00:00 GMT
Cache-Control: max-age=3600
```

收到該回應後，用戶端將儲存的過時回應還原為新鮮狀態，並可以在剩餘的 1 小時內重用它。

伺服器可以從作業系統檔案系統中獲取修改時間，這對於提供靜態檔案的情況相對容易。然而，存在一些問題；例如，時間格式複雜且難以解析，分散式伺服器難以同步檔案更新時間。

為了解決這些問題，`ETag` 回應標頭被標準化為替代方案。

### ETag/If-None-Match

`ETag` 回應標頭的值是伺服器生成的任意值。對於伺服器必須如何生成該值沒有限制，因此伺服器可以自由地根據他們選擇的任何方式設定該值——例如主體內容的雜湊值或版本號。

舉個例子，如果使用雜湊值作為 `ETag` 標頭，且 `index.html` 資源的雜湊值為 `33a64df5`，則回應將如下所示：

```http
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 1024
Date: Tue, 22 Feb 2022 22:22:22 GMT
ETag: "33a64df5"
Cache-Control: max-age=3600

<!doctype html>
…
```

如果該回應過時，用戶端會取用快取回應的 `ETag` 回應標頭的值，並將其放入 `If-None-Match` 請求標頭中，以詢問伺服器資源是否已被修改：

```http
GET /index.html HTTP/1.1
Host: example.com
Accept: text/html
If-None-Match: "33a64df5"
```

如果伺服器為請求的資源確定的 `ETag` 標頭值與請求中的 `If-None-Match` 值相同，伺服器將回傳 `304 Not Modified`。

但如果伺服器確定請求的資源現在應該有不同的 `ETag` 值，伺服器將改為以 `200 OK` 和最新版本的資源回應。

> [!NOTE]
> RFC9110 偏好伺服器在可能的情況下，為 `200` 回應同時發送 `ETag` 和 `Last-Modified`。
> 在快取重新驗證期間，如果 `If-Modified-Since` 和 `If-None-Match` 都存在，則 `If-None-Match` 優先於驗證器。
> 如果你只考慮快取，你可能會認為 `Last-Modified` 是不必要的。
> 然而，`Last-Modified` 不僅對快取有用；它是一個標準的 HTTP 標頭，也被內容管理系統（CMS）用來顯示最後修改時間，被爬蟲用來調整爬取頻率，以及用於其他各種目的。
> 因此，考慮到整個 HTTP 生態系，最好同時提供 `ETag` 和 `Last-Modified`。

### 強制重新驗證

如果你不希望重用回應，而是希望總是從伺服器獲取最新的內容，你可以使用 `no-cache` 指令來強制驗證。

透過在回應中加入 `Cache-Control: no-cache` 以及 `Last-Modified` 和 `ETag`——如下所示——如果請求的資源已更新，用戶端將收到 `200 OK` 回應，否則如果請求的資源未更新，則會收到 `304 Not Modified` 回應。

```http
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 1024
Date: Tue, 22 Feb 2022 22:22:22 GMT
Last-Modified: Tue, 22 Feb 2022 22:00:00 GMT
ETag: "deadbeef"
Cache-Control: no-cache

<!doctype html>
…
```

通常有人說 `max-age=0` 和 `must-revalidate` 的組合與 `no-cache` 的意義相同。

```http
Cache-Control: max-age=0, must-revalidate
```

`max-age=0` 意味著回應立即過時，而 `must-revalidate` 意味著一旦過時，就必須在重新驗證後才能重用——因此，組合起來，語義似乎與 `no-cache` 相同。

然而，`max-age=0` 的這種用法是許多 HTTP/1.1 之前的實作無法處理 `no-cache` 指令這一事實的殘留物——因此為了處理這個限制，`max-age=0` 被用作權宜之計。

但現在符合 HTTP/1.1 的伺服器已廣泛部署，沒有理由再使用 `max-age=0` 和 `must-revalidate` 的組合——你應該直接使用 `no-cache`。

## 不要快取

`no-cache` 指令不會阻止儲存回應，而是阻止在未經驗證的情況下重用回應。

如果你不希望回應儲存在任何快取中，請使用 `no-store`。

```http
Cache-Control: no-store
```

然而，一般來說，實務中的「不要快取」要求相當於以下一組情況：

- 出於隱私原因，不希望回應被特定用戶端以外的任何人儲存。
- 希望總是提供最新的資訊。
- 不知道在過時的實作中可能會發生什麼。

在這一組情況下，`no-store` 並不總是最適當的指令。

以下各節將更詳細地探討這些情況。

### 不要與他人共享

如果帶有個人化內容的回應意外地對快取的其他使用者可見，那將會是個問題。

在這種情況下，使用 `private` 指令將導致個人化回應只儲存在特定用戶端中，而不會洩漏給快取的任何其他使用者。

```http
Cache-Control: private
```

在這種情況下，即使給定了 `no-store`，也必須同時給定 `private`。

### 每次都提供最新的內容

`no-store` 指令阻止回應被儲存，但不會刪除任何已為相同 URL 儲存的回應。

換句話說，如果特定 URL 已有舊的回應儲存，回傳 `no-store` 並不會阻止舊的回應被重用。

然而，`no-cache` 指令會強制用戶端在重用任何儲存的回應之前發送驗證請求。

```http
Cache-Control: no-cache
```

如果伺服器不支援條件式請求，你可以強制用戶端每次都存取伺服器，並總是得到帶有 `200 OK` 的最新回應。

### 處理過時的實作

作為對忽略 `no-store` 的過時實作的權宜之計，你可能會看到使用如下的大雜燴標頭。

```http
Cache-Control: no-store, no-cache, max-age=0, must-revalidate, proxy-revalidate
```

[建議](https://learn.microsoft.com/en-us/previous-versions/troubleshoot/browsers/connectivity-navigation/how-to-prevent-caching)使用 `no-cache` 作為處理此類過時實作的替代方案，並且如果從一開始就給定 `no-cache` 也沒有問題，因為伺服器總是會收到請求。

如果你擔心的是共享快取，你可以透過同時加入 `private` 來確保防止意外的快取：

```http
Cache-Control: no-cache, private
```

### `no-store` 會失去什麼

你可能會認為加入 `no-store` 是選擇退出快取的正確方法。

然而，不建議隨意授予 `no-store`，因為你會失去 HTTP 和瀏覽器擁有的許多優勢，包括瀏覽器的上一頁／下一頁快取。

因此，為了獲得 Web 平台完整功能集的優勢，請優先使用 `no-cache` 與 `private` 的組合。

## 重新載入與強制重新載入

驗證可以針對請求和回應進行。

**重新載入**和**強制重新載入**操作是從瀏覽器端執行驗證的常見範例。

### 重新載入

為了從視窗損壞中恢復或更新到資源的最新版本，瀏覽器為使用者提供了重新載入功能。

瀏覽器重新載入期間發送的 HTTP 請求的簡化視圖如下所示：

```http
GET / HTTP/1.1
Host: example.com
Cache-Control: max-age=0
If-None-Match: "deadbeef"
If-Modified-Since: Tue, 22 Feb 2022 20:20:20 GMT
```

（來自 Chrome、Edge 和 Firefox 的請求看起來非常像上面這樣；來自 Safari 的請求會有些不同。）

請求中的 `max-age=0` 指令指定「重用存留時間為 0 或更短的回應」——因此，實際上，中間儲存的回應不會被重用。

結果，請求由 `If-None-Match` 和 `If-Modified-Since` 進行驗證。

這種行為也在 [Fetch](https://fetch.spec.whatwg.org/#http-network-or-cache-fetch) 標準中定義，並且可以透過呼叫 `fetch()` 並將快取模式設定為 `no-cache` 在 JavaScript 中重現（注意 `reload` 不是這種情況下的正確模式）：

```js
// 注意：「reload」不是正常重新載入的正確模式；「no-cache」才是
fetch("/", { cache: "no-cache" });
```

### 強制重新載入

瀏覽器在重新載入期間使用 `max-age=0` 是出於向後相容的原因——因為許多 HTTP/1.1 之前的過時實作不理解 `no-cache`。但 `no-cache` 現在在這種使用情況下是沒問題的，而**強制重新載入**是繞過快取回應的另一種方法。

瀏覽器**強制重新載入**期間的 HTTP 請求如下所示：

```http
GET / HTTP/1.1
Host: example.com
Pragma: no-cache
Cache-Control: no-cache
```

（來自 Chrome、Edge 和 Firefox 的請求看起來非常像上面這樣；來自 Safari 的請求會有些不同。）

由於這不是帶有 `no-cache` 的條件式請求，你可以確定你會從來源伺服器得到一個 `200 OK`。

這種行為也在 [Fetch](https://fetch.spec.whatwg.org/#http-network-or-cache-fetch) 標準中定義，並且可以透過呼叫 `fetch()` 並將快取模式設定為 `reload` 在 JavaScript 中重現（注意它不是 `force-reload`）：

```js
// 注意：「reload」——而不是「no-cache」——才是「強制重新載入」的正確模式
fetch("/", { cache: "reload" });
```

### 避免重新驗證

永不改變的內容應該透過使用快取破壞給予一個長的 `max-age`——也就是說，在請求 URL 中包含版本號、雜湊值等。

然而，當使用者重新載入時，即使伺服器知道內容是不可變的，也會發送重新驗證請求。

為了防止這種情況，可以使用 `immutable` 指令來明確表示不需要重新驗證，因為內容永不改變。

```http
Cache-Control: max-age=31536000, immutable
```

這可以防止在重新載入期間不必要的重新驗證。

請注意，[Chrome 已經改變了其實作](https://blog.chromium.org/2017/01/reload-reloaded-faster-and-leaner-page_26.html)，而不是實作這個指令，以便在重新載入子資源時不執行重新驗證。

## 刪除已儲存的回應

沒有辦法刪除中間伺服器上已用長 `max-age` 儲存的回應。

想像一下，來自 `https://example.com/` 的以下回應被儲存了。

```http
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 1024
Cache-Control: max-age=31536000

<!doctype html>
…
```

你可能希望在伺服器上過期後覆蓋該回應，但一旦回應被儲存，伺服器就無能為力了——因為由於快取，沒有更多的請求到達伺服器。

規範中提到的一種方法是使用不安全的方法（如 `POST`）向同一個 URL 發送請求，但對於許多用戶端來說，這很難做到。

[`Clear-Site-Data: cache`](/zh-TW/docs/Web/HTTP/Headers/Clear-Site-Data#cache) 標頭和指令值可以用來清除瀏覽器快取——但對中間快取沒有影響。
否則，回應將保留在瀏覽器快取中，直到 `max-age` 過期，除非使用者手動執行重新載入、強制重新載入或清除歷史紀錄操作。

快取減少了對伺服器的存取，這意味著伺服器失去了對該 URL 的控制。如果伺服器不想失去對 URL 的控制——例如，在資源頻繁更新的情況下——你應該加入 `no-cache`，這樣伺服器總是會收到請求並發送預期的回應。

## 請求摺疊

共享快取主要位於來源伺服器之前，旨在減少到來源伺服器的流量。

因此，如果多個相同的請求同時到達共享快取，中間快取將代表自己向來源伺服器轉發單一請求，然後可以將結果重用於所有用戶端。這被稱為_**請求摺疊**_。

請求摺疊發生在請求同時到達時，所以即使在回應中給定了 `max-age=0` 或 `no-cache`，它也會被重用。

如果回應是針對特定使用者個人化的，並且你不希望它在摺疊中被共享，你應該加入 `private` 指令：

![請求摺疊示意圖，顯示多個用戶端發送 GET 請求，而快取將它們合併為一個對來源伺服器的 GET 請求。來源伺服器以 200 OK 回應，快取再將此回應分享給所有用戶端。](https://mdn.github.io/shared-assets/images/diagrams/http/cache/request-collapse.svg)

## 常見的快取模式

`Cache-Control` 規範中有許多指令，可能很難理解所有指令。但大多數網站可以由少數幾種模式的組合來涵蓋。

本節描述了設計快取時的常見模式。

### 預設設定

如上所述，快取的預設行為（即，對於沒有 `Cache-Control` 的回應）不僅僅是「不快取」，而是根據所謂的「啟發式快取」進行隱式快取。

為了避免這種啟發式快取，最好明確地為所有回應提供一個預設的 `Cache-Control` 標頭。

為了確保預設情況下總是傳輸最新版本的資源，通常的做法是讓預設的 `Cache-Control` 值包含 `no-cache`：

```http
Cache-Control: no-cache
```

此外，如果服務實作了 cookie 或其他登入方法，並且內容是為每個使用者個人化的，也必須給定 `private`，以防止與其他使用者共享：

```http
Cache-Control: no-cache, private
```

### 快取破壞

最適合快取的資源是內容永不改變的靜態不可變檔案。而對於_確實_會改變的資源，一個常見的最佳實踐是每次內容改變時都改變 URL，這樣 URL 單元就可以被快取更長的時間。

舉個例子，考慮以下 HTML：

```html
<script src="bundle.js"></script>
<link rel="stylesheet" href="build.css" />
<body>
  hello
</body>
```

在現代 Web 開發中，隨著開發的進展，JavaScript 和 CSS 資源會頻繁更新。此外，如果用戶端使用的 JavaScript 和 CSS 資源版本不同步，顯示將會出錯。

因此，上面的 HTML 使得用 `max-age` 快取 `bundle.js` 和 `build.css` 變得困難。

因此，你可以用包含基於版本號或雜湊值的變化部分的 URL 來提供 JavaScript 和 CSS。下面顯示了一些方法。

```plain
# 檔名中的版本
bundle.v123.js

# 查詢中的版本
bundle.js?v=123

# 檔名中的雜湊值
bundle.YsAIAAAA-QG4G6kCMAMBAAAAAAAoK.js

# 查詢中的雜湊值
bundle.js?v=YsAIAAAA-QG4G6kCMAMBAAAAAAAoK
```

由於快取是根據 URL 來區分資源的，所以如果資源更新時 URL 改變，快取將不會再被重用。

```html
<script src="bundle.v123.js"></script>
<link rel="stylesheet" href="build.v123.css" />
<body>
  hello
</body>
```

透過這種設計，JavaScript 和 CSS 資源都可以被快取很長一段時間。那麼 `max-age` 應該設定多長呢？QPACK 規範為這個問題提供了答案。

[QPACK](https://datatracker.ietf.org/doc/html/rfc9204) 是一個壓縮 HTTP 標頭欄位的標準，定義了常用欄位值的表格。

下面顯示了一些常用的快取標頭值。

```plain
36 cache-control max-age=0
37 cache-control max-age=604800
38 cache-control max-age=2592000
39 cache-control no-cache
40 cache-control no-store
41 cache-control public, max-age=31536000
```

如果你選擇其中一個編號的選項，當透過 HTTP3 傳輸時，你可以在 1 個位元組內壓縮值。

編號 `37`、`38` 和 `41` 分別對應一週、一個月和一年。

因為快取在保存新條目時會移除舊條目，所以即使 `max-age` 設定為 1 週，儲存的回應在一週後仍然存在的機率並不是那麼高。因此，在實務中，你選擇哪一個並沒有太大區別。

請注意，編號 `41` 的 `max-age` 最長（1 年），但帶有 `public`。

`public` 值的作用是即使 `Authorization` 標頭存在，也使回應可儲存。

> [!NOTE]
> `public` 指令只應在 `Authorization` 標頭設定時有儲存回應的需求時使用。否則它不是必需的，因為只要給定了 `max-age`，回應就會儲存在共享快取中。

因此，如果回應是透過基本驗證個人化的，`public` 的存在可能會導致問題。如果你擔心這一點，你可以選擇第二長的值，`38`（1 個月）。

```http
# bundle.v123.js 的回應

# 如果你從不透過 Authorization 個人化回應
Cache-Control: public, max-age=31536000

# 如果你不能確定
Cache-Control: max-age=2592000
```

### 驗證

不要忘記設定 `Last-Modified` 和 `ETag` 標頭，這樣在重新載入時就不必重新傳輸資源。為預先建置的靜態檔案生成這些標頭很容易。

這裡的 `ETag` 值可以是檔案的雜湊值。

```http
# bundle.v123.js 的回應
Last-Modified: Tue, 22 Feb 2022 20:20:20 GMT
ETag: "YsAIAAAA-QG4G6kCMAMBAAAAAAAoK"
```

此外，可以加入 `immutable` 以防止在重新載入時進行驗證。

組合後的結果如下所示。

```http
# bundle.v123.js
HTTP/1.1 200 OK
Content-Type: text/javascript
Content-Length: 1024
Cache-Control: public, max-age=31536000, immutable
Last-Modified: Tue, 22 Feb 2022 20:20:20 GMT
ETag: "YsAIAAAA-QG4G6kCMAMBAAAAAAAoK"
```

**快取破壞**是一種透過在內容改變時改變 URL 來使回應可長時間快取的技術。該技術可以應用於所有子資源，例如圖片。

> [!NOTE]
> 在評估 `immutable` 和 QPACK 的使用時：
> 如果你擔心 `immutable` 會改變 QPACK 提供的預定義值，請考慮在這種情況下，可以將 `Cache-Control` 值分成兩行，從而單獨編碼 `immutable` 部分——儘管這取決於特定 QPACK 實作所使用的編碼演算法。

```http
Cache-Control: public, max-age=31536000
Cache-Control: immutable
```

### 主要資源

與子資源不同，主要資源不能進行快取破壞，因為它們的 URL 不能像子資源的 URL 那樣被修飾。

如果以下 HTML 本身被儲存，即使內容在伺服器端更新，也無法顯示最新版本。

```html
<script src="bundle.v123.js"></script>
<link rel="stylesheet" href="build.v123.css" />
<body>
  hello
</body>
```

在這種情況下，`no-cache` 會比 `no-store` 更合適——因為我們不想儲存 HTML，而只是希望它總是保持最新。

此外，加入 `Last-Modified` 和 `ETag` 將允許用戶端發送條件式請求，如果 HTML 沒有更新，可以回傳 `304 Not Modified`：

```http
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 1024
Cache-Control: no-cache
Last-Modified: Tue, 22 Feb 2022 20:20:20 GMT
ETag: "AAPuIbAOdvAGEETbgAAAAAAABAAE"
```

這個設定適用於非個人化的 HTML，但對於使用 cookie 個人化的回應——例如，登入後——不要忘記同時指定 `private`：

```http
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 1024
Cache-Control: no-cache, private
Last-Modified: Tue, 22 Feb 2022 20:20:20 GMT
ETag: "AAPuIbAOdvAGEETbgAAAAAAABAAE"
Set-Cookie: __Host-SID=AHNtAyt3fvJrUL5g5tnGwER; Secure; Path=/; HttpOnly
```

同樣的方法可以用於 `favicon.ico`、`manifest.json`、`.well-known`，以及無法使用快取破壞改變 URL 的 API 端點。

大多數 Web 內容可以由上述兩種模式的組合來涵蓋。

### 更多關於受控快取

使用前面章節中描述的方法，子資源可以透過使用快取破壞來長時間快取，但主要資源（通常是 HTML 文件）卻不能。

快取主要資源很困難，因為僅使用 HTTP 快取規範中的標準指令，沒有辦法在伺服器上內容更新時主動刪除快取內容。

然而，透過部署像 CDN 或 Service Worker 這樣的受控快取是可能的。

例如，一個允許透過 API 或儀表板操作清除快取的 CDN，將允許更積極的快取策略，即儲存主要資源，並僅在伺服器上發生更新時明確清除相關快取。

如果 Service Worker 能夠在伺服器上發生更新時刪除 Cache API 中的內容，它也可以做同樣的事情。

有關更多資訊，請參閱你的 CDN 的文件，並查閱 [Service Worker 文件](/zh-TW/docs/Web/API/Service_Worker_API)。

## 參見

- [RFC 9111: Hypertext Transfer Protocol (HTTP/1.1): Caching](https://datatracker.ietf.org/doc/html/RFC9111)
- [Caching Tutorial - Mark Nottingham](https://www.mnot.net/cache_docs/)
