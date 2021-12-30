---
title: "Set up the CoE Starter Kit | MicrosoftDocs"
description: "Prerequisites and instructions for setting up the Center of Excellence (CoE) Starter Kit for adopting and supporting Microsoft Power Platform, with a focus on Power Apps and Power Automate"
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/10/2022
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

- The identity with which to install and run the solutions
- The environment type to use for your solutions
- All pre-requisites needed to use the CoE Starter Kit

It will also help you understand how to extend the CoE Starter Kit, how to apply upgrades and where to post issues.

## What identity should I install the CoE Starter Kit with?

The CoE Starter Kit requires access to your tenants Power Platform environments, therefore the identity you set up the CoE Starter Kit with will need to have the following:

- [Microsoft Power Platform service admin](/power-platform/admin/use-service-admin-role-manage-tenant#power-platform-administrator), global tenant admin, or Dynamics 365 service admin
- Power Apps Per User license (non trial), and Microsoft 365 license
- The identity must be email enabled
- If you would like to collect telemetry information (app launches, unique users per app), the identity must have access to the [Microsoft 365 Audit Log](/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance#before-you-search-the-audit-log)

These roles and licenses must be available to this user continuously; if admin access is granted only temporarily via [Privileged Identity Management (PIM)](/azure/active-directory/privileged-identity-management) this will not be sufficient to run the CoE Starter Kit.

Additionally, if you would like to share the [Power BI report](power-bi.md) that is part of the CoE Starter Kit, this identity needs to have the Power BI Pro license.  

## How will you communicate with your admins, makers and end users?

You should consider how you will communicate with different groups of people before you start the setup.  

In particular, consider the following:

- **Admin persona**
  - Power Platform Admins to communicate with each other
  - Power Platform Admins to be contacted by your Power Platform Makers
- **Maker persona**
  - Power Platform Makers to be contacted by Power Platform Admins
  - Power Platform Makers to communicate with each
- **User persona**
  - Power Platform Users to be contacted by Power Platform Admins

We recommend using three [Microsoft 365 groups](/microsoft-365/admin/create-groups/compare-groups?view=o365-worldwide#microsoft-365-groups) for this, one for each persona. This group type is an email enabled security group and can be associated with a Microsoft Team for collaboration between the people in the group.  

## Prepare your environment

### Decide what environment type to use (Production or Dataverse for Teams)

The CoE Starter Kit can be used in both Production environments and Dataverse for Teams environments. Where you install it will depend on your organization setup, your adoption of Microsoft Power Platform so far and what you want to achieve with the CoE Starter Kit. Before you decide, compare [Dataverse vs Dataverse for Teams](/powerapps/teams/data-platform-compare) and review the impact on CoE Starter Kit features based on where you install it:

> [!IMPORTANT]
> The Governance and Nurture solution of the CoE Starter Kit have a dependency on the Core solution and need to be installed in the same environment.

| Feature | Dataverse for Teams environment | Production environment |
| --- | --- | --- |
| Syncing inventory to Dataverse tables | Yes, will require a Power Automate Per User/Per Flow license due to [action request limits and pagination settings](/power-automate/limits-and-config) | Yes, will require a Power Automate Per User/Per Flow license due to [action request limits and pagination settings](/power-automate/limits-and-config)|
| Data capacity | 2GB | Unlimited through capacity purchases |
| Collecting telemetry information from the Audit Log | No | Yes
| Power Platform Admin View to view and filter resources | Canvas App | Model Driven App |
| Power BI Dashboard | Yes | Yes |
| Data Permissions | Team members have full access, and [pre-built table permissions](/powerapps/teams/set-perms-and-share#assign-table-permissions) can be applied to colleagues with access | Granular permissions through [Dataverse security roles](/security-roles-privileges) that can be tailored to your requirements |
| Sharing apps | Share with colleagues who have a Microsoft 365 license in Teams | Sharing requires users to have a Power Apps Per User or Per App License |
| Accessing apps | Apps can only be accessed within Microsoft Teams | Apps can be viewed in the browser or mobile app |

### Create your environment

If you decide to use a Production Environment:

- [Create an environment with a database](/admin/create-environment#create-an-environment-with-a-database).
- Do not add sample apps and data sets.
- Do not restrict environment access with a security group as some parts of the CoE Starter Kit use [approval actions](/power-automate/get-started-approvals) and require makers to be able to interact with the environment.

If you decide to use a Dataverse for Teams Environment:

- Decide which team to add the CoE Starter Kit solution to or [create a new team](https://support.microsoft.com/office/create-a-team-from-scratch-174adf5f-846b-4780-b765-de1a0a737e2b).
- [Install the Power Apps personal app in Microsoft Teams](/powerapps/teams/install-personal-app).
- [Create your first app](/powerapps/teams/create-first-app) (at least one app is required in the environment to enable the solution import experience).

### Validate Data Loss Prevention (DLP) policies

The [DLP policy](/admin/wp-data-loss-prevention) applied to your CoE Starter Kit environment needs to allow the following connectors to be used together in the business group.

- [Approvals](/connectors/approvals/)
- [Azure AD](/connectors/azuread/)
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
> The CoE Starter Kit collects information on who owns a resource, such as an app or a flow. If the resource is owned by an interactive users, the [Office 365 Users](/connectors/office365users/) connector is used to get those details. If the resource is owned a service principal (application user), the [HTTP with Azure AD](/connectors/webcontents/) connector is used to make a call to [Microsoft Graph](https://developer.microsoft.com/graph) to get the name of the application user to correctly mark ownership of resources and avoid resources being marked as orphaned (without an owner).

- The HTTP and HTTP with Azure AD connectors connect to [https://graph.microsoft.com](https://developer.microsoft.com/graph). You can set up [DLP endpoint filtering](/admin/dlp-granular-controls#endpoint-filtering) for these connectors to only allow the [https://graph.microsoft.com](https://developer.microsoft.com/graph) endpoint. If your tenant is in GCC, GCC High or DoD check your [service root endpoint for Microsoft Graph](/graph/deployments#microsoft-graph-and-graph-explorer-service-root-endpoints).

- If you're using the [audit log](setup-auditlog.md) solution, the custom connector used to connect to the Microsoft 365 audit log also must be allowed in your business group. Configure the [https://manage.office.com/](/office/office-365-management-api/office-365-management-apis-overview) endpoint in the business group of your tenant-level policy. Learn more: [Configure Custom Connector endpoints in tenant-level policies](/power-platform/admin/dlp-connector-classification#tenant-level-dlp-policies).

- Check that no other DLP policies apply to this environment. Learn more: [Combined effect of multiple DLP policies](/admin/dlp-combined-effect-multiple-policies)

- If you're using the [ALM Accelerator for Makers](almaccelerator-components.md) components, the environment must have a DLP policy that allows [Dataverse](/connectors/commondataservice/), [Office 365 Outlook](/connectors/office365/), [Power Apps for Makers](/connectors/powerappsforappmakers/), [Approvals](/connectors/approvals/), [GitHub](/connectors/github/) [Power Platform for Admins](/connectors/powerplatformforadmins/) to be used together. Those connectors must be in the business data&ndash;only bucket of the DLP policy for this environment.

## Download the solution

- Downloaded the CoE Starter Kit solution and Power BI dashboard files to your device. The entire content package can be downloaded directly at [aka.ms/CoEStarterKitDownload](https://aka.ms/CoEStarterKitDownload).

- Both the governance components and nurture components solutions require the core solution before they can be installed.

> [!NOTE]
>The Admin \| Sync Template flows crawl through all the resources stored in Microsoft Power Platform and make a copy of details in each resource (for example, apps and flows) to Dataverse (table definitions are provided in this solution). All data displayed in most of the starter kit components must be in Dataverse, which means that the sync template must be configured for everything else to work. The sync flows run daily overnight. When you first set up the CoE Starter Kit, you can manually start the Admin \| Sync Template v3 flow, which will start the process of crawling and storing the information in Dataverse.

Start by setting up the [inventory components](setup-core-components.md).

## Extending the starter kit

When you're ready to extend the CoE Starter Kit with your own ideas, you'll do so by making modifications to the solution components in your own unmanaged solution:

1. Read about solutions in our documentation, which will introduce you to the concepts in addition to notions like how to create your publisher. More information: [Introduction to solutions](/powerapps/developer/common-data-service/introduction-solutions)

1. Create a new unmanaged solution. Environment variables that are part of the CoE Starter Kit can only be used from solutions. If you save a copy of apps or flows outside of a solution, environment variables will not get picked up.

1. Choose components from the CoE Starter Kit to add to your new solution. You decide which ones you want to customize.

1. Extend the CoE Starter Kit by making modifications to the solution components in the context of your new unmanaged solution.

   > [!CAUTION]
   > It's currently not possible to extend canvas apps or flows. If you want to make customizations to apps and flows, create a copy add them to your unmanaged solution. <br>
   > Editing apps and flows in the managed solution will prevent you from getting changes during an upgrade. See [Installing updates](#installing-upgrades).

1. Deploy your solution to test and production. We recommend making modifications and installing updates pushed by our team to the solution in a development environment dedicated to this kit, and hosting a production environment that has the real data. If data is being accessed and contributed by other users, it's a good idea to have separate development, test, and production environments.

## Installing upgrades

The CoE Starter Kit solutions will receive monthly updates with new features, bug fixes, or optimizations. These updates will be announced as a [release](https://github.com/microsoft/coe-starter-kit/releases) on [GitHub](https://aka.ms/CoEStarterKitRepo), and can be downloaded from there or by direct download at [aka.ms/CoEStarterKitDownload](https://aka.ms/CoEStarterKitDownload). We target releasing monthly during the first full week of each month.  

>[!IMPORTANT]
>We recommend upgrading at least every three months.

Install the updates by importing the latest version to the environment where you originally installed the solution.

1. Watch releases on our [GitHub repository](https://github.com/microsoft/coe-starter-kit) to receive notifications about the latest release.
    1. Go to our [GitHub repository](https://github.com/microsoft/coe-starter-kit) and login with your GitHub user.
    1. Select **Watch > Custom**.

      ![Select to watch the repository to receive notifications about new releases](media/github-watch1.png "Select to watch the repository to receive notifications about new releases")
    1. Select **Releases**.

       ![Check to only watch new releases](media/github-watch2.png "Check to only watch new releases")
    1. Select **Apply**.
1. Download the latest version CoE Starter Kit compressed file ([aka.ms/CoeStarterKitDownload](https://aka.ms/CoeStarterKitDownload)).

    >[!IMPORTANT]
    > **Extract the zip file** after downloading and before moving on to the next step. The CoE Starter Kit compressed file contains all solution components as well as non-solution aware components that make up the CoE Starter Kit.
1. If you have made any changes to the flows or apps in the solution, they will not receive updates until you remove that unmanaged layer. For every flow/app that you changed but would like to receive the latest update, go to the solution layers and remove the unmanaged layer. A good indication that a component has been changed is if the modified date is more recent than the latest install. Read our recommendations for [extending the CoE Starter Kit](#extending-the-starter-kit) to avoid creating unmanaged layers.
    1. Select **... > See solution layers**.

        ![See solution layers](media/Upgrade1.png "See solution layers")
    1. Select **Remove unmanaged layer**

        ![Remove unmanaged solution layer](media/Upgrade2.png "Remove unmanaged solution layer")
1. Import the solution
    1. If [Installing to Production Environment](faq.md#installing-a-solution-in-a-production-environment) – use the solution file from the download called CenterOfExcellenceCoreComponents_x_x_x_xx_managed.zip.
    1. If [Installing to Dataverse for Teams Environment](faq.md#installing-a-solution-in-a-dataverse-for-teams-environment) – use the solution file from the download called CenterOfExcellenceCoreComponentsTeams_x_x_x_xx_managed.zip.
1. Select **Upgrade** (default setting). [Solution upgrades](/alm/solution-concepts-alm#solution-lifecycle) will delete components that existed but are no longer included in the upgraded version.

    ![Select upgrade to install the new solution version](media/coe-upgrade1.png "Select upgrade to install the new solution version")
1. If the upgrade adds new environment variables or connection references, establish connections and update environment variable values. You will find the expected values in our setup instructions.
1. Wait for the Upgrade to finish. This can take up to 15 mins. During the upgrade, the new version is installed first and then the old version is deleted. Whilst the upgrade is processing, you may see two solutions with the same name in your solution explorer. Check the [solution history](/powerapps/maker/data-platform/solution-history#view-solution-history) to view the progress of the upgrade.

    ![Check the solution history for progress](media/coe-upgrade3.png "Check the solution history for progress")
  The upgrade will be complete when the end time is no longer empty.

    ![Check the solution history for progress](media/coe-upgrade2.png "Check the solution history for progress")
1. The [solution history](/powerapps/maker/data-platform/solution-history#view-solution-history) will also show you if the upgrade has failed and why. Raise an [issue](https://aka.ms/coe-starter-kit-issues) and provide the [solution operation error details](/powerapps/maker/data-platform/solution-history#view-solution-operation-error-details).

    ![View solution operation error details](media/coe-upgrade4.png "View solution operation error details")
1. Make sure to check the setup instructions of the solution you're upgrading to see if any new steps are necessary to use the solution and it's new features.
    1. [Setup core components](setup-core-components.md)
    1. [Setup governance components](before-setup-gov.md)
    1. [Setup nurture components](setup-nurture-components.md)

## It looks like I found a bug with the app; where should I go?

To file a bug against the solution, go to [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
