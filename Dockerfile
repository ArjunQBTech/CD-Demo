FROM ubuntu:latest

ENV NODE_VERSION=21.4.0
RUN apt-get update
RUN sh -ci "$(curl -fsSL https://internetcomputer.org/install.sh)"
RUN export NVM_DIR="$HOME/.nvm" [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
RUN nvm --version
RUN nvm install node $NODE_VERSION
