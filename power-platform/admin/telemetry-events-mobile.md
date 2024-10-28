---
title: Telemetry events for mobile app synchronization and actions (preview)
description: Power Apps mobile application data related to offline synchronization events is now available for model-driven and canvas apps.
services: powerapps
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/22/2024
author: JonBaker007
ms.subservice: admin
ms.author: jobaker
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Telemetry events for mobile app synchronization and actions (preview)
[This article is prerelease documentation and is subject to change.]

Power Apps mobile application data related to offline synchronization events is available for model-driven and canvas apps. This data can be used to evaluate the health and performance of offline sync events for your organization. 

This data goes into the **Power Apps (Preview)** > **Mobile app synchronization and actions** table in Application Insights. An entry is logged when a user accesses a Power Apps mobile app, which is configured for offline mode. More data, related to failure events in model-driven apps is available through the **Power Apps (Preview)** > **UCI**.

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are subject to supplemental terms of use, and are available before an official release so that customers can get early access and provide feedback.

## Mobile app synchronization and action event definitions

- **id**: Event ID.
- **target**: Name of the scenario tracked by the event.
- **type**: Source table of the event.
- **name**: Name of the scenario tracked by the event.
- **duration**: Scenario duration in milliseconds. Duration may include long periods of time when the app is inactive.
- **operation_Id**: Unique identifier for the session.
- **operation_ParentId**: Unique identifier for the scenario tracked by the event.
- **user_Id**: Microsoft Entra user ID.
- **application_Version**: Version of the app.
- **customDimensions**: Contains the following attributes:
     - **"EventName"**: Summary of the scenario tracked by the event (ScenarioEnd).
     - **"ScenarioResult"**: SUCCESS or FAILURE.
     - **ErrorCode**: Error code generated upon sync failure. Learn more in [Error code mapping table](#error-code-mapping).
     - **ErrorMessage**: Empty on success or string describing the error.
     - **FailureType**: Defines type of sync failure.
     - **LogLevel**: The severity or reporting level of the event. Valid values are _info_, _error_, _warning_, _error_, or _verbose_.
     - **DataSyncMode**: What type of offline sync the user has experienced.
        - DELTA_SYNC: Automatic incremental sync.
        - GRID_SYNC: Triggered by a refresh on a grid view.
        - FIRST_SYNC: Initial sync on a device (or after a signout/reconfigure).
        - FORCED_SYNC: Triggered from the Device Status page button.
        - SINGLE_RECORD_SYNC: Triggered by Push notification.
     - **AppFlavor**: Native app installed on the devices. Valid values are FieldService and PowerApps.
     - **AppInfo_Version**: Version of the native app, as seen in the app store.
     - **ActiveDuration**: Scenario duration in milliseconds including only time while the app is active.
     - **DeviceInfo_Id**: Unique identifier of the device.
     - **DeviceInfo_model**: Device model (such as iPhone 13).
     - **DeviceInfo_make**: Device make (such as Apple).
     - **DeviceInfo_OsName**: Device operating system (such as Android).
     - **DeviceInfo_OsVersion**: Operating system version (such as Android 13).
     - **Loc_country**: Telemetry device origin.
     - **eventContext**: Contains the following properties:
        - **CurrentSyncId**: ID of a successful sync pass. Reset after each successful sync. (It isn't reset after an error.)
        - **CurrentActivityId**: ID of the sync pass. Reset after each sync.
        - **entityName**: Name of the table in data download events.
        - **ProfileId**: ID of the offline profile configured for the app and user.
        - **RecordCount**: Number of records downloaded.
        - **ResponseSize**: Incoming payload data size as reported by HTTPClient (compressed size).
        - **ContentLength**: Incoming payload data size as reported by HTTPClient (compressed size).



## Unified Client Interface failure events

- **timestamp [UTC]**: When the event happened.
- **problemId**: "uci_trace" or "uciMonitorFailure" (Where the data came from.)
- **type**: "uci_trace" or "uciMonitorFailure" (Where the data came from.)
- **outType**: "uci_trace" or "uciMonitorFailure" (Where the data came from.)
- **outerMessage**: Error message.
- **itemType**: "exception"
- **CustomDimensions**: 
  - **eventContext**: More details related to the error.
  - **ServerConnectivityState**: Is user in offline mode? (Offline/Online)
  - **NetworkConnectivityState**: Does user have internet connection? Note that a user can be in offline mode, but have an internet connection.
  - **IsOfflineByDefaultApp**: When false, it means the **Work in offline mode** feature is on. When true, it means **offline-first** is turned on.
  - **callStack**: The programming code where the error occurred.
  - **hostSubType**: "PowerApps-Player-iOS-fieldservice"
  - **hostType**: "MobileApplication"
- **Operation_ID**: A string concatenation of sessionID followed by a '_' and External correlation ID, for example, _e11e8465-bc8f-4319-b64a-9c1e42453148_0da90a33-ad68-4a4e-bd45-5728d5da719a_.
- **Operation_ParentID**: Activity ID related to error.
- **SessionId**: Session ID of error.
- **UserId**: Dynamics 365 user ID.
- **User_authenticatedID**: Dynamics 365 user ID.
- **Application_version**: App version, for example, _9.2.24045.00212_.
- **Client_Type**: Operating system version, such as iOS or Android.

## Example scenarios

### Offline sync failures by error code 
This query allows you see what types of failures frontline workers are encountering when a sync fails. Some failures are excepted, such as if the mobile application is closed while syncing, or if the network disconnects while syncing and prevents the sync from completing. Definition of failure codes is shown in the [Error code mapping table](#error-code-mapping).

```kusto
dependencies
| extend cd = parse_json(customDimensions)
| where cd.appFlavor == "FieldService"
| where type  == "modelAppEvent"
| where isnotempty(cd.FailureType)
| extend FailureType = tostring(cd.FailureType), 
         ErrorCode = tostring(cd.ErrorCode)
| summarize Count = count() by FailureType, ErrorCode
| project FailureType, ErrorCode, Count
| render piechart with (title="Sync Failures Categorized by FailureType and ErrorCode")
```

### Tables synced by record count
This query allows you to evaluate which tables are contributing most records to a sync. Using this data you can try to further [optimize your offline profile](/power-apps/mobile/mobile-offline-guidelines#dont-make-your-users-download-too-much-data) to reduce records or [data within each table](/power-apps/mobile/mobile-offline-guidelines#optimize-dowloaded-data-with-offline-table-column-selection-preview). 

```kusto
dependencies
| extend cd = parse_json(customDimensions)
| extend eventContext = parse_json(tostring(cd.eventContext))
//| where eventContext.IsFirstSync == "true" // Filter sync type
| extend dataSyncStatus = parse_json(tostring(eventContext.DataSyncStatus))
| mv-expand entities = dataSyncStatus.entities to typeof(dynamic) // Expand the entities list into rows
| project TableName = entities.entityName, SyncedRecordCount = entities.totalSyncedRecordCount
| summarize TotalSyncedRecords = sum(toint(SyncedRecordCount)) by tostring(TableName)
| order by TotalSyncedRecords desc
| render piechart // Visualize the results as a pie chart
```

### Users by device type and app version
This query gives more information on users in your organization who are accessing the mobile application on their device model. 

```kusto
dependencies
| extend cd = parse_json(customDimensions)
| where isnotempty(user_Id) // Filter out rows where user_Id is empty
| where cd.appFlavor == "FieldService"
| where type  == "modelAppEvent"
| extend ShortAppVersion = extract(@"\b\d+\.(\d+\.\d+)", 1, application_Version)
| summarize Users = dcount(user_Id), 
             iOS = dcountif(user_Id, cd.deviceInfo_OsName == "iOS"  or cd.deviceInfo_OsName == "iPadOS"), 
             Android = dcountif(user_Id, cd.deviceInfo_OsName == "Android"), 
             Windows = dcountif(user_Id, cd.deviceInfo_OsName has "Windows") 
         by ShortAppVersion
```

## Error code mapping

| Error code	| Failure type |	Definition|
| ------ | ------ | ------ |
|-2146864604 |	CONFIG_ERROR |	App or user configuration error. See [Web service error codes](/power-apps/developer/data-platform/reference/web-service-error-codes). |
|-2146864606 |	CONFIG_ERROR |	App or user configuration error. See [Web service error codes](/power-apps/developer/data-platform/reference/web-service-error-codes). |
|-2146864607 |	CONFIG_ERROR |	App or user configuration error. See [Web service error codes](/power-apps/developer/data-platform/reference/web-service-error-codes). |
|-2146864608 |	CONFIG_ERROR |	App or user configuration error. See [Web service error codes](/power-apps/developer/data-platform/reference/web-service-error-codes). |
|-2146869250 |	CONFIG_ERROR |	App or user configuration error. See [Web service error codes](/power-apps/developer/data-platform/reference/web-service-error-codes). |
|-2147015328 |	ACCESS_ERROR |	App or user configuration error. See [Web service error codes](/power-apps/developer/data-platform/reference/web-service-error-codes). |
|-2147088248 |	CONFIG_ERROR |	App or user configuration error. See [Web service error codes](/power-apps/developer/data-platform/reference/web-service-error-codes). |
| -2147155198 |	ERROR	| For error codes beginning in –214, see [Web service error codes](/power-apps/developer/data-platform/reference/web-service-error-codes). |
| -2147155198 |	ACCESS_ERROR |	App or user configuration error. See [Web service error codes](/power-apps/developer/data-platform/reference/web-service-error-codes). |
| -2147167669 |	ACCESS_ERROR |	App or user configuration error. See [Web service error codes](/power-apps/developer/data-platform/reference/web-service-error-codes). |
| -2147180269 |	ACCESS_ERROR |	App or user configuration error. See [Web service error codes](/power-apps/developer/data-platform/reference/web-service-error-codes). |
| -2147180284 |	ACCESS_ERROR |	App or user configuration error. See [Web service error codes](/power-apps/developer/data-platform/reference/web-service-error-codes). |
| -2147187375 |	ERROR |	App or user configuration error. See [Web service error codes](/power-apps/developer/data-platform/reference/web-service-error-codes). |
|-2147187388 |	ERROR |	App or user configuration error. See [Web service error codes](/power-apps/developer/data-platform/reference/web-service-error-codes). |
| -2147187389 |	ERROR |	App or user configuration error. See [Web service error codes](/power-apps/developer/data-platform/reference/web-service-error-codes). |
| -2147204270 |	ERROR |	App or user configuration error. See [Web service error codes](/power-apps/developer/data-platform/reference/web-service-error-codes). |
| -2147204339 |	ERROR |	App or user configuration error. See [Web service error codes](/power-apps/developer/data-platform/reference/web-service-error-codes). |
| -2147204784 |	ERROR |	App or user configuration error. See [Web service error codes](/power-apps/developer/data-platform/reference/web-service-error-codes). |
| -2147209463 |	ACCESS_ERROR |	App or user configuration error. See [Web service error codes](/power-apps/developer/data-platform/reference/web-service-error-codes). |
| -2147217124 |	ERROR |	For error codes beginning in –214, see [Web service error codes](/power-apps/developer/data-platform/reference/web-service-error-codes). |
| -2147220884 |	ERROR |	For error codes beginning in –214, see [Web service error codes](/power-apps/developer/data-platform/reference/web-service-error-codes). |
| -2147220955 |	ACCESS_ERROR |	App or user configuration error. See [Web service error codes](/power-apps/developer/data-platform/reference/web-service-error-codes). |
| -2147220956 |	EXTERNAL_ERROR |	For error codes beginning in –214, see [Web service error codes](/power-apps/developer/data-platform/reference/web-service-error-codes). |
| -2147220960 |	ACCESS_ERROR |	App or user configuration error. See [Web service error codes](/power-apps/developer/data-platform/reference/web-service-error-codes). |
| -2147220970 |	ERROR |	For error codes beginning in –214, see [Web service error codes](/power-apps/developer/data-platform/reference/web-service-error-codes). |
| -2147220989 |	ERROR |	For error codes beginning in –214, see [Web service error codes](/power-apps/developer/data-platform/reference/web-service-error-codes). |
| -50 |	ERROR |	Internal error. |
| 0 |	ERROR |	Unknown error. |
| 2000 |	ERROR |	Unmapped error. |
| 2002 |	ERROR |	Dataverse SQL timeout. |
| 2003 |	DATABASE_ERROR |	Database error. |
| 2004 |	NETWORK_ERROR |	Network error. |
| 2005 |	SERVER_ERROR |	Server error. |
| 2006 |	AUTH_ERROR |	Authentication error. |
| 2007 |	DEVICE_ERROR |	Disk is full error. |
| 2008 |	ERROR |	Internal error. |
| 2009 |	AUTH_ERROR |	Authentication error. |
| 2011 |	CONFIG_ERROR |	App module privilege error. |
| 2016 |	CONFIG_ERROR |	Offline configuration error. |
| 2017 |	CONFIG_ERROR |	Offline profile configuration error. |
| 3000 |	EXPECTED_ERROR |	Sync internal event. |
| 3003 | CONFIG_ERROR |	Offline profile configuration error. |
