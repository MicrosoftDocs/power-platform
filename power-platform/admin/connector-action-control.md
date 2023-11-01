---
title: "Connector action control | MicrosoftDocs"
description: You can use connector action control to allow or block individual actions within a given connector.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/10/2023
ms.subservice: admin
author: mikferland-msft
ms.author: miferlan
ms.reviewer: sericks
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

# Connector action control

You can use connector action control to allow or block individual actions within a given connector. On the **Connectors** page, right-click the connector, and then select **Configure connector** > **Connector actions**.

:::image type="content" source="media/dlp-connector-actions.png" alt-text="Select Configure connector > Connector actions.":::

> [!NOTE]
> Configuring a connector's actions is available for all *blockable* connectors, but not for [unblockable connectors](dlp-connector-classification.md#list-of-connectors-that-cant-be-blocked) and [custom connectors](dlp-custom-connector-parity.md).

When configuring the connector, use the side panel to allow or deny specific actions. You can also set the default value (Allow or Deny) for any new connector actions that will be added to the connector in the future.

:::image type="content" source="media/dlp-allow-deny-connector-actions.png" alt-text="Set Allow or Deny for connector actions.":::

## Known limitations
Some Power Apps published before October 1, 2020, need to be re-published for connector action rules for data loss prevention (DLP) to be enforced. The script below helps admins and makers identify the apps that must be re-published.

```powershell
Add-PowerAppsAccount

$GranularDLPDate = Get-Date -Date "2020-10-01 00:00:00Z"

ForEach ($app in Get-AdminPowerApp){

    $versionAsDate = [datetime]::Parse($app.LastModifiedTime)
    
    $olderApp = $versionAsDate -lt $GranularDLPDate

    $wasBackfilled = $app.Internal.properties.executionRestrictions -ne $null -and $app.Internal.properties.executionRestrictions.dataLossPreventionEvaluationResult -ne $null -and ![string]::IsNullOrEmpty($app.Internal.properties.executionRestrictions.dataLossPreventionEvaluationResult.lastAdvancedBackfillDate) 

    If($($olderApp -and !$wasBackfilled)){
        Write-Host "App must be republished to be Granular DLP compliant: " $app.AppName " "  $app.Internal.properties.displayName " " $app.Internal.properties.owner.email
    } 
    Else{ 
        Write-Host "App is already Granular DLP compliant: " $app.AppName 
    }
}
``` 

## PowerShell support for connector action control

**Retrieve a list of available actions for a connector**
```powershell
Get-AdminPowerAppConnectorAction
```

**Example**
```powershell
Get-AdminPowerAppConnectorAction -ConnectorName shared_msnweather
```

|ID   |Type  |Properties  |
|---------|---------|---------|
|TodaysForecast     |  Microsoft.ProcessSimple/apis/apiOperations       |  @{summary=Get forecast for today; description=Get the forecast for the current day in the specified location.      |
|OnCurrentWeatherChange     | Microsoft.ProcessSimple/apis/apiOperations        | @{summary=When the current weather changes; description=Triggers a new flow when the specified weather measure changes.     |
|CurrentWeather     | Microsoft.ProcessSimple/apis/apiOperations        | @{summary=Get current weather; description=Get the current weather for a location.; visibility=advanced        |
|TomorrowsForecast     |  Microsoft.ProcessSimple/apis/apiOperations       |  @{summary=Get the forecast for tomorrow; description=Get the forecast for tomorrow in the specified location.   |
|OnCurrentConditionsChange     |  Microsoft.ProcessSimple/apis/apiOperations       |  @{summary=When the current conditions change; description=Triggers a new flow when the conditions change for a locattion.    |

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

[!INCLUDE[footer-include](../includes/footer-banner.md)]
