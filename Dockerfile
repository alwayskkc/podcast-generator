FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3.10 \ 
    python3-pip \
    git

RUN pip3 install --upgrade pip \
    && pip3 install --no-cache-dir PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]