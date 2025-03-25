---
title: Column-level security 
description: Overview of column-level security using an example.
ms.component: pa-admin
ms.topic: overview
ms.date: 04/01/2025
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: sericks
contributors:
  - fafuxa-ms
  - srpoduri
ms.custom: "admin-security"
search.audienceType: 
  - admin
---
# Column-level security to control access

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Manage access to records at the table level using [privileges associated with security roles](how-record-access-determined.md). Some columns in a table might contain data that is more sensitive than others. Use column-level security to manage access to data in specific columns. Column-level security configurations are organization-wide and apply to all data access requests.

You can use column level security to prevent certain users from:

- Changing a column value in a record.
- Viewing the data in a sensitive column, such as a government ID or credit card number. You can choose to mask this value to show a portion of it, or not return any data at all.

To configure column-level security, you need the system administrator role.

> [!NOTE]
> Column-level security doesn't apply for users who have the system administrator role. To verify the configured results, you must use an an account that doesn't have the system administrator security role assigned.

Column-level security is available [for most columns](#which-columns-can-be-secured). This is the process:
  
1. Enable column-level security on one or more columns for a given table.
1. Optionally, select a [masking rule](create-manage-masking-rules.md).  
1. Associate one more existing security profiles, or create one or more new security profiles to grant the appropriate access to specific users or teams.
  
A security profile determines:

- Permissions to the secure columns.  
- Users and teams assigned access.

You can configure a security profile to grant user or team members the following permissions at the column level:  

- **Read**: Read-only access to the column's data.
- **Read unmasked**: The Read column's data [unmasked values](create-manage-masking-rules.md).
- **Create**: Users or teams in this profile can add data to this column when creating a row.  
- **Update**: Users or teams in this profile can update the column's data after it's created.  

Configure a combination of these four permissions to determine the user privileges for a specific data column.  

> [!IMPORTANT]
> Unless one or more security profiles are assigned to a column with security, only users with the system administrator security role can access the column.  
  

## Enable column security

1. Sign in to [Power Apps](https://make.powerapps.com/).
1. Select **Solutions**.
1. Select the unmanaged solution that contains the table, or create a new solution to hold your changes.
1. In **Objects**, within **Tables**, select the table.
1. Under **Schema**, select **Columns**.

   :::image type="content" source="media/field-security-schema-columns.png" alt-text="Screenshot showing where to select Columns.":::

1. In the **Columns** list, select a column.
1. Expand **Advanced options**, and then under **General**, select **Enable column security**.

   :::image type="content" source="media/field-security-advanced-options-enable.png" alt-text="Screenshot showing how to expand Advanced options and turn on column security.":::

1. Select **Save**.

## Add teams or users to a column security profile to control access

<!-- fwlink  https://go.microsoft.com/fwlink/?linkid=2193903 -->

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) with System Administrator security role or equivalent permissions.
1. Select the environment to configure security profiles for. 
1. Select **Settings** > **Users + permissions** > **Column security profiles**. 
1. Select an existing profile, or select **New Profile**, enter a name, enter a description, and then select **Save**.  
1. Select the **Teams** or **Users** tab, select **+ Add Teams** or **+ Add Users**, select the teams or that you want to control access, and then select **Add**. 

    > [!TIP]
    > Instead of adding each user, create one or more teams that include all users that you want to control access.

1. Select the **Column Permission** tab, in the **Name** column select one or more columns, and then select **Edit**. Configure the four properties for the desired access.  

   :::image type="content" source="media/field-security-edit-field-permission.png" alt-text="Screenshot showing the Edit column security permissions.":::


   |Permission|Options|
   |---------|---------|
   |**Read**|**Allowed**<br />**Not Allowed**|
   |**Read unmasked**|**All Records**<br />**One record**<br />**Not Allowed**|
   |**Update**|**Allowed**<br />**Not Allowed**|
   |**Create**|**Allowed** <br />**Not Allowed**|


1. Select **Save**.

Any users not defined in the previously created column security profiles won't have access to the column on forms or views. The column value displays ![Lock icon.](../admin/media/admin-field-level-security-lock.png "Lock icon") ********, indicating that the column is secured.


## Which columns can be secured?  

When a column is eligible for column level security, the **Enable column security** checkbox is enabled in the **Advanced options** area of the column definition in [Power Apps](https://make.powerapps.com/).

:::image type="content" source="media/field-security-enable-column-security.png" alt-text="Screenshot showing how to enable column security.":::

You can view this area when you [create or edit a column](/power-apps/maker/data-platform/create-edit-field-portal).

Columns that can't be secured include:

- [Lookup columns](/power-apps/maker/data-platform/types-of-fields#different-types-of-lookups)
- [Formula columns](/power-apps/maker/data-platform/formula-columns)
- Primary name columns (The single-line of text column each table has to show the value in a lookup field. Typically with a name ending with `name`.)
- System columns like `createdon`, `modifiedon`, `statecode`, and `statuscode`.

Whether the **Enable column security** checkbox is enabled depends on the value of these column properties: `CanBeSecuredForCreate`, `CanBeSecuredForRead`, and `CanBeSecuredForUpdate`. A developer can write a query to retrieve a list of these columns and you can view this data by installing the Metadata Browser solution described in [Browse the Metadata for Your Organization](/powerapps/developer/common-data-service/browse-your-metadata). Learn more about [which columns can be secured](/power-apps/developer/data-platform/field-security-entities#which-attributes-can-be-secured) and [how developers can retrieve this data](/power-apps/developer/data-platform/query-schema-definitions).


## Best practices

When a [calculated column](/power-apps/maker/data-platform/define-calculated-fields) includes a column that is secured, data might be displayed in the calculated column to users that don't have permission to the secured column. Both the original column and the calculated column should be secured.
  
_Composite columns_ include data from multiple columns. For example, the [`contact` table](/power-apps/developer/data-platform/reference/entities/contact) [`fullname`](/power-apps/developer/data-platform/reference/entities/contact#BKMK_FullName) and [`address1_composite`](/power-apps/developer/data-platform/reference/entities/contact#BKMK_Address1_Composite) columns are composite columns. To completely secure data included in composite columns, you must secure and configure the appropriate column security profiles on multiple columns for the table. For example, to completely secure the `address1_composite` column, you need to secure all of these the columns that begin with `address1_` in both the [contact](/power-apps/developer/data-platform/reference/entities/contact) and [address (`customeraddress`)](/power-apps/developer/data-platform/reference/entities/customeraddress) tables.


> [!Note]
> Changes to column security require a browser refresh from the end user on the client (like a model-driven app) for the changes to take effect. This should be considered when dynamically adjusting access rules.
  
### Related information

[Set up security permissions for a column](set-up-security-permissions-field.md)   
[Enable or disable security for a column to control access](enable-disable-security-field.md)   
[Add teams or users to a column security profile to control access](add-teams-users-field-security-profile.md)   
[Hierarchy security](hierarchy-security.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
