---
title: "Data loss prevention policies  | MicrosoftDocs"
description: About data loss prevention (DLP) policies.
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/19/2021
author: jimholtz
ms.subservice: admin
ms.author: jimholtz
ms.reviewer: jimholtz
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Data loss prevention policies 

Your organization's data is likely one of the most important assets you're responsible for safeguarding as an administrator. The ability to build apps and automation to use that data is a large part of your company's success. You can use Power Apps and Power Automate for rapid build and rollout of these high-value apps so that users can measure and act on the data in real time. Apps and automation are becoming increasingly connected across multiple data sources and multiple services. Some of these might be external, third-party services and might even include some social networks. Users generally have good intentions, but they can easily overlook the potential for exposure from data leakage to services and audiences that shouldn't have access to the data.

You can create data loss prevention (DLP) policies that can act as guardrails to help prevent users from unintentionally exposing organizational data. DLP policies can be scoped at the environment level or tenant level, offering flexibility to craft sensible policies that strike the right balance between protection and productivity. For tenant-level policies you can define the scope to be all environments, selected environments, or all environments except ones you specifically exclude. Environment-level policies can be defined for one environment at a time. 

DLP policies enforce rules for which connectors can be used together by classifying connectors as either **Business** or **Non-Business**. If you put a connector in the **Business** group, it can only be used with other connectors from that group in any given app or flow. Sometimes you might want to block the usage of certain connectors altogether by classifying them as **Blocked**.

DLP policies are created in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/). They affect Power Platform canvas apps and Power Automate flows. To create a DLP policy, you need to be a [tenant admin](use-service-admin-role-manage-tenant.md) or have the [Environment Admin role](environments-overview.md#environment-permissions). 

> [!NOTE]
> The ability to block connectors by using a three-way classification&mdash;**Business**, **Non-Business**, and **Blocked**&mdash;in addition to DLP policy UI support in the Power Platform admin center is now generally available. There is new DLP policy PowerShell support for three-way DLP policy classification, which is also generally available. Legacy DLP policy support for two-way classification (**Business** and **Non-Business**), along with admin center UI and PowerShell support for two-way classification, is currently generally available and will continue to be available for the foreseeable future. More information: [Connectors documentation](/connectors/)


### See also

[Create a data loss prevention (DLP) policy](create-dlp-policy.md) <br />
[Manage data loss prevention (DLP) policies](prevent-data-loss.md) <br />
[Data loss prevention (DLP) policy commands](powerapps-powershell.md#data-loss-prevention-dlp-policy-commands)


[!INCLUDE[footer-include](../includes/footer-banner.md)]