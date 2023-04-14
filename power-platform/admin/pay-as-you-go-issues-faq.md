---
title: "Issues and FAQs about pay-as-you-go plans | MicrosoftDocs"
description: This article addresses known issues about pay-as-you-go plans and provides answers to frequently asked questions.
author: Kavishi
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/12/2022
ms.subservice: admin
ms.author: kaagar 
ms.reviewer: jimholtz
contributors:
  - ShawnNandiMSFT
search.audienceType: 
  - admin
---

# Known issues and frequently asked questions 

## Known issues 
- Pay-as-you-go billing and reporting aren't available in Norway and Korea (South).
- Deleting a billing policy in the Power Platform admin center won't automatically delete corresponding Power Platform account resource in the Azure portal. This resource can be deleted manually in the Azure portal, if needed.
- The Power Platform requests meter is planned to be in preview by the end of March 2022. During this preview we'll report on usage of Power Platform requests, however, we won't bill for this usage until we reach general availability (GA) for this meter. If you link an environment to an Azure subscription, users and flows in the environment can consume more than their entitled usage without being throttled or paying for overages.
- The report for the Power Platform request meter doesn't currently show correct entitlements for users licensed via the Power Apps Per App license or Power Apps Per App pay-as-you-go meter. Entitlements for such users will show as 0 when in fact they should be shown as 6000 (requests per 24 hour period) as outlined in https://aka.ms/platformlimits.
- Multi-factor authentication: if you have multi-factor authentication enabled for the Azure portal, you may see an error when you try to link an Azure subscription from the Power Platform admin center. This issue is planned for resolution by the end for March 2022. 

## Frequently asked questions 

### When should I consider pay-as-you-go billing over existing Power Apps subscription plans?
The addition of pay-as-you-go provides the flexibility to pay based on the number of unique apps a user runs each month. Some common scenarios where it might be useful:

- When you have a team of professional developers who already have access to an Azure subscription. Using their existing subscription to use Power Apps may help reduce procurement processes while maintaining consistency with other services the team is consuming from Microsoft.
- When you're exploring premium capabilities but you're unsure how many licenses to procure in advance. Enabling pay-as-you-go delivers the flexibility to establish usage patterns, which could then be transitioned into subscription licenses, if needed.
- When an app needs to be shared with a large user base, though usage and frequency may significantly fluctuate. In this case, pay-as-you-go would enable you to pay only for users who ran an app during the monthly billing period.

### Is pay-as-you-go available for both canvas apps and model-driven apps?
Yes.

### How is the Power Apps per-app meter unit counted?
The count is the number of unique users who opened an app or a portal in the course of a month. Repeat access to the same app or portal is counted only once. Read [Power Apps per-app meter](pay-as-you-go-meters.md#power-apps-per-app-meter) for more details.

### Can I set up pay-as-you-go for my environment without an Azure subscription?
No. You need an Azure subscription to set up pay-as-you-go.

### Which environments are available for pay-as-you-go?
Currently, production and sandbox environments are available.

### Can pay-as-you-go be set up for individual apps?
No. Pay-as-you-go is set up for an environment and all apps within that environment are billed against the associated Azure subscription. However, you can exclude an app from using the Azure subscription, in which case a user will need a per-user license to use the app. Per-app licenses can't be used in a pay-as-you-go environment.

### What if I already have a user license and I use an app in a pay-as-you-go-enabled environment? Will I be billed against the Azure subscription?
Users with per-user licenses aren't counted towards the Power Apps per-app meter, and therefore won't incur charges. However, note that when an environment is linked to an Azure subscription, Dataverse capacity overages will be billed to the Azure subscription. Any Dataverse capacity granted for the per-user license will still be pooled at a tenant level but won't apply to a pay-as-you-go-enabled environment. Pay-as-you-go environments grant 1 GB of Dataverse database storage and 1-GB file capacity.

### What happens if I have an Office license and use an app with standard connectors in a pay-as-you-go-enabled environment?
Those who are using an app with standard connectors and have Office licenses aren't counted towards the Power Apps per-app meter, and therefore won't incur charges.

### Can guest users use apps in a pay-as-you-go environment without licenses?
Yes.

### What if a user runs the same app multiple times in a month? How will that user be charged?
Pay-as-you-go billing only counts unique monthly active users of an app. Repeat access of the same app by a user in a single month results in only one charge for that user that month.

### If a user runs multiple apps in a single environment, how will that user be charged?
You'll be charged for the number of apps that a unique user accesses in a month. If a user runs three different apps in a month, you'll be charged for three active users.

### What if my app is already using app passes that are available in the environment? Can I still use pay-as-you-go billing for my app?
Yes, you can set up pay-as-you-go for your app's environment. Doing so will disregard the app passes and you can pay for your app via Azure subscription.

### Can I use pay-as-you-go billing for some apps and use per-app passes for the others in the same environment?
No. As soon as you enable pay-as-you-go for your environment, all apps will be billed against it.

### I don't have admin permissions for the environment I'm working with. Can I set up pay-as-you-go for the environment?
No. You need admin permissions for the environment to be able to link the environment to a billing policy. Check out [Who can set it up](pay-as-you-go-set-up.md#who-can-set-it-up) for details on permissions.

### Can I enable/disable specific meters?
No. Once you enable pay-as-you-go, both the Power Apps per app-meter and Dataverse meter will be enabled, and both app access and storage will be charged.

### How is Dataverse capacity calculated when one environment is enabled for pay-as-you-go and the other isn't within my tenant?
Environments draw from a tenant-wide pool of Dataverse storage. However, when an environment is linked to an Azure subscription, it stops drawing from the tenant-wide pool. All pay-as-you-go environments will get an initial entitlement of 1 GB of Dataverse database and 1 GB of Dataverse file storage capacities to cover the typical initial storage footprint consumed by Dataverse. Any usage above the initial entitlement is billed to Azure via the Dataverse pay-as-you-go meter. 

### Is there throttling if I exceed Power Platform requests entitlements in a pay-as-you-go environment?
In the context of Power Platform Request entitlement limits, any high usage throttling will be removed when an environment has pay-as-you-go enabled.  When Power Platform Request metering is active in the Public Preview, if you exceed a daily entitlement limit, you'll automatically be charged for the overages via Azure subscription without experiencing high usage throttling. 

> [!NOTE]
> This does not supersede [Service Protection Limit](/powerapps/developer/data-platform/api-limits) browser errors that are separate from high usage throttling.  If service protection limits are exceeded, the user could still experience issues on client applications described on the service protection limits page.

### Can I stop using pay-as-you-go billing at any time?
Yes, you can disable pay-as-you-go at any point by either deleting the billing policy or removing the environment from the billing policy. Doing so will stop any further charges on the Azure subscription. For more information, go to [Turning off pay-as-you-go](pay-as-you-go-set-up.md#turning-off-pay-as-you-go).

### What admin guardrails are available to prevent accidental costs?
You can leverage Azure Cost Management and alerting capabilities to manage spending within your organization. Go to [How to manage costs](pay-as-you-go-usage-costs.md#how-to-manage-costs) for more details.

### Can I use the Power Platform request or Dataverse capacity add-ons in a pay-as-you-go environment?
No, you can't use add-ons in a pay-as-you-go environment. Overages for both Dataverse and Power Platform requests will be charged via Azure subscription in a pay-as-you-go environment. 

### What storage model does the Dataverse capacity meter use?
All environments enabled for pay-as-you-go will use the [new Dataverse storage model](capacity-storage.md)  that has three separate categories of storage usage. If a tenant is still on the [legacy storage model](legacy-capacity-storage.md), the tenant’s storage model status won't change when an environment is enabled for pay-as-you-go.

### Will customers running flows in the context of a Dynamics 365 App be charged for the Power Automate pay-as-you-go meters?  

Charges depend on whether a flow is in the context or out of the context of a Dynamics 365 app, and the flow user/owner’s Dynamics 365 license.  

Flows that run outside the context of the Dynamics 365 application will be charged for the Power Automate pay-as-you-go meters, regardless of the flow owner/user’s Dynamics 365 license.  

Flows that run in the context of the Dynamics 365 application won't be charged for the Power Automate pay-as-you-go meters. But note the following:  

During the preview of the Power Automate pay-as-you-go meter (which starts on July 19, 2022), the following criteria will be used to establish that a flow is running in the context of a Dynamics 365 App:  

- If it’s an instant flow, the user running the flow has a Dynamics 365 Enterprise, Professional or Team member license.

- If it’s an automated or scheduled flow, the owner of the flow has a Dynamics 365 Enterprise, Professional or Team member license.

These criteria will change to align with our licensing guide when we reach general availability of the Power Automate pay-as-you-go meters.  

### Will users Microsoft Project licenses be charged for the Power Automate pay-as-you-go meters if their flows use Microsoft Dataverse?  

Yes. 

### Will users with legacy Flow plans (for example, Flow P1 and Flow P2) be charged for the Power Automate pay-as-you-go meters?  

Yes, if their flows use any premium connectors.   

### When should I consider pay-as-you-go billing over Power Pages subscription plans? 

The addition of pay-as-you-go provides the flexibility to pay based on the number of unique users who logs in or access a website each month. Some common scenarios where it might be useful: 

- When you have a team of professional developers who already have access to an Azure subscription. Using their existing subscription to use Power Pages may help reduce procurement processes while maintaining consistency with other services the team is consuming from Microsoft. 

- When you're unsure how many licenses to procure in advance. Enabling pay-as-you-go delivers the flexibility to establish usage patterns, which could then be transitioned into subscription licenses. 

- When the usage pattern is seasonal. For example, the usage is low for most months but can become high for few months. 

### If my website is in trial mode, is its usage counted in pay-as-you-go billing? 

Usage of websites in trial mode is not counted in pay-as-you-go billing. 

### When if a user logs into a website several times in the month? How will that user be counted? 

Pay-as-you-go billing only counts unique active authenticated users of a website in a month. Repeat logins by a user in a single month results in only one charge for that user that month. 

### My website is used by internal users (employees of my organization) who sign in using their Azure Active directory credentials. Can they use authenticated per user meter? 

Yes, all authenticated users whether they're internal or external to an organization or use any authentication provider, can use the same authenticated per user meter and doesn't require any other license to sign in to the website. 

### What happens if an environment already has Power Apps portal logins/page view or Power Pages authenticated user/anonymous user prepaid capacity is assigned and is enabled for pay-as-you-go? 

If an environment already has Power Apps portal logins/page view or Power Pages Authenticated user/Anonymous user prepaid capacity is assigned and is enabled for pay-as-you-go, all the prepaid capacity is ignored and not consumed. You can reallocate the prepaid capacity to a different environment. 

### How is uniqueness determined for an anonymous user? 

For Anonymous users, uniqueness is determined through a unique anonymous user ID stored in a browser cookie. 

### What happens if an anonymous user accesses the website using a different browser/device or cleans up browser cookies? 

If the user accesses the site using different browsers or devices or cleans up browser cookies, then a new unique anonymous user ID is generated and user would be counted as a different user. 

### My website is authenticated however it has an anonymous sign in page. Will the users accessing sign in page be counted as anonymous users? 

If the users are accessing only sign in page, then they won't be counted as anonymous users. There are several types of pages that aren't counted for the anonymous user meter. The pages are described in [Power Pages – Anonymous user meter](pay-as-you-go-meters.md#anonymous-user-meter).

### I use Application Insights (or Google Analytics) on my website and monthly active user count shown by that is different then what I see in Power Pages licensing reports. Is that expected?

User counts generated by analytics providers like Application Insights or Google Analytics can differ from the counts of the Power Pages meters.  

Their user number can be different due to several reasons like they count usage only on client side whereas we measure usage on server side. This can be due to several reasons described below (not an exhaustive list);

- External analytics providers only operate client side and require JavaScript to be executed to count any user. They won't be counting users that are made when JavaScript can't be executed on users browser. 
- External analytics provider collects data by posting to certain domains that can be different from the domain of the website. If the requests to external analytics provider domain are blocked by end users network, those users wouldn't be counted. 
- Typical external analytics providers don't account for AJAX requests by default. AJAX requests aren't counted in their page views. 
- External analytics providers will count all users irrespective of the http status of the request. However, we won't count a user as active user if all the request made by the user returns either http 3xx, 4xx or 5xx status code. 
- External analytics providers won't exclude special pages described above which will be excluded in official count. 

[!INCLUDE[footer-include](../includes/footer-banner.md)]
