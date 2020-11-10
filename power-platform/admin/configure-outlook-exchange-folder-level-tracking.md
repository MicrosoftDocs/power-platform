---
title: "Configure Outlook or Exchange folder-level tracking  | MicrosoftDocs"
description: Configure Outlook or Exchange folder-level tracking 
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/04/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Configure Outlook or Exchange folder-level tracking 

<!-- legacy procedure -->

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

You can enable folder-level tracking for [!INCLUDE[pn_Microsoft_Exchange](../includes/pn-microsoft-exchange.md)] folders to map an [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] inbox folder to a customer engagement apps record so that all the emails in the [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] folder get automatically tracked against the mapped record in customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation). Consider an example where you have an account called Adventure Works. You can create a folder in your [!INCLUDE[pn_MS_Outlook_Short](../includes/pn-ms-outlook-short.md)] called Adventure Works under your Inbox folder, and create some [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] rules to automatically route the emails to the Adventure Works folder based on the subject or the body of an email. Next, you can map your [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] folder (Adventure Works) with the account record (Adventure Works) to automatically track all the emails that land in the Adventure Works [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] folder, and set the regarding object as the Adventure Works account record.  
  
> [!TIP]
> ![Video symbol](../admin/media/video-thumbnail-4.png "Video symbol") Check out the following video: [Folder Level Tracking in CRM Online 2015 Update 1](https://youtu.be/HiNpINvFKq8)  
  
## Enable folder-level tracking  
  
1. Click **Settings** > **Email Configuration**.  
  
2. Click **Email Configuration Settings**.  
  
3. Confirm that **Process Email Using** is set to **Server-Side Synchronization**.  
  
4. Enable **Use folder-level tracking from Exchange folders (server-side synchronization must be enabled)**.  
  
5. Configure other tracking options on this page, and then click **OK**.  
  
Once you've enabled folder-level tracking, users will need to configure folder-tracking rules with Settings (![Gear button](../admin/media/selection-rule-gear.png "Gear button")) > **Options** > **Email** > **Configure Folder Tracking Rules**.  
  
## Some important points about folder-level tracking  
  
- Folder-level tracking of emails will work only if your organization is configured to use server-side synchronization for emails. Server-side synchronization must be configured for [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] (and not POP3) mailboxes. For more information, see [Set up server-side synchronization of email, appointments, contacts, and tasks](../admin/set-up-server-side-synchronization-of-email-appointments-contacts-and-tasks.md).  
  
- You can track emails only in folders under your Inbox folder in [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)]. Other folder emails cannot be tracked.  
  
- You can track up to a maximum of 25 folders per user account.  
  
- Any manual changes done to the regarding object in the tracked activity records will be overridden the next time server-side synchronization kicks in. For example, if you have set up a mapping between the Adventure Works folder and the Adventure Works account, all the emails in the Adventure Works [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] folder will be tracked as activities with the regarding set to the Adventure Works account record. If you change the regarding to some other record, it will automatically be overridden the next time server-side synchronization occurs. To change the regarding for any email, move the email to a different folder such as the Inbox.  

- Folder-level tracking for queue mailboxes is not supported.  
  
### See also  
 [System Settings dialog box - Email tab](system-settings-dialog-box-email-tab.md)   
