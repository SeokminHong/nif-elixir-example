defmodule Calc do
  use Rustler, otp_app: :rustler_nif, crate: :calc

  @spec add(integer(), integer()) :: integer()
  def add(_a, _b), do: error()

  @spec div(float(), float()) :: float()
  def div(_a, _b), do: error()

  @spec panic() :: no_return()
  def panic(), do: error()

  @spec send_message(pid(), binary()) :: no_return()
  def send_message(_pid, _msg), do: error()

  @spec start_some_task(pid(), float()) :: no_return()
  def start_some_task(_pid, _delay), do: error()

  defp error(), do: :erlang.nif_error(:nif_not_loaded)
end
