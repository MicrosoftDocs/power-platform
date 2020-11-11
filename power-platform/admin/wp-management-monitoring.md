---
title: "Management and monitoring  | MicrosoftDocs"
description: About management and monitoring.
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/09/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Management and monitoring

This topic focuses on the tools you can use to manage and monitor what is going on in your environments. It is important to understand that each company has its own operational model and requirements around a citizen app development platform. Fulfilling those requirements using the platform capabilities in terms of custom apps or flows can be seen as a best practice.

Out-of-the-box tooling around monitoring, alert, and actions falls into the following three categories:

**Admin portals** offer an interactive experience for performing administrative tasks. This is typically considered the primary path for completing administrative activities. From a monitoring point of view, this channel is used mostly for ad-hoc interactive discovery. We're working toward a single admin interface ([https://aka.ms/ppac](https://aka.ms/ppac)) for Microsoft Power Platform. Currently, there are admin portals for Microsoft Power Platform components, such as Power BI, Power Automate, and Power Apps. Additionally, some admin tasks are done in the Microsoft 365 admin center ([https://admin.microsoft.com/](https://admin.microsoft.com/))

**PowerShell cmdlets** offer a way to automate both management and monitoring tasks using PowerShell. These cmdlets can be used in a sequence to automate multistep administrative actions. From a roadmap perspective, PowerShell cmdlets will be available first, before enabling administration capabilities, via the web app interface or via the management and admin connectors. Check out [https://www.powershellgallery.com/](https://www.powershellgallery.com/) to get the latest package.

**Management and Admin Connectors** offer the ability to use the platform's own tools to manage and monitor itself. Part of the out-of-the-box available 275+ connectors and approval process capabilities are five admin-specific connectors you should be familiar with.

- **Power Automate Management connector** is specifically designed to help with administrative management and monitoring ([https://docs.microsoft.com/connectors/flowmanagement](https://docs.microsoft.com/connectors/flowmanagement/)).
- **Microsoft Flow for Admins** allows you to perform typical admin actions, such as disabling a flow or deleting a flow ([https://docs.microsoft.com/connectors/microsoftflowforadmins/](https://docs.microsoft.com/connectors/microsoftflowforadmins/)).
- **Power Apps for Admins connector** can be used to set permissions on Power Apps or set permissions to a certain connector being used by this app ([https://docs.microsoft.com/connectors/powerappsforadmins/](https://docs.microsoft.com/connectors/powerappsforadmins/)).
- **PowerApps for App Makers** can be used by the makers themselves, though some actions being an overlay to administrational tasks, such as settings permissions to a Power Apps app as mentioned previously ([https://docs.microsoft.com/connectors/powerappsforappmakers/](https://docs.microsoft.com/connectors/powerappsforappmakers/)).
- **Power Platform for Admins** can be used to perform tasks against platform components, such as creating an environment or provisioning a Microsoft Dataverse database or creating a DLP policy for a specific environment ([https://docs.microsoft.com/connectors/powerplatformforadmins/](https://docs.microsoft.com/connectors/powerplatformforadmins/)).

Check out the Admin-in-a-day content that can be found in the GitHub repository ([https://aka.ms/powerapps/admininaday](https://aka.ms/powerapps/admininaday)) that walks you through examples via hands-on labs with step-by-step instructions. 

The [Center of Excellence Starter Kit](../guidance/coe/starter-kit.md) offers a template implementation using the Management and Admin connectors, and comes with a Power BI dashboard that can be leveraged to gain tenant-wide insights.

### See also
[Dataverse analytics](analytics-common-data-service.md)<br />
[Admin Analytics for Microsoft Power Automate](analytics-flow.md)<br />
[Admin Analytics for Power Apps](analytics-powerapps.md)
