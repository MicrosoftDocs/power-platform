---
title: "Block unmanaged customizations in production environments"
description: "Learn how admins can block unmanaged customizations in roduction environments, which helps enforce healthy ALM processes."
author: swatimadhukargit
ms.subservice: alm
ms.author: swatim
ms.custom: ""
ms.date: 11/08/2023
ms.reviewer: "matp"
ms.topic: "article"
search.audienceType: 
  - maker
---
# Block unmanaged customizations (preview)

[This topic is pre-release documentation and is subject to change]

This article describes how you as a Power Platform administrator can enable the **Block unmanaged customizations** environment setting in the Power Platform admin center for your production environments. Unmanaged customizations reside at the top layer for a component and subsequently define the runtime behavior of the component. In most situations you don't want unmanaged customizations determining the behavior of your components.

> [!IMPORTANT]
> - This is a preview feature.
> - [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

This environment setting allows system administrators to prevent unmanaged customizations in Microsoft Dataverse production environments. By blocking unmanaged customizations, you ensure the changes to the production environment are only coming from approved application lifecycle management (ALM) processes that have sufficient safety, visibility, and auditing. Block unmanaged customizations continues to allow solution operations that are needed to transport the unmanaged customizations to development environments while keeping the production environment unmanaged customization free by removing the unmanaged customizations.

Once the setting is enabled these operations are blocked for the production environment:

- Import of unmanaged solutions into the environment are blocked.
- Creation of new solution components like apps, tables, and forms are blocked.
- Adding unmanaged changes to existing managed components are blocked.
- Any unmanaged changes result in an error returned to the user, such as: “This environment doesn't allow unmanaged customizations. This was a choice made by your admin, and certain actions won't be available or will be view only.”

The following operations are not blocked by this feature:

- Change of environment variable, enabling or disabling components. For example, turning Power Automate flows on or off, assigning ownership, or sharing of table records.
- Solutions operations like remove [Remove an unmanaged layer](/power-apps/maker/data-platform/solution-layers#remove-an-unmanaged-layer).
- Creation and export of unmanaged solutions.

## Enable block unmanaged customizations

This feature can be enabled or disabled from the **Features** area of the environment settings for production environments in the Power Platform admin center. By default, this setting is disabled. More information: [Block unmanaged customizations](../admin/settings-features.md#block-unmanaged-customizations)

## See also

[Solution layers](/power-apps/maker/data-platform/solution-layers)