---
title: DocumentFragment
slug: Web/API/DocumentFragment
l10n:
  sourceCommit: fd1081dbbecd338a3ea55b03c187b6a60500408f
---

{{ APIRef("DOM") }}

**`DocumentFragment`** 介面表示一個沒有父節點的最小文件物件。

它被用作 {{domxref("Document")}} 的輕量版本，儲存由節點組成的文件結構片段，就像標準文件一樣。主要的區別在於文件片段不屬於活動文件樹結構的一部分。對片段進行的更改不會影響文件。

{{InheritanceDiagram}}

## 建構子

- {{ domxref("DocumentFragment.DocumentFragment()", "DocumentFragment()") }}
  - : 建立並回傳一個新的 `DocumentFragment` 物件。

## 實例屬性

_此介面沒有特定的屬性，但繼承自其父介面 {{domxref("Node")}} 的屬性。_

- {{ domxref("DocumentFragment.childElementCount") }} {{ReadOnlyInline}}
  - : 回傳 `DocumentFragment` 擁有的子{{domxref("Element", "元素")}}的數量。
- {{ domxref("DocumentFragment.children") }} {{ReadOnlyInline}}
  - : 回傳一個動態的 {{domxref("HTMLCollection")}}，其中包含 `DocumentFragment` 物件的所有子 {{domxref("Element")}}。
- {{ domxref("DocumentFragment.firstElementChild") }} {{ReadOnlyInline}}
  - : 回傳 `DocumentFragment` 物件的第一個子 {{domxref("Element")}}，如果沒有則回傳 `null`。
- {{ domxref("DocumentFragment.lastElementChild") }} {{ReadOnlyInline}}
  - : 回傳 `DocumentFragment` 物件的最後一個子 {{domxref("Element")}}，如果沒有則回傳 `null`。

## 實例方法

_此介面繼承自其父介面 {{domxref("Node")}} 的方法。_

- {{DOMxRef("DocumentFragment.append()")}}
  - : 在文件片段的最後一個子節點後插入一組 {{domxref("Node")}} 物件或字串。
- {{DOMxRef("DocumentFragment.prepend()")}}
  - : 在文件片段的第一個子節點前插入一組 {{domxref("Node")}} 物件或字串。
- {{domxref("DocumentFragment.querySelector()")}}
  - : 回傳 `DocumentFragment` 中第一個符合指定選擇器的 {{domxref("Element")}} 節點（按文件順序）。
- {{domxref("DocumentFragment.querySelectorAll()")}}
  - : 回傳一個 {{domxref("NodeList")}}，其中包含 `DocumentFragment` 中所有符合指定選擇器的 {{domxref("Element")}} 節點。
- {{DOMxRef("DocumentFragment.moveBefore()")}} {{Experimental_Inline}}
  - : 將指定的 {{domxref("Node")}} 移動到呼叫的 `DocumentFragment` 中作為直接子節點，並位於指定的參考節點之前，而不需要先移除再插入該節點。
- {{DOMxRef("DocumentFragment.replaceChildren()")}}
  - : 用指定的新子節點集合替換 `DocumentFragment` 的現有子節點。
- {{domxref("DocumentFragment.getElementById()")}}
  - : 回傳 `DocumentFragment` 中第一個符合指定 ID 的 {{domxref("Element")}} 節點（按文件順序）。功能上等同於 {{domxref("Document.getElementById()")}}。

## 使用注意事項

`DocumentFragment` 的常見用途是建立一個片段，在其中組裝一個 DOM 子樹，然後使用 {{domxref("Node")}} 介面的方法（例如 {{domxref("Node.appendChild", "appendChild()")}}、{{domxref("Element.append", "append()")}} 或 {{domxref("Node.insertBefore", "insertBefore()")}}）將片段附加或插入到 DOM 中。這樣做會將片段的節點移動到 DOM 中，留下空的 `DocumentFragment`。

此介面在 Web 元件中也非常有用：{{HTMLElement("template")}} 元素在其 {{domxref("HTMLTemplateElement.content")}} 屬性中包含一個 `DocumentFragment`。

可以使用 {{domxref("document.createDocumentFragment()")}} 方法或建構子建立一個空的 `DocumentFragment`。

## 效能

`DocumentFragment` 的效能優勢通常被誇大。事實上，在某些引擎中，使用 `DocumentFragment` 比在迴圈中直接附加到文件更慢，如[此效能測試](https://jsbench.me/02l63eic9j/1)所示。然而，這些範例之間的差異非常微小，因此優化可讀性比效能更重要。

## 範例

### HTML

```html
<ul></ul>
```

### JavaScript

```js
const ul = document.querySelector("ul");
const fruits = ["Apple", "Orange", "Banana", "Melon"];

const fragment = new DocumentFragment();

for (const fruit of fruits) {
  const li = document.createElement("li");
  li.textContent = fruit;
  fragment.append(li);
}

ul.append(fragment);
```

### 結果

{{EmbedLiveSample('範例')}}

## 規範

{{Specifications}}

## 瀏覽器相容性

{{Compat}}
