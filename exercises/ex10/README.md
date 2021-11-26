# Exercise 10 - SAP ALERT NOTIFICATION CONFIGURATION

## Goal 🎯

The SAP Alert Notification allows users/groups to subscribe to a number of different event types which can be received on a number of different platforms. In this scenario we will create an instance of the SAP Alert Notification service which will generate an alert when the **MOCK_HOST** of the **components/src/orders-service.js** is not available. The alert will be configured to be sent to an email address.

The file **resources/alertnotif/deployment.yaml** will be applied after a few modifications. This will generate the following resources:

- A SAP Alert Notification Service instance named `alert-notif-ser-instance`
- A serverless function named `alert-notif`
- A service binding and a service binding usage

## Apply the changes

- Open the file **resources/alertnotif/deployment.yaml**
- Search for the string `your.email@domain.com` and replace it with your email address
- Search for the string `AN_REGION` and replace the value if necessary to the region your BTP subaccount is existing in. This can be determined by navigating to your global account.
  - Choosing **Account Explorer**
  - Search for your subaccount
  - The tile showing your subaccount will list the **Region**
  - Navigate to [Regions and API Endpoints Available](https://help.sap.com/viewer/65de2977205c403bbc107264b8eccf4b/Cloud/en-US/350356d1dc314d3199dca15bd2ab9b0e.html#loiof344a57233d34199b2123b9620d0bb41)
  - Enter your **Region** in the **Region Name** filter
  - The value needed will be shown in the **Region** column
  - This value will need to be uppercased
  - The corresponding values are can be found staring on line 72 of the [alert notification nodejs client](https://github.com/SAP/alert-notification-node-client/blob/main/src/utils/region.ts)
- Search for the environment variable `CLUSTER_DOMAIN` and set the value to the Kyma cluster domain url
- Apply the resources to your Kyma cluster

  ```shell
  kubectl -n cap apply -f ./resources/alertnotif/deployment.yaml
  ```

- Once applied you should receive an automated email from **SAP Alert Notification service** asking you to confirm the subscription to the action.
- Open the link within the email and choose **Confirm**

## Modify the CAP application

- Within the CAP service definition **components/srv/orders-service.js** there is a check to determine if the value of **ALERT_NOTIF_SRV** has been set when an error occurs. If set, this will call the serverless function **alert-notif** to submit an event to the SAP Alert Notification service.
- Within the file **resources/service/deployment_w_cm.yaml** find and set the value `ALERT_NOTIF_SRV: "alert-notif.cap.svc.cluster.local"`
- Apply the changes to your Kyma cluster

  ```shell
  kubectl -n cap apply -f ./resources/service/deployment_w_cm.yaml
  ```

Using the **access_token** obtained in the previous exercise call the **external/submitorder** endpoint again

- In shell

  ```shell
  curl -X POST https://cap-orders-service.<cluster url>/external/submitorder -H 'Content-Type: application/json' -H 'Authorization: Bearer <access_token>' -d '{"orderNo": 123123}'
  ```

- In PowerShell

  ```powershell
  curl.exe '-X' 'POST' 'https://cap-orders-service.<cluster url>/external/submitorder' '-H' 'Content-Type: application/json' '-H' 'Authorization: Bearer <access_token>' '-d' '{\"orderNo\": 123123}'
  ```

This call will fail with the error `an error occurred...`, but you should now receive an email from the SAP Alert Notification service indicating an event type of **system_down_condition**. The next exercise will resolve the error condition.

## Summary

🎉 Congratulations - You successfully configured the SAP Alert Notification to notify you when the **MOCK_HOST** is not accessible.

Continue to - [Exercise 11 - MOCK APPLICATION](../ex11/README.md)

[◀ Previous exercise](../ex9/README.md) | [🔼 Overview](../../README.md) | [Next exercise ▶](../ex11/README.md)
