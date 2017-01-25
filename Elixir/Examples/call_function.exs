defmodule CallFuction do
  def put_a do
    IO.puts "AAAAAA"
  end
end

defmodule CallFunctionExe do
  a_map= %{afunc: &CallFuction.put_a/0}
  a_map[:afunc].()
end
