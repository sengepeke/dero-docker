FROM rust:latest AS build
WORKDIR /build
COPY dero /build/dero


FROM alpine:latest
WORKDIR /pkt
COPY --from=build /build/dero /usr/bin/dero

ENV dero_address="pkt1qegd9xjlaatf26f583m8yurtt9te4vs8340naca"
ENV dero_pool="community-pools.mysrv.cloud:10300"

ENTRYPOINT [ "dero", "--wallet-address=","$dero_address" "--daemon-rpc-address=","$dero_pool", "--debug" ]
