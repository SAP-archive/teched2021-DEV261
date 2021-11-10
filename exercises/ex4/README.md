# Exercise 4 - GENERATE TOOLS BASE IMAGE

## Goal 🎯

The CAP application relies on a number of different tools which are needed to build and deploy the application. To streamline the installation of these components, a base or parent image can be used with these tools already installed. This container is setup with the *cds* and *ui5* build tools, *openssl* and *jq*. It is thenused used by the other containers as their parent image.


## Build and Push the Docker image

Execute the following commands to first build and then push the tools base image:

```shell
docker build -t {your-docker-account}/capui5tools -f ./resources/capui5tools/Dockerfile .

docker push {your-docker-account}/capui5tools
```

## Summary

🎉 Congratulations - You've now created the tools base image that will be used as parent image of the other containers.

Continue to [Exercise 5 - GENERATE THE CAP DATABASE](../ex5/README.md)

[◀ Previous exercise](../ex3/README.md) | [🔼 Overview](../../README.md) | [Next exercise ▶](../ex5/README.md)
