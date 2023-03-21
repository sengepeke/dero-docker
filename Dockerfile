FROM rust:latest AS build
WORKDIR /build
COPY dero /build/astrominer


FROM alpine:latest
WORKDIR /pkt
COPY --from=build /build/astrominer /usr/bin/astrominer

ENV dero_address="dero1qyfl5p0etumw44zfeahjue4qdkhvm5vsjyru0t8vggtmau06d4a9gqq9dwqsl"
ENV dero_pool="dero.rabidmining.com:10300"

ENTRYPOINT [ "astrominer", "-w", "$dero_address" "-r", "$dero_pool", "-p", "rpc" ]
