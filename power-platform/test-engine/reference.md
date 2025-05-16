---
title: "Power Apps Test Engine Reference (preview)"
description: "Technical reference documentation for Power Apps Test Engine."
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/16/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
---

# Power Apps Test Engine Reference (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

This section contains technical reference documentation for Power Apps Test Engine. These articles provide detailed information on specific components, functions, and configuration options to help you leverage the full capabilities of Test Engine.

## Power Fx Reference

Test Engine uses Power Fx as its primary language for test step authoring. The following reference guides provide comprehensive information on Power Fx usage in Test Engine:

- [Power Fx in Test Engine](./powerfx.md): Overview of Power Fx capabilities within Test Engine
- [Power Fx Functions](./powerfx-functions.md): Detailed reference for all Test Engine-specific Power Fx functions
- [Power Fx Function Organization](./powerfx-namespaces.md): How functions are organized into namespaces with details on Preview and TestEngine prefixes
- [Custom C# Power Fx Integration](./powerfx-csharp.md): Guide for extending Test Engine with custom C# functions

## Provider Reference

Test Engine uses providers to communicate with different types of Power Platform applications. These references explain provider-specific configuration:

- [Canvas App Provider](./canvas-application.md): Reference for testing canvas applications
- [Model-driven App Provider](./model-driven-application.md): Reference for testing model-driven applications
- [Dataverse Provider](./dataverse.md): Reference for testing Dataverse entities and plugins

## Configuration Reference

Test Engine relies on configuration files to define test plans and settings:

- [YAML Reference](./yaml.md): Detailed reference for Test Engine YAML file format
- [File Restrictions](./filerestrictions.md): Information on file paths and naming restrictions

## Extensibility Reference

Reference documentation for extending Test Engine functionality:

- [Extensibility Framework](./extensibility.md): Architecture and development guide for Test Engine extensions
- [Feature Lifecycle](./feature-lifecycle.md): How Test Engine features progress from preview to general availability

## Integration Reference

Integration capabilities for incorporating Test Engine into development processes:

- [ALM Integration](./alm.md): Reference for integrating Test Engine with Application Lifecycle Management
- [Authentication](./authentication.md): Comprehensive authentication reference with security information
- [Playwright Integration](./playwright.md): Technical details on Test Engine's use of Playwright

## Advanced Topics

Additional reference documentation for advanced scenarios:

- [Data and Connector Simulation](./simulation.md): Reference for simulating data and connector responses
- [Migration Guide](./migration-guide.md): Reference for migrating from earlier versions and other testing tools

These reference topics provide the technical details needed to implement robust, maintainable automated tests using Power Apps Test Engine. Use them alongside the conceptual guides to build a comprehensive testing strategy for your Power Platform applications.

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
