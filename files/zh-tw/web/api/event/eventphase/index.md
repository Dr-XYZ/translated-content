---
title: Event：eventPhase 屬性
short-title: eventPhase
slug: Web/API/Event/eventPhase
page-type: web-api-instance-property
browser-compat: api.Event.eventPhase
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

{{domxref("Event")}} 介面的唯讀屬性 **`eventPhase`** 表示目前正在處理事件流程中的哪個階段。

## 值

回傳一個整數值，表示事件流程中目前的處理階段。可能的值如下：

- `Event.NONE`（0）
  - ：事件目前未被處理。
- `Event.CAPTURING_PHASE`（1）
  - ：事件正在從目標元素的祖先物件進行捕獲階段的傳遞。這個過程從 {{domxref("Window")}} 開始，然後是 {{domxref("Document")}}，接著是 {{domxref("HTMLHtmlElement")}}，依此類推，直到到達事件目標的父元素。在呼叫 {{domxref("EventTarget.addEventListener()")}} 時使用捕獲模式所註冊的 {{domxref("EventTarget/addEventListener", "事件監聽器", "", 1)}} 會在此階段觸發。
- `Event.AT_TARGET`（2）
  - ：事件已到達{{domxref("EventTarget", "事件的目標", "", 1)}}。在此階段所註冊的監聽器會被觸發。如果 {{domxref("Event.bubbles")}} 為 `false`，那麼事件在此階段完成處理。
- `Event.BUBBLING_PHASE`（3）
  - ：事件正在從目標元素的祖先節點向上傳遞，順序與捕獲階段相反，從父元素開始，一直到最外層的 {{domxref("Window")}}。這稱為_冒泡_，僅在 {{domxref("Event.bubbles")}} 為 `true` 時發生。在此階段註冊的 {{domxref("EventTarget/addEventListener", "事件監聽器", "", 1)}} 會在此過程中觸發。

## 範例

### HTML

```html
<h4>事件傳遞鏈</h4>
<ul>
  <li>點擊「d1」</li>
  <li>分析事件傳遞鏈</li>
  <li>點擊下一層 div 並重複體驗</li>
  <li>切換「捕獲」模式</li>
  <li>重複體驗</li>
</ul>
<input type="checkbox" id="chCapture" />
<label for="chCapture">使用捕獲階段</label>
<div id="d1">
  d1
  <div id="d2">
    d2
    <div id="d3">
      d3
      <div id="d4">d4</div>
    </div>
  </div>
</div>
<div id="divInfo"></div>
```

### CSS

```css
div {
  margin: 20px;
  padding: 4px;
  border: thin black solid;
}

#divInfo {
  margin: 18px;
  padding: 8px;
  background-color: white;
  font-size: 80%;
}
```

### JavaScript

```js
let clear = false;
let divInfo = null;
let divs = null;
let chCapture = null;

window.onload = () => {
  divInfo = document.getElementById("divInfo");
  divs = document.getElementsByTagName("div");
  chCapture = document.getElementById("chCapture");
  chCapture.onclick = () => {
    removeListeners();
    addListeners();
    clearDivs();
  };
  clearDivs();
  addListeners();
};

function removeListeners() {
  for (const div of divs) {
    if (div.id !== "divInfo") {
      div.removeEventListener("click", onDivClick, true);
      div.removeEventListener("click", onDivClick, false);
    }
  }
}

function addListeners() {
  for (const div of divs) {
    if (div.id !== "divInfo") {
      if (chCapture.checked) {
        div.addEventListener("click", onDivClick, true);
      } else {
        div.addEventListener("click", onDivClick, false);
        div.onmousemove = () => {
          clear = true;
        };
      }
    }
  }
}

function onDivClick(e) {
  if (clear) {
    clearDivs();
    clear = false;
  }
  if (e.eventPhase === 2) {
    e.currentTarget.style.backgroundColor = "red";
  }
  const level =
    ["none", "capturing", "target", "bubbling"][e.eventPhase] ?? "error";
  const para = document.createElement("p");
  para.textContent = `${e.currentTarget.id}；eventPhase: ${level}`;
  divInfo.appendChild(para);
}

function clearDivs() {
  for (let i = 0; i < divs.length; i++) {
    if (divs[i].id !== "divInfo") {
      divs[i].style.backgroundColor = i % 2 !== 0 ? "#f6eedb" : "#cceeff";
    }
  }
  divInfo.textContent = "";
}
```

### 結果

{{ EmbedLiveSample('Example', '', '700') }}

## 規範

{{Specifications}}

## 瀏覽器相容性

{{Compat}}
