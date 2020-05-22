---
title: "Create and update solutions in Power Apps | Microsoft Docs"
description: "Learn about managed properties in Power Apps"
keywords: 
author: Mattp123
ms.author: matp
manager: kvivek
ms.custom: ""
ms.date: 05/05/2020
ms.reviewer: ""
ms.service: powerapps
ms.topic: "article"
search.audienceType: 
  - maker
search.app: 
  - PowerApps
  - D365CE
---
# Create and update solutions 
To locate and work with just the components you’ve customized, create a solution and do all your customization there. Then, always remember to work in the context of the custom solution as you add, edit, and create components. This makes it easy to export your solution for import to another environment or as a backup. More information [Create a solution](/powerapps/maker/common-data-service/create-solution)

## Update a solution
Make changes to your unmanaged solution, such as adding or removing components.
Then, when you import a managed solution that was previously imported, the
import logic detects the solution as an update and displays the following screen of options.

> [!div class="mx-imgBorder"] 
> ![Solution update detected upon import](media/solution-update-alm.png "Solution update detected upon import")

More information: [Apply an update or upgrade for a solution](/powerapps/maker/common-data-service/update-solutions) 

### See also
[Overview of tools and apps used with ALM](tools-apps-used-alm.md)
