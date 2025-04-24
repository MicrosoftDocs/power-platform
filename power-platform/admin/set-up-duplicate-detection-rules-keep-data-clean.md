---
title: Set up duplicate detection rules to keep your data clean  
description: Set up duplicate detection rules to keep your data clean.
author: sericks007
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/23/2025
ms.subservice: admin
ms.custom: NewPPAC
ms.author: sericks
---

# Set up duplicate detection rules to keep your data clean

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

To maintain the integrity of your data, it's a good idea to have rules in place to reduce duplicate records in the system. Model-driven apps and customer engagement apps (such as Dynamics 365 Sales and Dynamics 365 Customer Service) include default, duplicate detection rules for accounts and contacts, but not for other types of records. If you want the system to detect duplicates for other record types, you need to create a new duplicate detection rule. After you've created duplicate detection rules, you can turn on the rules.  
  
[!INCLUDE[proc_permissions_mgr_vp_sys_admin_sys_cust](../includes/proc-permissions-mgr-vp-sys-admin-sys-cust.md)] To check your security role, see [View your user profile](/powerapps/user/view-your-user-profile). If you don’t have the correct permissions, contact your system administrator.

## [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. In the **Environments** page, select an environment.
1. Select **Settings** in the command bar.
1. Expand **Data management**, and then select **Duplicate detection rules**. 

## [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, **Environments**.
1. In the **Environments** page, select an environment.
1. Select **Settings** in the command bar.
1. Expand **Data management**, and then select **Duplicate detection rules**. 
---

1. To create a new duplicate detection rule, select **New**. Type a name and description.  
  
    –OR–  
  
    To edit an unpublished existing duplicate detection rule, select the duplicate detection rule.  
  
    –OR–  
  
    To edit a published duplicate detection rule, select the rule. On the **Actions** menu, select **Unpublish**, and then select the rule.  
  
1. Select the criteria to be used to identify a record as a duplicate.  
  
   1. If you're creating a new rule:  
  
       - In the **Duplicate Detection Rule Criteria** section, in the **Base Record Type** list, select the type of record that this rule applies to. For example, select **Contacts**.  
  
       - In the **Matching Record Type** box, select the type of record to compare. In most cases, you'll probably want to use the same record type for **Base Record Type** and **Matching Record Type**. It's also useful to be able to compare different record types. For example, you might want to compare the **Email** field in Contacts to the **Email** field in Leads.  
  
   1. If you want the rule to consider only active records while detecting duplicates, select the **Exclude inactive matching records** check box. You should also select this check box if your duplicate detection rule criteria are based on a status field.  
  
   1. If you want the rule to be case-sensitive, select the **Case-sensitive** check box.  
  
   1. If you selected different record types for the base and matching record types, for each new criterion, in the **Base Record Field** column, select **Select**, and then select a field name. In the same row, in the **Matching Record Field** column, select **Select**, and then select a field name.  
  
        \-  OR -  
  
        If you selected the same record types for the base and matching record types, for each new criterion, in the **Field** column, select **Select**, and then select a field.  
  
   1. In the same row, in the **Criteria** column, select **Select**, and then select an operator. For example, select **Exact Match**.  
  
   1. If you specified **Same First Characters** or **Same Last Characters**, in the **No. of Characters** column, select **Enter Value**, and then enter the number of characters to compare.  
  
   1. If you don't want the rule to consider blank fields (null values) as equal while identifying duplicates, select the **Ignore Blank Values** check box.  
  
       > [!IMPORTANT]
       >  If the duplicate detection rule contains only one condition, blank values are ignored during duplicate detection job and they do not work when the user is offline.
  
      The number of criteria that you can select is limited by the number of characters that can be stored in the matchcode for the record. As you add criteria, watch the **Current matchcode length** value shown at the bottom of the criteria list.  
  
1. When you're finished adding criteria, select **Save and Close**.  
  
1. To make the new or changed duplicate detection rule usable, select the rule, and then select **Publish**.  
  
    When you publish a duplicate detection rule, a matchcode is created for every record in the matching record type for that rule. You can publish only five rules for the same base record type (Account, for example) at a time. You might need to delete or unpublish an existing rule if you bump up against this limit.  
  
> [!NOTE]
> - We recommend that you set the duplicate detection criteria on a field that has unique values, for example, **Email**.  
> - You can have more than one duplicate detection rule for each record type.  
  
### Related content

 [Turn duplicate detection rules on or off for the whole organization](../admin/turn-duplicate-detection-rules-off-whole-organization.md)<br />
 [Run bulk system jobs to detect duplicate records](../admin/run-bulk-system-jobs-detect-duplicate-records.md)<br />
 [Merge duplicate records for accounts, contacts, or leads](/powerapps/user/merge-duplicate-records)<br />
 [Developer's Guide: Duplicate Rule entities](/powerapps/developer/common-data-service/duplicaterule-entities)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
