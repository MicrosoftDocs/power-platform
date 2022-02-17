---
title: "Set up the ALM accelerator for Microsoft Power Platform components | MicrosoftDocs"
description: "The ALM accelerator for Microsoft Power Platform will help you follow ALM patterns and practices to source-control and move your solutions from your development environment to test and production environments with Azure DevOps. This guide will walk through the setup of the accelerator by using the Center of Excellence CLI"
author: mikefactorial
manager: devkeydet

ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/14/2021
ms.subservice: guidance
ms.author: v-mikeochs
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Set up the ALM accelerator for Microsoft Power Platform components (preview)

> [!NOTE]
> The ALM accelerator for Microsoft Power Platform is currently in public preview. Go to [Issues currently tagged as vnext](https://github.com/microsoft/coe-starter-kit/issues?q=is%3Aopen+is%3Aissue+label%3Aalm-accelerator+label%3Avnext) for the roadmap to be completed prior to general availability. While the tool is in public preview, there will be breaking changes and frequent updates to address feedback from preview members. Additionally, the public preview is reliant on the experimental [Power Apps Source File Pack and Unpack Utility](https://github.com/microsoft/PowerApps-Language-Tooling) that's being developed separately from the ALM accelerator for Microsoft Power Platform.

The application lifecycle management (ALM) accelerator components enable makers to apply source-control strategies with Azure DevOps, and use automated builds and deployment of solutions to their environments without the need for manual intervention by the maker, administrator, developer, or tester. In addition, the ALM accelerator helps makers work without intimate knowledge of downstream technologies and switch quickly from developing solutions to source-controlling the solution and, ultimately, pushing their apps to other environments with as few interruptions to their work as possible.

The ALM accelerator doesn't have a dependency on other components of the CoE Starter Kit. It can be used independently.

## Set up the ALM accelerator by using the CoE CLI

The following articles guide you through setting up the Center of Excellence (CoE) CLI and using the CoE CLI to install the ALM accelerator in your tenant.

1. [CoE CLI installation](./cli/install.md): How to install the CoE CLI by using a local host computer or via a Docker container.

1. [Set up ALM accelerator for Power Platform](./cli/alm/admin-install.md): Use CLI commands to set up and configure an environment for the ALM accelerator, to enable makers to achieve more within your organization.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
