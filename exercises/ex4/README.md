# Exercise 4 - GENERATE TOOLS BASE IMAGE

The CAP application relies on a number of different tools which are needed to build and deploy the application. To streamline the installation of these components, a base or parent image can be used with these tools already installed. This container is setup with the cds and ui5 build tools, openssl and jq and used by the other containers as their parent image:

- build and push the docker image to your container repository

```shell
docker build -t {your-docker-account}/capui5tools -f ./deployers/capui5tools/Dockerfile .

docker push {your-docker-account}/capui5tools
```

Continue to - [Exercise 5 - GENERATE THE CAP DATABASE](../ex5/README.md)
