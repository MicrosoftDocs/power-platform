---
title: "Configuring and using the ALM accelerator for Power Apps portal and Power Pages | MicrosoftDocs"
description: "Committing Power Apps Portal/Power Pages website can be achieved by including the website during solution commit. This document describes how to commit Power Apps Portal/Power Pages website and deploy to test environments."
author: rajeevpentyala
manager: devkeydet
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/14/2022
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

# Configuring and using the ALM accelerator for Power Apps portal and Power Pages

> [!NOTE]
> The ALM accelerator for Microsoft Power Platform is currently in public preview. Go to [our GitHub repo](https://github.com/microsoft/coe-starter-kit/blob/main/CenterofExcellenceALMAccelerator/PREVIEW.md) to see the items to be completed prior to general availability.

The application lifecycle management (ALM) accelerator components enable makers to apply source-control strategies with Azure DevOps and use automated builds and deployment of solutions to their environments without the need for manual intervention by the maker, administrator, developer, or tester. In addition, the ALM accelerator helps makers work without intimate knowledge of downstream technologies and switch quickly from developing solutions to source-controlling the solution and, ultimately, pushing their apps to other environments with as few interruptions to their work as possible.

With the ALM Accelerator, you can source control your Power Apps portal or Power Pages websites, transport them to downstream environments, and include them during solution commit.

## Prerequisites for Power Apps portal or Power Pages website ALM

- An active website created using [Power Apps portals](/power-apps/maker/portals/overview) or [Power Pages](/power-pages/introduction).
- [ALM accelerator for Power Platform app](almacceleratorpowerplatform-components.md)

## Include the website during solution commit

Follow these steps to include Power Apps portal or Power Pages website during solution commit:

1. During the solution commit, on the **COMMIT SOLUTION** pane, enable **Include Power Apps Portal/Power Pages**.
1. Select the website from the **Website** list and select **COMMIT SOLUTION**.

   :::image type="content" source="media/setup-almacceleratorpowerplatform/IncludingPortalWebsite-solution-commit.png" alt-text="Include Power Apps portal or Power Pages website":::
   
1. After the commit is successful, a folder with downloaded website contents with convention "Solution_name\PowerPages\Site_Name" gets created under the Repository branch.

   ![Power Apps Portal/Power Pages Website commit.](media/setup-almacceleratorpowerplatform/Portal-Committed-Website.png)

## Upload website to downstream environments

No other steps are required to upload Power Apps Portal or Power Pages website to downstream environments. Use the [ALM accelerator for Power Platform app](almacceleratorpowerplatform-components.md) **DEPLOY SOLUTION** option to upload the website to your downstream environments.

## Complete website setup post deployment

Follow these steps to update the website binding once the website has been deployed to your downstream environments:

1. Open **Power Apps portals admin center**. More information: [Steps to open Power Apps portals admin center](/power-apps/maker/portals/overview)
1. Under **Update Portal Bindings**, select the website that got transported from your maker/dev environment and select **Update**.

   :::image type="content" source="media/setup-almacceleratorpowerplatform/Portal-Update-Bindings.png" alt-text="Power Apps portal or Power Pages website update binding":::
   
## Be aware of configuration cache

If your changes aren't reflected on the website post deployment, you'll need to clear the configuration cache. There are multiple options to clear the configuration cache.

### Restart the portal in the Power Apps portal admin center

If you're an administrator, this is the easiest option.

1. Open **[Power Apps portals admin center](/power-apps/maker/portals/overview)**.
1. Navigate to **Portal Actions** > **Restart**.

### Service page for site administrator users

This requires more setup and planning but is the safest option.

1. Authenticate to the site and assign the resulting contact record the Administrator Web Role. Navigate to the Site URL + **/_services/about** in your web browser where you can select the **Clear cache** button.

   :::image type="content" source="media/setup-almacceleratorpowerplatform/Portal-Clear-Cache.png" alt-text="Power Apps portal or Power Pages website clear cache":::   

1. Refresh the website in your browser to see the changes.
