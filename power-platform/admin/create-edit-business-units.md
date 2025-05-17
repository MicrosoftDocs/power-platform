---
title: Create or edit business units 
description: Learn how to create or edit business units 
author: sericks007
ms.component: pa-admin
ms.topic: how-to
ms.date: 01/07/2025
ms.subservice: admin
ms.author: sericks
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
contributors:
- yingchin
- paulliew
- val-bc 
---
# Create or edit business units 

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

A business unit is a logical grouping of related business activities.

This article explains how to create or edit business units. There are two experiences available:

- [New experience](#new-experience)
- [Legacy experience](#legacy-experience)

## New experience

A business unit is a logical grouping of related business activities.

If your organization is structured around departments or divisions that have separate products, customers, and marketing lists, you might want to create business units. Business units are mapped to an organization's departments or divisions. Users can securely access data in their own business unit, but they can't access data in other business units unless they're assigned a security role from that business unit.

Business units, security roles, and users are linked together in a way that conforms to the role-based security model. Use business units together with security roles to control data access so people see just the information they need to do their jobs.

Keep the following in mind when creating business units:

- The organization (also known as the root business unit) is the top level of a business unit hierarchy. The customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation) automatically create the organization when you install or provision customer engagement apps. You can't delete the organization name. The organization name is derived from the domain name when the environment was provisioned. You can't change the organization name using the Business Unit form, but it can be changed using the [Web API](/dynamics365/customer-engagement/web-api/businessunit?view=dynamics-ce-odata-9&preserve-view=true).

- Each business unit can have only one parent business unit.

- Each business unit can have multiple child business units.

- Security roles and users are associated with a business unit. You must assign every user to one (and only one) business unit. When creating a security role, you can choose any business unit according to your business needs, or use the root business unit if there are no specific requirements.

- You can't add a user into a business unit directly. All newly provisioned users are assigned to the root business.

- You can change a user's business unit at any time. After the business unit is changed, the user shows up as a member of the business unit automatically.

- Each business unit has a default team. You can't update the default team's name, nor delete the default team.

- You can't add or remove users from the business unit's default team. However, you can change a user's current business unit to a new business unit. The system automatically removes the user from the previous business unit's default team and adds the user to the new business unit's default team. **Plugins/workflows** can't be used for this type of user's team membership change. 

- You can assign a security role to the business unit's default team. This is done to simplify security role management where all your business unit team members can share the same data access.

- You can assign more teams to a business unit, but there can only be one business unit per team.

- A team can consist of users from one or many business units. Consider using this type of team if you have a situation where users from different business units need to work together on a shared set of records.

- To allow your users to access data in a business unit, you can assign the user a security role from that business unit.

- A user can be assigned to security roles from any business unit regardless of what the business unit the user belongs to.

### Create a new business unit

You need to be an administrator to create a new business unit. Make sure you have System Administrator permissions to update the settings.

-   Follow the steps in [View your user profile](/powerapps/user/view-your-user-profile).

-   Don't have the correct permissions? Contact your system administrator.

Take these steps to create a new business unit:

1.  Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), select **Environments** in the navigation pane, and then select an environment.

2.  Select **Settings** &gt; **Users + permissions** &gt; **Business units**.

3.  On the action bar, select **New business unit**.

4.  In the **Create New Business Unit** pane, type a name for the new business unit. Customer engagement apps automatically fill in the **Parent business unit** field with the name of the root business unit.

5.  If you want to change the parent business unit, select the dropdown and pick the appropriate business unit from the list.

6.  In the **Create New Business Unit** pane, fill in any of the other optional fields, such as the division, website, contact information, or addresses.

7.  When you're done making entries, select **Save**.

### Change the settings for a business unit

1.  Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), select **Environments** in the navigation pane, and then select an environment.

2.  Select **Settings** &gt; **Users + permissions** &gt; **Business units**.

3.  Select a business unit name.

4.  In the business unit's details page, do one or more of the following actions:

    1.  Select **Edit** in the top-right corner of the **Details** box and update the data in one or more fields.

    1.  Select a record type, under the **Details** box, to see a list of related records. For example, select **Users** to view a list of users in the selected business unit. Make changes in the entity, if necessary.

5.  When you're done making changes, select **Save**.

### Change the business unit for a user

> [!IMPORTANT]
> When you update a user's business unit, you might remove all security role assignments for the user. You need to ensure that at least one security role is assigned to the user in the new business unit.

1.  Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), select **Environments** in the navigation pane, and then select an environment.

2.  Select **Settings** &gt; **Users + permissions** &gt; **Users.**

3.  Select the check box for a user name.

4.  On the action bar, select **Change business unit**.

5.  In the **Change business unit** pane, select a business unit. Select the **Move records to new business unit** checkbox. Select **OK**.

    If you're in the legacy web client, go to the **Change business unit** pane and use the **Lookup** icon to select a business unit.

>  [!NOTE]
> If you enabled [record ownership across business units](wp-security-cds.md#matrix-data-access-structure-modernized-business-units), you can use [environment database settings]environment-database-settings.md) to manage your user security roles and how you want to move the user's records when you are changing the user's business unit.
>
> 1. **DoNotRemoveRolesOnChangeBusinessUnit** default = false (the user's assigned security role is removed) You can set it to true, and the user's assigned security role for the *from-Business unit* is not removed.
>
> 2. **AlwaysMoveRecordToOwnerBusinessUnit** default = true (user owned records are moved to the new user's business unit) You can set it to false, and the *user-owned records' Business unit* is not moved to the new user's business unit. Note that the user isn't able to access these records unless a security role from the old business unit is assigned to the user.

### Change the business unit for a team

> [!IMPORTANT]
> When you change the business unit for a team, you can remove all security role assignments for the team. You need to ensure at least one security role is assigned to the team in the new business unit.

1.  Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), select **Environments** in the navigation pane, and then select an environment.

2.  Select **Settings** &gt; **Users + permissions** &gt; **Teams**.

3.  Select the checkbox for a team name.

4.  On the action bar, select **Change business unit**.

5.  In the **Change business unit** pane, select a business unit. Select the **Move records to new business unit** checkbox. Select **OK**.

>  [!NOTE]
> If you have enabled [record ownership across business units](wp-security-cds.md#matrix-data-access-structure-modernized-business-units), you can use [environment database settings](environment-database-settings.md) to manage your user security roles and how you want to move the user's records when you are changing the user's business unit.
>
> 1. **DoNotRemoveRolesOnChangeBusinessUnit** default = false (the user's assigned security role is removed) You can set it to true, and the user's assigned security role for the *from-Business unit* is not removed.
> 
> 2. **AlwaysMoveRecordToOwnerBusinessUnit** default = true (user owned records are moved to the new user's business unit) You can set it to false, and the *user-owned records' Business unit* is not moved to the new user's business unit. Note that the user will not be able to access these records unless a security role from the old business unit is assigned to the user.

### Reassign business unit records from one business unit to another

Entity records of one business unit can be reassigned to another a couple of ways:

- Select a business unit in the business unit list page, and then select **Reassign business unit records**.

-OR-

- Select **Reassign business unit records** inside a business unit details page.

Once this action is chosen, all relevant records of the **source Business Unit** will be transferred to the **target Business Unit**. The *Reassign business unit records* is a sequential action. This means that if the record transfer for the first entity fails, so will the record transfers for subsequent entities, until the prior error is addressed. The error message will detail the nature of the failure.

#### See also

-   [Delete a business unit](delete-business-unit.md)
-   [Assign a business unit a different parent business](assign-business-unit-different-parent.md)


## Legacy experience
  
If your organization is structured around departments or divisions that have separate products, customers, and marketing lists, you might want to create business units. Business units are mapped to an organization's departments or divisions. Users can securely access data in their own business unit, but they can't access data in other business units unless they're assigned a security role from that business unit.  
  
Business units, security roles, and users are linked together in a way that conforms to the role-based security model. Use business units together with security roles to control data access so people see just the information they need to do their jobs.   
  
Keep the following in mind when creating business units:  
  
- The organization (also known as the root business unit) is the top level of a business unit hierarchy. The customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), automatically create the organization when you install or provision customer engagement apps. You can't delete the organization name. The organization name is derived from the domain name when the environment was provisioned. You can't change the organization name using the Business Unit form but it can be changed using the [Web API](/dynamics365/customer-engagement/web-api/businessunit?view=dynamics-ce-odata-9&preserve-view=true).
  
- Each business unit can have just one parent business unit.  
  
- Each business unit can have multiple child business units.  
  
- Security roles and users are associated with a business unit. You must assign every user to one (and only one) business unit.  
  
- You can't add a user into a business unit directly. All newly provisioned users are assigned to the root business.

- You can change the user's business unit at any time. Once the business unit is changed, the user shows up as a member of the business unit automatically.

- Each business unit has a default team. You can't update the default team's name nor delete the default team.

- You can't add or remove users from the business unit's default team.  However you can change the user's business unit to the business unit and the user will automatically be added to the business unit's default team.

- You can assign a security role to the business unit's default team. This is done to simplify security role management where all your business unit team members can share the same data access.

- You can assign more teams to a business unit, but there can only be one business unit per team.

- A team can consist of users from one or many business units. Consider using this type of team if you have a situation where users from different business units need to work together on a shared set of records.  

- To allow your users to access data in a business unit, you can assign the user a security role from that business unit. The users can remain in the root business unit.

- A user can be assigned to security roles from any business unit regardless of what the business unit the user belongs to.

### Create a new business unit  
  
These settings can be found in the Microsoft Power Platform admin center by going to **Environments** > [select an environment] > **Settings** > **Users + permissions** > **Business units**.

Make sure you have the System Administrator permission to update the setting.

- Follow the steps in [View your user profile](/powerapps/user/view-your-user-profile).
- Don't have the correct permissions? Contact your system administrator. 
 
1. Select an environment and go to **Settings** > **Users + permissions** > **Business units**.

  For [Unified Interface](about-unified-interface.md), select Settings (![Gear button.](../admin/media/selection-rule-gear.png "Gear button")) in the upper-right corner > **Advanced Settings** > **Settings** > **Security** > **Business Units**.

2. On the Actions bar, select **New**.  
  
3. In the **Business Unit** dialog box, type a name for the new business unit. Customer engagement apps automatically fill in the **Parent Business** field with the name of the root business unit.  
  
4. If you want to change the parent business unit, select the **Lookup** button (![Lookup button.](media/lookup-4.png)), **Look Up More Records**, and then do one of the following:  
  
   - Select an existing business unit from the list. 
  
   - Create a new parent business unit:  
  
     1. Choose **New**, and then add the information for the new parent business unit in the **Business Unit** dialog box.  
  
     2. When you're done adding information, select **Save and Close**.  
  
     3. In the **Look Up Record** dialog box, select **Add**.  
  
5. In the **Business Unit** dialog box, fill in any of the other optional fields, such as the Division, Website, contact information, or addresses.  
  
6. When you're done making entries, select **Save and Close**.  
  
### Change the settings for a business unit  
  
1. Select an environment and go to **Settings** > **Users + permissions** > **Business units**.
  
   For [Unified Interface](about-unified-interface.md), select Settings (![Gear button.](../admin/media/selection-rule-gear.png "Gear button")) in the upper-right corner > **Advanced Settings** > **Settings** > **Security** > **Business Units**.

2. Select a business unit name.  
  
3. In the **Business Unit** dialog box, do one or more of the following:  
  
   - Modify the data in one or more fields.  
    
   - Select a record type under **Organization** to see a list of related records. For example, select **Users** to view a list of users in the selected business unit.  
  
4. When you're done making changes select **Save and Close**.  

#### Change the business unit for a user  

> [!IMPORTANT]
> By changing the business unit for a user, you can remove all security role assignments for the user. At least one security role must be assigned to the user in the new business unit. 
  
1. Select an environment and go to **Settings** > **Users + permissions** > **Users**.
  
   For [Unified Interface](about-unified-interface.md), select Settings (![Gear button.](../admin/media/selection-rule-gear.png "Gear button")) in the upper-right corner and then select **Advanced Settings** > **Settings** > **Security** > **Users**.

2. Select the checkbox for a user name.  
  
3. On the menu bar, select **Change Business Unit**.  
  
4. In the **Change Business Unit** dialog box, select a business unit. Select **OK**.

   The default setting is to **Move records to new business unit**. You can change this option by changing the [**AlwaysMoveRecordToOwnerBusinessUnit** database setting](#role-assignment-removal-and-business-unit-movement-database-settings)  .

  > [!IMPORTANT] 
  >  You can also change the user's business unit in the legacy user web client. To do so, complete the following steps.
  >
  >  1. Select an environment and go to **Settings** > **Users + permissions** > **Users**.
  >  
  >  2. Select the checkbox for a user name and select the user.
  >
  >  3. On the user form, select **...** (the ellipsis), and then select **Manage user in Dynamics 365**.
  >
  >  4. On the legacy **User detail** form, scroll down to the **Organization Information** section.
  >       
  >  6. Select the lookup button next to the **Business Unit** field and select a different business unit.
  >       
  >        **Note**: Changing the user's business unit on the **User detail** form honors the [role assignment removal and business unit movement](#role-assignment-removal-and-business-unit-movement-database-settings) database settings.
  >        
  >  7. On the **User detail** form's Action bar, select **Change Business Unit**.
  >       
  >       a. A **Change Business Unit** dialog box is displayed.
  >       
  >       b. Select the lookup button next to the **Business Unit** field and select a different business unit.
  >
  >       **Note**: Changing the user's business unit on this dialog box **does not** honor the [role assignment removal and business unit movement](#role-assignment-removal-and-business-unit-movement-database-settings) database settings.
  >         
  >     The user's role assignments will be removed and the user records' business unit will be moved to new business unit.
   
##### Role assignment removal and business unit movement database settings

> [!NOTE] 
> If you have enabled [**Record ownership across business units**](wp-security-cds.md#matrix-data-access-structure-modernized-business-units), you can use the following [environment database settings](environment-database-settings.md) to manage your user security role and how you want to move the user's records when you are changing the user's business unit.
> 
> 1. **DoNotRemoveRolesOnChangeBusinessUnit**
>    default = false  (the user's assigned security role is removed) 
>    You can set it to true, and the user's assigned security role for the *from-Business unit* is not removed. 
> 2. **AlwaysMoveRecordToOwnerBusinessUnit**
>    default = true (user owned records are moved to the new user's business unit) 
>    You can set it to false, and the *user-owned records' Business unit* is not moved to the new user's business unit. Note that the user won't be able to access these records unless a security role from the old business unit is assigned to the user. 

#### Change the business unit for a team  

> [!IMPORTANT]
> By changing the business unit for a team, you can remove all security role assignments for the team. At least one security role must be assigned to the team in the new business unit. 
  
1. Select an environment and go to **Settings** > **Users + permissions** > **Teams**.
  
2. Select the checkbox for a team name.  
  
   :::image type="content" source="media/select-team.png" alt-text="Screenshot selecting a team.":::

3. On the menu bar, select **Change Business Unit**.  
  
4. In the **Change Business Unit** dialog box, select a business unit. Enable **Move records to new business unit** to move to a new business unit. Select **OK**. 
  
> [!NOTE]
> If you have enabled [**Record ownership across business units**](wp-security-cds.md#matrix-data-access-structure-modernized-business-units), you can use the following [environment database settings](environment-database-settings.md) to manage your team security role and how you want to move the team's records when you are changing the team's business unit.
> 
> 1. **DoNotRemoveRolesOnChangeBusinessUnit**
>    default = false  (the team's assigned security role is removed) 
>    You can set it to true, and the team's assigned security role for the *from-Business unit* is not removed. 
> 2. **AlwaysMoveRecordToOwnerBusinessUnit**
>    default = true (team owned records are moved to the new team's business unit) 
>    You can set it to false, and the *team-owned records' Business unit* is not moved to the new team's business unit. Note that the team will not be able to access these records unless a security role from the old business unit is assigned to the team. 

#### See also

 [Delete a business unit](delete-business-unit.md)   
 [Assign a business unit a different parent business](assign-business-unit-different-parent.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
