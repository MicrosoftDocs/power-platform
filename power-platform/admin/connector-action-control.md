---
title: "Connector action control | MicrosoftDocs"
description: You can use connector action control to allow or block individual actions within a given connector.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 1/29/2024
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

You can use connector action control to allow or block individual actions within a given connector.

On the **Data policies** page:

1. Create a new policy or use an existing one, then on the **Assign connectors** page select the `...` next to your connector, for example **SQL Server**.
1. Select **Configure connector** > **Connector actions**.

   :::image type="content" source="media/connector-action-control/dlp-connector-actions.png" alt-text="Select Configure connector > Connector actions." lightbox="media/connector-action-control/dlp-connector-actions.png":::

   A side pane appears.

   > [!NOTE]
   > You can configure connector actions for all *blockable* connectors, but not for [unblockable connectors](dlp-connector-classification.md#list-of-connectors-that-cant-be-blocked) and [custom connectors](dlp-custom-connector-parity.md).

1. Use the side pane to allow or deny connector actions.

   You can **Allow** or **Block** any new connector actions added in the future by setting the **Default connector action settings**.

   :::image type="content" source="media/connector-action-control/dlp-allow-deny-connector-actions.png" alt-text="Set Allow or Deny for connector actions.":::

1. **Save** your changes if you made any.

## Known limitations

### Make admins consented users in the Power Apps portal

The list of connector actions is retrieved when the admin user calls the Power Apps infrastructure. The admin user needs to sign into the [Power Apps portal](https://make.preview.powerapps.com/) and complete the user consent process. If the admin user isn't known to the Power Apps portal, then the list of connector action might not be retrieved.

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

### Configure connector action rules for a policy

The connector configurations object contains connector action rules for a policy:

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

#### Retrieve existing connector configurations for a DLP policy

```powershell
Get-PowerAppDlpPolicyConnectorConfigurations 
```

For more information, see [Get-PowerAppDlpPolicyConnectorConfigurations](/powershell/module/microsoft.powerapps.administration.powershell/get-powerappdlppolicyconnectorconfigurations).

#### Create connector configurations for a DLP policy

```powershell
New-PowerAppDlpPolicyConnectorConfigurations
```

For more information, see [New-PowerAppDlpPolicyConnectorConfigurations](/powershell/module/microsoft.powerapps.administration.powershell/new-powerappdlppolicyconnectorconfigurations).

#### Update connector configurations for a DLP policy

```powershell
Set-PowerAppDlpPolicyConnectorConfigurations
```

For more information, see [Set-PowerAppDlpPolicyConnectorConfigurations](/powershell/module/microsoft.powerapps.administration.powershell/set-powerappdlppolicyconnectorconfigurations).

#### Connector configurations example

| Permission | Action | Connector | Note |
| ---------- | ------ | --------- | ---- |
| Block | `TodaysForecast` and `CurrentWeather` | MSN Weather | You can allow all other actions. |
| Allow actions | `GetRepositoryById` | GitHub | You can block all other actions. |

> [!NOTE]
> In the following cmdlet, `-PolicyName` refers to a unique GUID.
>
> You can retrieve the DLP GUID by running `Get-DlpPolicy`.

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
