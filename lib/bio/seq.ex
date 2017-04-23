defmodule Bio.Seq do
  @moduledoc """
  Sequencing functions on binaries. Operations are carried
  out eagerly.
  """

  @spec reverse(String.t) :: String.t
  def reverse(seq) when is_binary(seq) do
    String.reverse(seq)
  end

  @spec count_nucleotides(String.t) :: map
  def count_nucleotides(seq) do
    String.graphemes(seq)
    |> Enum.reduce(
      %{},
      fn(base, acc) ->
        Map.update(acc, base, 1, &(&1 + 1))
      end
      )
    |> Map.delete("\n")
  end

  @spec transcribe(String.t) :: String.t
  def transcribe(seq) do
    String.graphemes(seq)
    |> Enum.map(&to_rna/1)
    |> Enum.join()
  end

  @spec complement(String.t, atom) :: map
  def complement(seq, opts \\ [type: :dna, reverse: :true])
  def complement(seq, opts) do
    type = Keyword.get(opts, :type, :dna)
    reverse? = Keyword.get(opts, :reverse, :true) &&
      fn(seq) -> Enum.reverse(seq) end ||
      fn(seq) -> seq end
    String.graphemes(seq)
    |> Enum.map(&(complement_base(&1, type)))
    |> reverse?.()
    |> Enum.join()
  end

  @spec translate(String.t) :: map
  def translate(seq) do
    String.codepoints(seq)
    |> Enum.chunk(3)
    |> Enum.map(&Enum.join/1)
    |> Enum.map(&translate_codon/1)
    |> Enum.join()
  end

  # Seeking more efficient binary only version of
  # translate below

#  def translate(seq) do
#  end
#  defp splitter(seq) when seq == <<>> do
#    <<>>
#  end
#  defp splitter(seq, acc \\ <<>>) do
#    try do
#      <<chunk::24, rest::binary>> = seq
#      Enum.concat(chunk, splitter(rest))
#    rescue
#      e in MatchError ->
#    end
#    Enum.concat(chunk, splitter(rest))
#    |> Og.log_r(__ENV__, :error)
#  end

  defp translate_codon("UUU"), do: "F"
  defp translate_codon("CUU"), do: "L"
  defp translate_codon("AUU"), do: "I"
  defp translate_codon("GUU"), do: "V"
  defp translate_codon("UUC"), do: "F"
  defp translate_codon("CUC"), do: "L"
  defp translate_codon("AUC"), do: "I"
  defp translate_codon("GUC"), do: "V"
  defp translate_codon("UUA"), do: "L"
  defp translate_codon("CUA"), do: "L"
  defp translate_codon("AUA"), do: "I"
  defp translate_codon("GUA"), do: "V"
  defp translate_codon("UUG"), do: "L"
  defp translate_codon("CUG"), do: "L"
  defp translate_codon("AUG"), do: "M"
  defp translate_codon("GUG"), do: "V"
  defp translate_codon("UCU"), do: "S"
  defp translate_codon("CCU"), do: "P"
  defp translate_codon("ACU"), do: "T"
  defp translate_codon("GCU"), do: "A"
  defp translate_codon("UCC"), do: "S"
  defp translate_codon("CCC"), do: "P"
  defp translate_codon("ACC"), do: "T"
  defp translate_codon("GCC"), do: "A"
  defp translate_codon("UCA"), do: "S"
  defp translate_codon("CCA"), do: "P"
  defp translate_codon("ACA"), do: "T"
  defp translate_codon("GCA"), do: "A"
  defp translate_codon("UCG"), do: "S"
  defp translate_codon("CCG"), do: "P"
  defp translate_codon("ACG"), do: "T"
  defp translate_codon("GCG"), do: "A"
  defp translate_codon("UAU"), do: "Y"
  defp translate_codon("CAU"), do: "H"
  defp translate_codon("AAU"), do: "N"
  defp translate_codon("GAU"), do: "D"
  defp translate_codon("UAC"), do: "Y"
  defp translate_codon("CAC"), do: "H"
  defp translate_codon("AAC"), do: "N"
  defp translate_codon("GAC"), do: "D"
  defp translate_codon("UAA"), do: "" # "Stop"
  defp translate_codon("CAA"), do: "Q"
  defp translate_codon("AAA"), do: "K"
  defp translate_codon("GAA"), do: "E"
  defp translate_codon("UAG"), do: "" # "Stop"
  defp translate_codon("CAG"), do: "Q"
  defp translate_codon("AAG"), do: "K"
  defp translate_codon("GAG"), do: "E"
  defp translate_codon("UGU"), do: "C"
  defp translate_codon("CGU"), do: "R"
  defp translate_codon("AGU"), do: "S"
  defp translate_codon("GGU"), do: "G"
  defp translate_codon("UGC"), do: "C"
  defp translate_codon("CGC"), do: "R"
  defp translate_codon("AGC"), do: "S"
  defp translate_codon("GGC"), do: "G"
  defp translate_codon("UGA"), do: "" # "Stop"
  defp translate_codon("CGA"), do: "R"
  defp translate_codon("AGA"), do: "R"
  defp translate_codon("GGA"), do: "G"
  defp translate_codon("UGG"), do: "W"
  defp translate_codon("CGG"), do: "R"
  defp translate_codon("AGG"), do: "R"
  defp translate_codon("GGG"), do: "G"




  defp complement_base("A", :dna), do: "T"
  defp complement_base("T", :dna), do: "A"
  defp complement_base("C", :dna), do: "G"
  defp complement_base("G", :dna), do: "C"

  defp to_rna("T"), do: "U"
  defp to_rna(other), do: other

end