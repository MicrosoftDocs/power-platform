---
title: "Performance tuning and optimization  | MicrosoftDocs"
description: Performance tuning and optimization
author: Mattp123
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/08/2020
ms.author: matp
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Performance tuning and optimization

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

Use this information to help you plan and optimize application performance with customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation).  

We recommend that you not run operations that require intensive database transactions concurrently. Similarly, don’t run operations that require intensive database transactions during normal business hours when users are most likely to access the system. 

Operations that require intensive database transactions examples:
- Enabling one or more language packs
- Solution import, upgrade, delete, or export
- Install or upgrade apps from [!INCLUDE [pn-microsoft-appsource](../includes/pn-microsoft-appsource.md)] or the [!INCLUDE [pn-dyn-365-admin-center](../includes/pn-dyn-365-admin-center.md)] 
- Publishing customizations
- Large bulk record operations, such as a business unit change when the business unit has a very large number of records associated

### See also
[Verify network capacity and throughput for clients](verify-network-capacity-throughput-clients.md) <br />


