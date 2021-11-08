# Exercise 6 - DEPLOY HTML5 APP AND LAUNCHPAD CONFIG

In the step we will deploy the static HTML5 application to the **HTML5 Application** service of BTP. Additionally the BACKEND_DESTINATION to the service will be deployed. This step requires a few service instances to be generated which are defined within **service-instances.yaml**.

> ⚠ NOTE: The BACKEND_DESTINATION, **cap-orders-kyma-srv,** is configured to be defined as a subaccount destination and can be found within the subaccount under **Connectivity -> Destinations**. If any errors were made doing the deployment the destination can be modified directory. The property **SUBACCOUNT_LEVEL_DESTINATION** found within the **deploy-job.yaml** can be set to false to create instance destinations. The definition of the **BACKEND_DESTINATION** was configured in an earlier step and saved as **credentials/html5-config-map.yaml**

- Open the file **/deployers/html5/Dockerfile** and replace **{your-docker-account}** with your Docker account id
- Save the changes
- Create the service instances for the Destination and the HTML5 Application Repository services

  ```shell
  kubectl -n cap apply -f ./deployers/html5/service-instances.yaml
  ```

## Exercise 6.1 - DEPLOYMENT OPTION 1 - CICD Service

- Open the file **/deployers/html5/helm/html5/values.yaml** and replace **{your-docker-account}** with your Docker account id
- Save the changes

## Exercise 6.2 - DEPLOYMENT OPTION 2 - kubectl

- Build and push the container to your docker account

  ```shell
  docker build -t {your-docker-account}/orders-html5-deployer -f ./deployers/html5/Dockerfile .

  docker push {your-docker-account}/orders-html5-deployer
  ```

- Within the the file **/deployers/html5/deploy-job.yaml** adjust the value of **{your-docker-account}**
- Apply the job

  ```shell
  kubectl -n cap replace --force -f ./deployers/html5/deploy-job.yaml
  ```

## Exercise 6.3 - DEPLOYMENT OPTION 3 - Helm

- Build and push the container to your docker account

  ```shell
  docker build -t {your-docker-account}/orders-html5-deployer -f ./deployers/html5/Dockerfile .

  docker push {your-docker-account}/orders-html5-deployer
  ```

- Open the file **/deployers/db/helm/html5/values.yaml** and replace **{your-docker-account}** with your Docker account id
- Save the changes
- Install the Helm chart

```shell
helm install orders-html5-deployer ./deployers/db/helm/orders-html5-deployer -n cap
```

Continue to - [Exercise 7 - BUILD AND DEPLOY CAP SERVICE](../ex7/README.md)
