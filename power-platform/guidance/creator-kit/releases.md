---
title: Releases | Creator Kit
description: Release life cycle for Creator Kit updates.
author: denisem-msft
manager: devkeydet
ms.component: pa-maker
ms.topic: conceptual
ms.date: 08/24/2022
ms.subservice: guidance
ms.author: demora
ms.reviewer: tapanm
search.audienceType: 
  - maker
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
contributors:
  - tapanm-msft
  - mehdis-msft
---

# Release Life Cycle

Creator Kit solutions are released in different stages to ensure the new features are thoroughly tested before being considered stable. Users can choose which release solution to determine whether the component can be used in production.

## Release types

- **Beta**. Should be used with caution in an isolated development environment.
- **Stable Release**. Is considered stable and can be used in a production application.

## Updating components
If a component is being used in an existing application, the instances of the component must be deleted from the app, then completely uninstalled from the app.

## Deprecated components

Here is a list of components that have been deprecated:

### Canvas components

These components are no longer available in the canvas component library of the Creator Kit:

| Control | Notes |
| ------- | ----- |
| Spinner | This has been replaced by the Fluent UI code component [Spinner](). |
| ProgressIndicator | This has been replaced by the Fluent UI code component [ProgressBar](). |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]