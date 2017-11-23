FROM alpine:3.6

MAINTAINER john barnes <jbarnes7952@gmail.com>
LABEL Name=tac_plus
LABEL Version=0.0.1

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/jbarnes7952/alpine_base.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0.0-rc1"

RUN apk add--update \
    tacacs+ \
    supervisord

RUN ln -sf /dev/stdout /var/log/tac_plus.acct 

COPY tac_plus.conf /etc/tacacs+/tac_plus.conf

ENTRYPOINT ["/usr/sbin/tac_plus", "-G", "-g", "-C", "/etc/tacacs+/tac_plus.conf"]

EXPOSE 49


