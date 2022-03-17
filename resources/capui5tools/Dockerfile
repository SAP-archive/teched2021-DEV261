# Use the Node version that matches the version you have installed locally
FROM node:16-slim
#Base version
ENV VERSION 1.0.0
# install ui5 tooling
RUN npm i -g @ui5/cli
# Install cap tooling
RUN npm i -g @sap/cds-dk
# install ssl libraries
RUN apt-get update
RUN apt-get install -y openssl python make g++
# Install jq
RUN apt-get install -y wget
RUN wget -O jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 && chmod +x ./jq && cp jq /usr/bin

