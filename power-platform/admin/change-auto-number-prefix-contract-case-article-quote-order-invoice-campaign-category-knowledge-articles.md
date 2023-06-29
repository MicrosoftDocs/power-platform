---
title: "Change auto-numbering prefixes for contracts, cases, articles, quotes, orders, invoices, campaigns, categories, and knowledge articles  | MicrosoftDocs"
description: Change auto-numbering prefixes for contracts, cases, articles, quotes, orders, invoices, campaigns, categories, and knowledge articles
author: sericks007

ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/13/2020
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
---
# Change auto-numbering prefixes for contracts, cases, articles, quotes, orders, invoices, campaigns, categories, and knowledge articles

Contracts, cases, articles, quotes, orders, invoices, marketing campaigns, categories, and knowledge articles are automatically numbered. If your organization has standard numbering formats, you can change the default three-character prefixes and number format to match your organization.  

These settings can be found in the Microsoft Power Platform admin center by going to **Environments** > [select an environment] > **Settings** > **Data management** > **Auto numbering**.

Make sure you have the System Administrator or System Customizer security role or equivalent permissions to update the setting.

- Follow the steps in [View your user profile](/powerapps/user/view-your-user-profile).
- Don’t have the correct permissions? Contact your system administrator.
  
1.  Select an environment and go to **Settings** > **Data management** > **Auto numbering**.
  
2.  In the **Set Auto-Numbering** dialog box, select the record type that you want to change.  
  
3.  In the **Prefix** box, enter up to three characters, symbols, or numbers.  
  
     Prefixes are system-wide and are used for all system-generated numbers for the selected record type. If you change the prefix for a record type, it won’t change the prefix of numbers that are already assigned.  
  
     The prefix of the tracking token for email messages is set in the System Settings area. More information: [System Settings dialog box - Email tab](system-settings-dialog-box-email-tab.md)  
  
4.  In the **Number** box, enter the starting number.  
  
     If you haven’t set a numbering format before, the **Number** box displays 1000. After you set the numbering format and save your settings, this field is set to read-only and you can’t modify it. If a custom auto-numbering solution was used, you won’t be able to change the number.  
  
5.  Select a suffix length.  
  
     Articles and knowledge articles don’t have suffixes. The suffix is used for records that were created while you were offline and for which the number can’t be guaranteed to be unique.  
  
6.  Select **OK** to save your settings.  
  
### See also  
 [Use solutions for your customizations](/dynamics365/customer-engagement/customize/use-solutions-for-your-customizations)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
