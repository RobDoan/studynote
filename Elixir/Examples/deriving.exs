defprotocol Size do
  @doc "Calculates the size (and not the length!) of a data structure"
  def size(data)
end

defmodule User do
  defstruct [:name, :age]
end


defimpl Size, for: User do
  def size(_), do: 1
end

defimpl Size, for: Any do
  def size(_), do: 0
end

defmodule OtherUser do
  @derive Size
  defstruct [:name, :age]
end

defmodule TestDerive do
  user = %User{name: "Quy", age: 33}
  Size.size(user) #=> 1

  other_user = %OtherUser{name: "Quy", age: 20}
  Size.size(other_user) #=> 0

end
