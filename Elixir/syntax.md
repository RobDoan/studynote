* `^`
* `\\` - default value
* underscore prefix (`_`)
* `&`
* `<>` - string concat

### `^`
- `^` is used to tell that we want to use pattern matching rather than assign value to variable.
Example:

```Elixir
  iex> a = 1 #=> 1
  iex> a = 2 #=> 2
  iex> ^a = 3 #=> ** (MatchError) no match of right hand side value: 3
```
- In [pmap](Examples/spawn/pmap.exs) example, we use `^` in the receive block to get the result for each PID in turn. without it, we'd get back the result in random order

### `\\`
- is used to set default value for parameters of function

```Elixir
  def defaut_value_function(a, b\\ 10) do
    ...
  end  
```

### `&`
- is used to capture function, allowing us to pass named function as arguments.
```Elixir
  Enum.map [1, 2, 3], &Math.square/1
```
- it can be use to define anonymous functions in a concise way:
```Elixir
  Enum.map [1, 2, 3, 4], &(&1 * 2)
```

### `<>` string concat
```Elixir  
  iex> "A" <> "B" #=> AB
  defmodule Test do
    def verify_token("Bear" <> token) do
      IO.puts token
    end
  end
  Test.verify_token("BearRealToken") #=> RealToken
```
