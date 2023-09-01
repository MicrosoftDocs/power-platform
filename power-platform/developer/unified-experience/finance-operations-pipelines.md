---
title: "Continuous integration and deployment (preview)"
description: Learn how to set up continuous integration and deployment using Azure Pipelines.
author: pvillads
ms.date: 08/31/2023
ms.topic: how-to
ms.reviewer: pehecke
ms.author: pvillads
ms.subservice: developer
---

# Continuous integration and deployment (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

This article explains how to implement continuous integration and deployment (CI/CD) of Power Platform unified developer experience assets using Azure Pipelines. You will find learn how to

- Get the latest Dynamics 365 Finance and Operations (link?) and [Power Platform Build Tools](../..//alm/devops-build-tools.md#get-microsoft-power-platform-build-tools).
- Create a build pipeline to generate a package in Power Platform unified package format
- Upload your solution and relevant artifacts using Nuget packages for the unified environment
- Link the generated package to the release pipeline for deployment.

## Install or update the latest build tools

1. Locate and install the “Dynamics 365 Finance and Operations Tools” shared extension under **Organization Settings -> Extensions**.
QUESTION: Where will I find this menu? Power Platform admin center?

1. Add a **Create Deployable Package** task in your build pipeline, and ensure it contains task version 1. Ensure Add Licenses to Deployable Package has task version 1. If you have tasks with same name then select "View Yaml" for the task to ensure it’s a preview task.
1.  Locate and install the “Power Platform Build Tools” extension from **Organization Settings -> Extensions -> Browse Marketplace**.
1. Download the X++ Nuget packages with the required version and add them to your artifact feed. For details on this step refer to [Build automation that uses Microsoft-hosted agents and Azure Pipelines - Finance & Operations](https://learn.microsoft.com/dynamics365/fin-ops-core/dev-itpro/dev-tools/hosted-build-automation).

## Create a pipeline to generate a Power Platform unified format package

The process for building your solution remains same, and can be based on preexisting build pipelines.

(IMAGE LINK 1)

1. To generate a Power Platform unified package, add your version 1 task to **Create Deployable Package**. Check the box for **Create Power Platform Unified Package**. Add the Platform and Application version used to build the solution, and provide the path for the deployable package location.
Optionally, you can choose to generate a separate Lifecycle Services format package.

(IMAGE LINK 2)

2. 

[!INCLUDE [footer-banner](../../includes/footer-banner.md)]