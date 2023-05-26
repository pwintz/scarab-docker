# syntax=docker/dockerfile:1
FROM ubuntu:20.04	

COPY scarab scarab 
COPY pins pins 

RUN apt-get update 
RUN apt-get install -y \
	python3-pip \
	python2 # Required by run_portabilize_trace.sh

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

# Add the DynamoRIO binaries directory to path.
ENV PATH /scarab/src/build/opt/deps/dynamorio/bin64:$PATH
# Add the directory containing the Scarab binary to the path.
ENV PATH /scarab/src/build/opt:$PATH

# Define environment variables that point to the root 
# directories of DynamoRIO and Scarab. 
ENV DYNAMORIO_ROOT /scarab/src/build/opt/deps/dynamorio
ENV SCARAB_ROOT=/scarab

COPY example_trace_ls example_trace_ls
