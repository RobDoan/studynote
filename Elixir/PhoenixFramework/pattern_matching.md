* [Elixir Doc](http://elixir-lang.org/getting-started/pattern-matching.html)
* [String](#string)

### String
```Elixir
  iex> "he" <> rest = "hello"
  "hello"
  iex> rest
  "llo"
```
- Usage
```Elixir
  def stringPattern("Bearer " <> incoming_token) do
    incoming_token
  end

  iex> stringPattern("Bearer testing token") #=> "testing token"  
```
