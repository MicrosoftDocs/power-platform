---
title: "Create or edit business units  | MicrosoftDocs"
description: Learn how to create or edit business units 
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/11/2021
ms.subservice: admin
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Create or edit business units 

A business unit is a logical grouping of related business activities.  
  
 If your organization is structured around departments or divisions that have separate products, customers, and marketing lists, you might want to create business units. Business units are mapped to an organization’s departments or divisions. Users can securely access data in their own business unit, but they can’t access data in other business units unless they are assigned a security role from that business unit.  
  
 Business units, security roles, and users are linked together in a way that conforms to the role-based security model. Use business units together with security roles to control data access so people see just the information they need to do their jobs.   
  
 Keep the following in mind when creating business units:  
  
- The organization (also known as the root business unit) is the top level of a business unit hierarchy. The customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), automatically create the organization when you install or provision customer engagement apps. You can’t delete the organization name. The organization name is derived from the domain name when the environment was provisioned. You cannot change the organization name using the Business Unit form but it can be changed using the [Web API](/dynamics365/customer-engagement/web-api/businessunit?view=dynamics-ce-odata-9).
  
- Each business unit can have just one parent business unit.  
  
- Each business unit can have multiple child business units.  
  
- Security roles and users are associated with a business unit. You must assign every user to one (and only one) business unit.  
  
- You cannot add a user into a business unit directly. All newly provisioned users are assigned to the root business.

- You can change the user's business unit at anytime. Once the business unit is changed, the user will show up as a member of the business unit automatically.

- Each business unit has a default team. You cannot update the default team's name nor delete the default team.

- You cannot add or remove users from the business unit's default team.  However you can change the user's business unit to the business unit and the user will automatically be added to the business unit's default team.

- You can assign a security role to the business unit's default team. This is done to simplify security role management where all your business unit team members can share the same data access.

- You can assign additional team to a business unit but there can only be one business unit per team.

- A team can consist of users from one or many business units. Consider using this type of team if you have a situation where users from different business units need to work together on a shared set of records.  

- (Preview) To allow your users to access data in a business unit, you can assign the user a security role from that business unit.  

- (Preview) A user can be assigned to security roles from any business unit regardless of what the business unit the user belongs to. 

## Create a new business unit  
  
These settings can be found in the Microsoft Power Platform admin center by going to **Environments** > [select an environment] > **Settings** > **Users + permissions** > **Business units**.

Make sure you have the System Administrator or System Customizer security role or equivalent permissions to update the setting.

- Follow the steps in [View your user profile](/powerapps/user/view-your-user-profile).
- Don’t have the correct permissions? Contact your system administrator. 
 
1. Select an environment and go to **Settings** > **Users + permissions** > **Business units**.
 
   For [Unified Interface](about-unified-interface.md), select Settings (![Gear button.](../admin/media/selection-rule-gear.png "Gear button")) in the upper-right corner > **Advanced Settings** > **Settings** > **Security** > **Business Units**.

2. On the Actions bar, select **New**.  
  
3. In the **Business Unit** dialog box, type a name for the new business unit. Customer engagement apps automatically fills in the **Parent Business** field with the name of the root business unit.  
  
4. If you want to change the parent business unit, select the **Lookup** button (![Lookup button.](media/lookup-4.png)), **Look Up More Records**, and then do one of the following:  
  
   - Select an existing business unit from the list. 
  
   - Create a new parent business unit:  
  
     1. Choose **New**, and then add the information for the new parent business unit in the **Business Unit** dialog box.  
  
     2. When you’re done adding information, select **Save and Close**.  
  
     3. In the **Look Up Record** dialog box, select **Add**.  
  
5. In the **Business Unit** dialog box, fill in any of the other optional fields, such as the Division, Website, contact information, or addresses.  
  
6. When you’re done making entries, select **Save and Close**.  
  
## Change the settings for a business unit  
  
1. Select an environment and go to **Settings** > **Users + permissions** > **Business units**.
  
   For [Unified Interface](about-unified-interface.md), select Settings (![Gear button.](../admin/media/selection-rule-gear.png "Gear button")) in the upper-right corner > **Advanced Settings** > **Settings** > **Security** > **Business Units**.

2. Select a business unit name.  
  
3. In the **Business Unit** dialog box, do one or more of the following:  
  
   - Modify the data in one or more fields.  
    
   - Select a record type under **Organization** to see a list of related records. For example, select **Users** to view a list of users in the selected business unit.  
  
4. When you’re done making changes select **Save and Close**.  

### Change the business unit for a user  

> [!IMPORTANT]
> By changing the business unit for a user, you can remove all security role assignments for the user. At least one security role must be assigned to the user in the new business unit. 
  
1. Select an environment and go to **Settings** > **Users + permissions** > **Users**.
  
   For [Unified Interface](about-unified-interface.md), select Settings (![Gear button.](../admin/media/selection-rule-gear.png "Gear button")) in the upper-right corner > **Advanced Settings** > **Settings** > **Security** > **Users**.

2. Select the checkbox for a user name.  
  
3. On the menu bar, select **Change Business Unit**.  
  
4. In the **Change Business Unit** dialog box, select a business unit. Enable **Move records to new business unit** to move to a new business unit. Select **OK**. 
  
    In the legacy web interface, in the **Change Business Unit** dialog box, use the **Lookup** button (![Lookup button.](media/lookup-4.png)) to select a business unit.  

> [!NOTE]
> If you have enabled [**Record ownership across business units**](wp-security-cds.md#matrix-data-access-structure-modernize-business-units---preview), you can use the following [environment database settings](environment-database-settings.md) to manage your user security role and how you want to move the user’s records when you are changing the user’s business unit.
> 
> 1. **DoNotRemoveRolesOnChangeBusinessUnit**
>    default = false  (the user’s assigned security role is removed) 
>    You can set it to true, and the user’s assigned security role for the from-Business unit is not removed. 
> 2. **AlwaysMoveRecordToOwnerBusinessUnit**
>    default = true (user owned records are moved to the new user’s business unit) 
>    You can set it to false, and the user owned records’ Business unit is not moved to the new user’s business unit. Note that the user will not be able to access these records unless a security role from the old business unit is assigned to the user. 

### Change the business unit for a team  

> [!IMPORTANT]
> Content?
  
1. Select an environment and go to **Settings** > **Users + permissions** > **Teams**.
  
2. Select the checkbox for a team name.  
  
3. On the menu bar, select **Change Business Unit**.  
  
4. In the **Change Business Unit** dialog box, select a business unit. Enable **Move records to new business unit** to move to a new business unit. Select **OK**. 
  


### See also  
 [Delete a business unit](delete-business-unit.md)   
 [Assign a business unit a different parent business](assign-business-unit-different-parent.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
