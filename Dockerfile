FROM golang:1.21

WORKDIR /usr/src/app

COPY . .

RUN go env -w GO111MODULE=off
RUN go build -o hello-world .

CMD ./hello-world