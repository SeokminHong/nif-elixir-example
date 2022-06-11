#[rustler::nif]
fn add(a: i64, b: i64) -> i64 {
    a + b
}

#[rustler::nif]
fn div(a: f64, b: f64) -> f64 {
    a / b
}

#[rustler::nif]
fn panic() {
    panic!("panic");
}

rustler::init!("Elixir.Calc", [add, div, panic]);
