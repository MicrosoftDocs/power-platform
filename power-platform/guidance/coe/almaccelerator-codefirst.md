---
title: "Configuring and using the ALM accelerator for Plug-ins and PCF | MicrosoftDocs"
description: "Code first components (that is, Plug-ins, PCF controls) ALM using ALM accelerator for Microsoft Power Platform builds code first projects in the repository and packs as solutions. This document describes how to perform code first components ALM using ALM accelerator for Microsoft Power Platform."
author: rajeevpentyala
manager: devkeydet
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/04/2022
ms.subservice: guidance
ms.author: rajeevpe
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform 
---

# Using the ALM accelerator to build and package code first components

> [!NOTE]
> The application lifecycle management (ALM) accelerator for Microsoft Power Platform is currently in public preview. Go to [our GitHub repo](https://github.com/microsoft/coe-starter-kit/blob/main/CenterofExcellenceALMAccelerator/PREVIEW.md) to see the items to be completed prior to general availability.

The ALM accelerator components enable makers to apply source-control strategies with Azure DevOps and use automated builds and deployment of solutions to their environments without the need for manual intervention by the maker, administrator, developer, or tester. In addition, the ALM accelerator helps makers work without intimate knowledge of downstream technologies. You can switch quickly from developing solutions to source-controlling the solution and, ultimately, push apps to other environments with as few interruptions to your work as possible.

With the ALM Accelerator, you can source control your code first components (that is, Plug-ins, PCF Controls), build and run unit test cases, and transport them to downstream environments.

## Recommended repository folder structure for code first components

 To build and deploy code first components, it's recommended to have the following folder structure in your repository:
 
 :::image type="content" source="media/almacceleratorpowerplatform-components/alm-code-first-folder-structure.png" alt-text="ALM code first folder structure":::

 In the above diagram 'cat-codefirst' is the repository name and 'CreatorKit' is the dataverse solution name.

## Setting up a plug-in project for the first time

Follow these steps to set up a plug-in project for the first time:

1. [Install Power Platform CLI](/power-platform/developer/cli/introduction)
1. Trigger [pac plugin init command](/power-platform/developer/cli/reference/plugin)
1. pac plugin init generates a folder structure as below
   :::image type="content" source="media/almacceleratorpowerplatform-components/aa4pp-pac-plugins-init.png" alt-text="Pac plugin init folder structure":::
1. Continue adding your plugin class files to the folder structure

## Migrate legacy plug-in projects

Follow these steps to migrate your legacy plug-in projects to the new folder structure:

1. [Install Power Platform CLI](/power-platform/developer/cli/introduction)
1. Trigger [pac plugin init command](/power-platform/developer/cli/reference/plugin)
1. pac plugin init generates a folder structure.
1. Copy the legacy plug-in project files to the new folder structure

## Setting up PCF projects

No other steps required for setting up PCF projects. You can continue adding your PCF controls to the folder structure (that is, Repository Name\Solution Name\PCF).


[!INCLUDE[footer-include](../../includes/footer-banner.md)]

