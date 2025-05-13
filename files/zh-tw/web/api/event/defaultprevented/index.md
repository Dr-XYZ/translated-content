---
title: "Event：defaultPrevented 屬性"
short-title: defaultPrevented
slug: Web/API/Event/defaultPrevented
page-type: web-api-instance-property
browser-compat: api.Event.defaultPrevented
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

{{domxref("Event")}} 介面的唯讀屬性 **`defaultPrevented`** 會回傳一個布林值，用以表示是否已透過呼叫 {{domxref("Event.preventDefault()")}} 取消事件。

## 值

一個布林值，若為 `true`，表示預設的 {{glossary("user agent")}} 行為已被阻止；若為 `false`，則表示預設行為未被阻止。

## 範例

此範例記錄從兩個 {{htmlElement("a")}} 元素嘗試開啟連結的行為。其中第二個連結會被 JavaScript 阻止點擊效果。

### HTML

```html
<p><a id="link1" href="#link1">造訪連結 1</a></p>
<p><a id="link2" href="#link2">嘗試造訪連結 2</a>（你無法點擊）</p>
<p id="log"></p>
```

### JavaScript

```js
function stopLink(event) {
  event.preventDefault();
}

function logClick(event) {
  const log = document.getElementById("log");

  if (event.target.tagName === "A") {
    log.innerText = event.defaultPrevented
      ? `抱歉，你無法造訪這個連結！\n${log.innerText}`
      : `正在造訪連結…\n${log.innerText}`;
  }
}

const a = document.getElementById("link2");
a.addEventListener("click", stopLink);
document.addEventListener("click", logClick);
```

### 結果

{{EmbedLiveSample("Example")}}

## 規範

{{Specifications}}

## 瀏覽器相容性

{{Compat}}
