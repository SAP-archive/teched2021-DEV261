# Exercise 6 - DEPLOY HTML5 APP AND LAUNCHPAD CONFIG

## Goal 🎯

In the step we will deploy the static HTML5 application to the **HTML5 Application** service of BTP. Depending on the previous setup choose the desired method for deployment. If the relating job ['orders-html5-deployer' was configured within the SAP CICD service](../ex3#exercise-352---orders-html5-deployer---optional) then only the configuration of the helm chart is necessary, otherwise either the steps of **6.2 - DEPLOYMENT OPTION 2 - kubectl** or **6.3 - DEPLOYMENT OPTION 3 - Helm** can be followed.

> ⚠ NOTE: The job is using [npm @sap/html5-app-deployer package](https://www.npmjs.com/package/@sap/html5-app-deployer). Refer to the Kubernetes samples for further details.

## Deployment of Service Instances

We will also deploy the BACKEND_DESTINATION to the service. This requires a few service instances to be generated which are defined within the file **service-instances.yaml**.

> ⚠ NOTE: The BACKEND_DESTINATION, **cap-orders-kyma-srv,** is configured to be defined as a subaccount destination and can be found within the subaccount under **Connectivity -> Destinations**. If any errors were made doing the deployment the destination can be modified directly. The property **SUBACCOUNT_LEVEL_DESTINATION** found within the **deploy-job.yaml** can be set to false to create instance destinations. The definition of the **BACKEND_DESTINATION** was configured in an earlier step and saved as **credentials/html5-config-secret.yaml**

To do the deployment execute the following steps:

- Open the file **/resources/html5/Dockerfile** and replace **{your-docker-account}** with your Docker account id
- Save the changes
- Create the service instances for the Destination and the HTML5 Application Repository services

  ```shell
  kubectl -n cap apply -f ./resources/html5/service-instances.yaml
  ```

## Exercise 6.1 - DEPLOYMENT OPTION 1 - CICD Service

- Open the file **/resources/html5/helm/orders-html5-deployer/values.yaml** and replace **{your-docker-account}** with your Docker account id
- Save the changes

## Exercise 6.2 - DEPLOYMENT OPTION 2 - kubectl

- Build and push the container to your docker account

  ```shell
  docker build -t {your-docker-account}/orders-html5-deployer -f ./resources/html5/Dockerfile .

  docker push {your-docker-account}/orders-html5-deployer
  ```

- Within the the file **/resources/html5/deploy-job.yaml** adjust the value of **{your-docker-account}**
- Apply the job

  ```shell
  kubectl -n cap replace --force -f ./resources/html5/deploy-job.yaml
  ```

## Exercise 6.3 - DEPLOYMENT OPTION 3 - Helm

- Build and push the container to your docker account

  ```shell
  docker build -t {your-docker-account}/orders-html5-deployer -f ./resources/html5/Dockerfile .

  docker push {your-docker-account}/orders-html5-deployer
  ```

- Open the file **/resources/db/helm/orders-db-deployer/values.yaml** and replace **{your-docker-account}** with your Docker account id
- Save the changes
- Install the Helm chart

  ```shell
  helm install orders-html5-deployer ./resources/db/helm/orders-html5-deployer -n cap
  ```

## Verify

You can check the status and logs of the Kubernetes Job

```shell
kubectl -n cap get job orders-html5-deployer
```

The results should be similar to below:

```
NAME                    COMPLETIONS   DURATION   AGE
orders-html5-deployer   1/1           14s        101m
```

To check the logs, run

```shell
kubectl -n cap logs job/orders-html5-deployer
```

## Summary

🎉 Congratulations - You've now deployed the HTML5 app and thge launchpad configuration.

Continue to [Exercise 7 - BUILD AND DEPLOY CAP SERVICE](../ex7/README.md)

[◀ Previous exercise](../ex5/README.md) | [🔼 Overview](../../README.md) | [Next exercise ▶](../ex7/README.md)
