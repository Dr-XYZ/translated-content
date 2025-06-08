---
title: 如何撰寫 HTTP 標頭文件
short-title: 撰寫 HTTP 標頭文件
slug: MDN/Writing_guidelines/Howto/Document_an_HTTP_header
page-type: mdn-writing-guide
sidebar: mdnsidebar
---

[HTTP 標頭參考](/zh-TW/docs/Web/HTTP/Reference/Headers)文件涵蓋了超文本傳輸協定（[HTTP](/zh-TW/docs/Web/HTTP)）中請求與回應訊息的標頭區段。本文說明如何為 HTTP 標頭建立新的參考頁面。

## 步驟 1 – 決定要撰寫的 HTTP 標頭

- 許多 HTTP 標頭定義於各種 IETF 標準中。
- IANA 維護一份 [HTTP 標頭欄位註冊表](https://www.iana.org/assignments/http-fields/http-fields.xhtml)，而維基百科列出了 [已知的標頭欄位](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields)，但不是所有標頭都與網頁開發者相關，或都屬於官方標準。
- 如果在目前的[HTTP 標頭參考總覽頁面](/zh-TW/docs/Web/HTTP/Reference/Headers)中看到任何**紅色連結**，這些標頭就是很適合撰寫的對象。
- 如果不確定要寫哪一個標頭，[請詢問 MDN Web Docs 團隊](/zh-TW/docs/MDN/Community/Communication_channels)，確認你選擇的標頭是否值得撰寫。

## 步驟 2 – 檢查現有的 HTTP 標頭頁面

- 現有的 HTTP 標頭已記錄於 [HTTP 參考文件](/zh-TW/docs/Web/HTTP/Reference/Headers)中。
- 標頭有不同的分類：{{Glossary("Request header")}}、{{Glossary("Response header")}} 與 {{Glossary("Representation header")}}。
- 找出你要撰寫的標頭所屬的類別（注意：有些標頭依上下文可能同時是請求與回應標頭）。
- 前往屬於相同類別的現有標頭參考頁面。

## 步驟 3 – 建立 HTTP 標頭頁面

- 所有標頭頁面都位於此目錄下：[`files/en-us/web/http/reference/headers`](https://github.com/mdn/content/tree/main/files/en-us/web/http/reference/headers)
- 要建立新頁面，請參考我們的[如何建立頁面](/zh-TW/docs/MDN/Writing_guidelines/Howto/Creating_moving_deleting)指引。

## 步驟 4 – 撰寫內容

- 你可以選擇從我們的[HTTP 標頭頁面範本](/zh-TW/docs/MDN/Writing_guidelines/Page_structures/Page_types#http_header_reference_page)開始，或使用你在步驟 2 中找到的現有標頭文件結構。任你選擇。
- 撰寫新 HTTP 標頭的內容。
- 確保包含以下章節：

  - 引言段落，其第一句需提及標頭名稱（加粗）並簡要說明其用途。
  - 資訊框，至少應包含標頭類型，以及該標頭是否為 {{Glossary("Forbidden request header")}}。
  - 語法框，列出該 HTTP 標頭所有可能的指令、參數或值。
  - 解釋上述指令與值的章節。
  - 範例章節，展示此標頭的實際使用情境或其常見出現位置與方式。
  - 規範章節，列出相關的 RFC 標準文件。
  -「參見」章節，列出相關資源。

## 步驟 5 – 加入瀏覽器相容性資訊

- 如果你參考過其他 HTTP 標頭頁面，會發現它們使用 `{{Compat}}` 巨集來自動產生瀏覽器相容性表格。
- 相容性表格頁面來自結構化資料。如果你希望貢獻這些資料，請參考 <https://github.com/mdn/browser-compat-data/blob/main/README.md> 並送出 pull request。

## 步驟 6 – 更新 HTTP 標頭清單

請確認你所撰寫的標頭已列於[HTTP 標頭參考總覽頁面](/zh-TW/docs/Web/HTTP/Reference/Headers)的適當分類中。

## 步驟 7 – 提交內容供審查

建立完標頭頁面後，請提交 pull request。審查團隊成員會自動分配審查你的頁面。