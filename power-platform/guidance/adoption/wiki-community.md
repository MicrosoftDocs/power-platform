---
title: Set up tools to support your community
description: Build a thriving Power Platform community with tools like Viva Engage, Microsoft Forms, and SharePoint to foster collaboration, share ideas, and drive innovation.
#customer intent: As a Power Platform admin, I want to set up tools like Viva Engage, Microsoft Forms, and SharePoint to support my community so that I can foster collaboration and innovation.
author: manuelap-msft
ms.component: pa-admin
ms.topic: how-to
ms.date: 04/01/2025
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: sericks
search.audienceType:
  - admin
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:03/28/2025
---

# Set up tools to support your community

At the heart of growth is a [community](community-goals.md), a place for people to collaborate, share ideas, and discover new ways to apply technology to achieve more. Creating a thriving Power Platform community requires not only enthusiastic members but also robust infrastructure and the right set of tools to facilitate communication, collaboration, feedback collection, and information dissemination. Here’s how you can use various tools to build an effective support system for your Power Platform community.

## Viva Engage

[Viva Engage](/viva/engage/overview) is an excellent tool designed to foster open communication within your community. It allows members to engage in meaningful conversations through posts and comments which can help in building a sense of belonging among members.

Use Viva Engage to create discussion threads where members can share ideas or ask questions about different aspects of the Power Platform.

Plan events such as webinars or workshops by creating dedicated event pages where details can be shared and RSVPs managed.

## Microsoft Forms

Collecting feedback is important for understanding the needs of your community and improving future initiatives.

After hosting an event like a training session or webinar on Power Platform topics such as Copilot Studio or Power Automate, use [Microsoft Forms](https://support.microsoft.com/office/what-is-microsoft-forms-6b391205-523c-45d2-b53a-fc10b22017c8) to gather participants' feedback on what went well and what could be improved.

Regularly survey your community members using Forms to understand their challenges with using the platform or any new features they would like introduced.

## SharePoint communication site

A [SharePoint communication site](https://support.microsoft.com/office/plan-your-sharepoint-communication-site-35d9adfe-d5cc-462f-a63a-bae7f2529182) serves as a central repository where important information can be stored securely while being easily accessible by all community members. Set up your own SharePoint Hub or Teams site to share success stories, upcoming events, rules of engagement, and guidelines with your maker community. Or get started with the [Power Platform Hub template](#get-started-with-the-power-platform-communication-site-template). This site is intended to be a one-stop shop for makers to find out everything they need about getting started with Microsoft Power Platform.

Here are a few tips on what the SharePoint communication site should include:

- **Announcements**: Post important updates about new features in Power Platform or upcoming events directly on SharePoint so that all members are informed promptly.

- **Success stories**: Highlight success stories from within your community showcasing how different users have used Power Platform effectively in their projects.

- **Policies and guidelines:** Share best practices, guidelines, and policies related to the use of Power Platform to ensure that all members are aligned and informed.
  - **[Environment strategy](../white-papers/environment-strategy.md)**: Share what environments are available and how to request access to existing environments or request new environments; additionally, ensure makers know the boundaries of an environments licensing, security, and connectors.
  - **[Data Loss Prevention (DLP) policy strategy](dlp-strategy.md)**: Share which connectors are available in which environments and how to request more connectors or a new environment for a specific project.

- **Training and reusable resources**: Share internal and external training resources, reusable components and templates, and any brand guidelines or naming conventions you want your makers to follow.

- **Community**: Share how to engage with the internal community, how to become a champion, how to find a mentor, and what the benefits of the community are.

- **Responsibilities of a maker**: Share what a maker is responsible for—for example:
  - Keeping the tenant tidy by deleting unused resources
  - Ensuring apps are only shared with required end users
  - Supporting their apps in the default environment, or engaging with the Center of Excellence team before implementing a business-important or mission-critical app to plan appropriate support.
  - Ensure makers are educated about the processes you have in place for business-important or mission-critical apps, such as engaging formal support.
- **Support process**: Share how makers and solutions can be supported.

- **License management**: Share what licenses are available and what’s included in those licenses, how to request premium licenses, and who will pay for those premium licenses if cross-charging from IT to business units or teams is in place.

- **UI/UX**: Discussion area on corporate standards/styles and overall best practices around UX.

:::image type="content" source="media/wiki.png" alt-text="Sample Microsoft Power Platform wiki page.":::

## Microsoft Teams

Microsoft Teams is a versatile tool that can be used for various administrative and collaborative purposes within your community.

- Administration: Use Teams to manage community administration tasks, such as coordinating with organizers and tracking progress on community initiatives.
- Meetings: Host virtual meetings and workshops on Teams to facilitate real-time collaboration and learning. This is especially useful for remote or geographically dispersed community members.

## Catalog in Power Platform

Organizations where developers and makers build and share customized and reusable components and templates get more value from Power Platform. Successful organizations adopt a fusion teams model where pro-developers, makers, and admins all work together to deliver the best solutions for their users, and derive the highest value possible from Power Platform. Learn more about using [reusable templates and components](reusable.md).

## Nurture components in the CoE Starter Kit

The Center of Excellence (CoE) Starter Kit includes [nurture components](/power-platform/guidance/coe/nurture-components) designed to support and develop the Power Platform community within an organization. These components provide essential resources such as the **Video Hub**, which centralizes video content for training and best practices, and the **Training in a day** solution helps manage internal training events and registrations. The **Maker Assessment** and **Pulse Survey** components help gauge the skills and engagement levels of community members. By exploring these components, organizations can effectively onboard new makers, share best practices, and foster a culture of continuous learning and innovation.

## Get started with the Power Platform communication site template

The Power Platform communication site template is a SharePoint communication site designed to provide you with a starting point of content and page templates as you're setting up your internal Power Platform wiki and community site. This communication site is designed to be the place where your Power Platform community can find the news and resources they need, including digital governance and compliance guardrails, upcoming events, success stories and more.

### Deploy the Power Platform communication site template

The Power Platform communication site template is a SharePoint Online template that is installed by running two PowerShell scripts. The steps in this section step you through the process of preparing and running the PowerShell scripts.

> [!NOTE]
> Your organization might restrict your ability to run PowerShell scripts, or you might need to work with your SharePoint Online administration team to run the PowerShell script.

#### Download the assets

1. [Download](https://aka.ms/pphub-download) the Power Platform communication site template from GitHub.
1. Extract the contents of the PowerPlatformHub.zip folder to a location on your PC.
1. Copy the path to the folder where you extracted the files. You need this path when you run the PowerShell scripts to deploy the template.

#### Prerequisites to deploy the Power Platform communication site template

The scripts to deploy the Power Platform communication site template have a dependency on two PowerShell modules:

1. [Download and install](/power-platform/admin/powerapps-powershell#installation) Microsoft.PowerApps.Administration.PowerShell
1. [Download and install](https://pnp.github.io/powershell/articles/installation.html) PnP PowerShell
1. [Register a Microsoft Entra ID application to use with PnP PowerShell](https://pnp.github.io/powershell/articles/registerapplication.html)

The PowerShell commands in the PnP PowerShell module require Windows PowerShell version 7 or above.

Check the version of PowerShell running on your machine:

```powershell
$PSVersionTable.PSVersion
```

### Update the PowerShell script variables

The PowerShell script to deploy the Power Platform communication site template contains several variables that should be updated to reflect your organization.

Open **Deploy-PowerPlatformHub.ps1** in an ISE (integrated scripting environment) of your choice.

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

Update the following variables:

- `$adminTenantName`: Enter the name of your SharePoint [root site](/sharepoint/modern-root-site#whats-the-root-site). For example, if your root site is *contoso*.sharepoint.com, enter *contoso*.
- `$adminURL`: Enter the URL of your SharePoint Online admin center. For example, if your root site is *contoso*.sharepoint.com, enter *https://contoso-admin.sharepoint.com*.
- `$companyName`: Enter your organization name. This name is used in the templates page navigation, page title, and sample pages.
- `$lcid`: Enter a [locale ID](/openspecs/office_standards/ms-oe376/6c085406-a698-4e12-9d4d-c3b0ee3dbc4a) to define the language for the SharePoint Online site. For example,, enter *1033* for English (United States).
- `$newSiteURL`: Replace */powerplatformhub* with your chosen Power Platform communication site URL.
- `$ownerEmail`: Update with the admin email address.
- `$siteTitle`: Replace with your chosen Power Platform communication site title.
- `$timeZone`" Enter a value that represents the time zone for your organization.

Open **Set-PowerPlatformHubAsDLPErrorSettings.ps1** in an ISE of your choice and update the following variables:

```powershell
$newSiteURL = 'https://contoso.sharepoint.com/sites/powerplatformhub/SitePages/Data-Loss-Prevention-(DLP)-Policies.aspx'
$supportEmail = 'support@contoso.com'
$tenantId = '00000000-0000-0000-0000-000000000000'
```
Where:

- `$newSiteURL` is the URL of the Data Loss Prevention policies page on the SharePoint site.
- `$supportEmail` is the email address of the support department.
- `$tenantId` is the GUID of your tenant. Learn how to [find your tenant ID](/sharepoint/find-your-office-365-tenant-id).

### Run the PowerShell scripts

1. From the **Start** menu, type "PowerShell", and select **Run as administrator**.

1. Navigate to the folder containing the source files. This is the folder you extracted files to after [downloading the template](#download-the-assets).

1. Execute (by typing the following names) the following PowerShell scripts:
    - `.\Deploy-PowerPlatformHub.ps1`
    - `.\Set-PowerPlatformHubAsDLPErrorSettings.ps1`

### Test if the deployment was successful

When the scripts have finished executing, you should see a notification message: "Deployment of Power Platform Hub complete!"

1. Navigate to the URL of your Power Platform communication site.
1. Check that the **Site Pages** document library contains files and that the **Events** list exists.

### Troubleshooting

The PowerShell scripts have been written to catch any failures. If you see errors, use the following troubleshooting steps to resolve the issues.

#### Can't run PnP PowerShell scripts

If you can't run PnP PowerShell scripts, make sure your PowerShell version is 7 or higher and check that you have [registered a Microsoft Entra ID application to use with PnP PowerShell](https://pnp.github.io/powershell/articles/registerapplication.html).

#### Can't connect to SharePoint Online

If you can't connect to SharePoint Online, PnP PowerShell may not be registered. Consult [the PnP PowerShell official documentation](https://pnp.github.io/powershell/articles/authentication.html) for more information.

#### Can't run the script

If you get an error message telling you the PowerShell script can't be loaded as it isn't signed, [update the execution policy](/powershell/module/microsoft.powershell.security/set-executionpolicy) to [remove the execution policy from the current user](/powershell/module/microsoft.powershell.security/set-executionpolicy#example-5-remove-the-execution-policy-for-the-current-user).

#### My tenant uses SharePoint Vanity URLs

Some organizations use vanity URLs. If you're one of those organizations, make sure to hard code the URLs in the `$adminURL` and `$newSiteURL` variables of the scripts. This step ensures the script connects to the correct tenant and site.

#### Still seeing issues?

If you continue to face issues with the setup, have questions, or would like to raise feature requests, report your issues to [aka.ms/pphub-issues](https://aka.ms/pphub-issues).

### Configuration

The Power Platform communication site contains placeholder text and ideas for your own content. Update this content with your own processes, links, and images before the site is ready for use.

After deployment, navigate to **Settings** (Gear icon) > **Site contents** > **Site Pages** to get started, and modify the following pages:

- **Accelerate-innovation-and-amplify-your-productivity-with-Power-Platform.aspx**: This permanent news story is your place to share your strategy and vision for Power Platform with your makers and community. Record a video with your executive sponsor and inspire your makers to achieve more with Microsoft Power Platform!

- **Consultation-and-Development.aspx**: If you have an internal Power Platform development team, provide their contact details, and ways to engage here. If not, delete this page.

- **Data-Loss-Prevention-(DLP)-Policies.aspx**: Share which connectors are available in which environments and how to request more connectors or a new environment for a specific project. We have added content of a typical DLP policy strategy here to help you get started. Scan the document for placeholders for *COMPANY SPECIFIC INSTRUCTIONS,* which you need to update with your own processes and guidelines.

    :::image type="content" source="media/wiki-change.png" alt-text="Screenshot showing placeholder content you need to update with your own content.":::

- **Environments.aspx**: Share what environments are available and how to request access to existing environments or request new environments. Ensure makers know the boundaries of environments regarding licensing, security for environments, and connectors. We have added content of a typical environment strategy to help you get started. Scan the document for placeholders for *COMPANY SPECIFIC INSTRUCTIONS,* which you need to update with your own processes and guidelines..

- **Guided-Learning.aspx**: This page provides a summary of Power Platform learning paths available on Microsoft Learn. If you're running internal training events, add them here.

- **Internal-Communities.aspx**: Update this page to add links to your Power Platform communities. We recommend including a Yammer web part here.

- **Power-Platform-at-{companyName}.aspx**: Share what a maker is responsible for. For example:

  - Keeping the tenant tidy by deleting unused resources.
  - Ensuring apps are only shared with required end users.
  - Supporting their apps in the default environment.
  - Engaging with the Center of Excellence team before implementing a business-important or mission-critical app to plan appropriate support.
  
  Ensure makers are educated about the processes you have in place for business-important or mission-critical apps, such as engaging formal support.

- **Requesting-a-Premium-License.aspx**: Share what licenses are available and what’s included in those licenses, how to request premium licenses, and who will pay for those premium licenses if cross-charging from IT to business units or teams is in place.

- **Support.aspx**: Share how makers and solutions can be supported. Learn more in [Develop a support strategy](support-strategy.md).

Once you've modified the existing content, you should also:

- Create new pages for extra content you'd like to share with your makers and add them to the navigation by selecting **Edit** in the navigation bar.
    :::image type="content" source="media/wiki-new.png" alt-text="Screenshot showing where you edit the navigation to add your own pages.":::

- Delete the **Adele-Vance.aspx** and **James-Williams.aspx** pages. These pages are templates for how the **Champion of the week** page template can be used. Celebrate your own champions by selecting **New > Page > Champion** from the Power Platform communication site homepage.

- Delete the **Success-story--Learn-how-our-Finance-department-saved-1M-per-month-by-automating-processes.aspx** page. This page is a template for how to share a success story. Highlight your own success stories by selecting **New > Page > Story** from the Power Platform communication site homepage.

- Delete the **Research-and-Innovation-hackathon.aspx** page. This page is a template for how to announce an upcoming hackathon event. Announce your own hackathon by selecting **New > Page > Hackathon** from the Power Platform communication site homepage.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
