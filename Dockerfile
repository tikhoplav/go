FROM golang:1.15-alpine
WORKDIR /src
RUN apk add --no-cache \
    git \
    gcc \
    musl-dev \
  && go get github.com/cespare/reflex
EXPOSE 80
CMD reflex -r '\.go' -s go run .
