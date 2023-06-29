---
title: "Use managed properties (Microsoft Dataverse) | Microsoft Docs" # Intent and product brand in a unique string of 43-59 chars including spaces
description: "Managed properties help you define which of the managed solution components can be customized" # 115-145 characters including spaces. This abstract displays in the search result.
ms.custom: ""
ms.date: 07/15/2022
ms.reviewer: "pehecke"

ms.topic: "article"
author: "shmcarth" # GitHub ID
ms.subservice: alm
ms.author: "shmcarth" # MSFT alias of Microsoft employees only
search.audienceType: 
  - developer
---

# Use managed properties

You can control which of your managed solution components are customizable by using managed properties. By default, all custom solution components are customizable. Each solution component has a **Can be customized** (`IsCustomizable`) property. As long as this property value is set to true, more properties specific to the type of solution component can be specified. If you set the `IsCustomizable.Value` property to false, after the solution is installed as a managed solution the solution component will not be customizable.

Managed properties ensure that only a solution from the same publisher will be able to change the component.  Managed properties will only affect managed components and does not force this in the development environments where the component is still unmanaged.  The use of the `IsCustomized` managed property is intended to ensure that no other solution layer from any other publisher, and no active customizations can be done on the component once it is installed as a managed solution.

The following table lists some managed properties for a subset of available solution components.  
  
|Component|Display Name|Property|  
|---------------|------------------|--------------|  
|Entity|Can be customized|<xref:Microsoft.Xrm.Sdk.Metadata.EntityMetadata.IsCustomizable>.`Value`|  
|Entity|Display name can be modified|<xref:Microsoft.Xrm.Sdk.Metadata.EntityMetadata.IsRenameable>.`Value`|  
|Entity|Can be related entity in relationship|<xref:Microsoft.Xrm.Sdk.Metadata.EntityMetadata.CanBeRelatedEntityInRelationship>.`Value`(Read Only)|  
|Entity|Can be primary entity in relationship|<xref:Microsoft.Xrm.Sdk.Metadata.EntityMetadata.CanBePrimaryEntityInRelationship>.`Value`(Read Only)|  
|Entity|Can be in many-to-many relationship|<xref:Microsoft.Xrm.Sdk.Metadata.EntityMetadata.CanBeInManyToMany>.`Value`(Read Only)|  
|Entity|New forms can be created|<xref:Microsoft.Xrm.Sdk.Metadata.EntityMetadata.CanCreateForms>.`Value`|  
|Entity|New charts can be created|<xref:Microsoft.Xrm.Sdk.Metadata.EntityMetadata.CanCreateCharts>.`Value`|  
|Entity|New views can be created|<xref:Microsoft.Xrm.Sdk.Metadata.EntityMetadata.CanCreateViews>.`Value`|  
|Entity|Can change any other entity properties not represented by a managed property|<xref:Microsoft.Xrm.Sdk.Metadata.EntityMetadata.CanModifyAdditionalSettings>.`Value`|  
|Entity|Can create attributes|<xref:Microsoft.Xrm.Sdk.Metadata.EntityMetadata.CanCreateAttributes>.`Value`|  
|Field (Attribute)|Can be customized|<xref:Microsoft.Xrm.Sdk.Metadata.AttributeMetadata.IsCustomizable>.`Value`|  
|Field (Attribute)|Display name can be modified|<xref:Microsoft.Xrm.Sdk.Metadata.AttributeMetadata.IsRenameable>.`Value`|  
|Field (Attribute)|Can change requirement level|<xref:Microsoft.Xrm.Sdk.Metadata.AttributeMetadata.RequiredLevel>.`CanBeChanged`<br /><br /> Note:<br /><br /> `RequiredLevel`is the only managed property to use the `CanBeChanged`property.|  
|Field (Attribute)|Can change any other attribute properties not represented by a managed property|<xref:Microsoft.Xrm.Sdk.Metadata.AttributeMetadata.CanModifyAdditionalSettings>.`Value`|  
|Entity Relationship|Can be customized|<xref:Microsoft.Xrm.Sdk.Metadata.RelationshipMetadataBase.IsCustomizable>.`Value`|  
|Form|Can be customized|`SystemForm.IsCustomizable.Value`|  
|Chart|Can be customized|`SavedQueryVisualization.IsCustomizable.Value`|  
|View|Can be customized|`SavedQuery.IsCustomizable.Value`|  
|Option Set|Can be customized|<xref:Microsoft.Xrm.Sdk.Metadata.OptionSetMetadataBase.IsCustomizable>.`Value`|  
|Web Resource|Can be customized|`WebResource.IsCustomizable.Value`|  
|Workflow|Can be customized|`Workflow.IsCustomizable.Value`|
|Workflow|Is Custom Processing Step Allowed For Other Publishers |`Workflow.IsCustomProcessingStepAllowedForOtherPublishers.Value`|  
|Assembly|Can be customized|`SdkMessageProcessingStep.IsCustomizable.Value`|  
|Assembly Registration|Can be customized|`ServiceEndpoint.IsCustomizable.Value`|  
|E-mail Template|Can be customized|`Template.IsCustomizable.Value`|  
|KB Article Template|Can be customized|`KbArticleTemplate.IsCustomizable.Value`|  
|Contract Template|Can be customized|`ContractTemplate.IsCustomizable.Value`|  
|Mail Merge Template|Can be customized|`MailMergeTemplate.IsCustomizable.Value`|  
|Dashboard|Can be customized|`SystemForm.IsCustomizable.Value`|  
|Security Roles|Can be customized|`Role.IsCustomizable.Value`|  
|System Form|Can be deleted|[CanBeDeleted](/power-apps/developer/data-platform/reference/entities/systemform#BKMK_CanBeDeleted).`Value`|  
|System Query|Can be deleted|[CanBeDeleted](/power-apps/developer/data-platform/reference/entities/savedquery#BKMK_CanBeDeleted).`Value`|

### Workflow Is Custom Processing Step Allowed For Other Publishers 

This managed property controls whether plug-in steps registered by 3rd parties for messages created by custom process actions will run. The default value is `false`, which means plug-in steps registered which do not use the same solution publisher will not run. When this is `true`, the publisher of the custom process action allows registered plug-in registration steps to run.
  
## Update managed properties

 After you release your managed solution, you may decide that you want to change the managed properties. You can only change managed properties to make them less restrictive. For example, after your initial release you can decide to allow customization of an entity.  
  
 You update managed properties for your solution by releasing an update to your solution with the changed managed properties. Your managed solution can only be updated by another managed solution associated with the same publisher record as the original managed solution. If your update includes a change in managed properties to make them more restrictive, those managed property changes will be ignored but other changes in the update will be applied.  
  
 Because the original publisher is a requirement to update managed properties for a managed solution, any unmanaged solution cannot be associated with a publisher that has been used to install a managed solution.  
  
> [!NOTE]
> This means you will not be able to develop an update for your solution by using an organization where your managed solution is installed.  
  
## Check managed properties

 Use <xref:Microsoft.Crm.Sdk.Messages.IsComponentCustomizableRequest> to check whether a solution component is customizable. Alternatively, you can check the solution component properties but you must consider that the ultimate determination of the meaning depends on the values of several properties. Each solution component has an `IsCustomizable` property. When a solution component is installed as part of a managed solution, the `IsManaged` property will be true. Managed properties are only enforced for managed solutions. When checking managed properties to determine if an individual solution component is customizable, you must check both the `IsCustomizable`and `IsManaged` properties. A solution component where `IsCustomizable`is false and `IsManaged`is false, is customizable.  
  
 Entity and attribute have more managed properties in addition to `IsCustomizable`. These managed properties are not updated if `IsCustomizable` is set to false. This means that in addition to checking the individual managed property, you must also check the `IsCustomizable` property to see if the managed property is being enforced.  
  
### See also  

[Managed properties](managed-properties-alm.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
