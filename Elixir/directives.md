1. [alias](#alias)
2. [require](#require)
3. [import](#import)
4. [use](#use)
5. [@vsn](#vsn)
6. [@name](#name)

-----------

### alias

- allows you to set up aliases for any given module name.
- `alias <Module>, as: <shortcut>`
- calling alias without an :as option sets the alias automatically to the last part of the module name. Example:

  ```elixir
    defmodule Stats do
      alias Math.List
    end    
  ```

  is same as:

  ```elixir
    defmodule Stats do
      alias Math.List, as: List
    end    
  ```

- `alias` is **lexically scoped**, which allows you to set aliases inside specific functions.

  ```elixir
    defmodule Math do
      def plus(a, b) do
        alias Math.List
        # ...
      end

      def minus(a, b) do
        # ...
      end
    end
  ```

### require


### import

- to easily access functions or macros from other modules without using the fully-qualified name

```
  # import duplicate/2 function from List, to use it without module name prefix
  iex> import List, only: [duplicate: 2]
  iex> duplicate :ok, 3
```

- `import` also supports :macros and :functions to be given to :only. `import Integer, only: :macros`

### use

- `use` is not directive, it’s a macro.
- The `use` macro is frequently used by developers to bring external functionality into the current **lexical scope**, often modules.
- It allow to use module in current context
- Behind the scenes, use requires the given module and then calls the __using__/1 callback on it allowing the module to inject some code into the current context.
  ```elixir
  defmodule Example do
    use Feature, option: :value
  end
  ```

  is compiled into

  ```elixir
  defmodule Example do
    require Feature
    Feature.__using__(option: :value)
  end
  ```

### `@vsn`

 - If we want to version our code and data, we have to tell OTP the version
numbers of what is running. So, at the top of our module we’ll add an @vsn
directive.
```Elixir
  defmodule Sequence.Server do
    use GenServer
    @vsn "0"
  end
```

### `@name`
