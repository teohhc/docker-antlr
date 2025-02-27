#
# setup:
#  docker create --name antlr petervaczi/antlr
#  sudo docker cp antlr:docker-antlr /usr/local/bin/
#  docker rm antlr
#
# use:
#  docker-antlr <antlr-options>
#

FROM ibmjava:8-sdk-alpine
MAINTAINER Peter Vaczi <peter.vaczi@gmail.com>

ENV ANTLR_VERSION 4.7.2
ENV CLASSPATH .:/antlr-${ANTLR_VERSION}-complete.jar:$CLASSPATH

ADD http://www.antlr.org/download/antlr-${ANTLR_VERSION}-complete.jar /
RUN chmod +r /antlr-${ANTLR_VERSION}-complete.jar

COPY rootfs/ /

ENTRYPOINT ["/usr/bin/antlr"]
