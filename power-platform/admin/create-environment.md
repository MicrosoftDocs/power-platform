---
title: Create and manage environments in the Power Platform admin center | Microsoft Docs
description: Learn how to create and manage environments in the Power Platform admin center
author: sericks007
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/11/2023
ms.subservice: admin
ms.author: sericks
ms.reviewer: sericks
ms.contributors:
- pmantha
search.audienceType: 
  - admin 
contributors:
  - marcelbf
---
# Create and manage environments in the Power Platform admin center

An environment is a space in which to store, manage, and share your organization's business data, apps, and flows. It also serves as a container to separate apps that may have different roles, security requirements, or target audiences. Power Apps automatically creates a single default environment for each tenant that is shared by all users in that tenant.

## Who can create environments?

Your license determines whether you can create environments.

To determine which license a user has, sign in to the [Microsoft 365 admin center](https://admin.microsoft.com) and follow the steps in [Assign licenses to multiple users on the Active users page](/office365/admin/manage/assign-licenses-to-users?view=o365-worldwide&preserve-view=true).

To create an environment, all the following must be true:

1. The user has a license that allows environment creation. This requirement is waived for Global admins and Power Platform admins except for trial (standard) environments; see #2.c later.

   | License | Trial | Production | Developer |
   | --- | --- | --- | --- |
   | Microsoft 365 Plans |No | No | Yes |
   | Dynamics 365 Teams Plans   |No | No | Yes |
   | Power Apps Developer Plan   |No | No | Yes |
   | Dynamics 365 trial | Yes (one) | No| Yes |
   | Dynamics 365 Plans |Yes (one)| Yes | Yes |
   | Power Apps plan |Yes (one)| Yes | Yes |
   | Power Apps trial |Yes (one)| Yes | Yes |
   | Power Automate plan |Yes (one)| Yes | Yes |
   | Power Automate trial |Yes (one)| Yes | Yes |
   | Power Virtual Agents trial plan |Yes | No | Yes |
   | Power Virtual Agents plan | No | Yes | Yes |

   To determine which license a user has, sign in to the [Microsoft 365 admin center](https://admin.microsoft.com) and follow the steps in [Assign licenses to multiple users on the Active users page](/office365/admin/manage/assign-licenses-to-users?view=o365-worldwide&preserve-view=true).

2. The tenant (or user in the case of email trials) must have the following:

   1. For production and sandbox environments, the tenant must have at least 1 GB of database storage capacity available.
   1. For trial (subscription-based) environments, each offer-based trial (also known as "admin trial") subscription entitles the tenant to three subscription-based trial environments. Only tenant-level admins are able to provision trial (subscription-based) environments.
   1. For trial (standard) environments, the user needs a license providing per-user entitlement for trial environments (refer to the table above). This applies to tenant-level admins as well. 
   
   Users wanting to create a standard trial can get the necessary license for free by signing up for a Power Apps trial via one of these paths:

     **For a trial with Dynamics 365 apps**
    
     - https://trials.dynamics.com and select the required app to sign up for a 30-day trial
    
     **For a trial with no apps**
     - https://apps.powerapps.com/trial
     - https://powerapps.com and select **Try Free** at the top of the page

3.	Tenant policy must allow environment creation. See [Control who can create and manage environments in the Power Platform admin center](control-environment-creation.md)

## Create an environment in the Power Platform admin center
An environment provides storage for apps, flows, data, and various other resources. When users create an app in an environment, that app can connect to any data source, including connections, gateways, and flows. How you choose to leverage environments depends on your organization and the apps you're trying to build. For more information, see [Environments overview](environments-overview.md).

You can store the app/business data in a database with Microsoft Dataverse. You can create a database with Dataverse with any environment.

You have multiple options when creating an environment:

- [Create an environment with a Dataverse database](#create-an-environment-with-a-database)
- [Create an environment without a Dataverse database](#create-an-environment-without-a-database)

### Some important considerations when creating a new environment

- **Why create an environment with a database**: When you create a production or sandbox environment with a Dataverse database, you have the option to add Dynamics 365 apps such as Dynamics 365 Sales and Field Service during the creation process (by selecting **Yes** for **Enable Dynamics 365 apps**). Currently, if you don't select **Yes** for **Enable Dynamics 365 apps** at the time of database provisioning, you won't be able to make this change later nor be able to install Dynamics 365 apps on this environment. You must have an appropriate Dynamics 365 license to select **Yes** for **Enable Dynamics 365 apps**. <br>More information about Dataverse: [What is Dataverse?](/power-apps/maker/data-platform/data-platform-intro) and [Why choose Dataverse?](/power-apps/maker/data-platform/why-dataverse-overview) 
- **Why create an environment without a database**: If you don't need Dynamics 365 apps or don't need to use Dataverse, and you are creating canvas apps using Power Apps or flows using Power Automate using other data sources, create the environment without the Dataverse database.
- **The Enable Dynamics 365 apps decision is not reversible**: Once you create an environment, if you don't select **Enable Dynamics 365 apps** at the time of database provisioning, you won't be able to make this change later nor be able to install Dynamics 365 apps on this environment. 
- **Dynamics 365 apps and trial type environments**: Currently, Dynamics 365 apps can't be enabled for environments that are trial type environments. For more information about Power Platform environment types, go to [Type of environments](environments-overview.md#types-of-environments).
- The URL can't be that of an environment that's been [deleted](delete-environment.md) or [changed](edit-properties-environment.md) until at least 24 hours have passed since an environment deletion or change.

## Create an environment with a database
You create a database to use Dataverse as a data store. The Dataverse is a cloud scale database used to securely store data for business applications built on Power Apps. Dataverse provides not just data storage, but a way to implement business logic that enforces business rules and automation against the data. For more information, see [Why use Dataverse?](/powerapps/maker/common-data-service/data-platform-intro#why-use-dataverse)

### Prerequisites 
To create an environment with a database, you need 1 GB available database capacity.

### Steps

1. Sign in to the Power Platform admin center at [https://admin.powerplatform.microsoft.com](https://admin.powerplatform.microsoft.com) as an admin (Dynamics 365 admin, Global admin, or Microsoft Power Platform admin).

2. In the navigation pane, select **Environments**, and then select **New**.

3. Enter the following, and then select **Next**.

   |Setting  |Description  |
   |---------|---------|
   |Name     | The name of your environment.        |
   |Region     | Choose a region for the environment.        |
   |Type     | Choose production, trial, or sandbox.        |
   |Purpose     | A description of the environment.         |
   |Add a Dataverse data store | Select **Yes**. |
   |Pay-as-you-go with Azure | Select **Yes** to link this environment to an Azure subscription to pay for select Power Platform services such as Dataverse and Power Apps. |

4. Enter the following, and then select **Save**.

   |Setting  |Description  |
   |---------|---------|
   |Language     | The default language for this environment. More information: [Dataverse language collations](language-collations.md)     |
   | URL         | Enter your organization name. Organization URLs must be unique. If your organization name has already been reserved in the destination datacenter, it won't be available. |
   |Currency     | The base currency used for reporting.         |
   |Enable Dynamics 365 apps | Select **Yes** and make a selection to automatically deploy apps such as Dynamics 365 Sales and Dynamics 365 Customer Service. You must have an appropriate Dynamics 365 license to select **Yes**. If you don't select **Yes** at the time of database provisioning, you won’t be able to make this change later nor be able to install Dynamics 365 apps on this environment. |
   |Deploy sample apps and data     | Select **Yes** to include sample apps and data. Sample data gives you something to experiment with as you learn. You must select **No** for **Enable Dynamics 365 apps** for this setting to appear.        |
   |Security group | Select a security group to restrict access to this environment. For open access, select **None**.<br><br>This field is now required.|
   
## Create an environment without a database 
You can create an environment without a database and use your own data store.

### Prerequisites
You need 1 GB available database capacity.

### Steps
1. Sign in to the Power Platform admin center at [https://admin.powerplatform.microsoft.com](https://admin.powerplatform.microsoft.com) as an admin (Dynamics 365 admin, Global admin, or Power Platform admin).

2. In the navigation pane, select **Environments**, and then select **New**.

3. Enter the following, and then select **Save**.
   
   |Setting  |Description  |
   |---------|---------|
   |Name     | The name of your environment.        |
   |Region     | Choose a region for the environment.        |
   |Type     | You can choose production or trial.        |
   |Purpose     | A description of the environment.         |
   |Add a Dataverse data store | Select **No**. |
   |Pay-as-you-go with Azure | Select **Yes** to link this environment to an Azure subscription to pay for select Power Platform services such as Dataverse and Power Apps. |

## Setting an environment refresh cadence
You can indicate how often you would prefer an environment to receive updates and features to certain Microsoft Power Platform services. You have two options to choose from after creating an environment.

|Service  |Setting  |Description  |
|---------|---------|---------|
|Canvas app authoring |Frequent     | Get access the latest updates and newest features multiple times a month.|
|                     |Moderate     | Get access to updates and features at least once a month.|

To set refresh cadence:

1. Sign in to the Power Platform admin center at [https://admin.powerplatform.microsoft.com](https://admin.powerplatform.microsoft.com) as an admin (Dynamics 365 admin, Global admin, or Power Platform admin).

2. From the left-side menu, select **Environments**, and then select an environment.

3. Select **Edit**.

4. Under **Refresh cadence**, choose the cadence type. 

5. Select **Save**.

The refresh cadence does not change when you will receive updates for:
- Microsoft Power Platform
- Dynamics 365 Sales
- Dynamics 365 Customer Service
- Dynamics 365 Marketing

> [!NOTE]
> - By default, environments are automatically in the **frequent** cadence; creating and editing canvas apps will receive updates once a week. When apps are published, they will receive the corresponding runtime version. 
> - If you’ve chosen the **moderate** cadence for the environment, all creating and editing of canvas apps will receive updates once a month. When apps are published, they will receive the corresponding runtime version.

## FAQ

### Who can access environments?
Users are able to access resources in an environment when they have:
- A license granting use rights for the resource being accessed in an environment. For example, a user with a Power Apps per user plan can access premium apps shared with them in any environment. 
  - [This documentation](pricing-billing-skus.md) highlights use rights included with different licenses. 

AND

- Permissions to access a resource. For example, a user can only access Power Apps that are shared with them. The following documentation outlines how to share some Power Platform resources:
  - [This documentation](/powerapps/maker/canvas-apps/share-app) highlights how to share an app with users. 
  - [This documentation](/power-automate/create-team-flows) highlights how to share a cloud flow. 

### What are the new trial limits for Power Apps customers?
The new trial limits are one per user. 

### Can a Microsoft 365 licensed user manage and create environments?
No, Microsoft 365 licensed users won't be able to manage environments. 

### If I create an environment in the Dynamics 365 admin center, will it appear in the Power Platform admin center?
Yes, it will appear in both admin centers.

### What is the Power Apps production environment limit?
Provisioning environments is based on database capacity. Previously, it was two environments per Power Apps Plan 2 license. Now all you need is 1 GB of available capacity to provision. All environments with or without Dataverse will consume at least 1 GB capacity.

### See also 
[Dataverse storage capacity](capacity-storage.md) <br />
[Control user access to environments: security groups and licenses](control-user-access.md)



[!INCLUDE[footer-include](../includes/footer-banner.md)]

