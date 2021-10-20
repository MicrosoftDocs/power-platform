---
title: "Add-ons for Power Automate licensing"
description: "Add-ons for Power Automate licensing."
author: msftman
ms.service: power-platform
ms.component: pa-admin
ms.topic: overview
ms.date: 10/06/2021
ms.author: deonhe
manager: kvivek
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Add-ons for Power Automate licensing

[!INCLUDE [cc-data-platform-banner](../../includes/cc-data-platform-banner.md)]

# Add-ons

Add-ons can be added in addition to a base Power Automate license.

### Power Automate capacity add-ons

Power Apps and Power Automate capacity add-on increases the daily Power Platform requests for workloads that need more usage capacity than their allocation. The addon provides additional 10,000 daily Power Platform requests per unit for $50/month and is enforced daily. Unused/unassigned Power Platform requests do not carry over from day to day. Add-ons can be purchased at any time and remain a part of the subscription for the remainder of the subscription term.

During transition period, there is no facility yet to assign the Power Apps and Power Automate capacity add-on to a user/flow. However, it is recommended that you purchase these add-ons now to remain within your license terms and to be prepared for when the transition period ends.

### Unattended add-on

Unattended UI flows can run without human supervision. These flows are best for scenarios such as processing invoices and entering them into a legacy application automatically or scheduled financial reconciliation across multiple systems that can only be automated by clicking user interfaces.

When running unattended, Power Automate will securely sign into the device on your behalf, execute the UI flow actions on the target applications, and then sign out of the device.

The Power Automate unattended RPA add-on extends desktop-based automation by enabling a bot to run autonomously, i.e. independent of a user. Unattended bots can be deployed on a local or remote desktop, or other virtualized environment. The Power Automate per user with attended RPA or Power Automate per flow plans are eligible base offers for the unattended RPA add-on. Note, the Power Automate unattended RPA add-on is licensed by bot. Concurrent instances of a singular process require an additional unattended bot for each instance – multiple unattended RPA add-ons can be applied against a qualifying base license.

Note:

• One unattended RPA add-on license includes the rights to one unattended RPA bot, as well as all necessary functions tied to desktop flow authoring, bot orchestration and management.

• Running the unattended RPA bot in a VM requires the separate purchase of any necessary compute resources.

• Additional AI Builder capacity can be purchased per 1M service credits for $500/month; AI Builder service credit capacity is pooled on the tenant level.

• Any services or applications the unattended bot accesses must be licensed separately. For instance, if the bot is accessing Windows or Office, the Microsoft 365 – Unattended License must also be purchased in addition to the Power Automate unattended RPA add-on.

FAQ

1. I want to run unattended flow. What licenses do I need?

You need either Power Automate per user with attended RPA or Power Automate per flow plans as a base license and Unattended addon to be able to run the unattended flow.

2. Is buying just the unattended addon enough?

No. You need to a have a qualifying base license (per user RPA/per flow) for which the addon can be added on.

3. I need multiple instances running unattended. Do I need multiple addons?

Concurrent instances of a singular process require an additional unattended bot for each instance – multiple unattended RPA add-ons can be applied against a qualifying base license.

### AI builder capacity add-on

AI Builder is licensed as an add-on to standalone Power Apps and Power Automate licensing as well as Dynamics 365 licenses. AI Builder is licensed on a capacity basis. AI Builder capacity is expressed in the form of &quot;service credits&quot;. Service credits serve as the single (common) currency across all the scenarios supported by AI Builder. Available service credits are deducted when AI Builder services are used. Different scenarios (for example, forms processing, prediction, etc.) burn down service credits at different rates. Customers should purchase the appropriate number of AI Builder capacity add-on units based on anticipated usage across all scenarios.

Each unit of &quot;AI Builder capacity add-on&quot; includes 1 million service credits per month. For example, a customer requiring 4.7 million service credits per month (based on anticipated usage), should purchase 5 units of &quot;AI Builder capacity add-on&quot;. Note: • Purchased service credits can be used from AI Builder models included within Power Automate, Power Apps and Dynamics 365 applications • Service credits are deducted / consumed for both training and production usage • Service credits are pooled across the tenant.

### FAQ

1. I have a Power Automate per user with RPA license and I got AI builder credits as part of the license. Can I transfer the credits to someone else?

No. AI builder service credits are pooled at the tenant level and can&#39;t be assigned to a particular user. So, any user that runs a flow that needs AI builder service credits will be able to use credits from the pool.


[!INCLUDE[footer-include](../../includes/footer-banner.md)]