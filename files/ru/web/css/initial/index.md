---
title: initial
slug: Web/CSS/initial
---

{{CSSRef}}

Ключевое слово **`initial`** (CSS) устанавливает свойство элемента в [начальное (или по умолчанию) значение](/ru/docs/conflicting/Web/CSS/CSS_cascade/Value_processing). Это может быть применимо к любому свойству CSS. Это относится также к CSS-свойству {{cssxref("all")}}, с которым `initial` может быть использовано для восстановления всех CSS-свойств до их начальных значений.

> [!NOTE]
> На [наследуемые свойства](/ru/docs/Web/CSS/CSS_cascade/Inheritance#inherited_properties) действие значения initial может быть непредвиденным. Вы должны рассмотреть возможность использования ключевых слов {{cssxref("inherit")}}, {{cssxref("unset")}} или {{cssxref("revert")}} вместо него.

## Пример

#### HTML

```html
<p>
  <span>This text is red.</span>
  <em>This text is in the initial color (typically black).</em>
  <span>This is red again.</span>
</p>
```

#### CSS

```css
p {
  color: red;
}

em {
  color: initial;
}
```

{{EmbedLiveSample('Пример')}}

## Спецификации

{{Specifications}}

## Совместимость с браузерами

{{Compat}}

## Смотрите также

- Используйте {{cssxref("unset")}}, чтобы установить свойство в его унаследованное значение, если оно наследует, или его начальное значение, если нет.
- Используйте {{cssxref("revert")}} для сброса свойства до значения, установленного таблицей стилей пользователя-агента (или стилями пользователя, если они существуют).
- Используйте свойство {{cssxref("inherit")}}, чтобы установить свойство элемента таким же значением, как у его родителя.
- Свойство {{cssxref("all")}} позволяет сбросить все свойства сразу до начального (initial), унаследованного (inherited), возвращённого (reverted) или неустановленного (unset) состояния.
