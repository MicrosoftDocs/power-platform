---
title: "View and edit managed properties in solutions"
description: "Learn how to view and edit managed properties in solutions when implementing application lifecycle management (ALM)."
keywords: 
author: Mattp123
ms.subservice: alm
ms.author: matp
manager: kvivek
ms.custom: ""
ms.date: 06/09/2020
ms.reviewer: ""
ms.service: power-platform
ms.topic: "article"
search.audienceType: 
  - maker
search.app: 
  - PowerApps
  - D365CE
---

# Managed properties 
You can use managed properties to control which of your managed solution components can be customized. If you're creating solutions for other organizations, you should allow them to customize solution components where it makes sense for their unique requirements. However, you have to be able to predictably support and maintain your solution, so you should never allow any customization of critical components that provide the core functionality of your solution.

Consider using managed properties to lock down your components unless you want them customizable in the destination environment. For example, imagine a scenario where your users might want to change many of the labels to fit their own business requirements.

Managed properties are intended to protect your solution from modifications that
might cause it to break. Managed properties don't provide digital rights
management (DRM), or capabilities to license your solution or control who may
import it.

You apply managed properties when the solution is unmanaged in the unmanaged
layer of your development environment. The managed properties will take effect
after you package the managed solution and install it in a different
environment. After the managed solution is imported, the managed properties
can't be updated except by an update of the solution by the original publisher.

Most solution components have a **Managed properties** menu item available in the list of solution components. When you import the managed solution that
contains the components, you can view&mdash;but not change&mdash;the managed properties.

## View and edit entity managed properties
1.	Sign in to [Power Apps](https://make.powerapps.com/?utm_source=padocs&utm_medium=linkinadoc&utm_campaign=referralsfromdoc) or [Power Automate](https://flow.microsoft.com) and select **Solutions** from the left pane. 
2.	Open the solution that you want. 
3.	From the list of components in the solution, select **…** next to the entity that you want to view the managed properties, and then select **Managed properties**. 

    > [!div class="mx-imgBorder"] 
    > ![Entity managed properties command](media/entity-managed-properties.png "Entity managed properties command")

    The managed properties page is displayed. 

    > [!div class="mx-imgBorder"] 
    > <img src="media/managed-properties-dialog.png" alt="Managed properties pane" height="572" width="300">

Entities have more managed properties than any other type of solution component. If the entity is customizable, you can set the following options:  

|Option|Description|
|--|--|
|**Allow customizations** |Controls all the other options. If this option is `False`, none of the other settings apply. When it is `True`, you can specify the other customization options. When `False`, it is equivalent to setting all other options to false.|
|**Display name can be modified**|Whether the entity display name can be modified.|
|**Can Change Additional Properties** |Applies to anything not covered by other options.|
|**New forms can be created**|Whether new forms can be created for the entity.|
|**New charts can be created**|Whether new charts can be created for the entity.|
|**New views can be created** |Whether new views can be created for the entity.|
|**Can Change Hierarchical Relationship**|Whether Hierarchical Relationships settings can be changed. More information: [Define and query hierarchically related data](/powerapps/maker/common-data-service/define-query-hierarchical-data)|
|**Can Change Tracking Be Enabled** |Whether the entity **Change Tracking** property can be changed.|
|**Can Enable sync to external search index** |Whether the entity can be configured to enable relevance search. More information: [Configure Relevance Search to improve search results and performance](../admin/configure-relevance-search-organization.md) |

## View and edit field managed properties
Next to a custom field in a solution select **…** and then select **Managed properties**.

This opens the **Managed Properties** pane.
> [!div class="mx-imgBorder"] 
> <img src="media/field-managed-prop.png" alt="Field managed properties" height="525" width="295">

The **Allow customizations** option controls all the other options. If this option is disabled, none of the other settings apply. When it is enabled, you can specify the other customization options.  
  
If the field is customizable, you can enable the following options.  
  
- **Display name can be modified**
- **Can change additional properties**: This property controls any other customizations that do not have a specific managed property. 
- **New forms can be created** 
- **New charts can be created** 
- **New views can be created** 
- **Can change hierarchical relationship** 
- **Can change tracking be enabled** 
- **Can enable sync to external search index**

Disabling all the individual options is equivalent to disabling **Allow customizations**.  

Apply your choices and select **Done** to close the pane.

> [!NOTE]
> If this field is a **Date and Time** field, an additional **Can change date and time behavior** property is available. More information: [Behavior and format of the Date and Time field](/powerapps/maker/portals/configure/behavior-format-date-time-field) 

See [Update of delete a field](/powerapps/maker/common-data-service/data-platform-manage-fields#update-or-delete-a-field) for information about how to edit fields.

## View and edit other component managed properties
You can view and edit managed properties for many other solution components, such as a web resource, process, chart, or dashboard. Next to the component in a solution select **…** and then select **Managed properties**. 

## View and edit relationship managed properties
While viewing entity relationships in [solution explorer](/powerapps/maker/model-driven-apps/advanced-navigation#solution-explorer), select a relationship from an unmanaged solution and then choose **More Actions** > **Managed Properties** on the menu bar.
  
With relationships, the only managed property is **Can Be Customized**. This single setting controls all changes that can be made to the entity relationship. 

### See also
[Use segmented solutions](segmented-solutions-alm.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
