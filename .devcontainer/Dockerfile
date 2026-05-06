FROM mcr.microsoft.com/devcontainers/rust:2-1-trixie

RUN curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash

RUN cargo binstall --no-confirm cargo-watch cargo-nextest cargo-llvm-cov \
    && rustup component add llvm-tools-preview
