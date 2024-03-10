---
title: "Unified admin experience for finance and operations apps (preview)"
description: "Overview of unified admin experiences for finance and operations apps customers in the Power Platform admin center."
author: laneswenka
ms.topic: overview
ms.date: 2/26/2024
ms.subservice: admin
ms.author: laswenka
ms.reviewer: sericks
---

# Unified admin experience for finance and operations apps (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

Users of finance and operations apps can now administer their environments, policies, licensing, and capacity in the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

As part of the unification of admin experiences of finance and operations apps within Power Platform, the environment for finance and operations apps is now an application within Power Platform. Therefore, multiple Dynamics 365 applications, such as Sales, Marketing, finance and operations, and apps, flows, and websites in Power Platform can be installed and hosted in the same Power Platform environment [with a Dataverse database](/power-platform/admin/create-environment#create-an-environment-with-a-database). This unification provides a consistent and single set of lifecycle operations that an admin can perform across all artifacts.

:::image type="content" source="media/one-admin-journey.png" alt-text="Screenshot that shows the unified admin experience for finance and operations apps.":::

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.

This article gives an overview to finance and operations apps administrators who are new to the Power Platform admin center. Learn some key differences between your prior admin center called Lifecycle Services and the new experience. You can also browse more resources and articles that provide detailed information for common tasks.

To learn more about the admin unification journey, watch this video on the Microsoft Dynamics 365 Community channel on YouTube: [Video: Unified admin experience for finance and operations apps](https://www.youtube.com/embed/VPQSmtgzfjM).

## How do finance and operations apps surface in the Power Platform admin center?

There are no new environment types in the Power Platform admin center. We integrated the finance and operations apps into the Power Platform fabric.

You can deploy the finance and operations apps within the Power Platform admin center in one of two ways.

### Option A: Create a new environment through templates

When you create a new environment in the Power Platform admin center, you can add a Dataverse database and enable Dynamics 365 apps. You see a list of environment app templates that becomes available under **Automatically deploy these apps**. This list is a group of applications preinstalled on a Dataverse database.  

:::image type="content" source="media/new-environment-template.png" alt-text="Environment templates":::

This list is dynamic, so you only see references to **Finance**, **Supply Chain Management**, **Commerce**, **Project Operations**, and other finance and operations apps based on the license of the admin creating the environment. For step-by-step instructions, see [Tutorial: Provision a new environment with an ERP-based template](./tutorial-deploy-new-environment-with-ERP-template.md).

### Option B: Install the provisioning app on an existing environment

You can install finance and operations apps on an existing Power Platform environment with a Dataverse database. Select an environment, navigate to the **Resources** > **Dynamics 365 apps** page, and select the **Dynamics 365 Finance and Operations Provisioning App**.

:::image type="content" source="media/install-provisioning-app.png" alt-text="Install provisioning app":::

For step-by-step instructions, see [Tutorial: Install the Finance and Operations Provisioning App](./tutorial-install-finance-operations-provisioning-app.md).

With either option, your environment has two runtime URLs:

- One for customer engagement apps (**Environment URL**)
- One for finance and operations apps (**Finance and Operations URL**)

:::image type="content" source="media/environment-urls.png" alt-text="Screenshot that shows two URLs for customer engagement and finance and operations apps in your environment.":::

## Transition from an environment-slot purchasing model to a capacity-based model

When you purchase a license for any finance and operations app, such as Dynamics 365 Finance or Dynamics 365 Supply Chain Management, your tenant is entitled to 60 GB of operations database capacity and an additional 10 GB of Dataverse database capacity. With each user license, you receive an incremental amount of both operations and Dataverse database capacity.

:::image type="content" source="media/PPI-Capacity.png" alt-text="Capacity view in Power Platform admin center":::

A license is required to create or install any finance and operations app in the Power Platform admin center. You must also have at least 1 GB available of both operations and Dataverse database capacity to provision one more environment. There are no strict limits on how many environments you can create. Lifecycle Services is different, where each sandbox and production environment slot has a predetermined purchase.

As part of the capacity-based model, sandbox and production environments are given the same level of compute performance. This capacity is based on the number of user licenses purchased and dynamically scales up or down as your license quantities adjust.

## Development reimagined

Previously, Administrators in Lifecycle Services were accustomed to setting up an Azure subscription early in their implementation project. Once established, admins could deploy one or many developer virtual machines (VMs) hosted in Azure that were an all-in-one configuration with SQL Server, the Application Object Server, Visual Studio and the developer tools, the X++ source code, and more. While simple to deploy, these VMs were costly in addition to the purchase of licenses. The VMs became limited in their ability to use the full platform and connection to Dataverse that the sandbox and production environment types enjoyed.

With the unified experience, customers no longer deploy all-in-one VMs. Instead, you can:

1. Download Power Platform and X++ developer tools on a computer with Visual Studio installed.
1. Build new solutions that span the entire platform set of capabilities.
1. Deploy solutions to a sandbox environment provisioned through the Power Platform admin center.  

## Terminology differences between Lifecycle Services and Power Platform admin center

The following table is a reference for each operation type and explains any nuances between the two environment lifecycle operations.

| Lifecycle operation | Lifecycle Services terminology | Power Platform terminology | Comments |
| ----------- | ----------- |----------- |----------- |
| Create | Deploy | Provision | Not applicable |
| Copy | Database refresh | Copy | In Power Platform, code is always copied with data, giving a full copy of the source environment. However, Lifecycle Services only copy data. |
|Backup | Database export | Backup (custom or system-defined)| In Power Platform, a backup is kept in the cloud and never downloaded as a SQL `.bak` or `.bacpac` file. |
| Restore | Point-in-time restore | Restore (custom or system-defined)| Not applicable |
| Reset | Not applicable | Reset| This operation isn't yet implemented for environments where **Dynamics 365 Finance and Operations Provisioning App** is installed. |
| Convert to production | Not applicable | Convert to production | This operation isn't yet implemented for environments where **Finance and Operations Provisioning App** is installed. |
| Delete | Deallocate/delete | Delete | Restoring a deleted environment where **Dynamics 365 Finance and Operations Provisioning App** is installed isn't yet implemented. |

## Tutorials and helpful articles

These continually updated scenario tutorials give a walkthrough for administrators in new experiences.

- [Tutorial: Provision a new environment with an ERP-based template (preview)](./tutorial-deploy-new-environment-with-ERP-template.md)
- [Tutorial: Copy a Lifecycle Services environment to a unified environment (preview)](./tutorial-copy-lifecycle-services-environment-unified-environment.md)
- [Unified admin trials (preview)](admin-trials.md)
- [Manage storage and capacity](../finance-operations-storage-capacity.md)

### Known limitations during preview

As part of the preview, there are a few limitations soon to be removed, so check back often to determine their resolution.

- The environment templates don't include Project Operations.
- The environment name can't exceed 20 characters—a limitation on the finance and operations runtime.

### Frequently asked questions for the public preview

We continue to publish common questions and resolve open items before making the experience generally available (GA).

#### I don't know what licenses I have assigned

You can view the licenses assigned to you at [My Account - Subscriptions](https://portal.office.com/account/?ref=MeControl#subscriptions).

View the templates that allow you to deploy: [Tutorial: Provision a new environment with an ERP-based template (preview)](tutorial-deploy-new-environment-with-ERP-template.md#knowing-which-template-to-provision).

#### I don't have any available capacity

- All Power Platform environments require Dataverse capacity to deploy.

- Finance and operations apps experiences require both Dataverse and Operations database capacities to be available to deploy. You can review the [storage capacity deficit](../finance-operations-storage-capacity.md#address-a-storage-capacity-deficit).

- To reduce capacity, review your sandboxes for clean-up or removal.

> [!NOTE]
> We're building a new type of copy operation in the Power Platform admin center that truncates all transactional tables during the copy. The resulting environment is as small as possible without sacrificing critical module configurations or master data. You can then use Data Import/Export Framework (DIXF) to copy over a limited set of transactions for testing purposes. When this new copy operation is available, we'll update this FAQ with details on how to use it.

#### How do I access SQL for these environments?

Direct SQL access isn't available at this time. However, we're working on a just-in-time access approach similar to what's available earlier using Lifecycle Services. When this approach becomes available, we'll update this FAQ with details on how to use it.

### Related articles

- [Unified developer experience for finance and operations apps (preview)](../../developer/unified-experience/finance-operations-dev-overview.md)
- [Finance and operations apps documentation](/dynamics365/fin-ops-core/fin-ops/)  
- [Create and manage environments in the Power Platform admin center](/power-platform/admin/create-environment)  
- [Manage Dynamics 365 apps](/power-platform/admin/manage-apps)  
