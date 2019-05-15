FROM abiosoft/caddy:builder as builder
ARG version="1.0.0"
ARG plugins="git"
RUN VERSION=${version} PLUGINS=${plugins} /bin/sh /usr/bin/builder.sh

FROM alpine:3.9
LABEL caddy_version="1.0.0"
RUN apk add --no-cache openssh-client git
COPY --from=builder /install/caddy /usr/bin/caddy
COPY Caddyfile /etc/Caddyfile
