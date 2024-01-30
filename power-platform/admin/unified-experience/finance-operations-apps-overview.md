---
title: "Unified admin experience for finance and operations apps (preview)"
description: "Overview of unified admin experiences for finance and operations apps customers in Power Platform admin center"
author: laneswenka
ms.topic: overview
ms.date: 09/29/2023
ms.subservice: admin
ms.author: laswenka
ms.reviewer: sericks
---

# Unified admin experience for finance and operations apps (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

Users of finance and operations apps can now administer their environments, policies, licensing, and capacity in the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

As part of the unification of admin experiences of finance and operations apps within Power Platform, the environment for finance and operations apps is now considered as an application within Power Platform. This means that multiple Dynamics 365 applications (such as Sales, Marketing, finance and operations) and apps, flows, and websites in Power Platform can be installed and hosted on the same Power Platform environment [with a Dataverse database](/power-platform/admin/create-environment#create-an-environment-with-a-database), providing a consistent and single set of lifecycle operations that an admin can perform across all of these artifacts.

:::image type="content" source="media/one-admin-journey.png" alt-text="Unified admin experience for finance and operations apps":::

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.

This article provides an overview to finance and operations apps administrators who are new to the Power Platform admin center. Learn some key differences between your prior admin center called Lifecycle Services and the new experience along with links to more resources and articles that provide detailed information for common tasks.

To learn more about the admin unification journey, watch the following video on Microsoft Dynamics 365 Community channel on YouTube: [Video: Unified admin experience for finance and operations apps](https://www.youtube.com/embed/VPQSmtgzfjM)

## How will finance and operations apps surface in the Power Platform admin center?

You won't see any new environment types in the Power Platform admin center. We have integrated the finance and operations apps into the Power Platform fabric.

You can deploy the finance and operations apps within the Power Platform admin center in one of the following two ways:

- **Option A: Create a new environment through templates**: When you create a new environment in the Power Platform admin center, you have the option to add a Dataverse database and enable Dynamics 365 apps. When you choose these two options, a list of environment app templates becomes available in the **Automatically deploy these apps** list, which is a group of applications preinstalled on a Dataverse database.  

  :::image type="content" source="media/new-environment-template.png" alt-text="Environment templates":::

  This list is dynamic so you only see references to **Finance**, **Supply Chain Management**, **Commerce**, **Project Operations** and other finance and operations apps based on the license assigned to the admin creating the environment.

- **Option B: Install the provisioning app on an existing environment**: You can install finance and operations apps on an existing Power Platform environment with a Dataverse database. Select an environment, navigate to the **Resources** > **Dynamics 365 apps** page, and select the **Dynamics 365 Finance and Operations Provisioning App**.

  :::image type="content" source="media/install-provisioning-app.png" alt-text="Install provisioning app":::

  > [!IMPORTANT]
  > For this option to work, the environment must have been created with the **Enable Dynamics 365 apps** toggle turned on. This toggle ensures that the environment was created with the underlying schema required by the Dynamics 365 apps.

In either approach, notice that your environment has two runtime URLs: one for the customer engagement apps (**Environment URL**) and another for finance and operations apps (**Finance and Operations URL**).

:::image type="content" source="media/environment-urls.png" alt-text="Two URLs for customer engagement and finance and operations apps in your environment":::

## Transition from an environment-slot purchasing model to a capacity-based model

When you purchase a license for any finance and operations app, such as Dynamics 365 Finance or Dynamics 365 Supply Chain Management, your tenant is entitled to 60 GB of operations database capacity and an additional 10 GB of Dataverse database capacity. Additionally, for each user license that you purchased, you receive an incremental amount of both Operations and Dataverse database capacity.

:::image type="content" source="media/PPI-Capacity.png" alt-text="Capacity view in Power Platform admin center":::

A license is required to create or install any finance and operations app in the Power Platform admin center. You must also have at least 1 GB available of both Operations and Dataverse database capacity to provision one more environment.  Beyond that, there are no strict limits on how many environments you can create. This differs from Lifecycle Services where each sandbox and production environment slot had a predetermined purchase.

As part of the capacity-based model, all environments are given the same level of compute performance, whether they're sandbox or production environments.  This is based on the number of user licenses purchased and it dynamically scales up or down as your license quantities adjust.

## Development reimagined

Administrators in Lifecycle Services were accustomed to setting up an Azure subscription early in their implementation project. Once established, admins could deploy one or many developer virtual machines (VMs) hosted in Azure that were an all-in-one configuration with SQL Server, the Application Object Server, Visual Studio and the developer tools, the X++ source code, and more.  While simple to deploy, these VMs represented cost in addition to the purchase of licenses, and also were becoming more limited in their ability to use the full platform and connection to Dataverse that sandbox and production environment types enjoyed.

With the unified experience, customers no longer deploy all-in-one VMs.  Instead, you can download the Power Platform and X++ developer tools on a computer with Visual Studio installed. Next, you can build new solutions that span the entire platform set of capabilities, and then deploy those to a sandbox environment that is provisioned through the Power Platform admin center.  

## Terminology differences between Lifecycle Services and Power Platform admin center

When it comes to environment lifecycle operations, there are some terminology and technical differences between similar activities that admins perform in the two different admin centers. The table below is a quick reference for each operation type and explains any nuances between the two experiences.

| Lifecycle operation | Lifecycle Services terminology | Power Platform terminology | Comments |
| ----------- | ----------- |----------- |----------- |
| Create | Deploy | Provision | Not applicable |
| Copy | Database refresh | Copy | In Power Platform, code is always copied along with the data, giving a full copy of the source environment.  This differs from Lifecycle Services that only copied data. |
|Backup | Database export | Backup (custom or system-defined)| In Power Platform, a backup is kept in the cloud and never downloaded as a SQL .bak or .bacpac file. |
| Restore | Point-in-time restore | Restore (custom or system-defined)| Not applicable |
| Reset | Not applicable | Reset| This operation isn't yet implemented for environments where **Dynamics 365 Finance and Operations Provisioning App** is installed. |
| Convert to production | Not applicable | Convert to production | This operation isn't yet implemented for environments where **Finance and Operations Provisioning App** is installed. |
| Delete | Deallocate/delete | Delete | Restoring a deleted environment where **Dynamics 365 Finance and Operations Provisioning App** was installed isn't yet implemented. |

## Tutorials and helpful articles

The following list of continually updated scenario tutorials provides a walkthrough for administrators in these new experiences.

- [Tutorial: Provision a new environment with an ERP-based template (preview)](./tutorial-deploy-new-environment-with-ERP-template.md)
- [Tutorial: Copy a Lifecycle Services environment to a unified environment (preview)](./tutorial-copy-lifecycle-services-environment-unified-environment.md)
- [Unified admin trials (preview)](admin-trials.md)
- [Manage storage and capacity](../finance-operations-storage-capacity.md)

### Known limitations during preview

As part of the preview, there are a few known limitations of functionality that Microsoft is looking to address. These limitations will soon be removed, so please check back often to determine their resolution.
- The environment templates don't include Project Operations. This will soon be resolved.
- The environment name cannot exceed 20 characters. This is a limitation on the finance and operations runtime that will soon be removed.

### Frequently asked questions from the public preview

Below are a set of common questions and their related answers that we have received as part of the public preview.  We will continue to publish these and resolve open items before making the experience generally available.

#### I don't know what licenses I have assigned

You can view the licenses assigned to you at [My Account - Subscriptions](https://portal.office.com/account/?ref=MeControl#subscriptions). To see which templates this allows you to deploy, visit [Tutorial: Provision a new environment with an ERP-based template (preview)](tutorial-deploy-new-environment-with-ERP-template.md#knowing-which-template-to-provision).

#### I don't have any available capacity

All Power Platform environments require Dataverse capacity to deploy. In addition, finance and operations apps experiences require both Dataverse and Operations database capacities to be available to deploy. You can review the [storage capacity deficit](../finance-operations-storage-capacity.md#address-a-storage-capacity-deficit).

One of the best ways to reduce capacity is to review your sandboxes and see which can be cleaned up or removed.  We're  also building a new type of copy operation in the Power Platform admin center that will truncate all of the transactional tables during the copy so that the resulting environment is as small as possible without sacrificing critical module configurations or master data. You can then use Data Import/Export Framework (DIXF) to copy over a limited set of transactions for testing purposes. When this new copy operation is available, we will update this FAQ with details on how to use it.

#### How do I access SQL for these environments?

Direct SQL access is not available at this time; however, we're working on providing a just-in-time access approach similar to what has been available earlier using Lifecycle Services. When this becomes available, we will update this FAQ with details on how to use it.

### Related articles

- [Unified developer experience for finance and operations apps (preview)](../../developer/unified-experience/finance-operations-dev-overview.md)
- [Finance and operations apps documentation](/dynamics365/fin-ops-core/fin-ops/)  
- [Create and manage environments in the Power Platform admin center](/power-platform/admin/create-environment)  
- [Manage Dynamics 365 apps](/power-platform/admin/manage-apps)  

