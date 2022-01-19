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

- The identity with which to install and run the solutions.
- The environment type to use for your solutions.
- All pre-requisites needed to use the CoE Starter Kit.

It will also help you understand how to extend the CoE Starter Kit, how to apply upgrades and where to post issues.

## What identity should I install the CoE Starter Kit with?

The CoE Starter Kit requires access to your tenants Power Platform environments. Therefore, the identity you set up for the CoE Starter Kit needs the following:

- [Microsoft Power Platform service admin](/power-platform/admin/use-service-admin-role-manage-tenant#power-platform-administrator), global tenant admin, or Dynamics 365 service admin.
- Power Apps Per User license (non trial), and Microsoft 365 license.
- The identity must be email enabled.
- If you would like to collect telemetry information, such as app launches, unique users per app, the identity must have access to the [Microsoft 365 audit log](/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance#before-you-search-the-audit-log)

These roles and licenses must be available to this user continuously; if admin access is granted only temporarily via [Privileged Identity Management (PIM)](/azure/active-directory/privileged-identity-management) this will not be sufficient to run the CoE Starter Kit.

Additionally, if you would like to share the [Power BI report](power-bi.md) that is part of the CoE Starter Kit, this identity needs to have the Power BI Pro license.  

## How will you communicate with your admins, makers, and end users?

You should consider how you will communicate with different groups of people before you start the set-up.  

In particular, consider the following:

- **Admin persona**
  - Power Platform admins to communicate with each other.
  - Power Platform admins to be contacted by your Power Platform makers.
- **Maker persona**
  - Power Platform makers to be contacted by Power Platform admins.
  - Power Platform makers to communicate with each other.
- **User persona**
  - Power Platform users to be contacted by Power Platform admins.

We recommend using three [Microsoft 365 groups](/microsoft-365/admin/create-groups/compare-groups#microsoft-365-groups) for this, one for each persona. This group type is an email enabled security group and can be associated with a Microsoft team for collaboration between the people in the group.  

## Prepare your environment

### Decide what environment type to use (production or Dataverse for Teams)

The CoE Starter Kit can be used in both production environments and Dataverse for Teams environments. Where you install it will depend on your organization set-up, your adoption of Microsoft Power Platform so far, and what you want to achieve with the CoE Starter Kit. Before you decide, compare [Dataverse vs Dataverse for Teams](/powerapps/teams/data-platform-compare) and review the impact on CoE Starter Kit features based on where you install it.

> [!IMPORTANT]
> The Governance and Nurture solution of the CoE Starter Kit have a dependency on the Core solution and need to be installed in the same environment.

| Feature | Dataverse for Teams environment | Production environment |
| --- | --- | --- |
| Syncing inventory to Dataverse tables | Yes, will require a Power Automate Per User/Per Flow license due to [action request limits and pagination settings](/power-automate/limits-and-config) | Yes, will require a Power Automate Per User/Per Flow license due to [action request limits and pagination settings](/power-automate/limits-and-config)|
| Data capacity | 2GB | Unlimited through capacity purchases |
| Collecting telemetry information from the audit log | No | Yes
| Power Platform admin view to view and filter resources | Canvas app | Model-driven app |
| Power BI Dashboard | Yes | Yes |
| Canvas apps part of core components (DLP Editor, set app, and flow permission apps) | Yes | Yes |
| Apps and flows part of governance components | Yes | Yes |
| Apps and flows part of nurture components | Yes | Yes |
| Sharing the Developer Compliance Center with makers | Share with colleagues who have a Microsoft 365 license in Teams | Sharing requires users to have a Power Apps Per User or Per App license |
| Sharing the App Catalog app | Share with colleagues who have a Microsoft 365 license in Teams | Sharing requires users to have a Power Apps Per User or Per App license |
| Sharing the Training in a day app | Share with colleagues who have a Microsoft 365 license in Teams | Sharing requires users to have a Power Apps Per User or Per App license |
| Power BI Dashboard | Yes | Ye, using the [Dataverse](/powerapps/maker/data-platform/data-platform-powerbi-connector#connect-to-dataverse-using-the-connector) connector only |
| Power BI Dashboard | Yes | Yes, using the [Dataverse](/powerapps/maker/data-platform/data-platform-powerbi-connector#connect-to-dataverse-using-the-connector) connector only |
| Data Permissions | Team members have full access, and [pre-built table permissions](/powerapps/teams/set-perms-and-share#assign-table-permissions) can be applied to colleagues with access | Granular permissions through [Dataverse security roles](/security-roles-privileges) that can be tailored to your requirements |
| Sharing apps | Share with colleagues who have a Microsoft 365 license in Teams | Sharing requires users to have a Power Apps Per User or Per App license |
| Accessing apps | Apps can only be accessed within Microsoft Teams | Apps can be viewed in the browser or mobile app |

### Create your environment

If you decide to use a production environment:

- [Create an environment with a database](/admin/create-environment#create-an-environment-with-a-database).
- Do not add sample apps and data sets.
- Do not restrict environment access with a security group as some parts of the CoE Starter Kit use [approval actions](/power-automate/get-started-approvals) and require makers to be able to interact with the environment.

If you decide to use a Dataverse for Teams environment:

- Decide which team to add the CoE Starter Kit solution to or [create a new team](https://support.microsoft.com/office/create-a-team-from-scratch-174adf5f-846b-4780-b765-de1a0a737e2b).
- [Install the Power Apps personal app in Microsoft Teams](/powerapps/teams/install-personal-app).
- [Create your first app](/powerapps/teams/create-first-app). At least one app is required in the environment to enable the solution import experience.

### Validate data loss prevention (DLP) policies

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
> The CoE Starter Kit collects information on who owns a resource, such as an app or a flow. If the resource is owned by an interactive user, the [Office 365 Users](/connectors/office365users/) connector is used to get those details. If the resource is owned by a service principal (application user), the [HTTP with Azure AD](/connectors/webcontents/) connector is used to make a call to [Microsoft Graph](https://developer.microsoft.com/graph) to get the name of the application user to correctly mark ownership of resources and avoid resources being marked as orphaned (without an owner).

- The HTTP and HTTP with Azure AD connectors connect to [https://graph.microsoft.com](https://developer.microsoft.com/graph). You can set up [DLP endpoint filtering](/admin/dlp-granular-controls#endpoint-filtering) for these connectors to only allow the [https://graph.microsoft.com](https://developer.microsoft.com/graph) endpoint. If your tenant is in GCC, GCC High or DoD check your [service root endpoint for Microsoft Graph](/graph/deployments#microsoft-graph-and-graph-explorer-service-root-endpoints).

- If you're using the [audit log](setup-auditlog.md) solution, the custom connector used to connect to the Microsoft 365 audit log also must be allowed in your business group. Configure the [https://manage.office.com/](/office/office-365-management-api/office-365-management-apis-overview) endpoint in the business group of your tenant-level policy. Learn more: [Configure custom connector endpoints in tenant-level policies](/power-platform/admin/dlp-connector-classification#tenant-level-dlp-policies).

- Check that no other DLP policies apply to this environment. Learn more: [Combined effect of multiple DLP policies](../../admin/dlp-combined-effect-multiple-policies.md) 

- If you're using the [ALM Accelerator for Makers](almaccelerator-components.md) components, the environment must have a DLP policy that allows [Dataverse](/connectors/commondataservice/), [Office 365 Outlook](/connectors/office365/), [Power Apps for Makers](/connectors/powerappsforappmakers/), [Approvals](/connectors/approvals/), [GitHub](/connectors/github/) [Power Platform for Admins](/connectors/powerplatformforadmins/) to be used together. Those connectors must be in the business data&ndash;only bucket of the DLP policy for this environment.

## Download the solution

- Downloaded the CoE Starter Kit solution and Power BI dashboard files to your device. The entire content package can be downloaded directly at [aka.ms/CoEStarterKitDownload](https://aka.ms/CoEStarterKitDownload).

- Both the governance components and nurture components solutions require the core solution before they can be installed.

> [!div class="nextstepaction"]
> [Next step: Set up inventory components](setup-core-components.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
