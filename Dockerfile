# This image is used for golang app development and building.
# Included:
# - Builiding deps;
# - Protoc;
# - Cobra;
# - Reflex;
# - Git;
FROM golang:1.15-alpine

# Default directory is set outside of $GOPATH in order to
# make process of modular dev easier.
WORKDIR /src

# GNU C Library (required for gPRC code generator)
# https://github.com/sgerrand/alpine-pkg-glibc
ENV GLIBC_VER 2.32-r0
# Protocol buffer compiler
# https://github.com/protocolbuffers/protobuf
ENV PROTOC_VER 3.14.0

RUN wget -qO /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
  && wget -qO /tmp/glib.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/$GLIBC_VER/glibc-$GLIBC_VER.apk \
  && apk add --no-cache \
    /tmp/glib.apk \
    git \
    gcc \
    musl-dev \
  && wget -qO- https://github.com/protocolbuffers/protobuf/releases/download/v$PROTOC_VER/protoc-$PROTOC_VER-linux-x86_64.zip | busybox unzip -d /tmp - \
  && chmod -R 777 /tmp \
  && cp /tmp/bin/protoc /usr/local/bin \
  && cp -r /tmp/include /usr/local/include \
  && rm /etc/apk/keys/sgerrand.rsa.pub \
  && go get -u github.com/cespare/reflex \
  && go get -u github.com/spf13/cobra/cobra \
  && go get -u google.golang.org/protobuf/cmd/protoc-gen-go \
  && rm -rf /tmp/*
  
EXPOSE 80

CMD reflex -r '\.go' -s go run .
