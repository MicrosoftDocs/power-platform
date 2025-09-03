---
title: "Set up the Creator Kit | MicrosoftDocs"
description: "Prerequisites and instructions for installing the Creator Kit."
author: denise-msft
ms.component: pa-maker
ms.topic: install-set-up-deploy
ms.date: 05/16/2022
ms.subservice: guidance-toolkit
ms.author: demora
ms.reviewer: tapanm
search.audienceType: 
  - maker
contributors:
  - tapanm-msft
  - slaouist
---
# Install the Creator Kit

There are two ways to install the Creator Kit: 

1. Download and manually install the managed solutions
2. Install the solution directly into your Environment from AppSource

## Prerequisites

- A [Microsoft Power Platform environment with a Dataverse database](/power-platform/admin/create-environment#create-an-environment-with-a-database)
- The [Power Apps code components for Canvas apps feature enabled](/power-apps/developer/component-framework/component-framework-for-canvas-apps#enable-the-power-apps-component-framework-feature) (the System Administrator security role is needed to enable the feature).
- The System Customizer security role is needed to use the Creator Kit components.
- A Power Apps for Microsoft 365 license.

## Option 1: Manually install the solutions

To download and manually install the managed solutions for the Creator Kit, follow the steps below.

### Step 1: Install the Creator Kit solution

1. [Download the CreatorKitCore solution](https://aka.ms/creatorkitdownload).

2. Ensure the [Power Apps code components for Canvas apps feature](/power-apps/developer/component-framework/component-framework-for-canvas-apps#enable-the-power-apps-component-framework-feature) is enabled in the [Environment settings](/power-platform/admin/edit-properties-environment).

3. In [Power Apps](https://make.powerapps.com), select your Microsoft Power Platform environment.

4. Import the solution (learn how to [Import solutions](/power-apps/maker/data-platform/import-update-export-solutions)).


### Step 2: Install the reference solutions (optional)
The reference solutions can optionally be installed after the `CreatorKitCore` solution is installed (just like any app made with Creator Kit components). 

Each solution has specific requirements:

| Solution | Notes |
|-|-|
| [`CreatorKitReference(MDA)`](https://aka.ms/creatorkitreferencemda) | <li>Reference App is a Model Driven app that requires a premium license to play</li><li>Reference App uses the Dataverse connector; Environment's data policies must allow the connector.</li> |
| [`CreatorKitReference(Canvas)`](https://aka.ms/creatorkitreferencecanvas) | <li>Before installation, [enable the Environment setting 'Power Apps code components for canvas apps'](/power-apps/developer/component-framework/component-framework-for-canvas-apps#enable-the-power-apps-component-framework-feature)</li> |

- [Download the CreatorKitMDA solution](https://aka.ms/creatorkitreferencemda)
- [Download the CreatorKitCanvas solution](https://aka.ms/creatorkitreferencecanvas)

### Upgrading
Import the updated solution to install the latest version manually. Get the latest version at https://aka.ms/CreatorKitLatestRelease.

## Option 2: Install from AppSource

The AppSource package will install the latest version of the following managed solutions from Creator Kit into your selected Environment:
- CreatorKitCore
- CreatorKitReference(Canvas)
- CreatorKitReference(MDA)

The following configurations will be modified in the environment:
- *Enable code components for Canvas* is set to **true**

> [!IMPORTANT]
> Using this AppSource install option will **modify the selected Environment's settings**. Ensure this modification is acceptable with your organization's security standards before continuing with this install option.

### Method 1: Power Platform CLI
Install the AppSource package using the [Power Platform cli](/power-platform/developer/cli/introduction) ([How to find your Environment Id and Url](/power-platform/admin/determine-org-id-name#find-your-environment-and-organization-id)).

1. Create or select an auth profile (see [pac auth](/power-platform/developer/cli/reference/auth) for instructions)

1. Use [`pac application install`](/power-platform/developer/cli/reference/application) to install the `CreatorKitCore` option:

   `pac application install --environment-id 00000000-0000-0000-0000-000000000000 --application-name CreatorKitCore`

   or

   `pac application install --environment https://orgname.crm.dynamics.com/ --application-name CreatorKitCore`
   
### Method 2: AppSource install wizard
The offering page on the AppSource website allows you to install the Creator Kit into your Environment through a wizard experience.

1. Go to the [Creator Kit page on AppSource](https://appsource.microsoft.com/en-US/product/dynamics-365/microsoftpowercatarch.creatorkit1?tab=Overview) page. 

   Sign in to an account that has System Administrator permissions in the target Environment.

1. Select the button **Get it now**. 

   If prompted, confirm your details and select the **Get it now** button again to continue. Microsoft will not contact you regarding the Creator Kit by submitting this form.

   The App Source install experience will launch the Power Platform admin center and ask you to identify the target Environment.

1.  Choose the target Environment, review and agree to the two agreement checkboxes, then select the **Install** button to continue.


> [!div class="nextstepaction"]
> [Next step: Learn how to use the kit](creator-kit-explained.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
