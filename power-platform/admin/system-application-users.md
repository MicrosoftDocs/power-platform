---
title: Special system users and application users
description: Learn about the special system and application users created when the system is provisioned, including assigned security role, user name, and purpose.
ms.component: pa-admin
ms.topic: concept-article
ms.date: 07/24/2025
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: sericks
ms.custom: admin-security
search.audienceType: 
  - admin
ms.contributors:
- sanjeevgoyalmsft 
- gattimassimo
- saponcer
- cdgolmar
---

# System and application users

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

There's a list of special system and application users that is created when the system is provisioned.  Special system users are created for integration and support scenarios. Application users are created during system provisioning for setup and configuration management.  [Application users](create-users.md#create-an-application-user) can also be used for performing back-end services and their data access is managed by the special security role that is assigned. These security roles are managed by the system and might not be modifiable. See other system [predefined security roles](database-security.md#predefined-security-roles).  

Most of these users are hidden from user views but they can be found by using the Advanced Find on the Users table.  Don't delete or modify these users including changing or reassigning security role.

## System users

|Full name  |User name  |Purpose  | Security role assigned |
|-----------|-----------|---------|------------------------|
| Support user |crmoln@microsoft.com |To allow Microsoft support staff to have restricted/limited access to any customer environment for customer support. |Support user (doesn't have privilege to customer data) |
| Delegated admin |crmoln2@microsoft.com |See [For partners: the Delegated admin](for-partners-delegated-administrator.md). |System admin |

## Application users

|Full name  |User name  |Purpose  | Security role assigned |
|-----------|-----------|---------|------------------------|
| Business Application Platform Service account |bap_sa@microsoft.com |To set up Power Apps system and configurations. |System admin |
| App Management User | capam@microsoft.com | To allow App Management Services to query tenant details such as Tenant country | System admin |
| CAP Package Deployer Service DVClient | CAPPackageDeployerServiceDVClient@onmicrosoft.com | To import solutions into customer environments for customer-driven installations from Power Platform admin center. | System admin |
| Dataverse Dataverse search | RelevanceSearch@onmicrosoft.com | To fetch table data and metadata for Dataverse search feature | System admin |
| # D365WorkAssignment<br> # D365WorkAssignment2<br> # D365WorkAssignment3 | D365WorkAssignment@onmicrosoft.com<br> D365WorkAssignment2@onmicrosoft.com<br> D365WorkAssignment3@onmicrosoft.com | Service application to perform data integration between Dataverse and the Work assignment feature in Dynamics 365 Sales. | Sales Work Assignment API Access and Sales Work Assignment API Extended Access |
| Dynamics 365 Office Data Service | diofficedata@microsoft.com |Service Application to perform data integration between Microsoft Dataverse and Microsoft 365. | DataLakeWorkspaceAppAccess |
| Dynamics 365 Athena-CDStoAzuredatalake | Dynamics365Athena-<br />CDStoAzuredatalake<br />@onmicrosoft.com |Service application to perform data integration between Microsoft Dataverse to Azure Data Lake. |DataLakeWorkspaceAppAccess |
| Dynamics 365 Athena2-CDStoAzuredatalake | Dynamics365Athena2-<br />CDStoAzuredatalake<br />@onmicrosoft.com |Service application to perform data integration between Dataverse to Azure Data Lake. |DataLakeWorkspaceAppAccess |
| EnterpriseSales | EnterpriseSales@onmicrosoft.com |Service application to perform data integration between Dataverse (Sales) to Azure Data Lake. |N/A |
| Finance and Operations Runtime Integration User | FinanceandOperations<br />RuntimeIntegrationUser<br />@onmicrosoft.com |Service application to perform dual-write data integration between Dataverse and finance and operations apps. |Finance and Operations Integration User |
| # SIAutoCapture | SIAutoCapture@onmicrosoft.com | To be used for Auto Capture solution business requirements to perform data query and execute plugins from backend services. | SalesInsights AutoCapture Admin |
| # Dynamics 365 Sales | Dynamics365Sales@onmicrosoft.com | To allow Dynamics 365 Sales to communicate with Dataverse and Azure Data Lake for analysis and data updates. | Sales system data sync and EAC App Access |
| Microsoft Project | Project@microsoft.com |Allow Project for the Web and Roadmap Service to communicate with Dataverse. |Project System and Portfolio User |
| Power Apps Checker Application | Pacheckerapp@microsoft.com |To perform static analysis of Power Apps solutions to assist in identifying performance and stability risks. |Export customizations and Solution checker |
| Powerqueryonline-CDStoAzuredatalake | Powerqueryonline-<br />CDStoAzuredatalake<br />@onmicrosoft.com |Service application to perform data query between Dataverse and Azure Data Lake. |N/A |
| Provision User | provisionapp@fabrikam.com |To perform Application installation from AppSource or System updates from Microsoft. |System admin |
| DataLakeStorage | DataLakeStorage@onmicrosoft.com | To allow solutions to manage workspaces, workspace permissions and the discovery of workspaces. | DataLakeWorkspaceAppAccess |
| JobServicePreProd| JobServicePreProd<br />@onmicrosoft.com| Enable satellite services to schedule and dispatch messages to independently built workloads with guaranteed delivery of messages based on service-defined policies. | System admin |
| JobServiceProd| JobServiceProd@onmicrosoft.com| Enable satellite services to schedule and dispatch messages to independently built workloads with guaranteed delivery of messages based on service-defined policies. | System admin |
| # CCADataAnalyticsML | CCADAAdmins@onmicrosoft.com | To allow AI insights in customer care apps like Customer Service, Field Service, etc. | System Customizer and System admin |
| # CDSReportService | CDSReportService@onmicrosoft.com | To allow user to run reports. |N/A |
| # CTQHotPath  | CTQHotpath@onmicrosoft.com         | To perform data integration between Omnichannel for Customer Service and Dataverse. | ServiceReader, ServiceWriter                                                           |
| # CTQWarmPath  | CTQWarmpath@onmicrosoft.com        | To perform data integration between Omnichannel for Customer Service and Dataverse. | Omnichannel supervisor, Omnichannel agent, Omnichannel administrator, ServiceReader, ServiceWriter, ServiceDelete |
| # CTQDiagnostics | CTQDiagnostics@onmicrosoft.com     | To generate insights for Unified Routing.                                   | ServiceReader, ServiceWriter  |                                                  
| Power Platform Dataflows | ppdfcdsclient@onmicrosoft.com | Power Platform Dataflows service application to perform data preparation and loading into Dataverse and Azure Data Lake. | System Administrator
| AIBuilderProd | aibuilderfpapp@onmicrosoft.com | To perform authentication for AI Builder. | System admin |
| PowerAutomate-ProcessMining | PowerAutomate-ProcessMining<br />@onmicrosoft.com | To allow Process Advisor service to interact with Dataverse. | Environment Maker, Process Advisor Application |
| AriaMdlExporter | AriaMdlExporter@onmicrosoft.com | To export data from Engagement Insights to Managed Data Lake. | DataLakeWorkspaceAppAccess |
| CDSFileStorage | CDSFileStorage@onmicrosoft.com | To perform background operations like Organization Lifecycle (OLC) operations, file reconciliation and migration. | FileStoreService App Access |
| CDSUserManagement | CDSUserManagement<br />@onmicrosoft.com | To provision and synchronize users into Dataverse from Active Directory. | System Administrator |
|GDSGlobalDiscovery | GDSGlobalDiscovery<br />@onmicrosoft.com | To validate which environments that users can access. | Global Discovery Service  |
| PowerPlatformAuthorization | PowerPlatformAuthorization<br />@onmicrosoft.com | To aggregate environment role assignments for tenant-wide discovery. | Global Discovery Service  |
| BAP | BAP@onmicrosoft.com | To perform administrative operations on Dataverse linked environments: fetch user roles, provision users, assign roles in Power Platform portals.| N/A |
| Microsoft Forms Pro | enterprisesurveyappuser<br />@contoso.com | To perform data integration between Dynamics 365 Customer Voice and Dataverse | System Administrator  |
| PowerVIrtualAgents  | PowerVirtualAgents<br />@onmicrosoft.com | To manage the PVA capabilities within environments | CCI Admin, System Customizer, and Environment Maker    |
| BizQA | BizQA@onmicrosoft.com | To access search telemetry to improve search experience | BizQAApp   |
| ProductInsights | ProductInsights@onmicrosoft.com | To export data from Customer Insights to Engagement Insights | DataLakeWorkspaceAppAccess    |
| Dynamics365 SalesForecasting | Dynamics365SalesForecasting<br />@onmicrosoft.com | To fetch table data and metadata for forecasting feature | ForecastAppUser    |
| # Omnichannel | Ominichannel@onmicrosoft.com | To perform data integration between Omnichannel for Customer Service and Dataverse | System admin    |
| # PowerAppsDataPlaneBackend | PowerAppsDataPlaneBackend@onmicrosoft.com | To allow Power Apps to integrate with Dataverse | PowerAppsRPRole |
| # PowerAppsCustomerManagementPlaneBackend | PowerAppsCustomerManagementPlaneBackend@onmicrosoft.com | To allow Power Apps to integrate with Dataverse | PowerAppsRPRole |
| # Flow-RP | Flow-RP@onmicrosoft.com | To allow Power Automate to integrate with Dataverse | Flow-RP Role |
| # DataSyncService-\<REGION\> | DataSyncService-\<REGION\><br />@onmicrosoft.com | To read data for Azure Data Lake sync | Data Sync Service  |
| # DataSyncFramework-\<REGION\> | DataSyncFramework-\<REGION\>@onmicrosoft.com | To read data for Azure Data Lake sync | Data Sync Framework  |
| # Sharepoint Syntex | SharepointSyntex@onmicrosoft.com | To allow Sharepoint to use AI Builder document processing models | Basic User  |
| # InsightsAppsPlatform | InsightsAppsPlatform@onmicrosoft.com | For insights generation and ingestion of data into Dataverse | Insights Apps Platform Role  |
| # SSSAdminProd | SSSAdminProd@onmicrosoft.com | To allow Server Side Sync to integrate with Dataverse | System admin    |
| Apollo | capaeinfra@microsoft.com | For performing organization lifecycle operations for Dataverse | Service Writer Role |
| Dataverse Information Protection | dvinfoprotection@microsoft.com | Allows Microsoft Purview to integrate with Dataverse. | Service Reader Role, PurviewLabelRole |
| PowerAutomate-DesktopFlowAI | PowerAutomate-DesktopFlowAI@onmicrosoft.com | Service application to perform data integration between Dataverse and the Power Automate AI features | Desktop Flows AI Application User |
| PowerAutomate-MachineProvisioning | PowerAutomate-MachineProvisioning@onmicrosoft.com | This application user performs database operations in the course of Hosted Machine and Hosted Machine Groups provisioning | System Administrator |

## The purpose of the system account?

- The System user is a built-in user account that is used to allow customers to perform system updates via plug-ins.
- The primary usage of this user account is to meet special business requirements that require elevation of privileges; for example, running background processes to integrate with other applications.
- It can also be used to handle rollup scenarios where individual users don't have the required privilege. For example, the priority of a Case is automatically set to the highest priority of an individual user’s tasks and individual users can only update their own task priority but not the Case priority.

## Technical details on permissions?

- This user account can perform any actions and has all system privileges.
- Records created/updated by this user account are audited.

## Technical details on the security?

- This user account can't sign in to Dynamics 365 apps.  
- Administrators have the option to use this user account when registering their plug-ins.
- This user account doesn't have a mailbox, so they can't be used to send or receive emails.
- Since you can't log into the apps using this user account, it doesn't have any related entities (user settings, queues, calendar, team membership, internal address, etc.).
- The details of this user account can't be modified from the User Form interface.
- This user account doesn't show up in any views.

## The purpose of the application users?

- The application user is a built-in user account that is used to perform integration and system back-end service to support a particular feature.  
- Since these are built-in user accounts, they shouldn't be updated. The security roles that are assigned to these accounts shouldn't be updated either. This is to prevent any service outages.  
- These users don't consume any service licenses.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
