---
title: About trial environments | Microsoft Docs
description: About trial (standard) and trial (subscription-based) environments
author: imadyanni
ms.author: iyanni
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/27/2020
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# About trial environments
Using the Power Platform admin center, you can create environments of multiple types. Using trial environments, companies and customers can try out new features and solutions. There are two types of trial environments: trial (standard) and trial (subscription-based). 

> [!NOTE]
> The term "trial," as used in all other topics and the user interface, refers to the standard type of trial environment rather than the subscription-based type.

Not all companies and admins approach trials the same way. This is especially true when it comes to deciding whether to allow users to try new capabilities. Some companies let users try features in a self-serve manner. Others want admins to completely control what's being tried and who's licensed to use the environment. The two types of trial environments provide this level of control.

- **Trial (standard)**: This is the type of trial environment that companies can use to allow users and department managers to try new features and quickly build low-code and no-code applications and processes. Organization (tenant) admins can enable all users to create trials, or only tenant admins. If allowed for users, any user from that organization who has [a suitable license](create-environment.md#who-can-create-environments) can create a 30-day trial environment. After 30 days, the environment is disabled and deleted. 
- **Trial (subscription-based)**: This is the type of trial environment that companies can use to develop larger, multiuser and multiple-department solutions and perform proof-of-concept reviews. Tenant admins can add a trial (subscription-based) environment to their tenant, or new customers can sign up for a new tenant and become the Global admin. For new customers, an admin-managed subscription is created with a set number of licenses (usually 25); admins control which other users get licenses assigned to them. An admin-managed subscription has an end date that can be extended. 

Neither type of environment consumes paid capacity. You can convert either type of trial environment to a production environment by switching it to consume from paid capacity, which will keep it from being disabled and deleted. After it becomes a production environment, it will follow the paid license lifecycle.

## Multiple ways to start a trial

The type of trial environment you create depends on where you start and your tenant-level permissions.

|Trial type  | Tenant-level permissions  | Create trial location  |
|---------|---------|---------|
|Trial (standard)     |  User or admin      |  Power Platform admin center. See [Create a trial (standard) environment in the Power Platform admin center](#create-a-trial-standard-environment-in-the-power-platform-admin-center)       |
|Trial (standard)       |  User or admin         | [https://trials.dynamics.com](https://trials.dynamics.com)     |
|Trial (subscription-based)      | Admin        | Power Platform admin center. See [Create a trial (subscription-based) environment in the Power Platform admin center](#create-a-trial-subscription-based-environment-in-the-power-platform-admin-center)        |
|Trial (subscription-based)      |  User or admin        | "Get started"<!--Suggested--> pages, such as: <br /> <ul><li>[https://dynamics.microsoft.com/get-started/?appname=salespro](https://dynamics.microsoft.com/get-started/?appname=salespro)</li><li>[https://dynamics.microsoft.com/get-started/?appname=customerservice](https://dynamics.microsoft.com/get-started/?appname=customerservice)</li></ul>      |

## Create a trial (standard) environment in the Power Platform admin center

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) with admin credentials.

2. Go to **Environments**, and then select **+ New**.

   > [!div class="mx-imgBorder"] 
   > ![Create a new trial (standard) environment](media/new-environment.png "Create a new trial (standard) environment")

3. Enter the following, and then select **Next**.
   
   |Setting  |Description  |
   |---------|---------|
   |Name     | The name of your environment.        |
   |Type     | Choose **Trial**.        |
   |Region     | Choose a region for the environment.        |
   |Purpose     | A description of the environment.         |
   |Create a database for this environment? | Select **Yes** to add a Microsoft Dataverse database to the trial (standard) environment. |

   > [!div class="mx-imgBorder"] 
   > ![Create a new trial (standard) environment, page two](./media/trial-subscription-standard.png "Create a new trial (standard) environment, page two")

4. Enter the following, and then select **Save**.

   |Setting  |Description  |
   |---------|---------|
   |Language     | The default language for this environment.        |
   |Currency     | The base currency used for reporting.         |
   |Enable Dynamics 365 apps | Select **Yes**, and then select apps to automatically deploy, such as Dynamics 365 Sales and Dynamics 365 Customer Service.|
   |Deploy sample apps and data     | This setting is preset to **No** and can't be changed.      |
   |Security group | Select a security group to restrict access to this environment. |

   > [!div class="mx-imgBorder"] 
   > ![Create a new environment settings, page two](./media/trial-subscription-standard-page2.png "Create a new environment settings, page two")

## Create a trial (subscription-based) environment in the Power Platform admin center

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) with admin credentials.

2. Go to **Environments**, and then select **New**. 

   > [!div class="mx-imgBorder"] 
   > ![Create a new trial (subscription-based) environment](media/new-environment.png "Create a new trial (subscription-based) environment")

3. For **Type**, select **Trial (subscription-based)**, and then fill in and select other settings. Select **Next**.

   |Setting  |Description  |
   |---------|---------|
   |Name     | The name of your environment.        |
   |Type     | **Trial (subscription-based)**.      |
   |Region     | A region for the environment.        |
   |Purpose     | A description of the environment.         |
   |Create a database for this environment | This setting is preset to **Yes** and can't be changed, because a Dataverse database must be created for a trial (subscription-based) environment.

   > [!div class="mx-imgBorder"] 
   > ![Create a new trial (subscription-based) environment, page two](media/trial-subscription-based.png "Create a new trial (subscription-based) environment, page two")

4. Specify the following settings, and then select **Save**. 

   |Setting  |Description  |
   |---------|---------|
   |Language     | The default language for this environment.        |
   |URL | The environment name to include in the URL.     |
   |Currency     | The base currency used for reporting.         |
   |Enable Dynamics 365 apps | <ul><li>Select **Yes** to display the **Automatically deploy these apps** setting, described in the following row of this table.</li><li>Select **No** to provision an environment with no apps included. You'll be able to create trials for low-code and no-code apps and flows, but not the full Dynamics 365 applications platform.</li></ul>  |
   |Automatically deploy these apps  | This setting appears if you set **Enable Dynamics 365 apps** to **Yes**.<ul><li>Select **All enterprise applications**, **Customer Service Pro**, or **Sales Pro** to deploy and try Dynamics 365 apps.</li><li>Select **None** to provision an environment with no apps included.</li></ul>|
   |Security group | Select a security group to restrict access to this environment. |
   |Deploy sample apps and data  | This setting appears if you set **Enable Dynamics 365 apps** to **No**.<br>Select **Yes** to include sample apps and data. Sample data gives you something to experiment with as you learn. |

   > [!div class="mx-imgBorder"] 
   > ![Create new environment database settings](media/new-environment-add-database.png "Create new environment database settings")

## Check the expiration date for a trial (standard) environment

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) with admin credentials.

2. Go to **Environments** > [select a trial environment] > **See all**. Check out **Day(s) remain**.

   > [!div class="mx-imgBorder"] 
   > ![Trial days remaining](media/trial-expiration.png "Trial days remaining")

## Check the expiration date for a trial (subscription-based) environment

A trial (subscription-based) environment lasts as long as the subscription is active. To check its expiration date, perform the following steps.

1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com/) using Global admin credentials.
  
2. Select **Billing** > **Your products**, and then select the **Subscriptions** tab.
  
3. Select your Dynamics 365 subscription, and review the date in the **Billing** section.

   > [!div class="mx-imgBorder"] 
   > ![Check trial (subscription-based) expiration](media/subscription-expiration-date.png "Check trial (subscription-based) expiration")

## Convert either type of trial environment to a production environment

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) with admin credentials.

2. Go to **Environments** > [select a trial environment] > **Convert to production**.

    > [!div class="mx-imgBorder"] 
    > ![Select Convert to production](media/trial-convert.png "Select Convert to production")

3. Select **Continue**.

It might take several hours to convert to a production environment.

## Frequently asked questions

### Who can convert a trial environment to a production environment?

The organization (tenant) admin can determine who's allowed to create trial environments and convert them to production. If you're allowed to, and you have 1 GB of available production database capacity, you can convert a trial environment to production. You might need to free up or purchase additional capacity if the trial environment database exceeds available production capacity. To determine the size of the trial environment database, see [Dataverse storage capacity](capacity-storage.md).

### I can see a trial (subscription-based) environment type option, why can't I create this trial type?

Make sure that you have an active Dynamics 365 Trial subscription.

### How can I retain my data and resources if I don't have a way to convert the trial (standard) environment to a production environment?

You can export your resources and data to another environment if you want to retain them longer than the trial period. We recommend that you create a production environment or an individual environment (with the [Power Apps Community Plan](https://powerapps.microsoft.com/communityplan/)) and export your resources to that environment. 

Here are some guidelines for exporting resources.

|Type of resource in the environment  |How do I export it?  |
|---------|---------|
|Apps (canvas and model-driven) and flows     |You can use [packaging](../alm/environment-and-tenant-migration.md) to export apps and flows from one environment.         |
|Data in the database (Dataverse environment)     |<ul><li>[Export to Excel](/powerapps/user/export-data-excel) and save the data. You can then [import the data](/powerapps/user/import-data) into another environment.</li><li>Use [Data Integrator services](data-integrator.md) and APIs to export data into another environment.</li></ul> |

We delete trial (standard) environments that haven't had any activity in the environment databases for 30 days.

### See also
[Environments overview](environments-overview.md)<br/>
[Choose the right plans for your team](https://powerapps.microsoft.com/pricing/)<br/>
[Licensing overview](pricing-billing-skus.md) <br />
[Block trial licenses commands](powerapps-powershell.md#block-trial-licenses-commands) <br />
[Control who can create and manage environments in the Power Platform admin center](control-environment-creation.md)
