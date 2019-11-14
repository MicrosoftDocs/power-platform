---
title: "TITLE"
description: "DESCRIPTION"
keywords: "KEYWORDS"
ms.date: 09/04/2019
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "VA"
ms.collection: virtualagent
---

# H1 - Fundamentals - Bots and topics recommendations and best practices

Fundamentals - Bots and topics recommendations and best practices

## Accessibility

Microsoft wants to provide the best possible experience for all customers, including customers with disabilities. The bot authoring canvas is built to be accessible from the get-go. 

In general, using the authoring canvas follows standard navigation patterns. But for complex scenarios, we've build keyboard shortcuts specifically tailored to help users authoring content using keyboard navigation.

###  Routing anchors
Press enter or space on a route anchor and to go into editing mode for that route. Once in the editing mode, you can tab to other node anchors. Once the desired anchor is selected, you can:

- Press ```Delete``` to delete the route, and make the target node of the route an orphan node if this route is the only route leading to that node
- Press ```Escape``` to take the user out of tab mode and resume normal tabbing
- Press ```Enter``` or ```Space``` on a different node to reconnect the route to the new node (same source node, new target node)
- Press ```Tab``` to take you to the next viable location to drop this route

At any time, pressing these hotkeys on a route anchor will read out the properties of the route:
- ```Alt + Shift + A``` will read out the source node
- ```Alt + Shift + B``` will read out the target node
