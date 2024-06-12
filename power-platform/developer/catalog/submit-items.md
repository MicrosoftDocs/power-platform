---
title: "Using the catalog with Power Platform CLI"
description: "Learn how to submit items to your organization's catalog of templates and components."
author: derekkwanpm
ms.author: derekkwan
ms.subservice: developer
ms.date: 05/24/2024
ms.reviewer: jdaly
ms.topic: article
search.audienceType: 
  - developer
contributors:
 - JimDaly
---
# Using the catalog with Power Platform CLI (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

> [!IMPORTANT]
>
> - This is a preview feature.
> - [!INCLUDE [cc-preview-features-definition](../../includes/cc-preview-features-definition.md)]
> - While not required for preview, when this feature is generally available, it'll require the use of Managed Environment capabilities. More information: [Managed Environments overview](../../admin/managed-environment-overview.md)

The catalog in Power Platform enables developers and makers to:

- Crowd-source and find templates and components within their environment easily.
- Find and install the latest and authoritative version of a component.
- Get started with templates and components that provide immediate value.

Before you can work with catalog items, you must install and configure it. More information: [Administer the catalog (preview)](../../admin/administer-catalog.md)

Application makers and developers can submit items to the catalog so that they can help their colleagues solve business problems. This can be done using the manager app. More information: [View, submit, and install catalog items (preview)](/power-apps/maker/data-platform/submit-acquire-from-catalog)

This article explains how to view, submit and install catalog items programmatically.


## Get started

1. [Install Power Platform CLI](#install-power-platform-cli)
1. [Get access to catalog as submitter or reader](#get-access-to-catalog-as-submitter-or-reader)

### Install Power Platform CLI

Follow the steps to install Power Platform CLI: [Install Microsoft Power Platform CLI](../cli/introduction.md#install-microsoft-power-platform-cli)

<!-- Use the [pac catalog](cli/reference/catalog.md) commands to interact with the catalog.-->

### Get access to catalog as submitter or reader

Contact your administrator to grant access to the catalog. You need the **Catalog Submitter** security role to be associated with your user account or a team that you belong to. More information: [Edit user access](../../admin/administer-catalog.md#edit-user-access)

## Use the catalog

After you have installed the Power Platform CLI, you must create an authentication profile using the [pac auth create](../cli/reference/auth.md#pac-auth-create) command. Using the authentication profile for the environment where the catalog is installed, you can perform the following tasks using PAC CLI:

1. [View environments with catalogs in your tenant](#view-environments-with-catalogs-in-your-tenant)
1. [View catalog information](#view-catalog-information)
1. [View items in the catalog](#view-items-in-the-catalog)
1. [Install items from the catalog](#install-items-from-the-catalog)
1. [Submit items to the catalog](#submit-items-to-the-catalog)
1. [Check status of catalog submissions](#check-status-of-catalog-submissions)

## View environments with catalogs in your tenant

Use the [pac admin list](../cli/reference/admin.md#pac-admin-list) command to view the environments with catalogs in your tenant.

> [!NOTE]
> This command requires an administrator authentication profile.

When using this command, you must use the following `--application` parameter with the value `83a35943-cb41-4266-b7d2-81d60f383695`. This value is the application ID associated with the catalog.

```powershell
PS C:\Users\you> pac admin list --application 83a35943-cb41-4266-b7d2-81d60f383695
Connected as you@yourorg.onmicrosoft.com

Listing all environments from your tenant...
Active Environment Environment ID                       Environment Url                   Type       Organization ID
*      Your Org    b16bdb7a-e023-4158-a839-4f8831ed2432 https://yourorg.crm.dynamics.com/ Production e20be4c1-02ce-4e81-93c6-6e95ff053943
```

## View catalog information

### [PAC CLI](#tab/cli)

There is no PAC CLI command to return this information.

### [SDK for .NET](#tab/sdk)

The following `GetPowerCatalogInformationExample` static method retrieves data using the `mspcat_GetPowerCatalogInformationRequest` and `mspcat_GetPowerCatalogInformationResponse` classes generated for the `mspcat_GetPowerCatalogInformation` message by the [pac modelbuilder build](../cli/reference/modelbuilder.md#pac-modelbuilder-build) command.

```csharp
/// <summary>
/// Returns data about the catalog for an environment
/// </summary>
/// <param name="service">The authenticated IOrganizationService instance.</param>
static void GetPowerCatalogInformationExample(IOrganizationService service) {

   var request = new mspcat_GetPowerCatalogInformationRequest();
   var response = (mspcat_GetPowerCatalogInformationResponse)service.Execute(request);

   Console.WriteLine($"SolutionVersion: {response.SolutionVersion}");
   Console.WriteLine($"CatalogDescription: {response.CatalogDescription}");
   Console.WriteLine($"CanRead: {response.CanRead}");
   Console.WriteLine($"CatalogName: {response.CatalogName}");
   Console.WriteLine($"ImageLink: {response.ImageLink}");
   Console.WriteLine($"CanSubmit: {response.CanSubmit}");

}
```

**Output**

```
SolutionVersion: 1.1.24.500
CatalogDescription: Catalog for Power Platform applications created by your company.
CanRead: True
CatalogName: Default Catalog Name
ImageLink:
CanSubmit: True
```

[Generate early-bound classes for the SDK for .NET](/power-apps/developer/data-platform/org-service/generate-early-bound-classes)


### [Web API](#tab/webapi)

Use the `mspcat_GetPowerCatalogInformation` function to get information about the catalog in the environment.
<!-- TODO add link to reference when generated next time -->

**Request**

```http
GET [Organization URI]/api/data/v9.2/mspcat_GetPowerCatalogInformation HTTP/1.1
Accept: application/json
Authorization: Bearer [REDACTED]
OData-MaxVersion: 4.0
OData-Version: 4.0
```

**Response**

```http
HTTP/1.1 200 OK
Content-Type: application/json; odata.metadata=minimal
OData-Version: 4.0

{
   "@odata.context": "[Organization URI]/api/data/v9.2/$metadata#Microsoft.Dynamics.CRM.mspcat_GetPowerCatalogInformationResponse",
   "SolutionVersion": "1.1.24.500",
   "CatalogDescription": "Catalog for Power Platform applications created by your company.",
   "CanRead": true,
   "CatalogName": "Default Catalog Name",
   "ImageLink": null,
   "CanSubmit": true
}
```

---


## View items in the catalog

### [PAC CLI](#tab/cli)

Use the [pac catalog list](../cli/reference/catalog.md#pac-catalog-list) command to view items in the catalog.

```powershell
pac catalog list 
Connected to... TestCatalog
Connected as user@domain
Listing all published catalog items from the current Dataverse Organization...
Catalog Item Name                   Publisher Name            Catalog Item Id                      Revision Id                          Version Status
Contoso Conference Custom Connector Catalog Conferences Team  ContosoConferencesCustomConnector    4e882dd6-74f3-ed11-8849-000d3a0a286b 1.0.0.1 Published
Contoso Themed Components           ContosoPublisher          ContosoThemedComponents              efbc469d-f1b2-ed11-83fd-000d3a0a2d9d 1.0.0.1 Published
```

### [SDK for .NET](#tab/sdk)

TODO

### [Web API](#tab/webapi)

// Get Submission details from the catalog.
GET /mspcat_GetPowerCatalogDetails


---




## Install items from the catalog

### [PAC CLI](#tab/cli)

Use the [pac catalog install](../cli/reference/catalog.md#pac-catalog-install) command to install items from the catalog.

```powershell
pac catalog install -tu https://<your org>.crm.dynamics.com/ -cid ContosoConferencesCustomConnector
Connected to... TestCatalog
Connected as user@domain
ContosoConferencesCustomConnector
Tracking id for this installation is 202012ec-80f3-ed11-8849-000d3a0a2d9d
```

### [SDK for .NET](#tab/sdk)

TODO

### [Web API](#tab/webapi)

TODO

---

## Submit items to the catalog

To submit an item to the catalog, you need:

- A solution or package deployer package containing the item you want to submit
- A submission metadata JSON document

### [PAC CLI](#tab/cli)

Use the [pac catalog create-submission](../cli/reference/catalog.md#pac-catalog-create-submission) command to get an example submission metadata JSON document. You must edit this document and more submission attributes can be added. More information: [Submission attributes](#submission-attributes)

After your submission metadata JSON document is ready, use the [pac catalog submit](../cli/reference/catalog.md#pac-catalog-submit) command to submit it.

```powershell
pac catalog submit -p "BuildDemoSubmission.json" -sz "ContosoConference_1_0_0_1_managed.zip"
Creating package for catalog submit request...
Connected to... TestCatalog
Connected as user@domain
Tracking id for this submission is 0e6b119d-80f3-ed11-8849-000d3a0a2d9d
```

### [SDK for .NET](#tab/sdk)

TODO

### [Web API](#tab/webapi)

// Send base64 encoded submission document as `EncodedApprovalRequest`
POST //mspcat_SubmitCatalogApprovalRequest
Returns AsyncOperationId and CertificationRequestId

---

## Check status of catalog submissions

The `statuscode` options of the `mspcat_certificationrequest` table. Completed (2) represents a successful submission.

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

### [SDK for .NET](#tab/sdk)

TODO

### [Web API](#tab/webapi)

// Poll for status of certification request
GET /mspcat_certificationrequests(id)?$select=statuscode


---

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
        "email": "ahunt@mouse.com",
        "phoneNumber": "555-111-1234"
      }
    }
  }
}
```

## Next steps

Review the [Catalog item submission document reference](submission-reference.md)

> [!div class="nextstepaction"]
> [Compose submission document](submission-reference.md)

### See also

[Catalog in Power Platform (preview)](/power-apps/maker/data-platform/catalog-overview)   
[View, submit, and install catalog items (preview)](/power-apps/maker/data-platform/submit-acquire-from-catalog)   
[Administer the catalog (preview)](../../admin/administer-catalog.md)
