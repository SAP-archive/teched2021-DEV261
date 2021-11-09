# Exercise 1 - XSUAA Service Instance

## Goal 🎯

In this exercise, we will create and configure an instance of the "Authorization and Trust Management" service within SAP BTP, Kyma runtime. With that service instance, you will generate a Role Collection inside the SAP BTP subaccount which will controle the access to the later CAP application.

## Exercise 1.1 Create the XSUAA Service Instance

After completing these steps you will have created the "Authorization and Trust Management" service instance.

Apply the resource to create the service instance and binding for the XSUAA instance. This will generate an XSUAA instance that is used to perform a token exchange which the CAP application requires to authenticate/authorize the user:

```shell
kubectl -n cap apply -f ./resources/html5/xsuaa-service.yaml
```

Inside the Kyma console, open the namespace `cap`.

Now open the service instance `cap-orders-xsuaa-instance` found under Service Management -> Instances.

Choose the tab `Credentials` and choose the Secret `cap-orders-xsuaa-binding`.

Choose the option `Decode` as these decoded values will need to be copied in the next steps.

## Exercise 1.3 Apply the Secret

Create a copy of the file `./resources/html5/html5-config-secret.yaml` within the `credentials` directory, naming it `html5-config-secret.yaml`.

Within the `html5-config-secret.yaml` file replace the following values with the values found in the `cap-orders-xsuaa-binding` secret decoded in the previous step:
![Credentials](/exercises/ex1/images/01_01_001.png)

Replace the value of `cluster domain` with the Kyma cluster domain url.

```yaml
    \"clientId\": \"{clientid}\",
    \"clientSecret\":\"{clientsecret}\",
    \"tokenServiceURL\": \"{url}/oauth/token\",
    \"URL\":\"https://cap-orders-service.{cluster domain}\"}]"
```

Not it's time to apply the configmap to the cluster.

```shell
kubectl -n cap apply -f ./credentials/html5-config-secret.yaml
```

## Exercise 1.3 Create the VCAP Service

Open the file `./credentials/vcap_services.json` and replace the value `<service key>` with the Credentials value for the xsuaa property. This can be done manually or much easier using [jq](https://stedolan.github.io/jq/download/). To export the entire decoded secret using `jq` run:

```shell
kubectl get secret cap-orders-xsuaa-binding -n cap -o json | jq '.data | map_values(@base64d)'
```

The result looks like this:

```json
{
  "apiurl": "https://api.authentication.{region}.hana.ondemand.com",
  "clientid": "{clientid}",
  "clientsecret": "{clientsecret}",
  "credential-type": "instance-secret",
  "identityzone": "{identityzone}",
  "identityzoneid": "{identityzoneid}",
  "sburl": "https://internal-xsuaa.authentication.{region}.hana.ondemand.com",
  "subaccountid": "{subaccountid}",
  "tenantid": "{tenantid}",
  "tenantmode": "dedicated",
  "uaadomain": "authentication.{region}.hana.ondemand.com",
  "url": "{url}",
  "verificationkey": "-----BEGIN PUBLIC KEY-----{verificationkey}-----END PUBLIC KEY-----",
  "xsappname": "{xsappname}",
  "zoneid": "{zoneid}"
}
```

Copy the result into the `xsuaa.credentials` found in the vcap_services.json replacing the value of `<service key>`.

Create a secret in Kyma containing the contents of this file.

**If using a bash shell**:

```shell
kubectl -n cap create secret generic orders-vcap-services --from-literal "VCAP_SERVICES=$(<credentials/vcap_services.json)"
```

**If using Windows PowerShell** convert the file into base64 by running:

```cmd
[convert]::ToBase64String((Get-Content -path "credentials/vcap_services.json" -Encoding byte))
```

Within the project open the file `templates/orders-vcap-services.yaml` and create a copy of it saving it into the `credentials` directory of the project. Replace the contents of the `<base64 encoded vcap_services>` with the result of the previous command and apply the file.

```shell
kubectl -n cap apply -f ./credentials/orders-vcap-services.yaml
```

## Exercise 1.4 Add User to Role Templage

Add your user to the Role collection `cap-orders-kyma-rc` by navigating to the SAP BTP subaccount you are using. Within the SAP BTP cockpit open **Security -> Role Collections**. Choose `Edit`, add your user, and `Save` your changes.

## Summary

🎉 Congratulations - You've now created in instance of the XSUAA service and created the VCAP service. Furthermore, you added your user to the generated Role Collection.

Continue to [Exercise 2 - Exercise 2 PREPARE APP FOR LOCAL USE](../ex2/README.md)

[◀ Previous exercise](../ex0/README.md) | [🔼 Overview](../../README.md) | [Next exercise ▶](../ex2/README.md)
