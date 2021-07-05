# syntax=docker/dockerfile:1
FROM ubuntu:20.04

WORKDIR /home

RUN apt-get update && apt-get install -y software-properties-common

RUN apt-add-repository ppa:ansible/ansible

RUN apt-get update && \
    apt-get install --yes \
    git \
    virtualbox \
    vagrant \
    ansible \
    python2 \
    curl

RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py

RUN python2 get-pip.py

RUN pip install pipenv

RUN git clone https://github.com/slesarev-hub/shardman.git

COPY setup.sh setup.sh

RUN ./setup.sh
