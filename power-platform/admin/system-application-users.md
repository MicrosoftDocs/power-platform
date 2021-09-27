---
title: "Special system users and application users"
description: "Learn about the special system and application users created when the system is provisioned, including assigned security role, user name, and purpose." 
ms.service: power-platform
ms.component: pa-admin
ms.topic: quickstart
ms.date: 08/16/2021
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: jimholtz
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# System and application users 

There is a list of special system and application users that is created when the system is provisioned.  Special system users are created for integration and support scenarios. Application users are created during system provisioning for setup and configuration management.  [Application users](create-users.md#create-an-application-user) can also be used for performing back-end services and their data access is managed by the special security role that is assigned. These security roles are managed by the system and cannot be modified. See other system [predefined security roles](database-security.md#predefined-security-roles).  

Most of these users are hidden from user views but they can be found by using the Advanced Find on the Users table.  Do not delete or modify these users including changing or reassigning security role. 

|User type  |Full name  |User name  |Purpose  | Security role assigned |
|-----------|-----------|-----------|---------|------------------------|
|System | SYSTEM | N/A | See below. | N/A |
| | Support user |crmoln@microsoft.com |To allow Microsoft support staff to have restricted/limited access to any customer environment for customer support. |Support user (does not have privilege to customer data) |
| | Delegated admin |crmoln2@microsoft.com |See [For partners: the Delegated admin](for-partners-delegated-administrator.md). |System admin |
|Application | Business Application Platform Service account |bap_sa@microsoft.com |To setup Power Apps system and configurations. |System admin |
| | Dataverse relevance search | RelevanceSearch@onmicrosoft.com | To fetch table data and metadata for Dataverse search feature | System admin |
| | Dynamics 365 Office Data Service | diofficedata@microsoft.com |Service Application to perform data integration between Microsoft Dataverse and Microsoft 365. | DataLakeWorkspaceAppAccess |
| | Dynamics 365 Athena-CDStoAzuredatalake | Dynamics365Athena-CDStoAzuredatalake@onmicrosoft.com |Service application to perform data integration between Microsoft Dataverse to Azure Data Lake. |DataLakeWorkspaceAppAccess |
| | Dynamics 365 Athena2-CDStoAzuredatalake | Dynamics365Athena2-CDStoAzuredatalake@onmicrosoft.com |Service application to perform data integration between Dataverse to Azure Data Lake. |DataLakeWorkspaceAppAccess |
| | EnterpriseSales | EnterpriseSales@onmicrosoft.com |Service application to perform data integration between Dataverse (Sales) to Azure Data Lake. |N/A |
| | # SIAutoCapture | SIAutoCapture@onmicrosoft.com | To be used for Auto Capture solution business requirements to perform data query and execute plugins from backend services. | SalesInsights AutoCapture Admin |
| | # Dynamics 365 Sales | Dynamics365Sales@onmicrosoft.com | To allow Dynamics 365 Sales to communicate with Dataverse and Azure Data Lake for analysis and data updates. | Sales system data sync and EAC App Access |
| | Microsoft Project | Project@microsoft.com |Allow Project for the Web and Roadmap Service to communicate with Dataverse. |Project System and Portfolio User |
| | Power Apps Checker Application | Pacheckerapp@microsoft.com |To perform static analysis of Power Apps solutions to assist in identifying performance and stability risks. |Export customizations and Solution checker |
| | Powerqueryonline-CDStoAzuredatalake | Powerqueryonline-CDStoAzuredatalake@onmicrosoft.com |Service application to perform data query between Dataverse and Azure Data Lake. |N/A |
| | Provision User | provisionapp@fabrikam.com |To perform Application installation from AppSource or System updates from Microsoft. |System admin |
| | DataLakeStorage | DataLakeStorage@onmicrosoft.com | To allow solutions to manage workspaces, workspace permissions and the discovery of workspaces. | DataLakeWorkspaceAppAccess |
| | JobServicePreProd| JobServicePreProd@onmicrosoft.com| Enable satellite services to schedule and dispatch messages to independently built workloads with guaranteed delivery of messages based on service-defined policies. | System admin |
| | JobServiceProd| JobServiceProd@onmicrosoft.com| Enable satellite services to schedule and dispatch messages to independently built workloads with guaranteed delivery of messages based on service-defined policies. | System admin |
| | # CCADataAnalyticsML | CCADAAdmins@onmicrosoft.com | To allow AI insights in customer care apps like Customer Service, Field Service, etc. | System Customizer and System admin |
| | # CDSReportService | CDSReportService@onmicrosoft.com | To allow user to run reports. |N/A |
| | Power Platform Dataflows | ppdfcdsclient@onmicrosoft.com | Power Platform Dataflows service application to perform data preparation and loading into Dataverse and Azure Data Lake. | System Administrator
| | AIBuilderProd | aibuilderfpapp@onmicrosoft.com | To perform authentication for AI Builder. | System admin |
| | PowerAutomate-ProcessMining | PowerAutomate-ProcessMining@onmicrosoft.com | To allow Process Advisor service to interact with Dataverse. | Environment Maker, Process Advisor Application |
| | AriaMdlExporter | AriaMdlExporter@onmicrosoft.com | To export data from Engagement Insights to Managed Data Lake. | DataLakeWorkspaceAppAccess |
| | CDSFileStorage | CDSFileStorage@onmicrosoft.com | To perform background operations like Organization Lifecycle (OLC) operations, file reconciliation and migration. | FileStoreService App Access |
| | CDSUserManagement | CDSUserManagement@onmicrosoft.com | To provision and synchronize users into Dataverse from Active Directory. | System Administrator |
| |GDSGlobalDiscovery | GDSGlobalDiscovery@onmicrosoft.com | To validate which environments that users can access. | Global Discovery Service Role |
| | BAP | BAP@onmicrosoft.com | To perform administrative operations on Dataverse linked environments: fetch user roles, provision users, assign roles in Power Platform portals.| N/A |
| | Microsoft Forms Pro | enterprisesurveyappuser@contoso.com | To perform data integration between Dynamics 365 Customer Voice and Dataverse | System Administrator  |
| | PowerVIrtualAgents  | PowerVirtualAgents@onmicrosoft.com | To manage the PVA capabilities within Dataverse environments | CCI Admin, System Customizer, and Environment Maker    |
| | BizQA | BizQA@onmicrosoft.com | To access search telemetry to improve search experience | BizQAApp   |
| | ProductInsights | ProductInsights@onmicrosoft.com | To export data from Customer Insights to Engagement Insights | DataLakeWorkspaceAppAccess    |
| | Dynamics365 SalesForecasting | Dynamics365SalesForecasting@onmicrosoft.com | To fetch table data and metadata for forecasting feature | ForecastAppUser    |
| | # Omnichannel | Ominichannel@onmicrosoft.com | To perform data integration between Omnichannel for Customer Service and Dataverse | System admin    |
| | # Flow-RP | Flow-RP@onmicrosoft.com | To allow Power Automate to integrate with Dataverse | Flow-RP Role, Service Reader |


**The purpose of the system account?** 
- The System user is a built-in user account that is used to allow customers to perform system updates via plug-ins. 
- The primary usage of this user account is to meet special business requirements that require elevation of privileges; for example, running background processes to integrate with other applications. 
- It can also be used to handle rollup scenarios where individual users do not have the required privilege. For example, the priority of a Case is automatically set to the highest priority of an individual user’s tasks and individual users can only update their own task priority but not the Case priority. 

**Technical details on permissions?**
- This user account can perform any actions and has all system privileges. 
- Records created/updated by this user account are audited. 

**Technical details on the security?**
- This user account cannot sign in to Dynamics 365 apps.  
- Administrators have the option to use this user account when registering their plug-ins. 
- This user account does not have a mailbox, so they cannot be used to send or receive emails. 
- The details of this user account cannot be modified from the User Form interface. 
- This user account does not show up in any views.

**The purpose of the application users?** 
- The application user is a built-in user account that is used to perform integration and system back-end service to support a particular feature.  
- Since these are built-in user accounts, they cannot be updated. The security role that is assigned to these accounts cannot be updated either.  This is to prevent any service outages.  
- These users do not consume any service licenses.



[!INCLUDE[footer-include](../includes/footer-banner.md)]
