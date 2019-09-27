---
title: "Turn duplicate detection rules on or off for the whole organization for Dynamics 365 apps | MicrosoftDocs"
description: Turn duplicate detection rules on or off for the whole organization for Dynamics 365 apps
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/13/2019
ms.author: jimholtz 
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Turn duplicate detection rules on or off for the whole organization

To maintain the integrity of your data, it’s a good idea to set up duplicate detection rules to reduce duplicate records in the system. Remember that after you create duplicate detection rules, you need to turn them on.  
  
These settings can be found in the Power Platform Admin center by going to **Environments** > [select an environment] > **Settings** > **Data management** > **Duplicate detection**.

Make sure you have the System Administrator, System Customizer, Sales Manager, Vice President of Sales, Vice President of Marketing, or CEO-Business Manager security role or equivalent permissions to update the setting.

- Follow the steps in [View your user profile](https://docs.microsoft.com/dynamics365/customer-engagement/basics/view-your-user-profile).
- Don’t have the correct permissions? Contact your system administrator.

  
1. Select an environment and go to **Settings** > **Data management** > **Duplicate detection**.
  
2. Select or clear the **Enable duplicate detection** check box.  
  
   > [!NOTE]
   >  If your system contains a large number of records, checking for duplicates can impact performance.  
  
3. If you’re turning duplicate detection on, select or clear the check boxes to set when duplicates are detected:  
  
   - **When a record is created or updated**  
  
        The system checks for duplicates when a user enters or updates records.  
  
       > [!IMPORTANT]
       >  Duplicates aren’t detected when a user merges two records, activates or deactivates a record, or saves a completed activity.  
  
   - **When Dynamics 365 apps for [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] goes from offline to online**  
  
        For users of Dynamics 365 apps for [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)], the system detects duplicates when the user synchronizes their data after working offline, as long as users have enabled duplicate detection in [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)]. To enable duplicate detection in [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)], select **File** > **Dynamics 365**  > **Options**. Choose the **Local Data** tab, and then select the **Enable duplicate detection during offline to online synchronization** check box.  
  
   - **During data import**  
  
        When you use the Import Data wizard to bring in contacts, leads, accounts, or other types of data, the wizard detects any duplicate records as long as you enable duplicate detection in the wizard. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Import accounts, leads, or other data](https://docs.microsoft.com/dynamics365/customer-engagement/basics/import-accounts-leads-other-data)  
  
4. Select **OK**.  
  
### See also  
 [Set up duplicate detection rules to keep your data clean](https://docs.microsoft.com/dynamics365/customer-engagement/admin/set-up-duplicate-detection-rules-keep-data-clean)   
 [Frequently asked questions about synchronizing records between Microsoft Dynamics 365 apps and Microsoft Outlook](https://docs.microsoft.com/dynamics365/customer-engagement/admin/frequently-asked-questions-synchronizing-records-dynamics-365-and-outlook)   
 [Run bulk system jobs to detect duplicate records](https://docs.microsoft.com/dynamics365/customer-engagement/admin/run-bulk-system-jobs-detect-duplicate-records)
