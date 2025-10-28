---
title: "Performance Recommendations"
description: "This document outlines best practices for achieving the fastest possible import times when importing managed solutions in Power Platform"
author: Sabrina Di Bartolomeo
ms.author: sabrinadi 
ms.date: 30/10/2025
ms.reviewer: 
ms.topic: how-to
ms.subservice: alm
search.audienceType: 
  - developer
---

**Use Single-Stage Upgrade**

Prefer --stage-and-upgrade over two-stage holding solutions. Two-stage upgrades (--import-as-holding) are slower.

**Don't use Import as a Managed solution**

The --convert-to-managed option is considered risky and deprecated.

**Avoid Overwrite unmanaged customizations**

The Overwrite unmanaged customizations option (--force-overwrite) forces the import process to overwrite any active customizations in the target environment. 
This can slow down the import significantly and is generally not recommended.

**Don't use Publish customizations for managed solutions**

Publish customizations is only needed for unmanaged solutions and should not be used for managed solutions as it would slow down the deployment.

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



