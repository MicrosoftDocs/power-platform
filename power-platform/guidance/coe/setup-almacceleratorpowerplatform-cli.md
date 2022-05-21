---
title: "Set up the ALM accelerator for Microsoft Power Platform components | MicrosoftDocs"
description: "The ALM accelerator for Microsoft Power Platform will help you follow ALM patterns and practices to source-control and move your solutions from your development environment to test and production environments with Azure DevOps. This guide will walk through the setup of the accelerator by using the Center of Excellence CLI"
author: jenschristianschroder 
manager: devkeydet
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/14/2021
ms.subservice: guidance
ms.author: jeschro 
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
> The ALM accelerator for Microsoft Power Platform is currently in public preview. While in preview we will be prioritizing feedback and bugs via GitHub [New issue](https://github.com/microsoft/coe-starter-kit/labels/alm-accelerator). If the issue is something in the platform all we can do is funnel feedback to the responsible product teams. For more information on the current preview status of the ALM Accelerator for Power Platform [follow this link](https://github.com/microsoft/coe-starter-kit/blob/main/CenterofExcellenceALMAccelerator/PREVIEW.md).

The application lifecycle management (ALM) accelerator components enable makers to apply source-control strategies with Azure DevOps, and use automated builds and deployment of solutions to their environments without the need for manual intervention by the maker, administrator, developer, or tester. In addition, the ALM accelerator helps makers work without intimate knowledge of downstream technologies and switch quickly from developing solutions to source-controlling the solution and, ultimately, pushing their apps to other environments with as few interruptions to their work as possible.

The ALM accelerator doesn't have a dependency on other components of the CoE Starter Kit. It can be used independently.

## Set up the ALM accelerator by using the CoE CLI

The following articles guide you through setting up the Center of Excellence (CoE) CLI and using the CoE CLI to install the ALM accelerator in your tenant.

1. [CoE CLI installation](./cli/install.md): How to install the CoE CLI by using a local host computer or via a Docker container.

1. [Set up ALM accelerator for Power Platform](./cli/alm/admin-install.md): Use CLI commands to set up and configure an environment for the ALM accelerator, to enable makers to achieve more within your organization.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
