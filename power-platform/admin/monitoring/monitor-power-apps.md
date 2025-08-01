---
title: Metrics and recommendations for Power Apps
description: Learn more about the metrics and recommendations for Power Apps.
ms.subservice: admin
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/01/2025
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

# Metrics and recommendations for Power Apps

Power Apps operational health metrics and recommendations are available in the new Power Platform admin center.

## View Power Apps metrics and recommendations

 1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
 1. In the navigation pane, select **Monitor**.
 1. In the **Monitor** pane, under **Products**, select **Power Apps**.

    The **Power Apps** page displays the metrics and recommendations.

## Power Apps metrics and recommendations

### Metric definitions
|Type | Metric | Definition | Support |
|---|---|---|---|
|Canvas apps | App open success rate| A percentage that describes how often end users are able to successfully open the app. | Generally available |
|Canvas apps| Time to interactive (TTI)| The time (in seconds) that end users have to wait to interact with the first screen that's displayed after the app opens. | Generally available |
|Canvas apps| Time to full load (TTFL) | The time (in seconds) that end users have to wait to have all the data requests for the first screen that's displayed after the app opens. | Generally available |
|Canvas apps| App session count | The number of distinct user sessions in a canvas app in one day. A session begins when a user opens the app and ends after a period of inactivity or when the app is closed. | Generally available |
|Model-driven apps | App open success rate| A percentage that describes how often end users are able to successfully open the app. | Generally available |
|Model-driven apps| App session count | The number of distinct user sessions in a model-driven app in one day. A session begins when a user opens the app and ends after a period of inactivity or when the app is closed. | Generally available |
|Model-driven apps | Row summary dwell time| The time (in seconds) that end users spend on the expanded AI row summary of a main form. | Preview |

### Metric and recommendation pairings
| Metric | Secondary metric | Title of recommendation | Description of recommendation |
|---|---|---|---|
| App Open Success Rate | ErrorCode = AppForbidden | Evaluate if the app should be shared with users without permission | X% of sessions ended without users accessing the app because users didn't have permission to access the app. It's possible that the app may benefit from being shared with more users. The logs show which users&mdash;without permissions&mdash;are attempting to open the app. |
| Time to interactive | Not applicable | Users wait longer to access the app due to high App.OnStart latencies | App.OnStart durations impact end-user wait times to access an app. Evaluate simplifying Power Fx in App.OnStart and moving some Power Fx to App.Formulas. |
| Time to full load | Not applicable | Users wait longer to see data in the app due to many data requests during app start up | More data requests correlate with longer end-user wait times to meaningfully use an app. Evaluate reducing data calls in App.OnStart and screen.OnVisible and move Power Fx to App.Formulas. |
| Row summary dwell time | Not applicable | Users may not be engaging fully with row summaries | Improve summaries by adjusting the summary prompt for the X table. Summary details that are seen for at least 10 seconds correlates with increased engagement and higher user satisfaction. |

## Monitoring experiences for makers

When [tenant-level analytics](../tenant-level-analytics.md) are turned on, metrics and logs are available to makers. Makers can view only metrics and logs for which they have edit privileges. 

Two environment-level settings, described in the following sections, control what analytics information is available to makers. The first setting, **Get-AdminPowerAppEnvironmentMakerAnalyticsSettings**, which is on be default, controls whether makers can view any analytics data in monitoring experiences, including metrics and logs. The second setting, **Set-AdminPowerAppEnvironmentMakerAnalyticsSettings**, which is off be default,  controls whether makers can view End User Pseudonymous Identifiers (EUPI) such as session IDs and user object IDs in event logs.

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

