---
title: "Work with solutions using the SDK APIs | Microsoft Docs"
description: "Learn about the APIs that are available to manage Common Data Service solutions."
keywords: 
author: phecke
ms.author: pehecke
manager: kvivek
ms.custom: ""
ms.date: 04/14/2020
ms.reviewer: "pehecke"
ms.service: powerapps
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
applies_to: 
  - "Dynamics 365 (online)"
  - "Dynamics 365 Version 9.x"
  - "powerapps"
ms.assetid: 
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
solution operations (and more), see [Sample: Work with solutions](/powerapps/developer/common-data-service/org-service/samples/work-solutions.md).

### Create a publisher

Every solution requires a publisher, represented by the [Publisher entity](/powerapps/developer/common-data-service/reference/entities/publisher.md). A publisher requires the following:

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
| Name               | Common Data Service generates a unique name based on the **Display Name**. You can edit the unique name. The unique name must only contain alphanumeric characters or the underscore character.   |
| Publisher          | Use the **Publisher** lookup to associate the solution with a publisher.      |
| Version            | Specify a version by using the following format: *major.minor.build.revision* (for example, 1.0.0.0.    |
| Configuration Page | If you include an HTML Web resource in your solution, you can use this lookup to add it as your designated configuration page. More information: [Use the Solution Configuration Page](/powerapps/developer/common-data-service/create-export-import-unmanaged-solution.md#BKMK_UseSolutionConfigurationPage)    |
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

// Create the solution if it doesn't already exist
EntityCollection querySampleSolutionResults =
   _serviceProxy.RetrieveMultiple(queryCheckForSampleSolution);

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
from other solutions. More information: [Add a new solution component](/powerapps/developer/common-data-service/work-solutions.md#add-a-new-solution-component)
and [Add an existing solution component](/powerapps/developer/common-data-service/work-solutions.md#add-an-existing-solution-component)

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

## Cloning, patching, and upgrading

You can perform other solution operations by using these
APIs: [StageAndUpgradeRequest](https://docs.microsoft.com/dotnet/api/microsoft.crm.sdk.messages.stageandupgraderequest),
[CloneAsPatchRequest](https://docs.microsoft.com/dotnet/api/microsoft.crm.sdk.messages.cloneaspatchrequest),
and [CloneAsSolutionRequest](https://docs.microsoft.com/dotnet/api/microsoft.crm.sdk.messages.cloneassolutionrequest).
For information about cloning and patching, see [Create solution patches](/powerapps/maker/common-data-service/solution-patches.md). For information about staging and upgrades, see [Solution lifecycle](solution-concepts-alm.md#solution-lifecycle).