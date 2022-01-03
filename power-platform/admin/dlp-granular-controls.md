---
title: "Granular DLP controls  | MicrosoftDocs"
description: About fine-grained controls such as the ability to block specific connector actions or connection endpoints.
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/28/2021
ms.subservice: admin
author: mikferland-msft
ms.author: miferlan
ms.reviewer: jimholtz
contributors:
  - mikferland-msft
  - mihaelablendea
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Granular DLP controls

Although the connector classification capability is very helpful in governing Microsoft Power Platform connectors, fine-grained controls&mdash;such as the ability to block specific connector actions or connection endpoints&mdash;help you strike a balance between productivity and protection.

> [!NOTE]
> Both connector action control and connector endpoint filtering are currently in Public Preview.

## Connector action control 

You can use connector action control to allow or block individual actions within a given connector. On the **Connectors** page, right-click the connector, and then select **Configure connector** > **Connector actions**.

![Slide1](https://user-images.githubusercontent.com/90638770/147949865-e7be80c3-0a66-4ecc-ba33-a4c7f8b8a227.PNG)

This opens a side panel where you can allow or deny specific actions. You can also set the default value (Allow or Deny) for any new connector actions that will be added to the connector in the future.

![Slide2](https://user-images.githubusercontent.com/90638770/147949897-4cf33380-62da-41ad-8508-8e6b9234c73b.PNG)

### Availability
Configuring a connector's actions is available for all *blockable* connectors, but not for [unblockable connectors](dlp-connector-classification.md#list-of-connectors-that-cant-be-blocked). 

### PowerShell support for Connector action control

**Retrieve a list of available actions for a connector**
```powershell
Get-AdminPowerAppConnectorAction
```

**Example**
```powershell
Get-AdminPowerAppConnectorAction -ConnectorName shared_msnweather
```

|Id   |Type  |Properties  |
|---------|---------|---------|
|TodaysForecast     |  Microsoft.ProcessSimple/apis/apiOperations       |  @{summary=Get forecast for today; description=Get the forecast for the current day in the specified location.; visib...        |
|OnCurrentWeatherChange     | Microsoft.ProcessSimple/apis/apiOperations        | @{summary=When the current weather changes; description=Triggers a new flow when the specified weather measure chang...        |
|CurrentWeather     | Microsoft.ProcessSimple/apis/apiOperations        | @{summary=Get current weather; description=Get the current weather for a location.; visibility=advanced; pageable=Fa...        |
|TomorrowsForecast     |  Microsoft.ProcessSimple/apis/apiOperations       |  @{summary=Get the forecast for tomorrow; description=Get the forecast for tomorrow in the specified location.; visib...       |
|OnCurrentConditionsChange     |  Microsoft.ProcessSimple/apis/apiOperations       |  @{summary=When the current conditions change; description=Triggers a new flow when the conditions change for a locat...       |

#### Configure connector action rules for a policy
The object that contains connector action rules for a policy is referred to below as the connector configurations.
The connector configurations object has the following structure:

```powershell
$ConnectorConfigurations = @{ 
  connectorActionConfigurations = @( # array – one entry per connector
    @{  
      connectorId # string
      actionRules = @( # array – one entry per rule 
        @{ 
          actionId # string
          behavior # supported values: Allow/Block
        }
      ) 
      defaultConnectorActionRuleBehavior # supported values: Allow/Block
    } 
  ) 
}
``` 

**Retrieve existing connector configurations for a DLP policy**
```powershell
Get-PowerAppDlpPolicyConnectorConfigurations 
``` 

**Create connector configurations for a DLP policy**
```powershell
New-PowerAppDlpPolicyConnectorConfigurations
``` 

**Update connector configurations for a DLP policy**
```powershell
Set-PowerAppDlpPolicyConnectorConfigurations
``` 

**Example**

Goal:
-	Block actions TodaysForecast and CurrentWeather of connector MSN Weather; allow all other actions.
-	Allow action GetRepositoryById of connector GitHub; block all other actions.

> [!NOTE]
> In the following cmdlet, *PolicyName* refers to the unique GUID. You can retrieve the DLP GUID by running the **Get-DlpPolicy** cmdlet.

```powershell
$ConnectorConfigurations = @{ 
  connectorActionConfigurations = @(
    @{  
      connectorId = "/providers/Microsoft.PowerApps/apis/shared_msnweather" 
      actionRules = @(
        @{ 
          actionId = "TodaysForecast" 
          behavior = "Block"
        }, 
        @{ 
          actionId = "CurrentWeather" 
          behavior = "Block"
        } 
      ) 
      defaultConnectorActionRuleBehavior = "Allow"
    },
    @{  
      connectorId = "/providers/Microsoft.PowerApps/apis/shared_github" 
      actionRules = @(
        @{ 
          actionId = "GetRepositoryById" 
          behavior = "Allow"
        }
      ) 
      defaultConnectorActionRuleBehavior = "Block"
    } 
  ) 
}
New-PowerAppDlpPolicyConnectorConfigurations -TenantId $TenantId -PolicyName $PolicyName -NewDlpPolicyConnectorConfigurations $ConnectorConfigurations
``` 

## Endpoint filtering 

Endpoint filtering allows admins to govern at a fine grain which specific endpoints will be allowed versus blocked at a tenant or environment level. This facility is available for HTTP, HTTP with Azure AD, HTTP Webhook, SQL Server, Azure Blob Storage, and SMTP connection endpoints. The feature will soon be available for Dataverse (legacy). For more information, see [Endpoint input formats and examples](dlp-endpoint-input-formats-examples.md).

The **Endpoint configurable** column on the **Prebuilt Connectors** page in **Data Policies** indicates whether the endpoint filtering capability is supported for the connector

![Slide3](https://user-images.githubusercontent.com/90638770/147949947-5372f7d9-dad1-47a7-a535-661c84160e1b.PNG)

If the value of the **Endpoint configurable** column is **Yes**, you can use this capability by right-clicking and then selecting **Configure connector** > **Connector endpoints**.

![Slide4](https://user-images.githubusercontent.com/90638770/147949961-1ea91b85-9aa7-413f-956e-2b5f2b2ae627.PNG)

This opens a side panel where you can specify an ordered list of Allow or Deny URL patterns for custom connectors. The last row in the list will always be a rule for the wildcard character `*`, which applies to all endpoints in that connector. By default, the `*` pattern is set up as Allow for new DLP policies, but you can tag this as Allow or Deny.

![Slide5](https://user-images.githubusercontent.com/90638770/147949970-add603d4-044c-43c2-8f25-ba243926622c.PNG)

You can add new rules by selecting **Add endpoint**. New rules are added to the end of the pattern list (as the second-to-the-last rule, because `*` will always be the last entry in the list). However, you can update the order of the patterns by using the **Order** dropdown list or selecting **Move up** or **Move down**. 

![Slide6](https://user-images.githubusercontent.com/90638770/147949980-da6799e4-4fb6-4d3a-af59-c5ed3cdfb674.PNG)

After a pattern has been added, you can edit or delete these patterns by selecting a specific row and then selecting **Delete**.

![Slide7](https://user-images.githubusercontent.com/90638770/147949995-c8df736d-c679-4dea-9851-4cb8f9f2dbbd.PNG)

### PowerShell support for endpoint filtering

#### Configure endpoint filtering rules for a policy
The object that contains endpoint filtering rules for a policy is referred to below as the connector configurations.
The connector configurations object has the following structure:

```powershell
$ConnectorConfigurations = @{ 
  connectorActionConfigurations = @() # used for connector action rules
  endpointConfigurations = @( # array – one entry per 
    @{  
      connectorId # string
      endpointRules = @( # array – one entry per rule 
        @{ 
          order # number 
          endpoint # string
          behavior # supported values: Allow/Deny
        }
      ) 
    }
  ) 
}
``` 

**Notes**

-	The last rule for each connector should always be applied to URL “*”, to ensure that all URLs are covered by the rules
-	The order property of the rules for each connector should be populated with numbers 1 to N, where N is the number of rules for that connector

**Retrieve existing connector configurations for a DLP policy**
```powershell
Get-PowerAppDlpPolicyConnectorConfigurations 
``` 

**Create connector configurations for a DLP policy**
```powershell
New-PowerAppDlpPolicyConnectorConfigurations
``` 

**Update connector configurations for a DLP policy**
```powershell
Set-PowerAppDlpPolicyConnectorConfigurations
``` 

**Example**

Goal:

For the SQL Server connector:
  -	Deny database “testdatabase” of server “myservername.database.windows.net”
  -	Allow all other databases of server “myservername.database.windows.net”
  -	Deny all other servers

For the SMTP connector:
  -	Allow Gmail (server address: smtp.gmail.com, port: 587)
  -	Deny all other addresses

For the HTTP connector:
  -	Allow endpoints https://mywebsite.com/allowedPath1 and https://mywebsite.com/allowedPath2 
  -	Deny all other URLs

> [!NOTE]
> In the following cmdlet, *PolicyName* refers to the unique GUID. You can retrieve the DLP GUID by running the **Get-DlpPolicy** cmdlet.

```powershell
$ConnectorConfigurations = @{ 
  endpointConfigurations = @(
    @{  
      connectorId = "/providers/Microsoft.PowerApps/apis/shared_sql" 
      endpointRules = @(
        @{ 
          order = 1 
          endpoint = "myservername.database.windows.net,testdatabase" 
          behavior = "Deny"
        }, 
        @{ 
          order = 2 
          endpoint = "myservername.database.windows.net,*" 
          behavior = "Allow"
        }, 
        @{ 
          order = 3
          endpoint = "*" 
          behavior = "Deny"
        } 
      ) 
    }, 
    @{  
      connectorId = "/providers/Microsoft.PowerApps/apis/shared_smtp" 
      endpointRules = @(
        @{ 
          order = 1 
          endpoint = "smtp.gmail.com,587" 
          behavior = "Allow"
        }, 
        @{ 
          order = 2 
          endpoint = "*" 
          behavior = "Deny"
        } 
      ) 
    },
    @{  
      connectorId = "http" 
      endpointRules = @(
        @{ 
          order = 1 
          endpoint = "https://mywebsite.com/allowedPath1" 
          behavior = "Allow"
        }, 
        @{ 
          order = 2
          endpoint = "https://mywebsite.com/allowedPath2" 
          behavior = "Allow"
        }, 
        @{ 
          order = 3
          endpoint = "*" 
          behavior = "Deny"
        } 
      ) 
    } 
  ) 
}
New-PowerAppDlpPolicyConnectorConfigurations -TenantId $TenantId -PolicyName $PolicyName -NewDlpPolicyConnectorConfigurations $ConnectorConfigurations
``` 

[!INCLUDE[footer-include](../includes/footer-banner.md)]
