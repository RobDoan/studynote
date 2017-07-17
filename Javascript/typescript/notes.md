- `for .. in` vs `for..of`
- `declare` vs `interface`
- `type` vs `interface`

# `for..in` vs `for..of`
- `for..in` returns a list of key.
- `for..of` returns a list of values.

```Typescript
  let list = [4, 5, 6];

  for (let i in list) {
    console.log(i); // "0", "1", "2",
  }

  for (let i of list) {
    console.log(i); // "4", "5", "6"
  }
```

# `declare` vs `interface`
- both `declare` and `interface` are not compiled to javascript.
- `declare` is used when you want to describe existing class. Usually, when you import a javascript library, but that library isn't written by Typescript, so we use declare to describe that class.
- `interface` is used when you simply want to describe the shape of an object.
- when we use `declare`, that mean that object should have at runtime.
- Summary: Both `interface` and `declare` are not compiled. But `declare` should have that class at runtime (may be by import javascript library - example Jquery).


# `type` vs `interface`
- `type` can consider an alias type. Some `type` examples:
```
  type NumOrStr = number | string;
  type StringOrNull = string | null;
  type PointType = { x: number; y:number }
```
- `interface` can have have multiple merged declarations, but `type` can not can. Example:
```typescript
  interface Point{ x: number; }  #1
  interface Point{ y: number; } #2
  # this will merge #1 and #2

  type PointType = { x: number; }
  type PointType = { y: number; }
  # Error: Duplicate identifier 'PointType'
```
- `interface` can extends, implements. But `type` can not.
```
  interface Point3D extends Point{ z: number; }
  class Postion implements Point{}
```
