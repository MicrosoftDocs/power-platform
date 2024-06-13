---
title: "Example App Review Process | MicrosoftDocs"
description: "The app review ample process showcases how to streamline the app review and auditing process to gather compliance information about apps before promoting widespread use."
author: manuelap-msft

ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/06/2023
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: sericks
search.audienceType: 
  - admin
---
# App Compliance Review Process

This sample process showcases how your CoE department or IT administrators can automate an app-level process to gather, review, and audit compliance information from makers about apps, such as business justification and the impact of an outage, before adding the app to the app catalog for widespread use. It is meant to demonstrate a pattern other organizations have found useful and act as an example for defining your own process.

> [!NOTE]
> Follow the [setup compliance components](setup-governance-components.md) steps to configure this process. More information: [Compliance process](governance-components.md#compliance-processes)

## Process Description

**Problem statement:** There are many apps in the Contoso tenant. IT doesn't know what all these apps are intended for or how to support individual apps when the helpdesk is called, and it's unclear whether all the apps are being maintained to any standard. They can see details like the description and number of shared users from the Power Apps for Admins connector, but they need to communicate directly with the app owner to fully understand the situation around the apps. Especially in a large organization like Contoso, it's not feasible for the IT team to be responsible for manually reaching out to each app owner individually, and those details can't be stored in email conversations. The Contoso team would like to have a central app catalog for high-quality apps.

**Solution:** The CoE has decided there should be a review and auditing process on an app-level basis, using Microsoft Dataverse as a data store for the business justifications. They decide to use apps and flows to facilitate this process.

The flow named Admin \| Compliance Detail Request is used to iterate through all the apps in the tenant and check whether the apps are compliant. If the owner hasn't submitted a business justification and the app was shared broadly (in this example, with more than 20 users or at least one group), the flow sends the owner an email to notify them that their specific app isn't compliant with Contoso's policy. The email contains a link to the Developer Compliance Center canvas app, where the owner can provide the business justification details in a form submission. The Developer Compliance Center app also contain details about the compliance thresholds and has links to the app settings, so the owner can configure the description and republish if needed.

After the maker has proven compliance by adding these details, the admin can review those details and the app itself. A business process flow in the Power Platform Admin View (model-driven app) helps facilitate the process.

When reviewing the app compliance details, the admin can make a decision about whether the app belongs in the app catalog.

## The User's View of the Process

Here is that process from the point of view of the people involved and the components they interact with.

**Maker:** The maker gets a notification that they have work to do to bring their app into compliance. The notification includes a deep link to Developer Compliance Center for their app.

Three items are tracked in the system, and the user might have to do all three:

- Make a fresh publish, to show it's an active app.

- Add a description of the app, to indicate its purpose.

- Add supporting details, such as the business justification.

![Maker point of view in the App Review process.](media/coe55.png "Maker point of view in the App Review Process")

**Admin:** After an app meets all three of these requirements, it appears in the **Compliance - Submitted** filter view on the **Power Platform Admin View** model driven app.

![Admin point of view in the App Review process.](media/coe71.png "Admin point of view in the App Review Process")

An admin opens **Power Platform Admin View** > **Compliance - Submitted** and assesses all the apps due for review by looking at the **Audit** tab within the app, investigating the work done by the maker, and then marking their assessment in the **Compliance - Submitted** section.

The admin can decide to put an app in the app catalog and mark it as featured or not, depending on whether the app should be highlighted for users.

![Validate maker requirements.](media/coe54.png "Validate maker requirements")

**Users:** The maker and users can now see the app in the app catalog.

![App catalog.](media/coe67.png "App catalog")


[!INCLUDE[footer-include](../../includes/footer-banner.md)]
