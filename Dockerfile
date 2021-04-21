# Container image that runs your code
FROM ubuntu:16.04
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get clean -y
RUN apt-get install wget -y
RUN wget http://security.ubuntu.com/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1.1_amd64.deb
RUN dpkg -i libpng12-0_1.2.54-1ubuntu1.1_amd64.deb
RUN apt-get install git -y
RUN git clone https://github.com/ledwindra/continuous-integration-stata.git

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
