---
title: "Controlling access | MicrosoftDocs"
description: About controlling access.
ms.custom: ""
ms.date: 09/27/2018
ms.reviewer: ""
ms.service: power-platform
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "get-started-article"
applies_to: 
  - "Dynamics 365 (online)"
  - "Dynamics 365 Version 9.x"
ms.assetid: 83200632-a36b-4401-ba41-952e5b43f939
caps.latest.revision: 31
author: "jimholtz"
ms.author: "jimholtz"
manager: "kvivek"
search.audienceType: 
  - admin
search.app: 
  - Powerplatform
---
# Controlling access

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

PowerApps relies on Azure Active Directory (AAD) for authentication. This means that you can leverage the full functionality of AAD to manage and restrict access to users. This includes using Conditional Access Policies and other premium features of AAD. Developers can also register applications with AAD and use the oAuth2 authorization framework to allow their code to access the platform APIs.

External users from other AAD tenants can be added as Business Guests in your AAD. They can be configured to work with some limitations with PowerApps model-driven apps. Business Guests are not supported currently for PowerApps canvas apps and Microsoft Flow. Other external users beyond the capability of Business Guests, including Azure B2C is not currently supported.
