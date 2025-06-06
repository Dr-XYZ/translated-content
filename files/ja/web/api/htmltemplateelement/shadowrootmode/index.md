---
title: "HTMLTemplateElement: shadowRootMode プロパティ"
short-title: shadowRootMode
slug: Web/API/HTMLTemplateElement/shadowRootMode
l10n:
  sourceCommit: 26091e4af9c73bb6c5d1466df5070c949498fdbd
---

{{APIRef("Web Components")}}

**`shadowRootMode`** は {{domxref("HTMLTemplateElement")}} インターフェイスのプロパティで、関連付けられた [`<template>`](/ja/docs/Web/HTML/Reference/Elements/template) 要素の [`shadowrootmode`](/ja/docs/Web/HTML/Reference/Elements/template#shadowrootmode) 属性の値を反映します。

このプロパティは開発者にとって有用ではないことに注意してください。
`<template>` 要素を使用して宣言的に [`ShadowRoot`](/ja/docs/Web/API/ShadowRoot) を作成する場合は、このオブジェクトおよびプロパティは存在しません。
それ以外の場合、`HTMLTemplateElement` が作成された場合は、オブジェクトがシャドウルートではないため、このプロパティの値は無関係であり、シャドウルートに変更することはできません。

## 値

関連付けられた [`<template>`](/ja/docs/Web/HTML/Reference/Elements/template) 要素の [`shadowrootmode`](/ja/docs/Web/HTML/Reference/Elements/template#shadowrootmode) 属性の値を反映します。

## 仕様書

{{Specifications}}

## ブラウザーの互換性

{{Compat}}

## 関連情報

- [`shadowrootmode`](/ja/docs/Web/HTML/Reference/Elements/template#shadowrootmode)（`<template>` 要素の属性）
- [`ShadowRoot.mode`](/ja/docs/Web/API/ShadowRoot/mode)
