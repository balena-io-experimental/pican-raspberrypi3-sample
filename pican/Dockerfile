FROM balenalib/raspberrypi3-debian:stretch

RUN apt update && \
    apt install -y can-utils

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "candump", "-ta", "can0" ]