---
title: Node.innerText
slug: Web/API/HTMLElement/innerText
---

{{APIRef("DOM")}}

**`Node.innerText`** - это свойство, позволяющее задавать или получать текстовое содержимое элемента и его потомков. В качестве геттера, свойство приближается к тексту, который пользователь получит, если он выделит содержимое элемента курсором, затем копирует его в буфер обмена.

Изначально, данное поведение было представлено Internet Explorer, и было формально специализированно в стандарте HTML в 2016 после того, как было адаптировано всеми ведущими браузерами.

{{domxref("Node.textContent")}} - это альтернативное свойство, которое имеет ряд отличий:

- `textContent` получает содержимое _всех_ элементов, включая [`<script>`](/ru/docs/Web/HTML/Reference/Elements/script) и [`<style>`](/ru/docs/Web/HTML/Reference/Elements/style), тогда как `innerText` этого не делает.
- `innerText` умеет считывать стили и не возвращает содержимое скрытых элементов, тогда как `textContent` этого не делает.
- Метод `innerText` позволяет получить CSS, а `textContent` — нет.

## Спецификации

{{Specifications}}

## Совместимость с браузерами

{{Compat}}

## Смотрите также

- {{domxref("HTMLElement.outerText")}}
- {{domxref("Element.innerHTML")}}
