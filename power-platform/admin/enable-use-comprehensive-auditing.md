---
title: "Microsoft Dataverse and model-driven apps activity logging  | MicrosoftDocs"
description: Learn how to enable auditing to be used for reports in the Microsoft Purview portal.
ms.component: pa-admin
ms.topic: concept-article
ms.date: 01/25/2024
author: Zeffin
ms.subservice: admin
ms.custom: NewPPAC
ms.author: johnev
ms.reviewer: sericks 
search.audienceType: 
  - admin
---
# Microsoft Dataverse and model-driven apps activity logging 

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Protecting data, preserving privacy, and complying with [privacy regulations](https://www.microsoft.com/trust-center/privacy) are priorities for your business. To safeguard sensitive information, it’s essential to audit all data processing activities and analyze them for potential security breaches. 

Activity Logging data supports Data Protection Impact Assessment (DPIA) for Power Apps, Power Automate, and customer engagement apps such as Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation.

This topic explains how to configure Power Apps, Power Automate, and customer engagement apps to audit a broad range of data processing activities. You can then view the logged data in activity reports using the [Microsoft Purview portal](https://support.office.com/article/go-to-the-office-365-security-compliance-center-7e696a40-b86b-4a20-afcc-559218b7b1b8?ui=en-US&rs=en-US&ad=US).

## Requirements
- At least one user assigned a Microsoft/Office 365 [E1](https://www.microsoft.com/microsoft-365/enterprise/office-365-e1) or greater license.
- Available for production and not sandbox environments.

## What events are audited
Logging takes place at the SDK layer which means a single action can trigger multiple events that are logged. The following are a sample of user events you can audit. Admin events are currently not logged.

### User and support-related events 

|Event  |Description  |
|---------|---------|
|Create, read, update, delete (CRUD)     |Logging all CRUD activities essential for understanding the impact of a problem and being compliant with data protection impact assessments (DPIA). |
|Multiple record view     |Users of Dynamics view information in bulk, like grid views, Advanced Find search, etc. Critical customer content information is part of these views.|
|Export to Excel     |Exporting data to Excel moves the data outside of the secure environment and is vulnerable to threats.|
|SDK calls via surround or custom apps    |Actions taken via the core platform or surround apps calling into the SDK to perform an action needs to be logged.|
|All support CRUD activities     |Microsoft support engineer activities on customer environment.|
|Backend commands     |Microsoft support engineer activities on customer tenant and environment.|
|Report Viewed  |Logging when a report is viewed. Critical customer content information might be displayed on the report.  |
|Report Viewer Export  |Exporting a report to different formats moves the data outside of the secure environment and is vulnerable to threats.  |
|Report Viewer Render Image  |Logging multimedia assets that are shown when a report is displayed. They might contain critical customer information.  |

## Base schema
Schemas define which fields are sent to the Microsoft Purview portal. Some fields are common to all applications that send audit data to Microsoft Purview, while others are specific to customer engagement apps. The Base schema contains the common fields. 

|Field name  |Type  |Mandatory  |Description  |
|---------|---------|---------|---------|
|Date     |Edm.Date|No         |Date and time of when the log was generated in UTC          |
|IP address     |Edm.String         |No         |IP address of the user or corporate gateway          |
|Id     |Edm.Guid         |No         |Unique GUID for every row logged          |
|Result Status     |Edm.String         |No         |Status of the row logged. Success in most cases          |
|Organization Id     |Edm.Guid         |Yes        |Unique identifier of the organization from which the log was generated. You can find this ID under Dynamics Developer Resources.          |
|ClientIP     |Edm.String         |No         |IP Address of the user or corporate gateway          |
|CorrelationId     |Edm.Guid         |No         |A unique value used to associate related rows (for example, when a large row is split)          |
|CreationTime     |Edm.Date         |No         |Date and time of when the log was generated in UTC          |
|Operation     |Edm.Date         |No         |Name of the message called in the SDK          |
|UserKey     |Edm.String         |No         |Unique Identifier of the User in Microsoft Entra ID. AKA User PUID          |
|UserType     |Self.UserType         |No         |The Microsoft 365 audit type (Regular, System)          |
|User     |Edm.String        |No         |Primary email of the user          |

## Customer engagement apps schema
The customer engagement apps schema contains fields specific to customer engagement apps and partner teams. 

|Field name  |Type  |Mandatory  |Description  |
|---------|---------|---------|---------|
|User Id     |Edm.String         |No         |Unique identifier of the user GUID in the organization          |
|Crm Organization Unique Name     |Edm.String         |No         |Unique name of the organization          |
|Instance Url     |Edm.String         |No         |URL to the instance          |
|Item Url     |Edm.String         |No         |URL to the record emitting the log          |
|Item Type     |Edm.String         |No         |Name of the entity          |
|Message     |Edm.String         |No         |Name of the message called in the SDK          |
|User Agent     |Edm.String         |No         |Unique identifier of the user GUID in the organization          |
|EntityId     |Edm.Guid        |No         |Unique identifier of the entity          |
|EntityName     |Edm.String         |No         |Name of the entity in the organization          |
|Fields     |Edm.String          |No         |JSON of Key Value pair reflecting the values that were created or updated         |
|Id     |Edm.String          |No         |Entity name in customer engagement apps        |
|Query     |Edm.String         |No         |The Filter query parameters used while executing the FetchXML          |
|QueryResults     |Edm.String         |No         |One or multiple unique records returned by the Retrieve and Retrieve Multiple SDK message call          |
|ServiceContextId     |Edm.Guid         |No         |The unique ID associated with service context          |
|ServiceContextIdType     |Edm.String         |No         |Application defined token to define context use          |
|ServiceName     |Edm.String         |No         |Name of the Service generating the log          |
|SystemUserId     |Edm.Guid         |No         |Unique identifier of the user GUID in the organization          |
|UserAgent     |Edm.Guid          |No        |Browser used to execute the request          |
|UserId     |Edm.Guid          |No         |The unique ID of the Dynamics system user associated with this activity          |
|UserUpn     |Edm.String         |No         |User principal name of the user associated with this activity          |

## Enable auditing 

Access requires sufficient permissions, such as System Administrator or System Customizer role. To check your security role, see [View your user profile](/powerapps/user/view-your-user-profile). If you don’t have the correct permissions, contact your system administrator.

### [Modern admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**. 
1. Expand **Audit and logs**, then select **Audit settings**.
   
### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Audit and logs**, then select **Audit settings**.
---

**Audit settings configuration**
On the **Audit settings** page:
1. Under **Auditing**, turn on the following options:
   - **Start Auditing** - Activates auditing for the environment.
   - **Audit user access** - Tracks user sign-ins.
   - **Start Read Auditing** - captures most user activities and events.
2. Set the **retention policy** for auditing logs based on your requirements.
3. Select **Save** to apply the changes.

**Setting organization-level auditing on tables**
1. From the **Audit settings** page, select **Global Audit Settings**.
2. Under **Enable Auditing in the following areas**, select the check boxes for the areas you want to audit.
3. Select **OK** to apply the changes.
   
**Setting table-level auditing**
1. Sign in to [Power Apps Home Page](https://make.powerapps.com/).
2. In the command bar, select **Settings**, then choose **Advanced settings**.
3. Select **Customizations**, then select **Customize the System**.
4. In the navigation pane, under **Components**, expand **Entities** and select the entity to audit (for example, **Account**).
5. Scroll down to **Data Services**, then enable the check box for **Auditing**.
6. Under **Auditing**, enable the following options:
   - **Single record auditing. Log a record when opened.**
   - **Multiple record auditing. Log all records displayed on an opened page.**
7. In the command bar, select **Save** to apply the changes.
8. Select **Publish** to finalize the customization.
9. Repeat steps **4–8** for other tables you want to audit.
10. Turn on audit logging in **Microsoft Purview**. See [Turn audit log search on or off](https://support.office.com/article/turn-office-365-audit-log-search-on-or-off-e893b19a-660c-41f2-9074-d3631c95a014).


## Review your audit data using reports in Microsoft Purview portal

When [audit log search](/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance) is turned on in the Microsoft Purview portal, user and admin activity from your organization is recorded in the audit log and retained for 90 days. However, your organization might not want to record and retain audit log data. Or you might be using a third-party security information and event management (SIEM) application to access your auditing data. In those cases, a global admin can turn off audit log search in Microsoft Purview. For more information, see [Auditing solutions in Microsoft Purview](/microsoft-365/compliance/auditing-solutions-overview).

To search for records in [Microsoft Purview portal](https://compliance.microsoft.com/), choose **Record type** as **CRM**, and  **Activities** as **All Dynamics 365 activities**.

## Create reports
You can create your own reports to review your audit data. See [Search the audit log in the Microsoft Purview portal](https://support.office.com/article/search-the-audit-log-in-the-office-365-security-compliance-center-0d4d0f35-390b-4518-800e-0c7ec95e946c).

## What's logged

For a list of what's logged with Activity Logging, see [Microsoft.Crm.Sdk.Messages Namespace](/dotnet/api/microsoft.crm.sdk.messages).

We log all SDK messages except the following:

- WhoAmI
-	RetrieveFilteredForms
-	TriggerServiceEndpointCheck
-	QueryExpressionToFetchXml
-	FetchXmlToQueryExpression
-	FireNotificationEvent
-	RetrieveMetadataChanges
-	RetrieveEntityChanges
-	RetrieveProvisionedLanguagePackVersion
-	RetrieveInstalledLanguagePackVersion
-	RetrieveProvisionedLanguages
-	RetrieveAvailableLanguages
-	RetrieveDeprovisionedLanguages
-	RetrieveInstalledLanguagePacks
-	GetAllTimeZonesWithDisplayName
-	GetTimeZoneCodeByLocalizedName
-	IsReportingDataConnectorInstalled
-	LocalTimeFromUtcTime
-	IsBackOfficeInstalled
-	FormatAddress
-	IsSupportUserRole
-	IsComponentCustomizable
-	ConfigureReportingDataConnector
-	CheckClientCompatibility
-	RetrieveAttribute

## How we categorize read and readmultiple

We use the prefix to categorize.

|If the request starts with:  |We characterize as:  |
|---------|---------|
|RetrieveMultiple     |ReadMultiple  |
|ExportToExcel     |ReadMultiple |
|RollUp |ReadMultiple |
|RetrieveEntitiesForAggregateQuery |ReadMultiple | 
|RetrieveRecordWall  |ReadMultiple | 
|RetrievePersonalWall  |ReadMultiple | 
|ExecuteFetch  |ReadMultiple | 
|Retrieve      |Read  |
|Search     |Read |
|Get     |Read |
|Export     |Read |

## Example generated logs

The following are some examples of logs created with Activity Logging.

### Example 1 – Logs generated when user reads an Account record 

| **Schema Name** |                                                      **Value**                                                      |
|-----------------|---------------------------------------------------------------------------------------------------------------------|
|       ID        |                                        50e01c88-2e43-4005-8be8-9ceb172e2e90                                         |
|     UserKey     |                                                  10033XXXA49AXXXX                                                   |
|    ClientIP     |                                                   131.107.XXX.XX                                                    |
|    Operation    |                                                      Retrieve                                                       |
|      Date       |                                                3/2/2018 11:25:56 PM                                                 |
|    EntityId     |                                        00aa00aa-bb11-cc22-dd33-44ee44ee44ee                                         |
|   EntityName    |                                                       Account                                                       |
|      Query      |                                                         N/A                                                         |
|  QueryResults   |                                                         N/A                                                         |
|     ItemURL     | `https://orgname.onmicrosoft.com/main.aspx?etn=account&pagetype=entityrecord&id=00aa00aa-bb11-cc22-dd33-44ee44ee44ee` |

### Example 2 – Logs generated when user sees Account records in a Grid (Export to Microsoft Excel logs are like this) 

|**Schema Name**  |**Value**  |
|---------|---------|
|ID     |ef83f463-b92f-455e-97a6-2060a47efe33          |
|UserKey     |10033XXXA49AXXXX           |
|ClientIP     |131.107.XXX.XX          |
|Operation     |RetrieveMultiple           |
|Date     |3/2/2018 11:25:56 PM          |
|EntityId     |N/A         |
|EntityName     |Account          |
|Query     |\<filter type="and">\<condition column="ownerid" operator="eq-userid" />\<condition column="statecode" operator="eq" value="0" />\</filter>         |
|QueryResults     |00aa00aa-bb11-cc22-dd33-44ee44ee44ee, dc136b61-6c1e-e811-a952-000d3a732d76        |
|ItemURL     |N/A        |

### Example 3 – List of messages logged when user converts a lead to opportunity 

|**ID**  |**EntityID**  |**EntityName**  |**Operation**  |
|---------|---------|---------|---------|
|53c98033-cca4-4420-97e4-4c1b4f81e062      |23ad069e-4d22-e811-a953-000d3a732d76          |Contact         |Create         |
|5aca837c-a1f5-4801-b770-5c66183a58aa      |25ad069e-4d22-e811-a953-000d3a732d76          |Opportunity         |Create         |
|c9585748-fdbf-4ff7-970c-bb37f6aa2c36      |25ad069e-4d22-e811-a953-000d3a732d76          |Opportunity         |Update         |
|a0469f30-078b-419d-be61-b04c9a34121f      |1cad069e-4d22-e811-a953-000d3a732d76          |Lead         |Update         |
|0975bceb-07c7-4dc2-b621-5a7b245c36a4      |1cad069e-4d22-e811-a953-000d3a732d76          |Lead         |Update         |

## Other considerations

When audit log search in the Microsoft Purview portal is turned on, user and activity from your organization is recorded in the audit log and retained for 90 days. However, your organization might not want to record and retain audit log data. Or you might be using a third-party security information and event management application to access your auditing data. In those cases, a global admin can turn off audit log search in Microsoft 365.

## Known issues

- Office has a 3-KB limit for each audit record. Therefore, in some cases a single record from customer engagement apps needs to be split into multiple records in Office. The CorrelationId field can be used to retrieve the set of split records for a given source record. Operations that are likely to require splitting include RetrieveMultiple and ExportToExcel.
- Some operations need more processing to retrieve all relevant data. For example, RetrieveMultiple and ExportToExcel are processed to extract the list of records that are retrieved or exported. However, not all relevant operations are yet processed. For example, ExportToWord is currently logged as single operation with no other details about what was exported.
- In future releases, logging is disabled for operations deemed unnecessary based on a review of the logs. For example, some operations originate from automated system activity rather than user actions.
- In some record instances, the EntityName value may be marked with Unknown. These records aren't related to any specific entity related operation and came in blank from CRM. They all have entity ID of 0000000-0000-0000-0000-000000000000.

### See also
[Manage Dataverse auditing](manage-dataverse-auditing.md)<br />
[Search the audit log in Microsoft Purview portal](/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance) <br />
[Search the audit log for user activity using Office 365 Management APIs overview](/office/office-365-management-api/office-365-management-apis-overview)



[!INCLUDE[footer-include](../includes/footer-banner.md)]
