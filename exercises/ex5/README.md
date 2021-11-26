# Exercise 5 - GENERATE THE CAP DATABASE

## Goal 🎯

The goal of this exercise is to deploy the CAP application database into the SAP HANA Cloud.

Depending on the previous setup choose the desired method for deployment. If the relating job called ['orders-db-deployer' was configured within the SAP CICD service](../ex3#exercise-353---orders-db-deployer---optional) then only the configuration of the helm chart is necessary, otherwise either the helm or the kubectl steps can be followed.

## Prework

The structure of the database is defined within the file **/db/schema.cds**. You find the associated data which will be inserted into the database at **db/data**.

There are two resources related to the creation of the database:

- A Kubernetes secret **orders-vcap-services** containing the vcap-services credentials defined in previous steps
- A Kubernetes job which processes the deployment relying on the vcap-services credential

To push the Docker files we will create in the next steps to the right registry execute the following steps:

- Open the file **/resources/db/Dockerfile** and replace **{your-docker-account}** with your Docker account id
- Save the changes

## Exercise 5.1 - DEPLOYMENT OPTION 1 - SAP CICD

- Open the file **/resources/db/helm/orders-db-deployer/values.yaml** and replace **{your-docker-account}** with your Docker account id
- Save the changes

## Exercise 5.2 - DEPLOYMENT OPTION 2 - kubectl

- Build and push the container to your docker account

  ```shell
  docker build -t {your-docker-account}/orders-db-deployer -f ./resources/db/Dockerfile .

  docker push {your-docker-account}/orders-db-deployer
  ```

- Within the the file **/resources/db/deploy-job.yaml** adjust the value of **{your-docker-account}**
- Save the changes
- Apply the deploy job

  ```shell
  kubectl -n cap replace --force -f ./resources/db/deploy-job.yaml
  ```

## Exercise 5.3 - DEPLOYMENT OPTION 3 - Helm

- Build and push the container to your docker account

  ```shell
  docker build -t {your-docker-account}/orders-db-deployer -f ./resources/db/Dockerfile .

  docker push {your-docker-account}/orders-db-deployer
  ```

- Open the file **/resources/db/helm/orders-db-deployer/values.yaml** and replace **{your-docker-account}** with your Docker account id
- Save the changes
- Install the Helm chart

  ```shell
  helm install orders-db-deployer ./resources/db/helm/orders-db-deployer -n cap
  ```

## Verify

You can check the status and logs of the Kubernetes Job

```shell
kubectl -n cap get job orders-db-deployer
```

The results should be similar to below:

```
NAME                 COMPLETIONS   DURATION   AGE
orders-db-deployer   1/1           23s        99m
```

To check the logs, run

```shell
kubectl -n cap logs job/orders-db-deployer
```

## Summary

🎉 Congratulations - You've now generated the CAP application database in SAP HANA Cloud.

Continue to [Exercise 6 - DEPLOY HTML5 APP AND LAUNCHPAD CONFIG](../ex6/README.md)

[◀ Previous exercise](../ex4/README.md) | [🔼 Overview](../../README.md) | [Next exercise ▶](../ex6/README.md)
