---
title: Metrics and recommendations for Power Apps (preview)
description: Learn more about the metrics and recommendations for Power Apps.
ms.subservice: admin
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/23/2025
ms.custom: NewPPAC
author: alaug
ms.author: alaug
ms.reviewer: sericks
search.audienceType: 
  - admin
contributors:
  - arjunmayur
  - trdehove
---

# Metrics and recommendations for Power Apps (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]
[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Power Apps operational health metrics and recommendations are available in the new Power Platform admin center.

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## View Power Apps metrics and recommendations

 1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
 1. In the navigation pane, select **Monitor**.
 1. In the **Monitor** pane, under **Products**, select **Power Apps**.

    The **Power Apps (preview)** page displays the metrics and recommendations.

## Power Apps metrics and recommendations

### Metric definitions
|Type | Metric | Definition |
|---|---|---|
|Canvas apps | App open success rate| A percentage that describes how often end users are able to successfully open the app. |
|Canvas apps| Time to interactive (TTI)| The time (in seconds) that end users have to wait to interact with the first screen that's displayed after the app opens. |
|Canvas apps| Time to full load (TTFL) | The time (in seconds) that end users have to wait to have all the data requests for the first screen that's displayed after the app opens. |


### Metric and recommendation pairings
| Metric | Secondary metric | Title of recommendation | Description of recommendation |
|---|---|---|---|
| App Open Success Rate | ErrorCode = AppForbidden | Evaluate if the app should be shared with users without permiission | X% of sessions ended without users accessing the app because users didn't have permission to access the app. It's possible that the app may benefit from being shared with more users. The logs show which users&mdash;without permissions&mdash;are attempting to open the app. |

## Monitoring experiences for makers

When [tenant-level analytics](../tenant-level-analytics.md) are turned on, metrics and logs are available to makers. Makers can view only metrics and logs for which they have edit privileges. 

Two environment-level settings, described in the following sections, control what analytics information is available to makers. The first setting controls whether makers can view any analytics data in monitoring experiences, including metrics and logs. The second setting controls whether makers can view End User Pseudonymous Identifiers (EUPI) such as session IDs and user object IDs in event logs.

### Turn on the monitoring experiences for makers

The following [Power Platform Administrator PowerShell](https://www.powershellgallery.com/packages/Microsoft.PowerApps.Administration.PowerShell/2.0.200) cmdlets can be used to control what monitoring data is available to makers.

#### Get settings values for maker access to analytics data

```PowerShell
Get-AdminPowerAppEnvironmentMakerAnalyticsSettings -EnvironmentName
{environment id}
```

#### Turn on maker access to analytics data

This setting doesn't include availability of EUPI, such as the session IDs and user object IDs in event logs.

```PowerShell
Set-AdminPowerAppEnvironmentMakerAnalyticsSettings -EnvironmentName
     {environment id} -EnableAnalyticsForMakers $true
```

#### Turn on maker access to session IDs and user object IDs in event logs

This setting controls maker access to EUPI, such as session IDs or user object IDs in event logs.

```PowerShell
Set-AdminPowerAppEnvironmentMakerAnalyticsSettings -EnvironmentName
     {environment id} -EnableEUPIForMakerAnalytics $true
```

## Frequently asked questions

### Why do makers in my organizations receive a message that settings must be turned on for their monitoring experience?

In addition to the tenant-level analytics setting, the environment-level **Analytics data available to Makers** setting must be turned on. The availability of monitoring health metrics, logs, and recommendations in maker monitoring experiences is based on tenant and environment settings.

| Are tenant-level analytics turned on? | Is analytics data available to makers? | Is the environment a Managed Environment? | Are operational health metrics available? | Are logs available? | Are recommendations available? |
|---|---|---|---|---|---|
| Yes | Yes | Yes | Yes | Yes | Yes |
| Yes | Yes | No | Yes | Yes | No |
| Yes | No | Not applicable | No | No | No |
| No | Not applicable | Not applicable | No | No |No |

