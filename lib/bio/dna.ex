defmodule Bio.DNA do
  @moduledoc """
  Key value pairings for unambiguous DNA.
  """
  defstruct [
    a: "A",
    c: "C",
    g: "G",
    t: "T"
  ]

  @doc """
  Key value pairings for unambiguous DNA.

  ## Args

  - case (default = `:up`)

    - `:up`: returns upcase keys only.
    - `:down`: returns downcase keys only.
    - `:mixed`: returns upcase and downcase keys.
  """
  @spec kv(atom) :: map
  def kv(case \\ :up)
  def kv(:up) do
    %{
      "A" => "A",
      "C" => "C",
      "G" => "G",
      "T" => "T"
    }
  end
  def kv(:down) do
    %{
      "a" => "A",
      "c" => "C",
      "g" => "G",
      "t" => "T"
    }
  end
  def kv(:mixed) do
    Map.merge(kv(:up), kv(:down))
  end

  @doc """
  Binary keys for unambiguous DNA.

  ## Args

  - case (default = `:up`)

    - `:up`: returns upcase keys only.
    - `:down`: returns downcase keys only.
    - `:mixed`: returns upcase and downcase keys.
  """
  @spec keys(atom) :: list
  def keys(case \\ :up)
  def keys(:up) do
    ["A", "C", "G", "T"]
  end
  def keys(:down) do
    ["a", "c", "g", "t"]
  end
  def keys(:mixed) do
    Enum.concat(keys(:down), keys(:up))
  end

  @moduledoc """
  Key value pairings for ambiguous DNA as per the IUPAC specification.
  """
  defmodule Ambiguous do
    defstruct [
      a: "A", # adenine
      c: "C", # cytosine
      g: "G", # guanine
      t: "T", # thymine
      r: ["A", "G"], # purine
      y: ["C", "T"], # pyrimidine
      k: ["G", "T"], # keto
      m: ["A", "C"], # amino
      s: ["G", "C"], # 3 H-bonds [weaker bond]
      w: ["A", "T"], # 2 H-bonds [stronger bond]
      b: ["C", "G", "T"], # not A
      d: ["A", "G", "T"], # not C
      h: ["A", "C", "T"], # not G
      v: ["A", "C", "G"], # not T
      n: ["A", "C", "G", "T"] # any base
    ]

    @doc """
    Key value pairings for ambiguous DNA.

    ## Args

    - case (default = `:up`)

      - `:up`: returns upcase keys only.
      - `:down`: returns downcase keys only.
      - `:mixed`: returns upcase and downcase keys.
    """
    @spec kv(atom) :: map
    def kv(case \\ :up)
    def kv(:up) do
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
    def kv(:down) do
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
    def kv(:mixed) do
      Map.merge(kv(:up), kv(:down))
    end

    @doc """
    Binary keys for ambiguous DNA.

    ## Args

    - case (default = `:upper`)

      - `:up`: returns upcase keys only.
      - `:down`: returns downcase keys only.
      - `:mixed`: returns upcase and downcase keys.
    """
    @spec keys(atom) :: list
    def keys(case \\ :upper)
    def keys(:up) do
      ["A", "B", "C", "D", "G", "H", "K", "M", "N", "R", "S", "T", "V", "W", "Y"]
    end
    def keys(:down) do
      ["a", "b", "c", "d", "g", "h", "k", "m", "n", "r", "s", "t", "v", "w", "y"]
    end
    def keys(:mixed) do
      Enum.concat(keys(:down), keys(:up))
    end

  end

end