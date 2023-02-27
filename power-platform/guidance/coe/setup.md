---
title: "Set up the CoE Starter Kit | MicrosoftDocs"
description: "Prerequisites and instructions for setting up the Center of Excellence (CoE) Starter Kit for adopting and supporting Microsoft Power Platform, with a focus on Power Apps and Power Automate"
author: manuelap-msft
manager: devkeydet
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/08/2023
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Before setting up the CoE Starter Kit

The Center of Excellence (CoE) Starter Kit is a collection of components and tools that are designed to help you get started with developing a strategy for adopting and supporting Microsoft Power Platform, with a focus on Power Apps and Power Automate. More information about individual components: [CoE Starter Kit explained](starter-kit-explained.md)

This article will prepare you to install the CoE Starter Kit and provides guidance on:

- The identity with which to install and run the solutions.
- The environment type to use for your solutions.
- All pre-requisites needed to use the CoE Starter Kit.

## What identity should I install the CoE Starter Kit with?

The CoE Starter Kit requires access to your tenant's Power Platform environments. Therefore, the identity you set up for the CoE Starter Kit needs the following:

- [Microsoft Power Platform service admin](../../admin/use-service-admin-role-manage-tenant.md#power-platform-administrator), global tenant admin, or Dynamics 365 service admin.
- Power Apps Per User license (non-trial) and Microsoft 365 license.
- Power Automate Per User license, or Per Flow licenses (non-trial).
- Power BI Premium per user or per capacity (if using [Data Export](#what-data-source-should-i-use-for-my-power-platform-inventory) for inventory)
- The identity must be email-enabled.
- If you'd like to collect telemetry information, such as app launches and unique users per app, you must be granted access to the Audit Log and work with a Global Admin who has access to [Microsoft 365 audit log](/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance#before-you-search-the-audit-log) to complete the setup.

These roles and licenses must be available to this user continuously; if admin access is granted only temporarily via [Privileged Identity Management (PIM)](/azure/active-directory/privileged-identity-management), this won't be sufficient to run the CoE Starter Kit.

Multi-factor authentication can be used for the account setting up the CoE Starter Kit, if **MaxAgeMultiFactor** is set to **Until-Revoked** instead of a fixed time. Learn more: [Conditional access and multi-factor authentication in Power Automate](/troubleshoot/power-platform/power-automate/conditional-access-and-multi-factor-authentication-in-flow).

Additionally, if you'd like to share the [Power BI report](power-bi.md) that's part of the CoE Starter Kit, this identity needs to have the Power BI Pro license.  

<a name="how-will-you-communicate-with-your-admins-makers-and-end-users"></a>

## How will you communicate with your admins, makers, and users?

You should consider how you'll communicate with different groups of people before you start the setup.  

In particular, consider the following:

- **Admin persona**
  - Power Platform admins to communicate with each other.
  - Power Platform admins to be contacted by your Power Platform makers.
- **Maker persona**
  - Power Platform makers to be contacted by Power Platform admins.
  - Power Platform makers to communicate with each other.
- **User persona**
  - Power Platform users to be contacted by Power Platform admins.

We recommend using three [Microsoft 365 groups](/microsoft-365/admin/create-groups/compare-groups#microsoft-365-groups) for this, one for each persona. This group type is an email-enabled security group and can be associated with a Microsoft team for collaboration between the people in the group.

>[!IMPORTANT]
>As part of the [inventory of a tenants Power Platform resources](setup-core-components.md), makers are added to the group you define for the **Power Platform Maker persona**. You can share apps and other resources relevant to makers with this group. In order for makers to be added to the group, the admin or service account setting up the [inventory components](setup-core-components.md) needs to be an owner of these groups.

Some processes part of the CoE Starter Kit send [Power Automate Approvals](/power-automate/get-started-approvals) and [Adaptive Cards for Microsoft Teams](/power-automate/overview-adaptive-cards). These can't be assigned to a group. You therefore also need an individual named admin that these communications can go to. In addition to the above groups, you will therefore also need:

- **Individual Admin**
  - Individual to receive chat bot chats
  - Individual to receive approvals

## What data source should I use for my Power Platform inventory?

At the heart of the CoE Starter Kit are processes that gather information about your tenants Power Platform inventory to provide a holistic overview and tenant-wide processes to manage, govern and nurture Power Platform adoption in your tenant.

The CoE Starter Kit offers two mechanisms to gather this data:

- **Data Export (preview)**: You can export Power Platform inventory and usage data directly into Azure Data Lake Storage using the [Data Export](/power-platform/admin/self-service-analytics) feature in the Power Platform Admin Center. Because the data is provided by the admin center, this is high in performance. Data Export has to be configured in advance from the Power Platform Admin Center to use this option: [Set up data export for your tenant](/power-platform/admin/self-service-analytics#set-up-the-data-export-process-for-your-tenant).
- **Cloud flows**: Cloud flows use Power Platform admin connectors to query and crawl your tenant and store inventory and usage data in Dataverse tables. This method is suitable for small tenants but can cause performance issues in larger tenants.

### Frequently asked questions

#### What are the requirement for using Data Export with the CoE Starter Kit?

To receive the data, you have to configure [Data Export](/power-platform/admin/self-service-analytics#set-up-the-data-export-process-for-your-tenant) in the Power Platform Admin Center first. This feature requires a Global Admin for initial setup, and an Azure Storage account to store data. Before you can set up Data Export, you also have to enable [tenant-level analytics](/power-platform/admin/tenant-level-analytics).
For the CoE Starter Kit capabilities, you will also need a [Power BI Premium](/power-bi/enterprise/service-premium-features) per user or per capacity workspace.

#### What are the license requirements and costs for using Data Export with the CoE Starter Kit?

The identity setting up the CoE Starter Kit needs a Power Apps Per User and Power Automate Per User license, and either a Power BI Premium per user license or access to a Power BI Premium per capacity workspace. You will also need an Azure Datalake Gen 2 Storage Account to receive data from the Data Export feature.

#### What permissions are required for the CoE Starter Kit to consume Data Export data?

The identity setting up the CoE Starter Kit needs Storage Data Reader permissions to the Azure Storage account that receives data from the Data Export feature.

#### Why do you recommend moving from using cloud flows to retrieve inventory to using Data Export?

>[!NOTE]
>The CoE Starter kit using Data Export data is currently in preview. We recommend you test the CoE Starter Kit with Data Export in a dedicated test environment before using this feature in production or upgrading your production environment.

The cloud flows that sync inventory to Dataverse consume a high number of API calls, and can hit throttling and scale limits if you have a large number of Power Platform resources (environments, apps, flows) in your tenant. These cloud flows work best for small to medium sized tenants that have less than 10,000 apps and flows. The Data Export feature uses Power BI and Power Platform dataflows which are powerful at transforming and handling large amounts of data. Using Data Export with the CoE Starter Kit will increase performance and scale.

#### Will the CoE Starter Kit still have inventory of resources not yet available in the Data Export feature?

Currently, the Data Export features provides inventory on environments, apps and cloud flows. For resources not yet available via Data Export (Desktop flows, chatbots, solutions, AI Builder models, Power Pages), the CoE Starter Kit will continue to use cloud flows to retrieve inventory.

#### How does the CoE Starter Kit consume data from the Data Export feature?

There's two mechanisms the CoE Starter Kit uses to consume data from the Data Export feature:

- [Power BI dataflows](/power-bi/transform-model/dataflows/dataflows-introduction-self-service) are used to transform the data for Power BI. These dataflows prepare all the data in the storage account ready for reporting. The Power BI dashboard is then based on the data prepared by the Power BI dataflows.
- [Power Platform dataflows](/power-query/dataflows/overview-dataflows-across-power-platform-dynamics-365) are used to transform the data and write a small amount of data back to existing Dataverse tables used by the CoE Starter Kit apps and flows. These dataflows merge and summarize data so only data needed by the admin and governance processes of the CoE Starter Kit are written back to the Dataverse. For example, instead of storing the entire usage data in Dataverse, only the last launched date of an app (single date) is stored in Dataverse.

#### Can I migrate from using cloud flows to retrieve inventory to using Data Export?

Yes, this is a seamless process - use the [Setup Wizard](setup-core-components.md#set-up-the-inventory-components-using-the-setup-wizard) to change your data source for the CoE Starter Kit to Data Export and continue configuring the inventory components using the Setup Wizard.

>[!NOTE]
>The CoE Starter kit using Data Export data is currently in preview. We recommend you test the CoE Starter Kit with Data Export in a dedicated test environment before using this feature in production or upgrading your production environment.

#### What will happen to my existing data when I upgrade?

The CoE Starter Kits inventory is based on unique identifiers (GUIDs). App, flow, environment metadata is stored in Dataverse tables, and each app, flow and environment has a unique identifier that is used as the key to the row in the table. This GUID is the same if the inventory is retrieved with cloud flows and if the inventory is retrieved with Data Export. If you switch from using cloud flows to using Data Export, the dataflows will recognize existing rows via their GUID and update those rows, and add new records if the GUID does not yet exist. There will not be a duplication of rows.

#### What will happen to custom columns that I have created as part of customizations, if they are not part of data from datalake?

The Power BI dashboard has been updated to depend on the Azure storage account instead of Dataverse tables - if you are using your custom columns in the Power BI dashboard, you will have to bring them into the new Power BI dashboard and append them to the new dataset.
If you're only using the custom columns in apps and flows, there is no change required - as these columns won't be updated by the dataflow, data in them will persist.

#### Will I see any data changes between what is coming from Data Export and what already exists?

Data integrity between moving from cloud flows to retrieve inventory to using Data Export to retrieve inventory is kept via the unique identifiers (GUIDs) of each resource (environment, app, flow). The dataflows will recognize existing rows via their GUID and update those, and add new records if the GUID does not yet exist. There will not be a duplication of rows.

#### Will all apps and flows in the CoE Starter Kit continue to work (e.g. inactivity notifications, compliance process, identifying orphaned resources)

Yes, there will be no change in functionality.

>[!IMPORTANT]
>If you're using Data Export as a mechanism to retrieve inventory and telemetry, [set up data export for your tenant](/power-platform/admin/self-service-analytics#set-up-the-data-export-process-for-your-tenant) and only proceed once you see inventory data files in your storage account. This can take up to 5 days after initial configuration.

## Plan your upgrade strategy

A new version of the CoE Starter Kit is released monthly, usually in the first full week of each month. This release cadence is important to know so you can review, organize, plan, and test the latest version. We recommend upgrading the CoE Starter Kit solution at least **every three months**. With the fast pace of change for Microsoft Power Platform, leaving updates longer than three months could result in unexpected issues when you do update.

We recommend testing upgrades in a dedicated test environment, before upgrading your production environment. Focus your test efforts on the features of the CoE Starter Kit that you use. Verify that components you use still work, any new features added to those components meet your requirements.

In your test environment, set the *ProductionEnvironment* variable to no - this means no emails will be sent to makers and end users as you test features.

Learn more: [Updating the Center of Excellence (CoE) Starter Kit](after-setup.md)

## Create your environments

We recommend creating two environments to install the CoE Starter Kit solution - one for testing, and one for production use. Learn more: [Updating the CoE Starter Kit](after-setup.md)

Create two production environments to install the CoE Starter Kit solutions:

- [Create an environment with a database](/power-platform/admin/create-environment#create-an-environment-with-a-database).
- Choose English as the default language.
- Don't add sample apps and datasets.
- Don't restrict environment access with a security group, because some parts of the CoE Starter Kit use [approval actions](/power-automate/get-started-approvals) and require makers to be able to interact with the environment.
- After [importing the solution](setup-core-components.md) and completing the setup steps, set the *ProductionEnvironment* variable to no in your test environment. This means you can test the coE Starter Kit processes without impacting makers and end users.

>[!IMPORTANT]
>Using Data Export as a mechanism to retrieve inventory and telemetry is currently in preview - we recommend you test this in a dedicated test environment before using this feature in production.

### Validate data loss prevention (DLP) policies

The [DLP policy](/power-platform/admin/wp-data-loss-prevention) applied to your CoE Starter Kit environment needs to allow the following connectors to be used together in the business group:

- [Approvals](/connectors/approvals/)
- HTTP
- [HTTP with Azure AD](/connectors/webcontents/)
- [Microsoft Dataverse](/connectors/commondataserviceforapps/)
- [Microsoft Dataverse (legacy)](/connectors/commondataservice/)
- [Microsoft Teams](/connectors/teams/)
- [Office 365 Groups](/connectors/office365groups/)
- [Office 365 Outlook](/connectors/office365/)
- [Office 365 Users](/connectors/office365users/)
- [Power Apps for Admins](/connectors/powerappsforadmins/)
- [Power Apps for Makers](/connectors/powerappsforappmakers/)
- [Power Automate for Admins](/connectors/microsoftflowforadmins/)
- [Power Automate Management](/connectors/flowmanagement/)
- [Power Platform for Admins](/connectors/powerplatformforadmins/)
- [Power Query Dataflows](/connectors/dataflows/)
- [RSS](/connectors/rss/)
- [SharePoint](/connectors/sharepointonline/)

> [!NOTE]
> The CoE Starter Kit collects information about who owns a resource, such as an app or a flow. If the resource is owned by an interactive user, the [Office 365 Users](/connectors/office365users/) connector is used to get those details. If the resource is owned by a service principal (application user), the [HTTP with Azure AD](/connectors/webcontents/) connector is used to make a call to [Microsoft Graph](https://developer.microsoft.com/graph) to get the name of the application user to correctly mark ownership of resources and avoid resources being marked as orphaned (without an owner).

- The HTTP and HTTP with Azure AD connectors connect to [https://graph.microsoft.com](https://developer.microsoft.com/graph) for commercial tenants; if your tenant is in GCC, GCC High or DoD, check your [service root endpoint for Microsoft Graph](/graph/deployments#microsoft-graph-and-graph-explorer-service-root-endpoints). <br>
You cannot set up [DLP endpoint filtering](/power-platform/admin/dlp-granular-controls#endpoint-filtering) for these connectors, as dynamic endpoint evaluation is not supported by DLP Policies.

- If you're using the [audit log](setup-auditlog.md) solution, the custom connector used to connect to the Microsoft 365 audit log also must be allowed in your business group. Configure the [https://manage.office.com/](/office/office-365-management-api/office-365-management-apis-overview) endpoint in the business group of your tenant-level policy. Learn more: [Configure custom connector endpoints in tenant-level policies](../../admin/dlp-connector-classification.md#tenant-level-dlp-policies).

- Check that no other DLP policies apply to this environment. Learn more: [Combined effect of multiple DLP policies](../../admin/dlp-combined-effect-multiple-policies.md)

- If you're using the [ALM Accelerator for Power Platform](almacceleratorpowerplatform-components.md) components, the environment must have a DLP policy that allows [Dataverse (legacy)](/connectors/commondataservice/), [Power Apps for Makers](/connectors/powerappsforappmakers/), [HTTP with Azure AD](/connectors/webcontents/), and the ALM Accelerator Custom DevOps connector to be used together. Those connectors must be in the business data&ndash;only bucket of the DLP policy for this environment.

## Download the solution

Download the CoE Starter Kit solution and Power BI dashboard files to your device. The entire content package can be downloaded directly at [aka.ms/CoEStarterKitDownload](https://aka.ms/CoEStarterKitDownload).

The content package contains various files that support different features of the CoE Starter Kit. The setup instructions will walk you through when to use each file, and below table will give you an overview of the purpose of each file:

| File Name | Description |
| --- | --- |
| admintaskanalysis_core_1_2_managed.zip | [Power Platform admin task planner components](setup-admin-tasks-component.md) |
| CenterofExcellenceALMAccelerator_x.x.yyyymmdd.x_managed.zip  | [ALM Accelerator for Power Platform](almacceleratorpowerplatform-components.md) solution file. Required during [setup of the ALM Accelerator for Power Platform](setup-almacceleratorpowerplatform-cli.md) components. |
| CenterofExcellenceAuditComponents_x.xx_managed.zip  | [Governance components](governance-components.md) solution file. Required during [setup of the Governance](before-setup-gov.md) components. Has a dependency on [Core components](core-components.md) being installed first. |
| CenterofExcellenceAuditLogs_x.xx_managed.zip  |  Audit Log components solution file. Required during [setup of the Audit Log](setup-auditlog.md) components. Has a dependency on [Core components](core-components.md) being installed first.|
| CenterofExcellenceCoreComponents_x.xx_managed.zip  | [Core components](core-components.md) solution file. Required during [setup of the Core](setup-core-components.md) components in a Production environment. |
| CenterofExcellenceInnovationBacklog_x.xx_managed.zip  | [Innovation Backlog components](innovationbacklog-components.md) solution file. Required during [setup of the Innovation Backlog](setup-innovationbacklog.md) components. |
| CenterofExcellenceNurtureComponents_x.xx_managed.zip  |  [Nurture components](nurture-components.md) solution file. Required during [setup of the Nurture](setup-nurture-components.md) components. Has a dependency on [Core components](core-components.md) being installed first. |
| MakerAssessmentStarterData.xlsx | Provides a set of starter questions and answers for the [Maker assessment](nurture-components.md#maker-assessment-components) app. Required during [configuration of the Maker Assessment](setup-nurture-components.md#set-up-maker-assessment-components) app. |
| Power Platform Administration Planning.pbit  | [Power Platform admin task planner Power BI template file](power-bi.md). Required during [configuration of the Power Platform admin task planner components](setup-admin-tasks-component.md). |
| PowerPlatformGovernance_CoEDashboard_MMMYYYY.pbit  | [CoE Governance and Compliance Dashboard Power BI template file](power-bi-compliance.md). Required during [configuration of the Power BI dashboard](setup-powerbi.md) |
| Production_CoEDashboard_MMMYYYY.pbit  | [CoE Dashboard Power BI template file](power-bi.md). Required during [configuration of the Power BI dashboard](setup-powerbi.md) |
| Pulse_CoEDashboard.pbit | [Pulse survey Power BI template file](nurture-components.md#pulse-survey-components). Required during [configuration of Pulse survey](setup-nurture-components.md#set-up-pulse-feedback-survey) components. |
| Sample-task-data.xlsx | Provides a set of tasks for the [Power Platform admin task planner components](admin-tasks-component.md) app. [configuration of the Power Platform admin task planner components](setup-admin-tasks-component.md). |
| ToolIcons.zip | Provides a set of starter icons for the [Innovation Backlog](innovationbacklog-components.md). Required during [configuration of the Innovation Backlog](setup-innovationbacklog.md#turn-on-the-flows) |

> [!div class="nextstepaction"]
> [Next step: Set up inventory components](setup-core-components.md)

## What's next: After installing the CoE Starter Kit

>[!IMPORTANT]
> We recommend upgrading the CoE Starter Kit solution at least **every three months**. With the fast pace of change for Microsoft Power Platform, leaving updates longer than three months could result in unexpected issues when you do update.

If you have already installed the CoE Starter Kit, please check our instructions for

- [Updating the CoE Starter Kit](after-setup.md) with a new release
- [Extending the CoE Starter Kit](modify-components.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
