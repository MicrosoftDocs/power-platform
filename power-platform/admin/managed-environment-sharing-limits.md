---
title: "Sharing limits | MicrosoftDocs"
description: Learn how to use environment management to enable sharing limits.
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
# Sharing limits 

Managed environments allow admins to influence how broadly makers can share canvas apps. There are two sharing controls.  

|Sharing control   |System behavior when checked?   |
|---------|---------|
|**Exclude sharing with security groups**      | Makers cannot share canvas apps with any security groups. <br />Admins get the option to proceed with setting a limit on  individuals shared to.          |
|**Limit total individuals who can be shared to**     |  Makers cannot share canvas apps with more individuals than specified in the text box.        |

**Limit total individuals who can be shared to** is only enabled if **Exclude sharing with security groups** is checked. This is because security groups may have unbounded membership. For instance, a Maker could share an app with a security group that has 5 members one day and, in the future after the app was shared, the security group could grow to 500 members.  

> [!NOTE]
> Sharing rules are enforced when makers attempt to share an app. Sharing rules do not change the audience apps in an environment are already shared with.  

screenshot


### See also  



[!INCLUDE[footer-include](../includes/footer-banner.md)]

