---
title: "Solution staging, with asynchronous import and export | Microsoft Docs"
description: "Learn about staging solutions, and using an asynchronous job for import and export of large solution files."
keywords: 
author: mikkelsen2000
ms.author: pemikkel
manager: kvivek
ms.custom: ""
ms.date: 08/30/2021
ms.reviewer: "pehecke"
ms.service: powerapps
ms.topic: "article"
search.audienceType: 
  - developer
search.app: 
  - PowerApps
  - D365CE
---

# Solution staging, with asynchronous import and export

<!-- [!INCLUDE[applies-to-all](../includes/applies-to-all.md)] -->

Have you ever run into the situation during the import or export of a large solution where the operation times out? If so, you may be a candidate for performing the solution import/export asynchronously. This topic describes how to initiate the asynchronous import or export using the SDK and Web APIs.

## Staging a solution

In comparison to importing a solution where the solution is imported and available in the environment right away, staging breaks the import process into more controllable phases. The staging process imports the solution as a "holding" solution where the administrator can decide when to make the staged solution available to users, or to perform an upgrade (in the case of a solution upgrade) in the target environment. Part of the staging process is validation of the staged solution. In this way you can stage the solution, know that the solution is valid, and schedule when to apply that solution or upgrade to the target environment.


| Operation | Web API | SDK API |
| --- | --- | --- |
| Stage a solution | [StageSolution](/dynamics365/customer-engagement/web-api/stagesolution) | [StageSolutionRequest](/dotnet/api/microsoft.crm.sdk.messages.stagesolutionrequest) |

The result of staging the solution will be a collection of validation results indicating success or failure and (if successful) a `StageSolutionUploadId` to be used in the `ImportSolutionAsync` call. See the import solution Web API sample code above for an example of how this is done.

### [SDK API (C#)](#tab/sdk-csharp)

:::code language="csharp" source="~/powerapps-samples/cds/orgsvc/c#/SolutionStageAndImport/Program.cs" id="snippet_stage-solution":::

```csharp
public static StageSolutionResults StageSolution(
    IOrganizationService service,
    string solutionFilePath)
{
  // Stage the solution
  var req = new StageSolutionRequest();

  byte[] fileBytes = File.ReadAllBytes(solutionFilePath);
  req["CustomizationFile"] = fileBytes;
  var res = service.Execute(req);

  return (res["StageSolutionResults"] as StageSolutionResults);
}
```

### [Web API (C#)](#tab/webapi-csharp)

```csharp
// No sample code is available at this time
```

---

## Solution import

`ImportSolution` is the action (or message) that performs the synchronous import operation. To execute the import operation asynchronously use `ImportSolutionAsync`.

| Operation | Web API | SDK API |
| --- | --- | --- |
| Import a solution | [ImportSolutionAsync](/dynamics365/customer-engagement/web-api/importsolutionasync) | [ImportSolutionAsyncRequest](/dotnet/api/microsoft.crm.sdk.messages.importsolutionasyncrequest) |

Now let's take a look at some example code that demonstrates `ImportSolutionAsync`.

### [SDK API (C#)](#tab/sdk-csharp)

:::code language="csharp" source="~/powerapps-samples/cds/orgsvc/c#/SolutionStageAndImport/Program.cs" id="snippet_import-solution-async":::

```csharp
public static ImportSolutionAsyncResponse ImportSolution(
    IOrganizationService service,
    StageSolutionResults stagingResults)
{
  // Import the staged solution
  var componentDetails = stagingResults.SolutionComponentsDetails;

  // TODO These are not referenced in the code but are usefull to explore
  var missingDependencies = stagingResults.MissingDependencies;   // Contains missing dependencies
  var solutionDetails = stagingResults.SolutionDetails;           // Contains solution details

  var connectionReferences = componentDetails.Where(x => string.Equals(x.ComponentTypeName,"connectionreference"));
  var envVarDef = componentDetails.Where(x => string.Equals(x.ComponentTypeName,"environmentvariabledefinition"));
  var envVarValue = componentDetails.Where(x => string.Equals(x.ComponentTypeName,"environmentvariablevalue"));

  var componentParams = new EntityCollection();

  // Add each connection reference to the component parmameters entity collection.
  foreach (var conn in connectionReferences)
  {
      var e = new Entity("connectionreference")
      {
          ["connectionreferencelogicalname"] = conn.Attributes["connectionreferencelogicalname"].ToString(),
          ["connectionreferencedisplayname"] = conn.Attributes["connectionreferencedisplayname"].ToString(),
          ["connectorid"] = conn.Attributes["connectorid"].ToString(),
          ["connectionid"] = "custom input"
      };
      componentParams.Entities.Add(e);
  }
  
  // Add each environment variable to the component parmameters entity collection.
  foreach (var value in envVarValue)
  {
      var e = new Entity("environmentvariablevalue")
      {
          ["schemaname"] = value.Attributes["schemaname"].ToString(),
          ["value"] = "custom input"
      };

      if (value.Attributes.ContainsKey("environmentvariablevalueid"))
      {
          e["environmentvariablevalueid"] = value.Attributes["environmentvariablevalueid"].ToString();
      }
      componentParams.Entities.Add(e);
  }

  // Import the solution
  var importSolutionReq = new ImportSolutionAsyncRequest();
  importSolutionReq.ComponentParameters = componentParams;
  importSolutionReq.SolutionParameters = new SolutionParameters { StageSolutionUploadId =stagingResults.StageSolutionUploadId };
  var response = service.Execute(importSolutionReq) as ImportSolutionAsyncResponse;

  return (response);
}
```

### [Web API (C#)](#tab/webapi-csharp)

```csharp
private void ImportSolutionUsingJob(HttpClient httpClient, string filepath) 
{ 
  HttpRequestMessage request = null; 

  try 
  { 
    byte[] fileBytes = File.ReadAllBytes(filepath); 
    request = new HttpRequestMessage(HttpMethod.Post, "api/data/v9.1/ImportSolutionAsync"); 

    var str = @"[ 
    { 
      '@odata.type':'Microsoft.Dynamics.CRM.environmentvariablevalue', 
      'schemaname':'pa_EV1', 
      'environmentvariablevalueid': '04c897b5-b838-ea11-a813-000d3a5a4145', 
      'value':'testvalue1' 
    },
    { 
      '@odata.type':'Microsoft.Dynamics.CRM.environmentvariablevalue', 
      'schemaname':'pa_EV2', 
      'value':'testvalue2' 
    }, ]"; 

    var inputs = new JObject(); 
    var solParams = new JObject(); 

    // If you were using a staged solution, place its ID here.
    solParams["StageSolutionUploadId"] = Guid.Empty; 

    inputs["SolutionParameters"] = solParams; 
    inputs["OverwriteUnmanagedCustomizations"] = false; 
    inputs["PublishWorkflows"] = true; 
    inputs["CustomizationFile"] = Convert.ToBase64String(fileBytes); 
    inputs["ComponentParameters"] = JArray.Parse(str); 

    var body = JsonConvert.SerializeObject(inputs); 
    request.Content = new StringContent(body); 
    request.Content.Headers.ContentType = MediaTypeHeaderValue.Parse("application/json"); 

    //Send the HttpRequest 
    var response = httpClient.SendAsync(request); 
    response.Wait(); 

    var result = response.Result.Content.ReadAsStringAsync(); 
    result.Wait(); 

    var jsonRes = JsonConvert.DeserializeObject(result.Result).ToString(); 
  }

  catch (Exception err) 
  { 
    throw new Exception(err.Message); 
  }
}
```

---

`ImportSolutionAsync` shares many input parameters with `ImportSolution` but adds `ComponentParameters` and `SolutionParameters`. `ComponentParameters` can be used to overwrite the component data in the solution's customization XML file. `SolutionParameters` can be used to pass the `StageSolutionUploadId` of a staged solution as was shown in the example Web API code. More information: [Staging a solution](#staging-a-solution)

The response returned from `ImportSolutionAsync` contains `ImportJobKey` and `AsyncOperationId`. The `ImportJobKey` value can be used to obtain the import result and the `AsyncOperationId` value can be used to track the import job status.

### [SDK API (C#)](#tab/sdk-csharp)

:::code language="csharp" source="~/powerapps-samples/cds/orgsvc/c#/SolutionStageAndImport/Program.cs" id="snippet_check-import-status":::

```csharp
public static void CheckImportStatus(
    IOrganizationService service,
    Guid asyncOperationId,
    Guid importJobKey)
{
    // Get solution import status
    var finished = false;
    Entity asyncOperation = null;
    // Wait until the async job is finished
    while (!finished)
    {
        asyncOperation = service.Retrieve("asyncoperation", asyncOperationId, new ColumnSet("statecode", "statuscode"));
        OptionSetValue statecode = (OptionSetValue)asyncOperation["statecode"];
        if (statecode.Value == 3)
        {
            finished = true;
        }
        else
        {
            Thread.Sleep(10000);
        }
    }
    // Solution import completed successfully
    OptionSetValue statuscode = (OptionSetValue)asyncOperation["statuscode"];
    if (statuscode.Value == 30)
    {
        Console.WriteLine("The solution import completed successfully.");
    }
    else if (asyncOperation["statuscode"].ToString() == "31")  // Solution import failed
    {
        Console.WriteLine("The solution import failed.");
        var getLogReq = new RetrieveFormattedImportJobResultsRequest { ImportJobId = importJobKey };
        var importJob = service.Execute(getLogReq) as RetrieveFormattedImportJobResultsResponse;
        // TODO Do something with the import job results
    }
}
```

### [Web API (C#)](#tab/webapi-csharp)

```csharp
// No sample code is available at this time
```

---

## Solution export

`ExportSolution` is the action (or message) that performs the synchronous export operation. To execute the export operation asynchronously use `ExportSolutionAsync`.

| Operation | Web API | SDK API |
| --- | --- | --- |
| Export a solution | [ExportSolutionAsync](/dynamics365/customer-engagement/web-api/exportsolutionasync) | [ExportSolutionAsyncRequest](/dotnet/api/microsoft.crm.sdk.messages.exportsolutionasyncrequest) |
| Download an exported solution file | [DownloadSolutionExportData](/dynamics365/customer-engagement/web-api/downloadsolutionexportdata) | [DownloadSolutionExportDataRequest](/dotnet/api/microsoft.crm.sdk.messages.downloadsolutionexportdatarequest) |

Now let's take a look at some example code that demonstrates `ExportSolutionAsync`.

### [SDK API (C#)](#tab/sdk-csharp)

```csharp
// Where 'service' is a pre-configured Organization service instance.
var service = (OrganizationServiceProxy)xsc.CreateOrganizationService();

var req = new OrganizationRequest("ExportSolutionAsync");
req.Parameters.Add("SolutionName", "ExportSolutionAsyncTest");
req.Parameters.Add("Managed", false);
var response = service.Execute(req);
```

### [Web API (C#)](#tab/webapi-csharp)

```csharp
// No sample code is available at this time
```

---

In the response are the `AsyncOperationId` and `ExportJobId` parameter values. Use the `AsyncOperationId` in the response to verify the success (`statecode` == 3; `statuscode` == 30) of the asynchronous job. Next, use the `DownloadSolutionExportData` action (or message) with the `ExportJobId` value from the export response to download the exported solution file, which is returned in the `ExportSolutionFile` parameter.

### [SDK API (C#)](#tab/sdk-csharp)

```csharp
// Where 'service' is a pre-configured Organization service instance.
var service = (OrganizationServiceProxy)xsc.CreateOrganizationService();

var req = new OrganizationRequest("DownloadSolutionExportData");
req.Parameters.Add("ExportJobId", Guid.Parse("a9089b53-a1c7-ea11-a813-000d3a14420d");
var response = service.Execute(req);
```

### [Web API (C#)](#tab/webapi-csharp)

```csharp
// No sample code is available at this time
```

---
