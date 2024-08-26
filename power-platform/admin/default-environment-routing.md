---
title: Environment routing
description: Learn how to use the environment routing governance feature. 
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/10/2024
author: akadrno
ms.author: kauguillard 
ms.reviewer: sericks
ms.subservice: admin
search.audienceType: 
  - admin
---

# Environment routing

Environment routing is a premium governance feature. This feature allows Power Platform admins to automatically direct new or existing makers into their own personal developer environments when they visit [make.powerapps.com](https://make.powerapps.com/). Environment routing offers makers a personal, safe space to build with Microsoft Dataverse without the fear of others accessing their apps or data.

When the **Environment routing** setting is enabled in [Power Platform Admin Center](https://admin.powerplatform.microsoft.com), the maker lands in their own personal developer environment instead of the default environment. Personal developer environments are the makers' own spaces, like OneDrive, for personal productivity where they can start building apps and solutions in their own workspace. Makers don't need to know which environment to work in, since the personal developer environment appears automatically.

:::image type="content" source="media/default-environment-routing/diagram-environment-routing.png" alt-text="Diagram showing how new and existing makers fit into the environment routing and environment group.":::
  
When the feature is turned on, the selected maker type (i.e. new or existing makers), will always land into their own personal developer environment. If the maker has access to one or more existing developer environment that is not owned by them, they will be routed to a new developer environment. 

Dataverse is available in developer environments, and these environments are [Managed Environments](managed-environment-overview.md) with the admin settings preconfigured according to the assigned environment group rules. Admins no longer need to worry that their makers are working in the default environment, where their work can conflict with others.

> [!IMPORTANT]
>
> - By default, all developer environments created through environment routing are managed.
> - Managed Environment isn't included as an entitlement in the Developer Plan when users run their assets. For more information about Managed Environments and the Developer Plan, see [About the Power Apps Developer Plan](../developer/plan.md).
> - **Non-managed** developer environments are **unaffected** by this feature. Learn more about the developer environment and developer plan in [About the Power Apps Developer Plan](../developer/plan.md).

## Prerequisites

Understand that environment routing is a tenant-level, admin setting that:

- Only Power Platform admins can enable.

- Requires the use of Managed Environments, since all of the newly, created environments are managed. Users in a _managed_ developer environment must have premium licenses to run Power Platform assets.

- A personal developer environment is automatically created for Power Apps new or existing makers (depending on the configured user type) when they go to [make.powerapps.com](https://make.powerapps.com).

- Routed makers will land into their existing developer environment if they already have a developer environment that they own.

- Makers are assigned the admin role in their newly created developer environments.

- By default, all developer environments created through environment routing are managed.

## Enable the environment routing setting

The **Environment routing** setting is disabled by default and must be enabled using [Power Platform admin center](https://admin.powerplatform.microsoft.com), or [PowerShell](/powershell/).

#### [Power Platform admin center](#tab/ppac)

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select **Settings**.
1. On the **Tenant settings** page, select **Environment routing**.
1. In the **Environment routing** pane, turn on the **Create personal developer environments for makers** option.
1. Select the desired user type to include in routing. The **All Makers** option routes all Power Apps makers into existing or new personal developer environments. The **New Makers** option routes new makers only.
1. (Optional) Select an environment group, to which the newly created developer environments are automatically assigned. This environment group inherits all the defined environment group rules. For more information, see [Environments groups](environment-groups.md).
1. (Optional) Admins can select a security group to limit routing only to the member makers of the configured security group. For more information, see [Configure security groups](../enterprise-templates/finance/sap-procurement/administer/configure-security-groups.md).

    :::image type="content" source="media/default-environment-routing/environment-routing.png" alt-text="Screenshot that shows where various Environment routing options in Tenant settings are located." lightbox="media/default-environment-routing/environment-routing.png":::


#### [PowerShell](#tab/powershell)

1. Sign in to your tenant account.

   ```powershell
   Add-PowerAppsAccount -Endpoint "prod" -TenantID <Tenant_ID>
   ```

1. Retrieve and store your tenant settings in `TenantSettings`.

   ```powershell
   $tenantSettings = Get-TenantSettings  
   ```

1. Set the `enableDefaultEnvironmentRouting` flag to **True**.

   ```powershell
   tenantSettings.powerPlatform.governance.enableDefaultEnvironmentRouting = $True
   Set-TenantSettings -RequestBody $tenantSettings
   ```
   
1. Set the `environmentRoutingAllMakers` flag to **True** to allow routing for all makers or **False** to limit routing to new makers.

   ```powershell
   tenantSettings = Get-TenantSettings
   tenantSettings.powerPlatform.governance | Add-Member -MemberType NoteProperty -Name 'environmentRoutingAllMakers' -Value $True -Force
   ```

1. (Optional) Set the `environmentRoutingTargetEnvironmentGroupId` to the desired Environment Group ID.

   ```powershell
   tenantSettings.powerPlatform.governance | Add-Member -MemberType NoteProperty -Name 'environmentRoutingTargetEnvironmentGroupId' -Value "<GUID for the group that has published rules>" -Force
   ```
1. (Optional) Set the `environmentRoutingTargetSecurityGroupId` to the desired Security Group.

   ```powershell
   tenantSettings.powerPlatform.governance | Add-Member -MemberType NoteProperty -Name 'environmentRoutingTargetSecurityGroupId' -Value "<GUID for the security group>" -Force

   ```
1. Save `TenantSettings`.
   ```powershell
   Set-TenantSettings -RequestBody $tenantSettings
   ```

**How to disable environment routing for your tenant using PowerShell** 
```powershell
tenantSettings = Get-TenantSettings  

tenantSettings.powerPlatform.governance.enableDefaultEnvironmentRouting = $False

Set-TenantSettings -RequestBody $tenantSettings
```

For more information about using PowerShell in Power Apps, see the [Overview](/powershell/powerapps/overview).

---

## Frequently asked questions (FAQs)

### Are the developer environments managed?

Yes, all the newly created developer environments are Managed Environments by default.

### What environment types are created when environment routing is enabled?

The created environments are developer environments.

### What roles do the makers get assigned in the developer environments?

The makers get assigned the admin security role in the developer environments.

### Can new makers switch to the default environment or other environments after launching their own developer environment?

Yes, makers can always switch to other environments.

### Does the developer environment affect my tenant Dataverse quota?

No, the developer environments don't affect your tenant Dataverse quota.

### What happens if the developer environment creation fails?

If the creation of the developer environment fails, makers are automatically routed to the default environment.

### What data loss prevention (DLP) policies are applied for the developer environment?

No specific DLP policies are assigned to the developer environment. The developer environment inherits existing, tenant-level DLP policies.

### What are the preconfigured Managed Environment settings for the newly created developer environments?

All developer environments have the following Managed Environment settings preconfigured:

- **Sharing limits**: Set to exclude sharing with security groups, and preconfigured to share with five individuals.

- **Solution Checker**: Set to **Warn**.

- **Usage insights**: Is selected.

- **Maker welcome message**: Not established.

### Is the environment routing also available for Power Automate, Microsoft Copilot Studio, and Power Pages?

Environment routing is currently limited to Power Apps only.

### Do I need to be a Power Platform tenant admin to enable this feature?

Yes, you need to have a Power Platform tenant admin privilege to enable this feature in your tenant, or you can ask your tenant admin to turn it on for you.

### Does creating an app or flow in a managed, developer environment require a premium license?

A premium license isn't required for the creation or preview of an app or flow in a managed developer environment. However, a user or maker needs a premium license to _run_ an app or flow in a managed developer environment.

### Does the default environment need to be managed to enable environment routing?

No, the default environment doesn't need to be managed to enable environment routing.

### Which development environment is the maker routed to if they have more than one developer environment?

The maker is always routed to their own existing personal developer environment, such as the developer environment created by them or on their behalf. If they created multiple developer environments, they're routed to the first one in alphabetical order.

### What happens if the Power Platform admin changes the Developer environment assignments setting from "Everyone" to "Only specific admins" while Environment routing is **On**? 

Changing the Developer environment assignments setting has no impact on environment routing.

### Where are makers routed to if they don’t have an existing developer environment?

If new or existing makers don’t have their own developer environment, they're routed to a new developer environment.
