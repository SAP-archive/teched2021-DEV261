# Exercise 5 - GENERATE THE CAP DATABASE

This process will deploy the CAP application database into the SAP HANA Cloud. Depending on the previous setup choose the desired method for deployment. If the relating job was configured within the SAP CICD service then only the configuration of the helm chart is necessary, otherwise either the helm or the kubectl steps can be followed.

- The structure of the database is defined within the file **/db/schema.cds** and the associated data which will be inserted into the database can be found at **db/data**.
- There are two resources related to the creation of the database:

  - A Kubernetes secret **orders-vcap-services** containing the vcap-services credentials defined in previous steps
  - A Kubernetes job which processes the deployemnt relying on the vcap-services credential

- Open the file **/deployers/db/Dockerfile** and replace **{your-docker-account}** with your Docker account id
- Save the changes

## Exercise 5.1 - DEPLOYMENT OPTION 1 - SAP CICD

- Open the file **/deployers/db/helm/orders-db-deployer/values.yaml** and replace **{your-docker-account}** with your Docker account id
- Save the changes

## Exercise 5.2 - DEPLOYMENT OPTION 2 - kubectl

- Open the file **/deployers/db/Dockerfile** and replace **{your-docker-account}** with your Docker account id
- Save the changes

- Build and push the container to your docker account

  ```shell
  docker build -t {your-docker-account}/orders-db-deployer -f ./deployers/db/Dockerfile .

  docker push {your-docker-account}/orders-db-deployer
  ```

- Within the the file **/deployers/db/deploy-job.yaml** adjust the value of **{your-docker-account}**
- Save the changes
- Apply the job

  ```shell
  kubectl -n cap replace --force -f ./deployers/db/deploy-job.yaml
  ```

## Exercise 5.3 - DEPLOYMENT OPTION 3 - Helm

- Open the file **/deployers/db/helm/orders-db-deployer/values.yaml** and replace **{your-docker-account}** with your Docker account id
- Save the changes
- Install the Helm chart

```shell
helm install orders-db-deployer ./deployers/db/helm/orders-db-deployer -n cap
```

Continue to - [Exercise 6 - DEPLOY HTML5 APP AND LAUNCHPAD CONFIG](../ex6/README.md)
