---
title: "System Settings dialog box - Outlook tab for Dynamics 365 apps | MicrosoftDocs"
description: System Settings dialog box - Outlook tab for Dynamics 365 apps
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/30/2017
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# System Settings dialog box - Outlook tab

Use the settings on this page to configure how [!INCLUDE[pn_MS_Outlook_Short](../includes/pn-ms-outlook-short.md)] interacts with model-driven apps.  

## Open the System Settings dialog box (if it’s not already open)  

1. [!INCLUDE[proc_permissions_system_admin_and_customizer](../includes/proc-permissions-system-admin-and-customizer.md)]  

    Check your security role  

   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  

   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  

2. [!INCLUDE[proc_settings_administration](../includes/proc-settings-administration.md)]  

3. Choose **System Settings** > **Outlook** tab.  

|                                                                      Settings                                                                      |                                                                                                   Description                                                                                                   |
|----------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|                  **Set email promotion options for [!INCLUDE[pn_crm_for_outlook_full](../includes/pn-crm-for-outlook-full.md)]**                   |                                                                                                                                                                                                                 |
|                                                      Perform checks as new email is received                                                       |                                                                   Default: Yes. If Yes, email is checked for tracking as soon as it arrives.                                                                    |
|                                                            Promote incoming email every                                                            |                                                               Default: 10 minutes. Looks for and links incoming email on the specified interval.                                                                |
|                                                       Send pending Dynamics 365 for Dynamics 365 apps email every                                                        |                                         Default: 10 minutes. Sends pending [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps email on the specified interval.                                         |
|         **Set whether users can schedule synchronization in [!INCLUDE[pn_crm_for_outlook_full](../includes/pn-crm-for-outlook-full.md)]**          |                                                                                                                                                                                                                 |
|                                                         Users can schedule synchronization                                                         | Default: Yes. If Yes, users can set whether or not [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)] synchronizes with [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps. |
|                                                       Minimum Time between synchronizations                                                        |   Default: 15 minutes. Synchronizes [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)] and [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps on the specified interval.    |
| **Set whether users can update their local data in the background in [!INCLUDE[pn_crm_for_outlook_full](../includes/pn-crm-for-outlook-full.md)]** |                                                                                                                                                                                                                 |
|                                              Users can schedule background local data synchronization                                              |                                                        Default: Yes. If Yes, users can update the data that is stored on their computer to use offline.                                                         |
|                                            Minimum time between background local data synchronizations                                             |                                   Default: 15 minutes. Local data is synchronized with [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps on the specified interval.                                   |
|                                   **Set schedule for address book synchronization in Dynamics 365 for Outlook**                                    |                                                                                                                                                                                                                 |
|                                             Users can schedule background address book synchronization                                             |                                                    Default: Yes. If Yes, users can update the address book that is stored on their computer to use offline.                                                     |
|                                                 Minimum time between address book synchronizations                                                 |                               Default: 1 hour. The local address book is synchronized with [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps on the specified interval.                               |
|                                              **Set whether users see Microsoft Dynamics 365 for Dynamics 365 apps message**                                              |                                                                                                                                                                                                                 |
|         Users see “Get [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)]” option displayed in the message bar          |                                 Default: Yes. If Yes, the **Get Dynamics 365 for Outlook** button is displayed in [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps.                                  |

