---
title: HTMLImageElement.decoding
slug: Web/API/HTMLImageElement/decoding
---

{{APIRef}}

Свойство **`decoding`** интерфейса {{domxref("HTMLImageElement")}} даёт браузеру указание о том, следует ли ему ждать декодирования изображения перед обновлением другого содержимого или нет.

### Значение

Строка, с указанием о декодировании. Возможные значения:

- `"sync"`
  - : Декодировать изображение синхронно для одновременного отображения с другим содержимым.
- `"async"`
  - : Декодировать изображение асинхронно и позволять другому содержимому отображатся до завершения декодирования.
- `"auto"`
  - : Без указания режима декодирования. Браузер сам решает, что лучше для пользователя. Это значение по умолчанию, но разные браузеры интерпретируют его по-разному:
    - По умолчанию в Chromium равно `"sync"`.
    - По умолчанию в Firefox равно `"async"`.
    - По умолчанию в Safari равно `"sync"` за исключеним некоторых случаев.

## Примеры

```js
var img = new Image();
img.decoding = "sync";
img.src = "img/logo.png";
```

## Спецификации

{{Specifications}}

## Совместимость с браузерами

{{Compat}}

## Смотрите также

- [\<img>: The Image Embed element](/ru/docs/Web/HTML/Reference/Elements/img)
