defmodule AliasesExamples do
  alias IO, as: A
  def testing_alias do
    A.puts "testing"
  end
end

defmodule AliaseInFunction do

  def has_alias_io do
    alias IO, as: A
    A.puts "has alias io"
  end

  def io_no_valid_in_here do
    A.puts "IO no valid in here"
  end
end

AliasesExamples.testing_alias

AliaseInFunction.has_alias_io

AliaseInFunction.io_no_valid_in_here
