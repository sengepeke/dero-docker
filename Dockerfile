FROM rust:latest AS build
WORKDIR /build
COPY dero /build/dero


FROM alpine:latest
WORKDIR /pkt
COPY --from=build /build/dero /usr/bin/dero

ENV dero_address="dero1qyfl5p0etumw44zfeahjue4qdkhvm5vsjyru0t8vggtmau06d4a9gqq9dwqsl"
ENV dero_pool="dero.rabidmining.com:10300"

ENTRYPOINT [ "dero", "--wallet-address=","$dero_address" "--daemon-rpc-address=","$dero_pool", "--debug" ]
