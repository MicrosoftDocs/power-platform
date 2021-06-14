---
title: "Configuration Migration tool | Microsoft Docs"
description: "Learn about transporting configuration data and test data from one environment to another."
keywords: 
author: mikkelsen2000
ms.author: pemikkel
manager: kvivek
ms.custom: ""
ms.date: 06/09/2020
ms.reviewer: "pehecke"
ms.service: power-platform
ms.topic: "article"
search.audienceType: 
  - developer
search.app: 
  - PowerApps
  - D365CE
---

# Configuration Migration tool

The Configuration Migration tool is used to transport configuration and test
data from one environment to another. It provides the means to capture such
data, use that data in source control, and use that data to automate testing. Don't
just rely on an environment for isolation: use source control instead.

Test data is data that's necessary to run your tests (that is, sample data).
Configuration capture can't be automated.

> [!TIP]
> You can also automate running the Configuration Migration tool with PowerShell by using the
> [Microsoft.Xrm.Tooling.ConfigurationMigration](https://www.powershellgallery.com/packages/Microsoft.Xrm.Tooling.ConfigurationMigration/) module.

For more information about using the tool, including how to download it, see
[Move configuration data across environments and organizations with the Configuration Migration tool](../admin/manage-configuration-data.md).

### See also

[Package Deployer tool](package-deployer-tool.md)  
[Solution Packager tool](solution-packager-tool.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]