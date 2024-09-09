FROM node:alpine as downloader
ARG SU_VERSION=main

RUN apk add git llvm clang

WORKDIR /download
RUN git clone --branch=${SU_VERSION} --depth=1 https://github.com/permaweb/ao.git

FROM rust:bullseye AS builder
WORKDIR /build
COPY --from=downloader /download/ao/servers/su .

# Install clang, llvm-dev, libclang-dev, and openssl-dev for building
RUN apt-get update && apt-get install -y \
    clang \
    llvm-dev \
    libclang-dev \
    libssl-dev \
    pkg-config

RUN cargo update
RUN cargo build --release

FROM rust:bullseye
WORKDIR /app
COPY --from=builder /build/target/release/su .

RUN apt-get update && apt-get install -y libpq5

EXPOSE 80
CMD ["./su", "su", "80"]
