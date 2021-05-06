---
title: "Maintain managed solutions (Microsoft Dataverse) | Microsoft Docs" # Intent and product brand in a unique string of 43-59 chars including spaces
description: "" # 115-145 characters including spaces. This abstract displays in the search result.
ms.custom: ""
ms.date: 06/29/2020
ms.reviewer: "pehecke"
ms.service: power-platform
ms.topic: "article"
author: mikkelsen2000
ms.author: pemikkel
manager: kvivek
search.audienceType: 
  - developer
search.app: 
  - PowerApps
  - D365CE
---
# Maintain managed solutions

Before releasing your managed solution, you should consider how you will maintain it. Uninstalling and reinstalling a managed solution is practically never an option when the solution contains entities or attributes. This is because data is lost when entities are deleted. 

Alternatively, Microsoft recommends using solutionss as a way to update your managed solution while maintaining your data. Exactly how you update your solutions depends on the characteristics of the solution and the requirements of the change.

## Version compatibility

 Solutions can be exported from older versions of a Microsoft Dataverse environment (or Dynamics 365) and imported into newer environments, but not the reverse.
  
 As more service updates get applied to Dataverse, solutions exported from environments with those updates cannot be imported into environments that do not have those updates. More information: [Solution concepts](solution-concepts-alm.md).  
  
 The `<ImportExportXml>` root element uses a `SolutionPackageVersion` attribute to set the value for the version that the solution is compatible with. You shouldn't manually edit this value.  
  
## Create managed solution updates

 There are two basic approaches to updating solutions:  
  
- Release a new version of your managed solution  
  
- Release an update for your managed solution  
  
### Release a new version of your managed solution

 The preferred method is to release a new version of your managed solution. Using your original unmanaged source solution, you can make necessary changes and increase the version number of the solution before packaging it as a managed solution. 
 
 When the environments that use your solution install the new version, their capabilities get upgraded to include your changes. If you want to go back to the behavior in a previous version, simply reinstall it. This process overwrites all solution components with the definitions from the previous version. But it doesn't remove solution components that are added in the new version. Newer solution components remain in the system but have no effect. This is because the older solution component definitions won't use them.  
  
 During the installation of a previous version of a solution, Dataverse confirms that the person installing the previous version wants to proceed.  

### Release an update for your managed solution

 When only a small subset of solution components urgently requires a change, you can release an update to address the issue. To release an update, create a new unmanaged solution. Then add any components from the original unmanaged source solution that you want to update. It's required to associate the new unmanaged solution with the same publisher record as was used for the original solution. After you finish with your changes, package the new solution as a managed solution.  
  
 When you install the update solution in an environment where the original solution was installed, the changes included in the update get applied to the environment. If you decide to ‘roll back’ to the original version, then you must uninstall the update.  
  
 Any customizations applied to the solution components in the update get overridden. If you uninstall the update, the customizations get returned.  
  
### See also  

[Publish your app on AppSource](/powerapps/developer/common-data-service/publish-app-appsource)


[!INCLUDE[footer-include](../includes/footer-banner.md)]