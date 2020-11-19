---
title: System and application users | Microsoft Docs
description: About system and application users 
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: quickstart
ms.date: 11/11/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# System and application users

There is a list of special system and application users that is created when the system is provisioned.  Special system users are created for integration and support scenarios. Application users are created during system provisioning for setup and configuration management.  [Application users](create-users-assign-online-security-roles.md#create-an-application-user) can also be used for performing back-end services.  

Most of these users are hidden from user views but they can be found by using the Advanced Find on the Users entity.  Do not delete or modify these users including changing or reassigning security role. 

|User type  |Full name  |User name  |Purpose  | Security role assigned |
|-----------|-----------|-----------|---------|------------------------|
|System | SYSTEM | n/a | See below | n/a |
| | Support user |crmoln@microsoft.com |To allow Microsoft support staff to have restricted/limited access to any customer environment for customer support |Support user (does not have privilege to customer data) |
| | Delegated admin |crmoln2@microsoft.com |See [For partners: the Delegated admin](for-partners-delegated-administrator.md) |System admin |
|Application | Business Application Platform Service account |bap_sa@microsoft.com |To setup Power Apps system and configurations |System admin |
| | Dynamics 365 Athena-CDStoAzuredatalake | Dynamics365Athena-CDStoAzuredatalake@onmicrosoft.com |Service application to perform data integration between Microsoft Dataverse to Azure Data Lake |DataLakeWorkspaceAppAccess |
| | Dynamics 365 Athena2-CDStoAzuredatalake | Dynamics365Athena2-CDStoAzuredatalake@onmicrosoft.com |Service application to perform data integration between Dataverse to Azure Data Lake |DataLakeWorkspaceAppAccess |
| | Dynamics 365 EnterpriseSales-CDStoAzuredatalake | Dynamics365EnterpriseSales-CDStoAzuredatalake@onmicrosoft.com |Service application to perform data integration between Dataverse (Sales) to Azure Data Lake |N/A |
| | # SIAutoCapture | SIAutoCapture@onmicrosoft.com | To be used for Auto Capture solution business requirements to perform data query and execute plugins from backend services. | SalesInsights AutoCapture Admin |
| | # Dynamics 365 Sales | Dynamics365Sales@onmicrosoft.com | To allow Dynamics 365 Sales to communicate with Dataverse and Azure Data Lake for analysis and data updates. | Sales system data sync and EAC App Access |
| | Microsoft Project | Project@microsoft.com |Allow Project for the Web and Roadmap Service to communicate with Dataverse |Project System and Portfolio User |
| | Power Apps Checker Application | Pacheckerapp@microsoft.com |To perform static analysis of Power Apps solutions to assist in identifying performance and stability risks |Export customizations and Solution checker |
| | Powerqueryonline-CDStoAzuredatalake | Powerqueryonline-CDStoAzuredatalake@onmicrosoft.com |Service application to perform data query between Dataverse and Azure Data Lake |N/A |
| | Provision User | provisionapp@fabrikam.com |To perform Application installation from AppSource or System updates from Microsoft |System admin |
| | DataLakeStorage | DataLakeStorage@onmicrosoft.com | To allow solutions to manage workspaces, workspace permissions and the discovery of workspaces. | DataLakeWorkspaceAppAccess |
| | JobServicePreProd| JobServicePreProd@onmicrosoft.com| Enable satellite services to schedule and dispatch messages to independently built workloads with guaranteed delivery of messages based on service-defined policies. | System admin |
| | JobServiceProd| JobServiceProd@onmicrosoft.com| Enable satellite services to schedule and dispatch messages to independently built workloads with guaranteed delivery of messages based on service-defined policies. | System admin |
| | # CCADataAnalyticsML | CCADAAdmins@onmicrosoft.com | To allow AI insights in customer care apps like Customer Service, Field Service, etc. | System Customizer and System admin |
| | # CDSReportService | CDSReportService@onmicrosoft.com | To allow user to run reports. |N/A |
| | Power Platform Dataflows | ppdfcdsclient@microsoft.com | Power Platform Dataflows service application to perform data preparation and loading into Dataverse and Azure Data Lake | System Customizer and Delegate

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

