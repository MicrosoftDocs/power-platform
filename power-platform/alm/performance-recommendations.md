---
title: "Performance recommendations"
description: "This article outlines best practices for achieving the fastest possible import times when importing managed solutions in Power Platform."
author: sabrinadi
ms.author: sabrinadi 
ms.date: 11/04/2025
ms.reviewer: matp
ms.topic: how-to
ms.subservice: alm
search.audienceType: 
  - developer
---
# Performance recommendations

This article outlines best practices for achieving the fastest possible import times when importing managed solutions in Power Platform.

- Use use the **Single-Stage Upgrade** option. Use stage-and-upgrade instead of two-stage holding solutions. Two-stage upgrades (import-as-holding) are slower.
- In most situations, don't use the **Import as a managed solution** option. This convert-to-managed option is deprecated and should no longer be used.
- Avoid using the **Overwrite unmanaged customizations** option. The **Overwrite unmanaged customizations** option (force-overwrite) forces the import process to overwrite any active customizations in the target environment. This option significantly slows down the import process and is discouraged. The recommended approach is to prevent unmanaged customizations in the target environment from the outset. To help with controlling unmanaged customizations in your nondevelopment environments, consider using the feature [Block unmanaged customizations in Dataverse](block-unmanaged-customizations.md)
- Don't use the **Publish all customizations** option for managed solutions. The **Publish all customizations** is only needed after importing unmanaged solutions and shouldn't be used for managed solutions because it slows down the deployment. Notice that the **Publish all customizations** option doesn't apply only to the selected solution. It publishes *all pending changes* across the entire environment.

> [!NOTE]
> When you enable a language, the first import of every solution is slower.

The table below lists the option names used across the available tools.

|Power Platform build tools|PAC CLI   |UI|Pipelines in Power Platform
|----------|-----------|------------|------------|
|Import as a holding solution     |--import-as-holding       |Stage for upgrade        |-            |
|Stage and Upgrade|--stage-and-upgrade   |Upgrade|*Default behavior*|
|Overwrite unmanaged customizations|--force-overwrite   |-|-|
|Activate Plugins|--activate-plugins   |Enable plugin steps and flows included in the solution|-|
|Skip product update dependencies|--skip-dependency-check   |-|-|
|Skip lower version|--skip-lower-version   |-|Allow redeployments of older versions|
|Import as a Managed solution|--convert-to-managed   |-|-|
|Publish customizations changes|--publish-changes |-|-|
|*No option selected*|*No option selected*|Update|-|

