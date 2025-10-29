---
title: "Performance Recommendations"
description: "This article outlines best practices for achieving the fastest possible import times when importing managed solutions in Power Platform"
author: Sabrina Di Bartolomeo
ms.author: sabrinadi 
ms.date: 30/10/2025
ms.reviewer: 
ms.topic: how-to
ms.subservice: alm
search.audienceType: 
  - developer
---
# Performance Recommendations

This article outlines best practices for achieving the fastest possible import times when importing managed solutions in Power Platform.

**Use Single-Stage Upgrade**

Prefer --stage-and-upgrade over two-stage holding solutions. Two-stage upgrades (--import-as-holding) are slower.

**Don't use Import as a Managed solution**

The --convert-to-managed option is considered risky and deprecated.

**Avoid Overwrite unmanaged customizations**

The Overwrite unmanaged customizations option (--force-overwrite) forces the import process to overwrite any active customizations in the target environment. 
This can slow down the import significantly and is generally not recommended. The recommended approach is to prevent unmanaged customizations in the target environment from the outset, as this minimizes risks and improves performance. Consider using the feature [Block unmanaged customizations in Dataverse](/power-platform/alm/block-unmanaged-customizations)

**Don't use Publish customizations for managed solutions**

Publish customizations is only needed after importing unmanaged solutions and should not be used for managed solutions as it would slow down the deployment. *Note*: The **Publish All Customizations** option does not apply only to the selected solution. It publishes all pending changes across the entire environment.

The table below lists the option names used across the available tools:

|PP Build Tools|PP CLI   |UI|Pipelines in Power Platform
|----------|-----------|------------|------------|
|Import as a holding solution     |--import-as-holding       |Stage for upgrade        |-            |
|Stage and Upgrade|--stage-and-upgrade   |Upgrade|*Default behavior*|
|Overwrite unmanaged customizations|--force-overwrite   |-|-|
|Activate Plugins|--activate-plugins   |Enable plugin steps and flows included in the solution|-|
|Skip product update dependencies|--skip-dependency-check   |-|-|
|Import as a Managed solution|--convert-to-managed   |-|-|
|Publish customizations changes|-|-|-|
|*No option selected*|*No option selected*|Update|-|



