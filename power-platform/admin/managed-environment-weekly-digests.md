---
title: "Weekly digests | MicrosoftDocs"
description: Learn how to use environment management to enable weekly digests.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/27/2022
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
Stay informed about what’s happening in your managed environments with Power Platform’s new weekly admin digest. Analytics about your top apps and flows, your most impactful makers, and inactive resources you can safely clean up are distilled and delivered directly to your mailbox once per week.

:::image type="content" source="media/managed-environment-weekly-digest.png" alt-text="Managed Environment weekly admin digest":::

## What information is depicted in the weekly digest?

The first section of the weekly digest depicts:

- The number of apps used in the past month in your managed environments
- The number of flows used in the past month in your managed environments
- The number of active users in the path month in your managed environments

:::image type="content" source="media/managed-environment-weekly-digest-first-section.png" alt-text="Managed Environment weekly digest first section":::

The second section of the email depicts applications that have not been launched in a while. If they are not being used, we recommend that you work with the owners of those applications to either update them or remove them. The “Last launch” column represents the last time when a user launched the application. Typically, it will be depicted as a date. If the application has never been launched, then it will be displayed as “None”.

> [!NOTE]
> You must [enable tenant-level analytics](tenant-level-analytics.md#how-do-i-enable-tenant-level-analytics) to obtain these insights.

:::image type="content" source="media/managed-environment-weekly-digest-second-section.png" alt-text="Managed Environment weekly digest second section":::

The third section of the email depicts the most popular applications and the most popular flows within your managed environments in the past month. The most popular applications are the ones that have the highest number of sessions. When an end user opens and interacts with an application, that is considered as one session. If that same end user repeats the process another time, that is considered as another session. The most popular flows are the ones that have been executed the highest number of times.

:::image type="content" source="media/managed-environment-weekly-digest-third-section.png" alt-text="Managed Environment weekly digest third section":::

## Which environments are included in the weekly digest?

This weekly digest provides insights into all managed environments in your tenant. You can exclude a managed environment from the weekly digest with the “Include this environment” checkbox under the “Weekly digest” section of the “Edit Environment Management” settings panel. If you have five managed environments and one of them is excluded from the analysis, then your weekly digest will provide insights into four managed environments. If you exclude all your managed environments, Power Platform will refrain from sending your weekly digest.


:::image type="content" source="media/managed-environment-weekly-digest-include-environment.png" alt-text="Managed Environment include this environment":::

## Who can receive the weekly digest?

This weekly admin digest is sent to all users with the [Power Platform administrator](use-service-admin-role-manage-tenant.md#power-platform-administrator) and [Dynamics 365 service administrator](use-service-admin-role-manage-tenant.md#dynamics-365-administrator) roles. You can add additional recipients by adding their email addresses in the “Email recipients” textbox under the “Weekly digest” section of the “Edit Managed Environments” settings panel in the Power Platform admin center. If you add “anotherAdmin@email.com”, then the weekly digest will be sent to Power Platform administrators, Dynamics 365 administrators, and “anotherAdmin@email.com”.

:::image type="content" source="media/managed-environment-weekly-digest-email-recipients.png" alt-text="Managed Environment email recipients to get weekly digest":::

### See also  
[Managed Environment overview](managed-environment-overview.md) <br />
[Enable Managed Environment](managed-environment-enable.md) <br />
[Sharing limits](managed-environment-sharing-limits.md)  <br />
[Data policies](managed-environment-data-policies.md)



[!INCLUDE[footer-include](../includes/footer-banner.md)]
