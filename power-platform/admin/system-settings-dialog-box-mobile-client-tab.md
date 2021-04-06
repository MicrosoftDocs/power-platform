---
title: "System Settings Mobile Client tab  | MicrosoftDocs"
description: System Settings Mobile Client tab 
author: jimholtz
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
# System Settings Mobile Client tab

Use the settings on this page to manage mobile settings.

<!-- legacy procedure -->

## Open the System Settings dialog box 

1. [!INCLUDE[proc_permissions_system_admin_and_customizer](../includes/proc-permissions-system-admin-and-customizer.md)]  

    Check your security role  

   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  

   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  

2. In the web app, go to **Settings** (![Settings](media/settings-gear-icon.png "Settings")) > **Advanced Settings**.

3. Select **Settings** > **Administration**.

4. Select the **System Settings** > **Mobile Client** tab.  


|                           Settings                            |                                                                                                                                                                                                                                         Description                                                                                                                                                                                                                                          |
|---------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Set conflict detection for mobile offline synchronization** |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
|      Enable conflict for mobile offline synchronization       | If Yes, sync conflict detection will be enabled during the play back of actions after an offline device comes back online. If No, the default, no conflict detection is done while playing back actions after an offline device comes back online. The changes done offline will overwrite any changes done in customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation).<br/>For more information, see "Sync conflict resolution" in [Work offline with Dynamics 365 for phones and tablets](/dynamics365/mobile-app/work-in-offline-mode) |



[!INCLUDE[footer-include](../includes/footer-banner.md)]