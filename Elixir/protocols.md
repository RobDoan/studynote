### Protocols

- Protocols is a little like behaviors, in that it defines the functions that must
be provided to achieve something. But behavior is internal to a module - the module
implements the behavior. Protocols are different—you can place a protocol’s
implementation completely outside the module. This means you can extend modules’
functionality without having to add code to them—in fact, you can extend the
functionality even if you don’t have the modules’ source code.
- Protocol definitions are very similar to basic module definitions. But the functions
of protocols will not have bodies. ( as interface)
- Example
```elixir
  defprotocol Inspect do
    def inspect(thing, opts)
  end
```

### `defimpl` Macro

- it let you implement protocol for one or more types.
- Examples
```elixir
  defimpl Inspect, for: PID do
    def inspect(pid, _opts) do
      "#PID" <> iolist_to_binary(pid_to_list(pid))
    end
  end
  defimpl Inspect, for: Reference do
    def inspect(ref, _opts) do
      '#Ref' ++ rest = :erlang.ref_to_list(ref)
      "#Reference" <> iolist_to_binary(rest)
    end
  end
```

### Deriving `@derive`

- Elixir allows us to derive a protocol implementation based on the Any implementation
```elixir
  defimpl Size, for: Any do
    def size(_), do: 0
  end

  defmodule OtherUser do
    @derive [Size]
    defstruct [:name, :age]
  end
```
