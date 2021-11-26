# Exercise 8 - CONFIGURE LAUNCHPAD

## Goal 🎯

The goal of this exercise is to create an instance of the Launchpad service and to add the deployed HTML5 application.

## Exercise 8.1 - Create service instance

* Within the SAP BTP subaccount choose `Services` -> `Instances and Subscriptions`. Choose `Launchpad Service` found under `Subscriptions` and `Go to Application`.
* Choose `Create Site` and provide name `Kyma`. Choose the `<` at the top left to leave the Site Settings and navigate back to Site Directory.

## Exercise 8.2 - Add the HTML5 application

* In the left hand menu choose `Provider Manager` ![Icon](/exercises/ex8/images/08_01_001.png). Under `Actions` choose the refresh option ![Icon](/exercises/ex8/images/08_03_001.png).
* Choose `Content Manager` ![Icon](/exercises/ex8/images/08_02_001.png) and then  `Content Explorer` at the top menu.
* Choose `HTML5 Apps` and select the application `Orders` and choose `Add to My Content`.
* Choose `My Content`and then `New` -> `Group`. Provide `Kyma` as the `Title` and assign `Orders` as the app. Choose `Save`.
* Choose the arrow button `<` to go back. Choose the role `Everyone` and choose `Edit` and assign `Orders` as the app and `Save`.
* Choose `Site Directory` and then the option to `Go to Site`.

## Summary

🎉 Congratulations - You've now successfully added the HTML5 app to the Fiori Launchpad.

Continue to [Exercise 9 - REQUIRE OAUTH FOR THE ACTION](../ex9/README.md)

[◀ Previous exercise](../ex7/README.md) | [🔼 Overview](../../README.md) | [Next exercise ▶](../ex9/README.md)
