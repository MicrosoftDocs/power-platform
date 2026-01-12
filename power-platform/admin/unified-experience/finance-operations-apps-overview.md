---
title: Overview of unified admin experience for finance and operations apps
description: Overview of unified admin experiences for finance and operations apps customers in the Power Platform admin center.
author: laneswenka
ms.topic: overview
ms.date: 11/06/2025
ms.subservice: admin
ms.author: laswenka
ms.reviewer: sericks
ms.custom: sfi-image-nochange
contributors:
  - aarsh-msft
---

# Overview of unified admin experience for finance and operations apps

Users of finance and operations apps can now administer their environments, policies, licensing, and capacity in the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

As part of the unification of admin experiences of finance and operations apps within Power Platform, the environment for finance and operations apps is now an application within Power Platform. In this new experience, multiple Dynamics 365 applications, such as Sales, Marketing, and finance and operations apps, and also low-code apps, flows, and websites can be installed and hosted in the same Power Platform environment [with a Dataverse database](/power-platform/admin/create-environment#create-an-environment-with-a-database). This unification provides a consistent and single set of lifecycle operations that an admin can perform across all artifacts in a particular environment.

:::image type="content" source="media/one-admin-journey.png" alt-text="Screenshot of the unified admin experience for finance and operations apps.":::

This article gives an overview to finance and operations apps administrators who are new to the Power Platform admin center. Learn some key differences between your prior admin center called Microsoft Dynamics Lifecycle Services and the new experience. You can also browse more resources and articles that provide detailed information for common tasks.

To learn more about the admin unification journey, see the [Power Platform admin center integration with Lifecycle Services (LCS) TechTalk](https://www.youtube.com/watch?v=HmJIuHhx3Hg).

## How do finance and operations apps surface in the Power Platform admin center?

Finance and operations apps now have the same behavior that other Dynamics 365 apps have within the Power Platform admin center. Licensed customers can access the apps both during new environment creation and when they're installed in an existing environment.  

You can deploy finance and operations apps within the Power Platform admin center in one of the following ways.

### Option A: Create a new environment through templates

A template is a bundle of Microsoft-published applications that are preinstalled in a Dataverse-based Power Platform environment. Templates help increase productivity, because you can quickly deploy an environment with a known configuration of apps without having to manually install each app in the correct sequence. When you use a template, you always get the latest version that is available for each app at that moment.

When you create a new environment in the Power Platform admin center, you can add a Dataverse data store and select **Enable Dynamics 365 apps**. A list of environment templates then becomes available under **Automatically deploy these apps**.

:::image type="content" source="media/new-environment-template.png" alt-text="Screenshot of environment templates.":::

This list is dynamic, so you only see references to **Finance**, **Supply Chain Management**, **Commerce**, **Project Operations**, and other finance and operations apps, based on the licenses assigned to the admin creating the environment. For step-by-step instructions, see [Tutorial: Provision a new environment with an ERP-based template](./tutorial-deploy-new-environment-with-ERP-template.md).

### Option B: Install the provisioning app on an existing environment

If you already have an environment that works with finance and operations apps, you can install the provisioning app instead of creating a separate environment that requires a complex integration. The environment you use must support Dynamics 365 apps. As part of the installation process, you can select any of the supported versions of finance and operations apps. This flexibility is helpful if you want to use a version that isn't the latest generally available version.

For step-by-step instructions, see [Tutorial: Install the Finance and Operations Provisioning App](./tutorial-install-finance-operations-provisioning-app.md).

With either option, your environment has two runtime URLs:

- One for customer engagement apps (**Environment URL**)
- One for finance and operations apps (**Finance and Operations URL**)

## Transition from an environment-slot purchasing model to a capacity-based model

When you purchase a license for any finance and operations app, such as Dynamics 365 Finance or Dynamics 365 Supply Chain Management, your tenant is granted various entitlements. These entitlements come in the form of storage measured in gigabytes (GB), as well as Power Platform Requests (PPR) which provide more computing power. The more user licenses you purchase, the more of each type of entitlement you receive. You can also purchase add-ons of either entitlement directly if you need more storage or more compute.

A license is required to create or install any finance and operations app in the Power Platform admin center. You must also have at least 1 GB available of both operations and Dataverse database capacity to provision one more environment. There are no strict limits on how many environments you can create. Lifecycle Services is different, where each sandbox and production environment slot has a predetermined purchase.

For more information on managing storage, go to [Finance and operations storage capacity](../finance-operations-storage-capacity.md).

## Development reimagined

Previously, administrators in Lifecycle Services set up an Azure subscription early in their implementation project. Once established, admins could deploy one or many developer virtual machines (VMs) hosted in Azure that were an all-in-one configuration with SQL Server, the Application Object Server, Visual Studio and the developer tools, the X++ source code, and more. While simple to deploy, these VMs were costly in addition to the purchase of licenses. The VMs were limited in their ability to use the full platform and connection to Dataverse that the sandbox and production environment types enjoyed.

With the unified experience, customers no longer deploy all-in-one VMs. Instead, you can:

1. Download Power Platform and X++ developer tools on a computer with Visual Studio installed.
1. Build new solutions that span the entire platform set of capabilities.
1. Deploy solutions to a sandbox environment provisioned through the Power Platform admin center.  

## Terminology differences between Lifecycle Services and the Power Platform admin center

The following table is a reference for each operation type and explains any nuances between the two environment lifecycle operations.

| Lifecycle operation | Lifecycle Services terminology | Power Platform terminology | Comments |
| ----------- | ----------- |----------- |----------- |
| Create | Deploy | Provision | Not applicable |
| Copy | Database refresh | Copy | In Power Platform, code is always copied with data, giving a full copy of the source environment. However, Lifecycle Services only copy data. |
| Backup | Database export | Backup (custom or system-defined)| In Power Platform, a backup is kept in the cloud and never downloaded as a SQL `.bak` or `.bacpac` file. |
| Restore | Point-in-time restore | Restore (custom or system-defined)| Not applicable |
| Reset | Not applicable | Reset| This operation isn't yet implemented for environments where **Dynamics 365 Finance and Operations Provisioning App** is installed. |
| Convert to production | Not applicable | Convert to production | This operation isn't yet implemented for environments where **Finance and Operations Provisioning App** is installed. |
| Delete | Deallocate/delete | Delete | Restoring a deleted environment where **Dynamics 365 Finance and Operations Provisioning App** is installed isn't yet implemented. |

## Lifecycle Services features not implemented in the Power Platform admin center

The following table lists features from Lifecycle Services that aren't implemented in the Power Platform admin center.

| Lifecycle Services feature | Implemented in Power Platform admin center | Comments |
|-------------|---------------------|----------|
| Methodology | No | Track phases and timelines in Dynamics Implementation portal or in Azure DevOps |
| Project settings and users | No | Dynamics Implementation portal | 
| Organization users | No | Microsoft 365 admin center | 
| Translation service | No | [Dynamics translation connector](/connectors/dynamicstranslations/) |
| Asset library | No | Store software packages in Azure DevOps and directly import to Dataverse. Database backups aren't provided for offline use. |
| Solution management | No | Microsoft Marketplace | 
| Build environments | No | Microsoft Hosted Agents in Azure DevOps |
| Alert service | No | Create a support ticket. | 
| Business process modeler | No | Business process catalog |
| Task recorder | No | Save files locally. |

## Tutorials and helpful articles

These continually updated scenario tutorials give a walkthrough for administrators in new experiences.

- [Tutorial: Provision a new environment with an ERP-based template](./tutorial-deploy-new-environment-with-ERP-template.md)
- [Tutorial: Copy a Lifecycle Services environment to a unified environment](./tutorial-copy-lifecycle-services-environment-unified-environment.md)
- [Unified admin trials](admin-trials.md)
- [Manage storage and capacity](../finance-operations-storage-capacity.md)

### Known limitations

- The environment name can't exceed 20 characters. This limitation applies to the finance and operations runtime.
- When installing the **Dynamics 365 Finance and Operations Provisioning App** through the Power Platform admin center on an existing organization, you may encounter an error if the organization is in an unsupported region or in an unsupported Azure region within a region. The error says, _The selected region does not support the FnO app deployment_. To avoid this error, you can request Microsoft to move the environment to a supported region via support ticket, or provision a new unified environment in a different supported region.

### Frequently asked questions

#### I don't know what licenses I have assigned

You can view the licenses assigned to you at [My Account - Subscriptions](https://portal.office.com/account/?ref=MeControl#subscriptions).

View the templates that allow you to deploy: [Tutorial: Provision a new environment with an ERP-based template](tutorial-deploy-new-environment-with-ERP-template.md#knowing-which-template-to-provision).

#### I don't have any available capacity

- All Power Platform environments require Dataverse capacity to deploy.

- Finance and operations apps experiences require both Dataverse and Operations database capacities to be available to deploy. You can review the [storage capacity deficit](../finance-operations-storage-capacity.md#address-a-storage-capacity-deficit).

- To reduce capacity, review your sandboxes for clean-up or removal.  You can also use [Transaction-less copy](tutorial-perform-transactionless-copy.md) to drastically reduce sandbox storage consumption.

#### How do I access SQL for these environments?

You can access the database in developer environments. Learn more in [Request credentials to product database](../../developer/unified-experience/finance-operations-product-db-access.md).

### Related articles

- [Unified developer experience for finance and operations apps](../../developer/unified-experience/finance-operations-dev-overview.md)
- [Finance and operations apps documentation](/dynamics365/fin-ops-core/fin-ops/)  
- [Create and manage environments in the Power Platform admin center](/power-platform/admin/create-environment)  
- [Manage Dynamics 365 apps](/power-platform/admin/manage-apps)
