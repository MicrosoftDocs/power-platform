---
title: "Configuration Migration and Package Deployer tools | Microsoft Docs"
description: "Learn about transporting configuration data, test data, and packages from one environment to another."
keywords: 
author: phecke
ms.author: pehecke
manager: kvivek
ms.custom: ""
ms.date: 04/13/2020
ms.reviewer: "pehecke"
ms.service: powerapps
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
applies_to: 
  - "Dynamics 365 (online)"
  - "Dynamics 365 Version 9.x"
  - "powerapps"
ms.assetid: 
search.audienceType: 
  - developer
search.app: 
  - PowerApps
  - D365CE
---

# Configuration Migration and Package Deployer tools

These tools enable you to migrate configuration data, test data, solutions, and more from one environment to another. Read about each tool in the following sections.

## Configuration Migration tool

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
[Move configuration data across environments and organizations with the Configuration Migration tool](https://docs.microsoft.com/power-platform/admin/manage-configuration-data).

## Package Deployer tool

Let's now talk about creating a "package" in Visual Studio that can be deployed
by the [Package Deployer](tools-apps-used-alm.md#package-deployer) tool. A package is a container
where you place solution files, flat files, configuration data, HTML, and custom
code together in a single file for deployment to other environments.

Common Data Service provides you with a Visual Studio template for creating
these packages, which you can use with the Package Deployer tool to deploy the
packages to a Common Data Service instance. For information about creating a
package, see [Create packages for the Package Deployer](/powerapps/developer/common-data-service/package-deployer/create-packages-package-deployer).
Next, follow the instructions to
[deploy](/powerapps/developer/common-data-service/package-deployer/create-packages-package-deployer#deploy-a-package) the package.

### See also

[Solution Packager tool](solution-packager-tool.md)