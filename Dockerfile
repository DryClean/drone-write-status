FROM alpine:3.4

RUN apk update && \
  apk add \
    ca-certificates \
    git \
    nodejs && \
  rm -rf \
    /var/cache/apk/*

WORKDIR /node

ADD drone-write-status /node/
ADD run.js /node/

RUN chmod +x /node/drone-write-status

ENTRYPOINT ["/node/drone-write-status"]
