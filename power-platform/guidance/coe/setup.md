---
title: "Set up the CoE Starter Kit | MicrosoftDocs"
description: "Prerequisites and instructions for setting up the Center of Excellence (CoE) Starter Kit for adopting and supporting Microsoft Power Platform, with a focus on Power Apps and Power Automate"
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/01/2021
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
# Set up the CoE Starter Kit

[!INCLUDE[cc-data-platform-banner](../../includes/cc-data-platform-banner.md)]

The Center of Excellence (CoE) Starter Kit is a collection of components and tools that are designed to help you get started with developing a strategy for adopting and supporting Microsoft Power Platform, with a focus on Power Apps and Power Automate. More information about individual components: [CoE Starter Kit explained](starter-kit-explained.md)

In this article, you'll learn how to:

- Import the CoE Starter Kit solutions.
- Configure the apps, flows, and dashboard.
- Extend the starter kit.
- Install updates to the starter kit.

The CoE Starter Kit can be used in both Production environments and Dataverse for Teams environments. Where you install it will depend on your organization setup, your adoption of Microsoft Power Platform so far and what you want to achieve with the CoE Starter Kit. Before you decide, compare [Production vs Dataverse for Teams](#production-vs-dataverse-for-teams-environment).

## Prerequisites

The following are prerequisites for installing the CoE Starter Kit as it's included in the solution.

- Admin account:
  - Microsoft Power Platform service admin, global tenant admin, or Dynamics 365 service admin for access to all tenant resources through the Power Apps APIs.
  - This solution will work for environment admins, but the view will be restricted to only the environments an environment admin has access to.
  - This account must be email enabled.

- Environment with a Dataverse or Dataverse for Teams instance, where the user installing the solution has the System Administrator security role. We recommend against using security groups to control access to this environment, because it's likely that users who don't have access to this environment will be participating in approvals. If you choose to use a security group to control access, users will have to be a part of that group to work with the archival solutions.

- Licenses
  - A Microsoft 365 license is required to use Office 365 connectors like Outlook, SharePoint, and Groups.
  - If you are using the CoE Starter Kit in **Production environment with a Dataverse**, premium licenses are required for all users interacting with the CoE Starter Kit. Depending on what components you will use, your organization size and the existing licenses available in your organization, you will require either a Power Apps per user or per app or Power Automate per user or per flow license or a combination of these licenses.
  - If you are using the CoE Starter Kit in a **Dataverse for Teams** environment, a Power Automate per user license will be required for the admin running the sync flows. No other licenses will be required for users interacting with any of the canvas apps.

- If you want a DLP policy on the environment, it should allow the following connectors to be used together in the business data&ndash;only bucket of the DLP policy for this environment.
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
  > The CoE Starter Kit records who owns a resource, such as an app or a flow. If the resource is owned by an interactive users, the Office 365 Users connector is used to get those details. If the resource is owned a Service Principal (Application User), the HTTP with Azure AD connector is used to get the name of the Application User to correctly mark ownership of resources and avoid resources being marked as orphaned (without an owner).

- The HTTP and HTTP with Azure AD connectors connect to [https://graph.microsoft.com](https://graph.microsoft.com). You can set up [DLP endpoint filtering](/power-platform/admin/dlp-granular-controls#endpoint-filtering) for these connectors to only allow the [https://graph.microsoft.com](https://graph.microsoft.com) endpoint.

- If you're using the [audit log](setup-auditlog.md) solution, the custom connector used to connect to the Microsoft 365 audit log also must be allowed in your business data&ndash;only bucket. See [Custom Connectors and DLP](/power-platform/admin/dlp-connector-classification#tenant-level-dlp-policies)

- If you're using the [ALM Accelerator for Makers](almaccelerator-components.md) components, the environment must have a DLP policy that allows [Dataverse](/connectors/commondataservice/), [Office 365 Outlook](/connectors/office365/), [Power Apps for Makers](/connectors/powerappsforappmakers/), [Approvals](/connectors/approvals/), [GitHub](/connectors/github/) [Power Platform for Admins](/connectors/powerplatformforadmins/) to be used together. Those connectors must be in the business data&ndash;only bucket of the DLP policy for this environment.

- If you're using the [ALM Accelerator for Power Platform](almacceleratorpowerplatform-components.md) components, the environment must have a DLP policy that allows [Dataverse (Legacy)](/connectors/commondataservice/), [HTTP with Azure AD](/connectors/webcontents/), [Power Apps for Makers](/connectors/powerappsforappmakers/), ALM Accelerator Custom Azure DevOps to be used together.

- If multiple DLP policies apply to the same environment, either all of them must have the connectors the CoE Starter Kit uses in business data only or&mdash;if you have a policy that applies to all environments that you don't want to change&mdash;you can exclude the CoE environment from that policy. More information: [DLP policy scope](/power-platform/admin/dlp-policy-scope#policy-scope)

- You've downloaded the CoE solution and CoE Power BI dashboard files to your device. The entire content package can be downloaded directly at [aka.ms/CoEStarterKitDownload](https://aka.ms/CoEStarterKitDownload).

- Both the governance components and nurture components solutions require the core solution before they can be installed.

> [!NOTE]
>The Admin \| Sync Template flows crawl through all the resources stored in Microsoft Power Platform and make a copy of details in each resource (for example, apps and flows) to Dataverse (table definitions are provided in this solution). All data displayed in most of the starter kit components must be in Dataverse, which means that the sync template must be configured for everything else to work. The sync flows run daily overnight. When you first set up the CoE Starter Kit, you can manually start the Admin \| Sync Template v3 flow, which will start the process of crawling and storing the information in Dataverse.

Set up the CoE Starter Kit by following these instructions:

- [Set up core components](setup-core-components.md)
- [Set up governance components](setup-governance-components.md)
- [Set up nurture components](setup-nurture-components.md)
- [Set up the CoE Power BI dashboard](setup-powerbi.md)
- [Set up theming components](setup-theming.md)

## Production vs Dataverse for Teams environment

The CoE Starter Kit can be used in both Production environments and Dataverse for Teams environments. Where you install it will depend on your organization setup, your adoption of Microsoft Power Platform so far and what you want to achieve with the CoE Starter Kit. Before you decide, compare [Dataverse vs Dataverse for Teams](/powerapps/teams/data-platform-compare) and review the impact on CoE Starter Kit features based on where you install it:

| Feature | Dataverse for Teams environment | Production environment |
| --- | --- | --- |
| Syncing inventory to Dataverse tables | Yes, will require a Power Automate Per User/Per Flow license due to [action request limits and pagination settings](/power-automate/limits-and-config) | Yes, will require a Power Automate Per User/Per Flow license due to [action request limits and pagination settings](/power-automate/limits-and-config)|
| Collecting telemetry information from the Audit Log | No | Yes
| Power Platform Admin View to view and filter resources | Canvas App | Model Driven App |
| Power BI Dashboard | Yes | Yes |
| Canvas Apps part of Core Components (DLP Editor, Set App, and Flow Permission Apps) | Yes | Yes |
| Apps and Flows part of Governance Components | Yes | Yes |
| Apps and Flows part of Nurture Components | Yes | Yes |
| Sharing the Developer Compliance Center with makers | Share with colleagues who have a Microsoft 365 license in Teams | Sharing requires users to have a Power Apps Per User or Per App License |
| Sharing the App Catalog app | Share with colleagues who have a Microsoft 365 license in Teams | Sharing requires users to have a Power Apps Per User or Per App License |
| Sharing the Training in a day app | Share with colleagues who have a Microsoft 365 license in Teams | Sharing requires users to have a Power Apps Per User or Per App License |

## Extending the starter kit

When you're ready to extend the CoE Starter Kit with your own ideas, you'll do so by making modifications to the solution components in your own unmanaged solution:

1. Read about solutions in our documentation, which will introduce you to the concepts in addition to notions like how to create your publisher. More information: [Introduction to solutions](/powerapps/developer/common-data-service/introduction-solutions)

1. Create a new unmanaged solution. Environment variables that are part of the CoE Starter Kit can only be used from solutions. If you save a copy of apps or flows outside of a solution, environment variables will not get picked up.

1. Choose components from the CoE Starter Kit to add to your new solution. You decide which ones you want to customize.

1. Extend the CoE Starter Kit by making modifications to the solution components in the context of your new unmanaged solution.

  > [!NOTE]
  > It's currently not possible to extend canvas apps or flows. If you want to make customizations to apps and flows, create a copy add them to your unmanaged solution.
  > Editing apps and flows in the managed solution will prevent you from getting changes during an upgrade. See [Installing updates](#installing-updates).

1. Deploy your solution to test and production. We recommend making modifications and installing updates pushed by our team to the solution in a development environment dedicated to this kit, and hosting a production environment that has the real data. If data is being accessed and contributed by other users, it's a good idea to have separate development, test, and production environments.

## Installing updates

The CoE Starter Kit is updated monthly with new features, bug fixes, or optimizations. These updates will be announced as a [release](https://github.com/microsoft/coe-starter-kit/releases) on the [GitHub repo](https://aka.ms/CoEStarterKitRepo), and can be downloaded from there or by direct download at [aka.ms/CoEStarterKitDownload](https://aka.ms/CoEStarterKitDownload).

Install the updates by importing the latest version to the environment where you originally installed the solution. Select **Upgrade** (the default) to update the solution.

> [!NOTE]
> If you have made any changes to the flows / apps in the solution they will not receive updates until you remove that unmanaged layer.
> For every flow/app that you changed and for every child flow, go to the solution layers and remove it.
> ![Upgrade 1.](media/Upgrade1.png "Upgrade 1")
> ![Upgrade 2.](media/Upgrade2.png "Upgrade 2")

## It looks like I found a bug with the app; where should I go?

To file a bug against the solution, go to [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
