---
title: "Overview of tools and apps used with application lifecycle management (ALM) in Power Platform | Microsoft Docs"
description: "Learn about the tools and apps used with application lifecycle management (ALM) in Power Platform"
keywords: 
author: Mattp123
ms.author: matp
manager: kvivek
ms.custom: ""
ms.date: 05/05/2020
ms.reviewer: ""
ms.service: powerapps
ms.topic: "article"
search.audienceType: 
  - maker
search.app: 
  - PowerApps
  - D365CE
---

# Overview of tools and apps used with ALM

This article gives a brief overview of the tools and apps used with application lifecycle management (ALM). 

## Power Platform admin center
The [Power Platform admin center](https://admin.powerplatform.microsoft.com)
provides a unified portal for administrators to manage environments and settings
for Power Apps, Power Automate, and model-driven apps in Dynamics 365 (such as
Dynamics 365 Sales and Dynamics 365 Customer Service). From the admin center,
administrators can manage environments, data integration, gateways, data policies,
and get key Microsoft Power Platform metrics through Microsoft Dataverse analytics, Power Automate analytics, and Power Apps analytics.

More information:

-   [Power Platform admin center capabilities](https://docs.microsoft.com/power-platform/admin/admin-documentation#power-platform-admin-center-capabilities)
-   [Administer Power Apps](https://docs.microsoft.com/power-platform/admin/admin-guide)
-   White paper: [Administering a low-code development platform](https://aka.ms/powerappsadminwhitepaper)

## Power Apps
[Power Apps](https://make.powerapps.com) is part of a suite of apps, services,
connectors, and data platform that provides a rapid application development
environment to build custom apps for your business needs. Using Power Apps, you
can quickly build custom business apps that connect to your business data stored
either in the underlying data platform (Dataverse) or in various
online and on-premises data sources, such as Microsoft 365,
Dynamics 365, SQL Server, and so on. More information: [What is Power Apps?](/powerapps/powerapps-overview)

## DevOps
DevOps is the combining of two historically disparate disciplines:
software development and IT operations. The primary goal of DevOps is to shorten
the software development lifecycle and provide continuous integration and
continuous delivery (CI/CD) with high software quality. You can use Power Apps
build tools to automate common build and deployment tasks related to Power Apps
if your DevOps platform is Azure DevOps. This includes synchronization of
solution metadata between development environments and your version control
system, generating build artifacts, deploying to downstream environments,
provisioning or de-provisioning of environments, and the ability to perform
static analysis checks against your solution by using the Power Apps checker
service. More information: [Microsoft Power Platform Build Tools for Azure DevOps overview](/powerapps/developer/common-data-service/build-tools-overview)

## Version control system 
A version control system is a category of software tools that help record
changes to files by keeping track of changes committed to software code. A
version control system is a database of changes, which contains all the edits
and historical versions of a software project. Version control systems allow you
to maintain a single "source of truth" and recall specific versions when needed.
Git is a popular example of a version control system.

> [!IMPORTANT]
> Notice that *source control* applies both to [Dataverse solutions](https://docs.microsoft.com/powerapps/developer/common-data-service/introduction-solutions) and
> "traditional" source code. Dataverse solutions should always be part of the source code
> and never stored solely in Microsoft Power Platform environments. More information:
> [Getting started: What is Git?](https://git-scm.com/book/en/v2/Getting-Started-What-is-Git%3F)

## Configuration Migration Tool
The Configuration Migration Tool enables you to move configuration and/or reference data across
environments. Configuration/reference data is different from user and transactional data and is used to
define custom functionality in apps based on Dataverse. More information: [Move configuration data across environments and organizations with the Configuration Migration Tool](https://docs.microsoft.com/power-platform/admin/manage-configuration-data)

## Package Deployer
Package Deployer lets administrators or developers deploy comprehensive packages of relevant
assets to Dataverse instances. Packages can consist of not only
solution files, but also flat files, custom code, and HTML files. Common Data
Service provides you with a Visual Studio template for creating these packages
that can be used with the Package Deployer tool or with PowerShell to deploy them to a Common Data
Service instance.  More information: [Create packages for the Package Deployer](/powerapps/developer/common-data-service/package-deployer/create-packages-package-deployer)


## Solution Packager
Solution Packager is a tool that can unpack a compressed solution file into
multiple XML files and other files, so they can be easily managed by
a source control system. More information: [Use the Solution Packager tool to compress and extract a solution file](solution-packager-tool.md)

## Power Apps CLI
Microsoft Power Apps CLI is a simple, single-stop developer command-line
interface that empowers developers and app makers to create code components.
More information: [What is Microsoft Power Apps CLI?](/powerapps/developer/common-data-service/powerapps-cli)

## PowerShell modules
With PowerShell cmdlets for administrators, app makers, and developers, you can
automate many of the monitoring, management, and quality assurance tasks that
are only possible manually today in Power Apps or the Power Apps admin center.

-   [Online management API module](https://docs.microsoft.com/powershell/powerapps/get-started-onlinemanagementapi?view=pa-ps-latest). The online management API PowerShell module is used to manage Dataverse environments.

-   [Package deployment module](https://docs.microsoft.com/powershell/powerapps/get-started-packagedeployment?view=pa-ps-latest). The package deployment PowerShell module is used to deploy packages to Dataverse environments and Dynamics 365 Customer Engagement(on-premises) deployments.

-   [Power Apps checker module](https://docs.microsoft.com/powershell/powerapps/get-started-powerapps-checker?view=pa-ps-latest). The Power Apps checker PowerShell module interacts with the Power Apps checker service so you can run static analysis jobs and download the results.

More information: [Power Apps PowerShell overview](https://docs.microsoft.com/powershell/powerapps/overview?view=pa-ps-latest)

### See also
[Implementing healthy ALM](implement-healthy-alm.md)
