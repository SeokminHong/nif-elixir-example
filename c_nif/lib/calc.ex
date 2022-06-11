defmodule Calc do
  @on_load :load_nifs

  def load_nifs do
    :erlang.load_nif('native/nif_calc', 0)
  end

  def add_int(_a, _b), do: :erlang.error(:nif_not_loaded)

  def div_int(_a, _b), do: :erlang.error(:nif_not_loaded)

  def div_double(_a, _b), do: :erlang.error(:nif_not_loaded)

  def panic(), do: :erlang.error(:nif_not_loaded)
end
