---
title: "System Settings Marketing tab  | MicrosoftDocs"
description: System Settings Marketing tab 
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/17/2021
ms.subservice: admin
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# System Settings Marketing tab

Use the settings on this page to configure marketing settings for customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation).  

<!-- legacy procedure -->

## Open the Marketing System Settings dialog box 

1. [!INCLUDE[proc_permissions_system_admin_and_customizer](../includes/proc-permissions-system-admin-and-customizer.md)]  

    Check your security role  

   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  

   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  

2. In the web app, go to **Settings** (![Settings.](media/settings-gear-icon.png "Settings")) > **Advanced Settings**.

3. Select **Settings** > **Administration**.

4. Select **System Settings** > **Marketing** tab.  

|                                                             Settings                                                              |                                                                                                                       Description                                                                                                                        |
|-----------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|                              **Set whether direct email through mail merge is enabled in campaigns**                              |                                                                                                                                                                                                                                                          |
|                                                Enable Direct Email via Mail Merge                                                 | Default: Yes. If Yes, users can send email as a campaign activity using the mail merge feature. **Note:**  To enable this option, the security role assigned to users for whom you want to enable mail merge must also include the Mail Merge privilege. |
| **Set whether campaign responses are created for incoming campaign activity email (Available only if Email tracking is enabled)** |                                                                                                                                                                                                                                                          |
|                                           Create campaign responses for incoming email                                            |                     Default: Yes. If Yes, customer engagement apps create campaign response records automatically when email messages are received in response to a specific marketing campaign.                     |
|                        **Set the auto-unsubscribe options (Available only if Email tracking is enabled)**                         |                                                                                                                                                                                                                                                          |
|                          Set "Do Not Send Marketing Material" option when unsubscribe email is received                           |                         Default: No. If Yes, when an unsubscribe email is received, the preference setting for the account, contact, or lead from the marketing list gets updated automatically to not send marketing materials.                         |
|                                      Send acknowledgement to customers when they unsubscribe                                      |                                                 If the previous setting **Set "Do Not Send Marketing Material"** is Yes, you can use this setting to send a response to customers when they unsubscribe.                                                 |
|                                                Template for Acknowledgement Email                                                 |                                                              If the two previous settings are Yes, you must specify an email template to use to respond to customers when they unsubscribe.                                                              |



[!INCLUDE[footer-include](../includes/footer-banner.md)]