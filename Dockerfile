FROM golang:alpine AS builder

WORKDIR /usr/src/app

COPY . .

RUN go env -w GO111MODULE=off
RUN go build -o hello-world .

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app . 

ENTRYPOINT [ "./hello-world" ]