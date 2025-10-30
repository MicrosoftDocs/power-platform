---
title: Manage and govern the default Power Platform environment
description: Learn best practices for managing default Power Platform environments, including tracking connectors, identifying unused resources, and migrating critical apps.
#customer intent: As a Power Platform admin, I want to manage the default environment effectively so that I can maintain security and compliance, optimize resource usage, and ensure business continuity.
author: rranjit83
ms.author: rranjit
ms.reviewer: jhaskett-msft
ms.topic: best-practice
ms.date: 05/14/2025
ms.custom: bap-template
ms.subservice: guidance
contributors:
- matapg007 
- iscohen-microsoft
---

# Manage and govern the default Power Platform environment

Every employee in an organization that uses the Power Platform has access to the [default environment](/power-platform/admin/environments-overview#default-environment). As a Power Platform admin, you should consider and implement ways to manage the default environment. Your Center of Excellence (CoE) teams can gather information using the CoE Starter Kit, PowerShell cmdlets, and Power Platform admin connectors to understand what's happening in your organization's environments. 

This article provides some best practices for using the data you gather from these sources to manage your default environment.

## Enable managed environments

Maintain robust security and governance by making use of managed environment features in the default environment. Managed environment features provide advanced capabilities, such as monitoring, compliance, and security controls that are important for protecting your data. By enabling this feature, you can configure [sharing limits](/power-platform/admin/managed-environment-sharing-limits), gain more [usage insights](/power-platform/admin/managed-environment-usage-insights), [limiting user access to Microsoft Dataverse](/power-platform/admin/ip-firewall) from only allowed IP locations, and use the [actions page](/power-platform/admin/power-platform-advisor) to get personalized recommendations to optimize the environment. Evaluate the current managed environments features and stay up to date with the product roadmap to maintain a secure, compliant, and well-governed default environment.

## Track connectors

Connectors are Power Platform services that integrate apps and flows with other services. Power Platform administrators can use [data policies](../../admin/wp-data-loss-prevention.md) to control which integrations are permitted in each environment.

Some connectors that drive core Power Platform functionality [can't be blocked](../../admin/dlp-connector-classification.md#list-of-connectors-that-cant-be-blocked). You need to know if these core connectors are being used so that you can provide policy guidance to your makers. For example, you might want to track the apps and flows in the default environment that use the Exchange connector and direct the makers to move to a different environment that allows outbound emails.

The CoE Starter Kit contains schema and flows to report the details of all connectors used by each app or flow in all environments. The data reported in the CoE dashboard is refreshed every 24 hours. You can also search for related flows and apps directly from the Dataverse environment where the CoE Starter Kit is installed. Learn more about [tracking connectors with the CoE Power BI dashboard](../coe/power-bi-monitor.md).

## Discover unused and owner-less resources

As Power Platform adoption in your organization grows, you're likely to have owner-less and unused resources in your default environment. When a maker leaves an organization, the maker's apps and flows are in effect owner-less. Apps and flows that are used for a while and then are no longer needed can clutter the default environment.

To maintain environment hygiene, establish processes and procedures to clean up orphaned and unused flows and apps. These processes are especially important for the default environment, where all users are potential makers.

Use the [actions page](../../admin/power-platform-advisor.md) to view recommendations for apps without valid owners and apps that haven't been used in the last 60 days. You can take action for each recommendation in the recommendation pane, or you can use the [Power Platform for Admin V2 connector](/connectors/powerplatformadminv2/) to automate tasks.

Our recommendation is to use the [actions page](../../admin/power-platform-advisor.md). For more custom processes, evaluate the [CoE Starter Kit](../coe/overview.md) to [set up clean-up for orphaned objects](../coe/setup-orphan-components.md) and [set up inactivity processes](../coe/setup-archive-components.md). You can use these processes as-is or modify them to suit the needs of your organization.

## Discover highly used apps and flows

The default environment is designed for personal productivity, but makers can create apps and flows that become widely adopted or business-critical. This outcome is positive, but it requires management.

Apps that don't follow a proper application lifecycle management are prone to business continuity risks. Moving high-value apps from the default environment to a Managed Environment lets you use premium security and governance capabilities.

Use the [actions page](../../admin/power-platform-advisor.md) to view recommendations for [high-value apps](../../admin/operational-efficiency-recommendations.md#protect-high-value-apps-with-premium-security-and-governance-policies) in the default environment. Contact makers and develop a plan to migrate these apps out of the default environment into their own Managed Environment.

Again, our recommendation is to use the [actions page](../../admin/power-platform-advisor.md). For more custom processes, use the Power BI dashboard in the CoE Starter Kit to [identify widely shared apps and flows](../coe/power-bi-govern.md#identify-widely-shared-apps).

## Discover highly shared apps

When 10 or more employees use a personal productivity app or flow, the Power Platform CoE helps you evaluate whether to move it to its own or a shared environment. The following table describes the parameters to consider. Learn more about [developing an environment strategy](environment-strategy.md).

| Parameters                          | Defining criteria          | Environment         |
|-------------------------------------|----------------------------|---------------------|
| **Number of users**                 | 1–10 users                 | Default             |
|                                     | 7–30 users                 | Shared              |
|                                     | >30 users                  | Dedicated           |
| **Nature of data**                  | Highly confidential        | Dedicated           |
|                                     | Confidential               | Shared              |
|                                     | Not confidential           | Default             |
| **Monetary or reputational impact** | Yes                        | Shared or Dedicated |
|                                     | No                         | Default             |
| **Requires ALM**                    | Yes                        | Shared or Dedicated |
|                                     | No                         | Default             |

[Proactively set sharing limits](../../admin/managed-environment-sharing-limits.md) to control how broadly users can share canvas apps, flows, and agents to avoid over-sharing of resources.

For a reactive approach, use the compliance process in the CoE Starter Kit to track app sharing and usage. Use it as-is or modify it to suit the needs of your organization. Learn more about the [app auditing process](../coe/example-processes.md). This process occurs only after sharing is complete.  

## Move applications from the default environment

Use [solutions](/power-apps/developer/data-platform/introduction-solutions) to package and deploy your applications, flows, and tables from one environment to another. 

Fusion teams can use the following process to package the solution components, deploy it to a target environment, and delete it from the default environment:

1. Create a solution and add the app and all its dependent apps, flows, and tables.
1. Export the solution from the default environment and import it in a different environment.
1. Make sure that all users who had access to the app in the default environment have the right security roles in the target environment. Consider creating and using a dedicated security group to manage them.
1. Migrate all configuration and app data to the new environment.
1. Test and validate the app.
1. Notify users of the new application.
1. Remove access to the application for all users in the default environment. However, keep access for a few admins and makers.
1. Eventually, delete the solution and its contents from the default environment. Make sure that you don't delete any shared assets. For example, if another app or flow uses a table, don't delete the table.

## Quarantine apps

Power Platform admins can quarantine canvas apps. In the default environment, you might want to quarantine an app when:

- You want to disable it temporarily while it's reviewed.
- It's been shared with many users and must be disabled.
- It's being upgraded or moved to a different environment.

Makers can edit a quarantined app, but users can't play it. Remove the quarantine to restore access for shared users. Only admins can change an app's quarantine state.

Three PowerShell cmdlets manage app quarantines:

- **Quarantine:** 

    ```powershell
    Set-AppAsQuarantined -EnvironmentName <EnvironmentName> -AppName <AppName>  
    ```

- **Unquarantine:**  

    ```powershell
    Set-AppAsUnquarantined -EnvironmentName <EnvironmentName> -AppName <AppName>  
    ```

- **Get quarantine state:** 
     
    ```powershell
    Get-AppQuarantineState -EnvironmentName <EnvironmentName> -AppName <AppName>
    ```

## Designate a SharePoint form environment

Power Platform is tightly integrated with the rest of the Microsoft enterprise ecosystem. This integration allows any maker to build important automations and applications for themselves or their teams. One of the most powerful integrations is between SharePoint and Power Platform.

Makers can easily [create or customize a SharePoint form using Power Apps](/power-apps/maker/canvas-apps/customize-list-form). When a maker creates a custom SharePoint form in SharePoint, it creates a canvas app in the default environment. To avoid cluttering the default environment with these apps, create a separate environment to store custom SharePoint forms. This practice allows Power Platform admins to separate SharePoint forms from the general productivity apps in the default environment.

1. Create an environment, or designate an existing environment, to store SharePoint forms.

1. Assign all the users who create or update forms the environment maker role in the new environment.

1. Run the following PowerShell cmdlet to set the SharePoint form environment: 

    ```powershell
    Set-AdminPowerAppSharepointFormEnvironment -EnvironmentName '<EnvironmentName>'
    ```

    Learn more: [Designate SharePoint custom form environment](../../admin/powerapps-powershell.md#designate-sharepoint-custom-form-environment)

Keep these key points in mind:

- Existing SharePoint forms aren't migrated to the new environment.

- If you delete the SharePoint form environment after setting it, the custom SharePoint forms are lost. The user interface reverts to using the default SharePoint form. Canvas apps associated with new custom SharePoint forms are created in the default environment again.

- The `Set-AdminPowerAppSharepointFormEnvironment` cmdlet applies only to SharePoint forms customized by Power Apps. Power Automate flows created from SharePoint always use the default environment.

## Back up and restore the default environment

Like every other environment type (sandbox, production, developer), the default environment is archived automatically. However, you can request a restore for the default environment. If you need to restore a backup, contact Microsoft Support. They can restore your environment data to a [support environment](../../admin/support-environment.md). Once that restore is complete, you can view and export data as needed. Keep in mind that restoring the default environment might also restore unused or orphaned apps and flows removed during cleanup.  

Learn more: [Back up and restore environments](../../admin/backup-restore-environments.md)

### Related information

- [Secure the default environment](secure-default-environment.md)
- [Power Platform for Admins - Connectors](/connectors/powerplatformforadmins/)
- [Power Automate Management - Connectors](/connectors/flowmanagement/)
- [Power Automate for Admins - Connectors](/connectors/microsoftflowforadmins/)
- [Power Apps for Admins - Connectors](/connectors/powerappsforadmins/)
- [Get started with PowerShell for Power Platform Administrators](../../admin/powershell-getting-started.md)
- [Support environments and consent to access customer data](../../admin/support-environment.md)
