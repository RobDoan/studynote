* [Add Listener for directive or component](#add-listener-for-directive-or-component)


----

### Add Listener for directive or component
- Use `@HostListener` decorator
```javascript
  // Add click listener to directive
  export class LogoutDirective {
    constructor() { }

    @HostListener('click', ['$event.target'])
    onClick(target){
      alert("Logout");
    }
  }
```
- Or we can use `host` option to bind event.
```javascript
  @Component({
    ...
    host: {
      '(document:keyup)': 'onKeyUp($event)'
    }
  })
```
- 
