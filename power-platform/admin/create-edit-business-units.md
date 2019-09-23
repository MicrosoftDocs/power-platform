---
title: "Create or edit business units  | MicrosoftDocs"
description: Learn how to create or edit business units 
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/19/2019
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Create or edit business units 

In Dynamics 365 apps, a business unit is a logical grouping of related business activities.  
  
 If your Dynamics 365 apps organization is structured around departments or divisions that have separate products, customers, and marketing lists, you might want to create business units. Business units are mapped to an organization’s departments or divisions. Users can securely access data in their own business unit, but they can’t access data in other business units.  
  
 Business units, security roles, and users are linked together in a way that conforms to the [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps role-based security model. Use business units together with security roles to control data access so people see just the information they need to do their jobs.   
  
 Keep the following in mind when creating business units:  
  
- The organization (also known as the root business unit) is the top level of a [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps business unit hierarchy. [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps automatically creates the organization when you install or provision [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps. You can’t change or delete the organization name.  
  
- Each business unit can have just one parent business unit.  
  
- Each business unit can have multiple child business units.  
  
- [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps security roles and users are associated with a business unit. You must assign every user to one (and only one) business unit.  
  
- You can assign a team to just one business unit, but a team can consist of users from one or many business units. Consider using a team if you have a situation where users from different business units need to work together on a shared set of records.  
  
## Create a new business unit  
  
These settings can be found in the Power Platform Admin center by going to **Environments** > [select an environment] > **Settings** > **Users + permissions** > **Business units**.

Make sure you have the System Administrator or System Customizer security role or equivalent permissions to update the setting.

- Follow the steps in [View your user profile](https://docs.microsoft.com/dynamics365/customer-engagement/basics/view-your-user-profile).
- Don’t have the correct permissions? Contact your system administrator. 
 
1. Select an environment and go to **Settings** > **Users + permissions** > **Business units**.
 
2. On the Actions bar, select **New**.  
  
3. In the **Business Unit** dialog box, type a name for the new business unit. [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps automatically fills in the **Parent Business** field with the name of the root business unit.  
  
4. If you want to change the parent business unit, select the **Lookup** button (![Lookup button](media/lookup-4.png)), **Look Up More Records**, and then do one of the following:  
  
   -   Select an existing business unit from the list. 
  
   -   Create a new parent business unit:  
  
       1.  Choose **New**, and then add the information for the new parent business unit in the **Business Unit** dialog box.  
  
       2.  When you’re done adding information, select **Save and Close**.  
  
       3.  In the **Look Up Record** dialog box, select **Add**.  
  
5. In the **Business Unit** dialog box, fill in any of the other optional fields, such as the Division, Website, contact information, or addresses.  
  
6. When you’re done making entries, select **Save and Close**.  
  
## Change the settings for a business unit  
  
1. Select an environment and go to **Settings** > **Users + permissions** > **Business units**.
  
2. Select a business unit name.  
  
3. In the **Business Unit** dialog box, do one or more of the following:  
  
   -   Modify the data in one or more fields.  
    
   -   Select a record type under **Organization** to see a list of related records. For example, select **Users** to view a list of users in the selected business unit.  
  
4. When you’re done making changes select **Save and Close**.  

### Change the business unit for a user  

> [!IMPORTANT]
> By changing the business unit for a user, you remove all security role assignments for the user. At least one security role must be assigned to the user in the new business unit. 
  
1. Select an environment and go to **Settings** > **Users + permissions** > **Users**.
  
2. Select a user name.  
  
3. On the **More Commands** (**…**) menu, select **Change Business Unit**.  
  
4. In the **Change Business Unit** dialog box, use the **Lookup** button (![Lookup button](media/lookup-4.png)) to select a new business unit, and then select **OK**.  
  
### See also  
 [Delete a business unit](https://docs.microsoft.com/dynamics365/customer-engagement/admin/delete-business-unit)   
 [Assign a business unit a different parent business](https://docs.microsoft.com/dynamics365/customer-engagement/admin/assign-business-unit-different-parent)
