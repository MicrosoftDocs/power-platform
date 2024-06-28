---
title: "Submit and approve catalog items (preview)"
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
 - JimDaly
---
# Submit and approve catalog items (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

People must submit their catalog items for approval and an administrator must approve them before others can use them.

To submit an item to the catalog, you need:

- A solution or package deployer package containing the item you want to submit
- A submission metadata JSON document.

  Use the [pac catalog create-submission](../cli/reference/catalog.md#pac-catalog-create-submission) command to get an example submission metadata JSON document. You must edit this document and more submission attributes can be added. More information: [Submission attributes](#submission-attributes)

## Submission attributes

Before you can submit items to a catalog, you must prepare a JSON document that describes the items you want to submit. More information: [Submit items to the catalog](#submit-items-to-the-catalog)

To help you, the [pac catalog create-submission](../cli/reference/catalog.md#pac-catalog-create-submission) command generates a sample `submission.json` file.

> [!NOTE]
> More attributes are supported in the submission file and those are covered in the subsequent section.

You need to edit this file to submit an item. Here's an example submission created from the JSON above.

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

## Submit items to the catalog


### [PAC CLI](#tab/cli)

After your submission metadata JSON document is ready, use the [pac catalog submit](../cli/reference/catalog.md#pac-catalog-submit) command to submit it.

TODO: Explain when and why someone would include a reference to the solution zip file.
hypothesis: If they include a reference to the solution zip file, they don't need to provide a package because the PAC CLI will generate one for them using the mspcat_PackageStore table.

```powershell
pac catalog submit -p "BuildDemoSubmission.json" -sz "ContosoConference_1_0_0_1_managed.zip"
Creating package for catalog submit request...
Connected to... TestCatalog
Connected as user@domain
Tracking id for this submission is 0e6b119d-80f3-ed11-8849-000d3a0a2d9d
```

[What is Microsoft Power Platform CLI?](../cli/introduction.md)

### [SDK for .NET](#tab/sdk)

TODO: Why doesn't the `mspcat_SubmitCatalogApprovalRequest` include parameters that correspond to the solution zip file?
Answer: Because it expects that the file referenced by a SAS URL?


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
The results returned are an instance of the `mspcat_SubmitCatalogApprovalRequestResponse` complex type, which contains

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

   return   $results

}
```


[Use the Microsoft Dataverse Web API](/power-apps/developer/data-platform/webapi/overview)

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

[Use the Dataverse SDK for .NET](/power-apps/developer/data-platform/org-service/overview)

### [Web API](#tab/webapi)

// Poll for status of certification request
GET /mspcat_certificationrequests(id)?$select=statuscode

[Use the Microsoft Dataverse Web API](/power-apps/developer/data-platform/webapi/overview)

---



## Approve catalog submissions

Catalog submissions are typically approved within the Power Platform Catalog Manager application.

### [PAC CLI](#tab/cli)

There is no PAC CLI command to perform this operation.

### [SDK for .NET](#tab/sdk)

This static `ResolveApproval` method demonstrates how to resolve request for a catalog submission.

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


This `ResolveApproval` Powershell function approves a catalog submission. This function depends on the `$baseURI` and `$baseHeaders` values set using the `Connect` function as describe in [Create a Connect function](/power-apps/developer/data-platform/webapi/use-ps-and-vscode-web-api#create-a-connect-function)


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
   ResolveApproval -certificationRequestId "GUID" -requestsuccess $true -message "Request processed successfully."

.NOTES
   The function does not return any value. Any output from the Invoke-RestMethod cmdlet is sent to Out-Null.
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