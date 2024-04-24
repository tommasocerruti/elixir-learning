defmodule RPNCalculator.Exception do

  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  defmodule StackUnderflowError do
    defexception message: "stack underflow occurred"

    @impl true
    def exception(value) do
      case value do
        [] ->
          %StackUnderflowError{}
        _ ->
          %StackUnderflowError{message: "stack underflow occurred, context: " <> value}
      end
    end
  end

  def divide([]), do: raise(StackUnderflowError, "when dividing")

  def divide([_]), do: raise(StackUnderflowError, "when dividing")

  def divide([0, _]), do: raise DivisionByZeroError

  def divide([denum, num]), do: num/denum

end
