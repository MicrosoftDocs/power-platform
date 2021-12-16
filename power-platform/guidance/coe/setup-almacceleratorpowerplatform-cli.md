---
title: "Set up ALM Accelerator for Power Platform components | MicrosoftDocs"
description: "The ALM Accelerator for Power Platform will help you follow ALM patterns and practices to source control and move your solutions from your development environment to test and production environments using DevOps. This guide will walk through the setup of the Accelerator using the Center of Excellence CLI"
author: mikefactorial
manager: devkeydet
ms.service: power-platform
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

# Set up ALM Accelerator for Power Platform components (Preview)

> [!NOTE]
> ALM Accelerator for Power Platform (AA4PP) is currently in public preview. Please see [Issues currently tagged as vnext](https://github.com/microsoft/coe-starter-kit/issues?q=is%3Aopen+is%3Aissue+label%3Aalm-accelerator+label%3Avnext) for the Roadmap to be completed prior to general availability. While the tool is in Public Preview, you should expect that there will be breaking changes and frequent updates to address feedback from preview members. Additionally, the Public Preview is reliant on the experimental [Power Apps Source File Pack and Unpack Utility](https://github.com/microsoft/PowerApps-Language-Tooling) that is being developed separately from AA4PP.

The ALM Accelerator components enable makers to apply source control strategies using DevOps and use automated builds and deployment of solutions to their environments without the need for manual intervention by the maker, administrator, developer, or tester. In addition, the ALM Accelerator helps makers work without intimate knowledge of the downstream technologies and switch quickly from developing solutions to source controlling the solution and ultimately pushing their apps to other environments with as few interruptions to their work as possible.

The ALM Accelerator components solution doesn't have a dependency on other components of the CoE Starter Kit. It can be used independently.

## Setting Up the ALM Accelerator using the CoE CLI

The following will guide you through setting up the Center of Excellence CLI and using the CoE CLI to install the ALM Accelerator in your tenant.

1. [Install CoE CLI](./cli/install.md) - How to install the CoE CLI using local host computer or via a docker container.

1. [Set up ALM Accelerator for Power Platform using CoE CLI](./cli/alm/admin-install.md) - Use CLI commands to set up and configure an environment for ALM Accelerator to enable them to achieve more within your organization.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
