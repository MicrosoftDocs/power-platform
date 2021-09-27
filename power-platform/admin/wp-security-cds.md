---
title: "Security concepts in Microsoft Dataverse | MicrosoftDocs"
description: Provides detailed information about the security model and concepts in Microsoft Dataverse.
ms.date: 09/27/2021
ms.service: power-platform
ms.topic: "article"
author: jimholtz
ms.subservice: admin
ms.author: jimholtz
ms.reviewer: jimholtz
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Security concepts in Microsoft Dataverse

One of the key features of [Dataverse](/powerapps/maker/common-data-service/data-platform-intro) is its rich security model that can adapt to many business usage scenarios. This security model is only in play when there is a Dataverse database in the environment. As an administrator, you likely won't be building the entire security model yourself, but will often be involved in the process of managing users and making sure they have the proper configuration and troubleshooting security access related issues.

> [!TIP]
> ![Video symbol](../admin/media/video-thumbnail-4.png "Video symbol") Check out the following video: [Microsoft Dataverse – Security Concepts Shown In Demos](https://youtu.be/8UWSj-vvxzU)  

## Role-based security

Dataverse uses role-based security to group together a collection of privileges. These [security roles](security-roles-privileges.md) can be associated directly to users, or they can be associated with Dataverse teams and business units. Users can then be associated with the team, and therefore all users associated with the team will benefit from the role. A key concept of Dataverse security to understand is all privilege grants are accumulative with the greatest amount of access prevailing. If you gave broad organization level read access to all contact records, you can’t go back and hide a single record.

## Business units

Business units work with security roles to determine the effective security that a user has. Business units are a security modeling building block that helps in managing users and the data they can access. Business units define a security boundary. Every Dataverse database has a single root business unit.

You can [create child business units](./create-edit-business-units.md) to help further segment your users and data. Every user assigned to a Dataverse environment will belong to a business unit. While business units could be used to model 1:1 a true organization hierarchy, more often they lean more towards just defined security boundaries to help achieve the security model needs.

To better understand let’s look at the following example. We have three business units. Woodgrove is the root business unit and will always be at the top, that is unchangeable. We've created two other child business units A and B. Users in these business units have very different access needs. When we associate a user with this Dataverse environment, we can set the user to be in one of these three business units. Where the user is associated will determine which business unit owns the records that user is the owner of. By having that association allows us to tailor a security role to allow the user to see all records in that business unit.

To better understand let’s look at two examples. The two examples have three business units. Woodgrove is the root business unit and will always be at the top; that is unchangeable. We've created two other child business units A and B. Users in these business units have very different access needs. 

### Hierarchical data access structure  

Customers can use an organization structure where data and user are compartmentalized in a tree-like hierarchy.  

When we associate a user with this Dataverse environment, we can set the user to be in one of these three business units and assign a security role from the business unit to the user. The business unit the user is associated with determines which business unit owns the records when the user creates a record. By having that association it allows us to tailor a security role which allows the user to see records in that business unit. 

User A is associated with Division A and assigned a security role Y from Division A. This allows user A to access the Contact #1 and Contact #2 records. While user B in Division B cannot access Division A’s Contact records but can access Contact #3 record. 

> [!div class="mx-imgBorder"] 
> ![Matrix data access structure example](media/example-business-unit0.png "Matrix data access structure example")

### Matrix data access structure (Modernize Business Units - Preview) 

Customers can use an organization structure where data is compartmentalized in a tree-like hierarchy, and users can work and access any business unit’s data regardless of what the business unit the user is assigned to. 

When we associate a user with this Dataverse environment, we can set the user to be in one of these three business units. For each business unit that a user needs to access data, a security role from that business unit is assigned to the user. When the user creates a record, the user can set the business unit to own the record.  

User A can be associated with any of the business units, including the root business unit. A security role Y from Division A is assigned to user A which gives the user access to Contact #1 and Contact #2 records.  A security role Y from Division B is assigned to user A which gives the user access to Contact #3 record. 

> [!div class="mx-imgBorder"] 
> ![Hierarchical data access structure example](media/example-business-unit.png "Hierarchical data access structure example")

#### To enable this Matrix data access structure (preview): 

1. Sign in to the Power Platform admin center, as an admin (Dynamics 365 admin, Global admin, or Microsoft Power Platform admin). 
2. Select the **Environments** tab, and then choose the environment that you want to enable this feature for. 
3. Select **Settings** > **Product** > **Features**. 
4. Turn **On** the **Record ownership across business units** switch. 

Once this feature switch is turned on, you can select Business unit when you [assign a security role to a user](assign-security-roles.md). This allows you to assign security from different business units to a user.

### Owning Business Unit

Each record has an Owning Business Unit field which determines which business unit owns the record. This field defaults to the user’s business unit when the record is created and cannot be changed except when the feature switch is turned ON. 

You can manage whether you want to allow your user to set the Owning Business Unit field when the feature switch is ON. To set the Owning Business Unit field, you need to grant the user’s security role the Business Unit table’s **Append** and **Append To** privileges with Business Unit permission.  

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

## Teams

Teams are another important security building block. Teams are owned by a Business Unit. Every Business Unit has one default team that is automatically created when the Business Unit is created. The default team members are managed by Dataverse and always contain all users associated with that Business Unit. You can’t manually add or remove members from the default team, they're dynamically adjusted by the system as [new users are associated/disassociated with business units](./create-edit-business-units.md). There are two types of teams, owning teams and access teams.
- Owning Teams can own records, which give any team member direct access to that record. Users can be members of multiple teams. This will allow it to be a powerful way of granting permissions to users in a broad way without micromanaging access at the individual user level. 
- Access teams are discussed in the next section as part of record sharing.

## Record sharing

Individual records can be shared on a one by one basis with another user. This is a powerful way of handling exceptions that don’t fall into the record ownership or member of a business unit access model. It should be an exception though because it's a less performant way of controlling access. Sharing tougher to troubleshoot because it's not a consistently implemented access control. Sharing can be done at both the user and team level. Sharing with a team is a more efficient way of sharing. A more advanced concept of sharing is with Access Teams which provides auto creation of a team and sharing of record access with the team based on an Access Team Template (template of permissions) which is applied. Access teams can also be used without the templates, with just manual add/remove of its members. Access teams are more performant because they don’t allow owning records by the team or having security roles assigned to the team. Users get access because the record is shared with the team and the user is a member.

### Record-level security in Dataverse

You might be wondering – what determines access to a record? That sounds like a simple question but for any given user it is the combination of all their security roles, the business unit they are associated with, the teams they are members of and the records that are shared with them. The key thing to remember is all access is accumulative across all those concepts in the scope of a Dataverse database environment. These entitlements are only granted within a single database and are individually tracked in each Dataverse database. This all requires they have an appropriate license to access Dataverse.

### Field-level security in Dataverse

Sometimes record-level control of access is not adequate for some business scenarios. Dataverse has a field-level security feature to allow more granular control of security at the field level. Field-level security can be enabled on all custom fields and most system fields. Most system fields that include personal identifiable information (PII) are capable of being individually secured. Each field’s metadata defines if that is an available option for the system field.

Field-level security is enabled on a field by field basis. Access is then managed by creating a Field Security Profile. The profile contains all fields that have field-level security enabled and the access granted by that specific profile. Each field can be controlled within the profile for Create, Update and Read access. Field Security Profiles are then associated with a user or Teams to grant those privileges to the users to the records they already have access to. It’s important to note that field-level security has nothing to do with record-level security. A user must already have access to the record for the Field Security Profile to grant them any access to the fields. Field-level security should be used as needed and not excessively as it can add overhead that is detrimental if over used.

### Managing security across multiple environments

Security roles and Field Security Profiles can be packaged up and moved from one environment to the next using Dataverse solutions. Business Units and Teams must be created and managed in each Dataverse environment along with the assignment of users to the necessary security components.

### Configuring users environment security

Once roles, teams, and business units are created in an environment, it's time to assign the users their security configurations. First, when you create a user, you'll associate the user with a business unit. By default, this is the root business unit in the organization. They're also added to the default team of that business unit.

In addition, you would assign any security roles that user needs. You would also add them as members of any teams. Remember teams can also have security roles, so the effective rights of the user is the combination of directly assigned security roles combined with those of any teams they're members of. Security is always additive offering the least restrictive permission of any of their entitlements. The following is a good walkthrough of [configuring environment security](database-security.md).

If you have used field-level security, you would need to associate the user or a team of the user to one of the Field Securities Profiles you created.

Security is a complex article and is best accomplished as a joint effort between the application makers and the team administering the users permissions. Any major changes should be coordinated well in advance of deploying the changes into the environment.

### See also
[Configure environment security](database-security.md)<br/>
[Security roles and privileges](security-roles-privileges.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
