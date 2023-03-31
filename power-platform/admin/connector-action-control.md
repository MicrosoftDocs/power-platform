---
title: "Connector action control | MicrosoftDocs"
description: Description goes here.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/31/2023
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

> [!NOTE]
> - **Connector action control** is generally available.
> - Configuring a connector's actions is available for all *blockable* connectors, but not for [unblockable connectors](dlp-connector-classification.md#list-of-connectors-that-cant-be-blocked) and [custom connectors](dlp-custom-connector-parity.md).

You can use connector action control to allow or block individual actions within a given connector. On the **Connectors** page, right-click the connector, and then select **Configure connector** > **Connector actions**.

:::image type="content" source="media/dlp-connector-actions.png" alt-text="Select Configure connector > Connector actions.":::

This opens a side panel where you can allow or deny specific actions. You can also set the default value (Allow or Deny) for any new connector actions that will be added to the connector in the future.

:::image type="content" source="media/dlp-allow-deny-connector-actions.png" alt-text="Set Allow or Deny for connector actions.":::

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
