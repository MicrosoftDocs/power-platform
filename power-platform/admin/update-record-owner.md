---
title: "Update a record Owner and Owning Business Unit"
description: "Learn to update a record’s owner, an Owning Business Unit, or both an Owner and Owning Business Unit because the record changes ownership."
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/28/2023
ms.subservice: admin
author: paulliew
ms.author: paulliew
ms.reviewer: sericks
---
# Update a record Owner and Owning Business Unit

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

There are situations where you need to update a record’s owner, an Owning Business Unit, or both an owner and Owning Business Unit because the record changes ownership. If you have enabled the [allow record ownership across business units](wp-security-cds.md#enable-the-matrix-data-access-structure), you can update the record’s owning business unit. 

To update the record owner and owning business unit, you can add the Owning Business Unit in the header of the form and in the summary of the form.

Follow these steps.

1. Open a customer engagement app (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation).

2. Select a record such as an account.

3. Change the **Owner** or **Owning Business Unit** in the form header or form summary.

   :::image type="content" source="media/change-owning-business-unit.png" alt-text="Change Owner or Owning Business Unit":::

## Record ownership
To access a record, a new owner must have an **Enabled** user status and one of the following statements must be true:

- The new owner must be assigned to a security role that has **Read** privileges on the table.
- The new owner belongs to a team that has **Member's privilege inheritance** set to **Direct User (Basic) access level and Team privileges** and has **Read** privileges of user level or above on the table.
- The new owner belongs to a team that has **Member's privilege inheritance** set to **Team privileges only** and has **Read** privileges of organization level on the table.

If you have enabled the [allow record ownership across business units](wp-security-cds.md#enable-the-matrix-data-access-structure) option, and your users are assigned to teams, the team's security role **Member's privilege inheritance** must be set to **Direct User (Basic) access level and Team privileges** to allow team members to own records.

You can also set a user with the **Disabled** status as the owner of a record (row) provided the user has **Read** privilege on the table. This means that the user with the **Disabled** status must be assigned with a security role with the privilege. When an active user is deleted from the tenant, the user's status is set to **Disabled** in the system with the assigned security role retained. So, you can continue to make this user as owner of records. 

> [!NOTE]
> If there is no security role assigned to the user with **Disabled** status and you want to change record ownership to this user, you can enable the `allowRoleAssignmentOnDisabledUsers` setting using the [OrgDBOrgSettings](https://support.microsoft.com/help/2691237/orgdborgsettings-tool-for-microsoft-dynamics-crm) tool to assign role to this user.


## Table relationship and cascading behavior 

If there are related tables and the relationship behavior is set to parental, updating the record’s owner and/or owning business unit can have a cascading effect. See [About the assign action](/powerapps/developer/data-platform/configure-entity-relationship-cascading-behavior).


[!INCLUDE[footer-include](../includes/footer-banner.md)]
