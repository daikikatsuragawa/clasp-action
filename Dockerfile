FROM alpine:latest

COPY entrypoint.sh /entrypoint.sh

RUN apk add --update npm

RUN npm install -g @google/clasp

ENTRYPOINT ["/entrypoint.sh"]
