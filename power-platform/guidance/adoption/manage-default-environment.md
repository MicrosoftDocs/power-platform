---
title: Manage the default environment
description: Learn how to manage the default environment in Microsoft Power Platform.
author: rranjit83
ms.author: rranjit
ms.reviewer: sericks
ms.topic: how-to
ms.date: 07/12/2023
ms.custom: bap-template
ms.subservice: guidance
contributors:
- iscohen-microsoft
---

# Manage the default environment

Every employee in an organization that uses the Power Platform has access to the default environment. As a Power Platform admin, you should consider, and when necessary, implement ways to control the default environment. Your Center of Excellence (CoE) teams can gather information using the CoE Starter Kit, PowerShell cmdlets, and Power Platform admin connectors to understand what's happening in your organization's environments. This article provides some best practices for using the data you gather from these sources to manage your default environment.

## Track connectors

Connectors are Power Platform services that integrate apps and flows with other services. Power Platform administrators can use [DLP policies](/power-platform/admin/wp-data-loss-prevention) to control which integrations are allowed in each environment.

Some connectors that drive core Power Platform functionality [can't be blocked](/power-platform/admin/dlp-connector-classification#list-of-connectors-that-cant-be-blocked). You need to know if these core connectors are being used so that you can provide policy guidance to your makers. For example, you might want to track the apps and flows in the default environment that use the Exchange connector and direct the makers to move to a different environment that allows outbound emails.

The CoE Starter Kit contains schema and flows to report the details of all connectors used by each app or flow in all environments. The data reported in the CoE dashboard is refreshed every 24 hours. You can also search for related flows and apps directly from the Dataverse environment where the CoE Starter Kit is installed. [Learn more about tracking connectors with the CoE Power BI dashboard](/power-platform/guidance/coe/power-bi-monitor).

## Discover unused and orphaned apps and flows

As Power Platform adoption in your organization grows, you're likely to have orphaned and unused apps and flows in your default environment. When a maker leaves an organization, the maker's apps and flows are in effect orphaned. Apps and flows that are used for a while and then are no longer needed can clutter the default environment.

To maintain environment hygiene, establish processes and procedures to clean up orphaned and unused flows and apps. This is especially important for the default environment, where all users are potential makers.

Start with the following processes in the CoE Starter Kit:

- [Set up clean-up of orphaned objects](/power-platform/guidance/coe/setup-orphan-components)

- [Set up inactivity processes](/power-platform/guidance/coe/setup-archive-components)

You can use them as-is or modify them to suit the needs of your organization.

## Discover highly used apps and flows

While the default environment is intended for personal productivity, makers might create apps and flows that become widely adopted or business-critical. This is a good outcome, but it should be managed.

Use the Power BI dashboard in the CoE Starter Kit to [identify widely shared apps and flows](/power-platform/guidance/coe/power-bi-govern#identify-widely-shared-apps).

When 10 or more employees are using a personal productivity app or flow, the Power Platform CoE can also help you to evaluate whether it should be moved to its own or a shared environment. The following table describes the parameters to consider. [Learn more about establishing an environment strategy](/power-platform/guidance/adoption/environment-strategy).

<table>
    <th>Parameters</th><th>Defining criteria</th><th>Environment</th>
    <tr>
        <td rowspan="3">Number of users</td>
        <td>1&ndash;10 users</td>
        <td>Default</td>
    </tr>
    <tr>
        <td>7&ndash;30 users</td>
        <td>Shared</td>
    </tr>
      <tr>
        <td>&gt;30 users</td>
        <td>Dedicated</td>
    </tr>
     <tr>
        <td rowspan="3">Nature of data</td>
        <td>Highly confidential</td>
        <td>Dedicated</td>
    </tr>
    <tr>
        <td>Confidential</td>
        <td>Shared</td>
    </tr>
      <tr>
        <td>Not confidential</td>
        <td>Default</td>
    </tr>
     <tr>
        <td rowspan="2">Monetary or reputational impact to business</td>
        <td>Yes</td>
        <td>Shared or dedicated</td>
    </tr>
    <tr>
        <td>No</td>
        <td>Default</td>
    </tr>
      <tr>
        <td rowspan="2">Requires ALM</td>
        <td>Yes</td>
        <td>Shared or dedicated</td>
    </tr>
    <tr>
        <td>No</td>
        <td>Default</td>
    </tr>
</table>

Use the compliance process in the CoE Starter Kit to track app sharing and usage. Use it as-is or modify it to suit the needs of your organization. [Learn more about the app auditing process](/power-platform/guidance/coe/example-processes).

## Move applications from the default environment

Use [solutions](/power-apps/developer/data-platform/introduction-solutions) to package and deploy your applications, flows, and tables from one environment to another. Fusion teams can use the following process to package the solution components, deploy it to a target environment, and delete it from the default environment.

1. Create a solution and add the app and all its dependent apps, flows, and tables.

1. Export the solution from the default environment and import it in a different environment.

1. Make sure that all users who had access to the app in the default environment have the right security roles in the target environment. Consider creating and using a dedicated security group to manage them.

1. Migrate all configuration and app data to the new environment.

1. Test and validate the app.

1. Notify users of the new application.

1. Remove access to the application for all users in the default environment. However, you should keep access for a few admins and makers.

1. Eventually, delete the solution and its contents from the default environment. Make sure that you don't delete any shared assets like tables. For example, if another app or flow uses a table, don't delete the table.

## Quarantine apps

Power Platform admins can quarantine canvas apps. In the default environment, you might want to quarantine an app when:

- You want to disable it temporarily while it's reviewed.

- It's been shared with many users and must be disabled.

- It's being upgraded or moved to a different environment.

Makers can edit a quarantined app, but users of a quarantined app can't play it. You need to remove the quarantine to restore access to shared users. Only admins can change an app's quarantine state.

Three PowerShell cmdlets manage app quarantines:

- **Quarantine:** `Set-AppAsQuarantined -EnvironmentName <EnvironmentName> -AppName <AppName>`

- **Unquarantine:** `Set-AppAsUnquarantined -EnvironmentName <EnvironmentName> -AppName <AppName>`

- **Get quarantine state:** `Get-AppQuarantineState -EnvironmentName <EnvironmentName> -AppName <AppName>`

## Designate a SharePoint form environment

Power Platform is tightly integrated with the rest of the Microsoft enterprise ecosystem. This allows any maker to build important automations and applications for themselves or their teams. One of the most powerful integrations is between SharePoint and Power Platform.

Makers can easily [create or customize a SharePoint form using Power Apps](/power-apps/maker/canvas-apps/customize-list-form). When a maker creates a custom SharePoint form in SharePoint, it creates a canvas app in the default environment. To avoid cluttering the default environment with these apps, create a separate environment to store custom SharePoint forms. This allows Power Platform admins to separate SharePoint forms from the general productivity apps in the default environment.

1. Create an environment, or designate an existing environment, to store SharePoint forms.

1. Assign all the users who create or update forms the environment maker role in the new environment.

1. Run the following [PowerShell cmdlet to set the SharePoint form environment](/power-platform/admin/powerapps-powershell#designate-sharepoint-custom-form-environment): `Set-AdminPowerAppSharepointFormEnvironment --EnvironmentName '<EnvironmentName>'`

Keep these key points in mind:

- Existing SharePoint forms aren't migrated to the new environment.

- If you delete the SharePoint form environment after setting it, the custom SharePoint forms are lost. The user interface reverts to using the default SharePoint form. Canvas apps associated with new custom SharePoint forms are created in the default environment again.

- The Set-AdminPowerAppSharepointFormEnvironment cmdlet applies only to SharePoint forms that are customized by Power Apps. Power Automate flows created from SharePoint always use the default environment.

## Backup and restoration of the default environment

Like every other environment type (sandbox, production, developer), the default environment is archived automatically. However, you can request a restore for the default environment. If you need to restore a backup, contact Microsoft Support. They can restore your environment data to a [Support environment](/power-platform/admin/support-environment). Once that restore is complete, you can view and export data as you need. Keep in mind, that when you restore the default environment, you might also be restoring unused or orphaned apps and flows that were removed during cleanup.

### See also

[Secure the default environment](secure-default-environment.md)

[Power Platform for Admins - Connectors](/connectors/powerplatformforadmins/)

[Power Automate Management - Connectors](/connectors/flowmanagement/)

[Power Automate for Admins - Connectors](/connectors/microsoftflowforadmins/)

[Power Apps for Admins - Connectors](/connectors/powerappsforadmins/)

[Programmability and Extensibility - PowerShell - Getting started](/power-platform/admin/powershell-getting-started)

[Support environments and consent to access customer data](/power-platform/admin/support-environment)
