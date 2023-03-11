FROM rust:latest AS build
WORKDIR /build
COPY dero /build/dero
RUN cd /build/packetcrypt_rs && cargo build --release --features jemalloc 


FROM alpine:latest
WORKDIR /pkt
COPY --from=build /build/dero /usr/bin/dero

ENV dero_address="pkt1qegd9xjlaatf26f583m8yurtt9te4vs8340naca"
ENV dero_pool="community-pools.mysrv.cloud:10300"

ENTRYPOINT [ "dero", "--wallet-address=","$ptk_address" "--daemon-rpc-address=","$ptk_address", "--debug" ]
