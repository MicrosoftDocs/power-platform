---
title: "LivePerson Integration"
description: "This comprehensive document provides a step-by-step guide to seamlessly integrate Microsoft Power Virtual Agents (PVA) with LivePerson, enabling you to enhance your customer support and engagement capabilities. Learn how to set up this integration to leverage the strengths of both platforms, empowering your organization to deliver more personalized, efficient, and effective customer interactions."
ms.reviewer: micchow
ms.date: 09/27/2023

<!-- Do not update the following fields; the docs team uses them for content management -->
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.collection: TBU
ms.service: TBU
searchScope:
  - "TBU"
<!-- End of content management section -->
---

# Integration of PVA with LivePerson
Integrating LivePerson with PVA presents a compelling opportunity for businesses seeking to enhance their customer support and engagement capabilities. This integration harmoniously merges PVA's conversational AI prowess with LivePerson's messaging platform, equipping organizations to deliver highly personalized and streamlined customer interactions across various communication channels. In practice, this integration effectively addresses real-world business challenges, such as efficiently scaling customer support operations, reducing response times, and ultimately elevating overall customer satisfaction levels. To embark on this integration journey, it's crucial to understand prerequisites, including the necessity of active LivePerson and PVA subscriptions and access to essential credentials. Moreover, explore related documentation to gain a comprehensive grasp of the integration process and its place within a broader customer engagement and automation strategy in your organization.

## Prerequisites

Before you begin, ensure that you have the following prerequisites in place:

1. An active LivePerson account.
2. A Power Virtual Agents (PVA) bot created in Microsoft Power Platform.
3. Admin or developer access to both LivePerson and Microsoft Power Platform.

### Steps

Follow these steps to create and connect LivePerson to a Power Virtual Agents (PVA) Bot:

1. Retrieve your <a href="https://learn.microsoft.com/en-us/azure/bot-service/rest-api/bot-framework-rest-direct-line-3-0-authentication?view=azure-bot-service-4.0" target="_blank">Direct Line Secret</a> for your bot.

2. Confirm the following steps <a href="https://developers.liveperson.com/third-party-bots-microsoft-direct-line-introduction.html" target="_blank">LivePerson</a> document.

3. To setup handoff back to LivePerson follow this documentation <a href="https://developers.liveperson.com/third-party-bots-microsoft-direct-line-pva.html#transfer-to-agent">Transfer to agent</a>