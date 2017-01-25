> Elixir is a dynamically type language, so all type in Elixir are inferred by the run time

* [Types and specs](#types-and-specsspec-type-and-typedoc-directives)
* [Behaviors](#behaviorscallback-behaviour-directive)

====================


### Types and specs(`@spec`, `@type` and `@typedoc` directives)

```elixir
  @spec round(number) :: integer
  def round(number), do: # implementation...

  @spec token(binary | map) :: Token.t
  def token(payload) when is_map(payload) do
    ...        
  end
  def token(encoded_token) when is_binary(encoded_token) do
    ...
  end
```
- above mean: _`round/1` take `number` as a arguments and return an `integer`_
- `::` means that function on the left side _returns_ a value whose type is what on the right
  ```elixir
  defmodule LousyCalculator do
    @spec add(number, number) :: {number, String.t}
    def add(x, y), do: {x + y, "You need a calculator to do that?!"}

    @spec multiply(number, number) :: {number, String.t}
    def multiply(x, y), do: {x * y, "Jeez, come on!"}
  end
  ```
- As example above, we repeated `{number, String.t}` over and over. So, we can use `@type` directive
in order to declare our own custom types.
- Custom types defined through `@type` are exported and available outside the module they’re defined in

```elixir
  defmodule LousyCalculator do
    @typedoc """
    Just a number followed by a string.
    """
    @type number_with_remark :: {number, String.t}

    @spec add(number, number) :: number_with_remark
    def add(x, y), do: {x + y, "You need a calculator to do that?"}

    @spec multiply(number, number) :: number_with_remark
    def multiply(x, y), do: {x * y, "It is like addition on steroids."}
  end
```
- The `@typedoc` directive, similarly to the `@doc` and `@moduledoc` directives, is used to document custom types.
- The Erlang tool Dialyzer, for example, uses typespecs in order to perform static analysis of code


### Behaviors(@callback, @behaviour directive)

- Behaviours provide a way to:

  + define a set of functions that have to be implemented by a module
  + ensure that a module implements all the functions in that set.

- You can think of **behaviours** like **interface** in OOP.
- Use `@callback` to create a _behavior_. @callback expects a function name but
also a function specification like we use in @spec
  ```elixir
    defmodule Parser do
      @callback parse(String.t) :: any
      @callback extensions() :: [String.t]
    end
  ```
- use `@behaviour` to adopt a behaviour
  ```elixir
  defmodule JSONParser do
    @behaviour Parser

    def parse(str), do: # ... parse JSON
    def extensions, do: ["json"]
  end
  ```
