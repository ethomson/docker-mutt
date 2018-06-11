FROM ubuntu:18.04
MAINTAINER Edward Thomson, ethomson@edwardthomson.com

RUN apt-get update && \
    apt-get upgrade -y

RUN apt-get install -y \
    msmtp \
    mutt \
    vim \
    locales \
    tzdata

# Set the timezone (change this to your local timezone)
RUN echo "Europe/London" | tee /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN adduser --disabled-login --gecos '' mutt

WORKDIR /home/mutt
USER mutt

ENTRYPOINT /bin/bash -c /usr/bin/mutt
