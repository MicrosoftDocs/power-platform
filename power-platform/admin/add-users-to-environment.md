---
title: Add users to an environment automatically or manually
description: Learn about adding users to an environment and how the process differs when it has a Dataverse database. Use security groups to restrict access or add specific users. 
author: srpoduri 
ms.subservice: admin
ms.author: sripod
ms.reviewer: sericks
ms.custom: "admin-security"

ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/21/2023
search.audienceType: 
  - admin
---
# Add users to an environment  

Environments can have zero or one Microsoft Dataverse database. The process for adding users to environments that have no Dataverse database differs from the process for environments that have one Dataverse database. For an overview of environments, see [Environments overview](environments-overview.md). 

## Add users to an environment that has no Dataverse database 

You don't have to add users to environments that have no Dataverse database, because all users in the organization are present in these environments by default. However, for a user to get access to an environment's resources, a security role needs to be assigned to them. For information about assigning a security role to users in an environment, see [Configure user security to resources in an environment](database-security.md). 

## Add users to an environment that has a Dataverse database 

When an environment is created with a Dataverse database or a Dataverse database is added to an existing environment, all users in the organization are added automatically to the environment unless a security group is selected as an access filter. Review the following on automatic user addition to environments. 

- For a user to be successfully added to an environment that has a Dataverse database, the user must meet certain criteria. This same criteria applies to [enabling a user who is already present in an environment](create-users.md#enable-or-disable-user-accounts).  

- Automatic user addition to an environment takes time, especially if your organization is large and access to the environment isn't restricted to any security group. As a best practice, we recommend that you restrict access to your environment to a specific set of users by [associating your environment to a security group](control-user-access.md).

- The system also supports just-in-time (JIT) user provisioning. In this scenario, when users access an environment URL, access requirements are checked at the time of sign-in and qualified users are added to the environment. 

- In most cases, adding users to an environment only gives users access to the environment itself, not to any resources (apps and data) in the environment. You need to configure access to resources by [assigning security roles to users](database-security.md). Users with certain Dynamics 365 app licenses will be assigned some security roles by default that only give them read access to the environment's resources. Users who have been assigned service admin roles or the Global admin role, assigned through the Microsoft 365 admin center, will get the [System Administrator role](database-security.md#predefined-security-roles) by default. They will have admin privileges to the environment's resources when they get added to the environment. 

- Because it can take a long time to automatically add users to an environment, you can use the following procedure to add specific users to the environment sooner.

> [!TIP]
> Check out the following video: [Adding users to Dataverse](https://www.microsoft.com/videoplayer/embed/RWJBra).

**Important considerations when adding users to environments via automation**
We do not rely on UPN as the primary identifier to match users in the Dataverse database. We only honor AAD Object ID (AzureActiveDirectoryObjectId) as the primary identifier for user records in Dataverse database.
If you were previously relying on UPN match to import data into Dynamics CRM, you must make the following changes to your process. This change is required to prevent duplicate user records from being created in the system.

1.	Create the user records in Microsoft Entra before starting your data import process

2.	Sync the user from Microsoft Entra into the environment(s) where you intend to perform data import.
  a.	You can perform this sync in multiple ways: 
    i.	[By adding a security group to the environment](https://learn.microsoft.com/en-us/power-platform/admin/control-user-access#associate-a-security-group-with-an-environment)
    ii.	[By adding the user manually in the environment](https://learn.microsoft.com/en-us/power-platform/admin/add-users-to-environment#add-users-to-an-environment-that-has-a-dataverse-database)
    iii. [By using PowerShell scripts to add the user to the environment](https://learn.microsoft.com/en-us/powershell/module/microsoft.powerapps.administration.powershell/add-adminpowerappssyncuser?view=pa-ps-latest)
    iv.	[By leveraging Force sync in Power Automate flows](https://powerusers.microsoft.com/t5/Power-Apps-Community-Blog/Using-Force-Sync-User-to-sync-users-Power-Platform-Dynamics-365/ba-p/1605498)
3.	Once the system syncs the user(s) into the environment, run your data import workflows and/or other automations.

**To add users to an environment that has a Dataverse database**

1. From the Microsoft [Power Platform admin center](https://admin.powerplatform.microsoft.com), select the environment to which you want to add users. 

2. Select **Settings** > **Users + permissions** > **Users**. 

   You'll see the list of users that have already been added to the environment. This user list includes users with enabled and disabled status. More information: [Enable or disable users](create-users.md#enable-or-disable-user-accounts) 

3. Check to see whether the user you want to add might already be present in the environment by doing a search (because automatic user addition might have added the user already). If you don't find the user in the environment yet, select **Add user**. 

   > [!div class="mx-imgBorder"] 
   > ![Add user.](media/add-user.png "Add user")

4. In the **Add user** pane, enter the user's name or email address, select it, and add them to the environment. Note the requirements for successfully adding a user, and see [enable a user in an environment](create-users.md#enable-or-disable-user-accounts) for details about how to ensure the requirements are met. 

   > [!div class="mx-imgBorder"] 
   > ![Enter name.](media/add-user-enter-name.png "Enter name")

5. Select **Refresh** to see the added user in the list.

6. After a user is added to the environment, [assign a security role to the user](database-security.md) to configure their access to resources in the environment. 


[!INCLUDE[footer-include](../includes/footer-banner.md)]
