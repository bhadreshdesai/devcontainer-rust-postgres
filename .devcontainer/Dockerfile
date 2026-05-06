FROM mcr.microsoft.com/devcontainers/rust:2-1-trixie

RUN cargo install cargo-watch --locked \
    && cargo install cargo-nextest --locked \
    && cargo install cargo-llvm-cov --locked \
    && rustup component add llvm-tools-preview