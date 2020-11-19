---
title: Governance considerations | Microsoft Docs
description: Explains how Power Apps and Power Automate be made widely available to their business and be supported by IT.
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/12/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Governance considerations 

Many customers wonder: How can Power Apps and Power Automate be made available to their broader business and supported by IT? Governance is the answer. It aims to enable business groups to focus on solving business problems efficiently while complying with IT and business compliance standards. The following content is intended to structure themes often associated with governing software and bring awareness to capabilities available for each theme as it relates to governing Power Apps and Power Automate. 

|Theme  |Common questions related to each theme for which this content answers  |
|---------|---------|
|Architecture     | <ul><li>What are the basic constructs and concepts of Power Apps, Power Automate, and Microsoft Dataverse?</li> <br /><li>How do these constructs fit together at design time and runtime?</li></ul> |
|Security     | <ul><li>What are the best practices for security design considerations?</li> <br /><li>How do I leverage our existing user and group management solutions to manage access and security roles in Power Apps?</li></ul>     |
|Alert and Action     | <ul><li>How do I define the governance model between citizen developers and managed IT services?</li> <br /><li>How do I define the governance model between central IT and the business unit admins?</li> <br /><li>How should I approach support for non-default environments in my organization? </li></ul>        |
|Monitor     | <ul><li>How are we capturing compliance / auditing data?</li> <br /><li>How can I measure adoption and usage within my organization?</li></ul> |

## Architecture
It's best to familiarize oneself with Environments as the first step to building the right governance story for your company. Environments are the containers for all resources utilized by a Power Apps, Power Automate and Dataverse. [Environments Overview](environments-overview.md) is a good primer which should be followed by [What is Dataverse?](https://docs.microsoft.com/powerapps/maker/common-data-service/data-platform-intro), [Types of Power Apps](https://docs.microsoft.com/powerapps/maker/), [Microsoft Power Automate](https://docs.microsoft.com/power-automate/getting-started), [Connectors](https://docs.microsoft.com/powerapps/maker/canvas-apps/connections-list),  and [On-premises Gateways](wp-onpremises-gateway.md). 

## Security 
This section outlines mechanisms that exist to control who can access Power Apps in an environment and access data: licenses, environments, environment roles, Azure Active Directory, Data Loss Prevention policies and admin connectors that can be used with Power Automate. 

### Licensing 
Access to Power Apps and Power Automate starts with having a license, the type of license a user has determines the assets and data a user can access. The following table outlines differences in resources available to a user based on their plan type, from a high-level. Granular licensing details can be found in the [Licensing overview](pricing-billing-skus.md).


|Plan  |Description  |
|---------|---------|
|Microsoft 365 Included     | This allows users to extend SharePoint and other Office assets they already have. |
|Dynamics 365 Included     | This allows users to customize and extend customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), they already have.  |
|Power Apps plan  | This allows: <ul><li>making enterprise connectors and Dataverse accessible for use.</li><li>users to use robust business logic across application types and administration capabilities.</li></ul>  |
|Power Apps Community | This allows a user to use Power Apps, Power Automate, Dataverse and customer connectors in a single for individual use. There is no ability to share apps. |
|Power Automate Free | This allows users to create unlimited flows and perform 750 runs. |
|Power Automate plan| See [Microsoft Power Apps and Microsoft Power Automate Licensing Guide](https://go.microsoft.com/fwlink/p/?linkid=2085130).|


### Environments
After users have licenses, environments exist as containers for all resources utilized by Power Apps, Power Automate and Dataverse. Environments can be used to target different audiences and/or for different purposes such as developing, testing and production. More information can be found in the [Environments Overview](environments-overview.md).

### Secure your data and network
- Power Apps and Power Automate *do not* provide users with access to any data assets that they don't already have access to. Users should only have access to data that they really require access to.
- Network Access control policies can also apply to Power Apps and Power Automate. For environment, one can block access to a site from within a network by blocking the sign-on page to prevent connections to that site from being created in Power Apps and Power Automate. 
- In an environment, access is controlled at three levels: [Environment roles](database-security.md), Resource permissions for Power Apps, Power Automate, etc… and [Dataverse security roles](wp-security-cds.md) (if a Dataverse data base is provisioned). 
- When Dataverse is created in an environment the Dataverse roles will take over for controlling security in the environment (and all environment admins and makers are migrated).

The following principals are supported for each role type.

|Environment type  |Role  |Principal Type (Azure AD)  |
|---------|---------|---------|
|Environment without Dataverse     | Environment role        | User, group, tenant         |
|     | Resource permission: Canvas app        | User, group, tenant        |
|     | Resource permission: Power Automate, Custom Connector, Gateways, Connections<sup>1</sup>        | User, group        |
|Environment with Dataverse      | Environment role        | User        |
|     |Resource permission: Canvas app         |User, group, tenant         |
|     | Resource permission: Power Automate, Custom Connector, Gateways, Connections<sup>1</sup>          |User, group         |
|     |Dataverse role (applies to all model-driven apps and components)         |User         |

<sup>1</sup>Only certain connections (like SQL) can be shared.

> [!NOTE]
> - In the Default environment, all users in a tenant are granted access to the Environment Maker role. 
> - Azure AD tenant Global Administrators have admin access to all environments.

#### FAQ - What permissions exist at an Azure AD tenant level? 

Today, Power Platform admins can perform the following: 

1. Download the Power Apps & Power Automate license report
1. Create DLP policy scoped only to 'All Environments' or scoped to include/exclude specific environments
1. Manage and assign licenses via Office admin center
1. Access all environment, app, and flow management capabilities for all environments in the tenant available through:
    - Power Apps Admin PowerShell cmdlets
    - Power Apps management connectors
1. Access the Power Apps and Power Automate admin analytics for all environments in the tenant:
    - <https://aka.ms/paadminanalytics>  
    - <https://aka.ms/flowadminanalytics> 

### Consider Microsoft Intune

Customers with Microsoft Intune can set mobile application protection policies for both Power Apps and Power Automate apps on Android and iOS. This walkthrough highlights setting a policy via Intune for Power Automate. 

### Consider location-based conditional access

For customers with Azure AD Premium, conditional access policies can be defined in Azure for Power Apps and Power Automate. This allows granting or blocking access based upon: user/group, device, location. 

#### Creating a Conditional Access Policy

1. Sign-in to [https://portal.azure.com](https://portal.azure.com) 
2. Select Azure Active Directory
3. Select Conditional Access.
4. Select + New Policy
5. Select user and groups
6. Select the cloud apps - select **Common Data Service** to control access to customer engagement apps
7. Apply conditions (user/group, device, location) 

### Prevent data leakage with data loss prevent policies

[Data loss prevention policies (DLP)](wp-data-loss-prevention.md) enforce rules for which connectors can be used together by classifying connectors as either Business Data only or No Business Data allowed. Simply, if you put a connector in the business data only group, it can only be used with other connectors from that group in the same application. Power Platform admins can define policies that apply to all environments.

#### FAQ

Q: Can I control, on the tenant level, which connector is at all available, e.g. No to Dropbox or Twitter but Yes to SharePoint)?

A: This is not possible. Customers can subscribe to Audit events to perform corrective action if there are flows that have been built that create concerns for customers. In fact, a very large Power Apps customer has leveraged this approach to apply another level of governance.
 
Q: What about Sharing connectors between users? E.g. the connector for Teams is a general one that can be shared (?)

A: Connectors are available to all users. With the exception of premium or custom connectors which need either an additional license (premium connectors) or have to be explicitly shared (custom connectors)

## Alert and action

In addition to monitoring, many customers want to subscribe to software creation, usage or health events so they know when to perform an action. This section outlines a few means to observe events (manually and programmatically) and perform actions triggered by an event occurrence. 

### Build Power Automate flows to alert on key audit events

1.    An example of alerting that can be implemented is subscribing to Microsoft 365 Security and Compliance Audit Logs. 
2.    This can be achieved through either a [webhook](https://preview.flow.microsoft.com/blog/automate-flow-governance/) subscription or [polling](https://preview.flow.microsoft.com/blog/accessing-office-365-security-compliance-center-logs-from-microsoft-flow/) approach. However, by attaching Power Automate to these alerts, we can provide administrators with more than just email alerts.

### Build the policies you need with Power Apps, Power Automate, and PowerShell

1. These [PowerShell cmdlets](powerapps-powershell.md) place full control in the hands of admins to automate the governance policies necessary. 
1. The [Management connectors](https://powerapps.microsoft.com/blog/new-connectors-for-powerapps-and-flow-resources/) provide the same level of control but with added extensibility and ease-of-uses by leveraging Power Apps and Power Automate. 
1. The following Power Automate templates for administration connectors exist for ramping up quickly:
    1. [List new Power Automate Connectors](https://preview.flow.microsoft.com/galleries/public/templates/5a6ef26db3b749ed88b7afb377d11ecf/list-new-microsoft-flow-connectors/)
    1. [Get List of new Power Apps, Power Automate flows and Connectors](https://preview.flow.microsoft.com/galleries/public/templates/0b2ffb0174724ad6b4681728c0f53062/get-list-of-new-powerapps-flows-and-connectors/)
    1. [Email me a weekly summary of Office 365 Message Center notices](https://preview.flow.microsoft.com/galleries/public/templates/c2537df7b47340e6bcf1ba931a459355/email-me-a-weekly-summary-of-office-365-message-center-notices/)
    1. [Access Office 365 Security and Compliance Logs from Power Automate](https://preview.flow.microsoft.com/blog/accessing-office-365-security-compliance-center-logs-from-microsoft-flow/)
1. Use this [blog and app template](https://powerapps.microsoft.com/blog/custom-admin-dashboard-with-the-powerapps-admin-connectors/) ramp up quickly on the administration connectors. 
1. Additionally, it's worth checking out content shared in the [Community Apps Gallery](https://powerusers.microsoft.com/t5/Community-Apps-Gallery/PowerApps-admin-app-version-2/m-p/247560), here's another example of an administrative experience built using Power Apps and admin connectors.

### FAQ

**Problem**
Currently, all users with Microsoft E3 licenses can create apps in the Default environment. How can we enable Environment Maker rights to a select group, for example. 10 persons to create apps? 

**Recommendation**
The [PowerShell cmdlets](https://powerapps.microsoft.com/blog/gdpr-admin-powershell-cmdlets/) and [Management connectors](https://powerapps.microsoft.com/blog/new-connectors-for-powerapps-and-flow-resources/) provide full flexibility and control to administrators to build the policies they want for their organization.

## Monitor

It's well understood that monitoring as a critical aspect of managing software at scale, this section highlights a couple of means to get insight in Power Apps and Power Automate development and usage.  

### Review the audit trail

[Activity logging for Power Apps](logging-powerapps.md) is integrated with Office Security and Compliance center for comprehensive logging across Microsoft services like Dataverse and Microsoft 365. Office provides an API to query this data, which is currently used by many SIEM vendors to use the Activity Logging data for reporting.

### View the Power Apps and Power Automate license report

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

2. Select **Analytics** > **Power Automate** or **Power Apps**.

3. View Power Apps and Power Automate admin analytics

   You can get information about the following:
   - Active User and App usage  - how many users are using an app and how often? 
   - Location – where is the usage? 
   - Service Performance of connectors
   - Error reporting – which are the most error prone apps
   - Flows in use by type and date
   - Flows created by type and date
   - Application-level auditing 
   - Service Health
   - Connectors used

### View what users are licensed

You can always look at individual user licensing in the Microsoft 365 admin center by drilling into specific users. 

You can also use the following PowerShell command to export assigned user licenses.

```powershell
Get-AdminPowerAppLicenses -OutputFilePath '<licenses.csv>'
```

Exports all the assigned user licenses (Power Apps and Power Automate) in your tenant into a tabular view .csv file. The exported file contains both self-service sign up internal trial plans as well as plans that are sourced from Azure Active Directory. The internal trial plans are not visible to admins in the Microsoft 365 admin center.

The export can take a while for tenants with a large number of Power Platform users.

### View app resources used in an Environment

1. In the Power Platform admin center, select Environments in the navigation menu. 
2. Select an Environment.
3. Optionally, the list of resources used in an Environment may be downloaded as a .csv.

