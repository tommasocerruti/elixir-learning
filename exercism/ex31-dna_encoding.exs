defmodule DNA do
  def encode_nucleotide(code_point) do
    cond do
      code_point == ?A -> 1
      code_point == ?C -> 2
      code_point == ?G -> 4
      code_point == ?T -> 8
      true -> 0
    end
  end

  def decode_nucleotide(encoded_code) do
    cond do
      encoded_code == 1 -> ?A
      encoded_code == 2 -> ?C
      encoded_code == 4 -> ?G
      encoded_code == 8 -> ?T
      true -> ?\s
    end
  end

  def encode(dna), do: do_encode(dna, <<>>)

  defp do_encode([], acc), do: acc

  defp do_encode([nucleotide | rest_of_dna], acc), do: do_encode(rest_of_dna, <<acc::bitstring, encode_nucleotide(nucleotide)::4>>)

  def decode(dna), do: do_decode(dna, [])

  defp do_decode(<<>>, acc), do: acc

  defp do_decode(<<nucleotide::4, rest_of_dna::bitstring>>, acc), do: do_decode(rest_of_dna, acc ++ [decode_nucleotide(nucleotide)])

end
