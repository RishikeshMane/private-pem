FROM ubuntu:16.04

MAINTAINER Rishikesh Mane

RUN apt-get -y update
RUN apt-get install -y telnet
RUN apt install -y curl
RUN apt install -y ffmpeg

EXPOSE 5000

ENTRYPOINT echo "Welcome to Image"
