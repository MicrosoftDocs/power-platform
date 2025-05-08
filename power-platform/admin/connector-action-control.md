---
title: Connector action control
description: You can use connector action control to allow or block individual actions within a given connector.
ms.component: pa-admin
ms.topic: concept-article
ms.date: 02/05/2025
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

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

You can use connector action control to allow or block individual actions or triggers within a given connector.

> [!IMPORTANT]
> In February 2025, support for triggers is added to the connector action control. This can be administered through PowerShell. Support for triggers is planned for the Power Platform admin center in the future, as well.
>
> Making changes to policies through the Power Platform admin center doesn't remove triggers that were added via PowerShell.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a System Administrator. 
1. On the left navigation pane, select **Policies** > **Data policies**.
1. Select a policy and on the command bar, select **Edit Policy**.
1. On the left, select **Prebuilt connectors**.
1. Select **More actions** next to your connector and then select **Configure connector** > **Connector actions**.

   :::image type="content" source="media/connector-action-control/dlp-connector-actions.png" alt-text="Select Configure connector > Connector actions." lightbox="media/connector-action-control/dlp-connector-actions.png":::

   

   > [!NOTE]
   > You can configure connector actions for all *blockable* connectors, but not for [unblockable connectors](dlp-connector-classification.md#list-of-connectors-that-cant-be-blocked) and [custom connectors](dlp-custom-connector-parity.md).

1. Use the side panel to allow or deny specific actions.

   You can also set the **Default connector action settings** to allow or block for any new connector actions that will be added to the connector in the future.

   :::image type="content" source="media/connector-action-control/dlp-allow-deny-connector-actions.png" alt-text="Set Allow or Deny for connector actions.":::


## Known limitations

### Triggers are only supported in PowerShell
Support for allowing and blocking individual triggers is currently available only via PowerShell. Support is planned for the Power Platform admin center in the future. For an example of how to allow triggers that're already in use by Power Automate flows, see [Identify blocked Power Automate flows](identify-blocked-flows-data-policies.md).

### Admins need to have maker access to Power Apps

The list of connector actions is retrieved using calls to Power Apps on behalf of the admin. The admin must sign in to [Power Apps](https://make.powerapps.com) and have access to complete the user consent process. If the admin doesn't have access to [Power Apps](https://make.powerapps.com), then the list of connector actions won't be retrieved.

### Republish Power Apps

Some Power Apps, published before October 1, 2020, need to be republished for connector action rules to enforce data loss prevention (DLP).

This script helps admins and makers identify the apps that must be republished.

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

Retrieve a list of available actions for a connector, using [`Get-AdminPowerAppConnectorAction`](/powershell/module/microsoft.powerapps.administration.powershell/get-adminpowerappconnectoraction).

```powershell
Get-AdminPowerAppConnectorAction
```

For example:

```powershell
Get-AdminPowerAppConnectorAction -ConnectorName shared_msnweather
```

| ID | Type | Properties |
| -- | ---- | ---------- |
| TodaysForecast | Microsoft.ProcessSimple/apis/apiOperations | Get the forecast for the current day in a specified location. |
| OnCurrentWeatherChange | Microsoft.ProcessSimple/apis/apiOperations | Triggers a new flow when the specified weather measure changes. |
| CurrentWeather | Microsoft.ProcessSimple/apis/apiOperations | Get the current weather for a location.<br>Visibility=advanced |
| TomorrowsForecast | Microsoft.ProcessSimple/apis/apiOperations | Get the forecast for tomorrow in the specified location. |
| OnCurrentConditionsChange | Microsoft.ProcessSimple/apis/apiOperations | Triggers a new flow when the conditions change for a location.    |

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
