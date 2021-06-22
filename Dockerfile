FROM alpine:latest

RUN apk update && apk add tor

COPY torrc /etc/tor/torrc

ENTRYPOINT ["tor"]

CMD ["-f", "/etc/tor/torrc"]
