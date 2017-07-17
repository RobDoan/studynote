* [Angular Modularity](#Angular-Modularity)


# Angular Modularity
- Some Angular libraries are modules(`FormsModule`, `HttpModule`), and third party such as [Material Design](https://material.angular.io/), [Ionic](http://ionicframework.com/), [AngularFire2](https://github.com/angular/angularfire2)
- Each Angular Module should focus on a feature, area, application business domain, workflow, or common collection of utilities.
- Module can be load eagerly when the application start, or they can be lazy loaded asynchronously by the router.
- Every Angular app has at least one module class, the _root module_.

# Bootstrapping in _main.ts_
Angular offers a variety of bootstrapping options, targeting multiple platforms.
- __Dynamic bootstrapping with the Just-in-time (JIT) compiler__

  __Angular compiler__ compiles the application in the browser and then launches the app.

  `platformBrowserDynamic().bootstrapModule(AppModule);`

- __Static bootstrapping with the Ahead-Of-time (AOT) compiler__

  + Static compiler can produce a much smaller application that launches faster, especially on mobile devices and high latency networks.
  + in this option, Angular compiler runs ahead-of-time as part of the build process, producing a collection of class factories in their own files.
  + Entire application is pre-compiled, so we don't ship _Angular Compiler_ to browser, and we don't compile in browser as JIT option.

  `platformBrowser().bootstrapModuleFactory(AppModuleNgFactory);`

- Both the __JIT__ and __AOT__ compiler generate an AppModuleNgFactory class from the same AppModule source code. The __JIT__ compiler creates that factory class on the fly, in memory, in the browser. The __AOT__ compiler outputs the factory to a physical file that we're importing here in the static version of _main.ts_.
- the `AppModule` should neither know nor care how it is bootstrapped.

## Import Modules
- **Never re-declare classes that belong to another module.**
## Application-scoped Providers
- Angular module instances, unlike components, do not have their own injectors so they can't have their own provider scopes.
- __How do I restrict service scope to a module?__
  + When a module is loaded at application launch, its `@NgModule.providers` have __application-wide scope__. They are available for injection throughout the application.
  + **Imported providers are easily replaced by providers from another imported module**
  + **As a general rule, import modules with providers exactly once, preferably in the application's root module. That's also usually the best place to configure, wrap, and override them.**
  + <em style='color:red;'>Avoid this problem by importing the HttpModule only in the AppModule, the application root module.</em>
  + Lazy load module - The module's providers are visible only within the component tree created with this injector.
  + If you must load the module eagerly, when the application starts, provide the service in a component instead.
