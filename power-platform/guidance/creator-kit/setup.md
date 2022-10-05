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


## Option 1: Download and manually install the managed solutions

### Step 1 - Install the Creator Kit solution

1. [Download the `CreatorKitCore` solution](https://aka.ms/creatorkitdownload).
2. Ensure the [Power Apps code components for Canvas apps feature](/power-apps/developer/component-framework/component-framework-for-canvas-apps#enable-the-power-apps-component-framework-feature) is enabled in the [Environment settings](/power-platform/admin/edit-properties-environment).
3. In [Power Apps](https://make.powerapps.com), select your Microsoft Power Platform environment.
4. Import the solution. More information: [Import solutions](/power-apps/maker/data-platform/import-update-export-solutions)


### Step 2 - Install the Reference solutions (optional)
The reference solutions can optionally be installed after the `CreatorKitCore` solution is installed.

Solution-specific prerequisites:

| Solution | Notes |
|-|-|
| [`CreatorKitReference(MDA)`](https://aka.ms/creatorkitreferencemda) | <li>Reference App is a Model Driven app that requires a premium license to play</li><li>Reference App uses the Dataverse connector; Environment's DLP Policies must allow the connector.</li> |
| [`CreatorKitReference(Canvas)`](https://aka.ms/creatorkitreferencecanvas) | <li>Before installation, enable the Environment setting 'Power Apps code components for canvas apps'</li> |

## Option 2: Install from AppSource

This will install the following managed solutions:
- CreatorKitCore
- CreatorKitReference(Canvas)
- CreatorKitReference(MDA)

The following configurations will be modified in the Environment:
- *Enable code components for Canvas* is set to **true**

> [!IMPORTANT]
> Using this AppSource install option will modify the selected Environment's settings. Ensure this automated modification is acceptable for your organization before continuing with this install option.

1. Go to the [Creator Kit page on AppSource](https://appsource.microsoft.com/en-US/product/dynamics-365/microsoftpowercatarch.creatorkit1?tab=Overview) page. 

   Make sure you're signed in to the account that has System Administrator permissions to the Environment you want to install the Creator Kit in.

1. Select the button **Get it now**. 

   If prompted, confirm your details and select the **Get it now** button again to continue. Microsoft will not contact you regarding the Creator Kit by submitting this form.

   The App Source install experience will launch the Power Platform admin center and ask you to identify the target Environment.

1.  Choose the target Environment, review and agree to the two agreement checkboxes, then select the **Install** button to continue.


> [!div class="nextstepaction"]
> [Next step: Learn how to use the kit](creator-kit-explained.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
