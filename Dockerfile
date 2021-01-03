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

# protobuf version
ENV PROTO_VER 3.14.0

RUN apk add --no-cache \
    git \
    gcc \
    musl-dev \
    build-base \
    autoconf \
    automake \
    libtool \
  && wget -qO- https://github.com/protocolbuffers/protobuf/releases/download/v$PROTO_VER/protobuf-cpp-$PROTO_VER.tar.gz | tar -xvzf - -C /tmp \
  && cd /tmp/protobuf-$PROTO_VER \
  && ./autogen.sh \
  && ./configure \
  && make -j 3 \
  && make check \
  && make install \
  && apk del \
    build-base \
    autoconf \
    automake \
    libtool \
  && cd /src && rm -rf /tmp/* \
  && go get -u github.com/cespare/reflex \
  && go get -u github.com/spf13/cobra/cobra \
  && go get -u google.golang.org/protobuf/cmd/protoc-gen-go
  
EXPOSE 80

CMD reflex -r '\.go' -s go run .
