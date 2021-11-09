# Exercise 2 - PREPARE APP FOR LOCAL USE]

## Goal 🎯

This exercise provides the commands to run the sample application locally. This is provided for informational purposes and is not needed to proceed with the exercise.

## Install the application dependencies

Install the CDS tools

```shell
npm i -g @sap/cds-dk
```

Install the app dependencies

```shell
npm install --prefix components
```

The app can be run using the command

```shell
cds watch components
```

The application is set to use a mock user. The relating user details are defined in **components/.cdsrc.json** as `kyma@cap.sap.com/initial`. This will not work if the **NODE_ENV** has been set to production.

## REQUIRES THE COMPLETION OF [Exercise 5 - GENERATE THE CAP DATABASE](../ex5/README.md)

The application can also be configured to connect to the HANA Cloud instance. This first requires that the database has been fully setup which is performed in Exercise 5.

First set the VCAP_SERVICES environment variable

- Using shell

  ```shell
  export VCAP_SERVICES=$(<credentials/vcap_services.json)
  ```

- Using PowerShell

  ```powershell
  $ENV:VCAP_SERVICES = Get-Content .\vcap_services.json -Raw
  ```

If necessary change the setting of the property **cds.requires.db.kind** within the **components/package.json** from `sql` to `hana`

```json
"cds": {
    "requires": {
      "db": {
        "kind": "hana"
      },

```

Then execute:

```shell
cds watch components
```

## Summary

🎉 Congratulations - You now can run the application locally.

Continue to [Exercise 3 - CONFIGURE THE SAP CICD SERVICE](../ex3/README.md)

[◀ Previous exercise](../ex1/README.md) | [🔼 Overview](../../README.md) | [Next exercise ▶](../ex3/README.md)
