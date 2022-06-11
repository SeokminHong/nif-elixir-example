use rustler::{Encoder, Env, Error as NifError, LocalPid, NifResult, OwnedEnv};

#[rustler::nif]
fn add(a: i64, b: i64) -> i64 {
    a + b
}

#[rustler::nif]
fn div(a: f64, b: f64) -> NifResult<f64> {
    if b == 0.0 {
        Err(NifError::Atom("div_by_zero"))
    } else {
        Ok(a / b)
    }
}

#[rustler::nif]
fn panic() {
    panic!("panic");
}

#[rustler::nif]
fn send_message(env: Env, pid: LocalPid, message: String) {
    let msg = message.encode(env);
    env.send(&pid, msg);
}

/// An asynchronous job that takes the given number of seconds to complete.
/// The function returns `1`.
async fn some_task(delay: f64) -> i32 {
    std::thread::sleep(std::time::Duration::from_secs_f64(delay));
    1
}

#[rustler::nif]
fn start_some_task(pid: LocalPid, delay: f64) {
    // Spawn a new thread to run the task.
    // The asynchronous job will run in the background.
    std::thread::spawn(move || {
        // tokio runtime is used to run the asynchronous task.
        let runtime = tokio::runtime::Runtime::new().unwrap();
        runtime.block_on(async move {
            let ret = some_task(delay).await;
            // Owned environment is the local environment of the NIF.
            // It is used to encode the Rust values to NIF terms.
            let mut owned_env = OwnedEnv::new();
            owned_env.send_and_clear(&pid, |env| ("some_task", ret).encode(env));
        });
    });
}

rustler::init!(
    "Elixir.Calc",
    [add, div, panic, send_message, start_some_task]
);
