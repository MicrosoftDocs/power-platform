---
title: "About the Project Oakdale environment (preview) | MicrosoftDocs"
description: About Project Oakdale environment
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/10/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# About the Project Oakdale environment

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../includes/cc-beta-prerelease-disclaimer.md)]

Introduced in September, 2020, *Project Oakdale* is a built-in, low-code data platform for Microsoft Teams that empowers users to build custom apps and workflows in Teams using Power Apps and Power Automate. Project Oakdale—built on Common Data Service—provides relational data storage, rich data types, enterprise-grade governance, and one-click solution deployment to Teams app store.

The Project Oakdale environment is automatically created for the selected team when you [create an app](/powerapps/teams/create-first-app) using the new *Power Apps app* in Teams for the first time or install a Power Apps app from the app catalog for the first time. The Project Oakdale environment is used to store, manage, and share team-specific data, apps, and flows. Each team can have one environment and all data, apps and flows created using the Power Apps app inside a team are available from that team's [Project Oakdale](/powerapps/teams/overview-data-platform) database.  

> [!NOTE]
> - This is a preview feature
> - [!INCLUDE [cc-preview-features-definition.md](../includes/cc-preview-features-definition.md)]

You can identify a Project Oakdale environment in the [Power Platform admin center](https://admin.powerplatform.microsoft.com) using the **Type** column in the list of environments.

> [!div class="mx-imgBorder"] 
> ![Project Oakdale environment in list](media/teams-environment-list.png "Project Oakdale environment in list")

## Licensing and restrictions 
Note the following regarding access to Power Platform apps in Teams.

- Project Oakdale capabilities will be available as part of select Microsoft 365 subscriptions. See the licensing guide.

- Teams can invite guests who can access the apps, flows, and data in the Teams Project Oakdale database within their team. However, they won’t be allowed to install, make, or edit apps. They can only discover and run apps in their team. 

- Apps created in Teams that use Project Oakdale will only be accessible in Teams and Teams Mobile, regardless of the user’s license.  

- For any standalone Power Apps or Power Automate usage, which includes API access as well, the Project Oakdale schema will need to be promoted to Common Data Service.  

- No direct API access or pro developer experience will be provided and only Power Apps embedded within the Teams client will be able to access runtime.  

## Admin experience 
Tenant owners and members will be allowed to create their first app template or create a blank table app for the Team. For detailed guidance on creating blank table apps, see [Project Oakdale tables: Overview](/powerapps/teams/overview-tables). 

Team owners will be allowed to delete a team associated to a Project Oakdale environment that will trigger the deletion of that environment.  

<!--
By design and per GDPR guidelines, tenant admins and/or Power Platform admins will not be able to access any of the core customer data in the Project Oakdale environment. However, they will be able to perform all system management operations, including customizations and updating user records, among other options. 
-->


## Environment lifecycle

This section provides a summary of key lifecycle operations that will be allowed with Project Oakdale environments.

> [!NOTE]
> The Project Oakdale environment name is the same as the team name. You can filter the list of environments in the Power Platform admin center to show just Project Oakdale environments.

|Operations  |Feature description  |Available in preview  |
|---------|---------|---------|
|Backup     | Automated backups and labeled backups can be taken. Admins can view them in the Power Platform admin center. Backups will be available for up to 7 days.        |  Yes       |
|Restore     | Only point-in-time restores to the same environment will be possible. Note: if the environment has been promoted, the point in time restore will only be available starting from the moment it was promoted. | Yes        |
|Copy     | Not available by default for Project Oakdale environments.        | No        |
|Create     | Only through Teams. Note: these Project Oakdale environments will be limited to a 1:1 mapping to the Teams team it was created in and bound to the Microsoft 365 Group associated to the team.        | Yes        |
|Delete     | The environment can be deleted by the team owner. Note: the environment will be deleted automatically if the team it was created in is also deleted.| Yes  |
|Reset     | Not available by default for Project Oakdale environments.        | No        |
|Promote     | Unlocks all the functionalities of the Common Data Service services for the environment.         | Yes        |

The lifetime of the environment will be tied to the team it was created in. If you promote an environment to Common Data Service, the 1:1 mapping is not guaranteed as the environment can now be used by applications outside of Teams. The promoted environment is bound by the lifecycle rules associated to the Power Apps license and the configuration of the environment.

Some operations are blocked by default, such as the Copy and Reset operations. For scenarios where you would need this capability, Common Data Service environments should be used. See the previous table for details.

> [!IMPORTANT]
> Project Oakdale environments won’t be allowed to change types until the promote operation has been carried out on the environment. Once the promotion completes, the Project Oakdale environment will have the full capabilities found in Common Data Service. In addition to the standard termination of the environments, if the Microsoft Office license expires, there will also be an inactivity clause for these environments. Specifically, when an environment is unused for over 3 months, it will be disabled and ultimately deleted. 
>
> If the team is deleted, the Project Oakdale environment that was created will also be deleted. The Project Oakdale environment itself may be deleted from within the team by the team owner. A warning will be provided prior to allowing the deletion to go through, to ensure there are no accidental deletions. 

## User access to Project Oakdale environments

In an environment such as Teams that can be collaborative in the development and use of apps, bots, and data, it’s important to understand how access is granted to the different types of roles within the service.

This section summarizes user access to Project Oakdale environments and resources.

### User access requirements
For users to access Project Oakdale environment apps, bots, and data, they should:

- [Be enabled in Azure Active Directory](create-users-assign-online-security-roles.md#create-a-user-account).
- Have an active Office 365 license in a plan that includes Teams. See [Licensing and restrictions](#licensing-and-restrictions).
- Be a member of the Microsoft Teams team.

### Conceptual model

Every Microsoft Teams is linked 1:1 to a [Microsoft 365 Group](https://docs.microsoft.com/microsoft-365/admin/create-groups/office-365-groups?view=o365-worldwide).

Microsoft 365 Groups support two user membership types: owners and members. Members can be users from the customer‘s own tenant or from a guest tenant. Any user management (addition, removal, user type change) made in a team will be reflected in the Microsoft 365 Group, and vice versa.

Access to a Project Oakdale environment and its resources (apps, data) will be restricted to only users in the team. The Microsoft 365 Group linked to a team will be automatically associated with the Project Oakdale environment, restricting access to only users of that Microsoft 365 Group. This Microsoft 365 Group association with the Project Oakdale environment will not be editable until the environment is promoted to Common Data Service. 

### Role assignments 

|Persona  |Description  |  Security role auto-assigned   |
|---------|---------|---------|
|Teams owner      | Owners can manage team membership and settings in the team. They have full access to all the environment’s apps/resources and data. They can perform environment maintenance such as backup and restore. | System Administrator     |
|Teams member      | Members are people in the team.  They can view all environment’s resources, run all apps and resources, and can create/update their own resources.  They have full access to all data.      |Teams member      |
| Teams guest  | Guests are people from outside the tenant that a team owner invites, such as a partner or a customer. They can view and run all resources in the team.  By default, guests have no access to data. Their data access rights can be granted based on the app/resources that they need to run. | Teams guest | 
|Global admin / Power Platform admin who is not in the team | These are the tenant’s Global admins who manage the health and maintenance of the tenant environments. They are typically not members of the team. They can perform environment maintenance such as backup and restore.      | System Administrator         |
|Application user | Application users are people from inside the tenant who are invited to run apps in the team. By default, Application users have no access to data. Their data access rights can be granted based on the app/resources that they need to run. | Common Data Service User |
|Dynamics 365 admin who is not in the team (that is, not in the Microsoft 365 Group) | These admins will not have access to manage the health and maintenance of the team environment.    | No access since a Project Oakdale environment will always have the Team’s Microsoft 365 Group associated with it, and Dynamics 365 Service admins are excluded from environments for which they are not in the associated group.         |

## Project Oakdale environments settings and actions
<!-- fwlink 2133713  -->

To change settings for a Project Oakdale environment, go to **Environments** > [select an environment] > **Settings**.

> [!div class="mx-imgBorder"] 
> ![Project Oakdale environment settings](media/teams-environment-settings.png "Project Oakdale environment settings")

 
### Users + permissions
<!-- fwlink 2123134 2127762 -->

You can specify users in an environment to provide access to Project Oakdale environment apps, bots, and data.

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select **Environments** from the left-side navigation, and then select a Project Oakdale environment.

2. Select **Settings**.

3. Select **Users + permissions**, and the select **Users**.

   A list of enabled and disabled users who are members of the Project Oakdale environment appears. By default, [need info] are members.

   > [!div class="mx-imgBorder"] 
   > ![List of users in Project Oakdale environment](media/teams-environment-user-list.png "List of users in Project Oakdale environment") 

4. You can select a user from the list to view user details and do simple user management such as enable, disable or delete a user.

5. Select **+ Add user** to add a user to the selected Project Oakdale environment.

6. Enter a name or email address of the user to add to the Project Oakdale environment, and then select **Add**.

   > [!div class="mx-imgBorder"] 
   > ![Add a user](media/teams-environment-add-user.png "Add a user") 

7. Select **Refresh** to see the added user in the list.

### Microsoft Teams Integration

Tenant admins can select **Microsoft Teams Integration** to enable embedding model-driven apps into Teams. Once selected, users can use model-driven apps in Teams without using customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation).

> [!IMPORTANT]
> Model-driven apps can execute code that may not be generated by Microsoft. Make sure that the code for the apps in this environment are from a trusted source.

### Delete a Project Oakdale environment

To delete a Project Oakdale environment, select it from the list of environments and then select **Delete**.

> [!div class="mx-imgBorder"] 
> ![Delete a Project Oakdale environment](media/teams-environment-manage-delete.png "Delete a Project Oakdale environment")

### Promote a Project Oakdale environment to production

Select **Promote to production**. See [Promotion process](#promotion-process).

## Capacity limits

The consumption of capacity by Project Oakdale environments will not count towards the tenant’s capacity limits. Instead, we will provide a pool of database capacity for Project Oakdale environments, which will be separate from the tenant’s Power Platform Common Data Service capacity pool. Capacity will not be transferable between these two pools.  

**Per-environment limits on Project Oakdale environments**: Each Project Oakdale environment will be restricted to 2 GB of database storage. To see the consumption of each Project Oakdale environment in a tenant, navigate to Power Platform admin center (https://aka.ms/ppac), then to **Resources** -> **Capacity** -> **Microsoft Teams Capacity**.   

> [!div class="mx-imgBorder"] 
> ![Project Oakdale environment capacity](media/teams-environment-capacity.png "Project Oakdale environment capacity")

**Tenant-wide limits on Project Oakdale environments**: Each tenant will also have limits related to Project Oakdale environments defined as follows:  

|Unit  |Service limit  |
|---------|---------|
|Project Oakdale environments      | 5 + 1 per 20 eligible office seats (up to a maximum of 500 environments) <br /> This limit on the number of environments cannot be extended further in Project Oakdale environments. Should more instances be needed, consider deleting unused environments or promoting to Common Data Service.   |
|Max Project Oakdale environment storage per tenant      | 10 GB + Project Oakdale environments x 2 GB (up to a max of 1 TB). <br /> This storage limit cannot be extended further in Project Oakdale environments. Should more storage be needed, consider promoting to Common Data Service.  |
|Max Project Oakdale environments API calls  | API requests in Microsoft Power Platform consist of various actions which a user makes across various products.  <br /> For more information on API calls and the per user limits available, see the following documentation:  https://aka.ms/PowerPlatformRequestEntitlements  |

### Enforcement

Below are the actions that we will take when customers approach and exceed the environment-level or tenant-wide Teams limits. 

#### Environment-level enforcement actions  

When a Project Oakdale environment in a team approaches or hits the 2 GB capacity limit, the following actions will be taken: 
- At 80% of the limit, the Teams users will see in the Teams maker experience a message informing them the capacity limit is about to be reached. At this point, customers are encouraged to either reduce storage usage or contact their admin for other options.  
- At 100% of the limit, any existing apps will continue to work, and existing apps can be updated. However, new apps and flows can't be created or installed as a result of having reached the capacity limit. 

#### Tenant-level enforcement  

When a tenant approaches or reaches their tenant-wide Teams limits described above, the following actions will be taken: 
- At 80% of the limit, a notification will be sent to the Power Platform admin center admin informing of the approaching capacity limit, and to consider reducing storage usage or promoting some of the Project Oakdale environments. 
- At 100% of the limit, the creation of new Project Oakdale environments will be blocked. Any users attempting to create a new Project Oakdale environment will be prompted to contact the tenant admin as the result of the capacity limit being reached. Additionally, new apps and flows won't be allowed to be created or installed in an existing Project Oakdale environment.  

As mentioned for the environment-level enforcement, any existing apps will still be able to function as expected.  

## Promotion process 
<!-- fwlink 2122620 for failure need 1GB -->
<!-- fwlink 2134779 for for a few thing to know -->

The high-level flow and business rules for promoting a Project Oakdale environment follow. 

A tenant admin will be allowed to promote a Project Oakdale environment to a Common Data Service database environment. A typical flow is as follows:  

:::image type="content" source="media/teams-environment-promotion-process.png" alt-text="Project Oakdale environment promotion process":::

1. Within a team, the Teams user chooses to create a Power Apps app using the new integrated Teams/Power Apps app creation experience, or install a pre-existing Project Oakdale environment-based app. At this point, a Project Oakdale environment is provisioned for that team.  

2. Over time, the data stored in the Project Oakdale environment will grow and will eventually reach the capacity limit that these environments have (2 GB). At this point, existing apps will continue to operate but new applications won't be allowed to be created or installed. Customers will be directed to contact a tenant admin to promote the Project Oakdale environments to Common Data Service and obtain more capacity. Alternatively, a Teams user could request the admin to promote because of a feature they want to use in Common Data Service.  

3. Admins will review the request from the Teams user and will make the decision to promote the environment from Teams to Common Data Service. At this point, the admin will go to the Power Platform admin center environments view to execute the promotion.   

   > [!NOTE]
   > To successfully carry out the promotion, the tenant must have at least as much available capacity as the size of the Project Oakdale environment that is being promoted. Post promotion, the consumed capacity of the promoted Project Oakdale environment will start counting towards the tenant’s capacity. Should a customer attempt to promote it anyways, the promote operation will be blocked and an appropriate error message will be displayed explaining why it failed.  

4. Admins will be given a message with the implications of promoting and asked to confirm the action.  

5. If the Admin confirms, the promotion will now go forward. As the promotion progresses, various notifications will be provided as the operation transitions through the various states.  

Post promotion, the following applies to the newly promoted environment:  
-	The promoted environment’s lifecycle will no longer be tied to the lifecycle of that team. If the team is deleted, the promoted environment remains. 
-	Any apps running on the environment will require Power Platform (Power Apps, Power Automate) licenses to be accessed. 
-	The apps can run inside and outside of Teams. 
- All existing apps will be associated with the promoted environment (Common Data Service) and can leverage the extended set of entities. 
-	The promoted environment capacity will start counting against the tenant’s Common Data Service capacity. 
- The Microsoft 365 Group association will become editable. 
- Teams owners are assigned the System Admin roles on their environment and can access the environment using the Power Platform admin center. 
- Adding a new Teams Template app to the prior team won’t create a new Project Oakdale Environment for the team. 

## Related topics
[Power Apps and Teams integration: Overview](/powerapps/teams/overview) <br/>[Create flows with the Power Apps app in Teams](/power-automate/teams/create-flows-power-apps-app)

