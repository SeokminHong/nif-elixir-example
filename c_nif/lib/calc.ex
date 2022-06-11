defmodule Calc do
  @on_load :load_nifs

  def load_nifs do
    :erlang.load_nif('native/nif_calc', 0)
  end

  def add_int(_a, _b), do: error()

  def div_int(_a, _b), do: error()

  def div_double(_a, _b), do: error()

  def panic(), do: error()

  defp error(), do: :erlang.nif_error(:nif_not_loaded)
end
