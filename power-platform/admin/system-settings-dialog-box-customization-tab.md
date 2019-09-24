---
title: "System Settings dialog box - Customization tab for Dynamics 365 apps | MicrosoftDocs"
ms.custom: 
ms.date: 10/30/2017
ms.reviewer: 
ms.service: crm-online
ms.suite: 
ms.tgt_pltfrm: 
ms.topic: article
applies_to: 
  - Dynamics 365 for Customer Engagement  (online)
  - Dynamics 365 for Customer Engagement  Version 9.x
author: jimholtz
ms.assetid: d1d78ba3-58a9-4608-acfc-eb1da235fe1b
caps.latest.revision: 25
ms.author: jimholtz
manager: kvivek
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - Powerplatform
---
# System Settings dialog box - Customization tab 

Use the tab to set preferences for plug-in and workflow tracing and also the use of application mode.

[!INCLUDE [cc-settings-moving](../includes/cc-settings-moving.md)] 
  
## Open the System Settings dialog box (if it isn’t already open)  
  
1. [!INCLUDE[proc_permissions_system_admin_and_customizer](../includes/proc-permissions-system-admin-and-customizer.md)]  
  
    Check your security role  
  
   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  
  
   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  
  
2. [!INCLUDE[proc_settings_administration](../includes/proc-settings-administration.md)]  
  
3. Choose **System Settings** and then choose the **Customization** tab.  
  
|                                                                       Settings                                                                        |                                                                                                                                                                                                                                                                                                                                                                                                        Description                                                                                                                                                                                                                                                                                                                                                                                                        |
|-------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|                                                                 **Application mode**                                                                  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| Set whether Dynamics 365 apps can be opened in a browser window without menu, navigation, and command bars. |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
|                                 Open Dynamics 365 apps in Application mode                                  |                                                                                                                                                                                                 Select this check box to enable application mode. When this mode is enabled, [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps can be opened in a browser without menus, navigation, or toolbars. Hiding these parts of the browser causes [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps to appear like a separate application rather than a website. By default, application mode isn’t enabled.                                                                                                                                                                                                 |
|                                                   **Plug-in and custom workflow activity tracing**                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
|                                                          Enable logging to plug-in trace log                                                          | You can now store detailed information about an exception or trace event raised by a custom code to help developers debug plug-ins or custom workflow activity that they develop using the customization methods supported by [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps.<br /><br /> -   To capture trace logs only for exceptions, select **Exception**.<br />-   To capture logs for all errors and general trace events, select **All**.<br />-   To disable capturing trace logs, select **Off**.<br /><br /> [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Debug a plug-in](/dynamics365/customer-engagement/developer/debug-plugin.md)  **Warning:**  We recommend that you don’t keep this option enabled for an extended period because it may have performance implications in your organization. |
|                                                               **Enable Microsoft Flow**                                                               |                                                                                                                                                                                                                                                                                                                                                       More information: [Enable embedded Flow to automate processes](enable-embedded-flow-in-your-organization.md)                                                                                                                                                                                                                                                                                                                                                        |
|                                                   Show Microsoft Flow on forms and in the site map                                                    |                                                                                                                                                                                                                                                                                                                                                                   Default: Yes. Choose **Yes** to enable embedded Microsoft Flows in your organization.                                                                                                                                                                                                                                                                                                                                                                   |
  
### See also  
 [Debug a plug-in](/dynamics365/customer-engagement/developer/debug-plugin.md)
