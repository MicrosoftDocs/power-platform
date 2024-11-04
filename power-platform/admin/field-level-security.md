---
title: "Column-level security  | MicrosoftDocs"
description: Overview of column-level security using an example.
ms.component: pa-admin
ms.topic: overview
ms.date: 11/04/2024
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

Record-level permissions are granted at the table level, but you may have certain columns associated with a table that contain data that is more sensitive than the other columns. For these situations, you use _column-level security_ to control access to specific columns.  
  
 The scope of column-level security is organization-wide and applies to all data access requests, including the following requests and calls:  
  
- Data access requests from within a client application, such as web browser, mobile client, or [!INCLUDE[pn_microsoft_dynamics_crm_for_outlook](../includes/pn-microsoft-dynamics-crm-for-outlook.md)]  
- Web service calls using the Microsoft Dataverse web services (for use in plug-ins, custom workflow activities, and custom code)  
- Reporting (using filtered views)  
  
> [!NOTE]
> The use of table-related terminology depends on the protocol or class library used. Learn more in [Terminology use depending on protocol or technology](/power-apps/developer/data-platform/understand-terminology).

## Overview of column-level security  
Column-level security is available for the default columns on most out-of-box tables, custom columns, and custom columns on custom tables. Column-level security is managed by the security profiles. To implement column-level security, a system administrator performs the following tasks.  
  
1. Turn on column security on one or more columns for a given table.
1. Select an optional [masking rule](create-manage-masking-rules.md).  
1. Associate one more existing security profiles, or create one or more new security profiles to grant the appropriate access to specific users or teams.  
  
    A security profile determines the following:  
      
    - Permissions to the secure columns  
    - Users and teams assigned access 

    A security profile can be configured to grant user or team members the following permissions at the column level:  
      
    - **Read**: Read-only access to the column's data.
    - **Read unmasked**: The Read column's data [unmasked values](create-manage-masking-rules.md).
    - **Create**: Users or teams in this profile can add data to this column when creating a row.  
    - **Update**: Users or teams in this profile can update the column's data after it has been created.  
      
    A combination of these four permissions can be configured to determine the user privileges for a specific data column.  
      
    > [!IMPORTANT]
    > Unless one or more security profiles are assigned to a column with security, only users with the system administrator security role can access the column.  
  
## Example of restricting the mobile phone column for the Contact table  
Imagine your company's policy is that sales members should have different levels of access to contact mobile phone numbers, as described here.  
  
|User or Team|Access|  
|------------------|------------|  
|Sales managers|Read-only. Can only view mobile phone numbers in [masked form](create-manage-masking-rules.md) for contacts.|  
|Vice presidents|Full. Can create, update, and view mobile phone numbers for contacts.|  
|Salespersons and all other users|None. Can't create, update, or view mobile phone numbers for contacts.|  
  
 To restrict this column, you would do the following tasks.  
  
 ### Secure the column

1. Sign in to [Power Apps](https://make.powerapps.com/).

2. Select **Tables**.

3. Select the **Contact** table.

   :::image type="content" source="media/field-security-tables-contact.png" alt-text="Select the Contact table.":::

4. Under **Schema**, select **Columns**.

   :::image type="content" source="media/field-security-schema-columns.png" alt-text="Under Schema, select Columns.":::

5. Scroll down in the Columns list and open **Mobile Phone**.

   :::image type="content" source="media/field-security-mobile-phone.png" alt-text="Select the Mobile Phone column.":::

6. Expand **Advanced options**, and then under **General**, select **Enable column security**.

   :::image type="content" source="media/field-security-advanced-options-enable.png" alt-text="Expand Advanced options and enable column security.":::

7. Select the **Masking rule** dropdown menu, and select a [masking rule](create-manage-masking-rules.md).
  
8. Select **Save**.

### Configure the security profiles
  
1. From the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select the environment to configure security profiles for. 

2. Select **Settings** > **Users + permissions** > **Column security profiles**. 

3. Select **New Profile**, enter a name, such as *Sales Manager*, enter a description, and then select **Save**.  

   :::image type="content" source="media/field-security-new-profile.png" alt-text="Create a new column security profile.":::

4. Select **Sales Manager**, select the **Users** tab, select **+ Add Users**, select the users that you want to grant access to the mobile phone number on the contact form, and then select **Add**.   

   > [!TIP]
   > Instead of adding each user, create one or more teams that include all users that you want to grant access.  

5. Repeat the above steps and create a column security profile for *Vice President*.  

### Configure column permissions

1. Select the **Column Security Profiles** tab, and then select **Sales Manager**. 

2. Select the **Column Permission** tab, select **mobilephone**, and then select **Edit**. Set the **Read** setting to **Allowed**, leave the others as **Not Allowed**, and then select **Save**.

   :::image type="content" source="media/field-security-edit-field-permission.png" alt-text="Edit column security permissions.":::

3. Select the **Column Security Profiles** tab, and then select **Vice President**. 

4. Select the **Column Permissions** tab, select **mobilephone**, and then select **Edit**. Set the **Read** setting to **Allowed**, the [**Read unmasked**](create-manage-masking-rules.md) to **One record**, and the rest as **Allowed**, and then select **Save**.  

Any users not defined in the previously created column security profiles won't have access to the mobile phone column on contact forms or views. The column value displays ![Lock icon.](../admin/media/admin-field-level-security-lock.png "Lock icon") ********, indicating that the column is secured.  
  

## Which columns can be secured?  

### Add a new column 
1. Sign in to [Power Apps](https://make.powerapps.com/).

1. Select **Tables** in the navigation pane.

1. Select a table, and then under **Schema**, select **Columns**.

1. Select the **+ New column** option in the command bar.

1. Enter a **Display name** and **Description**.

1. Select a **Data type**.
   
   The **Lookup** and **Formula** data types can't be set with column security. For more information, see [Attributes that can't be enabled for column security](#attributes-that-cant-be-enabled-for-column-security).
   
1. Expand **Advance options**, and then under **General**, select the **Enable column security** checkbox.

### View column-level security
Every column in the system contains a setting for whether column security is allowed. Use the following steps to view column security settings.

1. Sign in to [Power Apps](https://make.powerapps.com/).

1. Select **Tables** in the navigation pane.

1. Select a table, and then under **Schema**, select **Columns**.

1. Select a column, expand **Advanced options**, and then under **General**, view the status of **Enable column security**.

If **Enable column security** can be selected, the column can be enabled for column security. 

   :::image type="content" source="media/field-security-enable-column-security.png" alt-text="Enable column security is possible.":::
 
### Attributes that can't be enabled for column security
Although most attributes can be secured, there are system attributes, such as IDs, timestamps, and record tracking attributes, that can't. Below are a few examples of attributes that can't be enabled for column security. 
-    ownerid, processid, stageid, accountid, contactid, businessunitid, organizationid, solutionid, supportingsolutionid, transactioncurrencyid, goalownerid, subscriptionid, userpuid, yammeruserid
-    createdby, modifiedby, OwningTeam, OwningUser, Owningbusinessunit, yammeremailaddress
- createdon, EntityImage_Timestamp, modifiedon, OnHoldTime, overriddencreatedon, overwritetime, modifiedonbehalfby, timezoneruleversionnumber, versionnumber, importsequencenumber
-    statecode, statuscode, componentstate, exchangerate, utcconversiontimezonecode
-    fullname, firstname, middlename, lastname, yominame, yomifirstname, yomifullname, yomilastname, yomimiddlename
-    deprecated columns, for example: traversedpath, stageid

You can view the table metadata for your organization including which columns can be enabled for column security, by installing the Metadata Browser solution described in [Browse the Metadata for Your Organization](/powerapps/developer/common-data-service/browse-your-metadata). 
    
## Best practices when you use column security  
When you use calculated column that include a column that is secured, data may be displayed in the calculated column to users that don't have permission to the secured column. In this situation, both the original column and the calculated column should be secured.  
  
Some data, such as addresses, are made up of multiple columns. Therefore, to completely secure data that includes multiple columns, such as addresses, you must secure and configure the appropriate column security profiles on multiple columns for the table. For example, to completely secure addresses for a table, secure all relevant address columns, such as address_line1, address_line2, address_line3, address1_city, address1_composite, and so on.  

> [!Note]
> Changes to column security require a browser refresh from the end user on the client (like a model-driven app) for the changes to take effect. This should be considered when dynamically adjusting access rules. 
  
### Related information
[Set up security permissions for a column](set-up-security-permissions-field.md) <br />
[Enable or disable security for a column to control access](enable-disable-security-field.md)   <br />
[Add teams or users to a column security profile to control access](add-teams-users-field-security-profile.md) <br />
[Hierarchy security](hierarchy-security.md)






[!INCLUDE[footer-include](../includes/footer-banner.md)]
