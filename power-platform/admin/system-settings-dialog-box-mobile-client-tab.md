---
title: "System Settings Mobile Client tab"
description: Legacy System Settings Mobile Client tab in Power Platform.
author: sericks007
ms.component: pa-admin
ms.topic: concept-article
ms.date: 09/11/2025
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
---
# System Settings Mobile Client tab

> [!IMPORTANT]
> This article describes how to use the legacy settings experience for managing mobile clients. For information about the current experience, go to [Advanced mobile offline settings for model-driven apps](settings-features.md#advanced-mobile-offline-settings-for-model-driven-apps).

Use the settings on this page to manage mobile settings.

<!-- legacy procedure -->

## Open the System Settings tab

1. [!INCLUDE[proc_permissions_system_admin_and_customizer](../includes/proc-permissions-system-admin-and-customizer.md)]  

    Check your security role  

   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  

   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  

2. In the Power Platform admin center, go to **Manage** > **Environments**, and then open the environment you want.
3. On the command bar select **Settings**, and then under **Resources** select **All legacy settings**.
4. Select **Settings** (dropdown arrow) > **Administration** > **System Settings**.
5. Select the **Mobile Client** tab.  


|                           Settings                            |                                                                                                                                                                                                                                         Description                                                                                                                                                                                                                                          |
|---------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Set conflict detection for mobile offline synchronization** |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
|      Enable conflict for mobile offline synchronization       | If Yes, sync conflict detection will be enabled during the play back of actions after an offline device comes back online. If No, the default, no conflict detection is done while playing back actions after an offline device comes back online. The changes done offline will overwrite any changes done in customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation).<br/>For more information, see "Sync conflict resolution" in [Work offline with Dynamics 365 for phones and tablets](/dynamics365/mobile-app/work-in-offline-mode) |



[!INCLUDE[footer-include](../includes/footer-banner.md)]
