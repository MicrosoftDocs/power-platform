---
title: Build and package code-first components
description: Learn how to use the ALM Accelerator for Power Platform to source control your code-first components, build and run unit test cases, and transport them to downstream environments.
ms.component: pa-admin
ms.topic: how-to
ms.date: 04/10/2023
ms.subservice: guidance-toolkit
author: rajeevpentyala
ms.author: grarchib
ms.reviewer: sericks
ms.custom: bap-template
---

# Build and package code-first components

Makers can use ALM Accelerator components to apply source control strategies with Azure DevOps, including fully automated builds and deployments, without needing intimate knowledge of downstream technologies or manual intervention by the maker, administrator, developer, or tester. You can switch quickly from developing to source-controlling solutions and, ultimately, push apps to other environments with as few interruptions to your work as possible.

With the ALM Accelerator, you can source-control your code-first components&mdash;plug-ins and PowerApps component framework (PCF) controls&mdash;build and run unit test cases, and transport them to downstream environments.

## Recommended repository folder structure for code-first components

To build and deploy code-first components, we recommend you have a folder structure like the following example in your repository, where "CreatorKit" is the Dataverse solution name:

📁.vs  
📂CreatorKit  
&emsp;📁PCF  
&emsp;📁Plugins

## Set up a plug-in project

1. [Install Power Platform CLI](/power-platform/developer/cli/introduction).

1. Run the [**pac plugin init**](/power-platform/developer/cli/reference/plugin) command to generate a folder structure, as shown in the following image.

   :::image type="content" source="media/aa4pp-pac-plugins-init.png" alt-text="Screenshot of the folder structure after running the pac plugin init command in Power Platform CLI.":::

1. Add plug-in files to the folder structure.

If you have legacy plug-in projects, copy the project files to the new folder structure.

## Set up PCF projects

No other steps are required to set up PCF projects. Add your PCF controls to the *{solution name}\PCF* folder.

[!INCLUDE [footer-include](../../includes/footer-banner.md)]
