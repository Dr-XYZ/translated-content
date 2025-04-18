---
title: Функции
slug: Web/JavaScript/Reference/Functions
---

{{jsSidebar("Functions")}}

## Сводка

В общем случае, функция — это "подпрограмма", которую можно _вызывать_ из внешнего (или внутреннего, в случае рекурсии) по отношению к функции кода. Как и сама программа, функция состоит из последовательности инструкций, называемой _телом функции._ Значения могут быть _переданы_ в функцию, а функция _вернёт_ значение.

В JavaScript функции являются объектами первого класса, то есть: они являются объектами и с ними можно взаимодействовать и передавать их точно так же как любой другой объект. Если быть точным, функции — это объекты [`Function`](/ru/docs/Web/JavaScript/Reference/Global_Objects/Function).

Больше подробностей и примеров можно найти в [руководстве по функциям в JavaScript](/ru/docs/Web/JavaScript/Guide/Functions).

## Описание

Каждая функция в JavaScript — это объект Function. О свойствах и методах объектов Function можно прочитать в статье {{jsxref("Function")}}.

Функции — это не процедуры. Функция всегда возвращает значение, а процедура может возвращать, а может не возвращать.

Чтобы вернуть значение, отличное от значения по умолчанию, в функции должна быть инструкция [`return`](/ru/docs/Web/JavaScript/Reference/Statements/return), которая указывает, что именно нужно вернуть. Функция без него вернёт значение по умолчанию. В случае [конструктора](/ru/docs/Web/JavaScript/Reference/Global_Objects/Object/constructor), вызванного с ключевым словом `new`, значение по умолчанию — это значение его параметра `this`. Для остальных функций значением по умолчанию будет `undefined`.

Параметры вызова функции называются _аргументами_ функции. Аргументы передаются в функцию _по значению_. Если функция изменяет значение аргумента, это изменение не отражается на глобальном состоянии или вызывающей функции. Однако ссылки на объекты — это тоже значения, и они отличаются тем, что если функция изменяет свойства объекта по ссылке, это изменение видно снаружи функции, как показано в примере ниже.

```js
/* Объявляем функцию 'myFunc' */
function myFunc(theObject) {
  theObject.brand = "Toyota";
}

/*
 * Объявляем переменную 'mycar';
 * создаём и инициализируем новый Object;
 * приравниваем 'mycar' к ссылке на него
 */
var mycar = {
  brand: "Honda",
  model: "Accord",
  year: 1998,
};

/* Выведет 'Honda' */
console.log(mycar.brand);

/* Передаём ссылку на объект в функцию */
myFunc(mycar);

/*
 * Выведет 'Toyota', так как значение свойства 'brand'
 * было изменено внутри функции.
 */
console.log(mycar.brand);
```

[`Ключевое слово this`](/ru/docs/Web/JavaScript/Reference/Operators/this) не ссылается на функцию, которая выполняется в данный момент, поэтому вы должны обращаться к объектами Function по имени, даже внутри тела самой функции.

## Определение функций

Есть несколько способов определить функцию:

### Объявление функции (инструкция `function`)

Специальный синтаксис для объявления функций (более подробно: [function statement](/ru/docs/Web/JavaScript/Reference/Statements/function)):

```
function name([param[, param[, ... param]]]) {
   statements
}
```

- `name`
  - : Имя функции.

<!---->

- `param`
  - : Имя аргумента, передаваемого в функцию. У функции может быть не более 255 аргументов.

<!---->

- `statements`
  - : Инструкции, из которых состоит тело функции.

### Функция-выражение (оператор `function`)

Функция-выражение похожа на определение функции и имеет такой же синтаксис (более подробно: [function operator](/ru/docs/Web/JavaScript/Reference/Operators/function)):

```
function [name]([param] [, param] [..., param]) {
   statements
}
```

- `name`
  - : Имя функции. Может быть не указано, в таком случае функция становится анонимной.

<!---->

- `param`
  - : Имя аргумента, передаваемого в функцию. У функции может быть не более 255 аргументов.
- `statements`
  - : Инструкции, из которых состоит тело функции.

### Стрелочная функция-выражение (=>)

> [!NOTE]
> Стрелочные функции являются экспериментальной технологией*,* частью спецификации ECMAScript 6 и пока что не поддерживаются всеми браузерами.

Стрелочные функции отличаются более кратким синтаксисом и тем, что они лексически связывают значение своего `this (подробнее об этом в статье Стрелочные функции):`

```
([param] [, param]) => {
   statements
}

param => expression
```

- `param`
  - : Имя параметра. Если параметров нет, вместо них нужно поставить (). Если параметров больше одного, их также нужно заключить в ().
- `statements or expression`
  - : Если инструкций несколько, их нужно заключить в {}. Для одного выражения фигурных скобок не требуется, а результат этого выражения будет возвращён функцией (то есть` функция x => 3 + 8 вернёт 11).```

### Конструктор `Function`

> [!NOTE]
> Использовать конструктор Function не рекомендуется, так как он принимает тело функции в виде строки, а это может помешать оптимизациям, которые выполняют движки JavaScript, а также привести к другим проблемам.

Объекты {{jsxref("Function")}} можно создавать с помощью оператора `new` (как и любые другие объекты):

```
new Function (arg1, arg2, ... argN, functionBody)
```

- `arg1, arg2, ... argN`
  - : Ноль или больше имён параметров функции. Имя должно быть строкой, содержащей валидный идентификатор JavaScript. Если параметров несколько, они должны быть разделены запятыми. Например: "`x`", "`theValue`", или "`a,b`".

<!---->

- `functionBody`
  - : Инструкции, из которых состоит тело функции.

Конструктор `Function` можно вызывать и без оператора `new,` эффект будет тем же.

## Параметры функции

> [!NOTE]
> Остаточные параметры и параметры по умолчанию _— это экспериментальная_ технология, часть спецификации ECMAScript 6, и они пока ещё не получили широкой поддержки среди браузеров.

### Параметры по умолчанию

Параметры функции по умолчанию позволяют инициализировать формальные параметры со значениями по умолчанию, если им не было передано значение, или было передано `undefined`. Подробнее о них можно узнать в статье [Параметры по умолчанию](/ru/docs/Web/JavaScript/Reference/Functions/Default_parameters).

### Остаточные параметры

Синтаксис оставшихся параметров позволяет передать бесконечное число аргументов как массив. Подробности можно найти в статье [Остаточные параметры](/ru/docs/Web/JavaScript/Reference/Functions/rest_parameters).

## Объект `arguments`

Внутри функции получить доступ к её аргументам можно через объект [arguments](/ru/docs/Web/JavaScript/Reference/Functions/arguments).

- [`arguments`](/ru/docs/Web/JavaScript/Reference/Functions/arguments): Объект, похожий на массив и содержащий все аргументы, переданные в текущую функцию.
- [`arguments.callee`](/ru/docs/Web/JavaScript/Reference/Functions/arguments/callee) {{Deprecated_inline}}: Функция, исполняемая в текущий момент.
- [`arguments.caller`](/ru/docs/JavaScript/Reference/Functions_and_function_scope/arguments/caller) : Функция, которая вызвала текущую функцию.
- [`arguments.length`](/ru/docs/Web/JavaScript/Reference/Functions/arguments/length): Число аргументов, переданных в функцию.

## Определение методов

### Геттеры и сеттеры

Можно определять геттеры (методы для чтения) и сеттеры (методы для изменения) для любого встроенного или пользовательского объекта, который поддерживает добавление новых свойств. Для этого используется синтаксис литерала объекта.

- [get](/ru/docs/Web/JavaScript/Reference/Functions/get)
  - : Связывает свойство объекта с функцией, которая будет вызвана при обращении к свойству.
- [set](/ru/docs/Web/JavaScript/Reference/Functions/set)
  - : Связывает свойство объекта с функцией, которая будет вызвана при попытке изменения свойства.

### Синтаксис определения методов

> **Примечание:** _Определение методов — это экспериментальная_ технология, часть спецификации ECMAScript 6, и она пока ещё не получила широкой поддержки среди браузеров.

Начиная с ECMAScript 6, можно определять собственные методы, используют более краткий синтаксис, похожий на геттеры и сеттеры. Более подробно — в статье [Определение методов.](/ru/docs/Web/JavaScript/Reference/Functions/Method_definitions)

```js
var obj = {
  foo() {},
  bar() {},
};
```

## Сравнение конструкторов `Function` с объявлением функций и функциями-выражениями

Посмотрите на следующие примеры:

Функция, определённая через конструктор `Function` и приравненная к переменной `multiply:`

```js
var multiply = new Function("x", "y", "return x * y");
```

Объявление функции multiply:

```js
function multiply(x, y) {
  return x * y;
}
```

Анонимная функция-выражение, приравненная к переменной `multiply:`

```js
var multiply = function (x, y) {
  return x * y;
};
```

_Функция-выражение_ с именем `func_name`, приравненное к переменной `multiply:`

```js
var multiply = function func_name(x, y) {
  return x * y;
};
```

### Отличия

Во всех случаях результат примерно одинаков, но есть несколько нюансов:

Имя функции и переменная, к которой функция приравнена — это не одно и то же. Имя функции нельзя менять, а вот переменной, к которой приравнена функция, можно дать другое значение. В случае функции-выражения с именем, это имя может быть использовано только внутри самой функции. При попытке использовать его снаружи возникнет ошибка (а если ранее была объявлена переменная с таким именем, будет возвращено `undefined`). Например:

```js
var y = function x() {};
alert(x); // выкинет ошибку
```

Также имя функции-выражения проявляется, если сериализовать функцию через метод [Function.toString.](/ru/docs/Web/JavaScript/Reference/Global_Objects/Function/toString)

А вот переменная, к которой функция приравнена, ограничена только собственной областью видимости, которая включает ту область, где функция была объявлена.

Как показано в четвёртом примере, имя функции может отличаться от имени переменной, к которой функция приравнена, эти имена никак не связаны. Объявление функции (function declaration) также создаёт и переменную с именем, аналогичным имени функции. Таким образом:

1. Если функция определена с помощью функции-выражения (function expression), её имя доступно только внутри самой функции.
2. Если функция объявлена (function declaration), её имя доступно в той области видимости, где функция была определена.

У функции, определённой с помощью '`new Function'`, нет имени. Однако, в JavaScript движке [SpiderMonkey](/ru/docs/Mozilla/Projects/SpiderMonkey), сериализованное представление функции отображается так, как будто оно имеет имя "anonymous". Например, , `alert(new Function())` выдаст:

```js
function anonymous() {}
```

Так как на самом деле у функции нет имени, переменную `anonymous` нельзя использовать внутри функции. Например, следующий пример выкинет ошибку:

```js
var foo = new Function("alert(anonymous);");
foo();
```

В отличии от функций, определённых через функцию-выражение или конструктор `Function`, функция, определённая через объявление, может быть использована перед тем, как была определена. Например:

```js
foo(); // выведет FOO!
function foo() {
  alert("FOO!");
}
```

Функция, определённая через функцию-выражение, наследует текущую область видимости, то есть создаёт замыкание. А вот функция, созданная с помощью конструктора `Function`, не наследует ничего, кроме глобальной области видимости (её наследуют вообще все функции).

Функции, определённые через функцию-выражение и объявление функции парсятся только один раз, в отличии от функций, созданных с помощью конструктора. То есть строка, которая передаётся в конструктор `Function`, парсится при каждом вызове конструктора. И хотя функция-выражение каждый раз создаёт замыкание, тело функции при этом не парсится, и получается, что функции-выражение всё равно быстрее, чем "`new Function(...)`". Поэтому конструктора `Function` в большинстве случаев стоит избегать, если это возможно.

Стоит отметить, что функции-выражения и объявления функций внутри функции, созданной при парсинге конструктора `Function`, парсятся только один раз. Например:

```js
var foo = new Function(
  "var bar = 'FOO!';\nreturn(function() {\n\talert(bar);\n});",
)();
foo(); //  "function() {\n\talert(bar);\n}" Эта часть строки, составляющей тело функции, не парсится во второй раз.
```

Объявление функции можно очень легко (и часто случайно) превратить в функцию-выражение. Объявление функции перестаёт быть таковым, если оно:

- становится частью выражения
- не является "исходным элементом" функции или файла. Исходный элемент - это не вложенный элемент внутри функции или скрипта:

```js
var x = 0; // исходный элемент
if (x == 0) {
  // исходный элемент
  x = 10; // не исходный элемент
  function boo() {} // не исходный элемент
}
function foo() {
  // исходный элемент
  var y = 20; // исходный элемент
  function bar() {} // исходный элемент
  while (y == 10) {
    // исходный элемент
    function blah() {} // не исходный элемент
    y++; // не исходный элемент
  }
}
```

### Примеры

```js
// объявление функции
function foo() {}

// функция-выражение
(function bar() {});

// функция-выражение
x = function hello() {};

if (x) {
  // функция-выражение
  function world() {}
}

// объявление функции
function a() {
  // объявление функции
  function b() {}
  if (0) {
    // функция-выражение
    function c() {}
  }
}
```

## Определение функции в зависимости от условия

Функции могут быть определены в зависимости от условий с помощью инструкции `function (разрешённое расширение стандарта` [ECMA-262 Edition 3](https://www.ecma-international.org/publications/standards/Ecma-262.htm)) или конструктора `Function`. Обратите внимание, что подобные инструкции [запрещены в ES5 strict](https://bugzilla.mozilla.org/show_bug.cgi?id=609832). Кроме того, эта возможность по-разному ведёт себя в разных браузерах, поэтому не стоит на неё рассчитывать.

В коде ниже функция `zero` никогда не будет определена и не может быть вызвана, потому что '`if (0)`' всегда расценивается как `false`:

```js
if (0) {
  function zero() {
    document.writeln("This is zero.");
  }
}
```

Если изменить условие на '`if (1)`', функция `zero` будет определена.

Заметьте, что хотя это выглядит как объявление функции, на самом деле, это функция-выражение (или инструкция), так как она вложена внутрь другой инструкции. Изучите разницу между объявлением функции и функцией-выражением.

Некоторые JavaScript-движки (но не [SpiderMonkey](/ru/docs/SpiderMonkey)), неверно считают любую функцию-выражение с именем за объявление функции. Это приводит к тому, что функция `zero` будет определена, даже если условие всегда `false`. Более безопасный способ определить функцию по условию - это сделать её анонимной и приравнять к переменной:

```js
if (0) {
  var zero = function () {
    document.writeln("This is zero.");
  };
}
```

## Примеры

### Пример: возврат отформатированного числа

Эта функция возвращает строку, содержащую число с заданным количеством нулей перед ним:

```js
function padZeros(num, totalLen) {
  var numStr = num.toString(); // Инициализировать возвращаемое значение в виде строки
  var numZeros = totalLen - numStr.length; // Посчитать число нулей в начале
  for (var i = 1; i <= numZeros; i++) {
    numStr = "0" + numStr;
  }
  return numStr;
}
```

Вызовем `padZeros`:

```js
var result;
result = padZeros(42, 4); // возвращает "0042"
result = padZeros(42, 2); // возвращает "42"
result = padZeros(5, 4); // возвращает "0005"
```

### Пример: существует ли функция

Можно определить, существует ли функция с помощью оператора `typeof`. В следующем примере проверяется, есть ли у объекта `window` функция `noFunc`. Если есть, то она вызывается; если нет, выполняется какое-то другое действие.

```js
if ("function" == typeof window.noFunc) {
  // вызывать noFunc()
} else {
  // сделать что-то другое
}
```

Заметьте, что в проверке условия используется ссылка на `noFunc` — после имени функции нет скобок, поэтому сама функция не вызывается.

## Спецификации

{{Specifications}}

## Совместимость с браузерами

{{Compat}}

## Смотрите также

- [`Function`](/ru/docs/Web/JavaScript/Reference/Global_Objects/Function)
- [Инструкция `function`](/ru/docs/Web/JavaScript/Reference/Statements/function)
- [Оператор `function`](/ru/docs/Web/JavaScript/Reference/Operators/function)
