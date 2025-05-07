---
title: "Create an internal Microsoft Power Platform hub | MicrosoftDocs"
description: "At the heart of growth is a community, a place for people to collaborate, share ideas and discover new ways to apply technology to achieve more."
author: manuelap-msft

ms.component: pa-admin
ms.topic: how-to
ms.date: 07/17/2024
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: sericks
search.audienceType: 
  - admin
---
# Create an internal Microsoft Power Platform hub

At the heart of growth is a community, a place for people to collaborate, share ideas, and discover new ways to apply technology to achieve more. A community is a safe place to ask questions to share tacit knowledge and expand skill sets. Organizations that have succeeded at creating a growing community of makers provide tools such as Yammer or Microsoft Teams groups, regular events and speaking opportunities, and foster an environment of ongoing learning.

They make sure that every person in the organization can come together at regular intervals to socialize, share their knowledge, and explore new possibilities. Leaders who want to create a digital culture will put a framework in place for the community inside their organization to break down geographic and organizational silos.

## Create a Power Platform Hub

Set up your own SharePoint Hub or Teams site to share success stories, upcoming events, rules of engagement and guidelines with your maker community - or get started with the [Power Platform Hub template](#get-started-with-the-power-platform-communication-site-template). This site should be a one-stop shop for makers to find out everything they need about getting started with Microsoft Power Platform.

Here are a few tips on what the wiki should include:

- **Training and reusable resources**: Share internal and external training resources, reusable components and templates, and any brand guidelines or naming conventions you want your makers to follow.

- **Community**: Share how to engage with the internal community, how to become a champion, how to find a mentor, and what the benefits of the community are.

- **[Environment strategy](../white-papers/environment-strategy.md)**: Share what environments are available and how to request access to existing environments or request new environments; additionally, ensure makers know the boundaries of an environments licensing, security, and connectors.

- **[Data loss prevention (DLP) policy strategy](dlp-strategy.md)**: Share which connectors are available in which environments and how to request more connectors or a new environment for a specific project.

- **Responsibilities of a maker**: Share what a maker is responsible for—for example:

1. Keeping the tenant tidy by deleting unused resources
1. Ensuring apps are only shared with required end users
1. Supporting their apps in the default environment, or engaging with the Center of Excellence team before implementing a business-important or mission-critical app to plan appropriate support.
1. Ensure makers are educated about the processes you have in place for business-important or mission-critical apps, such as engaging formal support.

- **Support process**: Share how makers and solutions can be supported.

- **License management**: Share what licenses are available and what’s included in those licenses, how to request premium licenses, and who will pay for those premium licenses if cross-charging from IT to business units or teams is in place.

- **UI/UX**: Discussion area on corporate standards/styles and overall best practices around UX.

![Sample Microsoft Power Platform wiki page.](media/wiki.png "Sample Microsoft Power Platform wiki page")

## Get started with the Power Platform communication site template

The Power Platform communication site template is a SharePoint communication site designed to provide you with a starting point of content and page templates as you're setting up your internal Power Platform wiki and community site. This communication site is designed to be the place where your Power Platform community can find the news and resources they need, including digital governance and compliance guardrails, upcoming events, success stories and more.

### Deploy the Power Platform communication site template

The Power Platform communication site template is a SharePoint Online template that is installed by running two PowerShell scripts.
The steps in this section take you through the process of preparing and running the PowerShell scripts.

> [!NOTE]
> Your organization may restrict your ability to run PowerShell scripts, or you may need to work with your SharePoint Online administration team to run the PowerShell script.

#### Download the assets

1. [Download](https://aka.ms/pphub-download) the Power Platform communication site template from GitHub.
1. Extract the contents of the PowerPlatformHub.zip folder to a location on your PC.
1. Copy the path to the folder you extracted the files to. You'll need this path when you run the PowerShell scripts to deploy the template.

#### Prerequisites to deploy the Power Platform communication site template

The scripts to deploy the Power Platform communication site template has a dependency on two PowerShell modules:

1. [Download and install](/power-platform/admin/powerapps-powershell#installation) Microsoft.PowerApps.Administration.PowerShell
1. [Download and install](https://pnp.github.io/powershell/articles/installation.html) PnP PowerShell

The PowerShell commands in the Microsoft.PowerApps.Administration.PowerShell module requires Windows PowerShell version 5.x.

Check the version of PowerShell running on your machine:

```powershell
$PSVersionTable.PSVersion
```

### Update the PowerShell script variables

The PowerShell script to deploy the Power Platform communication site template contains several variables that should be updated to reflect your organization.

Open **Deploy-PowerPlatformHub.ps1** in an ISE of your choice and update the following variables:

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

1. **$adminTenantName** - the name of your SharePoint [root site](/sharepoint/modern-root-site#whats-the-root-site), if your root site is *contoso*.sharepoint.com enter *contoso*.
1. **$companyName** - your organization name, this name will be used in the templates page navigation, page title and sample pages.
1. **$lcid** - enter a [locale](/openspecs/office_standards/ms-oe376/6c085406-a698-4e12-9d4d-c3b0ee3dbc4a) to defines the language for the SharePoint Online site, enter *1033* for English (United States).
1. **$newSiteURL** - replace  */powerplatformhub* with your chosen Power Platform communication site URL.
1. **$ownerEmail** - update with admin email address.
1. **$siteTitle** - replace with your chosen Power Platform communication site title.
1. **$timeZone** - a number representing the time zone for your organization.

Open **Set-PowerPlatformHubAsDLPErrorSettings.ps1** in an ISE of your choice and update the following variables:

```powershell
$newSiteURL = 'https://contoso.sharepoint.com/sites/powerplatformhub/SitePages/Data-Loss-Prevention-(DLP)-Policies.aspx'
$supportEmail = 'support@contoso.com'
$tenantId = '00000000-0000-0000-0000-000000000000'
```

1. **$newSiteURL** - the URL of the Data Loss Prevention policies page on the SharePoint site.
2. **$supportEmail** - the email address of the support department.
3. **$tenantId** - the GUID of your tenant. Learn how to find your tenant id [here](/onedrive/find-your-office-365-tenant-id).

### Run the PowerShell scripts

1. Select **Start** > type **PowerShell** > Run as administrator
1. Navigate to the folder containing the source files - this is the folder you extracted files to after [downloading the template](#download-the-assets).
1. Execute (by typing the following name) the following PowerShell scripts:
    1. .\Deploy-PowerPlatformHub.ps1
    1. .\Set-PowerPlatformHubAsDLPErrorSettings.ps1

### Test if the deployment was successful

When the scripts have finished executing, you should see a notification message:

"Deployment of Power Platform Hub complete!"

1. Navigate to the URL of your Power Platform communication site.
1. Check that the **Site Pages** document library contains files, and that the **Events** list exists.

### Troubleshooting

The PowerShell scripts have been written to catch any failures. However, if you do see errors, you should check:

#### Can't connect to SharePoint Online

If you can't connect to SharePoint Online, this could be caused by PnP PowerShell not being registered.  You will need to register by following the steps [in this document](https://pnp.github.io/powershell/articles/authentication.html).

#### Can't run the script

If you get an error message telling you the PowerShell script can't be loaded as it is not signed, you have to [update the execution policy](/powershell/module/microsoft.powershell.security/set-executionpolicy) to [remove the execution policy from the current user](/powershell/module/microsoft.powershell.security/set-executionpolicy#example-5-remove-the-execution-policy-for-the-current-user).

#### My tenant uses SharePoint Vanity URLs

There are few companies around the world that use vanity URLs. If you are one of these companies, make sure to hard code the URLs in the `$adminURL` & `$newSiteURL` variables in the scripts. This will make sure the script will connect to the right tenant and site.

#### Still seeing issues?

If you continue to face issues with the setup, have questions or would like to raise feature requests please report your issues here: [aka.ms/pphub-issues](https://aka.ms/pphub-issues).

### Configuration

The Power Platform communication site contains placeholder text and ideas for your own content. Update this content with your own processes, links and images before the site is ready for use.

After deployment, navigate to **Settings (Gear icon) > Site contents > Site Pages** to get started, and modify:

- **Accelerate-innovation-and-amplify-your-productivity-with-Power-Platform.aspx**: This permanent news story is your place to share your strategy and vision for Power Platform with your makers and community. Record a video with your executive sponsor and inspire your makers to achieve more with Microsoft Power Platform!
- **Consultation-and-Development.aspx**: If you have an internal Power Platform development team, provide their contact details, and ways to engage here. If not, delete this page!
- **Data-Loss-Prevention-(DLP)-Policies.aspx**: Share which connectors are available in which environments and how to request more connectors or a new environment for a specific project. We have added content of a typical DLP policy strategy here for you to get started with. Scan the document for placeholders for *Company specific instructions that you need to update with your own processes and guidelines.
    ![Look out for placeholders to update the communication site with your own content](media/wiki-change.png "Look out for placeholders to update the communication site with your own content")
- **Environments.aspx**: Share what environments are available and how to request access to existing environments or request new environments; additionally, ensure makers know the boundaries of environments with regard to licensing, security for environments, and connectors. We have added content of a typical environment strategy here for you to get started with. Scan the document for placeholders for *Company specific instructions that you need to update with your own processes and guidelines.
- **Guided-Learning.aspx**: This page provides a summary of Power Platform learning paths available on Microsoft Learn. If you're running internal training events, add them here.
- **Internal-Communities.aspx**: Update this page to add links to your Power Platform communities - we recommend including a Yammer web part here.
- **Power-Platform-at-{companyName}.aspx**: Share what a maker is responsible for—for example
  - Keeping the tenant tidy by deleting unused resources.
  - Ensuring apps are only shared with required end users.
  - Supporting their apps in the default environment.
  - Engaging with the Center of Excellence team before implementing a business-important or mission-critical app to plan appropriate support.
  
  Ensure makers are educated about the processes you have in place for business-important or mission-critical apps, such as engaging formal support.
- **Requesting-a-Premium-License.aspx**: Share what licenses are available and what’s included in those licenses, how to request premium licenses, and who will pay for those premium licenses if cross-charging from IT to business units or teams is in place.
- **Support.aspx**: Share how makers and solutions can be supported. Learn more: [Develop a support strategy](support-strategy.md).

Once you've modified the existing content, you should also

- Create new pages for extra content you'd like to share with your makers and add them to the navigation by selecting **Edit** in the navigation bar.
    ![Edit the navigation to add your own pages](media/wiki-new.png "Edit the navigation to add your own pages")
- Delete the **Adele-Vance.aspx** and **James-Williams.aspx** pages, these pages are templates for how the **Champion of the week** page template can be used. Celebrate your own champions by selecting **New > Page > Champion** from the Power Platform communication site homepage.
  ![Add a new page from a template](media/wiki-new.png "Add a new page from a template")
- Delete the **Success-story--Learn-how-our-Finance-department-saved-1M-per-month-by-automating-processes.aspx** page, this page is a template for how to share a success story. Highlight your own success stories by selecting **New > Page > Story** from the Power Platform communication site homepage.
- Delete the **Research-and-Innovation-hackathon.aspx** page, this page is a template for how to announce an upcoming hackathon event. Announce your own hackathon by selecting **New > Page > Hackathon** from the Power Platform communication site homepage.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
