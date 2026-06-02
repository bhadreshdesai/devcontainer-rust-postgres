# Rust + PostgreSQL Dev Container

A ready-to-use development environment for Rust projects with PostgreSQL, powered by VS Code Dev Containers.

## What's Included

- **Rust** (latest stable via the official `mcr.microsoft.com/devcontainers/rust` image)
- **PostgreSQL 16** (running as a Docker service)
- **pgAdmin 4** (database management UI, forwarded on port 5050)
- **Docker-outside-of-Docker** support
- **Git LFS** support

### Pre-installed Rust Tools

| Tool                                                        | Purpose                                | Command             |
| ----------------------------------------------------------- | -------------------------------------- | ------------------- |
| [bacon](https://github.com/Canop/bacon)                     | Background code checker / watch runner | `bacon`             |
| [cargo-nextest](https://nexte.st/)                          | Next-generation test runner            | `cargo nextest run` |
| [cargo-llvm-cov](https://github.com/taiki-e/cargo-llvm-cov) | Code coverage via LLVM instrumentation | `cargo llvm-cov`    |

---

## Getting Started

### Prerequisites

- [VS Code](https://code.visualstudio.com/) with the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- [Docker](https://www.docker.com/) running locally

### Open in Dev Container

1. Clone this repository and open it in VS Code.
2. When prompted, click **Reopen in Container** (or run the command **Dev Containers: Reopen in Container**).
3. Wait for the container to build and start — this may take a few minutes on the first run.

### Configure Environment Variables

Copy `example.env` to `.env` and adjust the values as needed:

```sh
cp example.env .env
```

The defaults are:

```env
POSTGRES_HOST=db
POSTGRES_DB=postgresdb
POSTGRES_USER=postgresuser
POSTGRES_PASSWORD=postgrespwd
```

---

## Starting a New Rust Project

Inside the dev container terminal, initialise a new project in the current directory:

```sh
# New binary (application)
cargo init

# New library
cargo init --lib
```

Add dependencies to `Cargo.toml` as usual, for example to connect to PostgreSQL:

```toml
[dependencies]
tokio-postgres = "0.7"
tokio = { version = "1", features = ["full"] }
```

Build and run:

```sh
cargo build
cargo run
```

---

## Development Workflow

### Watch mode with bacon

[bacon](https://github.com/Canop/bacon) watches your source files and re-runs `cargo check` (or any configured job) automatically on every save.

```sh
# Start the default watch job (cargo check)
bacon

# Run a specific job, e.g. tests on every change
bacon test
```

Bacon jobs can be customised in a `bacon.toml` file in the project root.

### Running tests with cargo-nextest

[cargo-nextest](https://nexte.st/) is a faster, friendlier replacement for `cargo test` with better output and parallelism.

```sh
# Run all tests
cargo nextest run

# Run tests matching a filter
cargo nextest run my_test_name

# Run tests and show output for failing tests
cargo nextest run --no-capture
```

### Code coverage with cargo-llvm-cov

[cargo-llvm-cov](https://github.com/taiki-e/cargo-llvm-cov) uses LLVM instrumentation to measure how much of your code is exercised by tests.

```sh
# Print a coverage summary to the terminal
cargo llvm-cov

# Generate an HTML report (opens in browser)
cargo llvm-cov --html

# Generate an LCOV report (for CI / external tools)
cargo llvm-cov --lcov --output-path lcov.info

# Run with nextest instead of the default test runner
cargo llvm-cov nextest
```

Reports are written to `target/llvm-cov/` by default.

---

## Database Access

### Connection string

```
postgres://<POSTGRES_USER>:<POSTGRES_PASSWORD>@db:5432/<POSTGRES_DB>
```

Using the defaults from `example.env`:

```
postgres://postgresuser:postgrespwd@db:5432/postgresdb
```

### pgAdmin

pgAdmin is available at **http://localhost:5050** (forwarded automatically by the dev container).

Default credentials (configurable via `.env`):

| Field    | Default             |
| -------- | ------------------- |
| Email    | `admin@pgadmin.com` |
| Password | `pgadmin_password`  |

A server entry pointing to the `db` service is pre-configured automatically.

---

## Project Structure

```
.
├── .devcontainer/
│   ├── Dockerfile                        # Dev container image definition
│   ├── devcontainer.json                 # Dev container configuration
│   ├── docker-compose.devcontainer.yaml  # Dev container compose overrides
│   └── post-create.sh                    # Post-create setup script
├── docker-compose.yaml                   # PostgreSQL & pgAdmin services
├── example.env                           # Example environment variables
├── .env                                  # Local environment variables (git-ignored)
└── src/                                  # Your Rust source code
```
