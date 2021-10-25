# Configure Subaccount entitlements

#### NOTE: Not all services are availabe in all regions. In the case that a service is not available create an additional subaccount in the necessary region to add ther serve

- In the Global Account choose **Entitlements** -> **Subaccount Assignments**
- Choose your subaccount
- Choose **Configure Entitlements**
- Choose **Add Service Plans**
- Choose the Entitlements...
  - Entitlement: **SAP HANA Cloud** - Plan: **hana**
  - Entitlement: **SAP HANA Schemas & HDI Containers** - Plan: **hdi-shared**
  - Entitlement: **Continuous Integration & Delivery** - Plan: **default**
- Choose **Save**

# Kyma runtime

## Assignment of role collection for Kyma

After the enablement of Kyma runtime has finished, you need to assign yourself the respective role collection. 
- In the menu on the left, chose **Security** -> **Users**
- Choose your user
- Choose the option **Assign Role Collection**
- Assign the value **KymaRuntimeNamespaceAdmin\_\_\*\*\*** to yourself

## Getting the Kubeconfig for CLI access and preparing Kyma runtime

- In the Overview area of your subaccount open the **Console URL** found under **Kyma Environment**
- At the top right of the window choose the user drop down and choose **Get Kubeconfig**
- Set this to an environment variable

```shell
//mac and linux
export KUBECONFIG=<KUBECONFIG_FILE_PATH>

//windows powershell
$ENV:KUBECONFIG="<KUBECONFIG_FILE_PATH>"
```

- Create cap namespace in Kyma

```shell
kubectl create ns cap
```

# Launchpad service

## Create Launchpad instance

- Within subaccount choose **Service Marketplace**
- Choose **Launchpad Service**
- Choose **Create**

## Assign Launchpad role

- Assign Roles for the Launchpad Service by choosing **Security** -> **Users**
- Choose your user
- Choose the option **Assign Role Collection**
- Assign the value **Launchpad_Admin** to yourself

# Cloud Foundry

- In the Overview area of your subaccount choose the option to **Enabled** the Cloud Foundry Environment
- Choose the menu option **Cloud Foundry** -> **Spaces**
- Choose the option **Create Space**
- Provide the name **dev** and choose **Create**

# SAP HANA Cloud

#### NOTE: The creation of the instance will take some time

## Instance creation

- Open the CF **dev** space and choose **SAP HANA Cloud**
- Choose **Create** -> **SAP HANA Database**
- For **Type** choose **SAP HANA Cloud, SAP HANA Database**
- Choose **Next Step**
- Provide **teched** as the **Instance Name**
- Provide a value for the **Administrator Password**
- Choose **Next Step**
- Choose **Next Step**
- Choose **Next Step**
- On the **SAP HANA Database Advanced Settings** choose the option **Allow all IP addresses**
- Choose **Review and Create**
- Choose **Create Instance**

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

Now that you have ... 
Continue to - [Exercise 1 - Exercise 1 Description](../ex1/README.md)
