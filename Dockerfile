FROM golang:1.16-alpine as build
WORKDIR /app
COPY . .
RUN go build -mod vendor -o hello hello.go

FROM scratch
WORKDIR /app
COPY --from=build /app/hello .
CMD ["/app/hello"]