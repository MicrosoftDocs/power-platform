---
title: "Set up Archive components | MicrosoftDocs"
description: "Learn how to set up the governance components of the CoE Starter Kit"
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/06/2021
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

# Set up Archive components

This article will help you to setup the Archive components of the Governance solution.

>[!NOTE]
>Although the flows are called **archive** flows, they do not automatically archive apps and flows. Instead, they ask makers to backup and archive their apps and flows.

This set of functionality allows you to detect unused objects and ask makers to either archive or unshare them to keep your tenant tidy.

>[!IMPORTANT]
>This article assumes you have [installed the governance components solution](before-setup-gov.md) and you have your environment setup, and are logged in with the correct identity.

## Grant makers environment access

If your solution is installed in a Production environment, make sure your enviornment is not restricted with an [environment security group](limitations.md#security-groups-and-approvals).

If your solution is installed in a Dataverse for Teams environment, you first need to grant makers that are not part of your Microsoft Team access to the environment so they can participate in approval workflows. [Share an app in Teams Environment](internal link) with your [Power Platform Maker group](). 

## Configure mandatory environment variables

This step will be completed after you import the solution. Environment variables are used to store application and flow configuration data. This means that you only have to set the value once per environment and it will be used in all necessary flows and apps in that environment..

>[!TIP]
>Learn how to update environment variables for Production and Dataverse for Teams environments: [Update Environment Variables](faq.md#update-environment-variables).

| Name | Description |
|------|---------------|
| Approval Admin | This is separate from the Admin Email env var because you cannot use a distribution list for approvals. This env var holds the individual or shared account as a result who will be charged with approving removal of unused orphaned objects. 
| Cleanup Old Objects App URL | (Optional) Link to the Cleanup Old Objects canvas app included in this solution. If included, communication about old objects which are considered no longer useful will include the link to make cleanup easier. To collect the URL: [Get App URL – Production Environment](internal link) [Get App URL – Teams Environment](internal link) |
| Flow Approvals URL | (Optional) Link to Power Automate's Approval page for your CoE Environment. If included, communication about old objects which are considered no longer useful will include the link to make cleanup easier. To get the URL Browse to flows.microsoft.com for your CoE Environment > Action Items > Approvals. URL should end in **approvals/received** |  

## Exempt environments from the compliance process

There are some environments that you may want to exempt from the archive process - this could be dedicated environments that are already well managed. Learn more: [Establishing an environment strategy](/adoption/environment-strategy)

You can exempt environments from the archive process using the Power Platform Admin View app.  

### Production environment

If your solution is installed in a Production Environment, your app will be a model driven app.  

1. Go to [make.powerapps.com](<https://make.powerapps.com>).
1. Go to your CoE environment.
1. Open the **Power Platform Admin View** app.
1. Select Environments > Chose the environment you want to exempt > Set the **Excuse From Archival Flows** field to Yes > **Save**

## Dataverse for Teams environment

1. Open to the Power Apps app in Teams, select **Build**, and select the Team you have installed the CoE Starter Kit solutions in.
1. Select **Center of Excellence - Core for Teams > See All**.
1. Open the **Power Platform Admin View** app.
1. Select Environments > Chose the environment you want to exempt > Set the **Excuse From Archival Flows** field to Yes > **Save**.

## Turn on flows

Turn on these flows which are installed as part of the **Governance components** solution:

- Admin | Setup | Ignored Archival Requests
- Admin | Archive and Clean Up v2 (Check Approval)
- Admin | Archive and Clean Up v2 (Clean Up and Delete)
- Admin | Archive and Clean Up v2 (Start Approval for Apps)
- Admin | Archive and Clean Up v2 (Start Approval for Flows)
- Admin | Email Managers Ignored Approvals

## Share apps with makers

The Governance Components solution contains the **Archival – Cleanup Unused Objects** app for makers and admins to manage archive approvals. Share this app with your makers and admins, assigning them the **Power Platform Maker SR** security role.

Consider adding this app to the **Maker - Command Center** for makers to easily find and access it.

## All environment variables

Here is the full list of environment variables that impact the compliance process, including environment variables with Default values.

>[!IMPORTANT]
> You don't have to change the values during setup, just when you need to change the value of an environment variable that you configured during import or when you want to change a default value. Re-start all flows after you change environment variables, to make sure the latest value is picked up.

Environment variables are used to store application and flow configuration data with data specific to your organization or environment.

| Name | Description | Default Value |
|------|---------------|------|
| Approval Admin | This is separate from the Admin Email env var because you cannot use a distribution list for approvals. This env var holds the individual or shared account as a result who will be charged with approving removal of unused orphaned objects. | n/a |
| Auto Delete on Archive | Determines whether apps andd flows are deleted when they're approved for deletion in the following flow: Admin | App Archive and Clean Up - Check Approvals and Archive. Value must be Yes or No.  | Yes |
| Cleanup Old Objects App URL | (Optional) Link to the Cleanup Old Objects canvas app included in this solution. If included, communication about old objects which are considered no longer useful will include the link to make cleanup easier. To collect the URL: [Get App URL – Production Environment](internal link) [Get App URL – Teams Environment](internal link) | n/a |
| Flow Approvals URL | (Optional) Link to Power Automate's Approval page for your CoE Environment. If included, communication about old objects which are considered no longer useful will include the link to make cleanup easier. To get the URL Browse to flows.microsoft.com for your CoE Environment > Action Items > Approvals. URL should end in **approvals/received** |  n/a |
| ProductionEnvironment | Set to No if you have installed the solution for development/test purposes. This will send approvals to the admin email instead of the maker. | Yes |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
