# ---------- Stage 1: Build ----------
FROM rust:1.82 as builder

WORKDIR /usr/src/app

# Copy and build dependencies
COPY Cargo.toml Cargo.lock ./
COPY src ./src
RUN cargo build --release

# ---------- Stage 2: Runtime ----------
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y libssl-dev ca-certificates && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY --from=builder /usr/src/app/target/release/aura .
COPY static ./static

# Environment vars
ENV RUST_LOG=info
ENV PORT=8080

EXPOSE 8080
CMD ["./aura"]
