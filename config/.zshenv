export CARGO_HOME="$HOME/SimpleMotion/.cargo"
export RUSTUP_HOME="$HOME/SimpleMotion/.rustup"
if [ -f "$CARGO_HOME/env" ]; then
    . "$CARGO_HOME/env"
fi
export PATH="$HOME/SimpleGlobal/.cargo/bin:$PATH"
