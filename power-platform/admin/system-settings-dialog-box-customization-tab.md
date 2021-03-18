---
title: "System Settings Customization tab  | MicrosoftDocs"
description: System Settings Customization tab 
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/17/2021
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# System Settings Customization tab 

Use the tab to set preferences for plug-in and workflow tracing and also the use of application mode.

<!-- legacy procedure -->
  
## Open the System Settings dialog box 
  
1. [!INCLUDE[proc_permissions_system_admin_and_customizer](../includes/proc-permissions-system-admin-and-customizer.md)]  
  
    Check your security role  
  
   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  
  
   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  
  
2. In the web app, go to **Settings** (![Settings](media/settings-gear-icon.png "Settings")) > **Advanced Settings**.

3. Select **Settings** > **Customization**.

4. Choose **System Settings** and then choose the **Customization** tab.  
  
|                                                                       Settings                                                                        |                                                                                                                                                                                                                                                                                                                                                                                                        Description                                                                                                                                                                                                                                                                                                                                                                                                        |
|-------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|                                                                 **Application mode**                                                                  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| Set whether customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), can be opened in a browser window without menu, navigation, and command bars. |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
|                                 Open customer engagement apps in Application mode                                  |                                                                                                                                                                                                 Select this check box to enable application mode. When this mode is enabled, customer engagement apps can be opened in a browser without menus, navigation, or toolbars. Hiding these parts of the browser cause customer engagement apps to appear like a separate applications rather than a website. By default, application mode isn't enabled.                                                                                                                                                                                                 |
|                                                   **Plug-in and custom workflow activity tracing**                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
|                                                          Enable logging to plug-in trace log                                                          | You can now store detailed information about an exception or trace event raised by a custom code to help developers debug plug-ins or custom workflow activity that they develop using the customization methods supported by customer engagement apps.<br /><br /> -   To capture trace logs only for exceptions, select **Exception**.<br />-   To capture logs for all errors and general trace events, select **All**.<br />-   To disable capturing trace logs, select **Off**.<br /><br /> [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Debug a plug-in](/powerapps/developer/common-data-service/debug-plug-in)  **Warning:**  We recommend that you don't keep this option enabled for an extended period because it may have performance implications in your organization. |
|                                                               **Enable Microsoft Power Automate**                                                               |                                                                                                                                                                                                                                                                                                                                                       More information: [Enable embedded Power Automate to automate processes](enable-embedded-flow-in-your-organization.md)                                                                                                                                                                                                                                                                                                                                                        |
|                                                   Show Power Automate on forms and in the site map                                                    |                                                                                                                                                                                                                                                                                                                                                                   Default: Yes. Choose **Yes** to enable embedded Power Automate flows in your organization.                                                                                                                                                                                                                                                                                                                                                                   |
  
### See also  
 [Debug a plug-in](/powerapps/developer/common-data-service/debug-plug-in)


[!INCLUDE[footer-include](../includes/footer-banner.md)]