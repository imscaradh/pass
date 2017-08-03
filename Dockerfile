FROM alpine:3.6
COPY run.sh /opt/pass/
RUN ["/bin/sh", "/opt/pass/run.sh"]
ENTRYPOINT ["pass"]
CMD []
