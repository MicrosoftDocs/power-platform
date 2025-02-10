---
title: "Dependency tracking for solution components in Microsoft Dataverse with Power Platform"
description: "Solution component dependencies help make sure you have a reliable experience working with solutions. Dependencies can be viewed in the application by selecting Show Dependencies."
ms.custom: ""
ms.date: 02/06/2025
ms.reviewer: "pehecke"
ms.topic: "article"
author: "caburke"
ms.subservice: alm
ms.author: "jdaly"
search.audienceType: 
  - developer
---
# Dependency tracking for solution components

Solutions are made of solution components. You use the **Solutions** area in Microsoft Dataverse to create or add solution components. You can perform these actions programmatically by using the <xref:Microsoft.Crm.Sdk.Messages.AddSolutionComponentRequest> message or any messages that create or update solution components that include a `SolutionUniqueName` parameter.  
  
Solution components often depend on other solution components. You can’t delete any solution component that has dependencies on another solution component. For example, a customized ribbon typically requires image or script web resources to display icons and perform actions using scripts. As long as the customized ribbon is in the solution, the specific web resources it uses are required. Before you can delete the web resources, you must remove references to them in the customized ribbon. These solution component dependencies can be viewed in the application by selecting **Show Dependencies**.  
  
This article describes the types of solution components you can include in your solutions and how they depend on each other.  
  
## All solution components  

The complete list of available solutions component types is located in the system `componenttype` global choice column. The supported range of values for this property is available by including the file `OptionSets.cs` or `OptionSets.vb` in your project. However, many of the solution component types listed there are for internal use only and the list doesn’t provide information about the relationships between solution components.  
  
## Solution component dependencies

Solution component dependencies help make sure you have a reliable experience working with solutions. They prevent actions that you normally perform from unintentionally breaking customizations defined in a solution. These dependencies are what allow a managed solution to be installed and uninstalled simply by importing or deleting a solution.  
  
The solutions framework automatically tracks dependencies for solution components. Every operation on a solution component automatically calculates any dependencies to other components in the system. The dependency information is used to maintain the integrity of the system and prevent operations that could lead to an inconsistent state.  
  
As a result of dependency tracking the following behaviors are enforced:  
  
- Deletion of a component is prevented if another component in the system depends on it.  
  
- Export of a solution warns the user if there are any missing components that could cause failure when importing that solution in another environment.  
  
   Warnings during export can be ignored if the solution developer intends that the solution is only to be installed in an environment where dependent components are expected to exist. For example, when you create a solution that is designed to be installed over a preinstalled ”base” solution.  
  
- Import of a solution fails if all required components aren’t included in the solution and also don’t exist in the target environment.  
  
- Additionally, when you import a managed solution all required components must match the package type of the solution. A component in a managed solution can only depend on another managed component.  
  
 There are three types of solution component dependencies:  
  
- Solution internal. Internal dependencies are managed by Dataverse. These dependencies exist when a particular solution component can’t exist without another solution component.  
- Published. Published dependencies are created when two solution components are related to each other and then published. To remove this type of dependency, the association must be removed and the tables published again.  
- Unpublished. Unpublished dependencies apply to the unpublished version of a publishable solution component that is being updated. After the solution component is published, it becomes a published dependency.  
  
Solution internal dependencies are dependencies where actions with a solution component require an action for another solution component. For example, if you delete a table, you should expect that all the table attributes are deleted with it. Any table relationships with other tables are also deleted.  
  
However, an internal dependency might lead to a published dependency and still require manual intervention. For example, if you include a lookup field on a table form and then delete the primary table in the relationship, you can’t complete that deletion until you remove the lookup column from the related table form and then publish the form.  
  
When you perform actions programmatically with solutions, you can use messages related to the `Dependency` table. Go to [Dependency Entity](/powerapps/developer/data-platform/reference/entities/dependency) for messages you can use to identify dependencies that might exist before you delete a component or uninstall a solution.  
  
## Common solution components  

These are the solution components displayed in the application and the components that you work with directly when adding or removing solution components using the solution page. Each of the other types of solution components depend on one or more of these solution components to exist.

- [Application ribbons](#application-ribbons-ribboncustomization)  
- [Entity](#entity-entity)
- [Report](#report-report)
- [Article template](#article-template-kbarticletemplate)
- [Column security profile](#column-security-profile-fieldsecurityprofile)
- [SDK message processing step](#sdk-message-processing-step-sdkmessageprocessingstep)
- [Connection role](#connection-role-connectionrole)
- [Mail merge template](#mail-merge-template-mailmergetemplate)
- [Security role](#security-role-role)
- [Contract template](#contract-template-contracttemplate)
- [Option set](#option-set-optionset)
- [Service endpoint](#service-endpoint-serviceendpoint)
- [Dashboard or entity form](#dashboard-or-entity-form-systemform)  
- [Plug-in assembly](#plug-in-assembly-pluginassembly)
- [Site map](#site-map-sitemap)
- [Email template](#email-template-emailtemplate)  
- [Process](#process-workflow)
- [Web resource](#web-resource-webresource)

### Application ribbons (RibbonCustomization)  

Ribbon customizations for the application ribbon and table ribbon templates. Application ribbons don’t include definitions of ribbons at the table or form level.  
  
Custom application ribbons frequently have published dependencies on web resources. Web resources are used to define ribbon button icons and JavaScript functions to control when ribbon elements are displayed or what actions are performed when a particular ribbon control is used. Dependencies are only created when the ribbon definitions use the `$webresource:` directive to associate the web resource to the ribbon. More information: [$webresource directive](/dynamics365/customer-engagement/developer/web-resources#BKMK_WebResourceDirective)  
  
### Article template (KBArticleTemplate)  

Template that contains the standard attributes of an article. There's always an internal dependency between the article template and the KbArticle table.  
  
### Connection role (ConnectionRole)  

Role describing a relationship between a two records. Each connection role defines what types of entity records can be linked using the connection role. This creates a published dependency between the connection role and the table.  
  
### Contract template (ContractTemplate)  

Template that contains the standard attributes of a contract. There's always an internal dependency between the contract template and the contract table.  
  
### Dashboard or entity form (SystemForm)  

System form table records are used to define dashboards and table forms. When a `SystemForm` is used as a table form there's an internal dependency on the table. When a `SystemForm` is used as a dashboard there are no internal dependencies. Both table forms and dashboards commonly have published dependencies related to their content. A table form might have lookup columns that depend on a table relationship. Both dashboards and table forms can contain charts or subgrids that create a published dependency on a view, which then has an internal dependency on a table. A published dependency on web resources can be created because of content displayed within the dashboard or form or when a form contains JavaScript libraries. Table forms have published dependencies on any attributes that are displayed as columns in the form.  
  
### Email template (EmailTemplate)  

Template that contains the standard attributes of an email message. An email template typically includes columns that insert data from specified table attributes. An email template can be linked to a specific table when it's created so there can be an internal dependency on the table. A global email template isn’t associated with a specific table, but it might have published dependencies on table attributes used to provide data. A process (workflow) frequently is configured to send an email using an email template creating a published dependency with the workflow.  
  
### Entity (Entity)  

Tables, formerly known as entities, are the primary structure used to model and manage data in Dataverse. Charts, forms, table relationships, views, and attributes associated with a table are deleted automatically when the table is deleted because of the internal dependencies between them. Tables frequently have published dependencies with processes, dashboards, and email templates.  
  
### Column security profile (FieldSecurityProfile)  

Profile that defines the access level for secured attributes.  
  
### Mail merge template (MailMergeTemplate)  

Template that contains the standard attributes of a mail merge document. A mail merge template has a published dependency on the table it’s associated with.  
  
### Option set (OptionSet)  

A choice column, formerly known as an option set, defines a set of options. A picklist attribute uses a choice to define the options provided. Several picklist attributes might use a global choice so that the options they provide are always the same and can be maintained in one place. A published dependency occurs when a picklist attribute references a global choice. You can’t delete a global choice that is being used by a picklist attribute.  
  
### Plug-in assembly (PluginAssembly)  

Assembly that contains one or more plug-in types. Plug-ins are registered to events that are typically associated with a table. This creates a published dependency.  
  
### Process (Workflow)  

Set of logical rules that define the steps necessary to automate a specific business process, task, or set of actions to be performed. Processes provide a wide range of actions that create published dependencies on any other solution component referenced by the process. Each process also has a published dependency on the table it’s associated with.  
  
### Report (Report)  

Data summary in an easy-to-read layout. A report has published dependencies on any table or attribute data included in the report. Each report must also be associated with a Report category creating an internal dependency on a solution component called Report Related Category (ReportCategory). Reports can be configured to be subreports creating a published dependency with the parent report.  
  
### SDK message processing step (SDKMessageProcessingStep)  

Stage in the execution pipeline that a plug-in is to execute.  
  
### Security role (Role)  

Grouping of security privileges. Users are assigned security roles that authorize their access to the Dataverse system. Table forms can be associated with specific security roles to control who can view the form. This creates a published dependency between the security role and the form.  
  
> [!NOTE]
> Only security roles from the environment business unit can be added to a solution. Only a user with read access to those security roles can add them to a solution.  
  
### Service endpoint (ServiceEndpoint)  

Service endpoint that can be contacted.  
  
### Site map (SiteMap)  

XML data used to control the application navigation pane. The site map might be linked to display an HTML web resource or an icon in the site map might use an image web resource. When the `$webresource:` directive is used to establish these associations, a published dependency is created. More information: [$webresource directive](/dynamics365/customer-engagement/developer/web-resources#BKMK_WebResourceDirective)  
  
### Web resource (WebResource)  

Data equivalent to files used to extend a model-driven app or in web development. Web resources provide client-side components that are used to provide custom user interface elements. Web resources might have published dependencies with table forms, ribbons, and the site map. When the `$webresource:` directive is used to establish associations in a ribbon or the site map, a published dependency is created. For more information, go to [$webresource directive](/dynamics365/customer-engagement/developer/web-resources#BKMK_WebResourceDirective).  
  
> [!NOTE]
> Web resources might depend on other web resources based on relative links. For example, an HTML web resource might use a CSS or script web resource. A Silverlight web resource displayed outside of a table form or chart must have an HTML web resource to host it. These dependencies aren’t tracked as solution dependencies.  
  
### See also

- [Solution concepts](solution-concepts-alm.md)  
- [Removing dependencies](removing-dependencies.md)  
- [Environment strategy](environment-strategy-alm.md)   
- [Work with solutions using the SDK APIs](solution-api.md)
- [Solution Entity Reference](/powerapps/developer/common-data-service/reference/entities/solution)  
- [SolutionComponent Entity Reference](/powerapps/developer/common-data-service/reference/entities/solutioncomponent)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
