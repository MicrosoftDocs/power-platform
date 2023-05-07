---
title: "Check for solution component dependencies (Microsoft Dataverse) | Microsoft Docs" # Intent and product brand in a unique string of 43-59 chars including spaces
description: "Write code to check for solution component dependencies." # 115-145 characters including spaces. This abstract displays in the search result.
ms.date: 02/15/2023
ms.reviewer: "pehecke"

ms.topic: "article"
author: "shmcarth" # GitHub ID
ms.subservice: alm
ms.author: "shmcarth" # MSFT alias of Microsoft employees only
search.audienceType: 
  - developer
---
# Check for solution component dependencies

 When you edit solutions you may find that you can’t delete a solution component because it has a published dependency with another solution component. Or, you may not be able to uninstall a managed solution because one of the components in the managed solution has been used in a customization in another unmanaged solution.  
  
 The following table lists the messages that you can use to retrieve data about solution component dependencies.  
  
|Message|Description|  
|-------------|-----------------|  
|<xref:Microsoft.Crm.Sdk.Messages.RetrieveDependentComponentsRequest><br />[RetrieveDependentComponents function](xref:Microsoft.Dynamics.CRM.RetrieveDependentComponents)|Returns a list of dependencies for solution components that directly depend on a solution component.<br /><br /> For example, when you use this message for a global option set solution component, dependency records for solution components representing any option set attributes that reference the global option set solution component are returned.<br /><br /> When you use this message for the solution component record for the account entity, dependency records for all of the solution components representing attributes, views, and forms used for that entity are returned.|  
|<xref:Microsoft.Crm.Sdk.Messages.RetrieveRequiredComponentsRequest><br />[RetrieveRequiredComponents function](xref:Microsoft.Dynamics.CRM.RetrieveRequiredComponents)|Returns a list of the dependencies for solution components that another solution component directly depends on. This message provides the reverse of the `RetrieveDependentComponentsRequest` message.|  
|<xref:Microsoft.Crm.Sdk.Messages.RetrieveDependenciesForDeleteRequest><br />[RetrieveDependenciesForDelete function](xref:Microsoft.Dynamics.CRM.RetrieveDependenciesForDelete)|Returns a list of all the dependencies for solution components that could prevent deleting a solution component.|  
|<xref:Microsoft.Crm.Sdk.Messages.RetrieveDependenciesForUninstallRequest><br />[RetrieveDependenciesForUninstall function](xref:Microsoft.Dynamics.CRM.RetrieveDependenciesForUninstall)|Returns a list of all the dependencies for solution components that could prevent uninstalling a managed solution.|  


[!INCLUDE[footer-include](../includes/footer-banner.md)]
