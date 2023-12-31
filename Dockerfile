FROM golang:alpine

WORKDIR /usr/src/app

COPY go.mod ./
RUN go mod download && go mod verify

COPY . .
RUN go build -v -o /usr/local/bin/app ./...

FROM scratch

COPY --from=0 /usr/local/bin/app /usr/local/bin/app

CMD [ "app" ]
