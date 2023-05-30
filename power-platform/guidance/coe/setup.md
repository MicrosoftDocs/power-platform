---
title: Before setting up the CoE Starter Kit
description: Learn about the prerequisites for setting up the Center of Excellence (CoE) Starter Kit for adopting and supporting Microsoft Power Platform.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/23/2023
ms.subservice: guidance
author: manuelap-msft
ms.author: mapichle
ms.reviewer: sericks
search.audienceType: 
  - admin
ms.custom: bap-template
---

# Before setting up the CoE Starter Kit

The [Center of Excellence (CoE) Starter Kit](starter-kit-explained.md) is a collection of components and tools that can help you develop a strategy for adopting and supporting Microsoft Power Platform, with a focus on Power Apps and Power Automate. This article prepares you to install the CoE Starter Kit with guidance on:

- [Which identity to use when you install and run the solutions](#which-identity-should-i-install-the-coe-starter-kit-with)
- [How to communicate with makers, users, and other admins](#how-will-you-communicate-with-your-admins-makers-and-users)
- [What data source to use for your Power Platform inventory](#what-data-source-should-i-use-for-my-power-platform-inventory)
- [How to plan your environments and update strategy](#plan-your-update-strategy)
- [How to validate your data loss prevention (DLP) policies](#validate-data-loss-prevention-policies)
- [What's in the CoE Starter Kit download package](#download-the-solution)

## Which identity should I install the CoE Starter Kit with?

The CoE Starter Kit requires access to your tenant's Power Platform environments. Therefore, the identity you set up for the CoE Starter Kit needs the following licenses and roles:

- [Microsoft Power Platform service admin](../../admin/use-service-admin-role-manage-tenant.md#power-platform-administrator), global tenant admin, or Dynamics 365 service admin
- Power Apps per-user license (nontrial) and Microsoft 365 license
- Power Automate per-user license or per-flow licenses (nontrial)
- Power BI Premium per-user license or per-capacity license if you intend to use [Data Export](#what-data-source-should-i-use-for-my-power-platform-inventory) for inventory
- Power BI Pro license if you'd like to share the [Power BI report](power-bi.md) that's part of the CoE Starter Kit

These roles and licenses must be available to the user continuously. It's not sufficient for admin access to be granted only temporarily using [Privileged Identity Management (PIM)](/azure/active-directory/privileged-identity-management). The CoE Starter Kit works by using admin connectors in cloud flows to check for new and updated Power Platform resources and provide admin and governance tooling based on Power Platform resources in your tenant. These connectors require an account that has Power Platform Admin access to retrieve the inventory of all environments. The flows that use the connectors run on a schedule and on event-based triggers. A role with lesser privileges or with time-based access through PIM won't see all resources in the inventory.

Additional prerequisites:

- The identity must be enabled for email.
- If you'd like to collect information like app launches and unique users per app, you must be granted access to the [Microsoft 365 audit log](/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance#before-you-search-the-audit-log) and work with a Global Admin who has access to the audit log to complete the setup.
- [Configure multifactor authentication](/troubleshoot/power-platform/power-automate/conditional-access-and-multi-factor-authentication-in-flow) for the account.

<a name="how-will-you-communicate-with-your-admins-makers-and-end-users"></a>

## How will you communicate with your admins, makers, and users?

You should consider how you communicate with different groups of people before you start the setup.  

In particular, consider the following personas:

- **Admin persona**

  - Power Platform admins to communicate with each other
  - Power Platform makers to contact Power Platform admins

- **Maker persona**

  - Power Platform admins to contact Power Platform makers
  - Power Platform makers to communicate with each other

- **User persona**

  - Power Platform admins to contact Power Platform users

We recommend using three [Microsoft 365 groups](/microsoft-365/admin/create-groups/compare-groups#microsoft-365-groups), one for each persona. This group type is an email-enabled security group and can be associated with a Microsoft team for collaboration between the people in the group.

> [!IMPORTANT]
> As part of the [inventory of a tenant's Power Platform resources](setup-core-components.md), makers are added to the group that you define for the **Power Platform Maker persona**. You can use this group to share apps and other resources with makers. For makers to be added to the group, the admin or service account that sets up the [inventory components](setup-core-components.md) must be an owner of the group.

Some processes in the CoE Starter Kit send [Power Automate approvals](/power-automate/get-started-approvals) and [Adaptive Cards for Microsoft Teams](/power-automate/overview-adaptive-cards). Approvals and Adaptive Cards can't be assigned to a group. Therefore, in addition to the three persona groups listed earlier, you need an individual named admin that these communications can go to:

- **Individual admin**
  - Individual to receive chat bot chats
  - Individual to receive approvals

## What data source should I use for my Power Platform inventory?

The CoE Starter Kit gathers information about your Power Platform inventory to provide processes to manage, govern, and nurture Power Platform adoption in your tenant. The CoE Starter Kit offers two mechanisms to gather this data:

- **Data Export (preview)**: You can use the [Data Export](/power-platform/admin/self-service-analytics) feature in the Power Platform admin center to export Power Platform inventory and usage data directly into Azure Data Lake Storage. Because the admin center provides the data, this mechanism is high in performance.

    [Set up Data Export](/power-platform/admin/self-service-analytics#set-up-the-data-export-process-for-your-tenant) in advance to try this option. Proceed with the CoE Starter Kit configuration only when you see inventory data files in your storage account. The initial data export can take up to five days.

    Next, [download](https://aka.ms/CoEBYODLdownload) the version of the CoE Starter Kit that integrates with Data Export. Use the [setup wizard](setup-core-components.md#set-up-the-inventory-components-using-the-setup-wizard) to configure the feature in your tenant.

    Your feedback is critical to this process. [Raise an issue on GitHub](https://github.com/microsoft/coe-starter-kit/issues/new?assignees=Jenefer-Monroe&labels=coe-starter-kit%2Cquestion&template=5-coe-starter-kit-question.yml&title=%5BCoE+Starter+Kit+-+QUESTION%5D+QUESTION) to give us your feedback.

    [Get answers to frequently asked questions about the Data Export integration](faq-dataexport.md).

    > [!IMPORTANT]
    > Use of Data Export for inventory is in experimental preview. We recommend you don't depend on it just yet. First try it out in a dedicated test environment. That helps us validate that the feature meets your needs and that we're not introducing unintended side effects.

- **Cloud flows**: Cloud flows use Power Platform admin connectors to query and crawl your tenant and store inventory and usage data in Dataverse tables. This method is suitable for small to medium-sized tenants. It can cause performance issues in tenants where the Power Platform inventory contains more than 10,000 objects (combined number of environments, apps, and flows).

## Plan your update strategy

We recommend that you install the CoE Starter Kit solution in two environments. Use one as your testing environment. The other is for production use.

For your test environment:

- [Create an environment with a database](/power-platform/admin/create-environment#create-an-environment-with-a-database).
- Choose English as the default language.
- Don't add sample apps and datasets.
- Set the security group to **None** to allow open access. Some parts of the CoE Starter Kit use [approval actions](/power-automate/get-started-approvals) and require makers to be able to interact with the environment.
- [Import the solution](setup-core-components.md) and complete the setup steps.
- Set the *ProductionEnvironment* variable to **No** to avoid sending emails to makers and users.

The CoE Starter Kit is updated monthly, usually in the first full week of the month. We recommend that you update your CoE Starter Kit solution **at least every three months**. Power Platform is evolving at such a rapid pace that if you delay updating the Starter Kit, you could run into unexpected issues when you do update.

Test updates in the dedicated test environment before you update your production environment. Focus your testing on the features of the CoE Starter Kit that you use. Verify that components you use still work, and that any new features added to those components meet your requirements.

[Learn more about updating the Center of Excellence (CoE) Starter Kit](after-setup.md).

## Validate data loss prevention policies

The [DLP policy](/power-platform/admin/wp-data-loss-prevention) that you apply to your CoE Starter Kit environment needs to allow the following connectors to be used together in the business group:

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

The CoE Starter Kit collects information about who owns a resource like an app or a flow. If an interactive user owns a resource, the Starter Kit uses the [Office 365 Users connector](/connectors/office365users/) to get the information. If a service principal, or application user, owns the resource, it uses the [HTTP with Azure AD connector](/connectors/webcontents/) to get the name of the user from [Microsoft Graph](https://developer.microsoft.com/graph).

- For commercial tenants, the HTTP and HTTP with Azure AD connectors connect to [https://graph.microsoft.com](https://developer.microsoft.com/graph). If your tenant is in GCC, GCC High, or DoD, check your [service root endpoint for Microsoft Graph](/graph/deployments#microsoft-graph-and-graph-explorer-service-root-endpoints).

  You can't set up [DLP endpoint filtering](../../admin/connector-endpoint-filtering.md) for these connectors. DLP policies don't support dynamic endpoint evaluation.

- If you're using the [audit log](setup-auditlog.md) solution, the custom connector that connects to the Microsoft 365 audit log must be allowed in your business group. [Configure the [https://manage.office.com/](/office/office-365-management-api/office-365-management-apis-overview) endpoint](../../admin/dlp-connector-classification.md#tenant-level-dlp-policies) in the business group of your tenant-level policy.

- Check that [no other DLP policies apply](../../admin/dlp-combined-effect-multiple-policies.md) to the environment.

- If you're using the [ALM Accelerator for Power Platform](almacceleratorpowerplatform-components.md) components, the environment must have a DLP policy that allows [Dataverse (legacy)](/connectors/commondataservice/), [Power Apps for Makers](/connectors/powerappsforappmakers/), [HTTP with Azure AD](/connectors/webcontents/), and the ALM Accelerator Custom DevOps connector to be used together. These connectors must be in the business data-only bucket of the DLP policy for the environment.

## Download the solution

Download the CoE Starter Kit solution and Power BI dashboard files from [aka.ms/CoEStarterKitDownload](https://aka.ms/CoEStarterKitDownload). The setup instructions walk you through when to use each file in the package.

The following table describes the contents of the download package.<!-- EDITOR'S NOTE: I removed when to use the files and any dependencies from the table below because we've just said the setup instructions cover this information. -->

| File Name | Description |
| --- | --- |
| admintaskanalysis_core_1_2_managed.zip | [Power Platform admin task planner components](setup-admin-tasks-component.md) |
| CenterofExcellenceALMAccelerator_x.x.yyyymmdd.x_managed.zip | [ALM Accelerator for Power Platform](almacceleratorpowerplatform-components.md) solution file |
| CenterofExcellenceAuditComponents_x.xx_managed.zip | [Governance components](governance-components.md) solution file |
| CenterofExcellenceAuditLogs_x.xx_managed.zip | Audit Log components solution file |
| CenterofExcellenceCoreComponents_x.xx_managed.zip  | [Core components](core-components.md) solution file |
| CenterofExcellenceInnovationBacklog_x.xx_managed.zip  | [Innovation Backlog components](innovationbacklog-components.md) solution file |
| CenterofExcellenceNurtureComponents_x.xx_managed.zip | [Nurture components](nurture-components.md) solution file |
| MakerAssessmentStarterData.xlsx | Provides a set of starter questions and answers for the [Maker assessment](nurture-components.md#maker-assessment-components) app |
| Power Platform Administration Planning.pbit  | [Power Platform admin task planner Power BI template file](power-bi.md) |
| PowerPlatformGovernance_CoEDashboard_MMMYYYY.pbit  | [CoE Governance and Compliance Dashboard Power BI template file](power-bi-compliance.md) |
| Production_CoEDashboard_MMMYYYY.pbit  | [CoE Dashboard Power BI template file](power-bi.md) |
| Pulse_CoEDashboard.pbit | [Pulse survey Power BI template file](nurture-components.md#pulse-survey-components) |
| Sample-task-data.xlsx | Provides a set of tasks for the [Power Platform admin task planner components](admin-tasks-component.md) app |
| ToolIcons.zip | Provides a set of starter icons for the [Innovation Backlog](innovationbacklog-components.md) |

> [!div class="nextstepaction"]
> [Next step: Set up inventory components](setup-core-components.md)

## What's next: After installing the CoE Starter Kit

- [Update the CoE Starter Kit](after-setup.md)
- [Extend the CoE Starter Kit](modify-components.md)

[!INCLUDE [footer-include](../../includes/footer-banner.md)]
