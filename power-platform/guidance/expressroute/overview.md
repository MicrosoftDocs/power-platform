---
title: "Overview of using ExpressRoute with Microsoft Power Platform | MicrosoftDocs"
description: "Introduction to ExpressRoute with Microsoft Power Platform"
author: taiki-yoshida
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/30/2021
ms.author: tayoshi
ms.reviewer: kathyos
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Overview

Microsoft Azure ExpressRoute provides a way to connect your on-premises network
to Microsoft cloud services using private connectivity.

![Diagram Description automatically generated](media/f87c46e631424925243a15528db489e6.png)

Although the name of the service is Azure ExpressRoute, it also supports private
connectivity to services built on top of Microsoft Azure, such as Microsoft 365,
Microsoft Power Platform and Microsoft Dynamics 365.

![Diagram of the entire Microsoft technology. The foundation layer consists of Identity, security, management and compliance. Microsoft Azure is on top of that foundation. GitHub and Microsoft Power Platform is built on top of Microsoft Azure, and Microsoft 365, LinkedIn and Microsoft Dynamics 365 at the top layer.](media/powerplatform-overview.png)

ExpressRoute is a valuable technology, particularly when used with Azure IaaS,
but its deployment should not be undertaken lightly, particularly for use with
Power Platform and Microsoft 365 services. It should be considered for these
only after a comprehensive review of the business justification and planned
configuration of its use.

This document focuses considering, planning for, and configuring ExpressRoute
for use with Microsoft Power Platform.

More information: [Introduction to Azure
ExpressRoute](https://docs.microsoft.com/azure/expressroute/expressroute-introduction)

Typically, an organization will look into ExpressRoute if they have one or more
of the following concerns:

-   Making sure their network or Internet connection can handle the additional
    traffic of a rich business application

-   Managing the predictability of the traffic supporting mission-critical
    applications—as opposed to other less critical Internet traffic—to ensure
    performance for the user and the business

-   Ensuring compliance with a regulatory need for data to never transit across
    the public Internet

Using ExpressRoute can address these concerns, but it’s important to understand
what ExpressRoute does and does not do so that you can accurately judge the
value for the situation.

> [!div class="nextstepaction"]
> [Next step: Understand the ExpressRoute peering types](expressroute-peerings.md)