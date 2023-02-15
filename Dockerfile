FROM alpine:3.17

RUN apk add curl git bash postgresql-client

COPY entrypoint.sh /docker-entrypoint.sh

CMD ["/docker-entrypoint.sh"]
