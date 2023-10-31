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

# Use /mention to link to records in Outlook Web 

One of the most time consuming tasks for any person that uses emails is easily sharing information in your line of business applications with colleagues. You have to jump out of your Outlook Web experience, open your line of business app, navigate to a record and then copy and paste the link of the record into your email. This is an incredibly time consuming set of steps and actions and wouldn't it be great if you could just quickly access Dynamics 365 or Dataverse data directly from Outlook.

That is now possible with a simple configuration in the Power Platform Admin center. You can quickly enable your users to access the records they have most recently used in their application. The records will now be available in the Outlook Web client using a simple /mention gesture.

Security is top of mind and only records that a user has access to and have most recently used will show up in the outlook web client.

To enable this great feature, you must be a system administrator for the environment.

Open <https://admin.powerplatform.microsoft.com/> in a web browser and login

Select the environment that you want to enable Dynamics and Dataverse data to be used with /mention in Outlook Web client

-   Select Settings

-   Select Product

-   Select Features

Under the Search section on the features page you will see an option to search for records in M365 apps.

Click on the toggle to on and save.

![](media/image1.png)

After saving your user will be able to open outlook web client and be able to quickly add a link to their most recently used records to be shared with colleagues.

**NOTE**: It may take some time for records to be available in your outlook client.

**NOTE**: This feature may not yet be available in your region, come back soon if you do not see the option to enable sharing records in M365 Apps.

**IMPORTANT:**

The recipient of the email must be able to access the environment with security roles that allow the user to have access to the data and must be able to access the shared record.

To use /mention, users can open outlook web client. In the body of the email just type / then the record you want to share with a colleague.

In this example you can see the mention is followed by the account "Alpine Ski House". When the user hits enter a link to the record is inserted into the body of the email.

That's how easy it is for your user to quickly add records they want to collaborate and share with someone in their organization that also has access to the record.

When using the / mention the record name and the environment will be displayed.

![A screenshot of a computer Description automatically generated](media/image2.png)

After selecting the record in the /mention dialog a link to the record(s) will be added to the email in Outlook Web Client.

![A screenshot of a computer Description automatically generated](media/image3.png)

The recipient will be able to click on the link and open the record, however, they must have access to the environment, the app and the record.

![A screenshot of a computer Description automatically generated](media/image4.png)
