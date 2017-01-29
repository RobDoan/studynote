- [Notes](#notes)
- [TestBed](#testbed)
- [Test a component with an external template](#test-a-component-with-an-external-template)
- [Test a component with a dependency](#test-a-component-with-a-dependency)
- [Test a component with an async service](#test-a-component-with-an-async-service)
-----

### Notes:
- _angular-cli@1.0.0beta.26_ errors when run `npm test`: _Uncaught ReferenceError: Zone is not defined_.
Fixed: add `import './polyfills.ts';` to **test.ts** file.

- **Test Component**:  
- [**Why put specs next to the things they test?**](https://angular.io/docs/ts/latest/guide/testing.html#!#q-spec-file-location)
- [Jasmine](https://jasmine.github.io/) is a behavior-driven development framework for testing JavaScript code.
- [Karma](https://karma-runner.github.io/1.0/index.html) With Jasmine we can describe our tests and their expectations. Now, in order to actually run the tests we need to have a browser environment. That’s where Karma comes in. Karma allows us to run JavaScript code within a browser like Chrome or Firefox, or on a headless browser.
- To testing Routing, if in component has `<router-outlet>` directive, on testing we should import `import { RouterTestingModule } from '@angular/router/testing'`

- **when test FormGroup of async function, should write test for each scenario**.
  + Example following test usually return fail because the second `setValue` mark the formgroup.valid to be true
  ```javascript
  it("password and password confirmation should be match", () =>{
    let passwordGroup = component.signUpForm.get('password');
      passwordGroup.setValue({
        password: 'testpassword',
        confirm: 'notmatchpassword'
      });

      // Because the second set value, so it always make this test fail.
      expect(passwordGroup.valid).not.toBe();

      // Should move this test to another test. otherwise it will cause an subscribe event, that make the `passwordGroup`
      // become valid. this cause the test above fail.
      passwordGroup.setValue({
        password: 'testpassword',
        confirm: 'testpassword'
      });
      expect(passwordGroup.valid).toBe(true);
  })
  ```

### TestBed
- is the most important of Angular testing utilities.
- `configureTestingModule` method: produce the module environment for the class you want to test.
This method usually call within `beforeEach`
- `createComponent` method: creates an instance of the component.
**Do not re-configure the TestBed after calling createComponent.**

  + The `createComponent` method closes the current `TestBed` instance to further configuration. You cannot call any more `TestBed` configuration methods, not `configureTestingModule` nor any of the `override`... methods. The `TestBed` throws an error if you try.
  + This method returns a `ComponentFixture`
  + The fixture provides access to the component instance itself and to the `DebugElement`

- `detectChanges`
Example:
```JavaScript
  it('should display a different test title', () => {
    comp.title = 'Test Title';
    fixture.detectChanges();
    expect(el.textContent).toContain('Test Title');
  });
```
- `ComponentFixtureAutoDetect`
  + using `detectChanges` requires we call `detectChanges` frequently. Some testers prefer that the Angular test environment run change detection automatically. That's possible by configuring the TestBed with the ComponentFixtureAutoDetect provider
  ```JavaScript
    import { ComponentFixtureAutoDetect } from '@angular/core/testing';
    TestBed.configureTestingModule({
      declarations: [ BannerComponent ],
      providers: [
        { provide: ComponentFixtureAutoDetect, useValue: true }
      ]
    })
  ```
  + `ComponentFixtureAutoDetect` does not know if changing make in the test.
  + The test must call fixture.detectChanges() manually to trigger another cycle of change detection.

### Test a component with an external template
- The TestBed.createComponent method is synchronous. But the Angular template compiler must read the external file from the
file system before it can create a component instance. Reading file is a asynchronous activities.
- `async` function - async beforeEach. It takes a parameterless function and returns a function which becomes the true argument to the `beforeEach`.
- The `TestBed.compileComponents` method asynchronously compiles all the components configured in the testing module.

   > Do not configure the `TestBed` after calling `compileComponents`. Make `compileComponents` the last step before calling `TestBed.createComponent` to instantiate the component-under-test.

### Test a component with a dependency
- Get service
  + **get it from the injector of the component-under-test**. this is safest way, and always work.
  ```Javascript
    userService = fixture.debugElement.injector.get(UserService);
  ```
  + `TestBed.get`. it only works when Angular injects the component with the service instance in the test's root injector
  ```Javascript
    userService = TestBed.get(UserService);
  ```
  + [The `inject` utility function](https://angular.io/docs/ts/latest/testing/#!#inject)
  + **Note**: _The service instance injected into the component is a completely different stub object which we set in providers. It just a clone of the object that we set in provider_

### Test a component with an async service
- using `spyOn`
  ```JavaScript
    spy = spyOn(twainService, 'getQuote').and.returnValue(Promise.resolve(testQuote));
  ```
  Spying on the real service isn't always easy, especially when the real service has injected dependencies. You can stub and spy at the same time.
  ```JavaScript
    class HeroDetailServiceSpy {
      testHero = new Hero(42, 'Test Hero');

      getHero = jasmine.createSpy('getHero').and.callFake(
        () => Promise
          .resolve(true)
          .then(() => Object.assign({}, this.testHero))
      );

      saveHero = jasmine.createSpy('saveHero').and.callFake(
        (hero: Hero) => Promise
          .resolve(true)
          .then(() => Object.assign(this.testHero, hero))
      );
   }
  ```
- `ComponentFixture.whenStable`. the `whenStable` promise resolves when all pending asynchronous activities within this test complete ... the definition of "stable"
- `fakeAsync` - it likes `async`. The principle advantage of `fakeAsync` over `async` is that the test appears to be synchronous. There is no `then(...)` to disrupt the visible flow of control. The promise-returning `fixture.whenStable` is gone, replaced by `tick()`.

  > However, There are limitations. For example, you cannot make an XHR call from within a fakeAsync.

- `tick` function. is one of the Angular testing utilities and a companion to `fakeAsync`. It can only be called within a `fakeAsync` body. Calling `tick()` simulates the passage of time until all pending asynchronous activities complete
- Another technique is `jasmine.done`
