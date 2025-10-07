---
title: Use /mention to link to records in Outlook web client
description: Records are now available in the Outlook web client using a simple /mention gesture. 
author: sericks007
ms.component: pa-admin
ms.topic: how-to
ms.date: 04/24/2025
ms.subservice: admin
ms.author: sericks
ms.reviewer: sericks
contributors:
    - jasongre
search.audienceType: 
  - admin
ms.contributors:
  - mspilde
ms.custom:
  - NewPPAC
  - sfi-image-nochange
---

# Use /mention to link to records in Outlook web client

One of the most time-consuming tasks when using email is sharing information in your line-of-business applications with colleagues. You have to jump out of your Outlook web experience, open your line-of-business app, navigate to a record, and then copy and paste the link of the record into your email.  

Wouldn't it be great if you could just quickly access Dynamics 365 or Dataverse data directly from Outlook?

That's now possible with a simple configuration in the Power Platform admin center. You can quickly enable your users to access the records they've used most recently in their application. The records are available in the Outlook web client using a simple /mention gesture.

Security is top of mind, so only records that a user has access to and has most recently used are available in the Outlook web client.

## Geo, service, and compliance boundaries

A small set of data from Dataverse will be synced with Microsoft 365 data.  This may cross geo boundaries for multi-geo organizations where the Dataverse data may be in a different geographic region than the data stored for a user in Microsoft 365. Be aware that this also crosses service and compliance boundaries between the two platforms. Synced data includes the table name, primary name of the column for the table, and a link  to the most recently used record.

If there are any changes to the synced data including updates or deletions, the record will be updated or deleted in Microsoft 365.

## Turn on the /mention feature

## [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.
1. Expand **Product**, and then select **Features**.
1. Under the **Search** section, turn on **Search for records in Microsoft 365 apps**.
1. Select **Save** to apply the changes.

## [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings** .
1. Expand **Product**, then select **Features**.
1. Under the **Search** section, turn on **Search for records in Microsoft 365 apps**.
1. Select **Save** to apply the changes.

---

## Link to business records in email messages in your Outlook web client

After turning on the **Search for records in Microsoft 365 apps** setting, your users can open their Outlook web clients and quickly add links to their most recently used records to be shared with colleagues.

> [!Important]
> - It may take an hour or more for records to be available in your Outlook web client.
> - The recipient of the email must be able to access the environment with security roles that allow the user to have access to the data and must be able to access the shared record.

1. Open your Outlook web client.
1. Create a new message.
1. In the body of the email, type **/** and select the record you want to share with a colleague.

    In this example, you can see that the **/** mention is followed by the account "Adventure Works". When you select a record, a link to the record is inserted into the body of the email.

    :::image type="content" source="media/adventure-works-link.png" alt-text="Insert a link into an Outlook web message.":::

    After selecting a record in the /mention form, a link to the record is added to the email in the Outlook web client. The recipient of the email can select the link and open the record, assuming the recipient has access to the environment, the app, and the record.

     :::image type="content" source="media/final-email.png" alt-text="The email message the recipient receives.":::
