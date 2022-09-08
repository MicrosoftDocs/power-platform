---
title: "Using and Configuring the ALM accelerator for Microsoft Power Apps Portal/Power Pages | MicrosoftDocs"
description: "Committing Power Apps Portal/Power Pages website can be achieved by including the website during solution commit. This document describes how to commit Power Apps Portal/Power Pages website and deploy to test environments."
author: rajeevpentyala
manager: devkeydet

ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/08/2022
ms.subservice: guidance
ms.author: rajeevpe
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
  - PowerAppsPortals
  - PowerPages
---

# Power Apps Portal/Power Pages website ALM using ALM accelerator

> [!NOTE]
> The ALM accelerator for Microsoft Power Platform is currently in public preview. Go to [our GitHub repo](https://github.com/microsoft/coe-starter-kit/CenterofExcellenceALMAccelerator/PREVIEW.md) to see the items to be completed prior to general availability.

The application lifecycle management (ALM) accelerator components enable makers to apply source-control strategies with Azure DevOps and use automated builds and deployment of solutions to their environments without the need for manual intervention by the maker, administrator, developer, or tester. In addition, the ALM accelerator helps makers work without intimate knowledge of downstream technologies and switch quickly from developing solutions to source-controlling the solution and, ultimately, pushing their apps to other environments with as few interruptions to their work as possible.

Source controlling and transporting of Power Apps Portal/Power Pages website to downstream environments capability has been introduced in ALM accelerator. Users can now include the Power Apps Portal/Power Pages website during solution commit and same will be transported to downstream environments.

## Prerequisites for Power Apps Portal/Power Pages website ALM

- An active website of either Power Apps Portal/Power Pages. Go to [Power Apps portals](https://docs.microsoft.com/en-us/power-apps/maker/portals/overview) or [Power Pages](https://powerpages.microsoft.com/en-us/) to create a website.
- ALM accelerator for Power Platform app. Go to [ALM accelerator for Power Platform app](https://docs.microsoft.com/en-us/power-platform/guidance/coe/almacceleratorpowerplatform-components)

## Including Power Apps Portal/Power Pages website during solution commit

In the ALM accelerator for Power Platform app, to include Power Apps Portal/Power Pages website during solution commit, follow these steps:

1. During the solution commit, on the 'COMMIT SOLUTION' pane, toggle **Include Power Apps Portal/Power Pages** to **Enabled**.
1. Select the website from the **Website** dropdown and click on **COMMIT SOLUTION**

   ![Include Power Apps Portal/Power Pages Website .](media/setup-almacceleratorpowerplatform/IncludePortalWebsite-solution-commit.png)

1. Once the 'Commit' is successful, a folder with downloaded website contents with convention "Solution_name\PowerPages\Site_Name" gets created under the Repository branch.

   ![Power Apps Portal/Power Pages Website commit.](media/setup-almacceleratorpowerplatform/Portal-Committed-Website.png)

## Upload Power Apps Portal/Power Pages website to downstream environments

No additional steps required to upload Power Apps Portal/Power Pages website to downstream environments. Use the [ALM accelerator for Power Platform app](https://docs.microsoft.com/en-us/power-platform/guidance/coe/almacceleratorpowerplatform-components) **DEPLOY SOLUTION** option which will take care the upload of Power Apps Portal/Power Pages website to downstream environments.

## Complete Power Apps Portal/Power Pages website set up post deployment

Post deploying the Power Apps Portal/Power Pages website to downstream environments, update which website record the website runtime is by following these steps:

1. Open **Power Apps portals admin center**. [Steps to open Power Apps portals admin center](https://docs.microsoft.com/en-us/power-apps/maker/portals/overview)
1. Under the 'Update Portal Bindings', select the website which got transported from your maker/dev environment and click on **Update**

   ![Power Apps Portal/Power Pages Website update binding.](media/setup-almacceleratorpowerplatform/Portal-Update-Bindings.png)

## Be aware of Configuration Cache

Post Power Apps Portal/Power Pages website deployment, if the changes are not reflected on the website, we need to clear the cache.
To clear the configuration cache there are a few options:

### Restart the Portal in Portal Admin Center

1. This is easier for admins.
1. Open **Power Apps portals admin center**. [Steps to open Power Apps portals admin center](https://docs.microsoft.com/en-us/power-apps/maker/portals/overview).
1. Go to Portal Actions > Restart.

### Use Browse/Preview button in Studio

1. This is the easiest for makers and admins and minimum down time
1. Be careful not to change anything and close the tab with the Studio right away

### Service Page for site Administrator users

1. This requires more setup and planning but is likely the safest feature
1. To use Service Page you must authenticate to the site and resulting Contact record must have the Administrator Web Role. You can then go to the Site URL + "/_services/about" in your browser and will have an option click on 'Clear cache' button. Like so:

   ![Power Apps Portal/Power Pages Website clear cache.](media/setup-almacceleratorpowerplatform/Portal-Clear-Cache.png)

1. Refresh the website in your browser and you should see any changes.
