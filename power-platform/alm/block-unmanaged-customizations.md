---
title: "Block unmanaged customizations in environments"
description: "Learn how admins can block unmanaged customizations in environments, which helps enforce healthy ALM processes."
author: swatimadhukargit
ms.subservice: alm
ms.author: swatim
ms.custom: ""
ms.date: 02/01/2024
ms.reviewer: "matp"
ms.topic: "article"
search.audienceType: 
  - maker
---
# Block unmanaged customizations (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

This article describes how you as a Power Platform administrator can enable the **Block unmanaged customizations** environment setting in the Power Platform admin center for your environments. Unmanaged customizations reside at the top layer for a component and subsequently define the runtime behavior of the component. In most situations, you don't want unmanaged customizations determining the behavior of your components.

> [!IMPORTANT]
> - This is a preview feature.
> - [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

This environment setting allows system administrators to prevent unmanaged customizations in Microsoft Dataverse environments. By blocking unmanaged customizations, you ensure the changes to the environment are only coming from approved application lifecycle management (ALM) processes that have sufficient safety, visibility, and auditing. Block unmanaged customizations continues to allow solution operations that are needed to transport the unmanaged customizations to development environments while keeping the environment unmanaged customization free by removing the unmanaged customizations. This feature is helpful in reducing unmanaged customizations in production environments.

When the setting is enabled, these operations are blocked for the environment:

- Import of unmanaged solutions into the environment are blocked.
- Creation of new solution components like apps, tables, and forms are blocked.
- Adding unmanaged changes to existing managed components are blocked.
- Any unmanaged changes result in an error returned to the user, such as: “This environment doesn't allow unmanaged customizations. This was a choice made by your admin, and certain actions won't be available or will be view only.”

The following operations aren't blocked by this feature:

- Change of environment variable, enabling or disabling components. For example, turning Power Automate flows on or off, assigning ownership, or sharing of table records.
- Solutions operations like remove [Remove an unmanaged layer](/power-apps/maker/data-platform/solution-layers#remove-an-unmanaged-layer).
- Creation and export of unmanaged solutions.

## Enable block unmanaged customizations

This feature can be enabled or disabled from the **Features** area of the environment settings for environments in the Power Platform admin center. By default, this setting is disabled. More information: [Block unmanaged customizations](../admin/settings-features.md#block-unmanaged-customizations)

## Known limitations

These features have limitations and might not work as expected in an environment where block unmanaged customizations is enabled. Using these features can result in this error: “This environment doesn't allow unmanaged customizations. This was a choice made by your admin, and certain actions won't be available or will be view only."

If you must use one of the below apps or features in an environment where block unmanaged customizations is enabled, we recommend you disable the setting during the preview.

| App or feature  | Limitation  |
|---------|---------|
| Power Automate desktop flows     |  Hosted machine groups don't work.       |
| Dynamics 365 Resource Scheduling Optimization    |   Install or upgrade don't work.       |
|Automatic record creation     |  Activation, deactivation, and editing of automatic record creation doesn't work.        |
| Legacy workflows     |  Enable and disable of legacy workflows doesn't work.       |
|Field Service     |  Enabling or adjusting the enhanced autonumbering doesn't work. However, default autonumbering continues to work.   |
|Connected Field Service   | Install doesn't work.         |
|Field Service Mobile     |  Install of geofencing solution doesn't work. <br />Update doesn't work when relationships created during initial install are deleted.        |
|Resource Scheduling      | Enable of scheduling table and selection option to auto create relationships doesn't work.        |
|Sales Accelerator     |  Enabling Sales Accelerator or modifying settings, enabling leads data hygiene, creating or editing sequences, configuring work assignment, creating or editing segments, don't work.        |

## See also

[Solution layers](/power-apps/maker/data-platform/solution-layers)