---
title: "Leverage resource usage reports - Microsoft Power Platform | MicrosoftDocs"
description: "Learn how to review out-of-the-box monitoring capabilities, check service and environment health, set alerts on security permissions or compliance regulations, and perform typical actions to ensure a secure, healthy, and safe citizen developer environment."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/10/2020
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Report on resource usage

One of the key principles of administering Microsoft Power Platform is having full visibility into how your organization is using Power Apps and Power Automate. Insights into your adoption will help you govern and secure the platform, identify patterns, and nurture your makers to accelerate adoption.

In this section, you'll learn how to:

- Review out-of-the-box monitoring capabilities.
- Check service and environment health.
- Set alerts for security permissions or compliance regulations.
- Perform typical actions to ensure the security, health, and safety of the citizen developer environment.

Out-of-the-box tooling around monitoring, alerts, and actions falls into the following categories:

- The **[Power Platform admin center](https://aka.ms/ppac)** offers an interactive experience for performing administrative tasks. This is typically considered the primary path for completing administrative activities. From a monitoring point of view, this channel is used mostly for ad hoc interactive discovery. Additionally, some admin tasks would need access to [Microsoft 365 (formerly Office 365) admin center](https://admin.microsoft.com/), in addition to the [Office 365 Security and Compliance Center](https://protection.office.com/).

- **[PowerShell cmdlets](https://docs.microsoft.com/power-platform/admin/powerapps-powershell#powerapps-cmdlets-for-app-creators-preview)** offer a way to automate both management and monitoring tasks using PowerShell. These cmdlets can be used in a sequence to automate multiple-step administrative actions. Note that Microsoft typically provides capabilities as cmdlets first and then the same capabilities might be offered in the admin center UI or Management and Admin connectors in later releases.

- **Management and Admin connectors** offer the ability to use the platform’s own tools to manage and monitor itself. Part of the available 300-plus out-of-the-box connectors and approval process capabilities are five admin-specific connectors:

  - [Power Automate Management](https://docs.microsoft.com/connectors/flowmanagement/) is specifically designed to help with administrative management and monitoring.
  - [Power Automate for Admins](https://docs.microsoft.com/connectors/microsoftflowforadmins/) allows you to perform typical admin actions, such as disabling or deleting a flow.
  - [Power Apps for Admins](https://docs.microsoft.com/connectors/powerappsforadmins/) to set permissions on Power Apps or set permissions to a certain connector being used by this app.
  - [Power Apps for Makers](https://docs.microsoft.com/connectors/powerappsforappmakers/), which can be used by the makers themselves, although some actions overlay administrational tasks, such as settings permissions to a Power Apps app as mentioned previously.
  - [Power Platform for Admins](https://docs.microsoft.com/connectors/powerplatformforadmins) to perform tasks against platform components, such as creating an environment or provisioning a Microsoft Dataverse database or creating a data loss prevention (DLP) policy for a specific environment.

The [Center of Excellence Starter Kit](https://aka.ms/coestarterkit) offers a template implementation using the management and admin connectors and comes with a Power BI dashboard that can be used to gain tenant-wide insights.

## Monitoring storage capacity add-ons

The capacity section of analytics allows you to monitor storage capacity use and availability in your tenant. From the all-up view across all the environments, you can drill down into the individual environments for details such as top entity using storage on a timeline view. Sign in to the [Power Platform admin center](https://aka.ms/ppac) and select **Analytics** > **Capacity** in the left-side navigation pane.

![Microsoft Power Platform Capacity Analytics](media/resource-usage1.png "Microsoft Power Platform Capacity Analytics")

If your organization has purchased capacity add-ons, an Add-ons tile appears on the Capacity screen in the Power Platform admin center. Sign in to the admin center and select **Analytics** > **Capacity** in the left-side navigation pane. The Add-ons tile shows summary information about the capacity add-ons that your organization has.

![Microsoft Power Platform add-on capacity](media/resource-usage6.png "Microsoft Power Platform add-on capacity")

As an administrator, you should:

- Regularly check the capacity available to ensure new environments can be created by users in your tenant.
- Review the top storage used by environments to ensure you are aware of your top consuming environments.
- Look for any unexpected spikes in usage using the database, file, and log charts for individual environments.
- Review capacity add-ons such as Power Apps app passes, flow per business processes, portal page views, portal sign-ins, or AI Builder credits, and assign that capacity to specific environments.

More information: [Monitoring new and legacy capacity storage](https://docs.microsoft.com/power-platform/admin/whats-new-storage)

## Power Automate usage

As an administrator, you should:

- Monitor usage and look for insights related to types of flows that are in use.
- Watch for errors by error type to look for common problems that might exist.
- Spot data usage that isn't expected by drilling in to connector usage and adjust your data loss prevention policies for that environment to ensure the overall health of the platform.

More information: [Admin Analytics for Power Automate](https://docs.microsoft.com/power-platform/admin/analytics-flow)

## Power Apps usage

As an administrator, you should:

- Watch overall adoption by monitoring insights into how much the apps are being used and when.
- Check out app launches in terms of being used in a browser or via a mobile player version and on which platforms. Following your device strategy, you could ensure users are using the latest player edition.
- Regularly monitor overall service performance to ensure user run-time experience when interacting with the platform services.

More information: [Admin Analytics for Power Apps](https://docs.microsoft.com/power-platform/admin/analytics-powerapps)
