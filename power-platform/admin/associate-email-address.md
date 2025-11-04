---
title: Associate an email address with a row   
description: Associate an email address with a row. 
author: foviedoITBA
ms.component: pa-admin
ms.topic: how-to
ms.date: 10/14/2025
ms.subservice: admin
ms.author: ahanda
ms.reviewer: sericks
search.audienceType: 
  - admin
contributors:
  - foviedoITBA
---

# Associate an email address with a row

## Email sender resolution

When customer engagement apps track an email, it associates the email address to a row within customer engagement apps. The contents of the email **From** field can only be associated with one row. If there are less than 100 duplicate rows within customer engagement apps with the same email address, the contents of the email **From** field resolve to the first active row in the following order:

1. SystemUser
2. Contact
3. Account
4. Lead
5. Equipment
6. Team
7. Business unit
8. Email-enabled tables (such as Queues, custom, etc.)

If the email address resolves to more than 100 rows, the **From** field isn't associated to a row and appears as unresolved. If the [UnresolveSenderInCaseOfMultipleMatch OrgDBOrgSetting](OrgDbOrgSettings.md) is turned on and the sender email address matches multiple records, the **From** field remains unresolved.

> [!NOTE]
> - The only exception is when the owner of the mailbox or the queue tracking the email is the owner of the duplicated row. A row that's owned by you takes precedence over any rows that you don't own. For example, if the email address exists in a contact and account table and the mailbox owner also owns the account but not the contact, the **From** field resolves to the account.
> - When an email is tracked immediately by an app, such as Dynamics 365 App for Outlook, the list of records that may be associated are limited to those which the user can access. However, if the email is created by server-side synchronization, the creation of the email is performed by the SYSTEM account, which has access to all records. This applies to both sender and recipient resolution.

## Email recipient resolution

In the email **To**, **Cc**, and **Bcc** fields, all of the rows of email-enabled tables with the email address are listed. Please note that the Bcc field appears empty for received emails. 

If **Set To,cc,bcc fields as unresolved values if multiple matches are found in Incoming Emails** is set to **No**, a tracked email in Dynamics 365 that contains an email address that resolves to multiple rows, display each resolved row in the Email.

   > [!div class="mx-imgBorder"] 
   > ![Set email form options.](media/email-filter-image6.png)

## Appointment attendee resolution

When appointments are manually tracked using the App for Outlook or Copilot for Sales, the system resolves each attendee email address to a single row using the same priority order as the [Email sender resolution](#email-sender-resolution) logic.

