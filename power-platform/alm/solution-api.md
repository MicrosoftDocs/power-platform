---
title: "Work with solutions using the SDK APIs | Microsoft Docs"
description: "Learn about the APIs that are available to manage Microsoft Dataverse solutions."
keywords: 
author: mikkelsen2000
ms.author: pemikkel
manager: kvivek
ms.custom: ""
ms.date: 05/05/2020
ms.reviewer: "pehecke"
ms.service: powerapps
ms.topic: "article"
search.audienceType: 
  - developer
search.app: 
  - PowerApps
  - D365CE
---

# Work with solutions using the SDK APIs

As part of your development to production lifecycle you may want to create
custom automation to handle certain tasks. For example, in your DevOps project
pipeline you might want to execute some custom code or script that creates a
sandbox environment, imports an unmanaged solution, exports that unmanaged
solution as a managed solution, and, finally, deletes the environment. You can do
this and more by using the APIs that are available to you. Below are some examples
of what you can accomplish using the .NET SDK APIs, the SOAP 2011 endpoint, and custom code.

> [!NOTE]
> You can also perform these same operations using the Web API. The related actions are: [ImportSolution](https://docs.microsoft.com/dynamics365/customer-engagement/web-api/importsolution), [ExportSolution](https://docs.microsoft.com/dynamics365/customer-engagement/web-api/exportsolution), [CloneAsPatch](https://docs.microsoft.com/dynamics365/customer-engagement/web-api/cloneaspatch), and [CloneAsSolution](https://docs.microsoft.com/dynamics365/customer-engagement/web-api/cloneassolution).

## Create, export, or import an unmanaged solution

Let's see how to perform some common solution operations by using C# code. To
view the complete working C# code sample that demonstrates these types of
solution operations (and more), see [Sample: Work with solutions](/powerapps/developer/common-data-service/org-service/samples/work-solutions).

### Create a publisher

Every solution requires a publisher, represented by the [Publisher entity](/powerapps/developer/common-data-service/reference/entities/publisher). A publisher requires the following:

- A customization prefix
- A unique name
- A friendly name

> [!NOTE]
> For a healthy ALM approach, always use a custom publisher and solution, not the
default solution and publisher, for deploying your customizations.

The following code sample first defines a publisher and then checks to see
whether the publisher already exists based on the unique name. If it already
exists, the customization prefix might have been changed, so this sample seeks to
capture the current customization prefix. The `PublisherId` is also captured so
that the publisher record can be deleted. If the publisher isn't found, a new
publisher is created using
the [IOrganizationService](https://docs.microsoft.com/dotnet/api/microsoft.xrm.sdk.iorganizationservice).[Create](https://docs.microsoft.com/dotnet/api/microsoft.xrm.sdk.iorganizationservice.create) method.

```csharp
// Define a new publisher
Publisher _myPublisher = new Publisher
{
   UniqueName = "contoso-publisher",
   FriendlyName = "Contoso publisher",
   SupportingWebsiteUrl =
      "https://docs.microsoft.com/powerapps/developer/common-data-service/overview",
   CustomizationPrefix = "contoso",
   EMailAddress = "someone@contoso.com",
   Description = "This publisher was created from sample code"
};

// Does the publisher already exist?
QueryExpression querySamplePublisher = new QueryExpression
{
   EntityName = Publisher.EntityLogicalName,
   ColumnSet = new ColumnSet("publisherid", "customizationprefix"),
   Criteria = new FilterExpression()
};

querySamplePublisher.Criteria.AddCondition("uniquename", ConditionOperator.Equal,
   _myPublisher.UniqueName);

EntityCollection querySamplePublisherResults =
   _serviceProxy.RetrieveMultiple(querySamplePublisher);

Publisher SamplePublisherResults = null;

// If the publisher already exists, use it
if (querySamplePublisherResults.Entities.Count > 0)
{
   SamplePublisherResults = (Publisher)querySamplePublisherResults.Entities[0];
   _publisherId = (Guid)SamplePublisherResults.PublisherId;
   _customizationPrefix = SamplePublisherResults.CustomizationPrefix;
}

// If the publisher doesn't exist, create it
if (SamplePublisherResults == null)
{
   _publisherId = _serviceProxy.Create(_myPublisher);

   Console.WriteLine(String.Format("Created publisher: {0}.",
   _myPublisher.FriendlyName));

   _customizationPrefix = _myPublisher.CustomizationPrefix;
}
```

### Create an unmanaged solution

After you have a custom publisher available, you can then create an unmanaged
solution. The following table lists the fields with descriptions that a solution
contains.

| **Field Label**        | **Description**          |
|------------------------|-----------------------|
| Display Name       | The name for the solution.   |
| Name               | Microsoft Dataverse generates a unique name based on the **Display Name**. You can edit the unique name. The unique name must only contain alphanumeric characters or the underscore character.   |
| Publisher          | Use the **Publisher** lookup to associate the solution with a publisher.      |
| Version            | Specify a version by using the following format: *major.minor.build.revision* (for example, 1.0.0.0.    |
| Configuration Page | If you include an HTML Web resource in your solution, you can use this lookup to add it as your designated solution configuration page.    |
| Description        | Use this field to include any relevant details about your solution.     |

Below is sample code to create an unmanaged solution that uses the publisher we
created in the previous section.

```csharp
// Create a solution
Solution solution = new Solution
{
   UniqueName = "sample-solution",
   FriendlyName = "Sample solution",
   PublisherId = new EntityReference(Publisher.EntityLogicalName, _publisherId),
   Description = "This solution was created by sample code.",
   Version = "1.0"
};

//Check whether the solution already exists
QueryExpression queryCheckForSampleSolution = new QueryExpression
{
   EntityName = Solution.EntityLogicalName,
   ColumnSet = new ColumnSet(),
   Criteria = new FilterExpression()
};

queryCheckForSampleSolution.Criteria.AddCondition("uniquename",
   ConditionOperator.Equal, solution.UniqueName);

// Attempt to retrieve the solution
EntityCollection querySampleSolutionResults =
   _serviceProxy.RetrieveMultiple(queryCheckForSampleSolution);

// Create the solution if it doesn't already exist
Solution SampleSolutionResults = null;

if (querySampleSolutionResults.Entities.Count > 0)
{
   SampleSolutionResults = (Solution)querySampleSolutionResults.Entities[0];
   _solutionsSampleSolutionId = (Guid)SampleSolutionResults.SolutionId;
}

if (SampleSolutionResults == null)
{
   _solutionsSampleSolutionId = _serviceProxy.Create(solution);
}
```

After you create an unmanaged solution, you can add solution components by
creating them in the context of this solution or by adding existing components
from other solutions. More information: [Add a new solution component](#add-a-new-solution-component)
and [Add an existing solution component](#add-an-existing-solution-component)

### Export an unmanaged solution

This code sample shows how to export an unmanaged solution or package a managed
solution. The code uses the [ExportSolutionRequest](https://docs.microsoft.com/dotnet/api/microsoft.crm.sdk.messages.exportsolutionrequest) class to export a compressed file representing an unmanaged solution. The option to create a managed solution is set by using the [Managed](https://docs.microsoft.com/dotnet/api/microsoft.crm.sdk.messages.exportsolutionrequest.managed#Microsoft_Crm_Sdk_Messages_ExportSolutionRequest_Managed) property.
This sample saves a file named *samplesolution.zip* to the output folder.

```csharp
// Export a solution
ExportSolutionRequest exportSolutionRequest = new ExportSolutionRequest();
exportSolutionRequest.Managed = false;
exportSolutionRequest.SolutionName = solution.UniqueName;

ExportSolutionResponse exportSolutionResponse =
   (ExportSolutionResponse)_serviceProxy.Execute(exportSolutionRequest);

byte[] exportXml = exportSolutionResponse.ExportSolutionFile;
string filename = solution.UniqueName + ".zip";

File.WriteAllBytes(outputDir + filename, exportXml);

Console.WriteLine("Solution exported to {0}.", outputDir + filename);

```

### Import an unmanaged solution

Importing (or upgrading) a solution by using code is accomplished with
[ImportSolutionRequest](https://docs.microsoft.com/dotnet/api/microsoft.crm.sdk.messages.importsolutionrequest).

```csharp
// Install or upgrade a solution
byte[] fileBytes = File.ReadAllBytes(ManagedSolutionLocation);

ImportSolutionRequest impSolReq = new ImportSolutionRequest()
{
   CustomizationFile = fileBytes
};

_serviceProxy.Execute(impSolReq);
```

#### Tracking import success

You can use the ImportJob entity to capture data about the success of the
solution import. When you specify an `ImportJobId` for the
[ImportSolutionRequest](https://docs.microsoft.com/dotnet/api/microsoft.crm.sdk.messages.importsolutionrequest),
you can use that value to query the ImportJob entity about the status of the
import. The `ImportJobId` can also be used to download an import log file using
the
[RetrieveFormattedImportJobResultsRequest](https://docs.microsoft.com/dotnet/api/microsoft.crm.sdk.messages.retrieveformattedimportjobresultsrequest)
message.

```csharp
// Monitor solution import success
byte[] fileBytesWithMonitoring = File.ReadAllBytes(ManagedSolutionLocation);

ImportSolutionRequest impSolReqWithMonitoring = new ImportSolutionRequest()
{
   CustomizationFile = fileBytes,
   ImportJobId = Guid.NewGuid()
};

_serviceProxy.Execute(impSolReqWithMonitoring);

ImportJob job = (ImportJob)_serviceProxy.Retrieve(ImportJob.EntityLogicalName,
   impSolReqWithMonitoring.ImportJobId, new ColumnSet(new System.String[] { "data",
   "solutionname" }));

System.Xml.XmlDocument doc = new System.Xml.XmlDocument();
doc.LoadXml(job.Data);

String ImportedSolutionName =
   doc.SelectSingleNode("//solutionManifest/UniqueName").InnerText;

String SolutionImportResult =
   doc.SelectSingleNode("//solutionManifest/result/\@result").Value;

Console.WriteLine("Report from the ImportJob data");

Console.WriteLine("Solution Unique name: {0}", ImportedSolutionName);

Console.WriteLine("Solution Import Result: {0}", SolutionImportResult);

Console.WriteLine("");

// This code displays the results for Global Option sets installed as part of a
// solution.

System.Xml.XmlNodeList optionSets = doc.SelectNodes("//optionSets/optionSet");

foreach (System.Xml.XmlNode node in optionSets)
{
   string OptionSetName = node.Attributes["LocalizedName"].Value;
   string result = node.FirstChild.Attributes["result"].Value;

   if (result == "success")
   {
      Console.WriteLine("{0} result: {1}",OptionSetName, result);
   }
   else
   {
      string errorCode = node.FirstChild.Attributes["errorcode"].Value;
      string errorText = node.FirstChild.Attributes["errortext"].Value;

      Console.WriteLine("{0} result: {1} Code: {2} Description: {3}",OptionSetName,
      result, errorCode, errorText);
   }
}
```

The content of the `Data` property is a string representing the solution XML file.

## Add and remove solution components

Learn how to add and remove solution components using code.

### Add a new solution component
 
This sample shows how to create a solution component that is associated with a specific solution. If you don't associate the solution component to a specific solution when it is created it will only be added to the default solution and you will need to add it to a solution manually or by using the code included in the [Add an existing solution component](#add-an-existing-solution-component).  
  
 This code creates a new global option set and adds it to the solution with a unique name equal to `_primarySolutionName`.  
  
 ```csharp
 OptionSetMetadata optionSetMetadata = new OptionSetMetadata()
{
    Name = _globalOptionSetName,
    DisplayName = new Label("Example Option Set", _languageCode),
    IsGlobal = true,
    OptionSetType = OptionSetType.Picklist,
    Options =
{
    new OptionMetadata(new Label("Option 1", _languageCode), 1),
    new OptionMetadata(new Label("Option 2", _languageCode), 2)
}
};
CreateOptionSetRequest createOptionSetRequest = new CreateOptionSetRequest
{
    OptionSet = optionSetMetadata                
};

createOptionSetRequest.SolutionUniqueName = _primarySolutionName;
_serviceProxy.Execute(createOptionSetRequest);
 ```  
  
### Add an existing solution component  

This sample shows how to add an existing solution component to a solution.  
  
The following code uses the <xref:Microsoft.Crm.Sdk.Messages.AddSolutionComponentRequest> to add the `Account` entity as a solution component to an unmanaged solution.  
  
 ```csharp
// Add an existing Solution Component
//Add the Account entity to the solution
RetrieveEntityRequest retrieveForAddAccountRequest = new RetrieveEntityRequest()
{
    LogicalName = Account.EntityLogicalName
};
RetrieveEntityResponse retrieveForAddAccountResponse = (RetrieveEntityResponse)_serviceProxy.Execute(retrieveForAddAccountRequest);
AddSolutionComponentRequest addReq = new AddSolutionComponentRequest()
{
    ComponentType = (int)componenttype.Entity,
    ComponentId = (Guid)retrieveForAddAccountResponse.EntityMetadata.MetadataId,
    SolutionUniqueName = solution.UniqueName
};
_serviceProxy.Execute(addReq);
```

### Remove a solution component  

This sample shows how to remove a solution component from an unmanaged solution. The following code uses the <xref:Microsoft.Crm.Sdk.Messages.RemoveSolutionComponentRequest> to remove an entity solution component from an unmanaged solution. The `solution.UniqueName` references the solution created in [Create an unmanaged solution](#create-an-unmanaged-solution).  
  
 ```csharp
 // Remove a Solution Component
//Remove the Account entity from the solution
RetrieveEntityRequest retrieveForRemoveAccountRequest = new RetrieveEntityRequest()
{
    LogicalName = Account.EntityLogicalName
};
RetrieveEntityResponse retrieveForRemoveAccountResponse = (RetrieveEntityResponse)_serviceProxy.Execute(retrieveForRemoveAccountRequest);

RemoveSolutionComponentRequest removeReq = new RemoveSolutionComponentRequest()
{
    ComponentId = (Guid)retrieveForRemoveAccountResponse.EntityMetadata.MetadataId,
    ComponentType = (int)componenttype.Entity,
    SolutionUniqueName = solution.UniqueName
};
_serviceProxy.Execute(removeReq);
```

## Delete a solution

The following sample shows how to retrieve a solution using the solution `uniquename` and then extract the `solutionid` from the results. The sample then uses the `solutionid` with the<xref:Microsoft.Xrm.Sdk.IOrganizationService>. <xref:Microsoft.Xrm.Sdk.IOrganizationService.Delete*> method to delete the solution.  
  
```csharp
// Delete a solution

QueryExpression queryImportedSolution = new QueryExpression
{
    EntityName = Solution.EntityLogicalName,
    ColumnSet = new ColumnSet(new string[] { "solutionid", "friendlyname" }),
    Criteria = new FilterExpression()
};


queryImportedSolution.Criteria.AddCondition("uniquename", ConditionOperator.Equal, ImportedSolutionName);

Solution ImportedSolution = (Solution)_serviceProxy.RetrieveMultiple(queryImportedSolution).Entities[0];

_serviceProxy.Delete(Solution.EntityLogicalName, (Guid)ImportedSolution.SolutionId);

Console.WriteLine("Deleted the {0} solution.", ImportedSolution.FriendlyName);
```

## Cloning, patching, and upgrading

You can perform additional solution operations by using the available APIs. For cloning and patching solutions use the [CloneAsPatchRequest](https://docs.microsoft.com/dotnet/api/microsoft.crm.sdk.messages.cloneaspatchrequest)
and [CloneAsSolutionRequest](https://docs.microsoft.com/dotnet/api/microsoft.crm.sdk.messages.cloneassolutionrequest). For information about cloning and patching, see [Create solution patches](/powerapps/maker/common-data-service/solution-patches).

When performing solution upgrades use the [StageAndUpgradeRequest](https://docs.microsoft.com/dotnet/api/microsoft.crm.sdk.messages.stageandupgraderequest) and [DeleteAndPromoteRequest](https://docs.microsoft.com/dotnet/api/microsoft.crm.sdk.messages.deleteandpromoterequest). For more information about the process of staging and upgrades, see [Upgrade or update a solution](/powerapps/maker/common-data-service/update-solutions).

## Detect solution dependencies

 This sample shows how to create a report showing the dependencies between solution components.  
  
 This code will:  
  
- Retrieve all the components for a solution.  
  
- Retrieve all the dependencies for each component.  
  
- For each dependency found display a report describing the dependency.  
  
```csharp
// Grab all Solution Components for a solution.
QueryByAttribute componentQuery = new QueryByAttribute
{
    EntityName = SolutionComponent.EntityLogicalName,
    ColumnSet = new ColumnSet("componenttype", "objectid", "solutioncomponentid", "solutionid"),
    Attributes = { "solutionid" },

    // In your code, this value would probably come from another query.
    Values = { _primarySolutionId }
};

IEnumerable<SolutionComponent> allComponents =
    _serviceProxy.RetrieveMultiple(componentQuery).Entities.Cast<SolutionComponent>();

foreach (SolutionComponent component in allComponents)
{
    // For each solution component, retrieve all dependencies for the component.
    RetrieveDependentComponentsRequest dependentComponentsRequest =
        new RetrieveDependentComponentsRequest
        {
            ComponentType = component.ComponentType.Value,
            ObjectId = component.ObjectId.Value
        };
    RetrieveDependentComponentsResponse dependentComponentsResponse =
        (RetrieveDependentComponentsResponse)_serviceProxy.Execute(dependentComponentsRequest);

    // If there are no dependent components, we can ignore this component.
    if (dependentComponentsResponse.EntityCollection.Entities.Any() == false)
        continue;

    // If there are dependencies upon this solution component, and the solution
    // itself is managed, then you will be unable to delete the solution.
    Console.WriteLine("Found {0} dependencies for Component {1} of type {2}",
        dependentComponentsResponse.EntityCollection.Entities.Count,
        component.ObjectId.Value,
        component.ComponentType.Value
        );
    //A more complete report requires more code
    foreach (Dependency d in dependentComponentsResponse.EntityCollection.Entities)
    {
        DependencyReport(d);
    }
}
```
  
The `DependencyReport` method is in the following code sample.  
  
### Dependency report

 The `DependencyReport` method provides a friendlier message based on information found within the dependency.  
  
> [!NOTE]
> In this sample the method is only partially implemented. It can display messages only for attribute and option set solution components.  
  
```csharp
/// <summary>
   /// Shows how to get a more friendly message based on information within the dependency
   /// <param name="dependency">A Dependency returned from the RetrieveDependentComponents message</param>
   /// </summary> 
public void DependencyReport(Dependency dependency)
   {
 //These strings represent parameters for the message.
    String dependentComponentName = "";
    String dependentComponentTypeName = "";
    String dependentComponentSolutionName = "";
    String requiredComponentName = "";
    String requiredComponentTypeName = "";
    String requiredComponentSolutionName = "";

 //The ComponentType global Option Set contains options for each possible component.
    RetrieveOptionSetRequest componentTypeRequest = new RetrieveOptionSetRequest
    {
     Name = "componenttype"
    };

    RetrieveOptionSetResponse componentTypeResponse = (RetrieveOptionSetResponse)_serviceProxy.Execute(componentTypeRequest);
    OptionSetMetadata componentTypeOptionSet = (OptionSetMetadata)componentTypeResponse.OptionSetMetadata;
 // Match the Component type with the option value and get the label value of the option.
    foreach (OptionMetadata opt in componentTypeOptionSet.Options)
    {
     if (dependency.DependentComponentType.Value == opt.Value)
     {
      dependentComponentTypeName = opt.Label.UserLocalizedLabel.Label;
     }
     if (dependency.RequiredComponentType.Value == opt.Value)
     {
      requiredComponentTypeName = opt.Label.UserLocalizedLabel.Label;
     }
    }
 //The name or display name of the compoent is retrieved in different ways depending on the component type
    dependentComponentName = getComponentName(dependency.DependentComponentType.Value, (Guid)dependency.DependentComponentObjectId);
    requiredComponentName = getComponentName(dependency.RequiredComponentType.Value, (Guid)dependency.RequiredComponentObjectId);

 // Retrieve the friendly name for the dependent solution.
    Solution dependentSolution = (Solution)_serviceProxy.Retrieve
     (
      Solution.EntityLogicalName,
      (Guid)dependency.DependentComponentBaseSolutionId,
      new ColumnSet("friendlyname")
     );
    dependentComponentSolutionName = dependentSolution.FriendlyName;
    
 // Retrieve the friendly name for the required solution.
    Solution requiredSolution = (Solution)_serviceProxy.Retrieve
      (
       Solution.EntityLogicalName,
       (Guid)dependency.RequiredComponentBaseSolutionId,
       new ColumnSet("friendlyname")
      );
    requiredComponentSolutionName = requiredSolution.FriendlyName;

 //Display the message
     Console.WriteLine("The {0} {1} in the {2} depends on the {3} {4} in the {5} solution.",
     dependentComponentName,
     dependentComponentTypeName,
     dependentComponentSolutionName,
     requiredComponentName,
     requiredComponentTypeName,
     requiredComponentSolutionName);
   }
```
  
### Detect whether a solution component may be deleted

 Use the <xref:Microsoft.Crm.Sdk.Messages.RetrieveDependenciesForDeleteRequest> message to identify any other solution components which would prevent a given solution component from being deleted. The following code sample looks for any attributes using a known global optionset. Any attribute using the global optionset would prevent the global optionset from being deleted.  
  
```csharp
// Use the RetrieveOptionSetRequest message to retrieve  
// a global option set by it's name.
RetrieveOptionSetRequest retrieveOptionSetRequest =
    new RetrieveOptionSetRequest
    {
     Name = _globalOptionSetName
    };

// Execute the request.
RetrieveOptionSetResponse retrieveOptionSetResponse =
    (RetrieveOptionSetResponse)_serviceProxy.Execute(
    retrieveOptionSetRequest);
_globalOptionSetId = retrieveOptionSetResponse.OptionSetMetadata.MetadataId;
if (_globalOptionSetId != null)
{ 
 //Use the global OptionSet MetadataId with the appropriate componenttype
 // to call RetrieveDependenciesForDeleteRequest
 RetrieveDependenciesForDeleteRequest retrieveDependenciesForDeleteRequest = new RetrieveDependenciesForDeleteRequest 
{ 
 ComponentType = (int)componenttype.OptionSet,
 ObjectId = (Guid)_globalOptionSetId
};

 RetrieveDependenciesForDeleteResponse retrieveDependenciesForDeleteResponse =
  (RetrieveDependenciesForDeleteResponse)_serviceProxy.Execute(retrieveDependenciesForDeleteRequest);
 Console.WriteLine("");
 foreach (Dependency d in retrieveDependenciesForDeleteResponse.EntityCollection.Entities)
 {

  if (d.DependentComponentType.Value == 2)//Just testing for Attributes
  {
   String attributeLabel = "";
   RetrieveAttributeRequest retrieveAttributeRequest = new RetrieveAttributeRequest
   {
    MetadataId = (Guid)d.DependentComponentObjectId
   };
   RetrieveAttributeResponse retrieveAttributeResponse = (RetrieveAttributeResponse)_serviceProxy.Execute(retrieveAttributeRequest);

   AttributeMetadata attmet = retrieveAttributeResponse.AttributeMetadata;

   attributeLabel = attmet.DisplayName.UserLocalizedLabel.Label;
  
    Console.WriteLine("An {0} named {1} will prevent deleting the {2} global option set.", 
   (componenttype)d.DependentComponentType.Value, 
   attributeLabel, 
   _globalOptionSetName);
  }
 }
}
```
