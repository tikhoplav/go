# This image is used for golang app development and building.
# Included:
# - Builiding deps;
# - Protoc (for gRPC service dev);
# - Cobra (for cli dev);
# - Reflex (for auto rerun on save);
# - Git (for modules downloads);
FROM golang:1.15-alpine

# Default directory is set outside of $GOPATH in order to
# make process of modular dev easier.
WORKDIR /src

RUN apk add --no-cache \
    protoc \
    git \
    gcc \
    musl-dev \
  && go get -u github.com/cespare/reflex \
  && go get -u github.com/spf13/cobra/cobra \
  && go get -u google.golang.org/protobuf/cmd/protoc-gen-go
  
EXPOSE 80

CMD reflex -r '\.go' -s go run .
