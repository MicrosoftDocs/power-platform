---
title: "Preview: Issues and frequently asked questions | MicrosoftDocs"
description: Issues and frequently asked questions for your pay-as-you-go plan.
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/26/2021
ms.subservice: admin
ms.author: jimholtz 
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Preview: Issues and frequently asked questions 

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

## Known Issues/Scope for Public Preview

- Tagging not working yet
- Deleting a BP does not delete corresponding PP Account resource
- PPAC downloadable usage reports provide data for last 30-day period only
- Billing is only for first 30 days of a month

## Frequently Asked Questions 

### When should I consider existing Power Apps subscription plans vs pay-as-you-go?

The addition of pay-as-you-go provides flexibility to pay based on the number of unique apps or portals a user runs each month.

Some common scenarios where it might be useful:

- When you have a team of professional developers who already have access to an Azure subscription. Using their existing Azure subscription to use Power Apps may help reduce procurement processes, while maintaining consistency with other services the team is consuming from Microsoft.
- Pay-as-you-go may be an option when exploring premium capabilities but unsure how many licenses to procure in advance. Enabling pay-as-you-go delivers the flexibility to establish usage patterns, which could then be transitioned into subscription licenses, if needed.
- Similarly, there may be scenarios where an app needs to be shared with a large user base, though usage and frequency may significantly fluctuate. In this case, pay-as-you-go would enable you to pay only for those users who ran an app during the monthly period.

### Is pay-as-you-go available for both canvas apps and model apps?

Yes.

### How is the Power Apps per app meter unit counted?

Number of unique users who opened an app or a portal in each month. Repeat access to the same app or portal is counted only once.

### Can I set up pay-as-you-go for my environment without an Azure subscription?

No. You need an Azure subscription to set up pay-as-you-go.

### Which environments are available for pay-as-you-go?

Production and Sandbox environments are available at this point.

### Can pay-as-you-go be set up for individual apps?

No. Pay-as-you-go is set up for an environment and all apps within that environment are billed against the associated Azure subscription. You can however exclude an app from using the Azure subscription in which case a user will need a per user license to use the app. Per app licenses cannot be used in a pay-as-you-go environment.

### What if I already have a user license and use an app in a pay-as-you-go enabled environment? Will I be billed against Azure subscription?

Users with per user licenses are not counted towards the Power Apps Per app meter, and hence will not incur charges. However, note that when an environment is linked to a billing policy, any Dataverse usage will be billed to the billing policy's Azure subscription.

### What happens if I have an Office license and using an app with standard connectors in a pay-as-you-go enabled environment?

Users who are using an app with standard connectors and have office licenses, are not counted towards the Power Apps per app meter, and hence will not incur charges.

### Can guest users use apps in a pay-as-you-go environment without licenses?

Yes.

### What if a user uses the same app multiple times in a month? How will that user be charged?

Repeat access of the same app by a user in a month is counted only once, resulting in a charge for only 1 active user in that month.

### If a user uses multiple apps in a single environment, how will that user be charged?

You will be charged for the number of apps that a unique user accesses in a month. If a user uses three different apps in a month, you will be charged for three active users.

### What if my app is already using app passes that are available at the environment? Can I still use pay-as-you-go billing for my app?

Yes, you can set up pay-as-you-go for your app's environment. Doing so will disregard the app passes and you can pay for your app via Azure subscription.

### Can I use pay-as-you-go billing for some apps and use per app passes for the others in the same environment?

No. As soon as you enable pay-as-you-go for your environment, all apps will be billed against it.

### I do not have admin permissions for the environment I'm working with. Can I set up pay-as-you-go for the environment?

No. You need an environment admin permission to be able to link the environment to a billing policy.

### Can I enable/disable specific meters?

No. Once you enable pay-as-you-go, both Power Apps per app meter and Dataverse meter will be enabled and both app access and storage will be charged.

### How is Dataverse capacity calculated when one environment is enabled for PAYG and the other is not within my tenant?

Environments draw from a tenant-wide pool of Dataverse storage. When an environment is linked to an Azure subscription however, it stops drawing from the tenant-wide pool. All pay-as-you-go linked environments will get an initial entitlement of 1.0GB of Dataverse database and 1.0GB of Dataverse file storage capacities to cover the typical initial storage footprint consumed by Dataverse. Any usage above the initial environment is billed to Azure via the Dataverse pay-as-you-go meter.

### Will I be throttled if I exceed Power Platform requests entitlement in a pay-as-you-go environment?

No. If you exceed your entitlement, you will automatically be charged for the overages via Azure subscription without experiencing any disruption. However, at this time, you are not getting charged even if you exceed entitlements.

### Can I stop using pay-as-you-go billing at any time?

Yes, you can disable pay-as-you-go at any point by either deleting the billing policy or removing the environment from the billing policy. Doing so will stop any further charges on the Azure subscription.

### What admin guardrails are available to prevent accidental costs?

### What If my bill is wrong?

### Can I use the Power Platform request or Dataverse capacity add-ons in a pay-as you-go environment?

No, you cannot use add-ons in a pay-as-you-go environment.



### See also  





[!INCLUDE[footer-include](../includes/footer-banner.md)]