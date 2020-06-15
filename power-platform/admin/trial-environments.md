---
title: Trials | Microsoft Docs
description: About trial and trial (subscription-based) environments
author: jimholtz
ms.reviewer: 
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/05/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# About trials

Using the Power Platform admin center, you can create four types of Common Data Service environments: sandbox, production, trial, or trial (subscription-based). Trials are useful for trying out model-driven apps in Dynamics 365 at no cost. Choose either a trial or trial (subscription-based) environment to get started with Dynamics 365 apps.

## Trial environments

Trial environments can be created by non-admin users for personal use. Here's what you should know.

**Trial environments:**
- Expire in 30 days
- Come with 25 user licenses
- Come with 1GB capacity
- Are a single environment
- Can be created by anyone with a valid subscription license
- Require admins to use PowerShell cmdlets to control creating trial environments or disabling trial environments

## Trial (subscription-based) environments

Trial (subscription-based) environments are suitable for broader, departmental-level exploration and have some significant advantages over trial environments.

**Trial (subscription-based) environments:**
- Are retained for as long as the subscription is valid, no expiration
- Have 3GB of capacity so 3 environments can be created
- Can be licensed based on your subscription license availability
- Only tenant admins can create
- Have extended lifecycle operations [Jim: need text/examples]

## Multiple ways to start a trial

The type of trial you create depends on where you start and your tenant-level permissions.


|Trial type  | Tenant-level permissions  | Create trial location  |
|---------|---------|---------|
|Trial     |  End user or admin      |  Power Platform admin center       |
|Trial     |  End user or admin         | https://trials.dynamics.com/        |
|Trial (subscription-based)      |  End user or admin        | Get started pages such as: <br /> <ul><li>https://dynamics.microsoft.com/en-us/get-started/?appname=salespro</li><br /><li>https://dynamics.microsoft.com/en-us/get-started/?appname=customerservice</li></ul>      |
|Trial (subscription-based)      | admin        | Power Platform admin center        |



## Setting up a trial (subscription-based) environment in Power Platform admin center



## Setting up a trial environment in Power Platform admin center


### Check the expiration date

To determine when a trial environment will expire:

1. Sign into the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) with admin credentials.

2. Go to **Environments** > [select a trial environment] > **See all**. Check out **Day(s) remain**.

   > [!div class="mx-imgBorder"] 
   > ![Trial days remaining](media/trial-expiration.png "Trial days remaining")

### Create a trial environment with Dynamics 365 apps

Currently, Dynamics 365 apps such as Dynamics 365 Sales and Dynamics 365 Customer Service can only be enabled in production environments. To create a trial with Dynamics 365 apps, see [Start your digital transformation here](https://trials.dynamics.com).

### Create a trial environment without Dynamics 365 apps

You can create a trial environment in the Power Platform admin center without Dynamics 365 apps such as Dynamics 365 Sales and Dynamics 365 Customer Service. See [Create and manage environments in the Power Platform admin center](create-environment.md) and select **Trial** as the environment type.




## Convert either trial type to production

While using the trial environment, if you created resources you want to retain longer than 30 days, convert the trial to a production environment.

If you have 1GB of available database capacity, you can convert a trial environment to production. You might need to free up or purchase additional capacity if the trial database exceeds 1GB. To determine the size of the trial database see: [Common Data Service storage capacity](capacity-storage.md).

Follow these steps to convert a trial environment to a production environment:

1. Sign into the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) with admin credentials.

2. Go to **Environments** > [select a trial environment] > **Convert to production**.

    > [!div class="mx-imgBorder"] 
    > ![Select Convert to production](media/trial-convert.png "Select Convert to production")

3. Select **Continue**.

It might take several hours to convert to a production environment.

## Frequently asked questions

### Who can convert a trial environment to a production environment?

If you have 1GB of available database capacity, you can convert a trial environment to production. You might need to free up or purchase additional capacity if the trial database exceeds 1GB. To determine the size of the trial database see: [Common Data Service storage capacity](capacity-storage.md).

### How can I retain my data and resources if I don't have a way to convert the trial environment to a production environment?

You can export your resources and data to another environment. If you want to retain them for a longer time, we recommend you create a production environment or an individual environment (with the [Power Apps Community Plan](https://powerapps.microsoft.com/communityplan/)) and export your resources to that environment. 

Here are some guidelines for exporting resources.

|Type of resource in the environment  |How do I export it?  |
|---------|---------|
|Apps (canvas and model-driven) and flows     |You can use [packaging](../alm/environment-and-tenant-migration.md) to export apps and flows from one environment.         |
|Data in the database (Common Data Service environment)     |You have multiple options:<br/><ul><li>[Export to Excel](/powerapps/user/export-data-excel) and save the data. You can [import the data](/powerapps/user/import-data) into another environment.</li><br/><li>You can use [Data Integrator services](data-integrator.md) and APIs to export data into another environment.</li></ul> |

We delete trial environments that haven't had any activity in the environment databases for 30 days.

### See also
[Environments overview](environments-overview.md)<br/>
[Choose the right plans for your team](https://powerapps.microsoft.com/pricing/)<br/>
[Licensing overview](pricing-billing-skus.md)
