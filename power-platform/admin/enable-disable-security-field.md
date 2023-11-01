---
title: "Enable or disable column-level security"
description: "Power Platform's column-level security lets you set which columns users can see or edit. Follow these steps to enable or disable security for a column."
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/19/2022
author: praveenmantha
ms.subservice: admin
ms.author: pmantha
ms.reviewer: jimholtz
ms.custom: "admin-security"
search.audienceType: 
  - admin
---
# Enable or disable security for a column to control access

Column-level security lets you set which columns users can see or edit. For example, if want to prevent users from accidentally changing an account name, you can restrict them from editing that column. You can set column-level security for custom columns and some default columns. More information: [Column-level security](field-level-security.md)  
  
 To set which users and teams have read or write access to column, see [Set up security permissions for a column](set-up-security-permissions-field.md).  
  
> [!NOTE]
> You can't change the permissions on a column that you don't have permission to access.  

1. Sign in to [Power Apps](https://make.powerapps.com/).

2. Select **Dataverse** > **Tables**.

3. Select a table.

   :::image type="content" source="media/field-security-tables-contact.png" alt-text="Select the Contact table.":::

4. Under **Schema**, select **Columns**.

   :::image type="content" source="media/field-security-schema-columns.png" alt-text="Under Schema, select Columns.":::

5. In the Columns list, select a column.

   :::image type="content" source="media/field-security-mobile-phone.png" alt-text="Select the Mobile Phone column.":::

6. Expand **Advanced options**, and then under **General**, enable or disable **Enable column security**.

   :::image type="content" source="media/field-security-advanced-options-enable.png" alt-text="Expand Advanced options and enable column security.":::

7. Select **Save**.
  
### See also  
 [Column-level security](field-level-security.md)   
 [Set up security permissions for a column](set-up-security-permissions-field.md)   
 [Add teams or users to a column security profile to control access](add-teams-users-field-security-profile.md)








[!INCLUDE[footer-include](../includes/footer-banner.md)]
