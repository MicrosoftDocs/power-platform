---
title: CAE Title (preview)
description: Description goes here
author: ritesp
ms.subservice: admin
ms.author: ritesp
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/17/2023
search.audienceType: 
  - admin
---

# CAE title goes here (preview)

[This article is pre-release documentation and is subject to change.]

OAuth 2.0 for authentication traditionally rely on access token expiration to revoke a user account’s access to Modern cloud services. Let’s say an Azure Active Directory Administrator revokes a user account’s access, the user will still have access to resources until the access token expires, which for Power Platform by default, used to be up to an hour after the initial revocation event took place. 

 

With continuous access evaluation (CAE) integration with Power Platform, the user critical events and network location change is continuously evaluated by Power Platform services such as Dataverse and proactively terminates active user sessions and enforces tenant policy changes in near real time instead of relying on access token static/configured expiration. This is possible with CAE as user critical events and network location change signals are continuously available to Power Platform services such as Dataverse to evaluate a user condition continuously. 


> [!Important]
> [!include [preview](../includes/cc-preview-features-definition.md)]

## Key Benefits
