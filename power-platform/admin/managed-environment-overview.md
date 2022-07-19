---
title: Managed Environments overview
description: Use Managed Environments to view and control your Dynamics 365 applications and flows with less effort.
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
# Managed Environments overview

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Managed Environments is a suite of capabilities that allows admins to manage Power Platform at scale with more control, less effort, and more insights. Admins can use Managed Environments with any type of environment. [Learn how to enable Managed Environments](managed-environment-enable.md).

There are three primary elements of Managed Environments:

- [Weekly digests](managed-environment-weekly-digests.md)
- [Sharing limits](managed-environment-sharing-limits.md)
- [Data policies](managed-environment-data-policies.md) 

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

## License considerations

Managed Environments adds value to your existing premium Power Platform capabilities. All applications and flows in a managed environment are premium. They can be licensed using any of the Power Platform licensing options (per user, per app or flow, or pay-as-you-go) or Dynamics 365 licenses that give premium usage rights. [Learn more about Power Platform licensing](pricing-billing-skus.md).

During the public preview, we are not enforcing the premium license requirement for applications and flows in a managed environment.

:::image type="content" source="media/managed-environment-licensing.png" alt-text="Illustration of premium apps in a standard and a managed environment.":::

Standard environments:

- No Managed Environments features​ are available.
- Apps and flows can be either premium or non-premium.
- Users with either qualifying or non-qualifying licenses can run apps and flows.

Managed environments:

- All Managed Environments features​ are available.
- All apps and flows become premium.
- Users must have a qualifying license to run apps and flows.

### See also

[Enable Managed Environments](managed-environment-enable.md)  
[Weekly digests](managed-environment-weekly-digests.md)  
[Sharing limits](managed-environment-sharing-limits.md)  
[Data policies](managed-environment-data-policies.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
