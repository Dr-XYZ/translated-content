---
title: tabs.onActiveChanged
slug: Mozilla/Add-ons/WebExtensions/API/tabs/onActiveChanged
---

{{AddonSidebar}}

> [!WARNING]
> Cet événement est obsolète. Utilisez {{WebExtAPIRef("tabs.onActivated")}} à la place.

Se déclenche lorsque l'onglet sélectionné dans une fenêtre change. Notez que l'URL de l'onglet peut ne pas être définie au moment où cet événement a été déclenché, mais vous pouvez écouter les événements {{WebExtAPIRef('tabs.onUpdated')}} pour être averti lorsqu'une URL est définie.

## Syntaxe

```js
browser.tabs.onActiveChanged.addListener(listener);
browser.tabs.onActiveChanged.removeListener(listener);
browser.tabs.onActiveChanged.hasListener(listener);
```

Les événements ont trois fonctions :

- `addListener(callback)`
  - : Ajoute un écouteur à cet événement..
- `removeListener(listener)`
  - : Arrêtez d'écouter cet événement. L'argument `listener` est l'écouteur à supprimer.
- `hasListener(listener)`
  - : Vérifiez si `listener` est enregistré pour cet événement. Renvoie `true` s'il écoute, sinon `false`.

<!---->

## Syntaxe addListener

### Paramètres

- `callback`
  - : Fonction qui sera appelée lorsque cet événement se produit. La fonction recevra les arguments suivants :
    - `tabId`
      - : `integer`. L'ID de l'onglet qui est devenu actif.

    <!---->
    - `selectInfo`
      - : [`object`](#selectinfo).

## Objets supplémentaires

### selectInfo

- `windowId`
  - : `integer`. L'ID de la fenêtre contenant l'onglet sélectionné.

## Compatibilité des navigateurs

{{Compat}}

> [!NOTE]
>
> Cette API est basée sur l'API Chromium [`chrome.tabs`](https://developer.chrome.com/docs/extensions/reference/api/tabs#method-executeScript). Cette documentation est dérivée de [`tabs.json`](https://chromium.googlesource.com/chromium/src/+/master/chrome/common/extensions/api/tabs.json) dans le code de Chromium code.
>
> Les données de compatibilité relatives à Microsoft Edge sont fournies par Microsoft Corporation et incluses ici sous la licence Creative Commons Attribution 3.0 pour les États-Unis.

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
