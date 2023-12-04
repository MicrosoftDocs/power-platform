---
title: Default environment routing (preview)
description: Default environment routing is a premium, governance feature that allows Power Platform admins to automatically direct their *new makers* into their own, personal developer environments when they visit [make.powerapps.com](https://make.powerapps.com) for the first time. 
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

Default environment routing is a premium, governance feature. This feature allows Power Platform admins to automatically direct *new makers* into their own, personal developer environments when they visit [make.powerapps.com](https://make.powerapps.com) for the first time. Default environment routing offers new makers a personal, safe space to build with Microsoft Dataverse, without the fear of others accessing their apps or data.

Up until now, when the **Default environment routing** setting is enabled and a new maker visits [make.powerapps.com](https://make.powerapps.com) for the first time, the maker opens their own, personal developer environment, instead of the default environment. Personal, developer environments are makers' own space, similar to [OneDrive](https://www.microsoft.com/microsoft-365/onedrive/online-cloud-storage) for personal productivity where they can start building apps and solutions in their own workspace. New makers don't need to learn about which environment to work in since this happens automatically.

:::image type="content" source="media/EnvRouting-Bloge.png" alt-text="Upload the deployment profile.":::
    
Dataverse is available in developer environments, and these environments are [Managed Environments](managed-environment-overview.md) with the admin settings already preconfigured, such as sharing limits and solution checker. Admins no longer need to worry that their makers are working in the default environment, where their work can conflict with others.

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - By default, all developer environments created through environment routing are managed.
> - Managed Environment isn't included as an entitlement in the Developer Plan when users run their assets. For more information about Managed Environments and the Developer Plan, see [About the Power Apps Developer Plan](../developer/plan.md).
> - **Non-managed** developer environments are **unaffected** by this feature. Learn more about the developer environment and developer plan in [About the Power Apps Developer Plan](../developer/plan.md).

## Prerequisites

Default environment routing is a tenant-level, admin setting that:

-   Is enabled by Power Platform admins only.

-   Requires that the **Developer environment assignment** setting is enabled for **Everyone**.

    :::image type="content" source="media/developer-environments-assignment-everyone.png" alt-text="The Developer environment assignment setting must be enabled for Everyone.":::
    
-   Requires the use of Managed Environments, since all of the newly, created environments are managed. Users in a **managed** developer environment must have premium licenses to run Power Platform assets.

## Enable the Default environment routing setting

The **Default environment routing** setting is disabled by default and must be enabled using [Power Platform admin center](https://admin.powerplatform.microsoft.com), [PowerShell](/powershell/) or [Power Platform CLI](../developer/cli/introduction.md).

### Before you begin

Before you enable the **Default environment routing** feature, consider the following effects:

-   This feature enables the automatic creation of a personal, developer environment for all of your Power Apps new makers when they first launch [make.powerapps.com](https://make.powerapps.com). The definition of a new maker is limited to the makers who visit [make.powerapps.com](https://make.powerapps.com) for the first time. Returning makers who have visited the site before aren't impacted.

-   New makers are assigned the admin role in their newly created developer environments.

-   By default, all developer environments created through environment routing are managed.

### Enable the feature

#### [Power Platform admin center](#tab/ppac)

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com), in navigation pane, select **Settings**.
1. On the **Tenant settings** page, select **Environment routing (preview)**.
1. In the **Environment routing** pane, turn on the **Create personal developer enviroments for new makers** option.

   :::image type="content" source="media/environment-routing.png" alt-text="Turn on the 'Create personal developer environments for new makers' option.":::

#### [PowerShell](#tab/powershell)

1. Log in to your tenant account.

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

When trying to enable an environment routing tenant setting, keep the following points in mind:

- If the **Developer environment assignments** property is set for only _specific admins_, the command fails and an error message is displayed. To change this, go to Power Platform admin center > **Tenant settings** > **Developer environment assignments** and set it to **Everyone**.

## Disable the feature

To disable environment routing for your tenant, run the following PowerShell commands:

```powershell
$tenantSettings = Get-TenantSettings  

$tenantSettings.powerPlatform.governance.enableDefaultEnvironmentRouting = $False

Set-TenantSettings -RequestBody $tenantSettings
```

## Check if environment routing is turned on

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

Yes, all the newly, created developer environments are Managed Environments, by default.

### What environment types are created when the default environment routing is enabled?

The created environments are developer environments.

### What roles do the makers get assigned in the developer environments?

The makers get assigned the admin security role in the developer environments.

### Can new makers switch to the default environment, or any other environment they have access to, after launching their own developer environment?

Yes, makers can always switch to other environments.

### Will the developer environment impact my tenant Dataverse quota?

No, the developer environments don't impact your tenant Dataverse quota.

### What happens if the developer environment creation fails?

If for some reason, the creation of the developer environment fails, makers are automatically routed to the default environment.

### What data loss prevention (DLP) policies are applied for the developer environment?

During the preview, no specific DLP policies are assigned to the developer environment. Accordingly, the developer environment inherits existing, tenant-level DLP policies.

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

A premium license isn't required for the creation or preview of an app or flow in a managed, developer environment. However, a user or maker needs a premium license to *run* an app or flow in a managed, developer environment.

### Does the default environment need to be managed to enable environment routing?

No, the default environment doesn't need to be managed to enable environment routing. 
