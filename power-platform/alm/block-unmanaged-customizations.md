---
title: "Block unmanaged customizations in Production environment"
description: "Learn how admins can block unmanaged customizations in Production enviornment and allow only safe ALM process to make any changes"
author: swatim
ms.subservice: alm
ms.author: matp
ms.custom: ""
ms.date: 11/08/2023
ms.reviewer: "matp"
ms.topic: "article"
search.audienceType: 
  - maker
---

# Block unmanaged customizations (preview)

[This topic is pre-release documentation and is subject to change]

This article describes how you as a Power Platform administrator can enable **Block unmanaged customizations (Preview)** environment setting in Power Platform admin center for your production environments to preview this feature.

This feature will allow system administrators to lock down production environments from making unmanaged customizations. This will help ensure the changes to the production system are only coming from approved application lifecycle management (ALM) processes that have sufficient safety, visibility, and auditing. The feature will continue to allow solution operations that are needed to transport the unmanaged customizations to development environments and keep the production environment clean by removing unmanaged customizations.

- Once the environment setting is enabled following operations will be blocked:
  - Import of unmanaged solution will be blocked.
  - Creation of new entities like Apps, Tables, Forms will be blocked.
  - Adding unmanaged changes to existing managed components will be blocked.
- Any unmanaged changes will result in exception like: “This environment doesn't allow unmanaged customizations. This was a choice made by your admin, and certain actions won't be available or will be view only. Learn more: https://go.microsoft.com/fwlink/?linkid=2251006”

Please note, following operations are not blocked by this feature:

- Change of environment variable, enabling/disabling components (example: turning Flows on/off), assigning ownership or sharing of component records.
- Solutions operations like remove unmanaged customization.
- Creation and export of unmanaged solution.
