---
title: Create and manage environments in the Power Platform admin center | Microsoft Docs
description: Learn how to create and manage environments in the Power Platform admin center.
author: sericks007
ms.component: pa-admin
ms.topic: how-to
ms.date: 02/12/2025
ms.subservice: admin
ms.author: mbajwa
ms.reviewer: sericks
ms.contributors:
- pmantha
- mbajwa
search.audienceType: 
  - admin 
contributors:
  - marcelbf
  - iyanni
---

# Create and manage environments in the Power Platform admin center

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

An environment is a space to store, manage, and share your organization's business data, apps, and flows. An environment is a container to separate apps that might have different roles, security requirements, or target audiences. Power Apps creates a single default environment for each tenant that's shared by all users in that tenant.

## Who can create environments?

Your license determines if you can create environments.

To determine which license a user has, sign in to the [Microsoft 365 admin center](https://admin.microsoft.com) and follow the steps in [Assign licenses to multiple users](/office365/admin/manage/assign-licenses-to-users#assign-licenses-to-multiple-users) on the [Active users](https://admin.microsoft.com/AdminPortal/Home?#/users) page.

To create an environment, these requirements must be true:

1. The user has a license that allows environment creation. This requirement is waived for service administrators such as Power Platform admins and Dynamics 365 admins except for trial (standard) environments; see #2.c later.

   | License | Trial | Production |
   | --- | --- | --- | 
   | Microsoft 365 Plans |No | No |
   | Dynamics 365 Teams Plans   |No | No |
   | Power Apps Developer Plan   |No | No | 
   | Dynamics 365 trial | Yes (one) | No| 
   | Dynamics 365 Plans |Yes (one)| Yes | 
   | Power Apps plan |Yes (one)| Yes | 
   | Power Apps trial |Yes (one)| Yes | 
   | Power Automate plan |Yes (one)| Yes | 
   | Power Automate trial |Yes (one)| Yes | 
   | Microsoft Copilot Studio trial plan |Yes | No | 
   | Microsoft Copilot Studio plan | No | Yes | 

  You can also create a developer environment. For more information about developer environment, see [Create a developer environment](/power-platform/developer/create-developer-environment).
  
2. The tenant, or _user_ with email trials, must have:

   1. At least 1 GB of database storage capacity available for production and sandbox environments.
   1. For subscription-based trial environments, each offer-based trial (also known as "admin trial") subscription entitles the tenant to three subscription-based trial environments. Only tenant-level admins can provision trial (subscription-based) environments.
   1. For standard trial environments, the user needs a license providing per-user entitlement for trial environments (refer to the previous table). This requirement applies to tenant-level admins as well.
  
      > [!NOTE]
      > Sign up for a free, standard Power Apps trial to get the necessary license.
      > **Trial with Dynamics 365 apps**:
      > - Go to the [Dynamics 365 free trial](https://trials.dynamics.com) page and select an applicable app.
      >
      > **Trial with no apps**:
      > - Go to the [Power Apps trial](https://apps.powerapps.com/trial) page.
      > - Go to [Power Apps](https://powerapps.com) and select **Try for free**.

3. Tenant policy must allow environment creation. For more information, see [Control who can create and manage environments in the Power Platform admin center](control-environment-creation.md).

## Create an environment in the Power Platform admin center

An environment provides storage for apps, flows, data, and various other resources. When users create an app in an environment, that app can connect to any data source, including connections, gateways, and flows.

How you want to use environments depends on your organization and the apps you're trying to build. For more information, see [Environments overview](environments-overview.md).

You can store app or business data in a database with Microsoft Dataverse. You can create a database with Dataverse in any environment.

Create an environment with or without Dataverse:

- [Create an environment with a Dataverse database](#create-an-environment-with-a-database)
- [Create an environment without a Dataverse database](#create-an-environment-without-a-database)

### Some important considerations when creating a new environment

#### Why create an environment with a database?

When you create a production or sandbox environment with a Dataverse database, you can add Dynamics 365 apps, such as Dynamics 365 Sales and Field Service. During the creation process, select **Yes** for **Enable Dynamics 365 apps**.

Currently, if you don't select **Yes** for **Enable Dynamics 365 apps** when you create a database, you can't make this change later or install Dynamics 365 apps on this environment. However, you need a Dynamics 365 license to select **Yes** for **Enable Dynamics 365 apps**.

Foe more information about Dataverse, see [What is Dataverse?](/power-apps/maker/data-platform/data-platform-intro) and [Why choose Dataverse?](/power-apps/maker/data-platform/why-dataverse-overview)

#### Why create an environment without a database?

If you don't need Dynamics 365 apps or need Dataverse, and you're creating canvas apps with Power Apps or flows with Power Automate using other data sources, create the environment _without_ the Dataverse database.

#### Enabling Dynamics 365 apps isn't reversible

Once you create an environment, if you don't select **Enable Dynamics 365 apps** at the time of database provisioning, you can't make this change later or install Dynamics 365 apps on this environment.

#### Dynamics 365 apps and trial type environments

> [!IMPORTANT]
> Currently, Dynamics 365 apps can't be enabled for environments that are trial type environments. For more information about Power Platform environment types, go to [Environment types](environments-overview.md#environment-types).

When you create or use an environment URL, it can't be the same URL as a [deleted](delete-environment.md) or [changed](edit-properties-environment.md) environment. Wait for at least 24 hours to pass, after the environment deletion or change, to use the URL.

## Create an environment with a database

You create a database to use Dataverse as a data store. The Dataverse is a cloud scale database used to securely store data for business applications built on Power Apps. Dataverse provides not just data storage, but a way to implement business logic that enforces business rules and automation against the data.

For more information, see [Why use Dataverse?](/powerapps/maker/common-data-service/data-platform-intro#why-use-dataverse)

### Prerequisites

To create an environment with a database, you need at least:

- 1 GB of available database capacity  

For Dynamics 365 finance and operations apps, you need at least:

- 1 GB of available operations database capacity

### Steps

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a Dynamics 365 admin or Power Platform admin.

1. In the navigation pane, select **Environments**, and then select **New**.

1. Enter the following settings:

   |Setting  |Description  |
   |---------|---------|
   |Name     | The name of your environment.        |
   |Region     | Choose a region for the environment.        |
   |Get new features early     | Select **Yes** for early release cycle.        |
   |Type     | Choose production, trial, or sandbox.        |
   |Purpose     | A description of the environment.         |
   |Add a Dataverse data store | Select **Yes**. |
   |Pay-as-you-go with Azure | Select **Yes** to link this environment to an Azure subscription to pay for select Power Platform services such as Dataverse and Power Apps. |

1. Select **Next**.

1. Enter the following settings:

   |Setting  |Description  |
   |---------|---------|
   |Language     | The default language for this environment. For more information, see [Dataverse language collations](language-collations.md).    |
   | URL         | Enter your organization name. Organization URLs must be unique. If your organization name is already reserved in the destination datacenter, it won't be available. |
   |Currency     | The base currency used for reporting.         |
   |Enable Dynamics 365 apps | Select **Yes** and make a selection to automatically deploy apps such as Dynamics 365 Sales or Dynamics 365 Supply Chain Management. You must have an appropriate Dynamics 365 license to select **Yes**. If you don't select **Yes** at the time of database provisioning, you won’t be able to make this change later nor be able to install Dynamics 365 apps on this environment. |
   |Deploy sample apps and data     | Select **Yes** to include sample apps and data. Sample data gives you something to experiment with as you learn. You must select **No** for **Enable Dynamics 365 apps** for this setting to appear.        |
   |Security group | Select a security group to restrict access to this environment. For open access, select **None**.<br><br>This field is now required.|

1. Select **Save**.

## Create an environment without a database

You can create an environment without a database and use your own data store.

### Prerequisites

You need 1 GB of available database capacity.

### Steps

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a Dynamics 365 admin or Power Platform admin.

1. In the navigation pane, select **Environments**, and then select **New**.

1. Enter the following settings:

   |Setting  |Description  |
   |---------|---------|
   |Name     | The name of your environment.        |
   |Region     | Choose a region for the environment.        |
   |Get new features early     | Select **Yes** for early release cycle.        |
   |Type     | You can choose production or trial.        |
   |Purpose     | A description of the environment.         |
   |Add a Dataverse data store | Select **No**. |
   |Pay-as-you-go with Azure | Select **Yes** to link this environment to an Azure subscription to pay for select Power Platform services such as Dataverse and Power Apps. |

1. Select **Save**.

## Setting an environment refresh cadence

You can indicate how often you prefer an environment to receive updates and features to Microsoft Power Platform services. You have two options to choose from after creating an environment.

|Service  |Setting  |Description  |
|---------|---------|---------|
|Canvas app authoring |Frequent     | Get access the latest updates and newest features multiple times per month. |
|                     |Moderate     | Get access to updates and features at least once per month.|

### Set refresh cadence

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a Dynamics 365 admin or Power Platform admin.

2. In the navigation pane, select **Environments**, and then select an environment.

3. Select **Edit**.

4. Under **Refresh cadence**, choose the cadence type.

5. Select **Save**.

The refresh cadence doesn't change when you receive updates for:

- Microsoft Power Platform
- Dynamics 365 Sales
- Dynamics 365 Customer Service
- Dynamics 365 Marketing

> [!NOTE]
>
> - By default, environments are in the **frequent** cadence. Creating and editing canvas apps receive updates once per week. When apps are published, they receive the corresponding runtime version.
> - If you chose the **moderate** cadence for an environment, all creating and editing of canvas apps receive updates once per month. When apps are published, they receive the corresponding runtime version.

## FAQ

### Who can access environments?

Users can access resources in an environment if they have:

- A license granting usage rights for the resource being accessed in an environment. For example, a user with a Power Apps per user plan can access premium apps shared with them in any environment.
  
  [Licensing overview for Microsoft Power Platform](pricing-billing-skus.md) highlights usage rights included with different licenses.

- Permissions to access a resource. For example, a user can only access Power Apps that are shared with them.

  Learn how to share Power Platform resources:
  - [Share a canvas app with your organization](/powerapps/maker/canvas-apps/share-app)
  - [Share a cloud flow](/power-automate/create-team-flows)

### Why do I no longer see Preview (United states) region?

This region is no longer available as a choice. It has been replaced with the **Get new features early** setting when the United States region is selected.

Preview or early release cycle capabilities are available for environments in other regions, in addition to the United States.

### What are the new trial limits for Power Apps customers?

The new trial limits are one per user.

### Can a Microsoft 365 licensed user manage and create environments?

No, Microsoft 365 licensed users can't manage environments.

### If I create an environment in the Dynamics 365 admin center, does it appear in the Power Platform admin center?

Yes, environment appears in both admin centers.

### What is the Power Apps production environment limit?

Provisioning environments is based on database capacity.

Previously, the limit allowed two environments per Power Apps Plan 2 license. Now, you only need 1 GB of available capacity to provision. All environments with or without Dataverse consume at least 1 GB capacity.

### See also

[Dataverse storage capacity](capacity-storage.md) <br>
[Control user access to environments: security groups and licenses](control-user-access.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
