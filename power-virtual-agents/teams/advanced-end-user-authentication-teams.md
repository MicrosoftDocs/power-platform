---
title: "Add user authentication to chatbot topics in Microsoft Teams"
description: "Insert user authentication into a topic using the Power Virtual Agents app in Microsoft Teams to allow your users to sign in directly within a conversation."
keywords: "User Authentication, Authentication, AAD, MSA, Identity Provider, PVA"
ms.date: 9/22/2020
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: clmori
ms.custom: authentication, ceX, teams
ms.collection: virtual-agent
---

# Add end-user authentication to a Power Virtual Agents bot in Teams



Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
> - [Power Virtual Agents web app](../advanced-end-user-authentication.md)
> - [Power Virtual Agents app in Microsoft Teams](advanced-end-user-authentication-teams.md)



Bots created in Microsoft Teams come with authentication pre-configured to use Teams authentication. 

You can also enable user authentication within a bot conversation so the bot can:

- Get a user's basic properties such as username and ID in bot variables.
- Prompt a user to sign in using an authentication node, so the bot can retrieve the user's information from a back-end system. 
- Use single sign-on (SSO) on web channels so your users don't need to sign in manually. 

Read more about [Configuring and using authentication in the Power Virtual Agents web app documentation](../advanced-end-user-authentication.md).
