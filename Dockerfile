FROM golang:1.13.8-alpine3.11 AS builder

WORKDIR /usr/src/app

COPY . .

RUN go env -w GO111MODULE=off
RUN go build -o hello-world .

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app . 

ENTRYPOINT [“/hello-world”]