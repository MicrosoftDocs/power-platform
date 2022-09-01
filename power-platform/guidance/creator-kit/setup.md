---
title: "Set up the Creator Kit | MicrosoftDocs"
description: "Prerequisites and instructions for installing the Creator Kit."
author: denisem-msft
manager: devkeydet
ms.component: pa-maker
ms.topic: conceptual
ms.date: 05/16/2022
ms.subservice: guidance
ms.author: demora
ms.reviewer: tapanm
search.audienceType: 
  - maker
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
contributors:
  - tapanm-msft
  - slaouist
---
# Install the Creator Kit

## Prerequisites

- A [Microsoft Power Platform environment with a Dataverse database](/power-platform/admin/create-environment#create-an-environment-with-a-database)
- The [Power Apps code components for Canvas apps feature enabled](/power-apps/developer/component-framework/component-framework-for-canvas-apps#enable-the-power-apps-component-framework-feature) (the System Administrator security role is needed to enable the feature).
- The System Customizer security role is needed to use the Creator Kit components.
- A Power Apps for Microsoft 365 license.

## Install the Creator Kit solution

1. [Download the `CreatorKitCore` solution](https://aka.ms/creatorkitdownload).
2. Ensure the [Power Apps code components for Canvas apps feature](/power-apps/developer/component-framework/component-framework-for-canvas-apps#enable-the-power-apps-component-framework-feature) is enabled in the [Environment settings](/power-platform/admin/edit-properties-environment).
3. In [Power Apps](https://make.powerapps.com), select your Microsoft Power Platform environment.
4. Import the solution.


## Install the Reference solutions
The reference solutions can optionally be installed after the `CreatorKitCore` solution is installed:

Solution specific prerequisites:
| Solution | Notes |
|-|-|
|`CreatorKitReference (MDA)`|<li>Reference App is a Model Driven app that requires a premium license to play</li><li>Reference App uses the Dataverse connector; Environment's DLP Policies must allow the connector.</li> |
|`CreatorKitReference (Canvas)`|<li>Before installation, enable the Environment setting 'Power Apps code components for canvas apps'</li>|


> [!div class="nextstepaction"]
> [Next step: Learn how to use the kit](creator-kit-explained.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
