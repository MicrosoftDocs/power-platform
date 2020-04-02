---
title: "Example processes | MicrosoftDocs"
description: 
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/18/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Example processes

The components in the CoE Starter Kit are designed for multiple uses. The example processes below, which use the Starter Kit components, are meant to showcase common patterns other organizations have found useful and hopefully act as inspiration for defining your own processes.

## Power Apps app auditing process

### Process Description

**Problem statement:** There are many apps in the Contoso tenant. IT does not know what all these apps are intended for or how to support individual apps when the helpdesk is called, and it's unclear if all the apps are being maintained to any standard. They can see details like the description and number of shared users from the Power Apps for Admins connector, but they need to communicate directly
with the app owner to fully understand the situation around their apps. Especially in a large organization like Contoso, it's not feasible for the IT team to be responsible for manually reaching out to each owner individually for the apps, and those details cannot be stored in email conversations. The Contoso team would like to have a central App Catalog for high quality apps.

**Solution:** The CoE has decided there should be an auditing process on an app-level basis, using CDS as a data store for business justification details. They decide to use apps and flows to facilitate
this process.

The flow called *Admin \| Compliance detail request* is used to iterate through all the apps in the tenant and check if the apps are compliant. If the owner has not submitted a business justification and the app was  shared broadly (in this example, with more than 20 users or at least 1 group), then the flow will send the owner an email to notify them that the
specific app is not compliant with Contoso's policy. The email contains a link to the Developer Compliance Center canvas app, where they can provide the business justification details in a form submission. The app also contain details about the compliance thresholds and has links to the app settings so they can configure the description and re-publish if needed.

Once the maker has proven compliance by adding these details, the admin can review those details and the app itself. A business process flow in the Power Platform Admin View (model-driven app) helps facilitate the auditing process.

When reviewing the app compliance details, the admin can make a decision about whether the app belongs in the App Catalog.

### User View of the Process

Here is that process from the point of view of the people involved and the components they interact with.

**Maker:** The maker gets a notification that they have work to do to come into compliance for an app. The notification includes a deep link to Developer
Compliance Center for their application.

There are 3 items tracked in the system and the user may have 1 to 3 things to do:

1. Make a fresh publish to show it's an active app

1. Add a description of the application to indicate its purpose

1. Add supporting details such as business justification

![User PoV of sample audit process](media/coe55.png)

**Admin:** Once applications have hit all three of these markers, they show up in the Admin Review filter view on the Model Driven Apps – Audit and Report
Components.

![Admin PoV of sample audit process](media/coe71.png)

An admin opens the Power Platform Admin View > Admin Review view and assesses all the apps due for review by looking at the Audit tab within the app and investigating the work by the Maker, then mark their assessment in the Admin Review section.

The Admin can decide to put an app in the app catalog, as featured or not, to highlight the app to users.

![Validate maker requirements](media/coe54.png)

**End users:** The maker and end users can now see the app in the App Catalog.

![App catalog](media/coe67.png)
