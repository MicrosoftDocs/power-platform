---
title: Use the ALM Accelerator with Power Pages sites
description: Learn how to use the ALM Accelerator for Power Platform to apply source-control strategies and automate builds and deployment for your Power Pages sites. 
ms.topic: how-to
ms.date: 08/18/2025
ms.subservice: guidance-toolkit
author: rajeevpentyala
ms.author: grarchib
ms.reviewer: jhaskett-msft
ms.custom:
  - bap-template
  - sfi-image-nochange
---

# Use the ALM Accelerator with Power Pages sites

Makers can use ALM Accelerator components to apply source control strategies with Azure DevOps, including fully automated builds and deployments, without needing intimate knowledge of downstream technologies or manual intervention by the maker, administrator, developer, or tester. You can switch quickly from developing to source-controlling solutions and, ultimately, push apps to other environments with as few interruptions to your work as possible.

With the ALM Accelerator, you can source-control your Power Pages websites, transport them to downstream environments, and include them during solution commits.

## Prerequisites for Power Pages website ALM

- Active [Power Pages](/power-pages/introduction) site.
- [ALM Accelerator for Power Platform app](overview.md).

## Include a website when you commit a solution

1. In the ALM Accelerator app, on the **COMMIT SOLUTION** pane, select **Include Power Pages**.

1. Select the website from the **Website** list, and then select **COMMIT SOLUTION**.

   :::image type="content" source="media/setup-almacceleratorpowerplatform/IncludingPortalWebsite-solution-commit.png" alt-text="Screenshot of the Commit Solution pane in the ALM Accelerator, with the Include Power Apps setting and website highlighted.":::

   After the commit succeeds, the website components are contained in a folder named *{SolutionName}\PowerPages\{SiteName}* under the repository branch.

## Upload changes using a deployment profile

When you work with multiple environments, consider using deployment profiles to make sure your changes are uploaded to the correct environment. You can provide deployment profiles to the ALM Accelerator in either of two ways: upload a deployment profile or add it to the solution branch.

### Upload deployment profiles in the deployment settings

1. In the ALM Accelerator app, open a solution's deployment settings.

1. Select an environment, and then select the **Power Pages** tab.

1. Find and select the YAML file that contains the deployment profile.

1. Select **Upload File**.

:::image type="content" source="media/setup-almacceleratorpowerplatform/upload-deployment-profile-yml-files.png" alt-text="Screenshot of uploading a deployment profile.":::

### Add deployment profiles to the solution branch

1. Commit the solution and [include the Power Pages website](#include-a-website-when-you-commit-a-solution).

1. Open the solution branch.

1. Create a folder named *deployment-profiles* in the **PowerPages** > **Website** folder.

1. In the *deployment-profiles* folder, create a deployment YAML file that contains environment-specific changes. The file name must start with your environment name; for example, *dev.deployment.yml* or *validation.deployment.yml*.

   :::image type="content" source="media/setup-almacceleratorpowerplatform/deployment-profile-yml-files.png" alt-text="Screenshot of the folder structure for Power Pages website deployment profiles.":::

When the *deployment-profiles* folder is present in your repository, the ALM Accelerator automatically looks for the appropriate profile during deployment.

## Upload a website to downstream environments

Use the **DEPLOY SOLUTION** option in the [ALM Accelerator app](overview.md) to upload a Power Pages website to your downstream environments.

## Complete website setup after deployment

Update the website record after the site has been deployed to your downstream environments.

1. Open the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and select the downstream environment.

1. Under **Resources**, select **Power Pages sites**.

1. On the **Power Pages sites** page, select the website, and then select **Manage**.

1. In the **Site Details** section, select **Edit**.

1. In the **Website Record** list, select the website that was transported from your maker or development environment.

1. Select **Save**.

## Clear the configuration cache

If your changes aren't reflected on the website after deployment, clear the configuration cache. You can clear the cache in a couple of ways.

### Restart the portal in the Power Apps portal admin center

If you're an administrator, this option is the easiest.

1. Open the **[Power Apps portals admin center](/power-apps/maker/portals/overview)**.

1. Navigate to **Portal Actions** > **Restart**.

### Clear the cache on the service page

Site administrators can use this method. It requires more setup and planning but is the safest way to clear the configuration cache.

1. Authenticate to the site.

1. Assign the Administrator Web role to the resulting contact record.

1. In your web browser, navigate to the **{site URL}/_services/about** page.

1. Select **Clear cache**.

1. Refresh the website in your browser to see the changes.

## Related information

- [Learn more about deployment profiles in the portal CLI documentation](../../developer/cli/reference/paportal.md)
