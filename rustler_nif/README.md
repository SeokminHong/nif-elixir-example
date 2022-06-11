# Rustler Nif

## Build

```sh
mix deps.get
mix compile
```

## Run

```elixir
iex> Calc.add(1, 2)
3

iex> Calc.div(5.0, 2.0)
2.5

# float should be provided.
iex> Calc.div(1, 2)
** (ArgumentError) argument error
    (rustler_nif 0.1.0) Calc.div(1, 2)

iex> Calc.div(1.0, 0.0)
:div_by_zero

# Trigger NIF side crash
iex> Calc.panic()
             ** (ErlangError) Erlang error: :nif_panicked
    (rustler_nif 0.1.0) Calc.panic()

# Send a message to self
iex> Calc.send_message(self(), "hello")
{}
iex> receive do
...>   v -> v
...> end
"hello"

# Start an asynchronous job
iex> Calc.start_some_task(self(), 10.0)
{}
# Receive the finish callback
iex> receive do
...>   {"some_task", v} -> v
...> end
1 # The message arrived after 10s.
```
