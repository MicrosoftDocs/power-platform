---
title: "Combined effect of multiple DLP policies  | MicrosoftDocs"
description: Examples of the combined effect of multiple DLP policies.
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/03/2021
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

# Combined effect of multiple DLP policies

As a tenant or environment admin, you can create more than one DLP policy and apply it to the same environment. At design time and runtime, all policies that are applicable to the environment in which the app or flow resides are evaluated together to decide whether the resource is in compliance or violation of DLP policies.

## Blocked classification impact across multiple policies

If any policy (tenant-level or environment-level) that's applicable to an environment marks a connector as **Blocked**, no app or flow can use that connector in the environment. It doesn't matter whether any other policy classifies that connector as **Business** or **Non-Business**, because **Blocked** is the most restrictive classification for the connector; therefore, **Blocked** is always the final outcome of multiple policy evaluations. 

## Business/Non-Business classification impact across multiple policies

Compared to evaluating the effect of the **Blocked** classification, evaluating the effect of the **Business** or **Non-Business** classification across multiple policies is more complex. You can classify a given connector, for example SharePoint, as **Business** in policy A and as **Non-Business** in policy B. What matters is which other connectors SharePoint is grouped with across policy A and policy B. 

Note that the most restrictive grouping is finally imposed when all the policies applicable to an environment are evaluated together. Consider an example of three policies (A, B, and C) across 10 connectors (SharePoint, Twitter, Salesforce, Facebook, Face API, Microsoft 365 Outlook, Basecamp 3, Adobe Sign, Azure Blob storage, and Box). These connectors are classified as **Business** or **Non-Business** as represented by two categories each across the three policies (-E1- and -E2- for policy A, -E3- and -E4- for policy B, and -E5- and -E6- for policy C).

**Policy A** <br />
-E1- **Business** – SharePoint, Twitter, Salesforce, Microsoft 365 Outlook, Basecamp 3 <br />
-E2- **Non-Business** – Facebook, Face API, Adobe Sign, Azure Blob storage, Box

**Policy B** <br />
-E3- **Business**  – SharePoint, Facebook, Face API, Microsoft 365 Outlook, Basecamp 3 <br />
-E4- **Non-Business** – Twitter, Salesforce, Adobe Sign, Azure Blob storage, Box

**Policy C** <br />
-E5- **Business**  – Facebook, Face API, Twitter, Salesforce, Microsoft 365 Outlook <br />
-E6- **Non-Business** – SharePoint, Adobe Sign, Azure Blob storage, Box, Basecamp 3

When all three policies are applied together to the same environment, the net result is fragmentation of connectors across eight (2<sup>3</sup> = 8) groups, as depicted below. Only connectors in the same group (out of eight possible combinations) can be used in a given app or flow. 

**Consolidated grouping** <br />
-E1-, -E3-, -E5- Group 1 – Microsoft 365 Outlook <br />
-E1-, -E3-, -E6- Group 2 – SharePoint, Basecamp 3 <br />
-E1-, -E4-, -E5- Group 3 – Twitter, Salesforce <br />
-E1-, -E4-, -E6- Group 4 – NULL <br />
-E2-, -E3-, -E5- Group 5 – Facebook, Face API <br />
-E2-, -E3-, -E6- Group 6 – NULL <br />
-E2-, -E4-, -E5- Group 7 – NULL <br />
-E2-, -E4-, -E6- Group 8 – Adobe Sign, Azure Blob storage, Box

To summarize: an app or flow can only use connectors from these individual groups at any given time, and it can't mix connectors across the eight different groups. From the examples above, note that multiple DLP policies applied to an environment will fragment your connector space in complicated ways. Therefore, we highly recommended that you apply a minimum number of DLP policies to any given environment. 




[!INCLUDE[footer-include](../includes/footer-banner.md)]