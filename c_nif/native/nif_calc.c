#include <stdio.h>
#include <erl_nif.h>
#include "lib/calc.h"

static ERL_NIF_TERM add_int_nif(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    int a, b, result;
    enif_get_int(env, argv[0], &a);
    enif_get_int(env, argv[1], &b);
    result = add_int(a, b);
    return enif_make_int(env, result);
}

static ERL_NIF_TERM div_int_nif(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    int a, b, result;
    enif_get_int(env, argv[0], &a);
    enif_get_int(env, argv[1], &b);
    result = div_int(a, b);
    return enif_make_int(env, result);
}

static ERL_NIF_TERM div_double_nif(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    double a, b, result;
    enif_get_double(env, argv[0], &a);
    enif_get_double(env, argv[1], &b);
    result = div_double(a, b);
    return enif_make_double(env, result);
}

static ERL_NIF_TERM panic_nif(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    panic();
    return enif_make_atom(env, "ok");
}

static ErlNifFunc nif_funcs[] = {
    {"add_int", 2, add_int_nif},
    {"div_int", 2, div_int_nif},
    {"div_double", 2, div_double_nif},
    {"panic", 0, panic_nif},
};

ERL_NIF_INIT(Elixir.Calc, nif_funcs, NULL, NULL, NULL, NULL)
