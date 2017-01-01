FROM emorymerryman/base:0.0.5
MAINTAINER Emory Merryman emory.merryman@gmail.com
RUN \
    apk update && \
    apk upgrade && \
    apk add git make bash && \
    WORK_DIR=$(mktemp -d) && \
    git -C ${WORK_DIR} init && \
    git -C ${WORK_DIR} remote add origin https://git.zx2c4.com/password-store && \
    git -C ${WORK_DIR} fetch origin && \
    git -C ${WORK_DIR} checkout tags/1.6.5 && \
    make --directory ${WORK_DIR} install && \
    rm -rf ${WORK_DIR} && \
    apk del git make && \
    true
ENTRYPOINT ["/usr/bin/pass"]
CMD []
