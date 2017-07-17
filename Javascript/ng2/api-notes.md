- [_CommonModule_](https://angular.io/docs/ts/latest/api/common/index/CommonModule-class.html): the module that includes all the basic Angular directives like `NgIf`, `NgFor`, ...
- [`@NgModule`](https://angular.io/docs/ts/latest/api/core/index/NgModule-interface.html)
  + `exports`: Specifies a list of directive/pipe/modules that can be use within templates of any component of module that import this module.
- `BrowserModule`, the module every browser app must import.
- `BrowserModule` imports `CommonModule` and re-exports it. So when we already import `BrowserModule`, we don't need to import `CommonModule`
- Don't not import `BrowserModule` to any feature modules or Lazy Load modules. We should import `CommonModule` instead.
