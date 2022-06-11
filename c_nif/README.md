# c_nif

## Build

```sh
cd native
gcc -o lib_calc.so -c lib/calc.c
export INCLUDES=-I/{YOUR_INSTALL_PATH}/erlang/{VERSION}/usr/include
# x86
gcc $INCLUDES -shared -o nif_calc.so -fPIC nif_calc.c lib_calc.so
# ARM
gcc $INCLUDES -o nif_calc.so -undefined dynamic_lookup -dynamiclib nif_calc.c lib_calc.so
```

## Run

```elixir
iex> Calc.add_int(1, 2)
3
```
