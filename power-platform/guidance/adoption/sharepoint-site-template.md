---
title: Get started with a SharePoint site template
description: Discover how to use the Power Platform communication site template to create a hub for collaboration, governance, and innovation.
#customer intent: As a Power Platform community manager, I want to deploy the Power Platform communication site template so that my organization can create a hub for collaboration and governance.  
author: manuelap-msft
ms.component: pa-admin
ms.topic: how-to
ms.date: 05/08/2025
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: jhaskett-msft
search.audienceType:
  - admin
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:03/28/2025
---

# Get started with a SharePoint site template

The Power Platform communication site template is a SharePoint site designed to provide you with a starting point of content and page templates as you set up your own internal Power Platform wiki and community site. The site is a place for your Power Platform community to find the news and resources they need, including information on digital governance and compliance guardrails, upcoming events, success stories, and more.

This article explains how to deploy the Power Platform communication site template and configure it for your organization. Get [tips on what to include in your SharePoint site](wiki-community.md#sharepoint-communication-site).

## Deploy the Power Platform communication site template

The Power Platform communication site template is a SharePoint Online template installed by running two PowerShell scripts. This section explains how to prepare and run the PowerShell scripts.

> [!NOTE]
> Your organization might restrict your ability to run PowerShell scripts. You might need to work with your SharePoint Online administration team to run the script.

### Download the assets

1. [Download](https://aka.ms/pphub-download) the Power Platform communication site template.
1. Extract the contents of the PowerPlatformHub.zip file.
1. Copy the path to the folder where you extracted the files. You need this path when you run the PowerShell scripts to deploy the template.

### Prerequisites

The scripts to deploy the Power Platform communication site template have a dependency on two PowerShell modules. To prepare:

1. [Download and install](/power-platform/admin/powerapps-powershell#installation) Microsoft.PowerApps.Administration.PowerShell.
1. [Download and install](https://pnp.github.io/powershell/articles/installation.html) PnP PowerShell.
1. [Register a Microsoft Entra ID application to use with PnP PowerShell](https://pnp.github.io/powershell/articles/registerapplication.html).

> [!TIP]
> The PowerShell commands in the PnP PowerShell module require Windows PowerShell version 7 or above.
> 
> Check the version of PowerShell running on your machine:
> 
> ```powershell
> $PSVersionTable.PSVersion
> ```

### Update the PowerShell script variables

The PowerShell scripts to deploy the Power Platform communication site template contain variables that you need to update to reflect your organization.

1. Open **Deploy-PowerPlatformHub.ps1** in the ISE (integrated scripting environment) of your choice.

    ```powershell
    $adminTenantName = 'contoso'
    $adminURL = 'https://' + $adminTenantName + '-admin.sharepoint.com'
    $companyName = 'Contoso'
    $lcid = 1033
    $newSiteURL = 'https://' + $adminTenantName + '.sharepoint.com/sites/powerplatformhub'
    $ownerEmail = 'owner@contoso.com'
    $siteTemplate = 'SITEPAGEPUBLISHING#0'
    $siteTitle = 'Power Platform Communication Site'
    $timeZone = 2
    ```

1. Update the following variables:

    - `$adminTenantName`: Enter the name of your SharePoint [root site](/sharepoint/modern-root-site#whats-the-root-site). For example, if your root site is *contoso*.sharepoint.com, enter *contoso*.
    - `$adminURL`: Enter the URL of your SharePoint Online admin center. For example, if your root site is *contoso*.sharepoint.com, enter `https://contoso-admin.sharepoint.com`.
    - `$companyName`: Enter your organization name. This name is used in the templates page navigation, page title, and sample pages.
    - `$lcid`: Enter a [locale ID](/openspecs/office_standards/ms-oe376/6c085406-a698-4e12-9d4d-c3b0ee3dbc4a) to define the language for the SharePoint Online site. For example, enter *1033* for English (United States).
    - `$newSiteURL`: Replace */powerplatformhub* with your Power Platform communication site URL.
    - `$ownerEmail`: Update with the admin email address.
    - `$siteTitle`: Replace with the title of your Power Platform communication site.
    - `$timeZone`: Enter a value that represents the time zone of your organization.

1. Open **Set-PowerPlatformHubAsDLPErrorSettings.ps1** in the ISE of your choice.

    ```powershell
    $newSiteURL = 'https://contoso.sharepoint.com/sites/powerplatformhub/SitePages/Data-Loss-Prevention-(DLP)-Policies.aspx'
    $supportEmail = 'support@contoso.com'
    $tenantId = '00000000-0000-0000-0000-000000000000'
    ```

1. Update the following variables:

    - `$newSiteURL` is the URL of the Data Loss Prevention policies page on the SharePoint site.
    - `$supportEmail` is the email address of the support department.
    - `$tenantId` is the GUID of your tenant. Learn how to [find your tenant ID](/sharepoint/find-your-office-365-tenant-id).

### Run the PowerShell scripts

1. From the **Start** menu, type "PowerShell", and select **Run as administrator**.

1. Navigate to the folder containing the source files. This is the folder you extracted files to after [downloading the template](#download-the-assets).

1. Execute (by typing the following names) the following PowerShell scripts:
    - `.\Deploy-PowerPlatformHub.ps1`
    - `.\Set-PowerPlatformHubAsDLPErrorSettings.ps1`

## Test if the deployment was successful

When the scripts finish executing, you should see a notification message stating "Deployment of Power Platform Hub complete!"

1. Navigate to the URL of your Power Platform communication site.
1. Check that the **Site Pages** document library contains files and that the **Events** list exists.

## Troubleshooting

The PowerShell scripts catch failures. If you see errors, follow these troubleshooting steps to resolve the issues.

### Can't run PnP PowerShell scripts

If you can't run PnP PowerShell scripts, make sure your PowerShell version is 7 or higher and check that you have [registered a Microsoft Entra ID application to use with PnP PowerShell](https://pnp.github.io/powershell/articles/registerapplication.html).

### Can't connect to SharePoint Online

If you can't connect to SharePoint Online, PnP PowerShell may not be registered. Consult [the PnP PowerShell official documentation](https://pnp.github.io/powershell/articles/authentication.html) for more information.

### Can't run the script

If you get an error message telling you the PowerShell script can't be loaded as it isn't signed, [update the execution policy](/powershell/module/microsoft.powershell.security/set-executionpolicy) to [remove the execution policy from the current user](/powershell/module/microsoft.powershell.security/set-executionpolicy#example-5-remove-the-execution-policy-for-the-current-user).

### My tenant uses SharePoint vanity URLs

Some organizations use vanity URLs. If you're one of those organizations, make sure to hard code the URLs in the `$adminURL` and `$newSiteURL` variables of the scripts. This step ensures the script connects to the correct tenant and site.

### Still experiencing issues?

If you continue to face issues with the setup, have questions, or would like to raise feature requests, report your issues to [aka.ms/pphub-issues](https://aka.ms/pphub-issues).

## Modify existing content

The Power Platform communication site contains placeholder text and ideas for your own content. Update this content with your own processes, links, and images before the site is ready for use.

From **Settings** (Gear icon), navigate to **Site contents** > **Site Pages**, and modify the following pages:

- **Accelerate-innovation-and-amplify-your-productivity-with-Power-Platform.aspx**: This permanent news story is your place to share your strategy and vision for Power Platform with your makers and community. Record a video of your executive sponsor with the goal to inspire your makers to achieve more with Power Platform.

- **Consultation-and-Development.aspx**: If your organization has an internal Power Platform development team, include their contact details and ways to engage. If your organization doesn't have one, delete this page.

- **Data-Loss-Prevention-(DLP)-Policies.aspx**: Share the connectors available in each environment and how to request more connectors or a new environment for a specific project. The template page contains a typical data loss prevention policy strategy to help you get started. Scan the document for the placeholder  *COMPANY SPECIFIC INSTRUCTIONS* and update with your own processes and guidelines.

    :::image type="content" source="media/wiki-change.png" alt-text="Screenshot showing placeholder content you need to update with your own content." lightbox="media/wiki-change.png":::

- **Environments.aspx**: Share the environments available and how to request access to existing environments or request new ones. Ensure makers understand the boundaries of environments, including licensing, environment security, and connectors. The template page contains a typical environment strategy to help you get started. Scan the document for the placeholders *COMPANY SPECIFIC INSTRUCTIONS* and update with your own processes and guidelines.

- **Guided-Learning.aspx**: This page provides a summary of Power Platform learning paths available on Microsoft Learn. If you're running internal training events, add them here.

- **Internal-Communities.aspx**: Update this page to add links to your Power Platform communities. We recommend including a Yammer web part here.

- **Power-Platform-at-{companyName}.aspx**: Explain the responsibilities of a maker. For example, to:
  - Keep the tenant tidy by deleting unused resources.
  - Ensure apps are only shared with required end users.
  - Support their apps in the default environment
  - Engage with the Center of Excellence team before implementing a business-important or mission-critical app to plan appropriate support.
  
  Ensure makers are educated about the processes in place for business-important or mission-critical apps, such as engaging formal support.

- **Requesting-a-Premium-License.aspx**: Explain the available licenses, what's included in them, how to request premium licenses, and who pays for premium licenses if cross-charging from IT to business units or teams applies.

- **Support.aspx**: Share how makers and solutions are supported. Learn more in [User and maker support strategy](support-strategy.md).

## Further customize the site

Once you've modified the existing content, you should also:

1. Create new pages for other content you'd like to share with your makers.

1. Select **Edit** to add the new pages to the navigation.

    :::image type="content" source="media/wiki-new.png" alt-text="Screenshot showing where to edit the navigation to add your own pages." lightbox="media/wiki-new.png":::

1. Delete the pages that aren't relevant to your organization.

    - Delete the **Adele-Vance.aspx** and **James-Williams.aspx** pages. These pages are templates for how the **Champion of the week** page template can be used. Celebrate your own champions by selecting **New > Page > Champion** from the Power Platform communication site homepage.
    
    - Delete the **Success-story--Learn-how-our-Finance-department-saved-1M-per-month-by-automating-processes.aspx** page. This page is a template for how to share a success story. Highlight your own success stories by selecting **New > Page > Story** from the Power Platform communication site homepage.
    
    - Delete the **Research-and-Innovation-hackathon.aspx** page. This page is a template for how to announce an upcoming hackathon event. Announce your own hackathon by selecting **New > Page > Hackathon** from the Power Platform communication site homepage.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
