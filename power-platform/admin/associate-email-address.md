---
title: Associate an email address with a row   
description: Associate an email address with a row. 
author: DerekBraunMSFT
ms.component: pa-admin
ms.topic: how-to
ms.date: 11/05/2025
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

When customer engagement apps track an email, they associate the email address with a row within customer engagement apps. The contents of the email **From** field can only be associated with one row. If there are multiple matches for an email address and there are fewer than 100 matching rows within customer engagement apps, the contents of the email **From** field resolve to the first active row in the following order:

1. SystemUser
1. Contact
1. Account
1. Lead
1. Equipment
1. Team
1. Business unit
1. Email-enabled tables (such as Queues, custom, etc.)

If the email address matches more than 100 rows, the **From** field isn't associated with a row and appears as unresolved. If the [UnresolveSenderInCaseOfMultipleMatch OrgDBOrgSetting](OrgDbOrgSettings.md) is turned on and the sender email address matches multiple records, the **From** field remains unresolved. Otherwise, if there's a single matching row for the sender email address, the **From** field resolves to that row regardless of its state.

> [!NOTE]
> - The only exception is when the owner of the mailbox or the queue tracking the email is the owner of the duplicated row. A row that you own takes precedence over any rows that you don't own. For example, if the email address exists in a contact and account table and the mailbox owner also owns the account but not the contact, the **From** field resolves to the account.
> - When an app immediately tracks an email, such as Dynamics 365 App for Outlook, the list of records that you can associate is limited to those you can access. However, if server-side synchronization creates the email, the SYSTEM account creates the email and has access to all records. This access applies to both sender and recipient resolution.

## Email recipient resolution

In the email **To**, **Cc**, and **Bcc** fields, the system resolves and lists all of the rows of email-enabled tables with a matching email address by default. The **Bcc** field appears empty for received emails. 

If you set **Set To,cc,bcc fields as unresolved values if multiple matches are found in Incoming Emails** to **Yes**, a tracked email in Dynamics 365 that contains an email address that matches multiple rows appears as a single, unresolved email address.

:::image type="content" source="media/email-filter-image6.png" alt-text="Screenshot of set email form options.":::

You can manually resolve an unresolved email address to a specified row. If you turn on **When someone manually resolves an unresolved email address, apply it to all similar unresolved addresses**, the system updates existing email rows that contain the same unresolved email address and replaces those references with the specified row. 

## Appointment attendee resolution

When appointments are manually tracked using the App for Outlook or Copilot for Sales, the system resolves each attendee email address to a single row using the same priority order as the [Email sender resolution](#email-sender-resolution) logic.

