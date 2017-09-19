
FROM ubuntu:16.04

MAINTAINER john barnes <jbarnes7952@gmail.com> 

LABEL Name=tac_plus
LABEL Version=1.0.0

RUN apt update && \
    apt -y install rsyslog tacacs+ nscd  

RUN service rsyslog start

RUN ln -sf /dev/stdout /var/log/tac_plus.acct 

COPY tac_plus.conf /etc/tacacs+/tac_plus.conf

ENTRYPOINT ["/usr/sbin/tac_plus", "-G", "-g", "-C", "/etc/tacacs+/tac_plus.conf"]

EXPOSE 49


