---
title: Set.prototype.forEach()
slug: Web/JavaScript/Reference/Global_Objects/Set/forEach
---

{{JSRef}}

Метод **`forEach()`** выполняет функцию по одному разу для каждого элемента из `Set` в порядке их расположения.

{{InteractiveExample("JavaScript Demo: Set.prototype.forEach()")}}

```js interactive-example
function logSetElements(value1, value2, set) {
  console.log(`s[${value1}] = ${value2}`);
}

new Set(["foo", "bar", undefined]).forEach(logSetElements);

// Expected output: "s[foo] = foo"
// Expected output: "s[bar] = bar"
// Expected output: "s[undefined] = undefined"
```

## Синтаксис

```
mySet.forEach(callback[, thisArg])
```

### Параметры

- `callback`
  - : Функция, которая будет выполнена для каждого элемента, принимает три параметра:
    - `currentValue`, `currentKey`
      - : Текущий элемент из `Set`. Т.к. в `Set` нет ключей, в каждом будет лежать value.
    - `set`
      - : Сам объект `Set` для которого был вызван `forEach()`.

- `thisArg`
  - : Значение, используемое как `this` в ходе выполнения `callback`.

### Возвращаемое значение

{{jsxref("undefined")}}.

## Описание

Метод `forEach()` выполняет `callback` по одному разу для каждого значения, которое находится в объекте `Set`. Функция не будет выполняться для значений, которые были удалены. Тем не менее функция выполнится с элементами, значение которых `undefined`.

`callback` вызывается с **тремя аргументами**:

- **значение элемента**
- **ключ элемента**
- **`Set` объект обхода**

В объектах типа `Set` нет ключей, поэтому оба первых аргумента принимают **значение** содержащееся в {{jsxref("Set")}}. Это делает метод `forEach()` для объекта Set совместимым с методами `forEach()` других объектов, таких как {{jsxref("Map.foreach", "Map")}} и {{jsxref("Array.forEach","Array")}}.

`Если аргумент thisArg` был передан в `forEach()`, то он будет передан в `callback` , во время исполнения, для использование его в качестве `this`. Иначе в `this` будет хранится значение `undefined`. Значение `this` используемое в `callback` определено согласно [с обычными правилами определения `this` используемого функцией](/ru/docs/Web/JavaScript/Reference/Operators/this)

Каждое значение используется только один раз, исключая те случаи, когда оно было удалено и передобавлено до того, как `forEach()` завершился. `callback` не будет выполнена для элементов, которые были удалены до их использования. Новые значения, которые были добавлены до того как `forEach()` завершился будут использованы.

`forEach()` выполняет `callback` однажды для каждого элемента из объекта `Set`; Он не возвращает никакого значения.

## Примеры

### Содержимое объекта `Set`

Приведённый код показывает состояние каждого элемента в объекте `Set`:

```js
function logSetElements(value1, value2, set) {
  console.log("s[" + value1 + "] = " + value2);
}

new Set(["foo", "bar", undefined]).forEach(logSetElements);

// logs:
// "s[foo] = foo"
// "s[bar] = bar"
// "s[undefined] = undefined"
```

## Спецификации

{{Specifications}}

## Совместимость с браузерами

{{Compat}}

## Смотрите также

- {{jsxref("Array.prototype.forEach()")}}
- {{jsxref("Map.prototype.forEach()")}}
