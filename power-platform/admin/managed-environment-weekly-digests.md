---
title: Weekly digests
description: Stay informed about your managed environments with weekly digests.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/07/2022
author: mikferland-msft
ms.author: miferlan
ms.reviewer: jimholtz
contributors:
  - mikferland-msft
  - alaug 
ms.subservice: admin
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Weekly digests

<!-- https://go.microsoft.com/fwlink/?linkid=2194598 -->

Stay informed about what’s happening in your managed environments with Power Platform’s weekly admin digest. Analytics about your top apps and flows, your most impactful makers, and inactive resources you can safely clean up are distilled and delivered to your mailbox once a week.

## What information is provided in the weekly digest?

The first section of the weekly digest shows the number of apps and flows used and active users in your managed environments in the past month.

:::image type="content" source="media/managed-environment-weekly-digest-first-section.png" alt-text="Screenshot of the first section of a Managed Environments weekly digest.":::

The second section lists apps that haven't been launched in a while. The **Last launch** column shows the last date a user launched the application. If the application has never been launched, the column contains “None." If an app isn't being used, we recommend that you work with its owner to update or remove it.

> [!NOTE]
> You must [enable tenant-level analytics](tenant-level-analytics.md#how-do-i-enable-tenant-level-analytics) to get these insights.

:::image type="content" source="media/managed-environment-weekly-digest-second-section.png" alt-text="Screenshot of the second section of a Managed Environments weekly digest.":::

The third section shows the most popular apps and flows in your managed environments in the past month, indicated by the number of sessions and runs. When a user launches and interacts with an application, that's considered a session.

:::image type="content" source="media/managed-environment-weekly-digest-third-section.png" alt-text="Screenshot of the third section of the Managed Environments weekly digest.":::

## Which environments are included in the weekly digest?

The weekly digest provides insights into all managed environments in your tenant that you haven't excluded from reporting.

To exclude a managed environment from the weekly digest, clear **Include this environment** in the **Weekly digest** section of the Managed Environment settings. If you exclude all your managed environments, Power Platform won't send a weekly digest.

:::image type="content" source="media/managed-environment-weekly-digest-include-environment.png" alt-text="Screenshot of the Managed Environments settings, with the Include this environment option highlighted.":::

## Who can receive the weekly digest?

The weekly digest is sent to all users with the [Power Platform administrator](use-service-admin-role-manage-tenant.md#power-platform-administrator) and [Dynamics 365 service administrator](use-service-admin-role-manage-tenant.md#dynamics-365-administrator) roles.

To add more recipients, enter their email addresses in the **Email recipients** box in the **Weekly digest** section of the Managed Environment settings.

:::image type="content" source="media/managed-environment-weekly-digest-email-recipients.png" alt-text="Screenshot of the Managed Environments settings, with the Email recipients box highlighted.":::

### Use PowerShell to add and remove recipients

You can also use PowerShell to add and unsubscribe email addresses.

#### Add email recipients

Here's an example PowerShell script that adds two recipients. After you run it, the new addresses appear in the **Email recipients** box in the **Weekly digest** section of the Managed Environment settings.

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

[Managed Environments overview](managed-environment-overview.md)  
[Enable Managed Environments](managed-environment-enable.md)  
[Sharing limits](managed-environment-sharing-limits.md)  
[Data policies](managed-environment-data-policies.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
