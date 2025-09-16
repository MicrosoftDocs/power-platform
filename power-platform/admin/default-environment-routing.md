---
title: Environment routing
description: Learn how to use the environment routing governance feature. 
ms.component: pa-admin
ms.topic: how-to
ms.date: 06/24/2025
author: akadrno
ms.custom: NewPPAC
ms.author: kauguillard 
ms.reviewer: sericks
ms.subservice: admin
search.audienceType: 
  - admin
---

# Environment routing

Environment routing is a premium governance feature. This feature allows Power Platform admins to automatically direct new or existing makers into their own personal developer environments when they visit [copilotstudio.microsoft.com](https://copilotstudio.microsoft.com), [make.powerapps.com](https://make.powerapps.com/), or Power Automate Desktop. Environment routing offers makers a personal, safe space to build with Microsoft Dataverse without the fear of others accessing their apps or data.

> [!VIDEO 4e944970-757a-4c21-9349-83bf52672583]

When the **Environment routing** setting is enabled in [Power Platform admin center](https://admin.powerplatform.microsoft.com), the maker lands in their own personal developer environment instead of the default environment. Personal developer environments are the makers' own spaces, like OneDrive, for personal productivity where they can start building apps and solutions in their own workspace. Makers don't need to know which environment to work in, since the personal developer environment appears automatically.

:::image type="content" source="media/default-environment-routing/diagram-environment-routing.png" alt-text="Diagram showing how new and existing makers fit into the environment routing and environment group." lightbox="media/default-environment-routing/diagram-environment-routing.png":::
  
When the feature is turned on, the selected maker type (that is, new or existing makers), are directed into their own, personal developer environment. If the maker has access to one or more existing developer environments that aren't owned by them, they're routed to a new developer environment. 

Dataverse is available in developer environments, and these environments are [Managed Environments](managed-environment-overview.md) with the admin settings preconfigured according to the assigned environment group rules. Admins no longer need to worry that their makers are working in the default environment, where their work can conflict with others.

> [!IMPORTANT]
>
> - By default, all developer environments created through environment routing are managed.
> - Managed Environments isn't included as an entitlement in the Developer Plan when users run their assets. For more information about Managed Environments and the Developer Plan, see [About the Power Apps Developer Plan](../developer/plan.md).
> - **Non-managed** developer environments are **unaffected** by this feature. Learn more about the developer environment and developer plan in [About the Power Apps Developer Plan](../developer/plan.md).

## Multi-rule environment routing
Multi-rule environment routing is an advanced governance feature in Power Platform that allows tenant administrators to define multiple routing rules to control how makers are directed to development environments across various portals, such as Power Apps, Power Automate, and Copilot Studio. 

This capability builds on the original environment routing feature, which routed makers to a single environment group. The multi-rule enhancement introduces flexibility by allowing routing to multiple environment groups based on rule logic. This feature is especially useful for organizations where governance, security, and scalability are critical. It allows: 

- Fine-grained control over where makers build. 
- Consistent policy enforcement across environments. 
- Reduced risk of conflicts in shared or default environments.

All routed environments are Managed Environments, meaning they inherit standardized policies like data retention, AI features, and application lifecycle management (ALM) settings defined by the admin through environment groups.

## Prerequisites

Environment routing is a tenant-level admin setting. Understand that: 

- Only Power Platform admins can enable environment routing.

- It requires the use of Managed Environments, since all of the newly created environments are managed. Users in a _managed_ developer environment must have premium licenses to run Power Platform assets.

- A personal developer environment is automatically created for new or existing makers (depending on the configured user type) when accessing a supported product's maker portal.

- Routed makers land in their existing developer environment if they already have a developer environment that they own.

- Makers are assigned to the admin role in their newly created developer environments.

- By default, all developer environments created through environment routing are managed.

## Turn on environment routing in the admin center

The **Environment routing** setting is turned off by default and must be turned on using the Power Platform admin center&mdash;both the new admin center or the classic admin center&mdash.

#### [New admin center](#tab/new)

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).    
1. In the navigation pane, select **Manage**.   
1. In the **Manage** pane, select **Tenant settings**.   
1. In the **Tenant settings** page, select **Environment routing**. The **Create and manage environment routing rules** pane is displayed.   
1. In the **Turn on environment routing for** section, select the product portals for which you want to allow routing.      
1. Click **New rule** to define a new rule. The **Create a new routing rule** pane appears. Take the following action:
    1. In the **Name** field, enter a name for the rule.
    1. Apply the routing rule to **Everyone** or specific security groups.

        Selecting **Everyone** routes all makers into existing or new personal developer environments. Selecting a security group to limit routing only to the member makers of the configured security group.

    1. Select an environment group to which the newly created developer environments are automatically assigned. This environment group inherits all the defined, environment group rules. Learn more in [Environment groups](environment-groups.md).
    1. Click **Save**. The **Create and manage environment routing rules** pane is displayed again.
1. Use the arrow icons to change the priority of the rules. 

    When a maker accesses a portal, the system evaluates the rules in order and applies the first matching rule.

    - If a matching rule is found, the maker is routed to an existing or newly provisioned developer environment. 
    - If no rule matches, or if environment routing isn't turned on, the maker is routed to the default environment. 

1. Click **Save**.

#### [Classic admin center](#tab/classic)

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Settings**.
1. In the **Tenant settings** page, select **Environment routing**. The **Create and manage environment routing rules** pane is displayed.   
1. In the **Turn on environment routing for** section, select the product portals for which you want to allow routing.      
1. Click **New rule** to define a new rule. The **Create a new routing rule** pane appears. Do the following:
    1. In the **Name** field, enter a name for the rule.
    1. Apply the routing rule to **Everyone** or specific security groups.

        Selecting **Everyone** routes all makers into existing or new personal developer environments. Selecting a security group to limit routing only to the member makers of the configured security group.

    1. Select an environment group to which the newly created developer environments are automatically assigned. This environment group inherits all the defined, environment group rules. Learn more in [Environment groups](environment-groups.md).
    1. Click **Save**. The **Create and manage environment routing rules** pane is displayed again.
1. Use the arrow icons to change the priority of the rules. 

    When a maker accesses a portal, the system evaluates the rules in order and applies the first matching rule.

    - If a matching rule is found, the maker is routed to an existing or newly provisioned developer environment. 
    - If no rule matches, or if environment routing isn't turned on, the maker is routed to the default environment. 

1. Click **Save**.
---

## Turn on environment routing using PowerShell

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

### Turn off environment routing using PowerShell 
```powershell
tenantSettings = Get-TenantSettings  

tenantSettings.powerPlatform.governance.enableDefaultEnvironmentRouting = $False

Set-TenantSettings -RequestBody $tenantSettings
```

For more information about using PowerShell in Power Apps, see the [Overview](/powershell/powerapps/overview).


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

### What data policies are applied for the developer environment?

No specific data policies are assigned to the developer environment. The developer environment inherits existing, tenant-level data policies.

### What are the preconfigured Managed Environments settings for the newly created developer environments?

All developer environments have the following Managed Environments settings preconfigured:

- **Sharing limits**: Set to exclude sharing with security groups, and preconfigured to share with five individuals.

- **Solution Checker**: Set to **Warn**.

- **Usage insights**: Is selected.

- **Maker welcome message**: Not established.

### Is the environment routing also available for Power Automate, Microsoft Copilot Studio, and Power Pages?

Environment routing is currently available for Power Apps and Microsoft Copilot Studio.

### Do I need to be a Power Platform tenant admin to enable this feature?

Yes, you need to have a Power Platform tenant admin privilege to enable this feature in your tenant, or you can ask your tenant admin to turn it on for you.

### Does creating an app or flow in a managed developer environment require a premium license?

A premium license isn't required for the creation or preview of an app or flow in a managed developer environment. However, a user or maker needs a premium license to _run_ an app or flow in a managed developer environment.

### Does the default environment need to be managed to enable environment routing?

No, the default environment doesn't need to be managed to enable environment routing.

### Which development environment is the maker routed to if they have more than one developer environment?

The maker is always routed to their own existing personal developer environment, such as the developer environment created by them or on their behalf. If they created multiple developer environments, they're routed to the first one in alphabetical order.

### What happens if the Power Platform admin changes the developer environment assignments setting from "Everyone" to "Only specific admins" while environment routing is on? 

Changing the developer environment assignments setting has no impact on environment routing.

### Where are makers routed to if they don’t have an existing developer environment?

If new or existing makers don’t have their own developer environment, they're routed to a new developer environment.
