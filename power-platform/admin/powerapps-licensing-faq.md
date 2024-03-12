---
title: Power Apps Licensing FAQ
description: Learn FAQs for licensing Power Apps.
author: amchern
ms.date: 03/07/2024
ms.reviewer: 
ms.topic: conceptual
ms.subservice: 
ms.author: amchern
ms.custom: 
---

# Power Apps Licensing FAQs

This article lists common questions and answers for licensing and plan options.

For more details about Microsoft Power Apps licensing, download the [Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

### I have a Power Apps per user license. Can I use it to run Power Automate Flows?

Yes, but it is only valid for a Flow that is executed via a Power Apps trigger action.

### Why can a user still access an app after their trial license is expired? 

After a trial license expires, users may continue to be able to access an app for up to 2 hours after the trial expires. Additionally, due to caching, an extra refresh may be needed for access to be revoked. 

### Why can I access my app that uses a premium connector, such as SQL, with my Office seeded license?
In 2019, there was a change to Power Apps use rights for Microsoft 365 applications. During this transition period, we granted customers an extension from October 1, 2019 until October 1, 2024, where apps using connectors, such as SQL, would be exempt from Premium connector licensing requirements for reclassified connectors. These apps are considered "grandfathered." [Learn more](powerapps-flow-licensing-faq.md#how-does-the-change-to-power-apps-and-power-automate-use-rights-for-microsoft-365-applications-affect-me-if-i-purchased-the-subscriptions-prior-to-oct-1-2019-will-my-existing-apps-and-power-automate-workflows-continue-to-work). 

### Why does my app still show a premium designation after all premium connectors have been removed and the app has been saved?
After removing premium connectors from the app, you must publish the app for the designation to update. 

### Why does my app that is part of the 2019 grandfathering still show as premium designation?
It is expected that the app continues to show as premium designation. End-users can still play the apps with an Office seeded license. 

### Why are my users who have a Dynamics license getting prompted to sign up for a trial license when they open the app in the web browser?
Different Dynamics licenses have different use rights in Power Apps, so we recommend that you review the Microsoft Power Platform licensing guide to find your Dynamics license first. All Dynamics licenses with Power Apps usage rights allows users to play apps that do not use premium capabilities in both embedded and standalone mode. However, if your Dynamics license is listed as having "limited use rights" for Power Apps, you can only play canvas apps with premium capabilities when embedded inside model-driven apps. This means that you cannot play these canvas apps in standalone mode in the web browser or the mobile player.

### If my app requires premium licensing, what are my licensing options for end-users? 
End-users need an entitlement to access a premium app. [Learn more](powerapps-flow-licensing-faq.md#how-is-microsoft-power-apps-licensed) for different entitlement options.

### What capabilities make my app require a premium license? / We built an app using a trial license, what do we need so our users can run it? 
Some examples of features that require premium entitlements include: [premium connectors](https://go.microsoft.com/fwlink/?linkid=2263132), [Dataverse entities](https://go.microsoft.com/fwlink/?linkid=2262772), [on-premise data gateways](https://go.microsoft.com/fwlink/?linkid=2263042), [custom APIs](https://go.microsoft.com/fwlink/?linkid=2263205), etc. To determine if your app is premium, makers can also go to the App Details page in Maker Portal to view their app license designation. [Learn more](https://go.microsoft.com/fwlink/?linkid=2262773). 

### Do I need a license to build Power Apps?
You do not need a license to build canvas apps. You need a license to build model-driven apps.

### Do we need a Power Automate standalone license on top of PowerApps premium?
- If the flow is in context of Power Apps or Dynamics 365 apps, and is an automated flow, the flow must be associated to the app created using Power Apps or a Dynamics 365 app and the owner needs Power Apps Premium license, or a Dynamics 365 license.
- If the flow is in context of a Power Apps or Dynamics 365 app, and is an instant flow, every user running the flow needs a Power Apps Premium license, or a Dynamics 365 license.
- If a parent flow calls a child flow, the child flow leverages the context from the parent flow. For example, if the following criteria are met, it uses the parent flow owner's license: 
  - If the parent flow is an automated flow, and
  - The child flow uses premium connectors, and
  - The child flow doesn't have a Process license. If the child flow has a Process license, it uses the Process license and not the parent flow's license. 

### How can I purchase licenses? 
Take a look at the [Power Apps pricing guide](https://go.microsoft.com/fwlink/?linkid=2263206) for details.

### I am working on a proof of concept Power Apps solution, how do I extend my trial? 
We recommend creating your proof of concept in a developer environment, which has no expiration. [Learn more](https://go.microsoft.com/fwlink/?linkid=2262774).  

### I have a dev trial license but I am being told that my trial is expired.
Trial licenses have an expiration period and can only be renewed up to three times. We recommend using a developer environment with a developer trial license for any proof of concepts.

### I bought per app plan capacity but my users are being asked to start a trial.
The passes must be allocated to the environment for them to take effect. [Learn more](about-powerapps-perapp.md#step-2-allocate-per-app-plans). 

### How long can I use a trial license? 
Trial licenses have an expiration period and can only be renewed up to three times. We recommend using a developer environment with a developer trial license for any proof of concepts.

### My users don’t have a license, but they can still access the environment.
Creating and managing Power Apps do not require a license, so users are able to access the environment with no licenses assigned. However, users without a license cannot play apps.

### I can play an app that uses Dataverse inside Teams in a Dataverse for Teams environment, but when trying to play the same app standalone I get a prompt message.
If the user only has an Office seeded license, and the app uses Dataverse for Teams, it can only be used when embedded within Teams.

[!INCLUDE[footer-include](../includes/footer-banner.md)]