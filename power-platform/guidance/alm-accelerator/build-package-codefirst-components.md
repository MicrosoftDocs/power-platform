---
title: "Using the ALM accelerator to build and package code-first components | MicrosoftDocs"
description: "With the ALM Accelerator, you can source control your code-first components (that is, Plug-ins, PCF Controls), build and run unit test cases, and transport them to downstream environments."
author: rajeevpentyala
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/10/2023
ms.subservice: guidance
ms.author: rajeevpe
ms.reviewer: sericks
---

# Using the ALM accelerator to build and package code-first components

ALM Accelerator components enable makers to apply source control strategies with Azure DevOps. ALM acceslerator components use automated builds and deployment of solutions to their environments without the need for manual intervention by the maker, administrator, developer, or tester. In addition, the ALM accelerator helps makers work without intimate knowledge of downstream technologies. You can switch quickly from developing solutions to source-controlling the solution and, ultimately, push apps to other environments with as few interruptions to your work as possible.

With the ALM accelerator, you can source control your code-first components (that is, Plug-ins and PCF Controls), build and run unit test cases, and transport them to downstream environments.

## Recommended repository folder structure for code-first components

 To build and deploy code-first components, it's recommended to have the following folder structure in your repository:

 :::image type="content" source="media/alm-code-first-folder-structure.png" alt-text="ALM code first folder structure":::

 In the above diagram, **cat-codefirst** is the repository name and **CreatorKit** is the Dataverse solution name.

## Setting up a plug-in project for the first time

Follow these steps to set up a plug-in project for the first time.

1. [Install Power Platform CLI](/power-platform/developer/cli/introduction).
1. Trigger the [pac plugin init command](/power-platform/developer/cli/reference/plugin).
1. The [pac plugin init command](/power-platform/developer/cli/reference/plugin) generates a folder structure, as shown in the following image.
   :::image type="content" source="media/aa4pp-pac-plugins-init.png" alt-text="Pac plugin init folder structure":::
1. Continue adding your plug-in, class files to the folder structure.

## Migrate legacy plug-in projects

Follow these steps to migrate your legacy plug-in projects to the new folder structure.

1. [Install Power Platform CLI](/power-platform/developer/cli/introduction).
1. Trigger [pac plugin init command](/power-platform/developer/cli/reference/plugin).
1. The [pac plugin init command](/power-platform/developer/cli/reference/plugin) generates a folder structure.
1. Copy the legacy, plug-in project files to the new folder structure.

## Setting up PCF projects

No other steps are required for setting up PCF projects. You can continue adding your PCF controls to the folder structure (that is, Repository Name\Solution Name\PCF).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
