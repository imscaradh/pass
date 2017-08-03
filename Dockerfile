FROM alpine:3.6
ARG WORK_DIR="/opt/pass"
ARG PASS_VERSION="1.7.1"
RUN apk update && apk add git make bash gnupg findutils openssh tree pwgen && mkdir -p $WORK_DIR
RUN cd $WORK_DIR && git clone https://git.zx2c4.com/password-store && cd password-store && git checkout tags/$PASS_VERSION
RUN make --directory $WORK_DIR/password-store install
RUN pass init "Password Store Key"
ENTRYPOINT ["pass"]
CMD []
