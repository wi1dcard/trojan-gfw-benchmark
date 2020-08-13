FROM buildpack-deps:buster-curl as builder

ARG TROJAN_GO_VERSION=0.8.1

RUN apt update && apt install -y unzip

RUN curl -L -o /tmp/trojan.zip \
        https://github.com/p4gefau1t/trojan-go/releases/download/v${TROJAN_GO_VERSION}/trojan-go-linux-amd64.zip

RUN unzip /tmp/trojan.zip -d /trojan

FROM ubuntu:focal

RUN apt update && apt install -y \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /trojan /trojan
WORKDIR /trojan

RUN ln -s /trojan/trojan-go /usr/bin/trojan-go
CMD [ "trojan-go", "-config", "/config/config.json" ]
