---
title: "Considerations for healthy ALM in a team development scenario"
description: "Learn how to support healthy ALM when multiple developers and apps are part of a release management process."
keywords: 
author: Mattp123
ms.author: matp
manager: kvivek
ms.custom: ""
ms.date: 05/05/2020
ms.reviewer: ""
ms.service: power-platform
ms.topic: "article"
search.audienceType: 
  - maker
search.app: 
  - PowerApps
  - D365CE
---
# Scenario 5: Supporting team development
Supporting team development consists of multiple apps and development team members in a structured release management process. Team development includes the following: 

-   **Conflict and merge resolution** It's important to consider which pieces will merge well and which should only be worked on by a single developer at a time, such as forms or site maps. More information: [Understand how managed solutions are merged](how-managed-solutions-merged.md)

-   **Branching strategy** Your branching strategy should make sure that you can
    service an existing release while working on the next version.

-   **Environment strategy** Developer isolation, and an environment strategy that
    supports it, is critical when multiple developers work on the same
    application. Environments should be short-lived and spun up on demand from
    the latest build. Each developer should have their own development environment
    in which only the required unmanaged solution is installed, and all dependent
    solutions are installed as managed.

-   **Power Apps component library** Components are reusable building blocks for canvas apps so that app makers can create custom controls to use inside an app, or across apps using the component library. More information: [Component library](/powerapps/maker/canvas-apps/component-library) 

### See also
[Scenario 6: Embrace your citizen developers in the ALM process](embrace-citizen-devs.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
