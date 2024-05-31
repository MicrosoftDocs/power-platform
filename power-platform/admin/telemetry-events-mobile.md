---
title: Telemetry events for mobile app synchronization and actions
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

| Event |	Definition |
| ------ | ------ |
| timestamp [UTC] |	When the event happened |
| id |	 | Event ID |
| target |	Name of the scenario tracked by the event |
| type |	Source table of the event |
| name |	Name of the scenario tracked by the event |
| success |	Result of the scenario tracked by the event (values SUCCESS or FAILURE) |
| duration |	Scenario duration in milliseconds. Duration may include long periods of time when the app is inactive |
| customDimensions 'eventContext'	| Custom event properties |
| EventContext: CurrentSyncId |	Identifier for the current sync session which may span multiple app sessions| 
| EventContext: DataSyncStatus |	| 
| EventContext: entityName | Name of the table in data download events	|
| EventContext: hasNetworkTimeouts | Flag indicating whether any HTTP calls failed with network timeouts in the current sync	|
| EventContext: DataSyncStatus | JSON object containing detailed status of a sync, including details about the data downloaded to the device	|
| EventContext: ProfileId | ID of the offline profile configured for the app and user	|
the data downloaded to the device	|
| EventContext: recordCount | Number of records downloaded	|
| EventContext: responseSize | Response size of an HTTP request	|
| FailureType | Defines type of sync failure	|
| ErrorCode | Error Code generated upon sync failure. See error code mapping table. |
| customDimensions: 'appInfo_Version' |	Version of the native app as seen in the app store. |
| customDimensions "'activeDuration' |	Scenario duration in milliseconds including only time while the app is active.|
|customDimensions "'offlineSyncFcbs' |	Features (de)activated for the offline sync |
| customDimensions "'deviceInfo_Id' |	Unique identifier of the device |
| customDimensions "'device_Type' |	Single value: “ReactNative” |
| customDimensions "'deviceInfo_model' |	Device Model (i.e. Iphone 13) |
| customDimensions "'deviceInfo_make' |	Device Make (i.e. Apple) |
| customDimensions "'deviceInfo_OsName' |	Device OS  i.e. (Android) |
| customDimensions "'deviceInfo_OsVersion' |	OS version i.e. (Android 13) |
|customDimensions "eventName" |	Step of the scenario tracked by the event |
ScenarioEnd
ScenarioStart
ScenarioStory
Trace
AggregateTrace
AggregatedTrace
trace
ScenarioDuplicateEnd
customDimensions "'PipelineInfo_RoutingGeo'	

customDimensions "'logLevel'	The severity or reporting level of the event (valid values are info, error, warning, error, verbose)
customDimensions "'scenarioGuid'	Unique identifier for the scenario tracked by the event
customDimensions "'dataSyncMode'	What type of Offline sync the user has experienced
DELTA_SYNC
GRID_SYNC
FIRST_SYNC
FORCED_SYNC
SINGLE_RECORD_SYNC
customDimensions "'appFlavor'	Native app installed on the devices (valid values are FieldService, PowerApps)
customDimensions "'appName'	powerappsclient

customDimensions "'loc_country'	Telemetry Device origin

operation_Id	Unique identifier for the session
operation_ParentId	Unique identifier for the scenario tracked by the event
user_Id	AAD user ID 
user_AuthenticatedId	AAD user ID
application_Version	Version of the app 



## Error mapping

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
