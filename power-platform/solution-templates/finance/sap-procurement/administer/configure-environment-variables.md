---
title: Configure environment variables for SAP and Power Platform SAP solutions
description: Learn how to configure and centrally manage environment variables for Microsoft Power Platform SAP solutions.
author: jongilman88
ms.author: jongilman
contributors:
  - EllenWehrle
  - robinsonshields
  - microsoft-george
  - tverhasselt
  - galitskyd
  - microsoft-dustin
  - ryanb58
  - scottwoodallmsft
  - Wrighttyler
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 08/31/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Configure environment variables

Environment variables are solution components that store parameter keys and values, which then serve as input to various other application objects found in Power Automate flows and Power Apps. Enterprise systems often have multiple connection parameters, and manually entering the parameters into each component can be redundant and time-consuming.

The SAP Procurement template uses environment variables within cloud flows to centrally manage and set key properties on the [SAP ERP connector](/connectors/saperp/) flow action steps.

> [!TIP]
> As a best practice, configure and manage environment variables as part of your [application lifecycle management (ALM)](/power-platform/alm/overview-alm) strategy. Set both default and current environment values as you migrate and manage the various solution files across your environments.

Learn more: [Use environment variables in Power Automate solution cloud flows](/power-apps/maker/data-platform/environmentvariables#use-environment-variables-in-power-automate-solution-cloud-flows)

## Configure environment variables at time of installation

The template's _SAP Base_ solution contains five environment variables that set the SAP connection parameters used in the cloud flows.

When you install the SAP Procurement solution template, you'll be prompted to enter values for four of the five environment variables that don't have a default value. You can configure the environment variables to your local needs.

Once set up, the environment variables can be edited as you build your own solutions in the development environment.

The table provides information about the five environment variables that need  SAP connection parameters set up.

| Display name              | Name       | Description     | Default value |
|--------------------|--------------------|------------------------|---------------|
| SAP Application Server    | mpa_SAPApplicationServer | JSON string that contains system parameters, host, system number, client, and more. Refer to the SAP property guidance.       |               |
| SAP Client ID             | mpa_SAPClientID          | The SAP client ID identifies your connection to the SAP system. The SAP backend client (or 'Mandant') into which to log in. It's a number ranging from 000 to 999. Used separately in IDoc transactions.   |               |
| SAP Count of Rows to Read | mpa_SAPCountofRowsToRead | Sets the maximum number of records to be returned on any search query and helps to alleviate performance concerns.                     | 1000          |
| SAP Language Key          | mpa_SAPSPRAS             | There are times when you will need to specify a language on specific transactions, such as   ReadMaterial. We have created an environmental variable called SAP SPRAS that allows you to easily control the value in one place according to your localization requirements. |               |
| SAP System ID             | mpa_SAPSystemID          | The SAP system's three-letter system ID (Mandatory if connection type is   Message Server and a message server service isn't present). Used separately in IDoc transactions.                                                                        |               |

Here are some example connection strings:

### ASHOST - Application Server

```json
{     

    "AppServerHost": "sap.example.com", 

    "Client": "100", 

    "LogonType": "ApplicationServer", 

    "SystemNumber": "00"   

}
```

### MSHOST - Message Server

```json
{   

    "Client": "102", 

    "LogonGroup": "FICO", 

    "LogonType": "Group", 

    "MessageServerHost": "sapserverdv6",    

    "MessageServerService": "3601",    

    "SystemID": "DV6"   

} 
```

### MSHOST + SNC/SSO - Message Server using SSO via SNC (Kerberos)

```json

{ 

    "Client": "102",    

    "LogonGroup": "FICO",    

    "LogonType": "Group",    

    "MessageServerHost": "sapserverdv6",     

    "MessageServerService": "3601",    

    "SncLibraryPath": "c:\\sapcryptolib\\sapcrypto.dll",    

    "SncPartnerName": "p:CN=DV6",    

    "SncQOP": "Default",    

    "SncSso": "On",    

    "SystemID": "DV6",    

    "UseSnc": "true"   

} 
```

More information: [Customizing solutions](customize-solutions.md) and [Create an environment variable in a solution](/power-apps/maker/data-platform/environmentvariables#create-an-environment-variable-in-a-solution) using the [SAP property guidance](/connectors/saperp/#sap-system-property-guidance) or for any local environment variable need.

## Reuse the environment variable in a flow

The environment variables you set up are now available in a flow's dynamic content selector. Go into a cloud flow in the _SAP Procurement_ solution to select the environment variables to reuse in [SAP actions](/connectors/sap/#actions).

> [!IMPORTANT]
>
> Any time an environment variable is updated in a cloud flow, the updated values are not automatically used the next time the flow runs. The updated flow must be _deactivated_ and _reactivated_ for the updated values to take effect.

1. [Edit a solution-aware cloud flow.](/power-automate/edit-solution-aware-flow)
1. Select **Add dynamic content** to open the dynamic content selector in a flow _action_. All environment variables that you have access to are listed.
1. Select the desired environment variable.
1. Select **Save**.

    :::image type="content" source="media/configure-environment-variables/use-env-var-in-connector-actions.png" alt-text="Reuse environment variables in the SAP ERP connector's actions":::

## Next steps

[Configure security groups](configure-security-groups.md)

## See also

[Get started with the SAP Procurement template](get-started.md)
