---
title: Default environment routing (preview)
description: Learn how to use the default environment routing governance feature. 
ms.component: pa-admin
ms.topic: conceptual
ms.date: 12/01/2023
author: hasharaf 
ms.author: hasharaf 
ms.reviewer: sericks
ms.subservice: admin
search.audienceType: 
  - admin
---


# Default environment routing (preview)

[This article is prerelease documentation and is subject to change.]

Default environment routing is a premium, governance feature. This feature allows Power Platform admins to automatically direct new or existing makers into their own personal developer environments when they visit [make.powerapps.com](https://make.powerapps.com/). Default environment routing offers makers a personal, safe space to build with Microsoft Dataverse without the fear of others accessing their apps or data.

When the **Default environment routing** setting is enabled in [make.powerapps.com](https://make.powerapps.com/), the maker opens their own personal developer environment instead of the default environment. Personal developer environments are the makers' own spaces, like OneDrive, for personal productivity where they can start building apps and solutions in their own workspace. Makers don't need to know which environment to work in, since the personal developer environment appears automatically.

:::image type="content" source="media/default-environment-routing/diagram-environment-routing.png" alt-text="Diagram showing how new and existing makers fit into the environment routing and environment group.":::

This example shows you how environment routing activates when the feature is turned on.

Let's say you have your own development environment and you decide to add another user to your environment. The user isn't the owner of that development environment, so when you try to add them, a new development environment is created for them. The user is routed to their new environment, not your own.

Dataverse is available in developer environments, and these environments are [Managed Environments](managed-environment-overview.md) with the admin settings already preconfigured, such as sharing limits and solution checker. Admins no longer need to worry that their makers are working in the default environment, where their work can conflict with others.

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - By default, all developer environments created through environment routing are managed.
> - Managed Environment isn't included as an entitlement in the Developer Plan when users run their assets. For more information about Managed Environments and the Developer Plan, see [About the Power Apps Developer Plan](../developer/plan.md).
> - **Non-managed** developer environments are **unaffected** by this feature. Learn more about the developer environment and developer plan in [About the Power Apps Developer Plan](../developer/plan.md).

## Before you begin

Default environment routing is a tenant-level, admin setting that:

- Only Power Platform admins can enable.

- Requires the **Developer environment assignment** setting to be enabled for **Everyone**.

    :::image type="content" source="media/default-environment-routing/developer-environments-assignment-everyone.png" alt-text="The Developer environment assignment setting must be enabled for Everyone." lightbox="media/default-environment-routing/developer-environments-assignment-everyone.png":::

- Requires the use of Managed Environments, since all of the newly, created environments are managed. Users in a _managed_ developer environment must have premium licenses to run Power Platform assets.

- A personal developer environment is automatically created for all of your Power Apps new or existing makers when they go to [make.powerapps.com](https://make.powerapps.com) for the first time. Returning makers who revisit the site aren't impacted.

- Makers are assigned the admin role in their newly created developer environments.

- By default, all developer environments created through environment routing are managed.


## Enable the default environment routing setting

The **Default environment routing** setting is disabled by default and must be enabled using [Power Platform admin center](https://admin.powerplatform.microsoft.com), [PowerShell](/powershell/), or [Power Platform CLI](../developer/cli/introduction.md).


#### [Power Platform admin center](#tab/ppac)

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com),  select **Settings**.
1. On the **Tenant settings** page, select **Environment routing (preview)**.
1. In the **Environment routing** pane, turn on the **Create personal developer environments for new makers** option.
1. Select the desired user type to include in routing. The **All Makers** option routes all Power Apps makers into existing or new personal developer environments. The **New Makers** option routes new makers only.
1. (Optional) Select an environment group, to which the newly created developer environments are automatically assigned. This environment group inherits all the defined environment group rules. For more information, see [Environments groups (preview)](environment-groups.md).
1. (Optional) Admins can select a security group to limit routing only to the member makers of the configured security group. For more information, see [Configure security groups](../enterprise-templates/finance/sap-procurement/administer/configure-security-groups.md).

:::image type="content" source="media/default-environment-routing/environment-routing.png" alt-text="Screenshot that shows where various Environment routing options in Tenant settings are located." lightbox="media/default-environment-routing/environment-routing.png":::


> [!TIP]
> If the **Developer environment assignments** property is set to **Only specific admins**, environment routing fails and an error message is displayed. Be sure that the tenant setting for **Developer environment assignments** is set to **Everyone**.

#### [PowerShell](#tab/powershell)

1. Sign in to your tenant account.

   ```powershell
   $Add-PowerAppsAccount -Endpoint "prod" -TenantID &lt;Tenant\_ID&gt;
   ```

1. Retrieve and store your tenant settings in tenantSettings.

   ```powershell
   $tenantSettings = Get-TenantSettings  
   ```
  
1. Set the **enableDefaultEnvironmentRouting** flag to **True**.

   ```powershell
   $tenantSettings.powerPlatform.governance.enableDefaultEnvironmentRouting = $True
   
   Set-TenantSettings -RequestBody $tenantSettings
   ```

#### [Power Platform CLI](#tab/pacCLI)

1. Create an authentication profile.

   ```powershell
   pac auth create
   ```

1. Retrieve and store your tenant settings in JSON file.

   ```powershell
   pac admin list-tenant-settings --settings-file <settings_file_path>
   ```

1. Set the **enableDefaultEnvironmentRouting** flag to **true** in the JSON file.

   :::image type="content" source="media/environment-routing2.png" alt-text="Set the enableDefaultEnvironmentRouting flag to true.":::

1. Update the tenant settings.

   ```powershell
   pac admin update-tenant-settings --settings-file <settings_file_path>
   ```

---

## Disable the feature using PowerShell 

To disable environment routing for your tenant, run these PowerShell commands:

```powershell
$tenantSettings = Get-TenantSettings  

$tenantSettings.powerPlatform.governance.enableDefaultEnvironmentRouting = $False

Set-TenantSettings -RequestBody $tenantSettings
```

## Check if environment routing is turned on using PowerShell 

Admins can run the following cmdlet to confirm if environment routing is enabled for their tenant's default environment. The **enableDefaultEnvironmentRouting** flag should be set to **True**.

```powershell
$Get-TenantSettings

$tenantSettings = Get-TenantSettings

$tenantSettings.powerPlatform.governance

*disableAdminDigest: False*

*additionalAdminDigestEmailRecipients: email@myorg.com*

*disableDeveloperEnvironmentCreationByNonAdminUsers: False*

***enableDefaultEnvironmentRouting**: **True***

*policy: @{enableDesktopFlowDataPolicyManagement=False}*
```

## Frequently asked questions (FAQs)

### Are the developer environments managed?

Yes, all the newly created developer environments are Managed Environments by default.

### What environment types are created when the default environment routing is enabled?

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

During the preview, no specific DLP policies are assigned to the developer environment. The developer environment inherits existing, tenant-level DLP policies.

### What are the preconfigured Managed Environment settings for the newly created developer environments?

All developer environments have the following Managed Environment settings preconfigured:

- **Sharing limits**: Set to exclude sharing with security groups, and preconfigured to share with five individuals.

- **Solution Checker**: Set to **Warn**.

- **Usage insights**: Is selected.

- **Maker welcome message**: Not established.

### Is the default environment routing also available for Power Automate, Power Virtual Agents, and Power Pages?

During the preview, the default environment routing is limited to Power Apps only.

### Do I need to be a Power Platform tenant admin to enable this feature?

Yes, you need to have a Power Platform tenant admin privilege to enable this feature in your tenant, or you can ask your tenant admin to turn it on for you.

### Does creating an app or flow in a managed, developer environment require a premium license?

A premium license isn't required for the creation or preview of an app or flow in a managed, developer environment. However, a user or maker needs a premium license to _run_ an app or flow in a managed, developer environment.

### Does the default environment need to be managed to enable environment routing?

No, the default environment doesn't need to be managed to enable environment routing.

### Which development environment is the maker routed to if they have more than one developer environment?

The maker is always routed to their own existing personal developer environment, such as the developer environment created by them or on their behalf. If they created multiple developer environments, they're routed to the first one in alphabetical order.

### Where are makers routed to if they don’t have an existing developer environment?

If new or existing makers don’t have their own developer environment, they're routed to a new developer environment.
