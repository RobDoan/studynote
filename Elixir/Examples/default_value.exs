defmodule DeafaultValue do
  def printString(defaut_string \\ "Default", s) do
    IO.puts s
    IO.puts defaut_string
  end
end


DeafaultValue.printString("This is not default string")
