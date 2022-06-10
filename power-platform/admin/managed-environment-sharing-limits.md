---
title: "Sharing limits | MicrosoftDocs"
description: Learn how to use Managed Environment to enable sharing limits.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/27/2022
author: alaug 
ms.author: alaug
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
# Sharing limits 

<!-- https://go.microsoft.com/fwlink/?linkid=2194484 -->

Managed Environment allow admins to influence how broadly makers can share canvas apps. There are two sharing controls.  

|Sharing control   |System behavior when checked?   |
|---------|---------|
|**Exclude sharing with security groups**      | Makers cannot share canvas apps with any security group. <br />Admins get the option to proceed with setting a limit on  individuals shared to.          |
|**Limit total individuals who can be shared to**     |  Makers cannot share canvas apps with more individuals than specified in the text box.        |

**Limit total individuals who can be shared to** is only enabled if **Exclude sharing with security groups** is checked. This is because security groups may have unbounded membership. For instance, a Maker could share an app with a security group that has 5 members one day and, in the future after the app was shared, the security group could grow to 500 members.  

> [!NOTE]
> Sharing rules are enforced when makers attempt to share an app. Sharing rules do not change the audience apps in an environment that are already shared with.  

:::image type="content" source="media/managed-environment-limit-sharing.png" alt-text="Managed Environment limit sharing":::


### See also  
[Managed Environment overview](managed-environment-overview.md) <br />
[Enable Managed Environment](managed-environment-enable.md) <br />
[Weekly digests](managed-environment-weekly-digests.md) <br />
[Data policies](managed-environment-data-policies.md)




[!INCLUDE[footer-include](../includes/footer-banner.md)]

