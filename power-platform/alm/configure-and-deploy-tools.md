---
title: "Configuration Migration tool in Power Platform"
description: "Learn about transporting configuration data and test data from one environment to another in Power Platform."
author: marcelbf
ms.author: marcelbf
ms.subservice: alm
ms.date: 08/19/2026
ms.reviewer: "pehecke"
ms.topic: "article"
search.audienceType: 
  - developer
---

# Configuration Migration tool

Use the Configuration Migration tool to move configuration and test data from one environment to another. The tool helps you capture this data, use it in source control, and automate testing with it. Don't rely solely on an environment for isolation; use source control instead.

Test data is data you need to run your tests, such as sample data. You can't automate configuration capture.

> [!TIP]
> You can also automate running the Configuration Migration tool with PowerShell by using the
> [Microsoft.Xrm.Tooling.ConfigurationMigration](https://www.powershellgallery.com/packages/Microsoft.Xrm.Tooling.ConfigurationMigration/) module.

For more information about using the tool, including how to download it, see
[Move configuration data across environments and organizations with the Configuration Migration tool](../admin/manage-configuration-data.md).

## Related articles

[Package Deployer tool](package-deployer-tool.md)  
[Solution Packager tool](solution-packager-tool.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
