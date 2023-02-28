# syntax=docker/dockerfile:1
FROM ubuntu:20.04	

COPY scarab scarab 
COPY pins pins 

RUN apt-get update 
RUN apt-get install -y \
	python3-pip

RUN pip install -r /scarab/bin/requirements.txt

# Install tzdata separately with variables defined to prevent prompts during the installation.
RUN DEBIAN_FRONTEND=noninteractive TZ=America/Los_Angelos apt-get -y install tzdata
RUN apt-get install -y \
	clang \
	g++ \
	gpp \
	git \
	cmake

ENV PIN_ROOT=/pins/pinplay-drdebug-3.5-pin-3.5-97503-gac534ca30-gcc-linux
ENV SCARAB_ENABLE_MEMTRACE=1

RUN apt-get install -y \
	libsnappy-dev \
	libconfig++-dev
RUN cd scarab/src && make



