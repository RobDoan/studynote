defmodule TestCase do
  def is_abc("Bearer " <> incoming_token) do
    IO.puts(incoming_token)    
  end

end

defmodule CallMode do
  TestCase.is_abc("Bearer Testing")
  IO.puts __MODULE__
end
