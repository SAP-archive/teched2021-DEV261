# Getting Started 

## Goal 🎯

In this excercise we will prepare your SAP BTP account to walk through the hands-on session. As this hands-on will combine many different SAP BTP services inside the SAP BTP, Kyma runtime, the preparation will require some time in itself.

> ⚠ NOTE: Not all services are availabe in all regions. In the case that a service is not available create an additional subaccount in the necessary region to add ther serve

# Fork and Clone the Repository

Open the webview of the this repository. On the left hand side, choose the option `Fork` and choose your GitHub account.

Once the creation of the fork is complete, clone the repo and open it in your desired editor
```
git clone {repo url}
```

After opening the project create the folder `credentials` within the root directory of the project. This will be used to store files containing credentials which will not be tracked within your git repo.

# Configure Subaccount entitlements

In the SAP BTP global account choose `Entitlements` -> `Entity Assignments`. Choose your subaccount and choose `Go`. This will list all assigned entitlements. 

Choose `Configure Entitlements` and `Add Service Plans` to select additional entitlements. 

In the pop-up, choose the entitlements...
  - Entitlement: `SAP HANA Cloud` - Plan: `hana`
  - Entitlement: `SAP HANA Schemas & HDI Containers` - Plan: `hdi-shared`
  - Entitlement: `Continuous Integration & Delivery` - Plan: any available plan in the list; `trial` and `free` are not charged
  - (if not yet entitled) Entitlement: `Kyma runtime` - Plan: any available plan in the list; `trial` and `free` are not charged
  - (if not yet entitled) Entitlement: `Launchpad Service` - Plan: `standard`
- Choose `Add x Service Plans` and then `Save`

# Kyma runtime

## Provisioning

> ⚠ NOTE: The creation of the instance will take some time

In the Overview area of your subaccount choose the option to `Enable Kyma` runtime. If the button for enabling Kyma runtime is not showing up, ensure that the entitlement has been set correctly.

## Assignment of role collection for Kyma

After the enablement of Kyma runtime has finished, you need to assign yourself the respective role collection. To do so, chose `Security` -> `Users` in the menu on the left. 

Choose your user and the option `Assign Role Collection`. Assign the value `KymaRuntimeNamespaceAdmin__***` to yourself

## Getting the Kubeconfig for CLI access and preparing Kyma runtime

In the Overview area of your subaccount open the `Console URL` found under `Kyma Environment`. At the top right of the window choose the user drop down and choose `Get Kubeconfig`. Be aware that this kubeconfig is only valid for 8 hours.

> ⚠ NOTE: If your user was just assigned to the KymaRuntimeNamespaceAdmin-Role-Collection and the Kyma console UI is rejecting access, try opening it in a private browsing window.

Set the kubeconfig to an environment variable

```shell
//mac and linux
export KUBECONFIG={KUBECONFIG_FILE_PATH}

//windows powershell
$ENV:KUBECONFIG="{KUBECONFIG_FILE_PATH}"
```

Afterwards, ensure that it's working by creating the required namespace in Kyma

```shell
kubectl create ns cap
```

# Launchpad service

## Create Launchpad instance

Within your SAP BTP subaccount choose `Service Marketplace`. Select the `Launchpad Service` and choose `Create`.

## Assign Launchpad role

Assign the role for the Launchpad Service by choosing `Security` -> `Users` in the subaccount. Then choose your user and the option `Assign Role Collection`.

Assign the value `Launchpad_Admin` to the user.

# Cloud Foundry

In the Overview area of your subaccount choose the option `Enable Cloud Foundry`. This will automatically add your user as CF Org Manager.

Choose the menu option `Cloud Foundry` -> `Spaces` and then the option `Create Space`. Provide the name `dev` and choose `Create`. 

# Continuous Integration & Delivery

## PROVISIONING

Back in the subaccount, choose `Service Marketplace`. Select `Continuous Integration & Delivery` and choose `Create`. Use the default options choose `Create`.

## ROLE ASSIGNMENT

Assign the role for the CICD Service by choosing `Security` -> `Users` in the subaccount. Then choose your user and the option `Assign Role Collection`.

Assign the value `CICD Service Administrator to the user.

# SAP HANA Cloud

#### NOTE: The creation of the instance will take some time

## Instance creation

In the subaccount view, open `Cloud Foundry` -> `Spaces` and select the `dev` space and choose the menu item `SAP HANA Cloud`. Choose `Create -> `SAP HANA Database`.

In SAP HANA Cloud Centra, select as `Type` the entry `SAP HANA Cloud, SAP HANA Database`. Choose `Next Step` at the bottom left. 

Provide the following values:
- `teched` as the `Instance Name`
- Any value for the `Administrator Password`

Chose `Next Step` and keep the default values of the next two screens by choosing `Next Step` twice. 

On the `SAP HANA Database Advanced Settings` choose the option `Allow all IP addresses` and choose `Review and Create`. 

Choose `Create Instance`.

## HANA Cloud setup

- Within subaccount choose **Service Marketplace**
- Choose **SAP HANA Schemas & HDI Containers**
- Choose **Create** with the options
  - Plan: **hdi-shared**
  - Instance Name: **cap-orders-kyma**
- Choose **Create**
- Choose the option **View Instance**
- Once the instance is created,open the instance and choose the option **Create** under **Service Keys**
  - Service Key Name: **kyma**
- Choose **Create**
- Once created choose the option **View Credentials**
- Copy the Credentials
- Within the project root open the file **vcap_services.json** and replace the value `<service key>` with the Credentials value for the **hana** property

## Summary

Now that you have setup everything Continue to - [Exercise 1 - Exercise 1 Description](../ex1/README.md)


[🔼 Overview](../../README.md) | [Next excercise ▶](../ex1/README.md)
