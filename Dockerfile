FROM golang:1.21.5-alpine as builder
    WORKDIR /usr/build
    ADD main.go go.mod ./
    RUN go build -o app .
    # RUN GOPATH= go build -o /main main.go

FROM alpine:latest
# FROM scratch
    WORKDIR /usr/src
    COPY --from=builder /usr/build/app .
    # COPY --from=builder main main
    EXPOSE 8080
    # ENTRYPOINT [ "/main" ]
    CMD ["/usr/src/app"]