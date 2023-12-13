---
title: "Hierarchy security  | MicrosoftDocs"
description: Learn how to use hierarchy security to control access
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: sericks
ms.custom: "admin-security"
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/29/2023
search.audienceType: 
  - admin
ms.contributors:
- pmantha
---
# Hierarchy security to control access

The hierarchy security model is an extension to the existing security models that use business units, security roles, sharing, and teams. It can be used with all other existing security models. Hierarchy security offers a more granular access to records for an organization and helps to bring the maintenance costs down. For example, in complex scenarios, you can start with creating several business units and then add the hierarchy security. This provides more granular access to data with far less maintenance costs that a large number of business units may require.  
  
## Manager hierarchy and position hierarchy security models  
Two security models can be used for hierarchies, the _manager hierarchy_ and the _position hierarchy_. With the manager hierarchy, a manager must be within the same business unit as the report, or in the parent business unit of the report’s business unit, to have access to the report’s data. The position hierarchy allows data access across business units. If you're a financial organization, you may prefer the manager hierarchy model, to prevent managers’ accessing data outside of their business units. However, if you are a part of a customer service organization and want the managers to access service cases handled in different business units, the position hierarchy may work better for you.  
  
> [!NOTE]
> While the hierarchy security model provides a certain level of access to data, additional access can be obtained by using other forms of security, such as security roles.  
  
## Manager hierarchy  
 The manager hierarchy security model is based on the management chain or direct reporting structure, where the manager’s and the report’s relationship is established by using the **Manager** field on the system user table. With this security model, managers are able to access the data that their reports have access to. They are able to perform work on behalf of their direct reports or access information that needs approval.  
  
> [!NOTE]
> With the manager hierarchy security model, a manager has access to the records owned by the user or by the team that a user is a member of, and to the records that are directly shared with the user or the team that a user is a member of.  When a record is shared by a user who is outside of the management chain to a direct report user with read-only access, the direct report's manager only has read-only access to the shared record. 
> 
> When you enabled the [**Record ownership across business units**](wp-security-cds.md#matrix-data-access-structure-modernized-business-units) option, managers can have direct reports from different business units. You can use the following [environment database settings](environment-database-settings.md) to remove the business unit restriction.
> 
> **ManagersMustBeInSameOrParentBusinessUnitAsReports**
> 
> default = false   
>    
> You can set it to true, and a manager's business unit does not need to be the same as the direct report's business unit.  
>
> In addition to the manager hierarchy security model, a manager must have at least the user level Read privilege on a table, to see the reports’ data. For example, if a manager doesn’t have Read access to the Case table, the manager can't see the cases that their reports have access to.  
> 
> In order for the manager to see all the direct report's records, the direct report user must have an **Enabled** user status.

For a non-direct report in the same management chain of the manager, a manager has read-only access to the non-direct report’s data. For a direct report, the manager has Read, Write, Append, AppendTo access to the report’s data. To illustrate the manager hierarchy security model, let’s take a look at the following diagram. The CEO can read or update the VP of Sales data and the VP of Service data. However, the CEO can only read the sales manager data and the service manager data, as well as the sales and support data. You can further limit the amount of data accessible by a manager with _depth_. Depth is used to limit how many levels deep a manager has read-only access to the data of their reports. For example, if the depth is set to 2, the CEO can see the data of the VP of Sales, VP of Service, and sales and service managers. However, the CEO doesn’t see the sales data or the support data.  
  
:::image type="content" source="../admin/media/manage-hierarchy-security.png" alt-text="Manager hierarchy":::

It is important to note that if a direct report has deeper security access to a table than their manager, the manager may not able to see all the records that the direct report has access to. The following example illustrates this point.  
  
-   A single business unit has three users: User 1, User 2 and User 3.  
  
-   User 2 is a direct report of User 1.  
  
-   User 1 and User 3 have user-level read access on the Account table. This access level gives users access to records they own, the records that are shared with the user, and records that are shared with the team the user is a member of.  
  
-   User 2 has business unit-read access on the Account table. This allows User 2 to view all of the accounts for the business unit, including all of the accounts owned by User 1 and User 3.  
  
-   User 1, as a direct manager of User 2, has access to the accounts owned by or shared with User 2, and any accounts that are shared with or owned by a team that User 2 is a member of. However, User 1 doesn’t have access to the accounts of User 3, even though their direct report may have access to User 3 accounts.  
  
## Position hierarchy  
 The position hierarchy is not based on the direct reporting structure, like the manager hierarchy. A user doesn’t have to be an actual manager of another user to access user’s data. As an administrator, you define various job positions in the organization and arrange them in the position hierarchy. Then, you add users to any given position, or, as we also say, _tag_ a user with a particular position. A user can be tagged only with one position in a given hierarchy, however, a position can be used for multiple users. Users at the higher positions in the hierarchy have access to the data of the users at the lower positions, in the direct ancestor path. The direct higher positions have Read, Write, Append, AppendTo access to the lower positions’ data in the direct ancestor path. The non-direct higher positions, have read-only access to the lower positions’ data in the direct ancestor path.  
  
To illustrate the concept of the direct ancestor path, let’s look at the following diagram. The sales manager position has access to the sales data, however, it doesn’t have access to the support data, which is in the different ancestor path. The same is true for the service manager position. It doesn’t have access to the sales data, which is in the sales path. Like in the manager hierarchy, you can limit the amount of data accessible by higher positions with _depth_. The depth limits how many levels deep a higher position has read-only access, to the data of the lower positions in the direct ancestor path. For example, if the depth is set to 3, the CEO position can see the data all the way down from the VP of Sales and VP of Service positions, to the sales and support positions.  
  
:::image type="content" source="../admin/media/position-hierarchy.png" alt-text="Position hierarchy":::
  
> [!NOTE]
> With the position hierarchy security, a user at a higher position has access to the records owned by a lower position user or by the team that a user is a member of, and to the records that are directly shared to the user or the team that a user is a member of.  
>  
> In addition to the position hierarchy security model, the users at a higher level must have at least the user-level read privilege on a table to see the records that the users at the lower positions have access to. For example, if a user at a higher level doesn’t have read access to the Case table, that user won’t be able to see the cases that the users at a lower positions have access to.  
> 
> In order for the user at the higher position to see all the lower position user's records, the lower position user must have an **Enabled** user status.
  
## Set up hierarchy security  
To set up hierarchy security, make sure you have the System Administrator permission to update the setting.

- Follow the steps in [View your user profile](/powerapps/user/view-your-user-profile).
- Don’t have the correct permissions? Contact your system administrator.
  
The hierarchy security is disabled by default. To enable hierarchy security, complete the following steps.

1. Select an environment and go to **Settings** > **Users + Permissions** > **Hierarchy security**.
  
1. Under **Hierarchy Model**, select either **Enable Manager Hierarchy Model** or **Enable Position Hierarchy Model** depending on your requirements.  
  
    > [!IMPORTANT]
    >  To make any changes in **Hierarchy security**, you must have the **Change Hierarchy Security Settings** privilege.
    
    In the **Hierarchy Table Management** area, all system tables are enabled for hierarcy security by default, but you can exclude selective tables from the hierarchy. To exclude specific tables from the hierarchy model, clear the checkboxes for the tables that you want to exclude and save your changes.

    :::image type="content" source="../admin/media/hierarchy-security.png" alt-text="Hierarchy Security page":::
    
1. Set the **Depth** to a desired value to limit how many levels deep a manager has a read-only access to the data of their reports.
  
    For example, if the depth equals to 2, a manager can only access their own accounts and the accounts of the reports two levels deep. In our example, if you log in into customer engagement apps, not as an administrator, who can see all accounts, but, as the VP of Sales, you’ll only be able to see the active accounts of the users shown in the red rectangle, as illustrated:  

    :::image type="content" source="../admin/media/sales-vp-access.png" alt-text="Read access for VP of Sales":::
  
    > [!NOTE]
    >  While, the hierarchy security grants the VP of Sales access to the records in the red rectangle, additional access can be available based on the security role that the VP of Sales has.  
  
1. In the **Hierarchy Table Management** section, all system tables are enabled for hierarchy security, by default. To exclude a specific table from the hierarchy model, clear the check mark next to the table name and save your changes.

    # [New, modern UI in preview](#tab/preview)
  
    :::image type="content" source="../admin/media/hierarchy-security.png" alt-text="Set up hierarchy security in the new, modern UI.":::

    [!INCLUDE [preview-note](~/../shared-content/shared/preview-includes/preview-note.md)]

    # [Legacy UI](#tab/LegacyUI)
  
    :::image type="content" source="../admin/media/hierarchy-security-setup2.png" alt-text="Set up hierarchy security in the legacy UI.":::

    ---
  
## Set up manager and position hierarchies  
The manager hierarchy is easily created by using the manager relationship on the system user record. You use the Manager (**ParentsystemuserID**) lookup field to specify the manager of the user. If you have already created the position hierarchy, you can also tag the user with a particular position in the position hierarchy. In the following example, the sales person reports to the sales manager in the manager hierarchy and also has the sales position in the position hierarchy:  

:::image type="content" source="../admin/media/appointment-fields-customization.png" alt-text="Sales person user record":::
  
 To add a user to a particular position in the position hierarchy, use the lookup field called **Position** on the user record’s form.  
  
> [!IMPORTANT]
>  To add a user to a position or change the user’s position, you must have the **Assign position for a user** privilege.  

:::image type="content" source="../admin/media/hierarchy-security-add-position2.png" alt-text="Add user to position in Hierarchy Security":::
  
 To change the position on the user record’s form, on the navigation bar, choose **More** (…) and choose a different position.  
  
:::image type="content" source="../admin/media/cust-hs-change-position2.png" alt-text="Change position in hierarchy security":::
  
 To create a position hierarchy:  
  
1. Select an environment and go to **Settings** > **Users + Permissions** > **Positions**.
  
   For each position, provide the name of the position, the parent of the position, and the description. Add users to this position by using the lookup field called **Users in this position**. The following image is an example of position hierarchy with the active positions.  
  
   :::image type="content" source="../admin/media/active-positions.png" alt-text="Active positions in Hierarchy Security":::

   The example of the enabled users with their corresponding positions is shown in the followin image.  
  
   :::image type="content" source="../admin/media/hierachy-security-enabled-users.png" alt-text="Enabled users with assigned positions.":::

## Performance considerations  
 To boost the performance, we recommend:  
  
-   Keep the effective hierarchy security to 50 users or less under a manager or position. Your hierarchy may have more than 50 users under a manager or position, but you can use the **Depth** setting to reduce the number of levels for read-only access and with this limit the effective number of users under a manager or position to 50 users or less.  
  
-   Use hierarchy security models in conjunction with other existing security models for more complex scenarios. Avoid creating a large number of business units, instead, create fewer business units and add hierarchy security.  
  
### See also  
 [Security in Microsoft Dataverse](wp-security.md)   
 [Query and visualize hierarchical data](/dynamics365/customer-engagement/customize/query-visualize-hierarchical-data)   




[!INCLUDE[footer-include](../includes/footer-banner.md)]
