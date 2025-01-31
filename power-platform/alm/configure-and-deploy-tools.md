---
title: "Configuration Migration tool in Power Platform"
description: "Learn about transporting configuration data and test data from one environment to another in Power Platform."
author: marcelbf
ms.author: marcelbf
ms.subservice: alm
ms.date: 01/30/2025
ms.reviewer: "pehecke"
ms.topic: "article"
search.audienceType: 
  - developer
---

# Configuration Migration tool

The Configuration Migration tool is used to transport configuration and test data from one environment to another. It provides the means to capture such data, use that data in source control, and use that data to automate testing. Don't just rely on an environment for isolation: use source control instead.

Test data is data that's necessary to run your tests (that is, sample data). Configuration capture can't be automated.

> [!TIP]
> You can also automate running the Configuration Migration tool with PowerShell by using the
> [Microsoft.Xrm.Tooling.ConfigurationMigration](https://www.powershellgallery.com/packages/Microsoft.Xrm.Tooling.ConfigurationMigration/) module.

For more information about using the tool, including how to download it, go to
[Move configuration data across environments and organizations with the Configuration Migration tool](../admin/manage-configuration-data.md).

## Related articles

[Package Deployer tool](package-deployer-tool.md)  
[Solution Packager tool](solution-packager-tool.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
