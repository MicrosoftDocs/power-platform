---
title: Create or edit a security role to manage access 
description: Learn how to create security roles and edit the privileges associated with an existing security role in Power Platform.
ms.subservice: admin
author: paulliew
ms.author: paulliew
ms.reviewer: sericks
ms.custom:
- "admin-security"
- bap-template
- NewPPAC
ms.component: pa-admin
ms.topic: how-to
ms.date: 07/10/2025
search.audienceType: 
- admin
---

# Create or edit a security role to manage access

Create security roles or edit the privileges associated with an existing security role to accommodate changes in your business requirements. You can [export your changes as a solution](/powerapps/maker/common-data-service/use-solutions-for-your-customizations) to make a backup or for use in a different implementation.

## Prerequisites

[Make sure you have the System Administrator permission](/power-apps/user/view-your-user-profile). If you don't, contact your system administrator.

## Create a security role

## [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments**. Then select an environment.
1. In the command bar, select **Settings**.
1. Expand the **Users + permissions** node.
1. Select **Security roles**. The **Security roles** page is displayed.
1. In the command bar, select **+ New role**. The **Create New Role** pane is displayed.
1. Enter a role name.
1. Select a business unit.
1. To allow team members to inherit the privileges of this role when it's assigned to a team, accept the default **Member's privilege inheritance** setting, which is **Direct User (Basic) access level and Team privileges**. Learn more about the **Member's privilege inheritance** setting in [Security roles and privileges](security-roles-privileges.md).
1. To use the new role to run model-driven apps, accept the default **Include App Opener privileges for running Model-Driven apps** setting, which is set to **On**.
1. Select **Save**. The properties of the new role are displayed.

   > [!NOTE]
   > You must grant your app's table privileges to this newly created security role. You also need to review and update the default privileges that were copied from the [App Opener security role's minimum privileges for common tasks](#minimum-privileges-for-common-tasks). There are some privileges that were granted with an organization-level read access, such as process (flows), that allow the user to run system-supplied flows. If your app or user doesn't need to run system-supplied flows, you can change this privilege to **User** (basic) level.

1. Enter your table name in the **Search** input field to find your app's table.
1. Select your table and set the permission settings. Then select the **Save** button in the command bar.

    > [!Note]
    > You may need to repeat the last two steps of this procedure if there is more than one table in your app.

## [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Environments** in the navigation pane. The Environments page is displayed.
1. Select an environment.
1. In the command bar, select **Settings**.
1. Expand the **Users + permissions** node.
1. Select **Security roles**. The **Security roles** page is displayed.
1. Select **+ New role**.
1. Enter a role name.
1. Select a business unit.
1. To allow team members to inherit the privileges of this role when it's assigned to a team, accept the default **Member's privilege inheritance** setting, which is **Direct User (Basic) access level and Team privileges**. Learn more about the **Member's privilege inheritance** setting in [Security roles and privileges](security-roles-privileges.md).
1. To use the new role to run model-driven apps, accept the default **Include App Opener privileges for running Model-Driven apps** setting, which is set to **On**.
1. Select **Save**. The properties of the new role are displayed.

   > [!NOTE]
   > You must grant your app's table privileges to this newly created security role. You also need to review and update the default privileges that were copied from the [App Opener security role's minimum privileges for common tasks](#minimum-privileges-for-common-tasks). There are some privileges that were granted with an **Organization**-level read access, such as Process (Flows), that allow the user to run system-supplied flows. If your app or user doesn't need to run system-supplied flows, you can change this privilege to **User** (basic) level.

1. Enter your table name in the **Search** input field to find your app's table.
1. Select your table and set the permission settings. Then select the **Save** button in the command bar.

    > [!Note]
    > You may need to repeat the last two steps of this procedure if there is more than one table in your app.

---

## Create a security role by copying an existing role

## [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments**. Then select an environment.
1. In the command bar, select **Settings**.
1. Expand the **Users + permissions** node.
1. Select **Security roles**. The **Security roles** page is displayed.
1. Select the security role you want to copy.
1. Select **Copy security role** in the command bar. The **Copy role** dialog box is displayed.
1. Enter a name for the new role. Select **Copy**.
1. Go back to the **Security roles** page and select the new role you created by copying an existing role.
1. Specify privileges for the security role. Learn more in [Security roles and privileges](security-roles-privileges.md#define-the-privileges-and-properties-of-a-security-role).
1. Select **Save + close**.

## [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Environments** in the navigation pane. The Environments page is displayed.
1. Select an environment.
1. In the command bar, select **Settings**.
1. Expand the **Users + permissions** node.
1. Select **Security roles**. The **Security roles** page is displayed.
1. Select the security role you want to copy.
1. Select **Copy security role** in the command bar. The **Copy role** dialog box is displayed.
1. Enter a name for the new role. Select **Copy**.
1. Go back to the **Security roles** page and select the new role you created by copying an existing role.
1. Specify privileges for the security role. Learn more in [Security roles and privileges](security-roles-privileges.md#define-the-privileges-and-properties-of-a-security-role).
1. Select **Save + close**.
---

## Edit a security role

Before you edit a security role, make sure you understand the principles of [controlling data access](../admin/security-roles-privileges.md).

> [!NOTE]
> You can't edit the System Administrator security role. Instead, copy the System Administrator security role and make changes to the new role.

## [New admin center](#tab/new)


## [Classic admin center](#tab/classic)

1. Sign in to the Power Platform admin center and select an environment.

1. Select **Settings** > **Users + permissions** > **Security roles**.

1. Select the security role you want to edit.

1. Use the [new](security-roles-privileges.md#define-the-privileges-and-properties-of-a-security-role) or [legacy](security-roles-privileges.md#security-roles-and-the-legacy-ui) experience to specify privileges for the security role.

1. Select **Save + close**.
---

## Minimum privileges for common tasks

Make sure that your users have a security role with the minimum privileges that are needed for common tasks like opening model-driven apps.

Don't use the [**min prv apps use** role](https://go.microsoft.com/fwlink/?linkid=2221577) that's available in the Microsoft Download Center. It's being retired soon. Instead, use or [copy the predefined security role App Opener](#create-a-security-role-by-copying-an-existing-role), and then set the appropriate privileges.

- To allow users to open a model-driven app or any Dynamics 365 customer engagement app, assign the **App Opener** role.

- To allow users to view tables, assign the following privileges:

  - **Core Records:** Read privilege on the table, Read Saved View, Create/Read/Write User Entity UI Settings
and assign the following privilege on the Business Management tab: Read User.

- When logging in to [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)]:

- To render navigation for customer engagement apps and all buttons: assign the min prv apps use security role or a copy of this security role to your user

- To render a table grid: assign Read privilege on the table

- To render tables: assign Read privilege on the table

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=85201287-5bcf-45a3-8e9f-f0ded7cd17c4]

## Privacy notices

[!INCLUDE [cc_privacy_crm_for_phones](../includes/cc-privacy-crm-for-phones.md)]

[!INCLUDE [cc_privacy_crm_for_tablets](../includes/cc-privacy-crm-for-tablets.md)]

[!INCLUDE [cc_privacy_crm_go_offline_in_outlook](../includes/cc-privacy-crm-go-offline-in-outlook.md)]

[!INCLUDE [cc_privacy_crm_sync_to_outlook](../includes/cc-privacy-crm-sync-to-outlook.md)]

 [!INCLUDE [cc_privacy_export_to_excel](../includes/cc-privacy-export-to-excel.md)]

 [!INCLUDE [cc_privacy_crm_print](../includes/cc-privacy-crm-print.md)]

### Related content

[Security concepts](../admin/wp-security-cds.md)
[Predefined security roles](database-security.md#predefined-security-roles)
[Copy a security role](../admin/copy-security-role.md)

[!INCLUDE [footer-include](../includes/footer-banner.md)]
