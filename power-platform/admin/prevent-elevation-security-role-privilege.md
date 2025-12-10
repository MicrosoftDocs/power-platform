---
title: Create an administrative user and prevent elevation of security role privilege
description: Learn how to create an administrative user and prevent elevation of security role privilege.
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: sericks
ms.custom: "admin-security"
ms.component: pa-admin
ms.topic: how-to
ms.date: 11/25/2025
search.audienceType: 
  - admin
---
# Create an administrative user and prevent elevation of security role privilege

The [copy security role method](copy-security-role.md) is a quick and easy way to create a new security role based on an existing set of privileges. However, security role privileges can change with product updates, which could make the new security role outdated and might cause it to not function as expected. This issue is especially important when you want to allow [a certain group of administrative users](create-users.md#create-an-administrative-user-account) to assign security roles to your users.  Don't copy the System Administrator security role and assign it to users, since this approach allows the users to elevate the assigned user to System Administrators.  In addition, newer privileges from product updates aren't automatically added to the copied System Administrator security role, so the role has insufficient privileges to continue to assign security roles.

The following steps describe a method to create a new custom security role with privileges that change dynamically with updates and therefore can continue to be used for security role assignments.

## Create a new custom security role that only has access to Security Role table

1. Make sure that you have the System Administrator permissions.

    Check your security role  

   - [!INCLUDE[proc_check_your_security_role](../includes/proc-check-your-security-role.md)]  

   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. Select an environment.
1. Select **Settings** > **Users + permissions** > **Security roles**, then select **New**.
1. Enter a role name, then select the **Business Management** tab.
1. Scroll down to the **Table** list and set the **Security Role** table privileges as follows:

   |Privilege  |Setting  |
   |---------|---------|
   |Create     |Business Unit         |
   |Read     |Organization         |
   |Write     |Business Unit         |
   |Delete     |Business Unit         |
   |Append     |Business Unit         |
   |Append To     |Business Unit         |
   |Assign     |Business Unit         |

   ![Security Role.](media/security-role.png)

1. Select **Save and Close**.

### Assign the new security role to an administrative user

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. Select an environment.
1. Select **Settings** > **Users + permissions** > **Users**.
1. Select an administrative user and then choose **Manage Roles**.
1. Select the new security role.
1. Select all the security roles that the administrative user can assign to other users.
1. Choose **OK**.

> [!NOTE]
> The customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation) prevent any elevation of security role privileges. Therefore, the administrative user **can't** assign System Administrator, System Customizer, or any security roles that have a higher privilege.
>
> The steps in this article are for assigning roles to users who belong to the same Business Unit (BU) as the administrative user. To assign roles to child BU users, the administrative user's privileges need to have Deep (Parent:Child Business Units) privilege level for all the privileges of the child BU user.

### See also

[Global and Service administrators can administer without a license](global-service-administrators-can-administer-without-license.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
