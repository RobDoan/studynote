+ [Limit service scope](#limit-service-scope-to-a-component-subtree)
+ [OpaqueToken](#opaquetoken)
+ [`@Optional` and `@Host`](#optional-and-host)

### Limit service scope to a component subtree
- An Angular application has multiple dependency injectors, arranged in a tree hierarchy that parallels the component tree.
- By default, a service dependency provided in one component is visible to all of its child components and Angular injects the same service instance into all child components that ask for that service.
- We can limit scope of an injected service to a component and its children by define `providers` inside `@component`

  Example: in example below, we created instance of `HeroService` when component was created. So this instance will be different with other defined `HeroService`. this instance will be visible to its children.
  ```Javascript
  @Component({
    selector: 'unsorted-heroes',
    template: `<div *ngFor="let hero of heroes">{{hero.name}}</div>`,
    providers: [HeroService]
  })
  export class HeroesBaseComponent implements OnInit {
    constructor(private heroService: HeroService) { }
  }
  ```

### `@Optional` and `@Host`
- _When a component request a dependency-injection, Angular starts with that component's injector and walks up the injector tree until it finds the first suitable provider. Angular throws an error if it can't find the dependency during that walk._
- If we want limit to search tree or sometime we don't want to throw an error if it can't find the dependency, we can use `@Host` or `@Optional`
- `@Optional` will set dependency to null if it can't find it.
- `@Host` will stops the upward search at the host component

  ```Javascript
  export class HeroContactComponent {
    constructor(
            @Host() private heroCache: HeroCacheService,
            @Host() @Optional() private loggerService: LoggerService
      ){
      ...
      }
  }
  ```

### OpaqueToken
- As we know, Angular DI injects singleton instances which are created by provider-registered factories.
And these instance is register at the runtime. A DI will associate with a uniq token, this token can be a string or a type.

Example:
  + Token is a type
  ```
    ...
    providers: [
      LoggerService,
      { provide: LocationStrategy, useClass: HashLocationStrategy },
      { provide: Hero,          useValue:    someHero },
    ]
  ```
  + or we can use a string as a token
  ```Javascript
    let appConfiguration = 'appConfiguration';
    const CONFIG = {
      apiUrl: 'http://my.api.com',
      theme: 'suicid-squad',
      title: 'My awesome app'
    };

    ...
    providers: [
      { provide: appConfiguration, useValue: CONFIG}
    ]

    class MyComponent {
      constructor( @Inject(appConfiguration) private configuration){
      }
    }
  ```

  **However using string token like this may cause potential for naming collisions.** So **OpaqueToken** allows us to create string-based tokens without running into any collisions.
  ```Javascript
    import { OpaqueToken } from '@angular/core';

    const CONFIG_TOKEN = new OpaqueToken('appConfiguration');

    providers: [
      { provide: CONFIG_TOKEN, useValue: CONFIG}
    ]
  ```

  ```Javascript
    const TOKEN_A = new OpaqueToken('token');
    const TOKEN_B = new OpaqueToken('token');
    TOKEN_A === TOKEN_B // false
  ```
