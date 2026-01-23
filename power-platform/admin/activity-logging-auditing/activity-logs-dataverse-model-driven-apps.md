---
title: View Microsoft Dataverse and model-driven app activity logs in Microsoft Purview
description: Learn how to access Dataverse and model-driven app activity logs in Microsoft Purview and explore what activities you can view.
ms.component: pa-admin
ms.topic: how-to
ms.date: 01/23/2026
author: grbarker
contributors:
  - yingchin
  - EllenWehrle
ms.subservice: admin
ms.custom: NewPPAC
ms.author: grbarker
ms.reviewer: ellenwehrle 
search.audienceType: 
  - admin
---

# View Microsoft Dataverse and model-driven app activity logs in Microsoft Purview

Activity logging data supports Data Protection Impact Assessment (DPIA) for Power Platform and customer engagement apps such as Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation.

Regularly view Microsoft Dataverse activities in Microsoft Purview to:

- maintain governance, compliance, and security
- gain operational insights
- identify and troubleshoot problems
- mitigate failures.

This article covers prerequisites, how to access your data in Microsoft Purview's compliance portal, and details about Dataverse and model-driven apps events and schema.

## Prerequisites

To view Dataverse and model-driven app activity logs in Microsoft Purview, make sure you:

- Review and complete all the [prerequisites](activity-logs-overview.md#prerequisites) in the overview article.
- Are an admin with a [Microsoft Office 365 E1](https://www.microsoft.com/microsoft-365/enterprise/office-365-e1) or greater license.
- Are assigned either the *Audit Logs* or *View-Only Audit Logs* role in Microsoft Purview.

Learn more:

- [Manage Dataverse auditing](/power-platform/admin/manage-dataverse-auditing)
- [Auditing overview](/power-apps/developer/data-platform/auditing/overview)
- [Learn more about auditing solutions in Microsoft Purview](/purview/audit-solutions-overview)
- [Permissions in the Microsoft Purview portal](/purview/purview-permissions)

## Access the logs

[!INCLUDE[admin-audit](../../includes/admin-audit-activity-search.md)]

## User and support-related events audited

Logging takes place at the SDK layer, which means a single action can trigger multiple logged events. The following table covers common examples of user and support-related events.

|Event  |Description  |
|---------|---------|
|Create, read, update, delete (CRUD)     |Logging all CRUD activities is essential for understanding the impact of a problem and being compliant with data protection impact assessments (DPIA). |
|Multiple record view     |Users of Dynamics view information in bulk, like grid views, Advanced Find search, and more. Critical customer content information is part of these views.|
|Export to Excel     |Exporting data to Excel moves the data outside of the secure environment and makes it vulnerable to threats.|
|SDK calls via surround or custom apps    |Actions taken via the core platform or surround apps that call into the SDK to perform an action need to be logged.|
|All support CRUD activities     |Microsoft support engineer activities on customer environment.|
|Backend commands     |Microsoft support engineer activities on customer tenant and environment.|
|Report Viewed  |Logging when a report is viewed. Critical customer content information might be displayed on the report.  |
|Report Viewer Export  |Exporting a report to different formats moves the data outside of the secure environment and makes it vulnerable to threats.  |
|Report Viewer Render Image  |Logging multimedia assets that are shown when a report is displayed. They might contain critical customer information.  |

## Base schema

Schemas define which fields are sent to the Microsoft Purview portal. Some fields are common to all applications that send audit data to Microsoft Purview, while others are specific to customer engagement apps. The Base schema contains these common fields.

|Field name  |Type  |Mandatory  |Description  |
|---------|---------|---------|---------|
|`Date`     |:::no-loc text="Edm.Date":::|No         |Date and time the log was generated in Coordinated Universal Time (UTC)         |
|`IP address`     |:::no-loc text="Edm.String":::         |No         |IP address of the user or corporate gateway          |
|`Id`     |:::no-loc text="Edm.Guid":::         |No         |Unique GUID for every row logged          |
|`Result Status`     |:::no-loc text="Edm.String":::         |No         |Status of the row logged. Success in most cases          |
|`Organization Id`     |:::no-loc text="Edm.Guid":::         |Yes        |Unique identifier of the organization from which the log was generated and can be found under Dynamics Developer Resources          |
|`ClientIP`     |:::no-loc text="Edm.String":::         |No         |IP address of the user or corporate gateway          |
|`CorrelationId`     |:::no-loc text="Edm.Guid":::         |No         |Unique value used to associate related rows (for example, when a large row is split)          |
|`CreationTime`     |:::no-loc text="Edm.Date":::         |No         |Date and time the log was generated in Coordinated Universal Time (UTC)          |
|`Operation`     |:::no-loc text="Edm.Date":::         |No         |Name of the message called in the SDK          |
|`UserKey`     |:::no-loc text="Edm.String":::         |No         |Unique identifier of the user in Microsoft Entra ID–also known as :::no-loc text="User PUID":::        |
|`UserType`     |:::no-loc text="Self.UserType":::         |No         |The Microsoft 365 audit type (Regular, System)          |
|`User`     |:::no-loc text="Edm.String":::        |No         |Primary email of the user          |

## Customer engagement apps schema

The customer engagement apps schema contains fields specific to customer engagement apps and partner teams.

|Field name  |Type  |Mandatory  |Description  |
|---------|---------|---------|---------|
|`User Id`     |:::no-loc text="Edm.String":::         |No         |Unique identifier of the user GUID in the organization          |
|`Crm Organization Unique Name`     |:::no-loc text="Edm.String":::         |No         |Unique name of the organization          |
|`Instance Url`     |:::no-loc text="Edm.String":::         |No         |URL to the instance          |
|`Item Url`     |:::no-loc text="Edm.String":::         |No         |URL to the record emitting the log          |
|`Item Type`     |:::no-loc text="Edm.String":::         |No         |Name of the entity          |
|`Message`     |:::no-loc text="Edm.String":::         |No         |Name of the message called in the SDK          |
|`User Agent`     |:::no-loc text="Edm.String":::         |No         |Unique identifier of the user GUID in the organization          |
|`EntityId`     |:::no-loc text="Edm.Guid":::       |No         |Unique identifier of the entity          |
|`EntityName`     |:::no-loc text="Edm.String":::         |No         |Name of the entity in the organization          |
|`Fields`     |:::no-loc text="Edm.String":::          |No         |JSON of Key Value pair reflecting the values that were created or updated         |
|`Id`     |:::no-loc text="Edm.String":::          |No         |Entity name in customer engagement apps        |
|`Query`     |:::no-loc text="Edm.String":::         |No         |The Filter query parameters used while executing the FetchXML          |
|`QueryResults`     |:::no-loc text="Edm.String":::         |No         |One or multiple unique records returned by the Retrieve and Retrieve Multiple SDK message call     |
|`ServiceContextId`     |:::no-loc text="Edm.Guid":::         |No         |The unique ID associated with service context          |
|`ServiceContextIdType`     |:::no-loc text="Edm.String":::         |No         |Application defined token to define context use          |
|`ServiceName`     |:::no-loc text="Edm.String":::         |No         |Name of the Service generating the log          |
|`SystemUserId`     |:::no-loc text="Edm.Guid":::         |No         |Unique identifier of the user GUID in the organization          |
|`UserAgent`     |:::no-loc text="Edm.Guid":::          |No        |Browser used to execute the request          |
|`UserId`     |:::no-loc text="Edm.Guid":::         |No         |The unique ID of the Dynamics system user associated with this activity          |
|`UserUpn`     |:::no-loc text="Edm.String":::         |No         |User principal name of the user associated with this activity          |

## See what's logged

For a list of activities that are logged, see [Microsoft.Crm.Sdk.Messages Namespace](/dotnet/api/microsoft.crm.sdk.messages).

The system logs all SDK messages except the following messages:

- `WhoAmI`
- `RetrieveFilteredForms`
- `TriggerServiceEndpointCheck`
- `QueryExpressionToFetchXml`
- `FetchXmlToQueryExpression`
- `FireNotificationEvent`
- `RetrieveMetadataChanges`
- `RetrieveEntityChanges`
- `RetrieveProvisionedLanguagePackVersion`
- `RetrieveInstalledLanguagePackVersion`
- `RetrieveProvisionedLanguages`
- `RetrieveAvailableLanguages`
- `RetrieveDeprovisionedLanguages`
- `RetrieveInstalledLanguagePacks`
- `GetAllTimeZonesWithDisplayName`
- `GetTimeZoneCodeByLocalizedName`
- `IsReportingDataConnectorInstalled`
- `LocalTimeFromUtcTime`
- `IsBackOfficeInstalled`
- `FormatAddress`
- `IsSupportUserRole`
- `IsComponentCustomizable`
- `ConfigureReportingDataConnector`
- `CheckClientCompatibility`
- `RetrieveAttribute`

## How to categorize Read and ReadMultiple

Use the prefix to categorize each request.

|If the request starts with:  |The category is:  |
|---------|---------|
|`RetrieveMultiple`     |`ReadMultiple`  |
|`ExportToExcel`     |`ReadMultiple` |
|`RollUp` |`ReadMultiple` |
|`RetrieveEntitiesForAggregateQuery` |`ReadMultiple` |
|`RetrieveRecordWall`  |`ReadMultiple` |
|`RetrievePersonalWall`  |`ReadMultiple` |
|`ExecuteFetch`  |`ReadMultiple` |
|`Retrieve`      |`Read`  |
|`Search`     |`Read` |
|`Get`     |`Read` |
|`Export`     |`Read` |

## Example generated logs

The following entries are examples of activity logs.

### Example 1 – Logs generated when user reads an Account record

| Schema Name |                                                      Value                                                      |
|-----------------|---------------------------------------------------------------------------------------------------------------------|
|       `ID`        |                                        `50e01c88-2e43-4005-8be8-9ceb172e2e90`                                         |
|     `UserKey`     |                                                  `10033XXXA49AXXXX`                                                   |
|    `ClientIP`     |                                                   `131.107.XXX.XX`                                                    |
|    `Operation`    |                                                      `Retrieve`                                                       |
|      `Date`       |                                                `3/2/2018 11:25:56 PM`                                                 |
|    `EntityId`     |                                        `00aa00aa-bb11-cc22-dd33-44ee44ee44ee`                                         |
|   `EntityName`    |                                                       `Account`                                                       |
|      `Query`      |                                                         N/A                                                         |
|  `QueryResults`   |                                                         N/A                                                         |
|     `ItemURL`     | `https://orgname.onmicrosoft.com/main.aspx?etn=account&pagetype=entityrecord&id=00aa00aa-bb11-cc22-dd33-44ee44ee44ee` |

### Example 2 – Logs generated when user sees Account records in a grid (Export to Microsoft Excel logs are like this)

|Schema Name  |Value  |
|---------|---------|
|`ID`     |`ef83f463-b92f-455e-97a6-2060a47efe33`          |
|`UserKey`     |`10033XXXA49AXXXX`           |
|`ClientIP`     |`131.107.XXX.XX`          |
|`Operation`     |`RetrieveMultiple`           |
|`Date`     |`3/2/2018 11:25:56 PM`          |
|`EntityId`     |N/A         |
|`EntityName`     |`Account`          |
|`Query`     |`\<filter type="and">\<condition column="ownerid" operator="eq-userid" />\<condition column="statecode" operator="eq" value="0" />\</filter>`         |
|`QueryResults`     |`00aa00aa-bb11-cc22-dd33-44ee44ee44ee`, `dc136b61-6c1e-e811-a952-000d3a732d76`        |
|`ItemURL`     |N/A        |

### Example 3 – List of messages logged when user converts a lead to opportunity

|ID  |EntityID  |EntityName  |Operation |
|---------|---------|---------|---------|
|`53c98033-cca4-4420-97e4-4c1b4f81e062`      |`23ad069e-4d22-e811-a953-000d3a732d76`          |`Contact`         |`Create`         |
|`5aca837c-a1f5-4801-b770-5c66183a58aa`      |`25ad069e-4d22-e811-a953-000d3a732d76`          |`Opportunity`         |`Create`         |
|`c9585748-fdbf-4ff7-970c-bb37f6aa2c36`      |`25ad069e-4d22-e811-a953-000d3a732d76`          |`Opportunity`         |`Update`         |
|`a0469f30-078b-419d-be61-b04c9a34121f`      |`1cad069e-4d22-e811-a953-000d3a732d76`          |`Lead`         |`Update`         |
|`0975bceb-07c7-4dc2-b621-5a7b245c36a4`      |`1cad069e-4d22-e811-a953-000d3a732d76`          |`Lead`         |`Update`         |

## Known issues

- Office has a 3-KB limit for each audit record. Therefore, in some cases, a single record from customer engagement apps needs to split into multiple records in Office. You can use the `CorrelationId` field to retrieve the set of split records for a given source record. Operations that are likely to require splitting include `RetrieveMultiple` and `ExportToExcel`.
- Some operations need more processing to retrieve all relevant data. For example, the system processes `RetrieveMultiple` and `ExportToExcel` to extract the list of records that are retrieved or exported. However, not all relevant operations are yet processed. For example, `ExportToWord` is currently logged as single operation with no other details about what was exported.
- In future releases, the system disables logging for operations deemed unnecessary based on a review of the logs. For example, some operations originate from automated system activity rather than user actions.
- In some record instances, the `EntityName` value appears as `Unknown`. These records aren't related to any specific entity related operation and came in blank from CRM. They all have the entity ID, `0000000-0000-0000-0000-000000000000`.

### Related content

- [Microsoft Purview](/purview/)
- [Microsoft Purview portal](https://purview.microsoft.com/home)
- [Auditing solutions in Microsoft Purview](/purview/audit-solutions-overview)
- [Manage Dataverse auditing](/admin/manage-dataverse-auditing.md)
- [Auditing overview](/power-apps/developer/data-platform/auditing/overview)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
