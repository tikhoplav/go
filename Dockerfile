FROM golang:1.15-alpine
WORKDIR /src
RUN apk add --no-cache \
    git \
    gcc \
    musl-dev \
  && go get -u github.com/cespare/reflex
  && go get -u github.com/spf13/cobra/cobra
EXPOSE 80
CMD reflex -r '\.go' -s go run .
