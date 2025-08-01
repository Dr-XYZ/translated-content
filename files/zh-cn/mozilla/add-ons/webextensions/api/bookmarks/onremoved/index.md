---
title: bookmarks.onRemoved
slug: Mozilla/Add-ons/WebExtensions/API/bookmarks/onRemoved
l10n:
  sourceCommit: 43e3ff826b7b755b05986c99ada75635c01c187c
---

{{AddonSidebar}}

当书签或文件夹被移除时触发。当文件夹被递归移除时，只会为该文件夹触发一个通知，而不会为其内容触发通知。

## 语法

```js-nolint
browser.bookmarks.onRemoved.addListener(listener)
browser.bookmarks.onRemoved.removeListener(listener)
browser.bookmarks.onRemoved.hasListener(listener)
```

事件包含三个函数：

- `addListener(listener)`
  - : 为此事件添加监听器。
- `removeListener(listener)`
  - : 停止监听此事件。`listener` 参数是要移除的监听器。
- `hasListener(listener)`
  - : 检查是否已为此事件注册了 `listener`。如果正在监听，则返回 `true`，否则返回 `false`。

## addListener 语法

### 参数

- `listener`
  - : 事件触发时调用的函数。该函数接收以下参数：
    - `id`
      - : `string`。被移除项目的 ID。
    - `removeInfo`
      - : `object`。关于被移除项目的更多详细信息。详见 [removeInfo](#removeinfo_2) 部分。

## 附加对象

### removeInfo

- `parentId`
  - : `string`。项目在树中的父项的 ID。
- `index`
  - : `integer`。此项目在其父项中的基于零的索引位置。
- `node`
  - : {{WebExtAPIRef('bookmarks.BookmarkTreeNode')}}。关于被移除项目的详细信息。

## 示例

```js
function handleRemoved(id, removeInfo) {
  console.log(`项目：${id} 已移除`);
  console.log(`标题：${removeInfo.node.title}`);
  if (removeInfo.node.url) {
    console.log(`URL：${removeInfo.node.url}`);
  }
}

function handleClick() {
  browser.bookmarks.onRemoved.addListener(handleRemoved);
}

browser.browserAction.onClicked.addListener(handleClick);
```

{{WebExtExamples}}

## 浏览器兼容性

{{Compat}}

> [!NOTE]
> 此 API 基于 Chromium 的 [`chrome.bookmarks`](https://developer.chrome.google.cn/docs/extensions/reference/api/bookmarks#event-onRemoved) API。该文档衍生自 Chromium 代码中的 [`bookmarks.json`](https://chromium.googlesource.com/chromium/src/+/master/chrome/common/extensions/api/bookmarks.json)。

<!--
// Copyright 2015 The Chromium Authors. All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//
//    * Redistributions of source code must retain the above copyright
// notice, this list of conditions and the following disclaimer.
//    * Redistributions in binary form must reproduce the above
// copyright notice, this list of conditions and the following disclaimer
// in the documentation and/or other materials provided with the
// distribution.
//    * Neither the name of Google Inc. nor the names of its
// contributors may be used to endorse or promote products derived from
// this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-->
