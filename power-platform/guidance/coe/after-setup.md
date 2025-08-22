---
title: Update the Center of Excellence (CoE) Starter Kit
description: Learn how to upgrade, test, and manage new releases for the Power Platform Center of Excellence Starter Kit to keep your organization current.
author: stjeffer
ms.topic: how-to
ms.date: 08/22/2025
ms.subservice: guidance-toolkit
ms.author: stjeffer
ms.reviewer: jhaskett-msft
---

# Update the Center of Excellence (CoE) Starter Kit

This article helps you upgrade the CoE Starter Kit. It provides guidance on:

- How to stay up to date with the latest release.
- How often and why to apply upgrades.
- How to install the latest release.
- How to test the latest release.

> [!NOTE]
> If you're setting up the CoE Starter Kit for the first time, check out [Set up the CoE Starter Kit](setup.md). If you want to extend the CoE Starter Kit with your own customizations, consult our guidance for [extending the CoE Starter Kit](modify-components.md).

> [!IMPORTANT]
> We recommend upgrading the CoE Starter Kit solution at least **every three months**. With the fast pace of change for Power Platform, leaving updates longer than three months could result in unexpected issues when you update.

## How often new versions are released

A new version of the CoE Starter Kit is released monthly, usually in the first full week of each month. This release cadence is important to know so that you can review, organize, plan, and test the latest version.

Updates (bug fixes, enhancements, new features, and deprecations) are announced through [GitHub release notes](https://github.com/microsoft/coe-starter-kit/releases).

### GitHub release notes

Each release of the CoE Starter Kit includes release notes that detail bug fixes and enhancements that the release addresses. Review the release notes before you install the new version.

#### View release notes

To view the details of a release:

1. Navigate to the [CoE Starter Kit repository](https://github.com/microsoft/coe-starter-kit) in GitHub.
1. Select the [latest releases](https://github.com/microsoft/coe-starter-kit/releases) notes.

   :::image type="content" source="media/coe-upgrade5.png" alt-text="Screenshot showing where to find the latest release notes for the CoE Starter Kit.":::

Release notes contain a changelog of issues (bug fixes and enhancements) addressed by the new version. They might also include specific upgrade instructions that are new for the release. This information might cover turning on a new flow or notes on deprecated features.

#### Subscribe to CoE Starter Kit releases

Watch releases on our [GitHub repository](https://github.com/microsoft/coe-starter-kit) to get notifications about the latest release.

1. Sign in to your GitHub account.

1. Go to our [GitHub repository](https://github.com/microsoft/coe-starter-kit).

1. Select **Watch** > **Custom**.

    :::image type="content" source="media/github-watch1.png" alt-text="Screenshot showing how to select to watch the repository to receive notifications about new releases.":::
    
1. Select **Releases**.

     :::image type="content" source="media/github-watch2.png" alt-text="Screenshot showing how to check only to watch new releases.":::
     
1. Select **Apply**.

### How often should you update the CoE Starter Kit?

Consider these questions when deciding how often to update:

- Does the new release **resolve an issue** that you currently have?
- Does the new release **contain a new feature** that you want to try?
- Did you install your current version **more than three months** ago?

Because Microsoft Power Platform changes quickly, waiting more than three months to update can cause unexpected issues when you do update.

>[!TIP]
>Subscribe to release notes to review releases monthly.

## Install updates

The following section provides step-by-step instructions for installing the latest version of the CoE Starter Kit.

### Download the latest solution file

First, review the [latest release notes](https://github.com/microsoft/coe-starter-kit/releases).

Download the latest version of the CoE Starter Kit compressed file ([aka.ms/CoeStarterKitDownload](https://aka.ms/CoeStarterKitDownload)).

> [!IMPORTANT]
> Extract the zip file after downloading and before moving on to the next step. The CoE Starter Kit compressed file contains all solution components and non-solution aware components that make up the CoE Starter Kit.

### Remove unmanaged layers from inventory flows

Before installing the upgrade, check that the solution is in a healthy state to receive the new updates.

Making any changes to flows or apps in the solution creates an unmanaged layer. Components with unmanaged layers don't receive updates until you remove that unmanaged layer. Learn more in [Solution layers](/power-platform/alm/solution-layers-alm).

All flows with *Admin \| Sync Template v* in the name are responsible for collecting your tenant's inventory and building the foundation that the CoE Starter Kit relies on. Don't customize these flows. If you have extra requirements for what inventory to collect, raise a [feature ask](https://github.com/microsoft/coe-starter-kit/issues/new?assignees=&labels=coe-starter-kit%2Cenhancement&template=3-coe-starter-kit-feature.yml&title=%5BCoE+Starter+Kit+-+Feature%5D%3A+FEATURE+TITLE) or create your own flow. Learn more in [Extend and customize CoE Starter Kit components](modify-components.md).

Before installing the upgrade, remove unmanaged layers from the inventory flows.

>[!NOTE]
>You might unknowingly create an unmanaged layer by selecting **Edit** to look at flow actions or by modifying the run-only properties of the flow.

You can check for unmanaged layers on the inventory flows by using the [CoE Admin Command Center](core-components.md#coe-admin-command-center) app.

1. Open the **CoE Admin Command Center** app from your CoE environment.

1. Select **CoE flows** from the navigation menu.

1. Check if any of the flows show the layer icon, indicating they have unmanaged layers.

   :::image type="content" source="media/coe-upgrade6.png" alt-text="Screenshot showing the layer icon in the Admin Command Center app." lightbox="media/coe-upgrade6.png":::

1. Select the layer icon to go to the solution layer page of the flow and remove the unmanaged layer.

   :::image type="content" source="media/upgrade2.png" alt-text="Screenshot showing the Remove unmanaged layer action." lightbox="media/upgrade2.png":::

### Remove other customizations

You won't receive updates for any cloud flow or canvas app that you changed until you remove the unmanaged layer.

1. If you want to keep your changes, learn more about how to [extend the CoE Starter Kit](modify-components.md).

1. If you don't want to keep your changes, remove all unmanaged layers before the update. A component likely changed if the modified date is more recent than the latest install. 
 
    > [!TIP]
    > Read our recommendations for [extending the CoE Starter Kit](modify-components.md).
   
   1. Select the ellipsis (**...**) > **See solution layers**.

      :::image type="content" source="/power-platform/guidance/coe/media/upgrade1.png" alt-text="Screenshot showing where in the user interface to select the See solution layers option." lightbox="/power-platform/guidance/coe/media/upgrade1.png" :::

   1. Select **Remove unmanaged layer**.
        
      :::image type="content" source="/power-platform/guidance/coe/media/upgrade2.png" alt-text="Screenshot showing where in the user interface to select the Remove unmanaged layer option." lightbox="/power-platform/guidance/coe/media/upgrade2.png":::

## Import the new solution version

After you remove unmanaged layers, import the new solution version:

1. [Import the solution](faq.md#install-a-solution-in-a-production-environment).
 
1. Select **Upgrade** (default setting). [Solution upgrades](/power-platform/alm/solution-concepts-alm#solution-lifecycle) delete components that existed but aren't included in the upgraded version.
 
   :::image type="content" source="media/coe-upgrade1.png" alt-text="Screenshot of the Import a solution pane with the Upgrade action highlighted.":::
    
1. If the upgrade adds new environment variables or connection references, establish connections and update environment variable values. You can find the expected values in the [setup instructions](setup-core-components.md).
 
1. Wait for the upgrade to finish. 

    This process can take up to 15 minutes. During the upgrade, the new version is installed first and then the old version is deleted. While the upgrade is processing, you might see two solutions with the same name in your solution explorer. Check the [solution history](/power-apps/maker/data-platform/solution-history#view-solution-history) to view the progress of the upgrade.
 
   :::image type="content" source="/power-platform/guidance/coe/media/coe-upgrade3.png" alt-text="Screenshot showing where to the check the solution history." lightbox="/power-platform/guidance/coe/media/coe-upgrade3.png":::
    
   The upgrade completes when the end time isn't empty.
 
   :::image type="content" source="/power-platform/guidance/coe/media/coe-upgrade2.png" alt-text="Screenshot showing how to check that the end time for the solution import is not empty." lightbox="/power-platform/guidance/coe/media/coe-upgrade2.png":::
    
1. If the [solution history](/power-apps/maker/data-platform/solution-history#view-solution-history) indicates that the upgrade failed,  [raise an issue](https://aka.ms/coe-starter-kit-issues) and [provide the solution operation error details](/powerapps/maker/data-platform/solution-history#view-solution-operation-error-details).
 
   :::image type="content" source="/power-platform/guidance/coe/media/coe-upgrade4.png" alt-text="Screenshot showing how to view solution operation error details." lightbox="/power-platform/guidance/coe/media/coe-upgrade4.png":::
 
1. After the solution import succeeds, open the **Center of Excellence - Core Components** solution.

1. Open the **CoE Setup and Upgrade Wizard**.

    This app provides a guided step-by-step experience through the configuration steps. During an upgrade, it shows the solution history, any components with unmanaged layers, and any new apps, flows, and environment variables that have been added during this upgrade.

1. When you finish this step, move on to [testing](#test-strategy).

## Update the Audit Log solution

Upgrading the solution requires re-establishing connections to custom connectors. If you're using the Audit Log solution, [reset the connection](https://github.com/microsoft/coe-starter-kit/issues/1424) to the custom connector.

## Test strategy

As with installing any update, testing before installation in a production environment increases the likelihood of success.

> [!IMPORTANT]
> Testing is important as it provides you with an opportunity to try out new features and confirm bug fixes work as expected. Doing this in an isolated environment protects production versions.


Here are some recommendations:

- Create a dedicated testing environment.
- Install the same versions of the CoE Starter Kit in test and production environments.
- Install the same customizations in test and production environments.
- Document test patterns and expected outcomes. Make sure you cover all possible combinations that might fail.

Example test pattern:

| Reference | Test | Expected outcome | Result |
|-----------|------|------------------|--------|
| 1 | Enable: Admin - Sync Template v3 flow | Turn on successfully | Pass |
| 2 | Launch: CoE Admin Command Center | App successfully launches | Pass |

### Test with users

When you complete your functional tests, run final tests with users of the CoE Starter Kit. This testing helps ensure that your update doesn't introduce unexpected results.

### If you have an issue

If you find a bug or an issue when testing, you can [raise a bug here](https://github.com/microsoft/coe-starter-kit/issues/new?assignees=Jenefer-Monroe&labels=coe-starter-kit%2Cbug&template=1-coe-starter-kit-bug.yml&title=%5BCoE+Starter+Kit+-+BUG%5D+ISSUE+TITLE). Be sure to provide the [solution operation error](/powerapps/maker/data-platform/solution-history#view-solution-operation-error-details) details.

## Application lifecycle management

This article doesn't cover application lifecycle management (ALM) in detail. If you're interested in recommendations and scenarios, review [Overview of application lifecycle management with Microsoft Power Platform](/power-platform/alm/overview-alm). ALM covers many disciplines. This document touches lightly on the discipline of deploying solutions.

### ALM Accelerator for Power Platform

The [ALM Accelerator for Power Platform](almacceleratorpowerplatform-components.md) is a reference implementation that sits on top of Azure Pipelines and Git source control. The ALM Accelerator includes a canvas app that provides a simplified interface for makers to regularly export components in solutions to source control and create deployment requests.

### Microsoft Power Platform Build Tools

The [Microsoft Power Platform Build Tools for Azure DevOps Services](/power-platform/alm/devops-build-tools?msclkid=147921b0c15611ecbb1fdca93966d349) automate common build and deployment tasks. You can use them with any other Azure DevOps tasks to compose build and release pipelines.

[Download](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.PowerPlatform-BuildTools&msclkid=d4b015ebc16e11ecb673fbfc869800f3) the tools, and refer to the [tasks documentation](/power-platform/alm/devops-build-tool-tasks) to get started.
