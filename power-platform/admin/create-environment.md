---
title: Create and manage environments in the Power Platform admin center | Microsoft Docs
description: About creating and manage environments in the Power Platform admin center
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: quickstart
ms.date: 03/26/2021
ms.author: jimholtz
search.audienceType: 
  - admin 
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Create and manage environments in the Power Platform admin center

An environment is a space to store, manage, and share your organization's business data, apps, and flows. It also serves as a container to separate apps that may have different roles, security requirements, or target audiences. Power Apps automatically creates a single default environment for each tenant, which is shared by all users in that tenant.

> [!TIP]
> For the blog announcing the latest changes to environment creation, see [Provisioning and administration updates are now live in the Power Platform admin center](https://powerapps.microsoft.com/blog/provisioning-and-administration-updates-are-now-live-in-the-power-platform-admin-center/). 

## Provisioning a new environment
You can provision a new environment based on [available capacity](capacity-storage.md). See the section [Create an environment in the Power Platform admin center](#create-an-environment-in-the-power-platform-admin-center).

### What's new in provisioning environments
We're consolidating how you view, create, and manage environments. 

- **Environments can now be provisioned in the Microsoft Power Platform admin center**: You can create environments in the Power Platform admin center. Previously, environments could only be created in the Dynamics 365 admin center and the Power Apps admin center. 
- **Admins can govern environment creation**: To limit environment creation to admins (Dynamics 365 admins, Global admins, or Power Platform admins), see [Control who can create environments in the Power Platform admin center](control-environment-creation.md). Previously, limiting was done by controlling who had Power Apps P2 licenses.  
- **Trial environment provisioning**: You can create one trial environment per user. Previously, you could create two per user. See [About trial environments](trial-environments.md).

## Who can create environments?

Your license determines whether you can create environments.

| License | Trial | Production |
| --- | --- | --- |
| Microsoft 365 Plans |No | No |
| Dynamics 365 Teams Plans   |No | No |
| Power Apps Community Plan   |No | No |
| Dynamics 365 trial | Yes (one) | No|
| Dynamics 365 Plans |Yes (one)| Yes |
| Power Apps plan |Yes (one)| Yes |
| Power Apps trial |Yes (one)| Yes |
| Power Virtual Agents trial plan |Yes | No |
| Power Virtual Agents plan | No | Yes |

To determine which license a user has, sign in to the [Microsoft 365 admin center](https://admin.microsoft.com) and follow the steps in [Assign licenses to multiple users on the Active users page](/office365/admin/manage/assign-licenses-to-users?view=o365-worldwide).

To create an environment, all the following must be true:

1. The user has a license (Yes below) that allows environment creation. This requirement is waived for Global admins and Power Platform admins.

   | License | Trial | Production |
   | --- | --- | --- |
   | Microsoft 365 Plans |No | No |
   | Dynamics 365 Teams Plans   |No | No |
   | Power Apps Community Plan   |No | No |
   | Dynamics 365 trial | Yes (one) | No|
   | Dynamics 365 Plans |Yes (one)| Yes |
   | Power Apps plan |Yes (one)| Yes |
   | Power Apps trial |Yes (one)| Yes |
   | Power Virtual Agents trial plan |Yes | No |
   | Power Virtual Agents plan | No | Yes |

   To determine which license a user has, sign in to the [Microsoft 365 admin center](https://admin.microsoft.com) and follow the steps in [Assign licenses to multiple users on the Active users page](/office365/admin/manage/assign-licenses-to-users?view=o365-worldwide).

2. The tenant (or user in the case of email trials) must have the following:

   - For production and sandbox environments, the tenant must have at least 1GB of database storage capacity available.
   - For trial (subscription-based) environments, each offer-based trial (also known as "admin trial") subscription entitles the tenant to three subscription-based trial environments. Only tenant-level admins are able to provision trial (subscription-based) environments.
   - For trial (standard) environments, the user needs a license providing per-user entitlement for trial environments (refer to the table above). This applies to tenant-level admins, as well. 
   
   Users wanting to create a standard trial can get the necessary license for free by signing up for a Power Apps trial via one of these paths:

     **For a trial with Dynamics 365 apps**
    
     - https://trials.dynamics.com and select the required app to sign up for a 30-day trial
    
     **For a trial with no apps**
     - https://apps.powerapps.com/trial
     - https://powerapps.com and select **Try Free** at the top of the page

3.	Tenant policy must allow environment creation. See [Control who can create and manage environments in the Power Platform admin center](control-environment-creation.md)

<!-- 
> [!NOTE]
> Global admins and Power Platform admins can create environments without a license provided the environment has available database storage capacity. See [Administer without a license](global-service-administrators-can-administer-without-license.md). 
-->

## Create an environment in the Power Platform admin center
An environment provides storage for apps, flows, data, and various other resources. When users create an app in an environment, that app can connect to any data source, including connections, gateways, and flows. How you choose to leverage environments depends on your organization and the apps you're trying to build. For more information, see [Environments overview](environments-overview.md).

You can store the app/business data in a database with Microsoft Dataverse. You can create a database with Dataverse with any environment.

You have multiple options when creating an environment:

1. [Create an environment with a Dataverse database](#create-an-environment-with-a-database)
2. [Create an environment without a Dataverse database](#create-an-environment-without-a-database)

### Some important considerations when creating a new environment

- **Why create an environment with a database**: When you create a production or sandbox environment with a Dataverse database, you have the option to add Dynamics 365 apps such as Dynamics 365 Sales and Field Service during the creation process (by choosing **Enable Dynamics 365 apps**). Currently, if you don't select **Enable Dynamics 365 apps** at the time of database provisioning, you won't be able to make this change later nor be able to install Dynamics 365 apps on this environment. 
- **Why create an environment without a database**: If you don't need Dynamics 365 apps or don't need to use Dataverse, and you are creating Power Apps or Power Automate using other data sources, create the environment without the Dataverse database.
- **The Enable Dynamics 365 apps decision is not reversible**: Once you create an environment, if you don't select **Enable Dynamics 365 apps** at the time of database provisioning, you won't be able to make this change later nor be able to install Dynamics 365 apps on this environment. 
- **Dynamics 365 apps and trial environments**: Currently, Dynamics 365 apps cannot be enabled for trial environments. To create a trial with Dynamics 365 apps, see [Start your digital transformation here](https://trials.dynamics.com).
- The URL can't be that of an environment that's been [deleted](delete-environment.md) or [changed](edit-properties-environment.md) until at least 24 hours have passed since an environment deletion or change.

## Create an environment with a database
You create a database to use Dataverse as a data store. The Dataverse is a cloud scale database used to securely store data for business applications built on Power Apps. Dataverse provides not just data storage, but a way to implement business logic that enforces business rules and automation against the data. For more information, see [Why use Dataverse?](/powerapps/maker/common-data-service/data-platform-intro#why-use-common-data-service)

### Prerequisites 
To create an environment with a database, you need 1GB available database capacity.

### Steps

1. In the Power Platform admin center at [https://admin.powerplatform.microsoft.com](https://admin.powerplatform.microsoft.com) as an admin (Dynamics 365 admin, Global admin, or Microsoft Power Platform admin).
2. In the navigation pane, select **Environments**, and then select **New**.

   > [!div class="mx-imgBorder"] 
   > ![Create new environment](./media/new-environment.png "Create new environment")

3. Enter the following, and then select **Next**.

   |Setting  |Description  |
   |---------|---------|
   |Name     | The name of your environment.        |
   |Type     | Choose production, trial, or sandbox.        |
   |Region     | Choose a region for the environment.        |
   |Purpose     | A description of the environment.         |
   |Create a database for this environment? | Select **Yes**. |

   > [!div class="mx-imgBorder"] 
   > ![Create new environment settings](./media/new-environment-page1.png "Create new environment settings")

4. Enter the following, and then select **Save**.

   |Setting  |Description  |
   |---------|---------|
   |Language     | The default language for this environment. More information: [Dataverse language collations](language-collations.md)     |
   | URL         | Enter your organization name. Organization URLs must be unique. If your organization name has already been reserved in the destination datacenter, it won't be available. |
   |Currency     | The base currency used for reporting.         |
   |Enable Dynamics 365 apps | Select **Yes** and make a selection to automatically deploy apps such as Dynamics 365 Sales and Dynamics 365 Customer Service. If you don't select **Yes** at the time of database provisioning, you won’t be able to make this change later nor be able to install Dynamics 365 apps on this environment. |
   |Deploy sample apps and data     | Select **Yes** to include sample apps and data. Sample data gives you something to experiment with as you learn. You must select **No** for **Enable Dynamics 365 apps** for this setting to appear.        |
   |Security group | Select a security group to restrict access to this environment. |

   > [!div class="mx-imgBorder"] 
   > ![Create new environment settings](./media/new-environment-page2-enable-apps.png "Create new environment settings")
   
## Create an environment without a database 
You can create an environment without a database and use your own data store.

### Prerequisites
You need 1GB available database capacity.

### Steps
1. In the Power Platform admin center at [https://admin.powerplatform.microsoft.com](https://admin.powerplatform.microsoft.com) as an admin (Dynamics 365 admin, Global admin, or Power Platform admin).

2. In the navigation pane, select **Environments**, and then select **New**.

   > [!div class="mx-imgBorder"] 
   > ![Create new environment](./media/new-environment.png "Create new environment")

3. Enter the following, and then select **Save**.
   
   |Setting  |Description  |
   |---------|---------|
   |Name     | The name of your environment.        |
   |Type     | You can choose production or trial.        |
   |Region     | Choose a region for the environment.        |
   |Purpose     | A description of the environment.         |
   |Create a database for this environment? | Select **No**. |

   > [!div class="mx-imgBorder"] 
   > ![Create new environment settings](./media/new-environment-page1-nodb.png "Create new environment settings")

## Setting an environment refresh cadence
You can indicate how often you would prefer an environment to receive updates and features to certain Microsoft Power Platform services. You have two options to choose from after creating an environment.

|Service  |Setting  |Description  |
|---------|---------|---------|
|Canvas app authoring |Frequent     | Get access the latest updates and newest features multiple times a month.|
|                     |Moderate     | Get access to updates and features at least once a month.|

To set refresh cadence:

1. In the Power Platform admin center at [https://admin.powerplatform.microsoft.com](https://admin.powerplatform.microsoft.com) as an admin (Dynamics 365 admin, Global admin, or Power Platform admin).

2. From the left-side menu, select **Environments**, and then select an environment.

3. Select **Edit**

   > [!div class="mx-imgBorder"] 
   > ![Select Edit](media/select-edit.png "Select Edit")

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

### What are the new trial limits for Power Apps customers?
The new trial limits are one per user. 

### Can an Microsoft 365 licensed user manage and create environments?
No, Microsoft 365 licensed users will not be able to manage environments. 

### If I create an environment in the Dynamics 365 admin center, will it appear in the Power Platform admin center?
Yes, it will appear in both admin centers.

### What is the Power Apps production environment limit?
Provisioning environments is based on database capacity. Previously, it was two environments per Power Apps Plan 2 license. Now all you need is 1GB of available capacity to provision. All environments with or without Dataverse will consume at least 1GB capacity.

### See also 
[Manage environments in Power Apps](environments-administration.md) <br />
[Dataverse storage capacity](capacity-storage.md) <br />
[Control user access to environments: security groups and licenses](control-user-access.md)



[!INCLUDE[footer-include](../includes/footer-banner.md)]



“After a URL name change is saved, all users who access that environment must be notified of the change. Users will be able to access the environment for up to 24 hours by using the previous URL. After the 24-hour period has passed, the previous URL will not work.”