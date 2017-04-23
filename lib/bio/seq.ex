defmodule Bio.Seq do
  @moduledoc """
  Sequencing functions.
  """

  def reverse(seq) when is_binary(seq) do
    String.reverse(seq)
  end

end