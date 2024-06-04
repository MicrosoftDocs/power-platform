---
title: Telemetry events for mobile app synchronization and actions (Preview)
description: Learn more about telemetry events for mobile app synchronization and actions.
services: powerapps
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/31/2022
author: sericks007
ms.subservice: admin
ms.author: sericks
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Telemetry events for mobile app synchronization and actions

Power Apps Mobile application data related to Offline Sync events is now available for Model Driven Applications and Canvas applications. This data can be used to evaluate health and performance of Offline sync for your organization. 

This data goes into the **Power Apps (Peview)** > **Mobile app synchronization and actions** table in Application Insights. An entry is logged when a user accessing a mobile application Power Apps Mobile application which is enabled for Offline mode.  Additional data related to application failure events in Model Driven Applications is available via the **Power Apps (Peview)** > **UCI**


## Mobile app synchronization and action event definitions

- **id**: Event ID
- **target**: Name of the scenario tracked by the event
- **type**: Source table of the event
- **name**: Name of the scenario tracked by the event
- **success**: Result of the scenario tracked by the event (values SUCCESS or FAILURE)
- **duration**: Scenario duration in milliseconds. Duration may include long periods of time when the app is inactive
- **FailureType**: Defines type of sync failure
- **ErrorCode**: Error Code generated upon sync failure. See [error code mapping table](#Error_Code_mapping).
- **operation_Id**: Unique identifier for the session
- **operation_ParentId**: Unique identifier for the scenario tracked by the event
- **user_Id**: AAD user ID
- **user_AuthenticatedId**: AAD user ID
- **application_Version**: Version of the app
- **customDimensions**: Contains the following attributes
     - **eventContext**: Contains the following properties
        - **CurrentSyncId**: Identifier for the current sync session which may span multiple app sessions
        - **DataSyncStatus**: (No value provided)
        - **entityName**: Name of the table in data download events
        - **hasNetworkTimeouts**: Flag indicating whether any HTTP calls failed with network timeouts in the current sync
        - **DataSyncStatus**: JSON object containing detailed status of a sync, including details about the data downloaded to the device
        - **ProfileId**: ID of the offline profile configured for the app and user
        - **recordCount**: Number of records downloaded
        - **responseSize**: Response size of an HTTP request
    - **appInfo_Version**: Version of the native app as seen in the app store.
    - **activeDuration**: Scenario duration in milliseconds including only time while the app is active.
    - **offlineSyncFcbs**: Features (de)activated for the offline sync
    - **deviceInfo_Id**: Unique identifier of the device
    - **deviceInfo_model**: Device Model (i.e. Iphone 13)
    - **deviceInfo_make**: Device Make (i.e. Apple)
    - **deviceInfo_OsName**: Device OS i.e. (Android)
    - **deviceInfo_OsVersion**: OS version i.e. (Android 13)
    - **"eventName"**: Step of the scenario tracked by the event (ScenarioEnd, ScenarioStart, ScenarioStory, Trace, AggregateTrace, AggregatedTrace, trace, ScenarioDuplicateEnd)
    - **logLevel**: The severity or reporting level of the event (valid values are info, error, warning, error, verbose)
    - **scenarioGuid**: Unique identifier for the scenario tracked by the event
    - **dataSyncMode**: What type of Offline sync the user has experienced
        - DELTA_SYNC
        - GRID_SYNC
        - FIRST_SYNC
        - FORCED_SYNC
        - SINGLE_RECORD_SYNC
    - **appFlavor**: Native app installed on the devices (valid values are FieldService, PowerApps)
    - **loc_country**: Telemetry Device origin


## UCI Failure Events
- **timestamp [UTC]**: When the event happened
- **problemId**: "uci_trace" or "uciMonitorFailure" (where the data came from)
- **type**: "uci_trace" or "uciMonitorFailure" (where the data came from)
- **outType**: "uci_trace" or "uciMonitorFailure" (where the data came from)
- **outerMessage**: Error message
- **itemType**: "exception"
- **CustomDimensions**: 
  - **eventContext**: Additional details related to the error
  - **ServerConnectivityState**: Is user in offlineMode? (Offline/Online)
  - **NetworkConnectivityState**: Does user have internet connection (note user can be in offline but have an internet connection)
  - **IsOfflineByDefaultApp**: When this is false it means "Work in Offline Mode" feature is on. When true it means OfflineFirst is enabled
  - **callStack**: Where the programming code where the error occurred
  - **hostSubType**: "PowerApps-Player-iOS-fieldservice"
  - **hostType**: "MobileApplication"
- **Operation_ID**: A string concatenation of sessionID followed by a '_' and External correlation ID e.g., e11e8465-bc8f-4319-b64a-9c1e42453148_0da90a33-ad68-4a4e-bd45-5728d5da719a
- **Operation_ParentID**: ActivityID related to error
- **SessionId**: SessionID of error
- **UserId**: Dynamics UserID
- **User_authenticatedID**: Dynamics UserID
- **Application_version**: App version e.g., 9.2.24045.00212
- **Client_Type**: OS version (i.e iOS/Android)


# Example Scenarios

## Offline Sync Failure Rate by Sync Type
abc

## Tables Synced by Record Count
abc

## Users by Device Type and App Version
abc


# Error Code mapping

| ErrorCode	| FailureType |	Definition|
| ------ | ------ | ------ |
|-2146864604 |	CONFIG_ERROR |	App/user configuration error. See Web service error codes (Microsoft Dataverse) - Power Apps | Microsoft Learn. |
|-2146864606 |	CONFIG_ERROR |	App/user configuration error. See Web service error codes (Microsoft Dataverse) - Power Apps | Microsoft Learn. |
|-2146864607 |	CONFIG_ERROR |	App/user configuration error. See Web service error codes (Microsoft Dataverse) - Power Apps | Microsoft Learn. |
|-2146864608 |	CONFIG_ERROR |	App/user configuration error. See Web service error codes (Microsoft Dataverse) - Power Apps | Microsoft Learn. |
|-2146869250 |	CONFIG_ERROR |	App/user configuration error. See Web service error codes (Microsoft Dataverse) - Power Apps | Microsoft Learn. |
|-2147015328 |	ACCESS_ERROR |	App/user configuration error. See Web service error codes (Microsoft Dataverse) - Power Apps | Microsoft Learn. |
|-2147088248 |	CONFIG_ERROR |	App/user configuration error. See Web service error codes (Microsoft Dataverse) - Power Apps | Microsoft Learn. |
| -2147155198 |	ERROR	| For error codes beginning in –214, see Web service error codes (Microsoft Dataverse) - Power Apps | Microsoft Learn. |
| -2147155198 |	ACCESS_ERROR |	App/user configuration error. See Web service error codes (Microsoft Dataverse) - Power Apps | Microsoft Learn. |
| -2147167669 |	ACCESS_ERROR |	App/user configuration error. See Web service error codes (Microsoft Dataverse) - Power Apps | Microsoft Learn. |
| -2147180269 |	ACCESS_ERROR |	App/user configuration error. See Web service error codes (Microsoft Dataverse) - Power Apps | Microsoft Learn. |
| -2147180284 |	ACCESS_ERROR |	App/user configuration error. See Web service error codes (Microsoft Dataverse) - Power Apps | Microsoft Learn. |
| -2147187375 |	ERROR |	App/user configuration error. See Web service error codes (Microsoft Dataverse) - Power Apps | Microsoft Learn. |
|-2147187388 |	ERROR |	App/user configuration error. See Web service error codes (Microsoft Dataverse) - Power Apps | Microsoft Learn. |
| -2147187389 |	ERROR |	App/user configuration error. See Web service error codes (Microsoft Dataverse) - Power Apps | Microsoft Learn. |
| -2147204270 |	ERROR |	App/user configuration error. See Web service error codes (Microsoft Dataverse) - Power Apps | Microsoft Learn. |
| -2147204339 |	ERROR |	App/user configuration error. See Web service error codes (Microsoft Dataverse) - Power Apps | Microsoft Learn. |
| -2147204784 |	ERROR |	App/user configuration error. See Web service error codes (Microsoft Dataverse) - Power Apps | Microsoft Learn. |
| -2147209463 |	ACCESS_ERROR |	App/user configuration error. See Web service error codes (Microsoft Dataverse) - Power Apps | Microsoft Learn. |
| -2147217124 |	ERROR |	For error codes beginning in –214, see Web service error codes (Microsoft Dataverse) - Power Apps | Microsoft Learn. |
| -2147220884 |	ERROR |	For error codes beginning in –214, see Web service error codes (Microsoft Dataverse) - Power Apps | Microsoft Learn. |
| -2147220955 |	ACCESS_ERROR |	App/user configuration error. See Web service error codes (Microsoft Dataverse) - Power Apps | Microsoft Learn. |
| -2147220956 |	EXTERNAL_ERROR |	For error codes beginning in –214, see Web service error codes (Microsoft Dataverse) - Power Apps | Microsoft Learn. |
| -2147220960 |	ACCESS_ERROR |	App/user configuration error. See Web service error codes (Microsoft Dataverse) - Power Apps | Microsoft Learn. |
| -2147220970 |	ERROR |	For error codes beginning in –214, see Web service error codes (Microsoft Dataverse) - Power Apps | Microsoft Learn. |
| -2147220989 |	ERROR |	For error codes beginning in –214, see Web service error codes (Microsoft Dataverse) - Power Apps | Microsoft Learn. |
| -50 |	ERROR |	Internal Error |
| 0 |	ERROR |	Unknown Error |
| 2000 |	ERROR |	Unmapped Error |
| 2002 |	ERROR |	Dataverse SQL Timeout |
| 2003 |	DATABASE_ERROR |	Database Error |
| 2004 |	NETWORK_ERROR |	Network Error |
| 2005 |	SERVER_ERROR |	Server Error |
| 2006 |	AUTH_ERROR |	Auth Error |
| 2007 |	DEVICE_ERROR |	Disk full Error |
| 2008 |	ERROR |	Internal Error |
| 2009 |	AUTH_ERROR |	Auth Error |
| 2011 |	CONFIG_ERROR |	App module privilege error |
| 2016 |	CONFIG_ERROR |	Offline configuration error |
| 2017 |	CONFIG_ERROR |	Offline profile configuration error |
| 3000 |	EXPECTED_ERROR |	Sync internal event |
3003	CONFIG_ERROR	Offline profile configuration error |
