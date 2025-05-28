---
title: Column-level security example 
description: This scenario-based example describes how to configure column level security.
ms.component: pa-admin
ms.topic: how-to
ms.date: 03/25/2025
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: sericks
contributors:
  - JimDaly
ms.custom: "admin-security"
search.audienceType: 
  - admin
---
# Column-level security example

This scenario describes how to use Dataverse [column-level security](field-level-security.md).

Imagine your company's policy is that sales members should have different levels of access to contact mobile phone numbers, as described here.  
  
|User or Team|Access|  
|------------------|------------|  
|Sales managers|Read-only. Can only view mobile phone numbers in [masked form](create-manage-masking-rules.md) for contacts.|  
|Vice presidents|Full. Can create, update, and view mobile phone numbers for contacts.|  
|Salespersons and all other users|None. Can't create, update, or view mobile phone numbers for contacts.|  
  
Use the following steps to secure this column.
  
## Secure the column

1. Sign in to [Power Apps](https://make.powerapps.com/).
1. Select **Tables**.
1. Select the **Contact** table.

   :::image type="content" source="media/field-security-tables-contact.png" alt-text="Screenshot showing how to select the Contact table.":::

1. Under **Schema**, select **Columns**.

   :::image type="content" source="media/field-security-schema-columns.png" alt-text="Screenshot showing under Schema, select Columns.":::

1. Scroll down in the Columns list and open **Mobile Phone**.

   :::image type="content" source="media/field-security-mobile-phone.png" alt-text="Screenshot showing the Mobile Phone column.":::

1. Expand **Advanced options**, and then under **General**, select **Enable column security**.

   :::image type="content" source="media/field-security-advanced-options-enable.png" alt-text="Screenshot showing advanced options and enable column security.":::

1. Select the **Masking rule** dropdown menu, and select a [masking rule](create-manage-masking-rules.md).
1. Select **Save**.

## Configure security profiles
  
1. From the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select the environment to configure security profiles for.
1. Select **Settings** > **Users + permissions** > **Column security profiles**.
1. Select **New Profile**, enter a name, such as *Sales Manager*, enter a description, and then select **Save**.  

   :::image type="content" source="media/field-security-new-profile.png" alt-text="Screenshot showing how to create a new column security profile.":::

1. Select **Sales Manager**, select the **Users** tab, select **+ Add Users**, select the users that you want to grant access to the mobile phone number on the contact form, and then select **Add**.

   > [!TIP]
   > Instead of adding each user, create one or more teams that include all users that you want to grant access.  

1. Repeat the above steps and create a column security profile for *Vice President*.  

## Configure column permissions

1. Select the **Column Security Profiles** tab, and then select **Sales Manager**. 
1. Select the **Column Permission** tab, select **mobilephone**, and then select **Edit**. Set the **Read** setting to **Allowed**, leave the others as **Not Allowed**, and then select **Save**.

   :::image type="content" source="media/field-security-edit-field-permission.png" alt-text="Screenshot showing the edit column security permissions.":::

1. Select the **Column Security Profiles** tab, and then select **Vice President**.

1. Select the **Column Permissions** tab, select **mobilephone**, and then select **Edit**. Set the **Read** setting to **Allowed**, the [**Read unmasked**](create-manage-masking-rules.md) to **One record**, and the rest as **Allowed**, and then select **Save**.  

Users not defined in the previously created column security profiles lack access to the mobile phone column on contact forms or views. The column value displays ![Lock icon.](../admin/media/admin-field-level-security-lock.png "Lock icon") ********, indicating that the column is secured.

### Related information

[Column-level security to control access](field-level-security.md)   
[Hierarchy security](hierarchy-security.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
