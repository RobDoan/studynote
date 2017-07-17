* [Route guards](#route-guards)
* [Router events](#router-events)
* [Route options](#route-options)
* [LazyLoad Module](#lazyload-module)
* [Notes](#notes)


### Route guards
- A guard's return value controls the router's behavior:
  + if it returns true, the navigation process continues
  + if it returns false, the navigation process stops and the user stays put

  > The guard can also tell the router to navigate elsewhere, effectively canceling the current navigation.

- A routing guard can return an Observable<boolean> or a Promise<boolean> and the router will wait for the observable to resolve to true or false.
- Guard check level
  {`CanDeactivate`, `CanActivateChild`} -> `CanActivate` -> `CanLoad`

  + [`CanActivate`](https://angular.io/docs/ts/latest/api/router/index/CanActivate-interface.html): use to check authorization. And can redirect user if authorizing is fail.
    ```javascript
      class AuthGuardService implements CanActivate{
        canActivate(route: ActivatedRouteSnapshot,
              state: RouterStateSnapshot): Observable<boolean>|Promise<boolean>|boolean { }
      }
    ```
  + `CanActivateChild` The CanActivateChild guard is similar to the CanActivate guard. The key difference is that it runs before any child route is activated.
  + `CanDeactivate`: handling unsaved changes. In the real word, sometime user close or click to new page by accident while editing form. So we may need to implement for preventing these mistakes. Such as: show popup to ask user if they really want to unload page. In this case, we use `CanDeactivate`
  + `Resolve`: pre-fetching component data.

### Router events
- To listen router changes we can do this:
```javascript
  router.events.subscribe(
    (navigationVal) =>
        if (navigationVal instanceof NavigationStart) ...//router start navigation
        if (navigationVal instanceof NavigationEnd) ...//router end navigation
  )
```

### Route options
- `pathMatch`
  + _full_ :
  + _prefix_:
- matcher
- canActivate
- resolve
- outlet

### LazyLoad Module
- Lazy Load Module does not import. They will be fetched and mounted asynchronously when the user navigates to one of their routes.
```Typescript
  export const routes: Routes = [
    { path: '', redirectTo: 'contact', pathMatch: 'full'},
    { path: 'crisis', loadChildren: 'app/crisis/crisis.module#CrisisModule' },
    { path: 'heroes', loadChildren: 'app/hero/hero.module#HeroModule' }
  ];
```

### Notes:
- `<base href="/">`: most routing should add this base element into <head> tag of index.html
- `Router` service: Angular2 application has one instance of `Router` service. When url change, that `Router` service looks for a corresponding `Route` to determine component to display.
- Configure Router:
  + `RouterModule.forRoot(routes: Routes)`
  + `RouterModule.forChild(routes: Routes)`
- [`Route`](https://angular.io/docs/ts/latest/api/router/index/Route-interface.html) interface

  + There are no leading slashes in the path
  + The _empty path_ in the fourth route represents the default path for the application, the place to go when the path in the URL is empty, as it typically is at the start
  + The ** path is a _wildcard_

```Typescript
  const appRoutes: Routes = [
    {
      path: '', component: HomeComponent
    },
    { path: 'login', component: LoginComponent },
    { path: 'register', component: RegisterComponent }
  ]
  @NgModule({
    declarations: [
      ....
    ],
    imports: [
      ....
      RouterModule.forRoot(appRoutes)
    ]
```

- `RouterLink` directive.
- `RouterLinkActive` directive

Example:
```html
  <a routerLink="/crisis-center" routerLinkActive="active">Crisis Center</a>
```
