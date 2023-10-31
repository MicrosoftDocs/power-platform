---
title: Use /mention to link to records in Outlook Web 
description: The records will now be available in the Outlook Web client using a simple /mention gesture. 
author: sericks007
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/30/2023
ms.subservice: admin
ms.author: sericks
ms.reviewer: sericks
contributors:
    - ProfessorKendrick
    - jasongre
search.audienceType: 
  - admin
ms.contributors:
- mspilde
---

# Use /mention to link to records in Outlook web 

One of the most time-consuming tasks for any person that uses email is easily sharing information in your line of business applications with colleagues. You have to jump out of your Outlook web experience, open your line of business app, navigate to a record, and then copy and paste the link of the record into your email. This is an incredibly time consuming set of steps and actions. 

Wouldn't it be great if you could just quickly access Dynamics 365 or Dataverse data directly from Outlook?

That is now possible with a simple configuration in the Power Platform admin center. You can quickly enable your users to access the records they have most recently used in their application. The records are available in the Outlook web client using a simple /mention gesture.

Security is top of mind, and only records that a user has access to and has most recently used will show up in the Outlook web client.

## Turn on the feature

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select an environment.
2. Select **Settings** > **Product** > **Features**.
3. Under the **Search** section, turn on the **Search for records in Microsoft 365 apps** setting.

## Link to business records in Outlook web

After turning on the **Search for records in Microsoft 365 apps** setting, your users can open their Outlook web clients and quickly add a link to their most recently used records to be shared with colleagues.

> [!Note]
> It may take some time for records to be available in your outlook client.

> [!Note]
> This feature may not yet be available in your region. Come back soon if you do not see the option to enable sharing records in Microsoft365 apps.

> [!Important]
> The recipient of the email must be able to access the environment with security roles that allow the user to have access to the data and must be able to access the shared record.

1. Open your Outlook web client.
1. Create a new message.
1. In the body of the email, type **/** and select the record you want to share with a colleague.

    In this example, you can see that the **/** mention is followed by the account "Adventure Works". When the user presses **Enter**, a link to the record is inserted into the body of the email.

    That's how easy it is for users to quickly add records they want to collaborate on and share with others in their organization who also has access to the record.

    When using the **/** reference, the record name and the environment are displayed.

    :::image type="content" source="media/adventure-works-link.png" alt-text="Insert a link into an Outlook web message.":::

After selecting the record in the /mention dialog a link to the record(s) will be added to the email in Outlook Web Client.

![A screenshot of a computer Description automatically generated](media/image3.png)

The recipient will be able to click on the link and open the record, however, they must have access to the environment, the app and the record.

![A screenshot of a computer Description automatically generated](media/image4.png)
