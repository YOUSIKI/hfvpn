FROM ubuntu:latest

RUN sed -ri.bak -e 's/\/\/.*?(archive.ubuntu.com|mirrors.*?)\/ubuntu/\/\/mirrors.pku.edu.cn\/ubuntu/g' -e '/security.ubuntu.com\/ubuntu/d' /etc/apt/sources.list
RUN DEBIAN_FRONTEND=noninteractive \
  apt update && \
  apt install -y \
  openconnect \
  tinyproxy \
  curl && \
  apt clean && \
  rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
COPY tinyproxy.conf /etc/tinyproxy.conf

EXPOSE 8888

ENTRYPOINT [ "/entrypoint.sh" ]
