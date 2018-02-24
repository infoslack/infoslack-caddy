FROM abiosoft/caddy:builder as builder
ARG version="0.10.11"
ARG plugins="git"
RUN VERSION=${version} PLUGINS=${plugins} /bin/sh /usr/bin/builder.sh

FROM alpine:3.7
LABEL caddy_version="0.10.11"
RUN apk add --no-cache openssh-client git
COPY --from=builder /install/caddy /usr/bin/caddy
COPY Caddyfile /etc/Caddyfile
