---
title: "Delete a business unit from an environment"
description: "Learn how to deactivate and delete a business unit from an environment. Learn about the considerations before taking this irreversible action."
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/10/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Delete a business unit

You can delete a business unit to completely remove it.  
  
> [!IMPORTANT]
>  Before deleting a business unit, be sure to consider the following:  
>   
> -   Deleting a business unit is irreversible.  
> -   The records owned by the business unit (for example: Teams, Facilities/Equipment, and Resource Groups) are deleted at the same time you delete the business unit.  
> -   You can't delete a business unit until you reassign all the business unit records to another business unit.  

1. In the Microsoft Power Platform admin center, select an environment. 

2. Select **Settings** > **Users + permissions** > **Business units**.  
  
3. Click to select the business unit that you want to delete.  
  
4. On the Actions toolbar, choose **More Actions** > **Disable**.  
  
> [!IMPORTANT]
> When you disable a business unit, all users and teams associated with the business unit will not be able to sign in. You will need to reparent users and teams to another business unit and reassign security roles.

5. In the **Confirm Deactivation** dialog box, choose **Deactivate**.  
  
6. Change the view to **Inactive Business Units**.

7. Select the business unit to delete, and then choose the **Delete** icon ![Delete button](../admin/media/delete.png "Delete button").  
  
8. In the **Confirm Deletion** dialog box, choose **Delete**.  
  
> [!TIP]
> If you get an error, be sure to reparent users and teams to another business unit.

### See also  
 [Assign a business unit a different parent business](../admin/assign-business-unit-different-parent.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
