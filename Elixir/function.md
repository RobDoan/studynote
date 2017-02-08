* [Function name convention](#function-name-convention)
* [Function capturing](#function-capturing)
* [Default arguments](#default-arguments)

---

## Function name convention
#### Underscore
  - underscore(\_) prefix for variable means that the variable not means to be used.
  - underscore(\_) prefix for function, means that the function is never imported by default
  ```Elixir
    defmodule Example do
      def _wont_be_import do
      end
    end

    iex> import Example
    iex> _wont_be_import()
    #=> (CompileError) iex:1: undefined function _wont_be_imported/0
  ```
  - so that underscore is usually used to attach compile-time metadata to module. such as `__info__`
  ```Elixir
    iex> String.__info__(:functions)
    #=> [at: 2, capitalize: 1, chunk: 2, ...]
  ```
  - Elixir includes some double underscore function `__MODULE__/0`, `__DIR__/0`, `__ENV__/0` and `__CALLER__/0`    

#### Trailing ban(foo!)
- Signifies a function or macro where failure cases raise an exception.
- *If you expect the outcome to always to be successful (e.g. if you expect the file always to exist), the bang variation can be more convenient and will raise a more helpful error message (than a failed pattern match) on failure.*

#### Trailing question mark (foo?)
- Signifies a function will return a boolean value.
- We also can follow Erlang convention to define a function return a boolean value by using `is_` prefix.

#### `size` vs `length`
- `size` it means the operation runs in constant time("O(1) time") because the size is store alongside the data structure
- `length` means the operation runs in linear time ("O(n) time") because the entire data structure has to be traversed.

### Function capturing
```Elixir
  iex> fun = &Math.zero?/1
  iex> fun.(0)
  #=> true
```
- We also can use shortcut `&` for paremeters
```Elixir
  # `&1` represents the first argument passed into the function.
  iex> fun = &(&1 + 1)
  iex> fun.(1)
  #=> 2

  iex> fun = &List.flatten(&1, &2)
  #=> &List.flatten/2
  iex> fun.([1, [[2], 3]], [4, 5])
  #=> [1, 2, 3, 4, 5]
```
### Default arguments
- Any expression is allowed to serve as a default value, but it won’t be evaluated during the function definition
```Elixir
defmodule DefaultTest do
  def dowork(x \\ "hello") do
    x
  end
end
```
- If a function with default values has multiple clauses, it is required to create a function head (without an actual body) for declaring defaults:
```Elixir
defmodule Concat do
  def join(a, b \\ nil, sep \\ " ")

  def join(a, b, _sep) when is_nil(b) do
    a
  end

  def join(a, b, sep) do
    a <> sep <> b
  end
end
```
