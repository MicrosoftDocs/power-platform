---
title: "Performance tuning and optimization for customer engagement apps"
description: "Plan and optimize application performance with Dynamics 365 customer engagement apps."
author: Mattp123
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/08/2020
ms.subservice: admin
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

This article helps you plan and optimize application performance with customer engagement apps, including Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation.  

Microsoft recommends that you don't execute operations that require concurrent database transactions. Also, don’t execute operations that require intensive database transactions during normal business hours, when users are most likely to access the system. 

Example operations that require intensive database transactions include:

- Enable one or more language packs
- Solution import, upgrade, delete, or export
- Install or upgrade apps from [!INCLUDE [pn-microsoft-appsource](../includes/pn-microsoft-appsource.md)] or the [!INCLUDE [pn-dyn-365-admin-center](../includes/pn-dyn-365-admin-center.md)] 
- Publish customizations
- Large bulk record operations, such as business unit changes. For example, when a business unit has a very large number of records associated with it

### See also
[Verify network capacity and throughput for clients](verify-network-capacity-throughput-clients.md) <br />




[!INCLUDE[footer-include](../includes/footer-banner.md)]
