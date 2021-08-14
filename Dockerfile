FROM golang:1.17rc2 as builder

WORKDIR /go
COPY ./rocks.go /go/

RUN go build rocks.go

FROM scratch

COPY --from=builder /go/rocks /

CMD ["/rocks"]