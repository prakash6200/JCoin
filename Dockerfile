FROM golang:1.14

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN cd blockchain_server/ go build -o /docker-gs-ping

EXPOSE 8080

ENV GIN_MODE=release

CMD [ "/docker-gs-ping" ]
