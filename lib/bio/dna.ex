defmodule Bio.DNA do
  @moduledoc """
  Key value pairings for unambiguous DNA and
  ambiguous DNA as per the IUPAC specification..

  ## unambiguous DNA

  "A" => "A", # adenine
  "C" => "C", # cytosine
  "G" => "G", # guanine
  "T" => "T" # thymine

  ## ambiguous DNA

  "A" => "A", # adenine
  "C" => "C", # cytosine
  "G" => "G", # guanine
  "T" => "T", # thymine
  "R" => ["A", "G"], # purine
  "Y" => ["C", "T"], # pyrimidine
  "K" => ["G", "T"], # keto
  "M" => ["A", "C"], # amino
  "S" => ["G", "C"], # 3 H-bonds [weaker bond]
  "W" => ["A", "T"], # 2 H-bonds [stronger bond]
  "B" => ["C", "G", "T"], # not A
  "D" => ["A", "G", "T"], # not C
  "H" => ["A", "C", "T"], # not G
  "V" => ["A", "C", "G"], # not T
  "N" => ["A", "C", "G", "T"] # any base
  """


  @doc """
  Key value pairings for unambiguous DNA.

  ## Args

  - case (default = `:up`)

    - `:up`: returns upcase keys only.
    - `:down`: returns downcase keys only.
    - `:mixed`: returns upcase and downcase keys.
  """
  @spec unambiguous(atom) :: map
  def unambiguous(case \\ :up)
  def unambiguous(:up) do
    %{
      "A" => "A",
      "C" => "C",
      "G" => "G",
      "T" => "T"
    }
  end
  def unambiguous(:down) do
    %{
      "a" => "A",
      "c" => "C",
      "g" => "G",
      "t" => "T"
    }
  end
  def unambiguous(:mixed) do
    Map.merge(unambiguous(:up), unambiguous(:down))
  end

  @doc """
  Binary keys for unambiguous DNA.

  ## Args

  - case (default = `:up`)

    - `:up`: returns upcase keys only.
    - `:down`: returns downcase keys only.
    - `:mixed`: returns upcase and downcase keys.
  """
  @spec unambiguous_keys(atom) :: list
  def unambiguous_keys(case \\ :up)
  def unambiguous_keys(:up) do
    ["A", "C", "G", "T"]
  end
  def unambiguous_keys(:down) do
    ["a", "c", "g", "t"]
  end
  def unambiguous_keys(:mixed) do
    Enum.concat(unambiguous_keys(:down), unambiguous_keys(:up))
  end

  @doc """
  Key value pairings for ambiguous DNA.

  ## Args

  - case (default = `:up`)

    - `:up`: returns upcase keys only.
    - `:down`: returns downcase keys only.
    - `:mixed`: returns upcase and downcase keys.
  """
  @spec ambiguous(atom) :: map
  def ambiguous(case \\ :up)
  def ambiguous(:up) do
    %{
      "A" => "A",
      "C" => "C",
      "G" => "G",
      "T" => "T",
      "R" => ["A", "G"], # purine
      "Y" => ["C", "T"], # pyrimidine
      "K" => ["G", "T"], # keto
      "M" => ["A", "C"], # amino
      "S" => ["G", "C"], # 3 H-bonds [weaker bond]
      "W" => ["A", "T"], # 2 H-bonds [stronger bond]
      "B" => ["C", "G", "T"], # not A
      "D" => ["A", "G", "T"], # not C
      "H" => ["A", "C", "T"], # not G
      "V" => ["A", "C", "G"], # not T
      "N" => ["A", "C", "G", "T"] # any base
    }
  end
  def ambiguous(:down) do
    %{
      "a" => "A",
      "c" => "C",
      "g" => "G",
      "t" => "T",
      "r" => ["A", "G"], # purine
      "y" => ["C", "T"], # pyrimidine
      "k" => ["G", "T"], # keto
      "m" => ["A", "C"], # amino
      "s" => ["G", "C"], # 3 H-bonds [weaker bond]
      "w" => ["A", "T"], # 2 H-bonds [stronger bond]
      "b" => ["C", "G", "T"], # not A
      "d" => ["A", "G", "T"], # not C
      "h" => ["A", "C", "T"], # not G
      "v" => ["A", "C", "G"], # not T
      "n" => ["A", "C", "G", "T"] # any base
    }
  end
  def ambiguous(:mixed) do
    Map.merge(ambiguous(:up), ambiguous(:down))
  end

  @doc """
  Binary keys for ambiguous DNA.

  ## Args

  - case (default = `:upper`)

    - `:up`: returns upcase keys only.
    - `:down`: returns downcase keys only.
    - `:mixed`: returns upcase and downcase keys.
  """
  @spec ambiguous_keys(atom) :: list
  def ambiguous_keys(case \\ :upper)
  def ambiguous_keys(:up) do
    ["A", "B", "C", "D", "G", "H", "K", "M", "N", "R", "S", "T", "V", "W", "Y"]
  end
  def ambiguous_keys(:down) do
    ["a", "b", "c", "d", "g", "h", "k", "m", "n", "r", "s", "t", "v", "w", "y"]
  end
  def ambiguous_keys(:mixed) do
    Enum.concat(ambiguous_keys(:down), ambiguous_keys(:up))
  end

end