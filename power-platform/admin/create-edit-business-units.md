---
title: Create or edit business units 
description: Learn how to create or edit business units 
author: sericks007
ms.component: pa-admin
ms.topic: how-to
ms.date: 05/21/2025
ms.subservice: admin
ms.custom: NewPPAC
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

A business unit is a logical grouping of related business activities.

If your organization is structured around departments or divisions that have separate products, customers, and marketing lists, you might want to create business units. Business units are mapped to an organization's departments or divisions. Users can securely access data in their own business unit, but they can't access data in other business units unless they're assigned a security role from that business unit.

Business units, security roles, and users are linked together in a way that conforms to the role-based security model. Use business units together with security roles to control data access so people see just the information they need to do their jobs.

Keep the following in mind when creating business units:

- The organization (also known as the root business unit) is the top level of a business-unit hierarchy. The customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation) automatically create the organization when you install or provision customer engagement apps. You can't delete the organization name. The organization name is derived from the domain name when the environment was provisioned. You can't change the organization name using the Business Unit form, but you can use the [Web API](/dynamics365/customer-engagement/web-api/businessunit?view=dynamics-ce-odata-9&preserve-view=true) to change it.

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

Make sure you have the System Administrator security role or equivalent permissions to make changes. To check your security role, see [View your user profile](/powerapps/user/view-your-user-profile). If you don't have the correct permissions, contact your system administrator.

## Create a new business unit

Take these steps to create a new business unit.

### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Users + permissions**, then select **Business units**.
1. On the **Business Units** page, select **New business unit** in the command bar.

### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Users + permissions**, then select **Business units**.
1. On the **Business Units** page, select **New business unit** in the command bar.

---

Continue to take these steps in the **Create new business unit** panel:

1. Enter a name for the new business unit. The **Parent business unit** field is pre-filled with the root business unit.
1. To select a different parent business unit, use the dropdown menu.
1. Complete any other optional fields, such as the division, website, contact details, or addresses.
1. Select **Save** to apply the changes.

### Change the settings for a business unit

Take these steps to change the setting for a business unit.

### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Users + permissions**, then select **Business units**.
1. On the **Business units** page, select the desired business unit.
1. On the **Details** pane, select **Edit**.
1. In the **Edit business unit** panel, make the necessary changes, then select **Save** to apply them.

### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Users + permissions**, then select **Business units**.
1. On the **Business units** page, select the desired business unit.
1. On the **Details** pane, select **Edit**.
1. In the **Edit business unit** panel, make the necessary changes, then select **Save** to apply them.

---

### Change the business unit for a user

Take these steps to change the business unit for a user.

> [!IMPORTANT]
> By changing the business unit for a user, you can remove all security role assignments for the user. At least one security role must be assigned to the user in the new business unit.

### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Users + permissions**, then select **Users**.
1. On the **Users** page, select the desired user.
1. In the command bar, select **Change business unit**.
1. In the **Change business unit** panel, select a business unit and check the **Move records to new business unit** option.
1. Click **OK** to apply the changes.

### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Users + permissions**, then select **Users**.
1. On the **Users** page, select the desired user.
1. In the command bar, select **Change business unit**.
1. In the **Change business unit** panel, select a business unit and check the **Move records to new business unit** option.
1. Click **OK** to apply the changes.

---

  > [!NOTE]
  > If you have enabled [record ownership across business units](wp-security-cds.md#matrix-data-access-structure-modernized-business-units), you can use [environment database settings](environment-database-settings.md) to manage your user security roles and how you want to move the user's records when you are changing the user's business unit.
  >
  > 1. **DoNotRemoveRolesOnChangeBusinessUnit** default = false (the user's assigned security role is removed) You can set it to true, and the user's assigned security role for the *from-Business unit* is not removed.
  >
  > 2. **AlwaysMoveRecordToOwnerBusinessUnit** default = true (user owned records are moved to the new user's business unit) You can set it to false, and the *user-owned records' Business unit* is not moved to the new user's business unit. Note that the user isn't able to access these records unless a security role from the old business unit is assigned to the user.

### Change the business unit for a team

Take these steps to change the business unit for a team.

### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Users + permissions**, then select **Teams**.
1. On the **Teams** page, select the row of the desired team.
1. In the command bar, select **Change business unit**.
1. In the **Change business unit** panel, select a business unit and check the **Move records to new business unit** option.
1. Select **OK** to apply the changes.

### [Classic admin center](#tab/classic)

1. Sign in to the [TeamsPower Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Users + permissions**, then select **Teams**.
1. On the **Teams** page, select the row of the desired team.
1. In the command bar, select **Change business unit**.
1. In the **Change business unit** panel, select a business unit and check the **Move records to new business unit** option.
1. Select **OK** to apply the changes.

---

  > [!NOTE]
  > If you enable [record ownership across business units](wp-security-cds.md#matrix-data-access-structure-modernized-business-units), you can use [environment database settings](environment-database-settings.md) to manage your user security roles and how you want to move the user's records when you are changing the user's business unit.
  >
  > 1. **DoNotRemoveRolesOnChangeBusinessUnit** default = false (the user's assigned security role is removed) You can set it to true, and the user's assigned security role for the *from-Business unit* is not removed.
  >
  > 2. **AlwaysMoveRecordToOwnerBusinessUnit** default = true (user owned records are moved to the new user's business unit) You can set it to false, and the *user-owned records' Business unit* is not moved to the new user's business unit. Note that the user isn't able to access these records unless a security role from the old business unit is assigned to the user.

### Reassign business unit records

Take these steps to reassign business unit records from one business unit to another.

### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Users + permissions**, then select **Business units**.

### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select the row of the desired environment.
1. In the command bar, select **Settings**.  
1. Expand **Users + permissions**, then select **Business units**.

---

On the **Business Units** page:

- Select the desired business unit, then select **Reassign business unit records** in the command bar.

-**OR**-

- Select the desired business unit then select it. In the business unit **Details** page, select **Reassign business unit records** in the command bar.

In the **Reassign business unit** panel:

- Select a target business unit and check the **Move records to new business unit** option.
- Select **OK** to apply the changes.

Once this action is chosen, all relevant records of the **source Business Unit** will be transferred to the **target Business Unit**. This is a sequential action, where if the transfer of records of the first entity fails, all subsequent entities will not be transferred, until the prior error is addressed. The nature of the failure will be reflected in the error message.

#### See also

- [Delete a business unit](delete-business-unit.md)
- [Assign a business unit a different parent business](assign-business-unit-different-parent.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
