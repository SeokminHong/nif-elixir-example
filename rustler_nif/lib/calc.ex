defmodule Calc do
  use Rustler, otp_app: :rustler_nif, crate: :calc

  @spec add(integer(), integer()) :: integer()
  def add(_a, _b), do: error()

  @spec div(float(), float()) :: float()
  def div(_a, _b), do: error()

  @spec panic() :: no_return()
  def panic(), do: error()

  defp error(), do: :erlang.error(:nif_not_loaded)
end
