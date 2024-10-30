---
title: "Submit and approve catalog items"
description: "Learn how to submit items to your organization's catalog of templates and components."
author: derekkwanpm
ms.author: derekkwan
ms.subservice: developer
ms.date: 07/01/2024
ms.reviewer: jdaly
ms.topic: article
search.audienceType: 
  - developer
contributors:
 - MattB-msft
---
# Submit and approve catalog items

People must submit their catalog items for approval and an administrator must approve them before others can use them.

To submit an item to the catalog, you need:

- A solution or package deployer package containing the item you want to submit.
- A submission metadata JSON document.

  Use the [pac catalog create-submission](../cli/reference/catalog.md#pac-catalog-create-submission) command to get an example submission metadata JSON document. You must edit this document and more submission attributes can be added. More information: [Submission attributes](#submission-attributes)

## Submission attributes

Before you can [submit items to a catalog](#submit-items-to-the-catalog), you must prepare a JSON document that describes the items you want to submit.

To help you, the [pac catalog create-submission](../cli/reference/catalog.md#pac-catalog-create-submission) command generates a sample `submission.json` file.

You need to edit this file to submit an item. Here's an example:

```json
{
  "modelVersion": "1.0.0.0",
  "operation": "CreateOrUpdate",
  "sourcePortal": 526430005,
  "businessJustification": "Power Platform custom connector for Conference API",
  "publisherDetails": {
    "publisherId": "ContosoConferencesTeam",
    "publisherDisplayName": "Catalog Conferences Team"
  },
  "catalogItemDefinition": {
    "id": "ContosoConferencesCustomConnector",
    "displayName": "Contoso Conference Custom Connector",
    "description": "Demo Custom connector to query Conference Speakers & Sessions",
    "offer": {
      "type": "Component_Collection",
      "deploymentType": "Normal",
      "engineeringName": {
        "firstName": "Jennifer",
        "lastName": "Wilkins",
        "email": "jwilkins@contoso.com",
        "phoneNumber": "555-111-1234"
      },
      "supportName": {
        "firstName": "Aidan",
        "lastName": "Hunt",
        "email": "ahunt@contoso.com",
        "phoneNumber": "555-111-1234"
      }
    }
  }
}
```

[Learn about the valid properties for the submission file](submission-reference.md)

## Submit items to the catalog

Items submitted to the catalog need to be included within a package deployer package. A package deployer package contains a solution zip file and some optional instructions to apply when deploying the package. If you don't have a package deployer package, you can create one for the solution that contains your items.


### [PAC CLI](#tab/cli)

After your submission metadata JSON document is ready, use the [pac catalog submit](../cli/reference/catalog.md#pac-catalog-submit) command to submit it.

Use the required `--path` parameter to refer to the catalog submission JSON document.

If you already have a package deployer package:

- Use the `--package-zip` parameter to refer to the package deployer package.
- Otherwise, use the `--solution-zip` parameter to refer to this solution. The `submit` command will create the package behind the scenes.

If you want to combine polling the status of your submission request, use the --poll-status parameter. Otherwise, use the [pac catalog status](../cli/reference/catalog.md#pac-catalog-status) command as described in [Check status of catalog submissions](#check-status-of-catalog-submissions).

```powershell
pac catalog submit -p "BuildDemoSubmission.json" -sz "ContosoConference_1_0_0_1_managed.zip"
Creating package for catalog submit request...
Connected to... TestCatalog
Connected as user@domain
Tracking id for this submission is 0e6b119d-80f3-ed11-8849-000d3a0a2d9d
```

[What is Microsoft Power Platform CLI?](../cli/introduction.md)

### [SDK for .NET](#tab/sdk)

The static `SubmitCatalogApprovalRequest` method demonstrates using the `mspcat_SubmitCatalogApprovalRequest` message. This example uses the `mspcat_SubmitCatalogApprovalRequestRequest` and `mspcat_SubmitCatalogApprovalRequestResponse` classes generated using the [pac modelbuilder build](../cli/reference/modelbuilder.md#pac-modelbuilder-build) command.

This example method returns an instance of the `mspcat_SubmitCatalogApprovalRequestResponse` class, which contains `CertificationRequestId` and `AsyncOperationId` properties you can use the check the status of the submission.

The `mspcat_SubmitCatalogApprovalRequest` message requires that the submission JSON file [CatalogItemDefinition](submission-reference.md#catalogitemdefinition) `packageFile` property is set to a specify a URL to download a package deployer package file.


```csharp
/// <summary>
/// Submits a Catalog item for approval
/// </summary>
/// <param name="service">The authenticated IOrganizationService instance.</param>
/// <param name="pathToSubmissionFile">The location of the submission file</param>
/// <returns>mspcat_SubmitCatalogApprovalRequestResponse contains AsyncOperationId and CertificationRequestId</returns>
static mspcat_SubmitCatalogApprovalRequestResponse SubmitCatalogApprovalRequest(
   IOrganizationService service,
   FileInfo pathToSubmissionFile)
{

   byte[] fileBytes = File.ReadAllBytes(pathToSubmissionFile.FullName);
   string encodedSubmissionFile = Convert.ToBase64String(fileBytes);


   var request = new mspcat_SubmitCatalogApprovalRequestRequest
   {
         EncodedApprovalRequest = encodedSubmissionFile
   };

   return (mspcat_SubmitCatalogApprovalRequestResponse)service.Execute(request);

}
```


[Use the Dataverse SDK for .NET](/power-apps/developer/data-platform/org-service/overview)

### [Web API](#tab/webapi)

The following `SubmitCatalogApprovalRequest` PowerShell function demonstrates how to use the `mspcat_SubmitCatalogApprovalRequest` message.
The results returned are an instance of the `mspcat_SubmitCatalogApprovalRequestResponse` complex type, which contains `CertificationRequestId` and `AsyncOperationId` properties you can use the check the status of the submission.

The `mspcat_SubmitCatalogApprovalRequest` message requires that the submission JSON file [CatalogItemDefinition](submission-reference.md#catalogitemdefinition) `packageFile` property is set to a specify a URL to download a package deployer package file.

This function depends on the `$baseURI` and `$baseHeaders` values set using the `Connect` function as describe in [Create a Connect function](/power-apps/developer/data-platform/webapi/use-ps-and-vscode-web-api#create-a-connect-function)

```powershell
function SubmitCatalogApprovalRequest {
   param (
      [Parameter(Mandatory)]
      [System.IO.FileInfo]
      $pathToSubmissionFile
   )

   $uri = $baseURI + 'mspcat_SubmitCatalogApprovalRequest'

   $encodedApprovalRequest = [System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes($pathToSubmissionFile.FullName))

   $body = @{
      EncodedApprovalRequest = $encodedApprovalRequest
   } | ConvertTo-Json

   $postHeaders = $baseHeaders.Clone()
   $postHeaders.Add('Content-Type', 'application/json')

   $results = Invoke-RestMethod `
      -Method Post `
      -Uri $uri `
      -Headers $postHeaders `
      -Body $body

   return   @{
      CertificationRequestId = $results.CertificationRequestId
      AsyncOperationId = $results.AsyncOperationId
   }

}
```


[Use the Microsoft Dataverse Web API](/power-apps/developer/data-platform/webapi/overview)   

---

## Create package deployer package from an unmanaged solution

When you use the `mspcat_SubmitCatalogApprovalRequest` message with the SDK for .NET or Web API as described in [Submit items to the catalog](#submit-items-to-the-catalog), the submission JSON file must include a [CatalogItemDefinition](submission-reference.md#catalogitemdefinition) `packageFile` property is set to a specify a URL in the `filesaslink` to download a package deployer package file. This is not needed by the [pac catalog submit](../cli/reference/catalog.md#pac-catalog-submit) command because it takes care of this for you in a manager similar to what is described here.

This URL can represent anywhere that Dataverse can download a file without any credentials, but we don't recommend you place the files on public download location. Instead, you can use the [Package Submission Store (mspcat_PackageStore) table](/power-apps/developer/data-platform/reference/entities/mspcat_packagestore) to generate a package deployer package using an unmanaged solution from any environment in your tenant. This process will generate a record in this table that contains a package in the [PackageFile (mspcat_PackageFile) file column](/power-apps/developer/data-platform/reference/entities/mspcat_packagestore#BKMK_mspcat_PackageFile). You can then use the `GetFileSasUrl` message to get a shared access signature (SAS) URL to enable anonymous downloading of the file within 1 hour. Because the URL is only valid within an hour, this process should be automated so that access to download the file doesn't expire.

> [!NOTE]
> This example uses the [mspcat_PackageStore.mspcat_packagefile column](/power-apps/developer/data-platform/reference/entities/mspcat_packagestore#BKMK_mspcat_PackageFile), but the `GetFileSasUrl` message can provide a SAS URL for any file or image column in Dataverse. [Learn more about granting limited access to Dataverse files using shared access signatures](/power-apps/developer/data-platform/getfilesasurl)

### Process

1. Create a [Package Submission Store (mspcat_PackageStore) ](/power-apps/developer/data-platform/reference/entities/mspcat_packagestore) record with these values
   
   |Column|Value|
   |---------|---------|
   |`mspcat_name`|The name of the unmanaged solution|
   |`mspcat_solutionuniquename`|The unique name of the unmanaged solution|
   |`mspcat_intendeddeploymenttype`|`526430000` for **Standard** deployment|
   |`mspcat_operation`|`958090001` for **Create Package**|
   
1. Update the `statuscode` value from `958090003` for **Draft** to `958090004` for **Submitted**.

   This starts the process.

1. Wait for `statuscode` to change to `958090001` for **Completed**.
1. Use `GetFileSasUrl` to get a URL for the [mspcat_PackageStore.mspcat_packagefile column](/power-apps/developer/data-platform/reference/entities/mspcat_packagestore#BKMK_mspcat_PackageFile). This returns a [GetFileSasUrlResponse](/power-apps/developer/data-platform/getfilesasurl#response) object.
1. Create a [CatalogFileAsset](submission-reference.md#catalogfileasset) JSON object setting these properties:

   |Property|Value|
   |---------|---------|
   |`name`|GetFileSasUrlResponse.FileName|
   |`filesaslink`|GetFileSasUrlResponse.SasUrl|

1. Set this to the [CatalogItemDefinition](submission-reference.md#catalogitemdefinition) `packageFile` property of the JSON submission file.
1. Use the `mspcat_SubmitCatalogApprovalRequest` to send the submission as described in [Submit items to the catalog](#submit-items-to-the-catalog)


### [PAC CLI](#tab/cli)

There is no PAC CLI command to do this.

### [SDK for .NET](#tab/sdk)

The static `CatalogItemFromSolution` method below shows how to create a catalog item from a solution following the steps described in [Process](#process). The `catalogItemSubmissionJsonString` parameter for this function should not have a `packageFile` property set because this function will add it.

```csharp
/// <summary>
/// Processes a solution and returns the catalog item ID
/// </summary>
/// <param name="service">The authenticated IOrganizationService instance</param>
/// <param name="solutionName">The name of the solution</param>
/// <param name="solutionUniqueName">The unique name of the solution</param>
/// <param name="catalogItemSubmissionJsonString">The string containing the submission json file</param>
/// <returns></returns>
/// <exception cref="Exception"></exception>
static string CatalogItemFromSolution(
    IOrganizationService service,
    string solutionName,
    string solutionUniqueName,
    string catalogItemSubmissionJsonString
    )
{
    Entity packageStoreRecord = new("mspcat_packagestore")
    {
        Attributes = {
            {"mspcat_name", solutionName},
            {"mspcat_solutionuniquename", solutionUniqueName},
            {"mspcat_intendeddeploymenttype", new OptionSetValue(526430000)},
            {"mspcat_operation", new OptionSetValue(958090001)}
        }
    };

    Guid packageStoreRecordId = service.Create(packageStoreRecord);
    Console.WriteLine($"Created package store record with ID {packageStoreRecordId}");

    packageStoreRecord.Attributes.Clear(); //Don't send values again
    packageStoreRecord.Id = packageStoreRecordId;
    int statusCodeValue = 958090004; // Submitted
    string statusReason;
    packageStoreRecord["statuscode"] = new OptionSetValue(statusCodeValue);
    service.Update(packageStoreRecord); //Set status to Submitted
    Console.WriteLine("Updated package store record status to Submitted");
    // Columns to retrieve while polling the package store record
    ColumnSet packageStoreColumns = new("statuscode");

    do
    {
        Task.Delay(10000).Wait(); //Wait 10 seconds between polling

        // Retrieve the record
        packageStoreRecord = service.Retrieve(
            "mspcat_packagestore",
            packageStoreRecord.Id,
            packageStoreColumns);

        // Get the status code value
        statusCodeValue = packageStoreRecord
            .GetAttributeValue<OptionSetValue>("statuscode").Value;

        statusReason = packageStoreRecord
            .FormattedValues["statuscode"];

        Console.WriteLine($" - Package store record status is {statusReason}");

        // Continue while statusCodeValue is Submitted, Pending, or Running
    } while (statusCodeValue.Equals(958090004) ||
             statusCodeValue.Equals(1) ||
             statusCodeValue.Equals(958090000));

    // If it isn't Completed, throw an exception
    if (!statusCodeValue.Equals(958090001))
    {
        statusReason = packageStoreRecord
            .FormattedValues["statuscode"];

        // 958090002 is 'Failed'
        throw new Exception($"Package submission {statusReason}");
    }
    Console.WriteLine($"Package submission {statusReason}");

    // If successful, retrieve the details about the file to download
    GetFileSasUrlRequest getFileSasUrlRequest = new()
    {
        Target = new EntityReference("mspcat_packagestore", packageStoreRecord.Id),
        FileAttributeName = "mspcat_packagefile"
    };

    var getFileSasUrlResponse = (GetFileSasUrlResponse)service
        .Execute(getFileSasUrlRequest);
    FileSasUrlResponse getFileSasUrlResponseResult = getFileSasUrlResponse.Result;
    Console.WriteLine($"Retrieved SAS URL for {getFileSasUrlResponseResult.FileName}");

    // Add the packageFile to the catalog item submission
    var catalogItemSubmissionJsonObject = JsonNode.Parse(catalogItemSubmissionJsonString).AsObject();

    var packageFile = new JsonObject
    {
        ["name"] = getFileSasUrlResponseResult.FileName,
        ["filesaslink"] = getFileSasUrlResponseResult.SasUrl
    };

    // Add the packageFile to the catalog item submission
    catalogItemSubmissionJsonObject["catalogItemDefinition"]["packageFile"] = packageFile;

    catalogItemSubmissionJsonString = catalogItemSubmissionJsonObject.ToJsonString();

    string encodedSubmissionJson = Convert
        .ToBase64String(Encoding.UTF8.GetBytes(catalogItemSubmissionJsonString));

    var submitCatalogApprovalRequest = new mspcat_SubmitCatalogApprovalRequestRequest
    {
        EncodedApprovalRequest = encodedSubmissionJson
    };

    var submitCatalogApprovalResponse = (mspcat_SubmitCatalogApprovalRequestResponse)service
        .Execute(submitCatalogApprovalRequest);
    Console.WriteLine($"Submitted catalog approval request with ID {submitCatalogApprovalResponse.CertificationRequestId}");

    Guid certificationRequestId = submitCatalogApprovalResponse.CertificationRequestId;

    // Approval must be in either InProgress or Submitted to be processed

    // Columns to retrieve while polling the certification request record
    ColumnSet certificationRequestColumns = new("statuscode", "mspcat_application");
    Entity certificationRequestRecord;

    do
    {
        Task.Delay(10000).Wait(); //Wait 10 seconds between polling

        // Retrieve the record
        certificationRequestRecord = service.Retrieve(
           "mspcat_certificationrequest",
           certificationRequestId,
           certificationRequestColumns);

        // Get the status code value
        statusCodeValue = certificationRequestRecord
            .GetAttributeValue<OptionSetValue>("statuscode").Value;

        statusReason = packageStoreRecord
            .FormattedValues["statuscode"];

        Console.WriteLine($" - Approval Request status is {statusReason}");

        // Continue while statusCodeValue is:
    } while (statusCodeValue.Equals(526430002) || // Waiting On Submitter,
             statusCodeValue.Equals(526430003) || // Pending Deployment,
             statusCodeValue.Equals(526430008) || // Draft
             statusCodeValue.Equals(526430009));  // Processing

    // If it isn't Submitted or InProgress, throw an exception
    if (!(statusCodeValue.Equals(1) || statusCodeValue.Equals(526430001)))
    {
        string statusreason = certificationRequestRecord
            .FormattedValues["statuscode"];

        throw new Exception($"Certification request {statusreason}");
    }


    // Approve the request
    mspcat_ResolveApprovalRequest resolveApprovalRequest = new()
    {
        Target = new EntityReference("mspcat_certificationrequest", certificationRequestId),
        requestsuccess = true, //Approve the request
        message = "Approved by CatalogItemFromSolution function"
    };

    // mspcat_ResolveApprovalResponse has no properties to return
    service.Execute(resolveApprovalRequest);
    Console.WriteLine("Approved the certification request");

    // Get the Catalog Item
    EntityReference catalogItemReference = certificationRequestRecord
            .GetAttributeValue<EntityReference>("mspcat_application");

    Entity catalogItem = service.Retrieve(
        "mspcat_applications",
        catalogItemReference.Id,
        new ColumnSet("mspcat_tpsid"));

    string tpsid = catalogItem.GetAttributeValue<string>("mspcat_tpsid");
    Console.WriteLine($"Returning Catalog Item ID: {tpsid}");

    return tpsid;
}
```

**Output**

The output of this function should look something like this:

```
Created package store record with ID 46f662aa-2137-ef11-8409-6045bdd3aec3
Updated package store record status to Submitted
 - Package store record status is Submitted
 - Package store record status is Pending
 - Package store record status is Running
 - Package store record status is Running
 - Package store record status is Completed
Package submission Completed
Retrieved SAS URL for <solutionName>_1_0_0_0.zip
Submitted catalog approval request with ID b932c7c8-2137-ef11-8409-6045bdd3aec3
 - Approval Request status is Completed
Approved the certification request
Returning Catalog Item ID: <solutionUniqueName>
```


### [Web API](#tab/webapi)

> TODO: A PowerShell function that accepts these parameters:
>  - The name of an unmanaged solution
>  - The Unique Name of an unmanaged solution
> The return value is a completed catalog item ready to install

---

## Check status of catalog submissions

The [statuscode Choices/Options](tables/mspcat_certificationrequest.md#statuscode-choicesoptions) options of the [Approval Request (mspcat_certificationrequest) table](tables/mspcat_certificationrequest.md). Completed (2) represents a successful submission.

|Value|Label|
|---|---|
|1|Submitted|
|526430001|InProgress|
|526430002|Waiting On Submitter|
|526430003|Pending Deployment|
|526430008|Draft|
|526430009|Processing|
|2|Completed|
|526430000|Abandoned|
|526430004|Rejected|
|526430005|Marketing Content|
|526430006|Duplicate Request|
|526430010|Failed Prevalidation|


### [PAC CLI](#tab/cli)

Use the [pac catalog status](../cli/reference/catalog.md#pac-catalog-status) command to check the status of catalog submissions.

```powershell
pac catalog status --tracking-id 0e6b119d-80f3-ed11-8849-000d3a0a2d9d --type submit
Connected to... TestCatalog
Connected as user@domain
Status of the Submit request: Submitted
```

[What is Microsoft Power Platform CLI?](../cli/introduction.md)

### [SDK for .NET](#tab/sdk)

> TODO: Show how to poll the [Approval Request (mspcat_certificationrequest) record to check the status](tables/mspcat_certificationrequest.md)

[Use the Dataverse SDK for .NET](/power-apps/developer/data-platform/org-service/overview)

### [Web API](#tab/webapi)

> TODO: Show how to poll the [Approval Request (mspcat_certificationrequest) record to check the status](tables/mspcat_certificationrequest.md)

// Poll for status of certification request
GET /mspcat_certificationrequests(id)?$select=statuscode

[Use the Microsoft Dataverse Web API](/power-apps/developer/data-platform/webapi/overview)

---



## Approve catalog submissions

Catalog submissions are typically approved within the Power Platform Catalog Manager application.

### [PAC CLI](#tab/cli)

There is no PAC CLI command to perform this operation.

### [SDK for .NET](#tab/sdk)

This static `ResolveApproval` method demonstrates how to resolve a request for a catalog submission using the `mspcat_ResolveApproval`. This example uses the the `mspcat_ResolveApprovalRequest` class generated by the [pac modelbuilder build](../cli/reference/modelbuilder.md#pac-modelbuilder-build) command.

```csharp
/// <summary>
/// Resolves a catalog submission approval
/// </summary>
/// <param name="service">The authenticated IOrganizationService instance.</param>
/// <param name="certificationRequestId">The ID of the certification request.</param>
/// <param name="requestsuccess">The decision to approve or reject the request.</param>
/// <param name="message"></param>
static void ResolveApproval(
   IOrganizationService service,
   Guid certificationRequestId,
   bool requestsuccess, 
   string message)
{

   mspcat_ResolveApprovalRequest request = new()
   {
         Target = new EntityReference("mspcat_certificationrequest", certificationRequestId),
         requestsuccess = requestsuccess,
         message = message
   };

   // mspcat_ResolveApprovalResponse has no properties to return
   service.Execute(request);
}
```


### [Web API](#tab/webapi)


This `ResolveApproval` Powershell function demonstrates how to resolve a request for a catalog submission using the `mspcat_ResolveApproval` message.

This function depends on the `$baseURI` and `$baseHeaders` values set using the `Connect` function as describe in [Create a Connect function](/power-apps/developer/data-platform/webapi/use-ps-and-vscode-web-api#create-a-connect-function)


```powershell
<#
.SYNOPSIS
   This function resolves an approval request.

.DESCRIPTION
   mspcat_ResolveApproval is an action bound to the mspcat_certificationrequests table.

.PARAMETER certificationRequestId
   This is a mandatory GUID parameter that represents the ID of the certification request.

.PARAMETER requestsuccess
   This is a mandatory Boolean parameter that indicates the decision to approve or reject the request..

.PARAMETER message
   This is a mandatory string parameter that contains a message about the request.

.EXAMPLE
   ResolveApproval `
      -certificationRequestId "<Guid>" `
      -requestsuccess $true `
      -message "Request processed successfully."

.NOTES
   The function does not return any value. 
   Any output from the Invoke-RestMethod cmdlet is sent to Out-Null.
#>
function ResolveApproval {
   param (
      [Parameter(Mandatory)]
      [guid]
      $certificationRequestId,
      [Parameter(Mandatory)]
      [bool]
      $requestsuccess,
      [Parameter(Mandatory)]
      [string]
      $message
   )

   $uri = $baseURI + "mspcat_certificationrequests($certificationRequestId)"
   $uri += "/Microsoft.Dynamics.CRM.mspcat_ResolveApproval"

   $body = @{
      requestsuccess = $requestsuccess
      message        = $message
   } | ConvertTo-Json

   $postHeaders = $baseHeaders.Clone()
   $postHeaders.Add('Content-Type', 'application/json')

   Invoke-RestMethod `
      -Method Post `
      -Uri $uri `
      -Headers $postHeaders `
      -Body $body | Out-Null
}

```

[Use the Microsoft Dataverse Web API](/power-apps/developer/data-platform/webapi/overview)   
[Use PowerShell and Visual Studio Code with the Dataverse Web API](/power-apps/developer/data-platform/webapi/use-ps-and-vscode-web-api)

---


## Next steps

> [!div class="nextstepaction"]
> [Review the catalog item submission document reference](submission-reference.md)

> [!div class="nextstepaction"]
> [Compose submission document](submission-reference.md)