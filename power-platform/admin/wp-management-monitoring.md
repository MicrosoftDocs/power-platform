---
title: "Management and monitoring  | MicrosoftDocs"
description: About management and monitoring.
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/09/2020
ms.subservice: admin
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

This article discusses the tools that you can use to manage and monitor what is going on in your environments. It's important for you to understand that each organization has its own operational model and requirements for creating an app development platform.

Tooling services that provide features specific to monitoring, alert, and actions fall into the following categories:

- **Admin portals** offer an interactive experience for doing administrative tasks. 

Portals are typically considered the primary path for completing administrative activities. For monitoring, this channel is used mostly for ad-hoc interactive discovery. Microsoft is working on providing a single admin interface ([https://aka.ms/ppac](https://aka.ms/ppac)) for the Power Platform. Currently, the Microsoft Power Platform components include Power BI, Power Automate, and Power Apps. Also, some admin tasks are completed in the Microsoft 365 admin center ([https://admin.microsoft.com/](https://admin.microsoft.com/)).

**PowerShell cmdlets** offer a way to automate both management and monitoring tasks using PowerShell. These cmdlets can be used in a sequence to automate multistep administrative actions. From a roadmap perspective, PowerShell cmdlets are available first, before enabling administration capabilities. These are typically released via the web app interface or via the management and admin connectors. Check out [https://www.powershellgallery.com/](https://www.powershellgallery.com/) to get the latest package.

**Management and Admin Connectors** offer the ability to use the platform's own tools to manage and monitor itself. Part of the released available 275+ connectors and approval process capabilities are five admin-specific connectors you should be familiar with.

- **Power Automate Management connector** is designed to help with administrative management and monitoring ([https://docs.microsoft.com/connectors/flowmanagement](/connectors/flowmanagement/)).
- **Microsoft Flow for Admins** allows you to complete typical admin actions, such as disabling a flow and deleting a flow ([https://docs.microsoft.com/connectors/microsoftflowforadmins/](/connectors/microsoftflowforadmins/)).
- **Power Apps for Admins connector** can be used to set permissions on Power Apps or set permissions to a certain connector being used by this app ([https://docs.microsoft.com/connectors/powerappsforadmins/](/connectors/powerappsforadmins/)).
- **PowerApps for App Makers** can be used by the makers themselves, though some actions being an overlay to administrational tasks, such as settings permissions to a Power Apps app as mentioned previously ([https://docs.microsoft.com/connectors/powerappsforappmakers/](/connectors/powerappsforappmakers/)).
- **Power Platform for Admins** can be used to perform tasks against platform components, such as creating an environment or provisioning a Microsoft Dataverse database or creating a DLP policy for a specific environment ([https://docs.microsoft.com/connectors/powerplatformforadmins/](/connectors/powerplatformforadmins/)).

Check out the Admin-in-a-day content that can be found in the GitHub repository ([https://aka.ms/powerapps/admininaday](https://aka.ms/powerapps/admininaday)) that walks you through examples via hands-on labs with step-by-step instructions. 

The [Center of Excellence Starter Kit](../guidance/coe/starter-kit.md) offers a template implementation using the Management and Admin connectors, and comes with a Power BI dashboard that can be leveraged to gain tenant-wide insights.

### See also
[Dataverse analytics](analytics-common-data-service.md)<br />
[Admin Analytics for Microsoft Power Automate](analytics-flow.md)<br />
[Admin Analytics for Power Apps](analytics-powerapps.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]