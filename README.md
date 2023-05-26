# Getting Started

1. Install [Docker](https://docs.docker.com/engine/install/).
1. Run `./setup` to download the Pin files and clone the Scarab repository. This script installs gdown (via `pip`) to enable downloading from Google Drive.  
1. Run `./build` to generate the Docker container. This step includes installing dependencies and compiling the Scarab source code, so it takes a few minutes.
1. Run `./run` to run the Docker container in interactive mode. 

In the Docker container:
1. Change directory to 'example_trace_ls'.
2. Run './prepare_trace'
3. Copy the contents of 'test_scarab' to the command line. Modify the argument for memtrace_modules_log, then run.  
