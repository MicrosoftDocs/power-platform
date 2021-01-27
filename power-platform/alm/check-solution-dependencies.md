---
title: "Check for solution component dependencies (Microsoft Dataverse) | Microsoft Docs" # Intent and product brand in a unique string of 43-59 chars including spaces
description: "Write code to check for solution component dependencies." # 115-145 characters including spaces. This abstract displays in the search result.
ms.custom: ""
ms.date: 06/23/2020
ms.reviewer: "pehecke"
ms.service: powerapps
ms.topic: "article"
author: "shmcarth" # GitHub ID
ms.author: "jdaly" # MSFT alias of Microsoft employees only
manager: "ryjones" # MSFT alias of manager or PM counterpart
search.audienceType: 
  - developer
search.app: 
  - PowerApps
  - D365CE
---
# Check for solution component dependencies

 When you edit solutions you may find that you can’t delete a solution component because it has a published dependency with another solution component. Or, you may not be able to uninstall a managed solution because one of the components in the managed solution has been used in a customization in another unmanaged solution.  
  
 The following table lists the messages that you can use to retrieve data about solution component dependencies.  
  
|Message|Description|  
|-------------|-----------------|  
|<xref:Microsoft.Crm.Sdk.Messages.RetrieveDependentComponentsRequest>|Returns a list of dependencies for solution components that directly depend on a solution component.<br /><br /> For example, when you use this message for a global option set solution component, dependency records for solution components representing any option set attributes that reference the global option set solution component are returned.<br /><br /> When you use this message for the solution component record for the account entity, dependency records for all of the solution components representing attributes, views, and forms used for that entity are returned.|  
|<xref:Microsoft.Crm.Sdk.Messages.RetrieveRequiredComponentsRequest>|Returns a list of the dependencies for solution components that another solution component directly depends on. This message provides the reverse of the `RetrieveDependentComponentsRequest` message.|  
|<xref:Microsoft.Crm.Sdk.Messages.RetrieveDependenciesForDeleteRequest>|Returns a list of all the dependencies for solution components that could prevent deleting a solution component.|  
|<xref:Microsoft.Crm.Sdk.Messages.RetrieveDependenciesForUninstallRequest>|Returns a list of all the dependencies for solution components that could prevent uninstalling a managed solution.|  
