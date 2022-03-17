# Use the capui5tools for the first stage build
FROM {your-docker-account}/capui5tools as capbuild
#Base version
ENV VERSION 1.0.0
# Create app directory, in which the CAP service is built
WORKDIR /app
# Copy source
COPY components/app/orders .
# Remove any preceeding forward slashes from the dataSources uri defined in the manifest.json
RUN contents="$(jq '."sap.app".dataSources[].uri |= ltrimstr("/")' ./webapp/manifest.json )" && echo "${contents}" > ./webapp/manifest.json
# build app
RUN ui5 build

FROM node:16-slim
# Create app directory
WORKDIR /app
# Copy app and required files
COPY --from=capbuild /app/dist/. ./resources/webapp
COPY components/app/orders/xs-app.json ./resources/webapp
# COPY app/orders/annotations.cds ./resources
COPY resources/html5 .
#remove the file sap-ui-version.json which is not excepting by the html5 repo
RUN rm -rf /app/resources/sap-ui-version.json
# Install dependencies
RUN npm install  --production

EXPOSE 5000
CMD [ "npm", "start" ]