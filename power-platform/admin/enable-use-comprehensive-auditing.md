---
title: "Microsoft Dataverse and model-driven apps activity logging  | MicrosoftDocs"
description: Learn how to enable auditing to be used for reports in the Microsoft 365 Security Compliance Center.
author: pnghub
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/21/2020
ms.author: gned
ms.reviewer: jimholtz 
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Microsoft Dataverse and model-driven apps activity logging 

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

Protecting data, preserving privacy, and complying with regulations such as the [General Data Protection Regulation](https://www.microsoft.com/TrustCenter/Privacy/gdpr/default.aspx) are certainly some of the highest priorities for your business. It's critical that you audit the entirety of data processing actions taking place to be able to analyze for possible security breaches. This information from Activity Logging can be used when you perform a Data Protection Impact Assessment (DPIA) addressing the use of Office, Power Apps, Microsoft Power Automate, and customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation)
.  

This topic covers how you can set customer engagement apps to audit a broad range of data processing activities and use the [Microsoft 365 Security and Compliance Center](https://support.office.com/article/go-to-the-office-365-security-compliance-center-7e696a40-b86b-4a20-afcc-559218b7b1b8?ui=en-US&rs=en-US&ad=US) to review the data in activity reports.

## Requirements
- A Microsoft 365 Enterprise [E3](https://products.office.com/business/office-365-enterprise-e3-business-software) or [E5](https://products.office.com/business/office-365-enterprise-e5-business-software) subscription is required to do Activity Logging.
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
Schemas define which fields are sent to the Microsoft 365 Security and Compliance Center.  Some fields are common to all applications that send audit data to Microsoft 365, while others are specific to customer engagement apps. The Base schema contains the common fields. 

|Field name  |Type  |Mandatory  |Description  |
|---------|---------|---------|---------|
|Date     |Edm.Date|No         |Date and time of when the log was generated in UTC          |
|IP address     |Edm.String         |No         |IP address of the user or corporate gateway          |
|Id     |Edm.Guid         |No         |Unique GUID for every row logged          |
|Result Status     |Edm.String         |No         |Status of the row logged. Success in most cases          |
|Organization Id     |Edm.Guid         |Yes        |Unique identifier of the organization from which the log was generated. You can find this ID under Dynamics Developer Resources.          |
|ClientIP     |Edm.String         |No         |IP Address of the user or corporate gateway          |
|CorrelationId     |Edm.Guid         |No         |A unique value used to associate related rows (e.g., when a large row is split)          |
|CreationTime     |Edm.Date         |No         |Date and time of when the log was generated in UTC          |
|Operation     |Edm.Date         |No         |Name of the message called in the SDK          |
|UserKey     |Edm.String         |No         |Unique Identifier of the User in AAD. AKA User PUID          |
|UserType     |Self.UserType         |No         |The Microsoft 365 audit type (Regular, System)          |
|User     |Edm.String        |No         |UPN of the user          |

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
|ServiceContextId     |Edm.Guid         |No         |The unique id associated with service context          |
|ServiceContextIdType     |Edm.String         |No         |Application defined token to define context use          |
|ServiceName     |Edm.String         |No         |Name of the Service generating the log          |
|SystemUserId     |Edm.Guid         |No         |Unique identifier of the user GUID in the organization          |
|UserAgent     |Edm.Guid          |No        |Browser used to execute the request          |
|UserId     |Edm.Guid          |No         |The unique id of the Dynamics system user associated with this activity          |
|UserUpn     |Edm.String         |No         |User principal name of the user associated with this activity          |

## Enable auditing 

1. Choose **Settings** > **Administration** > **System Settings** > **Auditing tab**.
2. Under **Audit Settings**, enable the following check boxes:
   - **Start Auditing**
   - **Audit user access**
   - **Start Read Auditing** (Note: this only appears if you enable **Start Auditing**.)
3. Under **Enable Auditing in the following areas**, enable the check boxes for the areas you want to audit and then choose **OK**.
   
   ![System Settings Auditing](media/system-settings-auditing.png "System Settings Auditing")
4. Go to **Settings** > **Customizations** > **Customize the System**
5. Under **Components**, expand **Entities** and select an entity to audit, such as **Account**.
6. Scroll down and under **Data Services** enable **Auditing**.
7. Under **Auditing**, enable the following check boxes:
   - **Single record auditing. Log a record when opened.**
   - **Multiple record auditing. Log all records displayed on an opened page.**

   ![Retrieve Auditing](media/retrieve-auditing.png "Retrieve Auditing")
8. Choose **Save**.
9. Choose **Publish** to publish the customization.
10. Repeat steps 5 - 9 for other entities you want to audit.
11. Turn on audit logging in Microsoft 365. See [Turn audit log search on or off](https://support.office.com/article/turn-office-365-audit-log-search-on-or-off-e893b19a-660c-41f2-9074-d3631c95a014).


## Review your audit data using reports in Microsoft 365 Security and Compliance Center

You can review your audit data in the Microsoft 365 Security and Compliance Center. See [Search the audit log in the compliance Center](https://docs.microsoft.com/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance?view=o365-worldwide).

To use the preconfigured reports, go to https://protection.office.com > **Search & investigation** > **Audit log search** and select the **Dynamics 365 activities** tab.

![Audit log reports](media/D365-audit-log-reports.png "Audit log reports")

## Create reports
You can create your own reports to review your audit data. See [Search the audit log in the Security & Compliance Center](https://support.office.com/article/search-the-audit-log-in-the-office-365-security-compliance-center-0d4d0f35-390b-4518-800e-0c7ec95e946c).

## What's logged

For a list of what's logged with Activity Logging, see [Microsoft.Crm.Sdk.Messages Namespace](https://docs.microsoft.com/dotnet/api/microsoft.crm.sdk.messages?view=dynamics-general-ce-9).

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
|    EntityId     |                                        0a0d8709-711e-e811-a952-000d3a732d76                                         |
|   EntityName    |                                                       Account                                                       |
|      Query      |                                                         N/A                                                         |
|  QueryResults   |                                                         N/A                                                         |
|     ItemURL     | https://orgname.onmicrosoft.com/main.aspx?etn=account&pagetype=entityrecord&id=0a0d8709-711e-e811-a952-000d3a732d76 |

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
|QueryResults     |0a0d8709-711e-e811-a952-000d3a732d76, dc136b61-6c1e-e811-a952-000d3a732d76        |
|ItemURL     |N/A        |

### Example 3 – List of messages logged when user converts a lead to opportunity 

|**ID**  |**EntityID**  |**EntityName**  |**Operation**  |
|---------|---------|---------|---------|
|53c98033-cca4-4420-97e4-4c1b4f81e062      |23ad069e-4d22-e811-a953-000d3a732d76          |Contact         |Create         |
|5aca837c-a1f5-4801-b770-5c66183a58aa      |25ad069e-4d22-e811-a953-000d3a732d76          |Opportunity         |Create         |
|c9585748-fdbf-4ff7-970c-bb37f6aa2c36      |25ad069e-4d22-e811-a953-000d3a732d76          |Opportunity         |Update         |
|a0469f30-078b-419d-be61-b04c9a34121f      |1cad069e-4d22-e811-a953-000d3a732d76          |Lead         |Update         |
|0975bceb-07c7-4dc2-b621-5a7b245c36a4      |1cad069e-4d22-e811-a953-000d3a732d76          |Lead         |Update         |

## Additional considerations

When audit log search in the Microsoft 365 Security and Compliance Center is turned on, user and activity from your organization is recorded in the audit log and retained for 90 days. However, your organization might not want to record and retain audit log data. Or you might be using a third-party security information and event management (SIEM) application to access your auditing data. In those cases, a global admin can turn off audit log search in Microsoft 365.

## Known issues

- Office has a 3KB limit for each audit record. Therefore, in some cases a single record from customer engagement apps needs to be split into multiple records in Office. The CorrelationId field can be used to retrieve the set of split records for a given source record. Operations that are likely to require splitting include RetrieveMultiple and ExportToExcel.
- Some operations need additional processing to retrieve all relevant data. For example, RetrieveMultiple and ExportToExcel are processed to extract the list of records that are retrieved or exported. However, not all relevant operations are yet processed. For example, ExportToWord is currently logged as single operation with no additional details about what was exported.
- In future releases, logging will disabled for operations that are determined to not be useful based on a review of the logs. For example, some operations result from automated system activity, not user activity.

### See also
[Audit data and user activity for security and compliance](audit-data-user-activity.md)<br />
[Search the audit log in the compliance Center](https://docs.microsoft.com/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance?view=o365-worldwide) <br />
Search the audit log for user activity using [Office 365 Management APIs overview](https://docs.microsoft.com/office/office-365-management-api/office-365-management-apis-overview)

