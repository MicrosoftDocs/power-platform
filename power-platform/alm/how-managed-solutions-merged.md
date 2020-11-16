---
title: "How managed solutions are merged (Microsoft Dataverse) | Microsoft Docs" 
description: "To avoid multiple installed solutions from interfering with one another, follow best practices while constructing a solution" 
ms.custom: ""
ms.date: 09/09/2020
ms.reviewer: ""
ms.service: powerapps
ms.topic: "article"
author: "shmcarth" 
ms.author: "matp" 
manager: "kvivek" 
search.audienceType: 
  - maker
  - developer
search.app: 
  - PowerApps
  - D365CE
---
# Understand how managed solutions are merged
When you prepare your managed solution to be installed, remember that an environment might already have multiple solutions installed or that other solutions might be installed in the future. Construct a solution that follows best practices so that your solution won't interfere with other solutions.  
  
The processes that Microsoft Dataverse uses to merge customizations emphasize maintaining the functionality of the solution. Although every effort is made to preserve the presentation, some incompatibilities between customizations might require that the computed resolution change some presentation details in favor of maintaining the customization functionality.
  
<a name="BKMK_MergingFormCustomizations"></a>   

## Merge form customizations  
 The only form customizations that have to be merged are those that are performed on any entity forms that are already in the environment. Typically, this means that form customizations only have to be merged when your solution customizes the forms that were included for entities created when Dataverse was installed. One way to avoid form merging is to provide new forms for any Dataverse entities. Forms for custom entities won't require merging unless you're creating a solution that updates or modifies an existing managed solution that created the custom entities and their forms.  
  
 When a solution is packaged as a managed solution, the form definitions stored in FormXML are compared to the original FormXML and only the differences are included in the managed solution. When the managed solution is installed in a new environment, the form customization differences are then merged with the FormXML for the existing form to create a new form definition. This new form definition is what the user sees and what a system customizer can modify. When the managed solution is uninstalled, only those form elements found in the managed solution are removed.  
  
Form merge occurs on a section-by-section basis. When you add new elements to an existing tab or section, your changes can affect or conceal the elements from the managed layers, including when the managed element is updated. This behavior occurs because the managed layers are underneath the unmanaged layer you're introducing with your customization. If you don't want to affect or conceal managed elements on the form, we recommend that you include your new elements within new container elements, such as a section or tab. This isolates your elements and reduces the possibility of affecting or concealing the elements from the managed layers. More information: [Solution layers](solution-layers-alm.md) 
  
 Managed solutions that contain forms that use new security roles depend on those roles. You should include these security roles with your managed solution. 
  
> [!NOTE]
>  When a managed solution entity contains multiple forms and the environment entity form also contains multiple forms, the new forms aren't appended to the bottom of the list of available forms&mdash;they're interleaved with the original entity forms.

### Identifying and resolving form merge conflicts

After you import a solution that includes a form, you may notice that the imported form displays a tab named **Conflicts Tab**. This is an auto-generated tab, which is created when certain form components are unable to merge. To avoid any data loss, the form components that aren’t able to merge are placed under the Conflicts Tab. Merge conflicts usually happen when the source and target customizations are out of sync, which leads to conflicting form customizations.

:::image type="content" source="media/conflicts-tab.png" alt-text="Conflicts tab on imported form.":::

Avoid these situations that can cause form merge conflicts:

- You import two different solutions that add a component, such as a form tab, that uses the same ordinal value.

- You customize a component of the form, such as a section, in the source environment but also make the same or similar customization to the component in the target environment. Then, you export the customization from the source environment and import it into the target environment.

When the Conflicts Tab appears on an imported form, you can move the component displayed somewhere on the form. Once all the components are moved from the Conflicts Tab, you can delete or hide the Conflicts Tab.
  
<a name="BKMK_MergingNavigationCustomizations"></a>   
## Merge navigation (SiteMap) customizations  
 When a solution is packaged as managed, the SiteMap XML is compared to the original SiteMap XML and any other customizations made to the SiteMap. Only the differences are included in the managed solution. These differences include items that are changed, moved, added, or removed. When the managed solution is installed in a new environment, the SiteMap changes are merged with the SiteMap XML found for the environment where the managed solution is being installed. A new SiteMap definition is what people see.  
  
 At this point, a customizer can export the SiteMap to an unmanaged solution and that SiteMap definition will include all the elements of the active SiteMap. A customizer can then modify the SiteMap and reimport it as an unmanaged customization. Later, if the managed solution is uninstalled, the SiteMap XML that was imported with the managed solution will be referenced to remove the changes introduced with that managed solution. A new active SiteMap is then calculated.  
  
 Whenever a new visible element is added to the SiteMap, it appears at the bottom of whatever container it belongs in. For example, a new area will appear at the bottom of the navigation area. To position the elements that have been added, you must export the SiteMap, edit it to set the precise position of the elements, and then import it again as an unmanaged solution.  
  
> [!NOTE]
>  Only one SiteMap customization can be applied between publishing. Any unpublished SiteMap customizations will be lost when a new SiteMap definition is imported.  
  
<a name="BKMK_MergingOptionSetOptions"></a>   
## Merge option set options  
 Each new option set option is initialized with an integer value assigned that includes an option value prefix. The option value prefix is a set of five digits prepended to the option value. An option value prefix is generated based on the solution publisher's customization prefix, but can be set to any value. The option value prefix helps differentiate new option set options created in the context of a specific solution publisher and reduces the opportunity for collisions of option values. Using the option value prefix is recommended but not required.  
  
 A managed solution usually updates or adds options for option sets that are already in the environment, for example, the Category or Industry option sets for an account. When a managed solution modifies the options available in an option set, all the options defined in the managed solution are available in the environment. When the managed solution is uninstalled, the options in the option set will be returned to their original state.  
  
### See also  

[Use a solution to customize](use-solutions-for-your-customizations.md)
