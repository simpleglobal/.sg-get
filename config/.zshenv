# SimpleGlobal Rust toolchain
if [ -d "$HOME/SimpleGlobal/.cargo" ]; then
    export CARGO_HOME="$HOME/SimpleGlobal/.cargo"
    export RUSTUP_HOME="$HOME/SimpleGlobal/.rustup"
    [ -f "$CARGO_HOME/env" ] && . "$CARGO_HOME/env"
fi

# SimpleMotion Rust toolchain (if installed)
if [ -d "$HOME/SimpleMotion/.cargo" ]; then
    export PATH="$HOME/SimpleMotion/.cargo/bin:$PATH"
fi
