---
title: Set up the CoE Starter Kit 
description: Prerequisites and instructions for setting up the Center of Excellence (CoE) Starter Kit for adopting and supporting Microsoft Power Platform, with a focus on Power Apps and Power Automate.
author: Grant-Archibald-MS 
ms.component: pa-admin
ms.topic: how-to
ms.date: 10/02/2024
ms.subservice: guidance-toolkit
ms.author: grarchib
ms.reviewer: sericks
search.audienceType: 
  - admin
---
# Before setting up the CoE Starter Kit

The Center of Excellence (CoE) Starter Kit is a collection of components and tools to help you get started with developing a strategy for adopting and supporting Microsoft Power Platform, with a focus on Power Apps and Power Automate. For more information about individual components, see [CoE Starter Kit explained](starter-kit-explained.md)

This article prepares you to install the CoE Starter Kit and provides guidance on:

- The identity used to install and run the solutions.
- The environment type to use for your solutions.
- All prerequisites needed to use the CoE Starter Kit.

## Which identity should I use to install the CoE Starter Kit?

The CoE Starter Kit requires access to your tenant's Power Platform environments. Therefore, the identity you set up for the CoE Starter Kit needs the following licenses and roles:

- [Microsoft Power Platform service admin](../../admin/use-service-admin-role-manage-tenant.md#power-platform-administrator) or global tenant admin.

  > [!NOTE]
  > Dynamics 365 service admin doesn't work, since it:
  > - Can't gather all environment types, for example the *teams* type.
  > - Doesn't allow privilege escalation.
  >
- Power Apps Per User license (nontrial) and Microsoft 365 license.
- Power Automate Per User license, or Per Flow licenses (nontrial).
- Power BI Premium per user or per capacity (if using [Data Export](#what-data-source-should-i-use-for-my-power-platform-inventory) for inventory)
- The identity must have access to an Office 365 mailbox that meets all requirements to use the [Office 365 Outlook](/connectors/office365/) connector.
- If you'd like to collect usage information, such as app launches and unique users per app, you must have access to an Azure app registration. The app registrations need to have permissions to read data from the [Microsoft 365 audit log](/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance#before-you-search-the-audit-log) to complete the setup. You only need this app registration if you're using [Cloud flows](#what-data-source-should-i-use-for-my-power-platform-inventory) for inventory.
- If you'd like to share the [Power BI report](power-bi.md) that's part of the CoE Starter Kit, this identity needs to have the Power BI Pro license.  

These roles and licenses must be available to a user directly and permanently.

:::image type="content" source="media/ppadminrole.png" alt-text="Screenshot of the Power Platform admin center environments overview." lightbox="media/ppadminrole.png":::

Configure multifactor authentication for the account by following the recommended settings for [conditional access and multifactor authentication in Power Automate](/troubleshoot/power-platform/power-automate/conditional-access-and-multi-factor-authentication-in-flow).

## How to communicate with your admins, makers, and users

Consider how you want to communicate with different groups of people, or *personas*, before you start the setup:  

- **Admin persona**
  - Power Platform admins communicate with each other.
  - Power Platform makers contact Power Platform admins.
- **Maker persona**
  - Power Platform admins contact Power Platform makers.
  - Power Platform makers communicate with each other.
- **User persona**
  - Power Platform admins contact Power Platform users.

We recommend using three [Microsoft 365 groups](/microsoft-365/admin/create-groups/compare-groups#microsoft-365-groups), one for each persona. This group type is an email-enabled security group and can be associated with a Microsoft team for collaboration between the people in the group.

> [!IMPORTANT]
> As part of the [inventory of a tenants Power Platform resources](setup-core-components.md), makers are added to the group you define for the **Power Platform Maker persona**.
>
> To add makers to the group, the admin or service account setting up the [inventory components](setup-core-components.md) needs to be an owner of the group. You can share apps and other resources relevant to makers with this group.

### Individual as an admin

Some processes in the CoE Starter Kit send [Power Automate Approvals](/power-automate/get-started-approvals) and [Adaptive Cards for Microsoft Teams](/power-automate/overview-adaptive-cards). These cards can't be assigned to a group.

You need an individual named *admin* to receive these communications:

- Individual to receive chat bot chats
- Individual to receive approvals

## What data source should I use for my Power Platform inventory?

At the heart of the CoE Starter Kit are processes that gather information about your Power Platform inventory to provide processes to manage, govern, and nurture Power Platform adoption in your tenant.

The CoE Starter Kit offers two mechanisms to gather this data:

- **Data Export (preview)**

  You can export Power Platform inventory and usage data directly into Azure Data Lake Storage using the [Data Export](/power-platform/admin/self-service-analytics) feature in the Power Platform admin center. Since the admin center provides the data, this mechanism is high in performance. [Data Export](/power-platform/admin/self-service-analytics#set-up-the-data-export-process-for-your-tenant) must be configured in advance from the Power Platform Admin Center to use this option.

  > [!IMPORTANT]
  > The CoE Starter Kit using data provided by Data Export for inventory is currently in experimental preview. We recommend to first test the kit in a dedicated test environment. Trying this feature helps us validate that the feature meets your needs and prevents unintended side effects.

  For more information, see [Try out the Data Export feature](#how-can-i-try-out-the-data-export-feature).

- **Cloud flows**

  Cloud flows use Power Platform admin connectors to query and crawl your tenant and store inventory and usage data in Dataverse tables. 
  
  This method is suitable for small to medium sized tenants but can cause performance issues in tenants where Power Platform inventory exceeds 10,000 objects (combined number of environments, apps, flows).

### How can I try out the Data Export feature?

1. Enable the [Data Export](/power-platform/admin/self-service-analytics#set-up-the-data-export-process-for-your-tenant) feature in your tenant.

   Proceed with the CoE Starter Kit configuration only when you see inventory data files in your storage account. The initial data export can take up to five days.
1. [Download](https://aka.ms/CoEBYODLdownload) the version of the CoE Starter Kit that integrates with Data Export and use the [setup wizard](setup-core-components.md#set-up-the-inventory-components-using-the-setup-wizard) to configure the feature in your tenant.
1. Post your feedback by [raising an issue on GitHub](https://github.com/microsoft/coe-starter-kit/issues/new?assignees=Jenefer-Monroe&labels=coe-starter-kit%2Cquestion&template=5-coe-starter-kit-question.yml&title=%5BCoE+Starter+Kit+-+QUESTION%5D+QUESTION). Your feedback is critical to this process.

For more information, see [Frequently asked questions about the Data Export integration](faq-dataexport.md).

## Plan your upgrade strategy

A new version of the CoE Starter Kit is released monthly, usually in the first full week of each month. This release cadence is important to know so you can review, organize, plan, and test the latest version.

We recommend upgrading the CoE Starter Kit solution at least **every three months**. With the fast pace of change for Power Platform, leaving updates longer than three months can result in unexpected issues with your next update.

We recommend testing upgrades in a dedicated test environment, before upgrading your production environment. Focus your test efforts on your favorite features of the CoE Starter Kit. Verify that components you use continue to work when you add new features that meet your requirements.

In your test environment, set the *ProductionEnvironment* variable to *no*. A *no* setting means no emails are sent to makers and end users as you test features.

For more information, see [Updating the Center of Excellence (CoE) Starter Kit](after-setup.md).

## Create your environments

We recommend creating two environments to install the CoE Starter Kit solution:

1. One for testing
1. One for production use

For more information, see [Updating the CoE Starter Kit](after-setup.md).

Create two production environments to install the CoE Starter Kit solutions:

- [Create an environment with a database](/power-platform/admin/create-environment#create-an-environment-with-a-database).
- Choose English as the default language.
- Don't add sample apps and datasets.
- Set the security group to **None** to allow open access. Some parts of the CoE Starter Kit use [approval actions](/power-automate/get-started-approvals) and require makers to be able to interact with the environment.
- After [importing the solution](setup-core-components.md) and completing the setup steps, set the *ProductionEnvironment* variable to *no* in your test environment. This means you can test the CoE Starter Kit processes without impacting makers and end users.

> [!IMPORTANT]
> Using Data Export as a mechanism to retrieve inventory and telemetry is currently in preview. We recommend you test this in a dedicated test environment before using this feature in production.

### Validate data loss prevention (DLP) policies

The [DLP policy](/power-platform/admin/wp-data-loss-prevention) applied to your CoE Starter Kit environment needs to allow the following connectors to be used together in the business group:

- [Approvals](/connectors/approvals/)
- [Azure Resource Manager](/connectors/arm/)
- HTTP
- [HTTP with Microsoft Entra ID (preauthorized)](/connectors/webcontents/)
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
- [Power Platform for Admins V2](/connectors/powerplatformadminv2/)
- [Power Query Dataflows](/connectors/dataflows/)
- [RSS](/connectors/rss/)

> [!NOTE]
> The CoE Starter Kit collects information about who owns a resource, such as an app or a flow.
>
> - If the resource is owned by an interactive user, the [Office 365 Users](/connectors/office365users/) connector is used to get the owner details.
> - If the resource is owned by a service principal (app user), the [HTTP with Microsoft Entra ID (preauthorized)](/connectors/webcontents/) connector makes a call to [Microsoft Graph](https://developer.microsoft.com/graph) to retrieve the app user name to correctly mark ownership of resources to avoid them being marked as orphaned (without an owner).

- The **HTTP** and **HTTP with Microsoft Entra (preauthorized)** connectors connect to [graph.microsoft.com](https://developer.microsoft.com/graph) for commercial tenants.

  If your tenant is in Government Community Cloud (GCC), GCC High, or DoD, check your [service root endpoint for Microsoft Graph](/graph/deployments#microsoft-graph-and-graph-explorer-service-root-endpoints).

  You can't set up [DLP endpoint filtering](../../admin/connector-endpoint-filtering.md) for these connectors, as DLP Policies don't support dynamic endpoint evaluation.

- Check that no other DLP policies apply to this environment. For more information, see [Combined effect of multiple DLP policies](../../admin/dlp-combined-effect-multiple-policies.md).

## Download the solution

[Download the CoE Starter Kit solution and Power BI dashboard files](https://aka.ms/CoEStarterKitDownload) to your device.

The content package contains various files that support different features of the CoE Starter Kit. The setup instructions walk you through when to use each file.

The following table is an overview of each file:

| File Name | Description |
| --------- | ----------- |
| admintaskanalysis_core_x_xx_managed.zip | [Power Platform admin task planner components](setup-admin-tasks-component.md). |
| BYODL_CoEDashboard_MMMYYYY.pbit  | [CoE Dashboard Power BI template file](power-bi.md). Required during [configuration of the Power BI dashboard](setup-powerbi.md) if using experimental Data Export feature.|
| CenterofExcellenceAuditComponents_x.xx_managed.zip  | [Governance components](governance-components.md) solution file. Required during [setup of the Governance](before-setup-gov.md) components. Has a dependency on [Core components](core-components.md) being installed first. |
| CenterofExcellenceCoreComponents_x.xx_managed.zip  | [Core components](core-components.md) solution file. Required during [setup of the Core](setup-core-components.md) components in a production environment. |
| CenterofExcellenceInnovationBacklog_x.xx_managed.zip  | [Innovation Backlog components](innovationbacklog-components.md) solution file. Required during [setup of the Innovation Backlog](setup-innovationbacklog.md) components. |
| CenterofExcellenceNurtureComponents_x.xx_managed.zip  |  [Nurture components](nurture-components.md) solution file. Required during [setup of the Nurture](setup-nurture-components.md) components. Has a dependency on [Core components](core-components.md) being installed first. |
| MakerAssessmentStarterData.xlsx | Provides a set of starter questions and answers for the [Maker assessment](nurture-components.md#maker-assessment-components) app. Required during [configuration of the Maker Assessment](setup-nurture-components.md#set-up-maker-assessment-components) app. |
| microsoft-video-hub-starter-data.xlsx | Provides a set of starter videos for the [Video Hub](nurture-components.md#video-hub-components) app. |
| Power Platform Administration Planning.pbit  | [Power Platform admin task planner Power BI template file](power-bi.md). Required during [configuration of the Power Platform admin task planner components](setup-admin-tasks-component.md). |
| PowerPlatformAdminAnalytics-DF-MMYYYY  | Dataflow file required during [configuration of the Power BI dashboard](setup-powerbi.md) if using experimental Data Export feature.|
| PowerPlatformGovernance_CoEDashboard_MMMYYYY.pbit  | [CoE Governance and Compliance Dashboard Power BI template file](power-bi-compliance.md). Required during [configuration of the Power BI dashboard](setup-powerbi.md) |
| Production_CoEDashboard_MMMYYYY.pbit  | [CoE Dashboard Power BI template file](power-bi.md). Required during [configuration of the Power BI dashboard](setup-powerbi.md) |
| Pulse_CoEDashboard.pbit | [Pulse survey Power BI template file](nurture-components.md#pulse-survey-components). Required during [configuration of Pulse survey](setup-nurture-components.md#set-up-pulse-feedback-survey) components. |
| Sample-task-data.xlsx | Provides a set of tasks for the [Power Platform admin task planner components](admin-tasks-component.md) app. [Configuration of the Power Platform admin task planner components](setup-admin-tasks-component.md). |
| ToolIcons.zip | Provides a set of starter icons for the [Innovation Backlog](innovationbacklog-components.md). Required during [configuration of the Innovation Backlog](setup-innovationbacklog.md#turn-on-the-flows). |

> [!div class="nextstepaction"]
> [Next step: Set up inventory components](setup-core-components.md)

## What's next: After installing the CoE Starter Kit

> [!IMPORTANT]
> We recommend upgrading the CoE Starter Kit solution at least **every three months**. With the fast pace of change for Power Platform, leaving updates longer than three months can result in unexpected issues with your next update.

If you already installed the CoE Starter Kit, check instructions for

- [Update the CoE Starter Kit](after-setup.md) with a new release.
- [Extend the CoE Starter Kit](modify-components.md).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
