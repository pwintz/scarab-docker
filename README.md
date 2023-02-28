Getting Started

1. Install Docker.
1. Copy pins from [here](https://drive.google.com/drive/folders/1KqUUOHzuKc8Hsw-vj3lZ_9UK2qJyWcM1?usp=share_link) into `./pins/`
1. Run `sudo service docker start`.
1. Run `docker build -t test:latest .` to generate the Docker container. This step includes installing dependencies and compiling the Scarab source code, so it takes a few minutes.
1. Run `docker run -it test:latest` to run the container in interactive mode. 
