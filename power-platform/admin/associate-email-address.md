---
title: Associate an email address with a row   
description: Associate an email address with a row. 
author: DerekBraunMSFT
ms.component: pa-admin
ms.topic: how-to
ms.date: 11/04/2025
ms.subservice: admin
ms.author: debrau
ms.reviewer: sericks
search.audienceType: 
  - admin
contributors:
  - foviedoITBA
---

# Associate an email address with a row

## Email sender resolution

When customer engagement apps track an email, it associates the email address to a row within customer engagement apps. The contents of the email **From** field can only be associated with one row. If there are multiple matches for an email address and there are less than 100 matching rows within customer engagement apps, the contents of the email **From** field resolve to the first active row in the following order:

1. SystemUser
2. Contact
3. Account
4. Lead
5. Equipment
6. Team
7. Business unit
8. Email-enabled tables (such as Queues, custom, etc.)

If the email address matches more than 100 rows, the **From** field isn't associated to a row and appears as unresolved. If the [UnresolveSenderInCaseOfMultipleMatch OrgDBOrgSetting](OrgDbOrgSettings.md) is turned on and the sender email address matches multiple records, the **From** field remains unresolved. Otherwise, if there is a single matching row for the sender email address, the **From** field resolves to that row regardless of it's state.

> [!NOTE]
> - The only exception is when the owner of the mailbox or the queue tracking the email is the owner of the duplicated row. A row that's owned by you takes precedence over any rows that you don't own. For example, if the email address exists in a contact and account table and the mailbox owner also owns the account but not the contact, the **From** field resolves to the account.
> - When an email is tracked immediately by an app, such as Dynamics 365 App for Outlook, the list of records that may be associated are limited to those which the user can access. However, if the email is created by server-side synchronization, the creation of the email is performed by the SYSTEM account, which has access to all records. This applies to both sender and recipient resolution.

## Email recipient resolution

In the email **To**, **Cc**, and **Bcc** fields, all of the rows of email-enabled tables with a matching email address are resolved and listed by default. The **Bcc** field appears empty for received emails. 

If **Set To,cc,bcc fields as unresolved values if multiple matches are found in Incoming Emails** is set to **Yes**, a tracked email in Dynamics 365 that contains an email address that matches multiple rows will appear as a single, unresolved email address.

   > [!div class="mx-imgBorder"] 
   > ![Set email form options.](media/email-filter-image6.png)

An unresolved email address can be manually resolved to a specified row. If **When someone manually resolves an unresolved email address, apply it to all similar unresolved addresses** is enabled, the system updates existing email rows that contain the same unresolved email address and replaces those references with the specified row. 

## Appointment attendee resolution

When appointments are manually tracked using the App for Outlook or Copilot for Sales, the system resolves each attendee email address to a single row using the same priority order as the [Email sender resolution](#email-sender-resolution) logic.

