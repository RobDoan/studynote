* [* and `<template>`](#-and-template)
* [@angular/flex-layout](#angular-flex-layout)
* [Build in directive](#build-in-directives)
* [Host Binding](#host-binding)

******

### `*` and `<template>`

`*` prefix syntax allowed us to skip <template> tags and focus directly on the HTML element that we are including, excluding, or repeating. [More examples](https://angular.io/docs/ts/latest/guide/template-syntax.html#!#star-template)

### @angular/flex-layout
  - [API link](https://github.com/angular/flex-layout/wiki/API-Overview)
  - [Flex box guide](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
  - For children of container
    + `fxLayout`. values: `row | column | row-reverse | column-reverse`

       - examples: `fxLayout="row"`
       - Same as set css
      ```
       display: flex;
       flex-direction: $value;
      ```
    +  `fxLayoutAlign`: values: `start|center|end|space-around|space-between` `start|center|end|stretch`

      - Example: `fxLayoutAlign="start center"`
      - first value: `justify-content`
      - second value: `align-items`

    + `fxLayoutWrap` - this is equal in css: 'flex-wrap'
    + `fxLayoutGap` values: __%, px, vw, vh__

  - For host itself
    + `fxFlex`: size of element. __"" , px , %, vw, vh, " ",__
    + `fxFlexOrder` values: interger
    + `fxFlexOffset` __%, px, vw, vh__
    +  `fxFlexAlign` values: `start|baseline|center|end`. This is equal style in css: `align-self`
    + `fxFlexFill`

### Build in directive
- `<img [src]="movie.imageurl">` image src

### Host Binding
- Example check [here](../examples/hero-host-meta.component.ts)
