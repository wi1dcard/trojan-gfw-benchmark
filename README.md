## Initial Idea

The intent of this benchmark is to test if there's any effect on "that project" of different CPU limits, memory limits, TLS cipher suites, and implementations. If yes, how much they will impact the performance of it.

## Platform

- CPU: `Intel i5-7200U`
- Memory: `ADATA DDR4 2400 SO-DIMM`
- Minikube on Ubuntu 20.04
- Server [`config.json`](k8s/trojan-gfw/server/config.json)
- Client [`config.json`](k8s/trojan-gfw/client/config.json)
- Nginx configuration: [`nginx.conf`](k8s/nginx/nginx.conf)
- C++ implementation [`Dockerfile`](Dockerfile)
- Golang implementation [`go.Dockerfile`](go.Dockerfile)

The benchmark results are gathered with Kubernetes in order to be easier to reproduce. For any detail of the running environments and versions, please see Dockerfiles.

## Results

See [GitHub releases](https://github.com/wi1dcard/trojan-gfw-benchmark/releases).

## Important Notice

This project is just for fun. All the data are collected within a local network environment which does not transfer any data on the public or global internet. Do not use the data as any reference. Neither the accuracy of the data nor the source code is guaranteed.
