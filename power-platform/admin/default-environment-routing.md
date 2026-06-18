---
title: Environment routing
description: Learn how to use the environment routing governance feature. 
ms.component: pa-admin
ms.topic: how-to
ms.date: 12/15/2025
author: akadrno
ms.custom: NewPPAC
ms.author: matow
ms.reviewer: angieandrews
ms.subservice: admin
search.audienceType: 
  - admin
---

# Environment routing

Environment routing is a premium governance feature. This feature allows Power Platform admins to automatically direct new or existing makers into their own personal developer environments when they visit [Copilot Studio](https://copilotstudio.microsoft.com), [Power Apps](https://make.powerapps.com/), [Power Automate](https://make.powerautomate.com), or Power Automate for desktop. Environment routing offers makers a personal, safe space to build with Microsoft Dataverse without the fear of others accessing their apps or data.<br/><br/>

> [!IMPORTANT]
> Below are Microsoft managed apps related changes to the environment routing feature.
> - Environment routing is enabled automatically for Microsoft managed apps in all tenants. This cannot be changed at this time.
>   - Tenants without any routing configuration will notice Managed apps selected by default. Admins are required to enable environment routing for other products manually.
>   - Tenants that enabled routing for any of the Power Platform or Copilot Studio will notice Managed apps selected in addition to their prior selection.
>   - Makers in tenants with routing enabled for managed apps alone will not be routed to their personal developer enviornments when they visit Power Apps, Power Automate, or Copilot Studio maker surfaces. They can continue to build in default or other environments where they have maker permissions.
> - A new routing rule is added automatically to route all makers in the tenant to their own personal developer environments.
>   - Tenants without any routing rules will notice a single routing rule that routes _Everyone_ in the tenant to their personal developer environments. A new _Default Environment Group_ is also created automatically, and managed apps specific rules are applied to this group, to route all these personal developer environments.
>   - New routing rule is not added to tenants with routing rules. Note that some makers in these tenants may not be able build managed apps and an admin should create a new "Everyone" routing rule to ensure makers do not end up building managed apps in the default or other environments.
>   - Admins cannot delete routing rule that routes _Everyone_ to an environment group. Only one routing rule is allowed to target _Everyone_. Tenants with multiple routing rules targeting _Everyone_ will be required to clean up the configuration before making any changes to the routing rules.
>   - Routing rule targeting _Everyone_ must be the last rule in the priority. Any tenants with routing rule configuration that placed a routing rule targeting _Everyone_ above a security group is required to adjust the priority before making any further changes.
>   - New routing rules cannot be created without selecting an environment group.
> - Makers using Managed apps using the CLI or any other maker surfaces will be routed automatically to their personal developer environments.
>   - The personal developer environments created for managed apps will be managed environments by default.
>   - Makers who do not create Power Apps, Power Automate, or Copilot Studio resources in these personal developer environments will not require premium licenses to those products. Auto claim will not be applicable in this scenario.
>   - Makers who create Power Apps, Power Automate, or Copilot Studio in their personal developer environment created using managed apps, by explictly selecting this environment in the environment picker or routed to this environment automatically due to the routing configuration done by the admin, will require premium licenses as required to be compliant with managed environments. Auto claim will be applicable in this scenario.
>   - Personal developer environments created for managed apps will not have Dataverse. Makers or admins can manually add Dataverse to these environments from the Power Platform Admin Center.
>   - Dataverse is automatically added to the personal developer environments created for managed apps when the maker visits Power Apps, Power Automate, or Copilot Studio maker surfaces and explictly selects this environment in the environment picker or routed to this environment automatically due to the routing configuration done by the admin.

In this video, check out what's new with environment routing in the Power Platform admin center.<br/><br/>
> [!VIDEO 4e944970-757a-4c21-9349-83bf52672583]

When the **Environment routing** setting is enabled in [Power Platform admin center](https://admin.powerplatform.microsoft.com), the maker lands in their own personal developer environment instead of the default environment. Personal developer environments are the makers' own spaces, like OneDrive, for personal productivity where they can start building apps and solutions in their own workspace. Makers don't need to know which environment to work in, since the personal developer environment appears automatically.

:::image type="content" source="media/default-environment-routing/diagram-environment-routing.png" alt-text="Diagram showing how new and existing makers fit into the environment routing and environment group." lightbox="media/default-environment-routing/diagram-environment-routing.png":::
  
When the feature is turned on, the selected maker type (that is, new or existing makers), are directed into their own, personal developer environment. If the maker has access to one or more existing developer environments that aren't owned by them, they're routed to a new developer environment.

Dataverse is available in developer environments, and these environments are [Managed Environments](managed-environment-overview.md) with the admin settings preconfigured according to the assigned environment group rules. Admins no longer need to worry that their makers are working in the default environment, where their work can conflict with others.

> [!IMPORTANT]
>
> - By default, all developer environments created through environment routing are managed.
> - Managed Environments isn't included as an entitlement in the Developer Plan when users run their assets. For more information about Managed Environments and the Developer Plan, see [Power Apps Developer Plan Guide: Features and Benefits](../developer/plan.md).
> - **Non-managed** developer environments are **unaffected** by this feature. Learn more about the developer environment and developer plan in [Power Apps Developer Plan Guide: Features and Benefits](../developer/plan.md).

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

The **Environment routing** setting is turned off by default and must be turned on using the Power Platform admin center.

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).    
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Tenant settings**.  
1. In the **Tenant settings** page, select **Environment routing**. The **Create and manage environment routing rules** pane is displayed.  
1. In the **Turn on environment routing for** section, select the product portals for which you want to allow routing.
1. Select **New rule** to define a new rule. The **Create a new routing rule** pane appears. Take the following action:
    1. In the **Name** field, enter a name for the rule.
    1. Apply the routing rule to **Everyone** or specific security groups.

        Selecting **Everyone** routes all makers into existing or new personal developer environments. Selecting a security group to limit routing only to the member makers of the configured security group.

    1. Select an environment group to which the newly created developer environments are automatically assigned. This environment group inherits all the defined, environment group rules. Learn more in [Environment groups](environment-groups.md).
    1. Select **Save**. The **Create and manage environment routing rules** pane is displayed again.
1. Use the arrow icons to change the priority of the rules. 

    When a maker accesses a portal, the system evaluates the rules in order and applies the first matching rule.

    - If a matching rule is found, the maker is routed to an existing or newly provisioned developer environment.
    - If no rule matches, or if environment routing isn't turned on, the maker is routed to the default environment.

1. Select **Save**.

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

### Is the environment routing also available for Power Pages?

Environment routing is currently available for Microsoft Copilot Studio, Power Apps, and Power Automate cloud and desktop workflows.

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
