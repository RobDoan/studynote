- `<base href="/">`: most routing should add this base element into <head> tag of index.html  
- `Router` service: Angular2 application has one instance of `Router` service. When url change, that `Router` service
looks for a corresponding `Route` to determine component to display.
- Configure Router:
  + `RouterModule.forRoot(routes: Routes)`
  + `RouterModule.forChild(routes: Routes)`
- [`Route`](https://angular.io/docs/ts/latest/api/router/index/Route-interface.html) interface

  + There are no leading slashes in the path
  + The _empty path_ in the fourth route represents the default path for the application, the place to go when the path in the URL is empty, as it typically is at the start
  + The ** path is a _wildcard_
  ```javascript

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

-
