FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \

RUN pip3 install pyYAML

COPY feed.py C:/Users/yashk/Desktop/Pandas/feed.py

COPY entrypoint.sh C:/Users/yashk/Desktop/entrypoint.sh

ENTRYPOINT [ "C:/Users/yashk/Desktop/entrypoint.sh" ]