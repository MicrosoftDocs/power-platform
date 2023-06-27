---
title: "Unified admin experience for finance and operations apps (preview)"
description: "Overview of unified admin experiences for Dynamics 365 finance and operations apps customers in Power Platform admin center"
author: laneswenka
ms.topic: overview
ms.date: 06/13/2023
ms.author: laswenka
---

# Unified admin experience for finance and operations apps (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

Users of Dynamics 365 finance and operations apps can now administer their environments, policies, licensing, and capacity in Power Platform admin center.

As part of the unification of admin experiences of finance and operations apps within Power Platform, the environment for finance and operations apps is now considered as an application within Power Platform. This means that multiple Dynamics 365 applications (such as Sales, Marketing, finance and operations) and apps, flows, and websites in Power Platform can be installed and hosted on the same Power Platform environment [with a Dataverse database](/power-platform/admin/create-environment#create-an-environment-with-a-database) providing a consistent and single set of lifecycle operations that an admin can perform across all of these artifacts.

:::image type="content" source="media/one-admin-journey.png" alt-text="Unified admin experience for Dynamics 365 finance and operations apps":::

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.

This article provides an overview to Dynamics 365 finance and operations apps administrators who are new to the Power Platform admin center. Learn some core concepts to help understand the key differences between your prior admin center Lifecycle Services (LCS) and the new experience along with links to more resources and articles that provide detailed information

To learn more the unified experience, watch the following video on Microsoft Dynamics 365 Community channel on YouTube: [Video: One Dynamics One Platform](https://www.youtube.com/embed/VPQSmtgzfjM)

## How finance and operations apps are referenced in the Power Platform admin center?

You won't see any new environment types in the Power Platform admin center; we have integrated the finance and operations apps into the Power Platform fabric.

You can access the finance and operations apps within Power Platform admin center in one of the following two ways:

- **Option A: Create a new environment through templates**: Whenever you create a new environment in the Power Platform admin center, you have the option to add a Dataverse database and enable Dynamics 365 apps. When you choose these two options, a list of environment app templates becomes available in the **Automatically deploy these apps** list, which is a group of applications preinstalled on a Dataverse database.  

  :::image type="content" source="media/new-environment-template.png" alt-text="Environment templates":::

  This list is dynamic so you'll only see references to **Finance**, **Supply Chain Management**, **Commerce**, **Project Operations** and other finance and operations apps based on the license assigned to the admin creating the environment.

- **Option B: Install the provisioning app on an existing environment**: You can also install finance and operations apps on an existing Power Platform environment with Dataverse database. This can be done by selecting an environment, navigating to the **Resources** > **Dynamics 365 apps** page, and selecting the **Dynamics 365 Finance and Operations Provisioning App**.

  :::image type="content" source="media/install-provisioning-app.png" alt-text="Install provisioning app":::

  > [!IMPORTANT]
  > For this option to work, the environment must have been created with the **Enable Dynamics 365 apps** toggle turned on. This toggle ensures that the environment was created with the underlying schema required by the Dynamics 365 apps.

In either approach, notice that your environment has two runtime URLs: one for the customer engagement apps (**Environment URL**) and another one for finance and operations apps (**Finance and Operations URL**).

:::image type="content" source="media/environment-urls.png" alt-text="Two URLs for customer engagement and finance and operations apps in your environment":::

## Transition from an environment-slot purchasing model to a capacity-based model

When you purchase a license for any finance and operations app, such as Dynamics 365 Finance or Dynamics 365 Supply Chain Management, your tenant is entitled to 60 GB of operations database capacity and an additional 10 GB of Dataverse database capacity. Additionally, for each user license that you purchased, you receive an incremental amount of both operations and Dataverse database capacity.

:::image type="content" source="media/PPI-Capacity.png" alt-text="Capacity view in Power Platform admin center":::

A license is required to create or install any finance and operations app in Power Platform admin center. You must also have at least 1 GB available of both operations and Dataverse database capacity to provision one more environment.  Beyond that, there are no strict limits on how many environments you can create unlike in LCS admin center were each Sandbox and Production environment slot was a predetermined purchase.

## Development reimagined

Administrators in LCS were accustomed to setting up an Azure subscription early in their implementation project. Once established, admins could deploy one or many developer virtual machines (VMs) hosted in Azure that were an all-in-one configuration with SQL Server, the Application Object Server, Visual Studio and the developer tools, the X++ source code, and more.  While simple to deploy, these VMs represented cost in addition to the purchase of licenses and also were becoming more limited in their ability to use the full platform and connection to Dataverse that Sandbox and Production environment types enjoyed.

With the unified experience, customers no longer deploy all-in-one VMs.  Instead, you can download the Power Platform and X++ developer tools on a computer with Visual Studio installed. Next, you can build new solutions that span the entire platform set of capabilities, and then deploy those to a Sandbox environment that is provisioned through Power Platform admin center.  

## Terminology differences between Lifecycle Services and Power Platform admin center

When it comes to environment lifecycle operations, there are some terminology and technical differences between similar activities that admins perform in the two different admin centers. The table below is a quick reference for each operation type and explains any nuances between the two experiences.

| Lifecycle operation | LCS terminology | Power Platform terminology | Comments |
| ----------- | ----------- |----------- |----------- |
| Create | Deploy | Provision | - |
| Copy | Database Refresh | Copy | In Power Platform, code is always copied along with the data giving a full copy of the source environment.  This differs from LCS that only copied data. |
|Backup | Database Export | Backup (Custom or System-defined)| In Power Platform, a backup is kept in the cloud and never downloaded as a SQL .bak or .bacpac file. |
| Restore | Point-in-time restore | Restore (Custom or System-defined)| - |
| Reset | Not applicable | Reset| This operation isn't yet implemented for environments where **Dynamics 365 Finance and Operations Provisioning App** is installed. |
| Convert to Production | Not applicable | Convert to Production | This operation isn't yet implemented for environments where **Finance and Operations Provisioning App** is installed. |
| Delete | Deallocate / Delete | Delete | Restoring a deleted environment where **Dynamics 365 Finance and Operations Provisioning App** was installed isn't yet implemented. |

## TO DO: Scenario tutorials

The following list of continually updated scenario tutorials provides a walkthrough for administrators in these new experiences.

- Provision a new environment with an ERP-based template
- Install **Dynamics 365 Finance and Operations Provisioning app** in an existing environment
- Add a developer user to an environment and connect to it with Visual Studio
- Set up a continuous integration and continuous deployment (CI/CD) build and release pipeline
- Manage storage and capacity

### Related articles

[Finance and operations apps documentation](/dynamics365/fin-ops-core/fin-ops/)<br/>
[Create and manage environments in the Power Platform admin center](/power-platform/admin/create-environment)<br/>
[Manage Dynamics 365 apps](/power-platform/admin/manage-apps)
