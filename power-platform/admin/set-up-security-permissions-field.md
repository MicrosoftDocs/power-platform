---
title: Set up security permissions for a column
description: Information on how to set up security permissions for a column.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/12/2024
author: praveenmantha
ms.subservice: admin
ms.author: pmantha
ms.reviewer: sericks
ms.custom: "admin-security"
search.audienceType: 
  - admin
---
# Set up security permissions for a column 

There are two steps to set up security permissions for a column.

1. Allow column security on one or more columns for a given table.  
  
1. Associate one more existing security profiles, or create one or more new security profiles to grant the appropriate access to specific users or teams.  

After you create the profile, you assign users and or teams to that profile, and set up specific read, create, or write permissions for the column.  
  
[!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Security concepts](wp-security-cds.md)  

> [!NOTE]
> The use of table-related terminology depends on the protocol or class library used. Learn more in [Terminology use depending on protocol or technology](/power-apps/developer/data-platform/understand-terminology).


## Enable column security

1. Sign in to [Power Apps](https://make.powerapps.com/).

1. Select **Dataverse** > **Tables**.

1. Select a table.

   :::image type="content" source="media/field-security-tables-contact.png" alt-text="Screenshot showing where to select the Contact table.":::

1. Under **Schema**, select **Columns**.

   :::image type="content" source="media/field-security-schema-columns.png" alt-text="Screenshot showing where to select Columns.":::

1. In the Columns list, select a column.

   :::image type="content" source="media/field-security-mobile-phone.png" alt-text="Screenshot showing how to select the Mobile Phone column.":::

1. Expand **Advanced options**, and then under **General**, select **Enable column security**.

   :::image type="content" source="media/field-security-advanced-options-enable.png" alt-text="Screenshot showing how to expand Advanced options and turn on column security.":::

1. Select **Save**.

## Associate security profiles and set permissions

<!-- fwlink  https://go.microsoft.com/fwlink/?linkid=2193903 -->

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) with System Administrator security role or equivalent permissions.

1. Select the environment to configure security profiles for. 

1. Select **Settings** > **Users + permissions** > **Column security profiles**. 

1. Select an existing profile, or select **New Profile**, enter a name, enter a description, and then select **Save**.  

1. Select the **Users** tab, select **+ Add Users**, select the users that you want to control access, and then select **Add**. 

    > [!TIP]
    > Instead of adding each user, create one or more teams that include all users that you want to control access. 

1. Select the **Column Permission** tab, in the Name column select one or more columns, and then select **Edit**. Configure the three columns for the desired access.  

   :::image type="content" source="media/field-security-edit-field-permission.png" alt-text="Screenshot showing the Edit column security permissions.":::

1. Select **Save**.

Any users not defined in the previously created column security profiles won't have access to the mobile phone column on contact forms or views. The column value displays ![Lock icon.](../admin/media/admin-field-level-security-lock.png "Lock icon") ********, indicating that the column is secured.  
  
### Related information  
[Column-level security to control access](field-level-security.md) <br />
[Enable or disable security for a column to control access](enable-disable-security-field.md)  





[!INCLUDE[footer-include](../includes/footer-banner.md)]



