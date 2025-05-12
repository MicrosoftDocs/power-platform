---
title: Add a Microsoft Dataverse database
description: Walkthrough of how to add a Microsoft Dataverse database.
services: powerapps
author: sericks007
ms.component: pa-admin
ms.topic: how-to
ms.date: 04/29/2025
ms.subservice: admin
ms.custom: NewPPAC
ms.author: sericks
search.audienceType: 
  - admin
---
# Add a Microsoft Dataverse database

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

You can create a database and build apps by using Dataverse as a data store. You can either create your own custom tables or use the predefined tables. To create a database, you first need to either create an environment, or be assigned to an existing environment as an **Environment Admin**. In addition, you must be assigned the appropriate license. For information on purchasing a plan for using Dataverse, see [Pricing info](pricing-billing-skus.md).

You can only add a single database to an environment. This article applies to customers who haven't yet added a Dataverse database to an environment.

There are various ways to add or create a database:

- In the Microsoft Power Platform admin center
- In the **Tables** pane of Power Apps (make.powerapps.com)

> [!NOTE]
> For security reasons, we don't support creating a copy of the database for local use.

## Add a database in the Power Platform admin center

#### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select the environment to which you want to add a database.
1. In the **Add Dataverse** web part, click **+ Add Dataverse**.
 
#### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select the environment to which you want to add a database.
1. In the **Add Dataverse** web part, click **+ Add Dataverse**.
---

In the **Add Dataverse** side pane, enter the following information, then select **Add** to apply the changes.

|Setting  |Description  |
|---------|---------|
|Language     | The default language for this environment. More information: [Dataverse language collations](language-collations.md)     |
|Currency     | The base currency used for reporting.         |
|Enable Dynamics 365 apps | Select **Yes** and make a selection to automatically deploy apps such as Dynamics 365 Sales and Dynamics 365 Customer Service. |
|Deploy sample apps and data     | Select **Yes** to include sample apps and data. Sample data gives you something to experiment with as you learn. You must select **No** for **Enable Dynamics 365 apps** for this setting to appear.        |
|Security group | Select a security group to restrict access to this environment. |

## Create a database in the Tables pane of Power Apps
1. Sign in to [Power Apps](https://make.powerapps.com).
2. In the navigation pane, select **Tables**.
3. Select **Create a database** to create the database.

## Security model for the databases
When a database is created, the users who have environment roles assigned to them, continue to maintain those privileges.  
    Users with **Environment Admin** role are assigned to **System Administrator** role. 
    Users with **Environment Maker** continue to possess the same role.

You can assign more users to predefined roles or even create custom roles. Learn more in [Database Security](database-security.md).

> [!NOTE]
> On creating the database, any security group assigned to Environment Admin or Environment Maker role aren't honored. Currently, assigning permissions in database, don't support Microsoft Entra security group.


## License and security permissions
To create a database, you must be an administrator in the selected environment, and the appropriate license must be assigned to you. From the environment, you can further configure security permissions for other users by using the **Security** tab. For more information, see [Configure database security](database-security.md).

## Privacy notice
With the Microsoft Power Apps Common Data Model we collect and store custom table and column names in our diagnostic systems.  We use this knowledge to improve the Common Data Model for our customers. The table and column names that Creators create help us understand scenarios that are common across the Microsoft Power Apps community and ascertain gaps in the service’s standard table coverage, such as schemas related to organizations. The data in the database tables associated with these tables isn't accessed or used by Microsoft or replicated outside of the region in which the database is provisioned. Note, however, the custom table and column names may be replicated across regions and are deleted in accordance with our data retention policies. Microsoft is committed to your privacy as described further in our [Trust Center](https://www.microsoft.com/trustcenter/Privacy/default.aspx).


[!INCLUDE[footer-include](../includes/footer-banner.md)]
