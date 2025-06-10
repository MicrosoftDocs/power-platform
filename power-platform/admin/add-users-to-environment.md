---
title: Add users to an environment automatically or manually
description: Learn about adding users to an environment and how the process differs when it has a Dataverse database. Use security groups to restrict access or add specific users. 
author: srpoduri 
ms.subservice: admin
ms.author: sripod
ms.reviewer: sericks
ms.custom: 
  - "admin-security"
  - NewPPAC
ms.component: pa-admin
ms.topic: how-to
ms.date: 07/23/2024
search.audienceType: 
  - admin
---
# Add users to an environment  

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Environments can have zero or one Microsoft Dataverse database. The process for adding users to environments that have no Dataverse database differs from the process for environments that have one Dataverse database. For an overview of environments, see [Environments overview](environments-overview.md). 

## Add users to an environment that has no Dataverse database 

You don't have to add users to environments that have no Dataverse database, because all users in the organization are present in these environments by default. However, for a user to get access to an environment's resources, a security role needs to be assigned to them. For information about assigning a security role to users in an environment, see [Configure user security to resources in an environment](database-security.md). 

## Add users to an environment that has a Dataverse database 

When you create an environment with a Dataverse database or add a Dataverse database to an existing environment, the system automatically adds all users in the organization—unless you select a security group as an access filter. Review the following details on automatic user addition to environments. 

- To successfully add a user to an environment with a Dataverse database, the user must meet certain criteria. This same criteria apply to [enabling a user who is already present in an environment](create-users.md#enable-or-disable-user-accounts).  

- Automatic user addition to an environment takes time, especially if your organization is large and access to the environment isn't restricted to any security group. As a best practice, we recommend that you restrict access to your environment to a specific set of users by [associating your environment to a security group](control-user-access.md).

- The system also supports just-in-time (JIT) user provisioning. In this scenario, when users access an environment URL, access requirements are checked at the time of sign-in and qualified users are added to the environment. 

- Adding users to an environment only gives users access to the environment itself, not to any resources (apps and data) in the environment. You need to configure access to resources by [assigning security roles to users](database-security.md). Users with certain Dynamics 365 app licenses are assigned default security roles that grant them read-only access to the environment's resources.

- Because it can take a long time to automatically add users to an environment, you can use the following procedure to add specific users to the environment sooner.

> [!TIP]
> Check out the following video: [Adding users to Dataverse](https://learn-video.azurefd.net/vod/player?id=373c7bec-b315-4958-8bb7-1d5d6fb03a81).

**To add users to an environment that has a Dataverse database**

#### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. on the **Environments** page, select the environment where you want to add users.
1. In the command bar, select **Settings**. 
1. Expand **Users + permissions**, then select **Users**.
   
#### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. on the **Environments** page, select the environment where you want to add users.
1. In the command bar, select **Settings**.  
1. Expand **Users + permissions**, then select **Users**. 
---

On the **Users** page:
- View the list of users already added to the environment, including those users with enabled and disabled status. More information: [Enable or disable users](create-users.md#enable-or-disable-user-accounts)
  
- Search the user list to check if the user you want to add is already present, as automatic user addition may add them. If the user isn't found, click **Add user** in the command bar. 

- In the **Add user** pane:
  - Enter the user's name or email address and select it.
  - Click **Add** to add them to the environment. Ensure the requirements for successfully adding a user are met—see [enable a user in an environment](create-users.md#enable-or-disable-user-accounts) for details. 

- On the **Users** page, select **Refresh** to update the list and see the added user. 

- Once a user is added to the environment, [assign a security role to the user](database-security.md) to define their access to resources. 


[!INCLUDE[footer-include](../includes/footer-banner.md)]
