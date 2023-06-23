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
ms.component: pa-admin
ms.topic: how-to
ms.date: 03/31/2023
search.audienceType: 
- admin
---

# Create or edit a security role to manage access

Create security roles or edit the privileges associated with an existing security role to accommodate changes in your business requirements. You can [export your changes as a solution](/powerapps/maker/common-data-service/use-solutions-for-your-customizations) to make a backup or for use in a different implementation.

## Prerequisites

[Make sure you have the System Administrator permission](/power-apps/user/view-your-user-profile). If you don't, contact your system administrator.

## Create a security role

1. Sign in to the Power Platform admin center and select an environment.

1. Select **Settings** > **Users + permissions** > **Security roles**.

1. Select **+ New role**.

1. Use the [new](security-roles-privileges.md#define-the-privileges-and-properties-of-a-security-role) or [legacy](security-roles-privileges.md#security-roles-and-the-legacy-ui) experience to specify privileges for the security role.

1. Select **Save + close**.

## Create a security role by Copy Role

1. Sign in to the Power Platform admin center and select an environment.

1. Select **Settings** > **Users + permissions** > **Security roles**.

1. Select the security role you want to copy.

1. Select **Copy**.

1. Enter a name for the new role.

1. Select **OK**.

1. Use the [new](security-roles-privileges.md#define-the-privileges-and-properties-of-a-security-role) or [legacy](security-roles-privileges.md#security-roles-and-the-legacy-ui) experience to specify privileges for the security role.

1. Select **Save + close**.

## Edit a security role

Before you edit a security role, make sure you understand the principles of [controlling data access](../admin/security-roles-privileges.md).

> [!NOTE]
> You can't edit the System Administrator security role. Instead, copy the System Administrator security role and make changes to the new role.

1. Sign in to the Power Platform admin center and select an environment.

1. Select **Settings** > **Users + permissions** > **Security roles**.

1. Select the security role you want to edit.

1. Use the [new](security-roles-privileges.md#define-the-privileges-and-properties-of-a-security-role) or [legacy](security-roles-privileges.md#security-roles-and-the-legacy-ui) experience to specify privileges for the security role.

1. Select **Save + close**.

## Minimum privileges for common tasks

Make sure that your users have a security role with the minimum privileges that are needed for common tasks like opening model-driven apps.

Don't use the [**min prv apps use** role](https://go.microsoft.com/fwlink/?linkid=2221577) that's available in the Microsoft Download Center. It's being retired soon. Instead, use or [copy the predefined security role App Opener](#create-a-security-role-by-copy-role), and then set the appropriate privileges.

- To allow users to open a model-driven app or any Dynamics 365 customer engagement app, assign the App Owner role.

- To allow users to view tables, assign the following privileges:

  - **Core Records:** Read privilege on the table, Read Saved View, Create/Read/Write User Entity UI Settings
and assign the following privilege on the Business Management tab: Read User.

- When logging in to [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)]:

- To render navigation for customer engagement apps and all buttons: assign the min prv apps use security role or a copy of this security role to your user

- To render an table grid: assign Read privilege on the table

- To render tables: assign Read privilege on the table

> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RW10lgO]

## Privacy notices

[!INCLUDE [cc_privacy_crm_for_phones](../includes/cc-privacy-crm-for-phones.md)]

[!INCLUDE [cc_privacy_crm_for_tablets](../includes/cc-privacy-crm-for-tablets.md)]

[!INCLUDE [cc_privacy_crm_go_offline_in_outlook](../includes/cc-privacy-crm-go-offline-in-outlook.md)]

[!INCLUDE [cc_privacy_crm_sync_to_outlook](../includes/cc-privacy-crm-sync-to-outlook.md)]

 [!INCLUDE [cc_privacy_export_to_excel](../includes/cc-privacy-export-to-excel.md)]

 [!INCLUDE [cc_privacy_crm_print](../includes/cc-privacy-crm-print.md)]

### See also

[Security concepts](../admin/wp-security-cds.md)
[Predefined security roles](database-security.md#predefined-security-roles)
[Copy a security role](../admin/copy-security-role.md)

[!INCLUDE [footer-include](../includes/footer-banner.md)]
