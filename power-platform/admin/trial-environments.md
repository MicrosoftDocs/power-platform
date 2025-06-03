---
title: "About trial environments: standard and subscription-based"
description: "There are two types of Power Platform trial environments. Decide which one is right for you and learn how to create it in the Power Platform admin center."
author: meeramahabala
ms.subservice: admin
ms.custom: NewPPAC
ms.author: meeram
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: concept-article
ms.date: 07/26/2024
search.audienceType: 
  - admin
---
# About trial environments

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Using the Microsoft Power Platform admin center, you can create environments of multiple types. Using trial environments, companies and customers can try out new features and solutions. There are two types of trial environments: trial (standard) and trial (subscription-based).

> [!NOTE]
> The term "trial," as used in all other topics and the user interface, refers to the standard type of trial environment rather than the subscription-based type.

Not all companies and admins approach trials the same way. This is especially true when it comes to deciding whether to allow users to try new capabilities. Some companies let users try features in a self-serve manner. Others want admins to completely control what's being tried and who's licensed to use the environment. The two types of trial environments provide this level of control.

- **Trial (standard)**: This is the type of trial environment that companies can use to allow users and department managers to try new features and quickly build low-code and no-code applications and processes. Organization (tenant) admins can enable all users to create trials, or only tenant admins. If allowed for users, any user from that organization who has [a suitable license](create-environment.md#who-can-create-environments) can create a 30-day trial environment. After 30 days, the environment is disabled and deleted.
  
- **Trial (subscription-based)**: This is the type of trial environment that companies can use to develop larger, multiuser and multiple-department solutions and perform proof-of-concept reviews. Tenant admins can add a trial (subscription-based) environment to their tenant, or new customers can sign up for a new tenant and become the administrator of the tenant. For new customers, an admin-managed subscription is created with a set number of licenses (usually 25); admins control which other users get licenses assigned to them. An admin-managed subscription has an end date that can be extended. 

Neither type of environment consumes paid capacity. You can convert either type of trial environment to a production environment by switching it to consume from paid capacity, which will keep it from being disabled and deleted. After it becomes a production environment, it will follow the paid license lifecycle.

## Multiple ways to start a trial

The type of trial environment you create depends on where you start and your tenant-level permissions.

|Trial type  | Tenant-level permissions  | Create trial location  |
|---------|---------|---------|
|Trial (standard)     |  User or admin      |  Power Platform admin center. See [Create a trial (standard) environment in the Power Platform admin center](#create-a-trial-standard-environment-in-the-power-platform-admin-center)       |
|Trial (standard)       |  User or admin         | [https://trials.dynamics.com](https://trials.dynamics.com)     |
|Trial (subscription-based)      | Admin        | Power Platform admin center. See [Create a trial (subscription-based) environment in the Power Platform admin center](#create-a-trial-subscription-based-environment-in-the-power-platform-admin-center)        |
|Trial (subscription-based)      |  User or admin        | "Get started" pages, such as: <br /> <ul><li>[https://dynamics.microsoft.com/get-started/?appname=salespro](https://dynamics.microsoft.com/get-started/?appname=salespro)</li><li>[https://dynamics.microsoft.com/get-started/?appname=customerservice](https://dynamics.microsoft.com/get-started/?appname=customerservice)</li></ul>      |

## Create a trial (standard) environment in the Power Platform admin center

### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) with admin credentials.
1. In the navigation pane, select **Manage**, then in the **Manage** pane, select **Environments**.
1. On the **Environments** page, click **New** in the command bar.
   
### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) with admin credentials.
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, click **New** in the command bar.
---

4. Enter the following settings:
   
   |Setting  |Description  |
   |---------|---------|
   |Name     | The name of your environment.        |
   |Type     | Choose **Trial**.        |
   |Region     | Choose a region for the environment.        |
   |Purpose     | A description of the environment.         |
   |Create a database for this environment? | Select **Yes** to add a Microsoft Dataverse database to the trial (standard) environment. |

5. Click **Next**.

6. Enter the following settings:

   |Setting  |Description  |
   |---------|---------|
   |Language     | The default language for this environment.        |
   |Currency     | The base currency used for reporting.         |
   |Enable Dynamics 365 apps | Select **Yes**, and then select apps to automatically deploy, such as Dynamics 365 Sales and Dynamics 365 Customer Service.|
   |Deploy sample apps and data     | This setting is preset to **No** and can't be changed.      |
   |Security group | Select a security group to restrict access to this environment. |

7. Click **Save** to apply the changes.
 
## Create a trial (subscription-based) environment in the Power Platform admin center

### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) with admin credentials.
1. In the navigation pane, select **Manage**, then in the **Manage** pane, select **Environments**.
1. On the **Environments** page, click **New** in the command bar.
   
### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) with admin credentials.
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, click **New** in the command bar.
---

4. Enter the following settings:

   |Setting  |Description  |
   |---------|---------|
   |Name     | The name of your environment.        |
   |Type     | Choose **Trial (subscription-based)**.      |
   |Region     | Choose a region for the environment.        |
   |Purpose     | A description of the environment.         |
   |Create a database for this environment | This setting is preset to **Yes** and can't be changed, because a Dataverse database must be created for a trial (subscription-based) environment.

5. Click **Next**.

6. Enter the following settings:

   |Setting  |Description  |
   |---------|---------|
   |Language     | The default language for this environment.        |
   |URL | The environment name to include in the URL.     |
   |Currency     | The base currency used for reporting.         |
   |Enable Dynamics 365 apps | <ul><li>Select **Yes** to display the **Automatically deploy these apps** setting, described in the following row of this table.</li><li>Select **No** to provision an environment with no apps included. You'll be able to create trials for low-code and no-code apps and flows, but not the full Dynamics 365 applications platform.</li></ul>  |
   |Automatically deploy these apps  | This setting appears if you set **Enable Dynamics 365 apps** to **Yes**.<ul><li>Select **All enterprise applications**, **Customer Service Pro**, or **Sales Pro** to deploy and try Dynamics 365 apps.</li><li>Select **None** to provision an environment with no apps included.</li></ul>|
   |Security group | Select a security group to restrict access to this environment. |
   |Deploy sample apps and data  | This setting appears if you set **Enable Dynamics 365 apps** to **No**.<br>Select **Yes** to include sample apps and data. Sample data gives you something to experiment with as you learn. |

7. Click **Save** to apply the changes.

## Check the expiration date for a trial (standard) environment

### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) using admin credentials.
1. In the navigation pane, select **Manage**, then in the **Manage** pane, select **Environments**.
1. On the **Environments** page, select a trial environment.
1. In the **Details** pane, click **See all** to view **Day(s) remain** in the **Details** side pane.
   
### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) using admin credentials.
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select a trial environment.
1. In the **Details** pane, click **See all** to view **Day(s) remain** in the **Details** side pane.
---

## Check the expiration date for a trial (subscription-based) environment

A trial (subscription-based) environment lasts as long as the subscription is active. To check its expiration date, perform the following steps.

1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com/) as a user with access to view subscription information. Learn more about admin roles at [About admin roles in the Microsoft 365 admin center](/microsoft-365/admin/add-users/about-admin-roles).
  
2. Select **Billing** > **Your products**, and then select the **Products** tab.
  
3. Select your Dynamics 365 subscription, and review the expiration date.

   > [!div class="mx-imgBorder"]
   > ![Check trial (subscription-based) expiration.](media/subscription-expiration-date.png "Check trial (subscription-based) expiration")

## Extend a trial (standard) environment

Note the following:

- Within the last 7 days before the standard trial environment is set to expire, the trial environment admin can do a self-service extension of the expiring environment. This adds an additional 30 days from the original expiration date.
- There is only one self-service extension allowed per standard trial environment. To further retain the environment, it must be [converted to production](#convert-either-type-of-trial-environment-to-a-production-environment).

**To extend a standard trial:**

### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) using admin credentials.
1. In the navigation pane, select **Manage**, then in the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an expiring environment with the **Extend trial** option.
1. The **Extend trial** option become available when 7 days or fewer remain before the environment expires.
1. Read the notification, then click **Extend trial** to extend the trial environment by 30 days from the original expiration date.
   
### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) using admin credentials.
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an expiring environment with the **Extend trial** option.
1. The **Extend trial** option become available when 7 days or fewer remain before the environment expires.
1. Read the notification, then click **Extend trial** to extend the trial environment by 30 days from the original expiration date.
---

## Extend a trial (subscription-based) environment

The expiration of subscription-based trial (also known as an admin trial) environments is tied to the expiration of the subscription. Therefore, subscription-based trial environments cannot be independently extended. There are limited options for extending admin trial subscriptions which affects extending the expiration of any associated trial environments.

**To extend a subscription-based (admin) trial:**

Admins can request a single extension in the Microsoft 365 admin center. See [Try or buy a Microsoft 365 for business subscription](/microsoft-365/commerce/extend-your-trial).

There is only one self-service extension allowed per offer-based trial environment. To further retain the environment, it must be [converted to production](#convert-either-type-of-trial-environment-to-a-production-environment).

## Convert either type of trial environment to a production environment

### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) using admin credentials.
1. In the navigation pane, select **Manage**, then in the **Manage** pane, select **Environments**.
1. On the **Environments** page, select a trial environment.
1. In the command bar, click **Convert to production**.
1. Click **Continue**. The conversion to a production environment may take several hours.
   
### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) using admin credentials.
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select a trial environment.
1. In the command bar, click **Convert to production**.
1. Click **Continue**. The conversion to a production environment may take several hours.
---

## Frequently asked questions

### What type of account can create a free trial environment?

For the best trial experience, we recommend you use your work or school email address that's managed by [Microsoft Entra ID.](https://azure.microsoft.com/services/active-directory/#overview)
If you create a standard trial environment from [https://trials.dynamics.com/](https://trials.dynamics.com/), some products may support consumer email account that's not managed by Microsoft Entra ID. 
> [!NOTE]
> If you use a consumer email account to create a trial environment, there'll be limitations in your trial experience, such as: 
> - You can't access the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) to manage the trial environment, extend the trial, or manage environment users. 
> - You can't access the [Microsoft 365 admin center](https://admin.microsoft.com/) to manage tenant users.
   
### Who can convert a trial environment to a production environment?

The organization (tenant) admin can determine who's allowed to create trial environments and convert them to production. If you're allowed to, and you have 1 GB of available production database capacity, you can convert a trial environment to production. You might need to free up or purchase additional capacity if the trial environment database exceeds available production capacity. To determine the size of the trial environment database, see [Dataverse storage capacity](capacity-storage.md).

### I can see a trial (subscription-based) environment type option, why can't I create this trial type?

Only tenant admins can create a trial (subscription-based) environment. Also, make sure that you have an active Dynamics 365 Trial subscription.

### Can I copy a trial environment?
Yes. Tenant admins can copy trial (subscription-based) environments to a target environment of the same type. 

### What administrative operations are supported for trial environments?
A 30-day trial can only be created and deleted; it can't be reset, backed up, restored, or copied.

### Why can’t I backup my trial environment?

Administrative operations (copy, backup, restore, and reset) are not supported for trials, except delete.

### How can I retain my data and resources if I don't have a way to convert the trial (standard) environment to a production environment?

You can export your resources and data to another environment if you want to retain them longer than the trial period. We recommend that you create a production environment or an individual environment (with the [Power Apps Developer Plan](https://powerapps.microsoft.com/communityplan/)) and export your resources to that environment. 

Here are some guidelines for exporting resources.

|Type of resource in the environment  |How do I export it?  |
|---------|---------|
|Apps (canvas and model-driven) and flows     |You can use [packaging](/powerapps/maker/data-platform/export-solutions) to export apps and flows from one environment.         |
|Data in the database (environment with a Dataverse database)     |<ul><li>[Export to Excel](/powerapps/user/export-data-excel) and save the data. You can then [import the data](/powerapps/user/import-data) into another environment.</li><li>Use [Data Integrator services](data-integrator.md) and APIs to export data into another environment.</li></ul> |

We delete trial (standard) environments that haven't had any activity in the environment databases for 30 days.

### See also
[Environments overview](environments-overview.md)<br/>
[Choose the right plans for your team](https://powerapps.microsoft.com/pricing/)<br/>
[Licensing overview](pricing-billing-skus.md) <br />
[Block trial licenses commands](powerapps-powershell.md#block-trial-licenses-commands) <br />
[Control who can create and manage environments in the Power Platform admin center](control-environment-creation.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
