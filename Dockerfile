FROM rem/rpi-golang-1.7:latest

RUN go get github.com/influxdata/influxdb

WORKDIR $GOPATH/src/github.com/influxdata

RUN go get ./...
RUN go build ./...

ADD config.toml /

EXPOSE 8086

VOLUME ["/influxdb"]

CMD ["-config=/config.toml"]
ENTRYPOINT ["/gopath/bin/influxd"]



    



