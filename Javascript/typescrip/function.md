- Optional Parameters


### Optional Parameters:
- A parameter can be marked as optional by appending a question mark to its name.
```typescript
  function optionalParamFun(para1: string, opt_param?: string): void(){}
```

### Rest Parameters
- Rest parameters are similar to variable arguments in Java. Rest parameters don’t restrict the number of values that you can pass to a function

```typescript
  function outputSecondParam(...args){
    console.info(args[2])
  }

  outputSecondParam(1,3,4) #=> 3
```

### Default params
`function calculate_discount(price:number,rate:number = 0.50)`
