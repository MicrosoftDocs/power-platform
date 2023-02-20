---
title: "Set up the CoE Starter Kit | MicrosoftDocs"
description: "Prerequisites and instructions for setting up the Center of Excellence (CoE) Starter Kit for adopting and supporting Microsoft Power Platform, with a focus on Power Apps and Power Automate"
author: manuelap-msft
manager: devkeydet

ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/24/2022
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

## Decide what data source your Power Platform inventory is coming from?

At the heart of the CoE Starter Kit are processes that gather information about your tenants Power Platform inventory and adoption to provide a holistic overview and tenant-wide processes to manage, govern and nurture Power Platform adoption in your tenant.

The CoE Starter Kit offers two mechanisms to gather this data:

- **Data Export (preview)**: You can export Power Platform inventory and usage data directly into Azure Data Lake Storage. Because the data is provided by the admin center, this is high in performance. Note, Data Export has to be configured in advance from the Power Platform Admin Center to use this option: [Set up data export for your tenant](/power-platform/admin/self-service-analytics#set-up-the-data-export-process-for-your-tenant). This option requires an Azure Storage account, and is recommend for larger tenants with more than 10,000 apps or flows.
- **Cloud flows**: Cloud flows use Power Platform admin connectors to query and crawl your tenant and store inventory and usage data in Dataverse tables. This method is suitable for small tenants but can cause performance issues in larger tenants. If you have more than 10,000 apps or flows consider using Data Export instead.

## Create your environments

We recommend creating two environments to install the CoE Starter Kit solution - one for testing updates and customizations, and one for production use. Learn more: [Updating the CoE Starter Kit](after-setup.md)

Create two production environments to install the CoE Starter Kit solutions:

- [Create an environment with a database](/power-platform/admin/create-environment#create-an-environment-with-a-database).
- Choose English as the default language.
- Don't add sample apps and datasets.
- Don't restrict environment access with a security group, because some parts of the CoE Starter Kit use [approval actions](/power-automate/get-started-approvals) and require makers to be able to interact with the environment.

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
