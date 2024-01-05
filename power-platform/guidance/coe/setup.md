---
title: "Set up the CoE Starter Kit | MicrosoftDocs"
description: "Prerequisites and instructions for setting up the Center of Excellence (CoE) Starter Kit for adopting and supporting Microsoft Power Platform, with a focus on Power Apps and Power Automate"
author: manuelap-msft
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/02/2023
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: sericks
search.audienceType: 
  - admin
---
# Before setting up the CoE Starter Kit

The Center of Excellence (CoE) Starter Kit is a collection of components and tools that can help you get started with developing a strategy for adopting and supporting Microsoft Power Platform, with a focus on Power Apps and Power Automate. More information about individual components: [CoE Starter Kit explained](starter-kit-explained.md)

This article prepares you to install the CoE Starter Kit and provides guidance on:

- The identity with which to install and run the solutions.
- The environment type to use for your solutions.
- All pre-requisites needed to use the CoE Starter Kit.

## What identity should I install the CoE Starter Kit with?

The CoE Starter Kit requires access to your tenant's Power Platform environments. Therefore, the identity you set up for the CoE Starter Kit needs the following licenses and roles:

- [Microsoft Power Platform service admin](../../admin/use-service-admin-role-manage-tenant.md#power-platform-administrator), global tenant admin, or Dynamics 365 service admin.
- Power Apps Per User license (non-trial) and Microsoft 365 license.
- Power Automate Per User license, or Per Flow licenses (non-trial).
- Power BI Premium per user or per capacity (if using [Data Export](#what-data-source-should-i-use-for-my-power-platform-inventory) for inventory)
- The identity must have access to an Office 365 mailbox that has the REST API enabled. It must also meet all requirements to use the [Office 365 Outlook](/connectors/office365/) connector.
- If you'd like to collect usage information, such as app launches and unique users per app, you must have access to an Azure app registration. The app registrations needs to have permissions to read data from the [Microsoft 365 audit log](/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance#before-you-search-the-audit-log) to complete the setup. You only need this app registration if you are using [Cloud flows](#what-data-source-should-i-use-for-my-power-platform-inventory) for inventory.
- If you'd like to share the [Power BI report](power-bi.md) that's part of the CoE Starter Kit, this identity needs to have the Power BI Pro license.  

These roles and licenses must be available to this user continuously; it's not sufficient for the admin access to be granted only temporarily via [Privileged Identity Management (PIM)](/azure/active-directory/privileged-identity-management). The CoE Starter Kit works by using admin connectors in cloud flows (such as [Power Apps for Admins](/connectors/powerappsforadmins/)) to check for new and updated Power Platform resources and provide admin and governance tooling based on Power Platform resources in your tenant (for example, identify highly shared or unused resources). These connectors require an account that has Power Platform Admin access to retrieve the inventory of all environments - a role with lesser privileges wouldn't see all resources in the inventory. The flows using these connectors run on a schedule and on event-based triggers. If you use an identity that has time-based access via PIM to run these flows, not all the inventory would be retrieved.

Configure multi-factor authentication for the account by following the recommended settings for [conditional access and multi-factor authentication in Power Automate](/troubleshoot/power-platform/power-automate/conditional-access-and-multi-factor-authentication-in-flow).

<a name="how-will-you-communicate-with-your-admins-makers-and-end-users"></a>

## How will you communicate with your admins, makers, and users?

You should consider how you communicate with different groups of people before you start the setup.  

In particular, consider the following personas:

- **Admin persona**
  - Power Platform admins to communicate with each other.
  - Power Platform makers to contact Power Platform admins.
- **Maker persona**
  - Power Platform admins to contact Power Platform makers.
  - Power Platform makers to communicate with each other.
- **User persona**
  - Power Platform admins to contact Power Platform users.

We recommend using three [Microsoft 365 groups](/microsoft-365/admin/create-groups/compare-groups#microsoft-365-groups), one for each persona. This group type is an email-enabled security group and can be associated with a Microsoft team for collaboration between the people in the group.

>[!IMPORTANT]
>As part of the [inventory of a tenants Power Platform resources](setup-core-components.md), makers are added to the group you define for the **Power Platform Maker persona**. You can share apps and other resources relevant to makers with this group. In order for makers to be added to the group, the admin or service account setting up the [inventory components](setup-core-components.md) needs to be an owner of these groups.

Some processes in the CoE Starter Kit send [Power Automate Approvals](/power-automate/get-started-approvals) and [Adaptive Cards for Microsoft Teams](/power-automate/overview-adaptive-cards). These cards can't be assigned to a group. You therefore also need an individual named admin that these communications can go to. In addition to the above groups, you'll therefore also need:

- **Individual Admin**
  - Individual to receive chat bot chats
  - Individual to receive approvals

## What data source should I use for my Power Platform inventory?

At the heart of the CoE Starter Kit are processes that gather information about your Power Platform inventory to provide processes to manage, govern and nurture Power Platform adoption in your tenant.

The CoE Starter Kit offers two mechanisms to gather this data:

- **Data Export (preview)**: You can export Power Platform inventory and usage data directly into Azure Data Lake Storage using the [Data Export](/power-platform/admin/self-service-analytics) feature in the Power Platform Admin Center. Because the data is provided by the admin center, this mechanism is high in performance. [Data Export](/power-platform/admin/self-service-analytics#set-up-the-data-export-process-for-your-tenant) has to be configured in advance from the Power Platform Admin Center to use this option.
    >[!IMPORTANT]
    >The CoE Starter Kit using data provided by Data Export for inventory is currently in experimental preview. We recommend you don't depend on it just yet and first test it in a dedicated test environment. Trying out this feature will help us validate that the feature meets your needs and that we're not introducing unintended side effects.
    
    Try out the feature by enabling the [Data Export](/power-platform/admin/self-service-analytics#set-up-the-data-export-process-for-your-tenant) feature in your tenant first. Proceed with the CoE Starter Kit configuration only when you see inventory data files in your storage account. The initial data export can take up to five days. Next, [download](https://aka.ms/CoEBYODLdownload) the version of the CoE Starter Kit that integrates with Data Export and use the [setup wizard](setup-core-components.md#set-up-the-inventory-components-using-the-setup-wizard) to configure the feature in your tenant. Your feedback is critical to this process. Please post your feedback by [raising an issue on GitHub](https://github.com/microsoft/coe-starter-kit/issues/new?assignees=Jenefer-Monroe&labels=coe-starter-kit%2Cquestion&template=5-coe-starter-kit-question.yml&title=%5BCoE+Starter+Kit+-+QUESTION%5D+QUESTION).

- **Cloud flows**: Cloud flows use Power Platform admin connectors to query and crawl your tenant and store inventory and usage data in Dataverse tables. This method is suitable for small to medium sized tenants but can cause performance issues in tenants where Power Platform inventory exceeds 10,000 objects (combined number of environments, apps, flows).

### How can I try out this feature?

First, enable the [Data Export](/power-platform/admin/self-service-analytics#set-up-the-data-export-process-for-your-tenant) feature in your tenant. Proceed with the CoE Starter Kit configuration only when you see inventory data files in your storage account. The initial data export can take up to five days.

[Download](https://aka.ms/CoEBYODLdownload) the version of the CoE Starter Kit that integrates with Data Export and use the [setup wizard](setup-core-components.md#set-up-the-inventory-components-using-the-setup-wizard) to configure the feature in your tenant. Your feedback is critical to this process. Post your feedback by [raising an issue on GitHub](https://github.com/microsoft/coe-starter-kit/issues/new?assignees=Jenefer-Monroe&labels=coe-starter-kit%2Cquestion&template=5-coe-starter-kit-question.yml&title=%5BCoE+Starter+Kit+-+QUESTION%5D+QUESTION).

Learn more: [Frequently asked questions about the Data Export integration](faq-dataexport.md)

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
- Set the security group to **None** to allow open access. Some parts of the CoE Starter Kit use [approval actions](/power-automate/get-started-approvals) and require makers to be able to interact with the environment.
- After [importing the solution](setup-core-components.md) and completing the setup steps, set the *ProductionEnvironment* variable to no in your test environment. This means you can test the CoE Starter Kit processes without impacting makers and end users.

>[!IMPORTANT]
>Using Data Export as a mechanism to retrieve inventory and telemetry is currently in preview - we recommend you test this in a dedicated test environment before using this feature in production.

### Validate data loss prevention (DLP) policies

The [DLP policy](/power-platform/admin/wp-data-loss-prevention) applied to your CoE Starter Kit environment needs to allow the following connectors to be used together in the business group:

- [Approvals](/connectors/approvals/)
- [Azure Resource Manager](/connectors/arm/)
- HTTP
- [HTTP with Microsoft Entra ID](/connectors/webcontents/)
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
> The CoE Starter Kit collects information about who owns a resource, such as an app or a flow. If the resource is owned by an interactive user, the [Office 365 Users](/connectors/office365users/) connector is used to get those details. If the resource is owned by a service principal (application user), the [HTTP with Microsoft Entra ID](/connectors/webcontents/) connector is used to make a call to [Microsoft Graph](https://developer.microsoft.com/graph) to get the name of the application user to correctly mark ownership of resources and avoid resources being marked as orphaned (without an owner).

- The HTTP and HTTP with Microsoft Entra connectors connect to [https://graph.microsoft.com](https://developer.microsoft.com/graph) for commercial tenants; if your tenant is in GCC, GCC High or DoD, check your [service root endpoint for Microsoft Graph](/graph/deployments#microsoft-graph-and-graph-explorer-service-root-endpoints). <br>
You can't set up [DLP endpoint filtering](../../admin/connector-endpoint-filtering.md) for these connectors, as dynamic endpoint evaluation isn't supported by DLP Policies.

- If you're using the [audit log](setup-auditlog.md) solution, the custom connector used to connect to the Microsoft 365 audit log also must be allowed in your business group. Configure the [https://manage.office.com/](/office/office-365-management-api/office-365-management-apis-overview) endpoint in the business group of your tenant-level policy. Learn more: [Configure custom connector endpoints in tenant-level policies](../../admin/dlp-connector-classification.md#tenant-level-dlp-policies).

- Check that no other DLP policies apply to this environment. Learn more: [Combined effect of multiple DLP policies](../../admin/dlp-combined-effect-multiple-policies.md)

- If you're using the [ALM Accelerator for Power Platform](almacceleratorpowerplatform-components.md) components, the environment must have a DLP policy that allows [Dataverse (legacy)](/connectors/commondataservice/), [Power Apps for Makers](/connectors/powerappsforappmakers/), [HTTP with Microsoft Entra ID](/connectors/webcontents/), and the ALM Accelerator Custom DevOps connector to be used together. Those connectors must be in the business data&ndash;only bucket of the DLP policy for this environment.

## Download the solution

Download the CoE Starter Kit solution and Power BI dashboard files to your device. The entire content package can be downloaded directly at [aka.ms/CoEStarterKitDownload](https://aka.ms/CoEStarterKitDownload).

The content package contains various files that support different features of the CoE Starter Kit. The setup instructions walk you through when to use each file, and below table will give you an overview of the purpose of each file:

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

If you've already installed the CoE Starter Kit, check our instructions for

- [Updating the CoE Starter Kit](after-setup.md) with a new release
- [Extending the CoE Starter Kit](modify-components.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]