# Exercise 1 - Exercise 1 XSUAA Service Instance

In this exercise, we will create and configure an instance of the "Authorization and Trust Management" service within SAP BTP, Kyma runtime. With that service instance, you will generate a Role Collection inside the SAP BTP subaccount which will controle the access to the later CAP application.

## Exercise 1.1 Create the XSUAA Service Instance

After completing these steps you will have created the "Authorization and Trust Management" service instance.

Apply the resource to create the service instance and binding for the XSUAA instance. This will generate an XSUAA instance that is used to perform a token exchange which the CAP application requires to authenticate/authorize the user:
```
kubectl -n cap apply -f ./deployers/html5/xsuaa-service.yaml
```

Inside the Kyma console, open the namespace `cap`. 

Now open the service instance `cap-orders-xsuaa-instance` found under Service Management -> Instances.

Choose the tab `Credentials` and choose the Secret `cap-orders-xsuaa-binding`.

Choose the option `Decode` as these decoded values will need to be copied in the next steps. 

## Exercise 1.3 Apply Credentials to the Config Map

Create a copy of the file `./deployers/html5/config-map.yaml` within the `credentials` directory, naming it `html5-config-map.yaml`.

Within the `html5-config-map.yaml` file replace the following values with the values found in the `cap-orders-xsuaa-binding` secret decoded in the previous step:
![Credentials](/exercises/ex1/images/01_01_001.png)

Replace the value of `cluster domain` with the Kyma cluster domain url.
```yaml
    \"clientId\": \"{clientid}\",
    \"clientSecret\":\"{clientsecret}\",
    \"tokenServiceURL\": \"{url}/oauth/token\",
    \"URL\":\"https://cap-orders-service.{cluster domain}\"}]"
```


## Exercise 1.2 Sub Exercise 2 Description

After completing these steps you will have...

1.	Enter this code.
```abap
DATA(lt_params) = request->get_form_fields(  ).
READ TABLE lt_params REFERENCE INTO DATA(lr_params) WITH KEY name = 'cmd'.
  IF sy-subrc <> 0.
    response->set_status( i_code = 400
                     i_reason = 'Bad request').
    RETURN.
  ENDIF.

```

2.	Click here.
<br>![](/exercises/ex1/images/01_02_0010.png)


## Summary

You've now ...

Continue to - [Exercise 2 - Exercise 2 Description](../ex2/README.md)

