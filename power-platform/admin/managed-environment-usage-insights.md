---
title: Usage insights
description: Stay informed about your managed environments with weekly digests.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/30/2023
author: mihaelablendea 
ms.author: amchern
ms.reviewer: sericks
ms.subservice: admin
ms.custom:
---

# Usage insights

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

<!-- https://go.microsoft.com/fwlink/?linkid=2194598 and 2211177 -->

Stay informed about what’s happening in your managed environments with Power Platform’s weekly admin digest. Analytics about your top apps, your most impactful makers, and inactive resources you can safely clean up are distilled and delivered to your mailbox once a week.

To enable a weekly email digest, select **Environments** in the navigation pane and then select a managed environment. On the command bar, select **Edit Managed Environments**, select the settings under **Usage insights**, and then select **Include insights for this environment in the weekly email digest**. 

:::image type="content" source="media/managed-environment-weekly-digest-include-environmenta.png" alt-text="Screenshot of the Managed Environments settings, with the Include this environment option highlighted.":::

> [!NOTE]
> - You must [enable tenant-level analytics](tenant-level-analytics.md#how-do-i-enable-tenant-level-analytics) to get usage insights. 
> - Currently, usage insights aren’t available in sovereign clouds, such as Government Community Cloud (GCC), Government Community Cloud – High (GCC High), Department of Defense (DoD), and Power Platform and Dynamics 365 services in China.

## What information is provided in the weekly digest?

The first section of the weekly digest shows the number of apps used and active users in your managed environments in the past month.

:::image type="content" source="media/managed-environment-weekly-digest-first-section.png" alt-text="Screenshot of the first section of a Managed Environments weekly digest.":::

The second section lists apps and flows that haven't been launched in a while. The **Last launch** column shows the last date a user launched the application or flow. If the application or flow has never been launched, the column contains “None." If an app or flow isn't being used, we recommend that you work with its owner to update or remove it.

:::image type="content" source="media/managed-environment-weekly-digest-second-section.png" alt-text="Screenshot of the second section of a Managed Environments weekly digest.":::

The third section shows the most popular apps and flows in your managed environments in the past month, indicated by the number of sessions and runs. When a user launches and interacts with an application, that's considered a session. It also shows the top makers over the past month, as measured by total sessions of apps they own.

:::image type="content" source="media/managed-environment-weekly-digest-third-section.png" alt-text="Screenshot of the third section of the Managed Environments weekly digest.":::

## Which environments are included in the weekly digest?

The weekly digest provides insights into all managed environments in your tenant that you haven't excluded from reporting.

To include a managed environment in the weekly digest, select **Include insights for this environment in the weekly email digest** in the **Usage insights** section of the Managed Environment settings. If you exclude all your managed environments, Power Platform won't send a weekly digest.

:::image type="content" source="media/managed-environment-weekly-digest-include-environmenta.png" alt-text="Screenshot of the Managed Environments settings, with the Include this environment option highlighted.":::

> [!NOTE]
> Clear the check box to exclude a managed environment. If you exclude all your managed environments, Power Platform won't send a weekly digest.

## Who can receive the weekly digest?

The weekly digest is sent to all users with the roles of [Power Platform administrator](use-service-admin-role-manage-tenant.md#power-platform-administrator) and [Dynamics 365 service administrator](use-service-admin-role-manage-tenant.md#dynamics-365-administrator).

To add more recipients, select **Add additional recipients for the weekly email digest**, and then select **Weekly digest**. Enter email addresses in the Additional recipients box.

:::image type="content" source="media/managed-environment-weekly-digest-email-recipients.png" alt-text="Screenshot of the Managed Environments settings, with the Additional recipients box highlighted.":::

You can also select **Settings** from the left-side menu, and then select **Weekly digest** to add additional recipients.

### Use PowerShell to add and remove recipients

You can also use PowerShell to add and unsubscribe email addresses.

#### Add email recipients

Here's an example PowerShell script that adds two recipients. After you run it, the new addresses appear in the **Additional recipients** box in the **Usage insights** section of the Managed Environments settings.

```powershell
$tenantSettings = Get-TenantSettings  
($tenantSettings.powerPlatform.governance) | Add-Member -MemberType NoteProperty -Name additionalAdminDigestEmailRecipients -Value 'fakeEmail@contoso.com;otherFakeEmail@contoso.com'  
Set-TenantSettings -RequestBody $tenantSettings 
```

#### Remove email recipients

Here's an example PowerShell script that unsubscribes your entire organization from the weekly digest.

```powershell
$tenantSettings = Get-TenantSettings  
$tenantSettings.powerPlatform.governance.disableAdminDigest = $True  
Set-TenantSettings -RequestBody $tenantSettings 
```

To resubscribe everyone, set the value for `$tenantSettings.powerPlatform.governance.disableAdminDigest` to `$False`.

### See also
[Managed Environments overview](managed-environment-overview.md)  <br />
[Enable Managed Environments](managed-environment-enable.md)  <br />
[Limit sharing](managed-environment-sharing-limits.md)  <br />
[Data policies](managed-environment-data-policies.md)  <br />
[Licensing](managed-environment-licensing.md)  <br />
[View license consumption (preview)](view-license-consumption-issues.md) <br />
[Tenant settings](tenant-settings.md)



[!INCLUDE[footer-include](../includes/footer-banner.md)]
