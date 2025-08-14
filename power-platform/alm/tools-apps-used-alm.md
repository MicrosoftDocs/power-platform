---
title: "Overview of tools and apps used for ALM in Power Platform"
description: "Learn about the tools and apps used for application lifecycle management (ALM) in Power Platform."
author: Mattp123
ms.subservice: alm
ms.author: matp
ms.custom: ""
ms.date: 02/06/2025
ms.reviewer: "matp"
ms.topic: "overview"
search.audienceType: 
  - maker
---
# Overview of tools and apps used for ALM

This article gives a brief overview of the tools and apps used for application lifecycle management (ALM) in Microsoft Power Platform. These categories are categorized for the specific audience or persona.

## Tools and apps used by admins and makers

Administrators and makers use the following tools for implementing ALM in Power Platform.

### Power Platform admin center

The [Power Platform admin center](https://admin.powerplatform.microsoft.com) provides a unified portal for administrators to manage environments and settings
for Power Apps, Power Automate, and model-driven apps in Dynamics 365 (such as Dynamics 365 Sales and Dynamics 365 Customer Service). From the admin center,
administrators can manage environments, data integration, gateways, data policies, and get key Power Platform metrics through Microsoft Dataverse analytics, Power Automate analytics, and Power Apps analytics.

More information:

- [Overview of the Power Platform admin center](../admin/admin-documentation.md)
- [Administer Power Apps](../admin/admin-guide.md)
- White paper: [Administering a low-code development platform](https://aka.ms/powerappsadminwhitepaper)

### Power Apps

[Power Apps](https://make.powerapps.com) is part of a suite of apps, services, connectors, and data platform that provides a rapid application development
environment to build custom apps for your business needs. Using Power Apps, you quickly build custom business apps that connect to your business data stored
either in the underlying data platform (Dataverse) or in various online and on-premises data sources, such as Microsoft 365, Dynamics 365, SQL Server, and so on.

More information: [What is Power Apps?](/powerapps/powerapps-overview)

### Configuration Migration Tool

The Configuration Migration Tool enables you to move configuration and/or reference data across environments. Configuration and reference data is different from user and transactional data and is used to define custom functionality in apps based on Dataverse. More information: [Move configuration data across environments and organizations with the Configuration Migration Tool](../admin/manage-configuration-data.md)

> [!NOTE]
> The Configuration Migration Tool is best suited for migrating relational configuration data. [Environment variables](/powerapps/maker/data-platform/environmentvariables) are recommended for storing and migrating nonrelational configuration parameters.

### PowerShell modules

With PowerShell cmdlets for administrators, app makers, and developers, you can automate many of the monitoring, management, and quality assurance tasks that
are only possible manually today in Power Apps or the Power Platform admin center.

More information: [Manage solutions using PowerShell](powershell-api.md)

## Pipelines

With Power Platform pipelines, admins create and configure pipelines so makers can use them to deploy solutions to environments with a single choice.

More information: [Overview of Power Platform pipelines (preview)](pipelines.md)

## Tools and apps used by developers

Developers use the following tools and apps for implementing ALM in Power Platform.

### DevOps

DevOps is the combining of two historically disparate disciplines: software development and IT operations. The primary goal of DevOps is to shorten
the software development lifecycle and provide continuous integration and continuous delivery (CI/CD) with high software quality. You use Power Apps
build tools to automate common build and deployment tasks related to Power Apps if your DevOps platform is Azure DevOps. This includes synchronization of
solution metadata between development environments and your version control system, generating build artifacts, deploying to downstream environments,
provisioning or deprovisioning of environments, and the ability to perform static analysis checks against your solution by using the Power Apps checker
service.

More information: [Microsoft Power Platform Build Tools for Azure DevOps overview](/powerapps/developer/common-data-service/build-tools-overview)

### Version control system

A version control system is a category of software tools that help record changes to files by keeping track of changes committed to software code. A
version control system is a database of changes, which contains all the edits and historical versions of a software project. Version control systems allow you
to maintain a single "source of truth" and recall specific versions when needed. Git is a popular example of a version control system.

> [!IMPORTANT]
> Notice that *source control* applies both to [Dataverse solutions](/powerapps/developer/common-data-service/introduction-solutions) and
> "traditional" source code. Dataverse solutions should always be part of the source code and never stored solely in Microsoft Power Platform environments.
>
> More information: [Getting started: What is Git?](https://git-scm.com/book/en/v2/Getting-Started-What-is-Git%3F)

### Package Deployer

Package Deployer lets administrators or developers deploy comprehensive packages of relevant assets to Dataverse instances. Packages can consist of not only solution files, but also flat files, custom code, and HTML files. Common Data Service provides you with a Visual Studio template for creating these packages
that can be used with the Package Deployer tool or with PowerShell to deploy them to a Common Data Service instance.

More information: [Create packages for the Package Deployer](/powerapps/developer/common-data-service/package-deployer/create-packages-package-deployer)

### Solution Packager

Solution Packager is a tool that can unpack a compressed solution file into multiple XML files and other files, so they can be easily managed by a source control system.

More information: [Use the Solution Packager tool to compress and extract a solution file](solution-packager-tool.md)

### Power Platform CLI

Microsoft Power Platform command line interface (CLI) is a simple, single-stop developer command-line interface that empowers developers and app makers to create code components.

More information: [What is Microsoft Power Platform CLI?](/power-platform/developer/cli/introduction)

### See also

[Implementing healthy ALM](implement-healthy-alm.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
