#using the fn operator

defmodule Secrets do

  def secret_add(secret), do: fn x -> x + secret end

  def secret_subtract(secret), do: fn x -> x - secret end

  def secret_multiply(secret), do: fn x -> x * secret end

  def secret_divide(secret), do: fn x -> div(x, secret) end

  def secret_and(secret), do: fn x -> Bitwise.band(x, secret) end

  def secret_xor(secret), do: fn x -> Bitwise.bxor(x, secret) end

  def secret_combine(secret_function1, secret_function2) do
    fn x -> secret_function2.(secret_function1.(x)) end
  end

end


#using the & operator

defmodule SecretsAnd do

  def secret_add(secret), do: &(&1 + secret)

  def secret_subtract(secret), do: &(&1 - secret)

  def secret_multiply(secret), do: &(&1 * secret)

  def secret_divide(secret),do: &(div(&1, secret))

  def secret_and(secret), do: &(Bitwise.band(&1, secret))

	def secret_xor(secret), do: &(Bitwise.bxor(&1, secret))

	def secret_combine(secret_function1, secret_function2), do: &(secret_function2.(secret_function1.(&1)))

end
