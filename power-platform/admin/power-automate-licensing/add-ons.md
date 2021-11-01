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

Add-ons can be added onto a standalone Power Automate license.

## Power Automate capacity add-ons

Power Apps and Power Automate capacity add-ons increase the daily Power Platform requests limits for workloads that need more usage capacity than their allocation. These add-ons provide an additional 50,000 daily Power Platform requests per unit for $50/month and is enforced daily. Unused Power Platform requests do not carry over from day to day. You can purchase these add-ons at any time and they remain a part of the subscription for the remainder of the subscription term.

During transition period, there is no facility to assign the Power Apps and Power Automate capacity add-ons to a user or flow. However, Microsoft recommends that you purchase these add-ons now to remain within your license terms. If any flows are being throttled currently, please raise a Microsoft support ticket with the flow details and add on details to get temporary relief from throttling. 

## Unattended add-on

Unattended desktop flows run without human interaction. These flows are best for scenarios such as processing invoices and entering them into a legacy application automatically or scheduled financial reconciliation across multiple systems that can only be automated by clicking user interfaces.

When running unattended, Power Automate securely signs into the device on your behalf, executes the desktop flow actions on the target applications, and then signs out of the device.

The Power Automate unattended RPA add-on extends desktop-based automation by enabling a bot to run autonomously (independent of a user). Unattended bots can be deployed on a local or remote desktop, or in a virtualized environment. The Power Automate per user with attended RPA or Power Automate per flow plans are the eligible standalone offers for the unattended RPA add-on.

>[!NOTE]
>The Power Automate unattended RPA add-on is licensed by a bot. Concurrent instances of a singular process require an additional unattended bot for each instance. Multiple unattended RPA add-ons can be applied against a qualifying base license.

Note:

- One unattended RPA add-on license includes the rights to one unattended RPA bot, as well as all necessary functions tied to the authoring of  desktop flows, bot orchestration, and management.
- If you run the unattended RPA bot in a VM, you must purchase any necessary additional compute resources.
- You can purchase additional AI Builder capacity; AI Builder service credit capacity is pooled at the tenant level.
- Any services or applications the unattended bot accesses must be licensed separately. For instance, if the bot is accessing Windows or Office, the Microsoft 365, you must purchase the unattended license in addition to the Power Automate unattended RPA add-on.

### FAQs about the unattended add-on

1. I want to run unattended flow. What licenses do I need?

   You need either Power Automate per user with attended RPA or Power Automate per flow plans as a base license and Unattended add-on to be able to run the unattended flow.
1. Is buying just the unattended add-on enough?

   No. You need to a have a qualifying base license (per user RPA/per flow) for which the add-on can be added on.
1. I need multiple instances running unattended. Do I need multiple add-ons?

   Yes if you need to run them at the same time. If not, the runs will be queued and executed once the bot is free.

## AI builder capacity add-on

AI Builder is licensed as an add-on to standalone Power Apps and Power Automate licensing as well as to Dynamics 365 licenses. AI Builder is licensed on a capacity basis. AI Builder capacity is expressed as "service credits". Service credits serve as the single (common) currency across all the scenarios supported by AI Builder. The available service credits decreases when you use AI Builder services. Different scenarios (for example, forms processing, prediction, etc.) use service credits at different rates. Purchase the appropriate number of AI Builder capacity add-on units based on anticipated usage across all scenarios.

Each unit of "AI Builder capacity add-on" includes 1 million service credits per month. For example, a customer who requires 4.7 million service credits per month (based on anticipated usage), should purchase 5 units of "AI Builder capacity add-on".

>[!NOTE]
>
> - Purchased service credits can be used from AI Builder models included within Power Automate, Power Apps, and Dynamics 365 applications.
> - Service credits are deducted / consumed for both training and production usage
> - Service credits are pooled across the tenant.

### FAQs about the AI builder add-on

1. I have a Power Automate per user with RPA plan and I got AI builder credits as part of the plan. Can I transfer the credits to someone else?

No. AI builder service credits are pooled at the tenant level and can't be assigned to a particular user. So, any user who runs a flow that needs AI builder service credits needs to use credits from the pool.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
