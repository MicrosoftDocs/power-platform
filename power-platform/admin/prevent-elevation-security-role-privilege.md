---
title: "Create an administrative user and prevent elevation of security role privilege  | MicrosoftDocs"
description: Create an administrative user and prevent elevation of security role privilege
author: paulliew
ms.author: paulliew
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/09/2020
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Create an administrative user and prevent elevation of security role privilege

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

The [copy security role method](copy-security-role.md) is a quick and easy way to create a new security role based on an existing set of privileges. However, security role privileges can change with product updates which could render the new security role out-of-date and might not function as expected. This is especially true in the case where you want to allow [a certain group of administrative users](create-users-assign-online-security-roles.md#create-an-administrative-user-account) to assign security roles to your users.  We recommend you not copy the System Administrator security role and assign it to users, since this would allow the users to elevate the assigned user to System Administrators.  In addition, newer privileges from product updates will not be automatically added to the copied System Administrator security role resulting in the role having insufficient privileges to continue to assign security roles.

The following steps describe a method to create a new custom security role with privileges that will change dynamically with updates and therefore can continue to be used for security role assignments.

### Create a new custom security role that only has access to "Security Role" entity

1. Make sure that you have the System Administrator permissions.

    Check your security role  

   - [!INCLUDE[proc_check_your_security_role](../includes/proc-check-your-security-role.md)]  

   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  

2. In the Power Platform admin center, select an environment. 

3. Select **Settings** > **Users + permissions** > **Security roles**, and then select **New**.
4. Enter a role name, and then select the **Business Management** tab.
5. Scroll down to the **Entity** list and set the **Security Role** entity privileges as follows:

   |Privilege  |Setting  |
   |---------|---------|
   |Create     |Business Unit         |
   |Read     |Organization         |
   |Write     |Business Unit         |
   |Delete     |Business Unit         |
   |Append     |Business Unit         |
   |Append To     |Business Unit         |
   |Assign     |Business Unit         |

   ![Security Role](media/security-role.png)

6. Select **Save and Close**.

### Assign the new security role to an administrative user

1. In the Power Platform admin center, select an environment. 
2. Select **Settings** > **Users + permissions** > **Users**.
3. Select an administrative user and then choose **Manage Roles**.
4. Select the new security role.
5. Select all the security roles that the administrative user can assign to other users.
6. Choose **OK**.

> [!NOTE]
> The customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), are designed to prevent any elevation of security role privileges. Therefore, the administrative user **cannot** assign System Administrator, System Customizer, or any security roles that have a higher privilege.
>
> The above steps are for assigning roles to users who belong to the same Business Unit (BU) as the administrative user.  To assign roles to child BU users, the administrative user's privileges need to have Deep (Parent:Child Business Units) privilege level for all the privileges of the child BU user. 

### See also
[Global and Service administrators can administer without a license](global-service-administrators-can-administer-without-license.md)
