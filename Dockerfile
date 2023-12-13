FROM golang:1.21 AS builder

WORKDIR /usr/src/app

COPY . .

RUN go env -w GO111MODULE=off
RUN go build -o hello-world .

FROM golang:1.21-alpine 

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app . 

CMD ./hello-world