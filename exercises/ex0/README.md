# Getting Started

## Goal 🎯

This hands-on will combine many different SAP BTP services inside the SAP BTP, Kyma runtime. In this exercise we will prepare your SAP BTP account to walk through the hands-on session. Be aware that the preparation will require some time in itself.

> ⚠ NOTE: Not all services are available in all regions. In the case that a service is not available create an additional subaccount in the necessary region to add the service

## Fork and Clone the Repository

Open the webview of the this repository. On the top right, choose the option `Fork` and choose your GitHub account.

Once the creation of the fork is complete, clone the repo in a directory of your choice and open it in your desired editor

```shell
git clone <your forked repository's clone url>
```

After opening the project create the folder `credentials` within the root directory of the project. This will be used to store files containing credentials which will not be tracked within your git repo as it is excluded via the **.gitignore** file.

## Selecting the subaccount region(s)

On SAP BTP trial, only a subaccount in the region cf-us-10 works out for this tutorial. Trial subaccounts in cf-ap21 on MS Azure don’t include SAP HANA Cloud nor the SAP CICD service.

For the SAP BTP free tier, the recommendation is as well to use an AWS-based subaccount, but you can pick more regions. Kyma runtime in the free tier is only available on AWS. If you need to have SAP HANA Cloud on MS Azure, pick a region in which you can create a second subaccount with Kyma in the same region, e.g. Netherlands (Azure) and Frankfurt (AWS), Sydney (Azure & AWS), Tokyo (Azure & AWS), US East (Azure & AWS)

## Configure Subaccount entitlements

In the SAP BTP global account choose `Entitlements` -> `Entity Assignments`. Choose your subaccount and choose `Go`. This will list all assigned entitlements.

Choose `Configure Entitlements` and `Add Service Plans` to select additional entitlements.

In the pop-up, choose the entitlements:

| Entitlement                               | Plan                                                                                                     |
| ----------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| `Alert Notification`                      | `Standard` plan
| `Continuous Integration & Delivery`       | `default (Application)` or the `trial (Application)` or `free (Application)` plans which are not charged |
| `Kyma runtime` (if not yet entitled)      | any available plan in the list (`trial` and `free` are not charged)                                      |
| `Launchpad Service` (if not yet entitled) | `standard (Application)` or `free (Application)`                                                         |
| `SAP HANA Cloud`                          | `hana`                                                                                                   |
| `SAP HANA Schemas & HDI Containers`       | `hdi-shared`                                                                                             |

Choose `Add x Service Plans` in case you had to select any of the above and choose `Save`.

## Kyma runtime

A detailed step by step can be found in the following [tutorial](https://developers.sap.com/tutorials/cp-kyma-getting-started.html)

### Provisioning

> ⚠ NOTE: The creation of the instance will take some time

In the overview area of your subaccount choose the option to `Enable Kyma` runtime. If the button for enabling Kyma runtime is not showing up, ensure that the entitlement has been set correctly.

### Assignment of role collection for Kyma

After the enablement of Kyma runtime has finished, you need to assign yourself the respective role collection. To do so, chose `Security` -> `Users` in the menu on the left.

Choose your user and the option `Assign Role Collection`. Assign the value `KymaRuntimeNamespaceAdmin__***` to yourself

### Getting the Kubeconfig for CLI access and preparing Kyma runtime

In the Overview area of your subaccount open the `Console URL` you find under `Kyma Environment`. At the top right of the window choose the user drop down and choose `Get Kubeconfig`. Be aware that this kubeconfig is only valid for _8 hours_.

> ⚠ NOTE: If your user was just assigned to the `KymaRuntimeNamespaceAdmin`-Role-Collection and the Kyma console UI is rejecting access, try opening it in a private browsing window.

Next set the kubeconfig to an environment variable:

- In a shell

  ```shell
  export KUBECONFIG={KUBECONFIG_FILE_PATH}
  ```

- In PowerShell

  ```powershell
  $ENV:KUBECONFIG="{KUBECONFIG_FILE_PATH}"
  ```

Afterwards, ensure that it's working by creating the required namespace in Kyma via:

```shell
kubectl create ns cap
```

## Launchpad service

### Create Launchpad instance

Within your SAP BTP subaccount choose `Service Marketplace`. Select the `Launchpad Service` and choose `Create`.

### Assign Launchpad role

Assign the role for the Launchpad Service by choosing `Security` -> `Users` in the subaccount. Then choose your user and the option `Assign Role Collection`.

Assign the value `Launchpad_Admin` to the user.

## Cloud Foundry

In the Overview area of your subaccount choose the option `Enable Cloud Foundry` and choose `Create`. This will automatically add your user as CF Org Manager.

Choose the menu option `Cloud Foundry` -> `Spaces` and then the option `Create Space`. Provide the name `dev` and choose `Create`. (In a trial account the `dev` space should be available by default)

> ⚠ NOTE: The Cloud Foundry space is required to provision SAP Hana Cloud Database.

## Continuous Integration & Delivery

### PROVISIONING

Back in the subaccount, choose `Service Marketplace`. Select `Continuous Integration & Delivery` and choose `Create`. Use the default options choose `Create`.

### ROLE ASSIGNMENT

Assign the role for the CICD Service by choosing `Security` -> `Users` in the subaccount. Then choose your user and the option `Assign Role Collection`.

Assign the value `CICD Service Administrator` to the user.

## SAP HANA Cloud

> ⚠ NOTE: The creation of the instance will take some time. Also please note that when using the SAP BTP trial, the HANA instance will need to be restarted each day.

### Instance creation

In the subaccount view, open `Cloud Foundry` -> `Spaces` and select the `dev` space and choose the menu item `SAP HANA Cloud`. Choose `Create` -> `SAP HANA Database`.

In SAP HANA Cloud Central, select as `Type` the entry `SAP HANA Cloud, SAP HANA Database`. Choose `Next Step` at the bottom right.

Provide the following values:

- `Instance Name`: `teched`
- `Administrator Password`: Any value

Chose `Next Step` and keep the default values of the next two screens by choosing `Next Step` twice.

On the `SAP HANA Database Advanced Settings` choose the option `Allow all IP addresses` and choose `Next Step`.

Lastly, choose `Review and Create` and then `Create Instance`.

### Setup

> ⚠ NOTE: The step requires that the creation of the SAP HANA Cloud has completed.

Within your SAP BTP subaccount choose `Service Marketplace` and select `SAP HANA Schemas & HDI Containers`. Choose `Create` with the options

- Plan: `hdi-shared`
- Instance Name: `cap-orders-kyma`

Choose `Create` and select the option `View Instance`. Once the instance is created, open the instance and choose the option `Create` under `Service Keys`. Provide the service Key Name `kyma` and choose `Create`.

Once created choose the option `View` and copy the credentials.

Within the project open the file `templates/vcap_services.json` and create a copy of it saving it into the `credentials` directory of the project. Open the file `credentials/vcap_services.json` and replace the value `<service key>` of `hana.credentials` with the Credentials value for the SAP HANA property.

This means, the vcap_services.json will look like this:

```json
{
  "xsuaa":[{
    "name": "cpapp",
        "label": "xsuaa",
        "tags": ["xsuaa"],
        "credentials":  <service key to be added in a later exercise> ,
  }],
  "hana": [
    {
      "binding_name": null,
      "credentials":  {
        "host": "{host}",
        "port": "443",
        "driver": "com.sap.db.jdbc.Driver",
        "url": "{url}",
        "schema": "{schema}",
        "hdi_user": "{hdi_user}",
        "hdi_password": "{hdi_password}",
        "user": "{user}",
        "password": "{password}",
        "certificate": "-----BEGIN CERTIFICATE-----{certificate}-----END CERTIFICATE-----"
      } ,
      "instance_name": "cpapp",
      "label": "cpapp",
      "name": "cpapp",
      "plan": "hdi-shared",
      "provider": null,
      "syslog_drain_url": null,
      "tags": ["hana", "database", "relational"],
      "volume_mounts": []
    }
  ]
}
```

## Summary

🎉 Congratulations - Now you have setup all service instances and started preparing the VCAP service deployment. It's time to continue with [Exercise 1 - CREATE THE XSUAA SERVICE INSTANCE](../ex1/README.md)

[🔼 Overview](../../README.md) | [Next exercise ▶](../ex1/README.md)
