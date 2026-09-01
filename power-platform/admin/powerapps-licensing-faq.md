---
title: Power Apps licensing FAQs
description: Learn about common questions and answers for licensing and plan options.
author: amchern
ms.date: 08/31/2026
ms.reviewer: ellenwehrle
ms.topic: faq
ms.subservice:
ms.author: amchern
contributors:
  - sandhangitms
---

# Power Apps licensing FAQs

This article lists common questions and answers to help you determine which Power Apps licenses your makers and users need, resolve trial and access issues, and prepare for licensing enforcement beginning February 2027. For more details about Microsoft Power Apps licensing, download the [Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

## General

### I have a Power Apps per user license. Can I use it to run Power Automate flows?

Yes, but it is only valid for a flow that is executed through a Power Apps trigger action.

### Why can a user still access an app after their trial license has expired? 

After a trial license expires, users may continue to access an app for up to two hours after the trial expires. Additionally, due to caching, an extra refresh may be needed for access to be revoked. 

### Why can I access my app that uses a premium connector, such as SQL Server, with my Office-seeded license?

In 2019, there was a change to Power Apps use rights for Microsoft 365 applications. During this transition period, we granted customers an extension from October 1, 2019 until October 1, 2024, where apps using connectors, such as SQL Server, would be exempt from premium connector licensing requirements for reclassified connectors. These apps are considered _grandfathered_. [Learn more](powerapps-flow-licensing-faq.md#how-does-the-change-to-power-apps-and-power-automate-use-rights-for-microsoft-365-applications-affect-me-if-i-purchased-the-subscriptions-prior-to-oct-1-2019-will-my-existing-apps-and-power-automate-workflows-continue-to-work). 

### Why does my app still show a premium designation after all premium connectors have been removed and the app has been saved?

After removing premium connectors from the app, you must publish the app for the designation to update. 

### Why does my app that is part of the 2019 grandfathering still show as premium designation?

It is expected that the app continues to show as premium designation. End-users can still play the apps with an Office-seeded license. 

### Why are my users, who have a Dynamics license, getting prompted to sign up for a trial license when they open the app in a web browser?

Different Dynamics licenses have different use rights in Power Apps, so we recommend that you review the Power Platform licensing guide to find your Dynamics license first. All Dynamics licenses with Power Apps usage rights allow users to play apps that don't use premium capabilities in both embedded and standalone mode. However, if your Dynamics license is listed as having _limited use rights_ for Power Apps, you can only play canvas apps with premium capabilities when embedded inside model-driven apps using the supported method which is documented in [Add a custom page to your model-driven app](https://go.microsoft.com/fwlink/?linkid=2301259). This means that you can't play these canvas apps in standalone mode in a web browser or the mobile player. If the embedding is done using other methods, such as using an iframe, the limited use rights doesn't apply.

### If my app requires premium licensing, what are my licensing options for end-users?

End users need an entitlement to access a premium app. [Learn more](powerapps-flow-licensing-faq.md#how-is-microsoft-power-apps-licensed) about different entitlement options. To check which of your users need a license, see [Licensing compliance for Power Apps](#licensing-compliance-for-power-apps).

### What capabilities make my app require a premium license? / We built an app by using a trial license, what do we need so our users can run it?

Some examples of features that require premium entitlements include: [premium connectors](https://go.microsoft.com/fwlink/?linkid=2263132), [Dataverse entities](https://go.microsoft.com/fwlink/?linkid=2262772), [on-premises data gateways](https://go.microsoft.com/fwlink/?linkid=2263042), [custom APIs](https://go.microsoft.com/fwlink/?linkid=2263205), etc. To determine if your app is premium, makers can go to the **App Details** page in the maker portal to view their app license designation. [Learn more](https://go.microsoft.com/fwlink/?linkid=2262773). 

### Do I need a license to build apps in Power Apps?

You don't need a license to build canvas apps. You need a license to build model-driven apps.

### Do we need a Power Automate standalone license on top of Power Apps premium?

- If the flow is in context of Power Apps or Dynamics 365 apps, and is an automated flow, the flow must be associated to the app created using Power Apps or a Dynamics 365 app. The owner also needs a Power Apps Premium license or a Dynamics 365 license.
- If the flow is in context of Power Apps or a Dynamics 365 app, and is an instant flow, every user running the flow needs a Power Apps Premium license or a Dynamics 365 license.
- If a parent flow calls a child flow, the child flow uses the context from the parent flow. For example, if the following criteria are met, it uses the parent flow owner's license: 
  - If the parent flow is an automated flow, and
  - The child flow uses premium connectors, and
  - The child flow doesn't have a Process license.

If the child flow has a Process license, it uses the Process license instead of the parent flow's license.

### How can I purchase licenses?

Take a look at the [Power Apps pricing guide](https://go.microsoft.com/fwlink/?linkid=2263206) for details.

### I'm working on a proof of concept Power Apps solution. How do I extend my trial?

Create your proof of concept in a developer environment, which doesn't expire. [Learn more](https://go.microsoft.com/fwlink/?linkid=2262774).

### I have a dev trial license, but I'm being told that my trial is expired. What do I do?

Trial licenses have an expiration period and can only be renewed three times. We recommend using a developer environment with a developer trial license for any proof of concepts.

### I bought per app plan capacity, but my users are being asked to start a trial. What do I do?

You must allocate the passes to the environment for them to take effect. [Learn more](about-powerapps-perapp.md#step-2-allocate-per-app-plans).

### How long can I use a trial license?

Trial licenses have an expiration period and can only be renewed three times. We recommend using a developer environment with a developer trial license for any proof of concepts.

### My users don't have a license, but they can still access the environment. Why?

Creating and managing Power Apps doesn't require a license, so users can access the environment without assigned licenses. However, users without a license can't play apps. For the licensing requirements that apply when a user opens an app, see [Licensing compliance for Power Apps](#licensing-compliance-for-power-apps).

### I can play an app that uses Dataverse inside Teams in a Dataverse for Teams environment. But when I try to play the same app standalone, I get a prompt message. Why?

If you only have an Office-seeded license, and the app uses Dataverse for Teams, it can only be used when embedded within Teams.

## Licensing compliance for Power Apps

Power Apps requires users to have an appropriate license to run apps, in alignment with the premium licensing requirements described in the [Microsoft Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130). Starting February 2027, areas where the licensing requirement was applied leniently, including but not limited to scenarios such as apps used in managed environments, use of model-driven apps, and use of custom apps used outside a Dynamics 365 environment context, require users to have an appropriate premium license. Users who don't have one can't open and use the app until an appropriate license is assigned.

> [!IMPORTANT]
> Review your license assignment before February 2027 so that your users don't lose access to their apps.

### Why is Power Apps applying these stricter licensing requirements?

This requirement isn't new. Users running premium apps or apps in managed environments need at least one premium license per user or capacity add-ons to access respective resources. This change helps organizations achieve and maintain compliance with existing licensing terms described in the [Microsoft Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130)

### Where can users expect a difference once the stricter licensing checks are enforced?

Users will see a difference in the following areas, and starting February 2027, these areas require an appropriate license assignment:

- Apps in managed environments
- Model-driven apps
- Apps used outside a Dynamics 365 environment context

Each area is further described later in this section.

### What licenses satisfy the requirement?

While Power Apps Premium, Power Apps per app plans, and the Power Apps per app pay-as-you-go meter that give premium Power Apps usage rights satisfy the requirement generally, use rights differ by license and by the context the app runs in. For the complete and current list of qualifying licenses that provide premium Power Apps use rights, refer to the [Microsoft Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

### Administrator experience

#### How can I check which users need a license?

As an administrator, you can identify users who require a license by downloading the Power Apps licensing reports in the Power Platform admin center. For the steps to download a report and analyze usage for each scenario, see [additional admin options](view-license-consumption-issues.md#additional-admin-options) section of Power Apps license consumption article.

### Apps in managed environments

#### Do users need a license to run an app in a managed environment?

Yes. When you activate managed environments in an environment, all active usage requires a qualifying license as detailed in [managed environments licensing](managed-environment-licensing.md). This requirement includes users who run standard apps, because the requirement applies to active usage in the environment rather than to the type of app.

#### Where can I find more information about this scenario?

For managed environment licensing requirements, the end-user and administrator experience, and the steps to identify users who require a license, see [Licensing for managed environments](managed-environment-licensing.md).

### Model-driven apps

#### Do users need a premium license to run a model-driven app?

Yes. Model-driven apps use Dataverse and are [premium apps](#what-capabilities-make-my-app-require-a-premium-license--we-built-an-app-by-using-a-trial-license-what-do-we-need-so-our-users-can-run-it) by default. Every user who runs a model-driven app needs a license that provides Power Apps premium use rights. For the complete and current list of qualifying licenses that provide premium Power Apps use rights, refer to the [Microsoft Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

### Apps used outside a licensed Dynamics 365 application

#### What does using an app outside the licensed Dynamics 365 environment mean?

Dynamics 365 licenses include Power Apps use rights within the context of and in the same environment as the licensed Dynamics 365 application. Using an app in an environment that isn't enabled for Dynamics 365 falls outside those use rights and requires separate Power Apps licensing. See the section Power Apps use rights included with Dynamics 365 licenses in the [licensing guide](https://go.microsoft.com/fwlink/?linkid=2085130) for more details.
