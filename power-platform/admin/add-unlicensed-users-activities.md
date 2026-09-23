---
title: Add users without licenses to activity recipient fields (preview)
description: Learn how to add Microsoft Entra users who don't have a Dataverse or Power Apps license to activity recipient fields in Dynamics 365 apps.
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: ellenwehrle
ms.component: pa-admin
ms.topic: how-to
ms.date: 09/18/2026
search.audienceType: 
  - admin
---

# Add users without licenses to activity recipient fields (preview)

By default, only users with a Dataverse or Power Apps license can be added to activities in Dynamics 365 apps. Turn on the *Activities for users without licenses* feature in the Power Platform admin center to allow any user in your tenant with a Microsoft Entra ID to be added to activity recipient fields, such as the To, Cc, or Bcc fields of an email; Owner, Required Attendees, Optional attendees of appointment; the Owner, Call From, or Call To of phone call; and Owner (co-owner) of Task.  Learn more in [Manage feature settings](https://go.microsoft.com/fwlink/?linkid=2008957).

## Prerequisites

You must have the following prerequisites to enable this feature:

- You need to be a **Privileged Role Administrator** in the Microsoft Entra admin center to [grant users read access to the Microsoft Entra ID table](#grant-users-read-access-to-the-microsoft-entra-id-table).
- You need to be a **Power Platform administrator** to [turn on the feature in Power Platform admin center](#turn-on-the-feature-in-power-platform-admin-center).

## Grant users read access to the Microsoft Entra ID table

Before you turn on the feature in the Power Platform admin center, you need to grant all users in the tenant **read** permission on the **Microsoft Entra ID** table. You can provide this access in either of the following ways:

- Update each existing security role assigned to users and add **read** permission for the **Microsoft Entra ID** table.
- Create a custom security role that grants **read** permission for the **Microsoft Entra ID** table, and then assign the role to all users.

Learn more in [Configure Microsoft Entra role settings in Privileged Identity Management](/entra/id-governance/privileged-identity-management/pim-how-to-change-default-settings).

## Turn on the feature in Power Platform admin center

Turn on this feature in the Power Platform admin center to allow users with a Microsoft Entra ID to be added to activity recipient fields without requiring a Dataverse or Power Apps license.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
2. Select **Manage** in the navigation pane.
3. In the **Manage** pane, select **Environments**. Then select an environment.
4. Select **Settings**.
5. Select **Product**, and then select **Features**.
6. Go to **Activities for users without licenses**.
7. Select the **Add anyone with an Entra ID to an activity's recipients fields** checkbox.

## Add users without licenses to activity recipient fields

Users without licenses are people in your tenant who have an active Microsoft Entra ID account but don't have a Dataverse or Power Apps license. After you enable the *Activities for users without licenses* feature in the Power Platform admin center, the user lookup uses the **Microsoft Entra ID** table, a virtual Dataverse table that displays the current list of active Microsoft Entra ID users.

When you select a Microsoft Entra ID user for an activity, Dataverse creates a corresponding unlicensed-user record in the environment so that the user can be added to the activity's recipient fields. The user record is created with a disabled status. These users can be included as recipients, but they can't sign in to or run Dynamics 365 apps.

## See also

[Update lookup-field.md with non-licensed user info - publish end of July along with PPAC #10993 by …](https://github.com/MicrosoftDocs/powerapps-docs-pr/pull/12155)

## Additional resources
