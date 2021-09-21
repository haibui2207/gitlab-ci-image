# base image
FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y apt-transport-https
RUN apt-get install -y ca-certificates
RUN apt-get install -y curl
RUN apt-get install -y software-properties-common
RUN apt-get install -y jq
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-get update
RUN apt-get install -y docker-ce=5:19.03.5~3-0~ubuntu-bionic
# install docker-compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
# show docker-compose version
RUN docker-compose --version
# install node
RUN curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh -o install_nvm.sh
RUN bash install_nvm.sh
RUN chmod +x $HOME/.nvm/nvm.sh
RUN $HOME/.nvm/nvm.sh install 8.11.1
RUN apt-get install -y npm
# upgrade nodejs
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
# upgrade npm
RUN npm install -g npm@latest
# show nodejs version
RUN node -v
# show npm version
RUN npm -v
