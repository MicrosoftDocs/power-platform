---
title: "Add teams or users to a column security profile to control access"
description: "Learn how to control team and user access to columns by using column security profiles. Manage permission to read, create, or write in secured column."
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/19/2022
author: praveenmantha
ms.subservice: admin
ms.author: pmantha
ms.reviewer: sericks
ms.custom: "admin-security"
search.audienceType: 
  - admin
---
# Add teams or users to a column security profile to control access

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Role-based security controls access to a specific table type, row-based security controls access to individual rows, and column-level security controls access to specific columns. You can use a column security profile to manage the permission of users and teams to read, create, or write in secured columns. For example, the System Administrator column security profile gives full access to all secured columns.  

> [!NOTE]
> The use of table-related terminology depends on the protocol or class library used. See [Terminology use depending on protocol or technology](/power-apps/developer/data-platform/understand-terminology).
  
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) with System Administrator security role or equivalent permissions.

2. Select the environment to add teams or users to a column security profile. 

3. Select **Settings** > **Users + permissions** > **Column security profiles**.  

4. Select an existing profile, or select **New Profile**, enter a name, enter a description, and then select **Save**.  

5. Select the **Teams** or **Users** tab to add teams or users. 

6. When finished adding teams or users, select **Add**. 

  
### See also

[Column-level security to control access](field-level-security.md)
 




[!INCLUDE[footer-include](../includes/footer-banner.md)]
