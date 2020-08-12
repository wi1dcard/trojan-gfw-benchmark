FROM buildpack-deps:buster-curl as builder

ARG TROJAN_VERSION=1.16.0

RUN curl -L -o /tmp/trojan.tar.xz \
        https://github.com/trojan-gfw/trojan/releases/download/v${TROJAN_VERSION}/trojan-${TROJAN_VERSION}-linux-amd64.tar.xz

RUN apt update && apt install xz-utils
RUN tar xJf /tmp/trojan.tar.xz

FROM ubuntu:focal

COPY --from=builder /trojan /trojan
WORKDIR /trojan

RUN ln -s /trojan/trojan /usr/bin/trojan
CMD [ "trojan" ]
