* [Construct signatures in interfaces](#construct-signatures-in-interfaces)
* [\[<T extends Lengthwise>\]](#t-extends-lengthwise)
----

# Construct signatures in interfaces
- Construct signatures in interfaces are not implementable in classes. they're only for defining existing JS APIs that define a 'new'-able function.
  ```Typescript
  interface ComesFromString {
      name: string;
  }

  interface StringConstructable {
      new(n: string): ComesFromString;
  }

  class MadeFromString implements ComesFromString {
      constructor (public name: string) {
          console.log('ctor invoked');
      }
  }

  function makeObj(n: StringConstructable) {
      return new n('hello!');
  }

  console.log(makeObj(MadeFromString).name);
  ```
- This creates an actual constraint for what you can invoke makeObj with:
  ```Typescript
    class Other implements ComesFromString {
      constructor (public name: string, count: number) {
      }
    }

    makeObj(Other); // Error! Other's constructor doesn't match StringConstructable
  ```

# [<T extends OtherType>]
- As normal we can define as below. T can be replaced by all types.
```typescript
  function loggingIdentity<T>(arg: T): T {}
```
- Sometimes, we would like to this function to work with any types that have `.lenght` property. so we use `<T extends ..>`. Example:
```typescript
  interface LengthWise{
    length: number;
  }

  /* T only accept types that has length property */
  function loggingIdentity<T extends LengthWise>(arg: T): T{

  }
```
