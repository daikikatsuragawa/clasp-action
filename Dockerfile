FROM alpine:3.10

COPY entrypoint.sh /entrypoint.sh

RUN apk add npm

RUN npm install -g @google/clasp

ENTRYPOINT ["/entrypoint.sh"]
