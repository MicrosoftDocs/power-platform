---
title: Governance consideration | Microsoft Docs
description: Explains how PowerApps and Microsoft Flow be made widely available to their business and be supported by IT.
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/21/2018
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Governance consideration

Many customers wonder: How can PowerApps and Microsoft Flow be made available to their broader business and supported by IT? Governance is the answer. It aims to enable business groups to focus on solving business problems efficiently while complying with IT and business compliance standards. The following content is intended to structure themes often associated with governing software and bring awareness to capabilities available for each theme as it relates to governing PowerApps and Microsoft Flow. 

|Theme  |Common questions related to each theme for which this content answers  |
|---------|---------|
|Architecture     | <ul><li>What are the basic constructs and concepts of PowerApps, Microsoft Flow, and Common Data Service for Apps?</li> <br /><li>How do these constructs fit together at design time and runtime?</li></ul> |
|Security     | <ul><li>What are the best practices for security design considerations?</li> <br /><li>How do I leverage our existing user and group management solutions to manage access and security roles in PowerApps?</li></ul>     |
|Alert and Action     | <ul><li>How do I define the governance model between citizen developers and managed IT services?</li> <br /><li>How do I define the governance model between central IT and the business unit admins?</li> <br /><li>How should I approach support for non-default instances in my organization? </li></ul>        |
|Monitor     | <ul><li>How are we capturing compliance / auditing data?</li> <br /><li>How can I measure adoption and usage within my organization?</li></ul> |

## Architecture
It’s best to familiarize oneself with Environments as the first step to building the right governance story for your company. Environments are the containers for all resources utilized by a PowerApps, Microsoft Flow and Common Data Service for Apps. [Environments Overview](environments-overview.md) is a good primer which should be followed by [Common Data Service for Apps](wp-cds-for-apps.md), [Types of PowerApps](wp-types-powerapps.md), [Microsoft Flow](wp-about-flows.md), [Connectors](wp-connectors.md),  and [On-premises Gateways](wp-onpremises-gateway.md). 

## Security 
This section outlines mechanisms that exist to control who can access PowerApps in an environment and access data: licenses, environments, environment roles, Azure Active Directory, Data Loss Prevention policies and admin connectors that can be used with Flow. 

### Licensing 
Access to PowerApps and Flow starts with having a license, the type of license a user has determines the assets and data a user can access. The following table outlines differences in resources available to a user based on their plan type, from a high-level. Granular licensing details can be found in the [Licensing overview](pricing-billing-skus.md).


|Plan  |Description  |
|---------|---------|
|Office 365 Included     | This allows users to extend SharePoint and other Office assets they already have. |
|Dynamics 365 Included     | This allows users to customize and extend Dynamics 365 apps they already have.  |
|PowerApps P1     | This allows makes enterprise connectors and Common Data Service for Apps accessible for use. |
|PowerApps P2     | This allows users to use robust business logic across application types and administration capabilities.  |
|PowerApps Community | This allows a user to use PowerApps, Flow, Common Data Service and customer connectors in a single for individual use. There is no ability to share apps. |
|Flow Free | This allows users to create unlimited flows and perform 750 runs. |
|Flow P1 | This allows users to create unlimited flows, use premium connectors and perform 4,500 runs.|
|Flow P2 | This allows users to create unlimited flows, use premium connectors and perform 15,000 runs. |

### Environments
After users have licenses, environments exist as containers for all resources utilized by PowerApps, Microsoft Flow and Common Data Service for Apps. Environments can be used to target different audiences and/or for different purposes such as developing, testing and production. More information can be found in the [Environments Overview](environments-overview.md).

<!-- 
#### FAQ –  Who can provision an environment?
- The default environment is created automatically when the first PowerApps or Microsoft Flow user signs-in. 
- Developer environment is created whenever a user signs-up for the PowerApps community plan – [http://aka.ms/powerappcommunityplan ](http://aka.ms/powerappcommunityplan )
- Up to 2 trial environments can be created by any user who signs-up for a PowerApps Plan 2 or Microsoft Flow Plan 2 30-day trial license.
- Production environments can be created by any user who has a PowerApps Plan 2 or Microsoft Plan 2 license.
- Production environments are pooled at the tenant level - every Plan 2 license grants an entitlement to provision 2 additional environments
-->

### Secure your data and network
- PowerApps and Flow *do not* provide users with access to any data assets that they don’t already have access to. Users should only have access to data that they really require access to.
- Network Access control policies can also apply to PowerApps and Flow. For instance, one can block access to a site from within a network by blocking the sign-on page to prevent connections to that site from being created in PowerApps and Flow. 
- In an environment, access is controlled at three levels: [Environment roles](database-security.md), [Resource permissions for PowerApps](wp-controlling-access.md), Microsoft Flows, etc… and [Common Data Service security roles](wp-security-cds.md) (if a CDS data base is provisioned). 
- When Common Data Service for Apps is created in an environment the Common Data Service for Apps roles will take over for controlling security in the environment (and all environment admins and makers are migrated).

The following principals are supported for each role type.

|Environment type  |Role  |Principal Type (AAD)  |
|---------|---------|---------|
|Environment without Common Data Service for Apps     | Environment role        | User, group, tenant         |
|     | Resource permission: Canvas app        | User, group, tenant        |
|     | Resource permission: Flow, Custom Connector, Gateways, Connections<sup>1</sup>        | User, group        |
|Environment with Common Data Service for Apps      | Environment role        | User        |
|     |Resource permission: Canvas app         |User, group, tenant         |
|     | Resource permission: Flow, Custom Connector, Gateways, Connections<sup>1</sup>          |User, group         |
|     |CDS role (applies to all model-driven apps and components)         |User         |

<sup>1</sup>Only certain connection (like SQL) can be shared.

> [!NOTE]
> - In the Default environment, all users in a tenant are granted access to the Environment Maker role. 
> - Azure AD tenant Global Administrators have admin access to all environments.

#### FAQ - What permissions exist at an Azure AD tenant level? 

Today, Azure AD global tenant admins can perform the following: 

1.	Download the PowerApps & Microsoft Flow license report
2.	Create DLP policy scoped only to ‘All Environments’ or scoped to include/exclude specific environments
3.	Manage and assign licenses via Office admin center
4.	Access all environment, app, and flow management capabilities for all environments in the tenant available via
   1. PowerApps Admin center
   2. PowerApps Admin PowerShell cmdlets
   3. PowerApps management connectors
5.	Access the PowerApps and Microsoft Flow admin analytics for all environments in the tenant:
   1.	aka.ms/paadminanalytics  
   2.	aka.ms/flowadminanalytics 

### Consider Microsoft Intune

Customers with Microsoft Intune can set mobile application protection policies for both PowerApps and Microsoft Flow apps on Android and iOS. This walkthrough highlights setting a policy via Intune for Microsoft Flow. 

<!-- 

**Without a PowerApps Plan 2 license** 

1. [Download the PowerApps and Microsoft Flow license report](admin-view-user-licenses.md).
2. [Create DLP policy scoped only to ‘All Environments’](create-dlp-policy.md).
3. [Manage and assign licenses via Office admin center](signup-question-and-answer.md).

**With a PowerApps Plan 2 license**

1. [Download the PowerApps and Microsoft Flow license report](admin-view-user-licenses.md).
2. [Create DLP policy scoped only to ‘All Environments’](create-dlp-policy.md) or scoped to include/exclude specific environments.
3. [Manage and assign licenses via Office admin center](signup-question-and-answer.md).
4. Full access to all the environment, app, and flow management capabilities for all environments in the tenant available via:
   - [PowerApps Admin center](https://admin.powerapps.com/)
   - [PowerApps Admin PowerShell cmdlets](https://docs.microsoft.com/powerapps/administrator/powerapps-powershell)
   - [PowerApps management connectors](https://aka.ms/adminconnectorreference)
5. Full access the PowerApps and Microsoft Flow admin analytics for all environments in the tenant:
   - [https://aka.ms/paadminanalytics  ](https://aka.ms/paadminanalytics)
   - [https://aka.ms/flowadminanalytics](https://aka.ms/flowadminanalytics) 

### Manage environment role assignments using Microsoft Flow

1. For environments *without* a Common Data Service for Apps database, the [Power Platform for Admins connector](https://docs.microsoft.com/en-us/connectors/powerplatformforadmins/) provides the ability to manage environment role assignments. 
2. For environments *with* a Common Data Service for Apps database, the built-in Common Data Service for Apps connector doesn’t have support for managing roles, but you can use a Microsoft Flow to do it through the web API via the following steps: 

   1. Create your Azure AD App. 
      1. Go to the Azure Portal ([https://portal.azure.com](https://portal.azure.com)) and select **Azure Active Directory**.
      2. Select **App Registrations**.
      3. Select **+ New App Registration**.

      image

      4. Give your App any name and URL (the URL doesn’t matter, just make it unique URL value). Leave the default Application type.
      5. Once created, you will need to give the App permissions to sign-in to Dynamics. Select **Settings** > **Required permissions** > **Add**.

      image

      6. Under **Select API** select **Dynamics CRM Online**.
      7. Under **Select permissions** select **Access Dynamics 365 as organization users**.
      8. Be sure to **Save**.

   2. Create your custom connector
      1. Navigate to [https://web.powerapps.com](https://web.powerapps.com) and sign-in with an ID that has administrative permission for both Active Directory and for CRM.
      2. If you have multiple environments, select the environment in which you want the custom connector to be created.
      3. Download the Open API file here: [https://procsi.blob.core.windows.net/docs/CDS-Permissions.swagger.json](https://procsi.blob.core.windows.net/docs/CDS-Permissions.swagger.json) 
      4. Go to the settings gear at the top of the portal and select Custom Connectors
      5. Select Create custom connector >Import from an Open API file
      6. Give the custom connector a meaningful name, e.g. “CDS Permissions” and select the CDS-Permissions Swagger file that you downloaded.
      7. On the General tab, enter the host of your CDS instance:

         image

      8. Select Security -> to go to the next tab. Here, select Azure Active Directory as your authentication provider
      9. You will now fill in the Client ID field  - copy it from the Properties of your Azure AD app in the Azure Portal. The field is called Application ID
      10. Next, you’ll fill in the Client secret. From the Azure portal, select the Keys screen and in the Passwords section enter a new description and duration. Select Save. You’ll be able to copy the Value – put that in the Client secret field. (NOTE:  Make sure you copy and save this key somewhere secure.  You won’t be able to retrieve it later.)
      11. In the Resource URL field enter the full URL of your CDS instance host (unlike the first screen, include https://).The screen should now look like:

          image

      12. You can now save your connector in the top bar. 
      13. If you refresh the page you should see the Redirect URL. Copy this. Go back to the Azure AD app in the Azure portal and select Reply URLs. Paste in this redirect URL you copied and click Save. 

   3. Build a sample flow that does a one-time copy from Group to a Role
      1. Through flow it is easy to build this by using an Office365 Group or an Azure AD Group.
      2. For Office 365 groups:
         1. The Office 365 Groups connector contains an action for “List Group Members” that will return all the users in the selected Office 365 group. 
      
            image

         2. Using an Office 365 group as your source for role updates allows your users to update group members through the Office 365 UI and then run the flow to apply the changes.  This allows the business to control who they want to be makers and administrators in their environments. 
         3. When using Office 365 groups you have to list users based on whether the “internalemailaddress” field from the “List users” action in the custom connector is equal to the “User Principal Name” field (which is normally the email address) in the Office 365 Group. (Notice the single quotes around “User Principal Name” since it’s a string.)
      3. For Azure AD groups: 
         1.	Azure AD Security Groups are typically created by AD Administrators rather than business users.  AD Security Groups can be used in other systems to create group hierarchies. 
         2. In cases where the User Principal Name may not be the same as the Email address you will have to use an Azure AD Group as it can do a comparison with the actual AD User GUID in CDS rather than relying on the email address.  
         3. Rather than using the “List Group Member” action of the Office 365 Groups connector, the flow should use the “Get Group Members” action of the Azure AD Connector.  This action requires the ID of the group which a network administrator can obtain from the Azure AD Portal.  
 
            image
         
         4. Notice that the List Users query now looks for records where “azureactivedirectoryobjectid” equals the Id from the AD Group. (No quotes are required around the Id because it’s a GUID.  Adding quotes will make this $filter fail.)
      4. Once you’ve identified the user(s) that you want to assign to the role, the next step is to search for that user in the Common Data Service for Apps (to get the CDS id). 
      5. Then, based on that result we set the user role. The second foreach isn’t needed, because List users should always return one user.
      6. To assign the correct role, you should first query the REST Endpoint of your instance, for example:
         1.	https://orga2e7dd43.crm.dynamics.com/api/data/v9.0/roles?$select=name,roleid 
         2.	This will return a list of names and ID’s for all the available roles, for example:
 
            image
       
      7. If you want to add the users to the “Environment Maker” Role then the “Role ODataID” parameter would be set to:
         1. https://YourOrgID.crm.dynamics.com/api/data/v9.0/roles(d58407f2-48d5-e711-a82c-000d3a37c848) 
         2. These roleid’s will be unique to each environment.
-->

### Consider location-based conditional access

For customers with Azure AD Premium, conditional access policies can be defined in Azure for PowerApps and Microsoft Flow. This allows granting or blocking access based upon: user/group, device, location. 

#### Creating a Conditional Access Policy

1. Sign-in to [http://portal.azure.com](http://portal.azure.com) 
2. Select Azure Active Directory
3. Select Conditional Access.
4. Select + New Policy
5. Select user and groups
6. Select the cloud apps
7. Apply conditions (user/group, device, location) 

### Prevent data leakage with data loss prevent policies

[Data loss prevention policies (DLP)](wp-data-loss-prevention.md) enforce rules for which connectors can be used together by classifying connectors as either Business Data only or No Business Data allowed. Simply, if you put a connector in the business data only group, it can only be used with other connectors from that group in the same application. Tenant admins can define policies that apply to all environments.

#### FAQ

Q: Can I control, on the tenant level, which connector is at all available, e.g. No to Dropbox or Twitter but Yes to SharePoint)?

A: This is not possible. Customers can subscribe to Audit events to perform corrective action if there are flows that have been built that create concerns for customers. In fact, a very large PowerApps customer has leveraged this approach to apply another level of governance.
 
Q: What about Sharing connectors between users? E.g. the connector for Teams is a general one that can be shared (?)

A: Connectors are available to all users. With the exception of premium or custom connectors which need either an additional license (premium connectors) or have to be explicitly shared (custom connectors)

## Alert and action

In addition to monitoring, many customers want to subscribe to software creation, usage or health events so they know when to perform an action. This section outlines a few means to observe events (manually and programmatically) and perform actions triggered by an event occurrence. 

### Leverage the [PowerApps and Microsoft Flow admin center](wp-work-with-admin-portals.md)

1.	View and manage environments
2.	View and manage all apps and flows within an environment
3.	View and manage your CDS 
4.	Environment and app management requires a PowerApps Plan 2 or Microsoft Flow plan 2 

### Build Microsoft Flows to alert on key audit events

1.	An example of alerting that can be implemented is subscribing to Office 365 Security and Compliance Audit Logs. 
2.	This can be achieved through either a [webhook](https://preview.flow.microsoft.com/blog/automate-flow-governance/) subscription or [polling](https://preview.flow.microsoft.com/blog/accessing-office-365-security-compliance-center-logs-from-microsoft-flow/) approach. However, by attaching Flow to these alerts, we can provide administrators with more than just email alerts.

### Build the policies you need with PowerApps, Microsoft Flow and PowerShell

1.	These [PowerShell cmdlets](powerapps-powershell.md) place full control in the hands of admins to automate the governance policies necessary. 
2.	The [Management connectors](https://powerapps.microsoft.com/blog/new-connectors-for-powerapps-and-flow-resources/) provide the same level of control but with added extensibility and ease-of-uses by leveraging PowerApps and Flow. 
3.	The following Microsoft Flow templates for administration connectors exist for ramping up quickly:
   1.	[List new Microsoft Flow Connectors](https://preview.flow.microsoft.com/galleries/public/templates/5a6ef26db3b749ed88b7afb377d11ecf/list-new-microsoft-flow-connectors/)
   2.	[List new PowerApps, Flows and Connectors](https://preview.flow.microsoft.com/en-us/galleries/public/templates/0b2ffb0174724ad6b4681728c0f53062/get-list-of-new-powerapps-flows-and-connectors/)
   3.	[Email me a weekly summary of Office 365 Message Center notices](https://preview.flow.microsoft.com/galleries/public/templates/c2537df7b47340e6bcf1ba931a459355/email-me-a-weekly-summary-of-office-365-message-center-notices/)
   4.	[Access Office 365 Security and Compliance Logs from Microsoft Flow](https://preview.flow.microsoft.com/blog/accessing-office-365-security-compliance-center-logs-from-microsoft-flow/)
4.	This [blog and app template](https://powerapps.microsoft.com/blog/custom-admin-dashboard-with-the-powerapps-admin-connectors/) exist to help ramping up quickly on the administration connectors. 
5. Additionally, it’s worth checking out content shared in the [Community Apps Gallery](https://powerusers.microsoft.com/t5/Community-Apps-Gallery/PowerApps-admin-app-version-2/m-p/247560), here’s another example of an administrative experience built using PowerApps and admin connectors.

### FAQ

**Problem**
Currently, all users with Office E3 licenses can create apps in the Default environment. How can we enable Environment Maker rights to a select group e.g. 10 persons to create apps? 

**Recommendation**
The [PowerShell cmdlets](https://powerapps.microsoft.com/blog/gdpr-admin-powershell-cmdlets/) and [Management connectors](https://powerapps.microsoft.com/blog/new-connectors-for-powerapps-and-flow-resources/) provide full flexibility and control to administrators to build the policies they want for their organization.

Here are three samples: 

1. Download a report of activity w/ PowerShell. 
This scripts downloads 4 files, which capture all apps, app permission, flows, and flow permissions within a tenant.  NOTE: the calling user or user account must be a global admin and have a PowerApps Plan 2 (or P2 trial) license.
	
   Q: Where should we host .zip files in the following deck? (Governance.pptx slide 48)

2. Notify un-authorized app creators and share their app w/ administrators (automated with Flow)This is a daily flow that identified ‘authorized’ creators via a security group(s) check and sends a notification to un-authorized app creators AND a summary report to administrators.  The flow also shares the app w/ administrators for auditing.

3. Find and disable flows that leverage certain connectors
This is a flow that runs every 30 minutes and automatically disables flows that include certain connectors. In this flow I identified flows from the following connectors – but the flow can be extended to identify any connector.

## Monitor

It’s well understood that monitoring as a critical aspect of managing software at scale, this section highlights a couple of means to get insight in PowerApps and Flow development and usage.  

### Review the audit trail

[Activity logging for PowerApps](logging-powerapps.md) is integrated with Office Security and Compliance center for comprehensive logging across Microsoft services like Dynamics 365 and Office 365. Office provides an API to query this data, which is currently used by many SIEM vendors to use the Activity Logging data for reporting.

### Download the PowerApps and Microsoft Flow license report

1. [https://admin.powerapps.com/tenant/userLicenses](https://admin.powerapps.com/tenant/userLicenses) 
2. View PowerApps and Microsoft Flow admin analytics
   1. Available now in preview from the new [Power Platform admin center](https://aka.ms/ppac). 
   2. One can get information along the following lines: 
     1. Active User and App usage  - how many users are using an app and how often? 
     2. Location – where is the usage? 
     3. Service Performance of connectors
     4. Error reporting – which are the most error prone apps
     5. Flows in use by type and date
     6. Flows created by type and date
     7. Application-level auditing 
     8. Service Health
     9. Connectors used

### View app resources used in an Environment

1.	In the PowerApps admin center, select Environments in the navigation menu. 
2.	Select an Environment.
3. Optionally, the list of resources used in an Environment may be downloaded as a .csv.

<!--
## Deploy

The means by which software is developed, validated and deployed to a production environment is an important topic for each organization and happens to vary greatly from one organization to the next. As a reference, this section outlines how Microsoft’s central IT organization manages and deploys PowerApps.

### How does Microsoft manage environments, maker roles, DLP policies? 

1.	Microsoft IT maintains at least 2 environments. 
2.	Admin and maker roles are assigned only to security groups, not individuals. 
3.	Environments are *not* geo-redundant. 
4.	The region for an environment is selected based on proximity to the users it will serve.
5.	Microsoft created an app services API that exposes app URLs by SG membership so we can support geo-redundancy (but don’t do so currently).
6.	For development, there exists a sandbox environment where Makers can create apps here under their own user identity.
7.	For User Acceptance Testing, there exists an environment to test integration with other applications, deployment procedures, single-sign-on, etc… Apps are authored by an official AAD security group account. 
8.	For production, there is a unique AAD security group for makers than for development and UAT. Apps are authored by the official AAD SG account. Deployment to this environment is locked down to avoid disruption and ensure the environment telemetry is accurate.
9.	Default DLP policies exist for the entire tenant that limit access to business data.

### How does Microsoft share apps and connectors? 

1.	Apps and connectors are shared to security groups only.
2.	Apps are directly authored in the studio for the development environment. Apps are then exported and imported into other environments. 
3.	Custom Connectors are shared to the entire org. 
4.	Since we restrict makers by access-control-lists, non-authorized users cannot enumerate environments in the powerapps studio nor can they re-use our connection objects to create unsponsored apps
5.	For development, connectors are shared as ‘Can Edit’ with the same SG used for the environment maker role and we allow the makers to create Custom Connectors.
6.	In UAT and Production, Custom Connectors are created under a service account and shared as ‘can use’ to the entire org and ‘Can Edit’ to our maker SG.
7.	Custom Connectors are patched for single-sign-on. 
8.	AAD app registrations are admin consented.
9.	The connection object is patched to use aadcertificate auth under the context of the PowerApps API Hub
10.	SQL connectors and push notification connectors show up in the Connections view as they are a shared instance. Makes must be educated to not delete these, as they are *not* a personal connection instance of a custom connector and deleting them will delete it for all users.

### How does Microsoft prepare for disaster recovery?

1.	For canvas apps, versioning is built-in the service and any maker can restore an app to a preview version. See [https://docs.microsoft.com/powerapps/maker/canvas-apps/restore-an-app](https://docs.microsoft.com/powerapps/maker/canvas-apps/restore-an-app).
2.	For Microsoft Flows, we use the export feature to download the flow as a .zip package and archive the package.
3.	For all Common Data Service for Apps components, which use the same platform that powers Dynamics 365 apps, it benefits from the [built-in daily backup and restore capabilities](https://docs.microsoft.com/dynamics365/customer-engagement/admin/backup-restore-instances).
-->


