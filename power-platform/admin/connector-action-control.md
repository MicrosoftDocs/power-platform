---
title: Block or allow connector actions
description: Learn how to block or allow individual actions of a connector as part of a data loss prevention policy in Power Platform.
ms.component: pa-admin
ms.topic: how-to
ms.date: 04/10/2023
ms.subservice: admin
author: mikferland-msft
ms.author: miferlan
ms.reviewer: sericks
contributors:
  - mikferland-msft
  - mihaelablendea
ms.custom:
  - "admin-security"
  - bap-template
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Block or allow connector actions

Block or allow individual actions of a connector as part of a data loss prevention (DLP) policy.

1. Sign in to the Power Platform admin center.
1. In the left side panel, select **Policies**.
1. [Create](create-dlp-policy.md) or [edit](prevent-data-loss.md#edit-a-dlp-policy) a policy.
1. On the **Prebuilt connectors** page, select the connector, and then select **Configure connector** > **Connector actions**.

    You can select **Configure connector** in the command bar at the top of the page or on the **More actions** (**&hellip;**) menu. **Configure connector** is available for blockable connectors, but not for [unblockable connectors](dlp-connector-classification.md#list-of-connectors-that-cant-be-blocked) and [custom connectors](dlp-custom-connector-parity.md).

    :::image type="content" source="media/dlp-connector-actions.png" alt-text="Screenshot of configuring connector actions in the Power Platform admin center.":::

1. In the right side panel, select or clear **Allow** to allow or block specific actions.
1. Under **Default connector action settings**, select **Allow** or **Block** to set the default for new actions that are added to the connector in the future.

    :::image type="content" source="media/dlp-allow-deny-connector-actions.png" alt-text="Screenshot of the connector actions configuration page.":::

1. Select **Save**.

## Known limitations

Some apps that were published before October 1, 2020, need to be republished before connector action rules for DLP policies are enforced. Run the following script to identify apps that must be republished.

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

## Use PowerShell to manage connector actions

### Retrieve a list of available actions

```powershell
Get-AdminPowerAppConnectorAction
```

The following example retrieves the actions for the shared_msnweather connector.

```powershell
Get-AdminPowerAppConnectorAction -ConnectorName shared_msnweather
```

The following table describes the available actions for the connection.<!-- EDITOR'S NOTE: In the table, is "@{" with no closing bracket correct? -->

|ID | Type | Properties |
|---------|---------|---------|
| TodaysForecast | Microsoft.ProcessSimple/apis/apiOperations | @{summary=Get forecast for today; description=Get the forecast for the current day in the specified location |
| OnCurrentWeatherChange | Microsoft.ProcessSimple/apis/apiOperations | @{summary=When the current weather changes; description=Triggers a new flow when the specified weather measure changes |
| CurrentWeather | Microsoft.ProcessSimple/apis/apiOperations | @{summary=Get current weather; description=Get the current weather for a location; visibility=advanced |
| TomorrowsForecast | Microsoft.ProcessSimple/apis/apiOperations | @{summary=Get the forecast for tomorrow; description=Get the forecast for tomorrow in the specified location |
| OnCurrentConditionsChange | Microsoft.ProcessSimple/apis/apiOperations | @{summary=When the current conditions change; description=Triggers a new flow when the conditions change for a location |

### Configure connector action rules for a policy

The connector configurations object contains the connection action rules for a policy. It has the following structure:

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

### Retrieve connector configurations for a DLP policy

```powershell
Get-PowerAppDlpPolicyConnectorConfigurations 
```

### Create connector configurations for a DLP policy

```powershell
New-PowerAppDlpPolicyConnectorConfigurations
```

### Update connector configurations for a DLP policy

```powershell
Set-PowerAppDlpPolicyConnectorConfigurations
```

The following example accomplishes two goals:

- Block actions `TodaysForecast` and `CurrentWeather` of the MSN Weather connector and allow all other actions.
- Allow action `GetRepositoryById` of the GitHub connector and block all other actions.

In the cmdlet, *PolicyName* refers to the unique GUID. Run the **Get-DlpPolicy** cmdlet to retrieve the DLP GUID.

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

[!INCLUDE [footer-include](../includes/footer-banner.md)]
