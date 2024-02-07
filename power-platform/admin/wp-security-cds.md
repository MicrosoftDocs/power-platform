---
title: "Security concepts in Microsoft Dataverse | MicrosoftDocs"
description: Provides detailed information about the security model and concepts in Microsoft Dataverse.
ms.date: 12/06/2022
ms.topic: conceptual
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: jimholtz
ms.custom: "admin-security"
search.audienceType: 
  - admin
---

# Security concepts in Microsoft Dataverse

One of the key features of [Dataverse](/powerapps/maker/common-data-service/data-platform-intro) is its rich security model that can adapt to many business usage scenarios. This security model is only in play when there is a Dataverse database in the environment. As an administrator, you likely won't be building the entire security model yourself, but will often be involved in the process of managing users and making sure they have the proper configuration and troubleshooting security access related issues.

> [!TIP]
> ![Video symbol](../admin/media/video-thumbnail-4.png "Video symbol") Check out the following video: [Microsoft Dataverse – Security Concepts Shown In Demos](https://youtu.be/8UWSj-vvxzU).  

## Role-based security

Dataverse uses role-based security to group together a collection of privileges. These [security roles](security-roles-privileges.md) can be associated directly to users, or they can be associated with Dataverse teams and business units. Users can then be associated with the team, and therefore all users associated with the team will benefit from the role. A key concept of Dataverse security to understand is all privilege grants are accumulative with the greatest amount of access prevailing. If you gave broad organization level read access to all contact records, you can’t go back and hide a single record.

## Business units

> [!TIP]
> ![Video symbol](../admin/media/video-thumbnail-4.png "Video symbol") Check out the following video: [Modernize business units](https://www.microsoft.com/videoplayer/embed/RWOdR4). 


Business units work with security roles to determine the effective security that a user has. Business units are a security modeling building block that helps in managing users and the data they can access. Business units define a security boundary. Every Dataverse database has a single root business unit.

You can [create child business units](./create-edit-business-units.md) to help further segment your users and data. Every user assigned to an environment will belong to a business unit. While business units could be used to model 1:1 a true organization hierarchy, more often they lean more towards just defined security boundaries to help achieve the security model needs.

To better understand let’s look at the following example. We have three business units. Woodgrove is the root business unit and will always be at the top, that is unchangeable. We've created two other child business units A and B. Users in these business units have very different access needs. When we associate a user with this environment, we can set the user to be in one of these three business units. Where the user is associated will determine which business unit owns the records that user is the owner of. Having that association allows us to tailor a security role to allow the user to see all records in that business unit.

### Hierarchical data access structure  

Customers can use an organization structure where data and user are compartmentalized in a tree-like hierarchy.  

When we associate a user with this environment, we can set the user to be in one of these three business units and assign a security role from the business unit to the user. The business unit the user is associated with determines which business unit owns the records when the user creates a record. By having that association it allows us to tailor a security role which allows the user to see records in that business unit. 

User A is associated with Division A and assigned a security role Y from Division A. This allows user A to access the Contact #1 and Contact #2 records. While user B in Division B cannot access Division A’s Contact records but can access Contact #3 record. 

> [!div class="mx-imgBorder"] 
> ![Matrix data access structure example](media/example-business-unit0.png "Matrix data access structure example")

### Matrix data access structure (Modernized Business Units) 

Customers can use an organization structure where data is compartmentalized in a tree-like hierarchy, and users can work and access any business unit’s data regardless of what the business unit the user is assigned to. 

When we associate a user with this environment, we can set the user to be in one of these three business units. For each business unit that a user needs to access data, a security role from that business unit is assigned to the user. When the user creates a record, the user can set the business unit to own the record.  

User A can be associated with any of the business units, including the root business unit. A security role Y from Division A is assigned to user A which gives the user access to Contact #1 and Contact #2 records.  A security role Y from Division B is assigned to user A which gives the user access to Contact #3 record. 

> [!div class="mx-imgBorder"] 
> ![Hierarchical data access structure example](media/example-business-unit.png "Hierarchical data access structure example")

#### Enable the Matrix data access structure

> [!NOTE]
> Before you enable this feature, you must publish all your customizations to enable all your new unpublished tables for the feature. If you find that you have unpublished tables that are not working with this feature after you have turned it on, you can set the **RecomputeOwnershipAcrossBusinessUnits** setting using the [OrgDBOrgSettings tool for Microsoft Dynamics CRM](https://support.microsoft.com/help/2691237/orgdborgsettings-tool-for-microsoft-dynamics-crm). Setting **RecomputeOwnershipAcrossBusinessUnits** to true allows the [Owning Business Unit](#owning-business-unit) field to be set and updated.

1. Sign in to the [Power Platform admin center](https://aka.ms/ppac) as an admin (Dynamics 365 admin, Global admin, or Microsoft Power Platform admin). 
2. Select **Environments**, and then choose the environment that you want to enable this feature for. 
3. Select **Settings** > **Product** > **Features**. 
4. Turn **On** the **Record ownership across business units** switch. 

Once this feature switch is turned on, you can select Business unit when you [assign a security role to a user](assign-security-roles.md). This allows you to assign security role from different business units to a user. The user also requires a security role from the business unit that the user is assigned to with [user settings privileges](assign-security-roles.md#user-settings-privileges-for-record-ownership-across-business-units) to run model-driven apps. You can refer to the [Basic User](database-security.md#predefined-security-roles) security role to find how these user settings privileges are enabled. 

You can assign a user as record owner in any business unit without the need to assign a security role in the record's owning business unit as long as the user has a security role that has Read privilege to the record table. See [Record Ownership in Modernized Business Units](wp-security-cds.md#record-ownership-in-modernized-business-units). 

> [!NOTE]
> This feature switch is stored in the **EnableOwnershipAcrossBusinessUnits** setting and can be set using the [OrgDBOrgSettings tool for Microsoft Dynamics CRM](https://support.microsoft.com/help/2691237/orgdborgsettings-tool-for-microsoft-dynamics-crm).

### Associate a business unit with a Microsoft Entra security group

You can use a Microsoft Entra security group to map your business unit for streamlining your user administration and role assignment.  

**Create a Microsoft Entra security group for each business unit and assign the respective business unit security role to each group team.**

:::image type="content" source="media/business-unit-with-aad-sec-group2.png" alt-text="Create a Microsoft Entra security group for each business unit.":::

For each business unit, create a Microsoft Entra security group. Create a [Dataverse group team](manage-group-teams.md) for each Microsoft Entra security group. Assign the respective security role from the business unit to each Dataverse group team. The user in the above diagram will be created in the root business unit when the user accesses the environment. It's fine to have the user and the Dataverse group teams to be in the root business unit. They only have access to data in the business unit where the security role is assigned.  

Add users into the respective Microsoft Entra security group to grant them access to the business unit. The users can immediately run the app and access its resources/data. 

In the [matrix data access](wp-security-cds.md#matrix-data-access-structure-modernized-business-units), where users can work and access data from multiple business units, add the users to the Microsoft Entra security groups that mapped to those business units.  

### Owning Business Unit

Each record has an **Owning Business Unit** column which determines which business unit owns the record. This column defaults to the user’s business unit when the record is created and cannot be changed except when the feature switch is turned ON. 

> [!NOTE]
> When you change which business unit owns a record, be sure to check out the following for cascade effects: [Using SDK for .NET to configure cascading behavior](/powerapps/developer/data-platform/configure-entity-relationship-cascading-behavior#using-organization-service-to-configure-cascading-behavior).

You can manage whether you want to allow your user to set the Owning Business Unit column when the feature switch is ON. To set the Owning Business Unit column, you need to grant the user’s security role the Business Unit table’s **Append To** privilege with local level permission.  

To allow your user to set this column, you can enable this column in the following:
1. Form - both the body and header.
2. View.
3. [Column mappings](/powerapps/developer/data-platform/customize-entity-attribute-mappings). If you are using the [AutoMapEntity](/powerapps/developer/data-platform/customize-entity-attribute-mappings#auto-mapping-columns-between-tables), you can specify the column in your column mapping. 

> [!NOTE]
> If you have a job/process to sync data between environments and the **Owning Business Unit** is included as part of the schema, your job will fail with a **Foreign KEY** constraint violation if the target environment does not have the same **Owning Business Unit** value. 
> 
> You can either remove the **Owning Business Unit** column from the source schema, or update the **Owning Business Unit** column value of the Source to any of the business units of the target.
>
> If you have a job/process to copy data from an environment to an external resource, for example PowerBI, you will need to select or deselect the **Owning Business Unit** column from your source. Select it if your resource can receive it otherwise deselect it.

## Table/record ownership

Dataverse supports two types of record ownership. Organization owned, and User or Team owned. This is a choice that happens at the time the table is created and can’t be changed. For security purposes, records that are organization owned, the only access level choices is either the user can do the operation or can’t. For user and team owned records, the access level choices for most privileges are tiered Organization, Business Unit, Business Unit and Child Business Unit or only the user’s own records. That means for read privilege on contact, I could set user owned, and the user would only see their own records.

To give another example, let’s say User A is associated with Division A, and we give them Business Unit level Read access on Contact. They'd be able to see Contact #1 and #2 but not Contact #3.

When you configure or edit security role privileges, you're setting the access level for each option. The following is an example of the Security Role privilege editor.

> [!div class="mx-imgBorder"] 
> ![Security role privileges.](media/security-role-privileges.png "Security role privileges")


In the above you can see the standard privilege types for each table Create, Read, Write, Delete, Append, Append To, Assign and Share. You can edit each of these individually. The visual display of each will match the key below as to what level of access you've granted.

> [!div class="mx-imgBorder"] 
> ![Security role privileges key.](media/security-role-privileges-key.png "Security role privileges key")


In the above example, we have given organization level access to Contact which means that the user in Division A could see and update contacts owned by anyone. In fact, one of the most common administrative mistakes is getting frustrated with permissions and just over granting access. Very quickly a well-crafted security model starts looking like swiss cheese (full of holes!).

## Record Ownership in Modernized Business Units ##

In **Modernized Business units**, you can have users being owners of records across any business units. All the users need is a security role (any business unit) which has Read privilege to the record table. The users don't need to have a security role assigned in each business unit where the record resides.

If **Record ownership across business units** was enabled in your production environment during the Preview period, you need to perform the following to enable this record ownership across business unit:

1. Install the [Organization Settings editor](environment-database-settings.md#install-the-organizationsettingseditor-tool)
2. Set the **RecomputeOwnershipAcrossBusinessUnits** organization settings to true. When this setting is set to true, the system is locked and can take up to 5 minutes to do the recomputation to enable the capability where users can now own records across business units without the need to have separate security role assigned from each business unit. This allows an owner of a record to assign their record to someone outside of the record's owning business unit.
3. Set **AlwaysMoveRecordToOwnerBusinessUnit** to false. This makes the record remain in the original owning business unit when the record ownership is changed.

For all non-production environments, you just need to set **AlwaysMoveRecordToOwnerBusinessUnit** to false to use this capability.

> [!NOTE]
> If you turn off either the **Record ownership across business units** feature or set the **RecomputeOwnershipAcrossBusinessUnits** setting to false using the [OrgDBOrgSettings tool for Microsoft Dynamics CRM](https://support.microsoft.com/help/2691237/orgdborgsettings-tool-for-microsoft-dynamics-crm), you won't be able to set or update the [Owning Business unit](wp-security-cds.md#owning-business-unit) field, and all records where the [Owning Business Unit](#owning-business-unit) field is different from the owner's business unit will be updated to the owner's business unit. 

## Teams (including [group teams](manage-group-teams.md))

Teams are another important security building block. Teams are owned by a Business Unit. Every Business Unit has one default team that is automatically created when the Business Unit is created. The default team members are managed by Dataverse and always contain all users associated with that Business Unit. You can’t manually add or remove members from the default team, they're dynamically adjusted by the system as [new users are associated/disassociated with business units](./create-edit-business-units.md). There are two types of teams, owning teams and access teams.
- Owning Teams can own records, which give any team member direct access to that record. Users can be members of multiple teams. This will allow it to be a powerful way of granting permissions to users in a broad way without micromanaging access at the individual user level. 
- Access teams are discussed in the next section as part of record sharing.

## Record sharing

Individual records can be shared on a one-by-one basis with another user. This is a powerful way of handling exceptions that don’t fall into the record ownership or is a member of a business unit access model. It should be an exception, though, because it's a less performant way of controlling access. Sharing is tougher to troubleshoot because it's not a consistently implemented access control. Sharing can be done at both the user and team level. Sharing with a team is a more efficient way of sharing. A more advanced concept of sharing is with Access Teams, which provides auto-creation of a team and sharing of record access with the team is based on an Access Team Template (template of permissions) which is applied. Access teams can also be used without the templates, with just manually adding or removing its members. Access teams are more performant because they don’t allow owning records by the team or having security roles assigned to the team. Users get access because the record is shared with the team and the user is a member.

### Record-level security in Dataverse

You might be wondering – what determines access to a record? That sounds like a simple question but for any given user it is the combination of all their security roles, the business unit they are associated with, the teams they are members of and the records that are shared with them. The key thing to remember is all access is accumulative across all those concepts in the scope of a Dataverse database environment. These entitlements are only granted within a single database and are individually tracked in each Dataverse database. This all requires they have an appropriate license to access Dataverse.

### Column-level security in Dataverse

Sometimes record-level control of access is not adequate for some business scenarios. Dataverse has a column-level security feature to allow more granular control of security at the column level. Column-level security can be enabled on all custom columns and most system columns. Most system columns that include personal identifiable information (PII) are capable of being individually secured. Each column’s metadata defines if that is an available option for the system column.

Column-level security is enabled on a column by column basis. Access is then managed by creating a Column Security Profile. The profile contains all column that have column-level security enabled and the access granted by that specific profile. Each column can be controlled within the profile for Create, Update and Read access. Column Security Profiles are then associated with a user or Teams to grant those privileges to the users to the records they already have access to. It’s important to note that column-level security has nothing to do with record-level security. A user must already have access to the record for the Column Security Profile to grant them any access to the columns. Column-level security should be used as needed and not excessively as it can add overhead that is detrimental if over used.

### Managing security across multiple environments

Security roles and Column Security Profiles can be packaged up and moved from one environment to the next using Dataverse solutions. Business Units and Teams must be created and managed in each environment along with the assignment of users to the necessary security components.

### Configuring users environment security

Once roles, teams, and business units are created in an environment, it's time to assign the users their security configurations. First, when you create a user, you'll associate the user with a business unit. By default, this is the root business unit in the organization. They're also added to the default team of that business unit.

In addition, you would assign any security roles that user needs. You would also add them as members of any teams. Remember teams can also have security roles, so the effective rights of the user is the combination of directly assigned security roles combined with those of any teams they're members of. Security is always additive offering the least restrictive permission of any of their entitlements. The following is a good walkthrough of [configuring environment security](database-security.md).

If you have used column-level security, you would need to associate the user or a team of the user to one of the Column Securities Profiles you created.

Security is a complex article and is best accomplished as a joint effort between the application makers and the team administering the users permissions. Any major changes should be coordinated well in advance of deploying the changes into the environment.

### See also
[Configure environment security](database-security.md)<br/>
[Security roles and privileges](security-roles-privileges.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]