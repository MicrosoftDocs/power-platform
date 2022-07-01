---
title: "Managed Environments overview | MicrosoftDocs"
description: Use Managed Environments to gain more visibility and control of your Dynamics 365 applications and flows, with less effort.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/01/2022
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
# Managed Environments for Power Platform overview

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Managed Environments for Power Platform is a suite of capabilities that allows admins to manage Power Platform at scale with more control, less effort, and more insights. Admins can enable Managed Environments on any type of environment. There are four primary elements of Managed Environments: 

- [Enable Managed Environments](managed-environment-enable.md)
- [Weekly digests](managed-environment-weekly-digests.md)
- [Sharing limits](managed-environment-sharing-limits.md)
- [Data policies](managed-environment-data-policies.md) 

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

## License considerations

Managed Environments represents a value-add on top of  existing premium Power Platform capabilities. All applications and flows in a managed environment are premium and can be licensed using any of the Power Platform licensing options (per user, per app/flow or pay-as-you-go) or Dynamics 365 licenses that give premium usage rights. 

During the public preview the premium license requirement for applications and flows within a managed environment is not enforced. 

<table style="width:100%">
<thead>
  <tr>
    <th colspan="3">:::image type="content" source="media/managed-environment-licensing.png" alt-text="Non-managed environments" border="false"::: </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td width="40%"><ul><li>No Managed Environments features​</li> <br /><li>Premium and non-premium assets (apps/flows)​</li><br /><li>Users with qualifying and non-qualifying licenses</li></ul></td>
    <td width="20%"></td>
    <td width="40%"><ul><li>Includes Managed Environments features​ </li><br /><li>All low code assets (apps/flows) become premium ​</li><br /> <li>Users must have a qualifying license to access the assets </li></ul> </td>
  </tr>
</tbody>
</table>

|  | | |
|---------|---------|---------|
|:::image type="content" source="media/managed-environment-licensing.png" alt-text="Non-managed environments" border="false":::     |  |  |
|<ul><li>No Managed Environments features​</li> <br /><li>Premium and non-premium assets (apps/flows)​</li><br /><li>Users with qualifying and non-qualifying licenses</li></ul>     |         | <ul><li>Includes Managed Environments features​ </li><br /><li>All low code assets (apps/flows) become premium ​</li><br /> <li>Users must have a qualifying license to access the assets </li></ul>       |


|  | | |
|---------|---------|---------|
|:::image type="content" source="media/non-managed-environment-left.png" alt-text="Non-managed environments" border="false":::     | :::image type="content" source="media/managed-environment-arrow.png" alt-text="arrow" border="false":::        | :::image type="content" source="media/managed-environment-right.png" alt-text="managed environments" border="false":::        |
|<ul><li>No Managed Environments features​</li> <br /><li>Premium and non-premium assets (apps/flows)​</li><br /><li>Users with qualifying and non-qualifying licenses</li></ul>     |         | <ul><li>Includes Managed Environments features​ </li><br /><li>All low code assets (apps/flows) become premium ​</li><br /> <li>Users must have a qualifying license to access the assets </li></ul>       |

### See also  
[Enable Managed Environments](managed-environment-enable.md) <br />
[Weekly digests](managed-environment-weekly-digests.md) <br />
[Sharing limits](managed-environment-sharing-limits.md)  <br />
[Data policies](managed-environment-data-policies.md)





[!INCLUDE[footer-include](../includes/footer-banner.md)]


