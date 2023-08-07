FROM alpine:3.18.2

RUN apk add curl git bash postgresql-client

COPY entrypoint.sh /docker-entrypoint.sh

CMD ["/docker-entrypoint.sh"]
