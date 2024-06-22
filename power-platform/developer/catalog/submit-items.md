---
title: "Work with the catalog in Power Platform using code"
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
# Work with the catalog in Power Platform using code (preview)

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

This article explains how to view, submit, and install catalog items programmatically.


## Get started

- [Get access to catalog as submitter or reader](#get-access-to-catalog-as-submitter-or-reader)
- [Choose how to interact](#choose-how-to-interact)

### Get access to catalog as submitter or reader

If you don't have the system administrator security role, contact your administrator to grant access to the catalog. You need the **Catalog Submitter** security role to be associated with your user account or a team that you belong to. More information: [Edit user access](../../admin/administer-catalog.md#edit-user-access)

### Choose how to interact

This article shows three different ways to perform operations with the catalog. Use the one that best suites your skills and the requirements of your project.

#### PAC CLI

After you have installed the Power Platform CLI, you must create an authentication profile using the [pac auth create](../cli/reference/auth.md#pac-auth-create) command. Using the authentication profile for the environment where the catalog is installed.

## Use the catalog

1. [View environments with catalogs in your tenant](#view-environments-with-catalogs-in-your-tenant)
1. [View catalog information](#view-catalog-information)
1. [Update catalog information](#update-catalog-information)
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
[Use the Dataverse SDK for .NET](/power-apps/developer/data-platform/org-service/overview)

### [Web API](#tab/webapi)

Use the `mspcat_GetPowerCatalogInformation` function to get information about the catalog in the environment.

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

[Use the Microsoft Dataverse Web API](/power-apps/developer/data-platform/webapi/overview)

---

## Update catalog information

You can update information about the catalog and catalog configuration using the Power Platform Catalog Manager. Select the **Settings** area. More information: [Set up the catalog](../../admin/administer-catalog.md#set-up-the-catalog).

### [PAC CLI](#tab/cli)

Use the [pac catalog update](../cli/reference/catalog.md#pac-catalog-update) command to update catalog information.

This command requires a `--path` parameter to a JSON file that looks like this:

```json
{
   "catalogEnabled": true,
   "enableGlobalAutoApproval": false,
   "catalogHelpLink": "http://www.yourcompany.com/support/",
   "allowUnmanagedSolutions": false,
   "catalogName": "Your company catalog name",
   "catalogDescription": "Catalog for Power Platform applications created by your company."
}
```

Use the command like this:

```powershell
PS C:\catalog> pac catalog update --path "C:\catalog\catalogSettings.json"
Connected as you@yourorg.onmicrosoft.com
Connected to... YourOrg
Catalog settings updated.
{
  "catalogDescriptionId": "368b5441-88d0-ec11-a7b5-0022481e6583",
  "catalogName": "Your company catalog name",
  "catalogDescription": "Catalog for Power Platform applications created by your company.",
  "catalogHelpLink": "http://www.yourcompany.com/support/",
  "catalogEnabled": true,
  "allowUnmanagedSolutions": false,
  "enableGlobalAutoApproval": false
}
```

[What is Microsoft Power Platform CLI?](../cli/introduction.md)

### [SDK for .NET](#tab/sdk)

This static `UpdateCatalog` method demonstrates how to update the `mspcat_CatalogDescription` table columns to specify behavior of the catalog.

```csharp
/// <summary>
/// Updates catalog information properties
/// </summary>
/// <param name="service">The authenticated IOrganizationService instance.</param>
/// <param name="catalogName">Display name of the catalog</param>
/// <param name="catalogDescription">Describes the purpose of this catalog</param>
/// <param name="catalogHelpLink">Link to help users with submission information</param>
/// <param name="catalogEnabled">   Enable or disable all operations for the Catalog</param>
/// <param name="allowUnmanagedSolutions">Allows unmanaged solutions in packages</param>
/// <param name="enableGlobalAutoApproval">When enabled, this will automatically 
/// approve all submissions into the system that reach the submitted stage without review. 
/// Warning When enabled there will be no opportunity to reject a submission.</param>
static void UpdateCatalog(
    IOrganizationService service,
    string? catalogName = null,
    string? catalogDescription = null,
    string? catalogHelpLink = null,
    bool? catalogEnabled = null,
    bool? allowUnmanagedSolutions = null,
    bool? enableGlobalAutoApproval = null
    )
{

    AttributeCollection attributes = new();

    if (catalogName != null)
    {
        attributes.Add("mspcat_catalogname", catalogName);
    }
    if (catalogDescription != null)
    {
        attributes.Add("mspcat_description", catalogDescription);
    }
    if (catalogHelpLink != null)
    {
        attributes.Add("mspcat_helplink", catalogHelpLink);
    }
    if (catalogEnabled != null)
    {
        attributes.Add("mspcat_catalogenabled", catalogEnabled);
    }
    if (allowUnmanagedSolutions != null)
    {
        attributes.Add("mspcat_allowunmanagedsolutions", allowUnmanagedSolutions);
    }
    if (enableGlobalAutoApproval != null)
    {
        attributes.Add("mspcat_enableglobalautoapproval", enableGlobalAutoApproval);
    }

    // Do nothing if nothing changed.
    if (attributes.Count > 0)
    {

        //Get the first catalog record
        QueryExpression query = new("mspcat_catalogdescription")
        {
            ColumnSet = new ColumnSet("mspcat_catalogdescriptionid"),
            TopCount = 1
        };

        EntityCollection catalogs = service.RetrieveMultiple(query);
        if (catalogs.Entities.Count == 0)
        {
            throw new Exception("No catalog record to update");
        }
        Guid firstCatalogId = catalogs.Entities[0].Id;

        Entity catalogConfiguration = new("mspcat_catalogdescription", firstCatalogId)
        {
            Attributes = attributes
        };

        service.Update(catalogConfiguration);
    }
    else
    {
        // Do nothing
    }
}
```

[Use the Dataverse SDK for .NET](/power-apps/developer/data-platform/org-service/overview)

### [Web API](#tab/webapi)

This `Update-Catalog` PowerShell function demonstrates how to update the `mspcat_CatalogDescription` table columns to specify behavior of the catalog.
This function depends on the `Get-Records` and `Update-Record` PowerShell functions described in [Use PowerShell and Visual Studio Code with the Dataverse Web API](/power-apps/developer/data-platform/webapi/use-ps-and-vscode-web-api).


```powershell

<#
.SYNOPSIS
   Updates a catalog record with the provided parameters.

.DESCRIPTION
   The `Update-Catalog` function updates a catalog record with the provided parameters. 
   If a parameter is not provided or is `$null`, it will not be included in the update.

.PARAMETER catalogName
   Display name of the catalog

.PARAMETER catalogDescription
   Describes the purpose of this catalog

.PARAMETER catalogHelpLink
   Link to help users with submission information

.PARAMETER catalogEnabled
   Enable or disable all operations for the catalog

.PARAMETER allowUnmanagedSolutions
   Allows unmanaged solutions in packages

.PARAMETER enableGlobalAutoApproval
   When enabled, this will automatically approve all submissions into the system that reach the submitted stage without review. 
   Warning When enabled there will be no opportunity to reject a submission.

.EXAMPLE
   # Example 1: Update a catalog with a new name and description
   Update-Catalog -catalogName "New Catalog Name" -catalogDescription "New Catalog Description"

.EXAMPLE
   # Example 2: Enable a catalog and allow unmanaged solutions
   Update-Catalog -catalogEnabled $true -allowUnmanagedSolutions $true

.NOTES
   This function throws an exception if there are no catalog records to update.
#>
function Update-Catalog {
   param (
      [string]
      $catalogName,
      [string]
      $catalogDescription,
      [string]
      $catalogHelpLink,
      [Nullable[bool]]
      $catalogEnabled,
      [Nullable[bool]]
      $allowUnmanagedSolutions,
      [Nullable[bool]]
      $enableGlobalAutoApproval
   )

   $body = @{}
   
   if ($catalogName) {
      $body.Add('mspcat_catalogname', $catalogName)
   }
   if ($catalogDescription) {
      $body.Add('mspcat_description', $catalogDescription)
   }
   if ($catalogHelpLink) {
      $body.Add('mspcat_helplink', $catalogHelpLink)
   }
   if ($null -ne $catalogEnabled) {
      $body.Add('mspcat_catalogenabled', $catalogEnabled)
   }
   if ($null -ne $allowUnmanagedSolutions) {
      $body.Add('mspcat_allowunmanagedsolutions', $allowUnmanagedSolutions)
   }
   if ($null -ne $enableGlobalAutoApproval) {
      $body.Add('mspcat_enableglobalautoapproval', $enableGlobalAutoApproval)
   }

   if ($body.Count -gt 0) {
      # Get the first catalog record
      $query = "?`$select=mspcat_catalogdescriptionid&`$top=1"
      $catalogs = (Get-Records -setName 'mspcat_catalogdescriptions' -query $query).value
      if ($catalogs.Count -eq 0) {
         throw "No catalog records to update"
      }
      $firstCatalogId = $catalogs[0].mspcat_catalogdescriptionid

      Update-Record `
         -setName 'mspcat_catalogdescriptions' `
         -id $firstCatalogId `
         -body $body
   }
   else {
      # Do nothing
   }
}
```

[Use the Microsoft Dataverse Web API](/power-apps/developer/data-platform/webapi/overview)

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

[What is Microsoft Power Platform CLI?](../cli/introduction.md)

### [SDK for .NET](#tab/sdk)

The static `RetrieveCatalogItems` method retrieves and prints a table of data from the `mspcat_applications` and `mspcat_packages` tables about items in the catalog. This function depends on the [ConsoleTables NuGet package](https://www.nuget.org/packages/ConsoleTables) to render the table in a console application.

```csharp
/// <summary>
/// Retrieves information about catalog items and writes it to the console
/// </summary>
/// <param name="service">The authenticated IOrganizationService instance.</param>
static void RetrieveCatalogItems(IOrganizationService service)
{
    QueryExpression query = new("mspcat_applications")
    {
        ColumnSet = new ColumnSet(
             "mspcat_tpsid",
             "mspcat_deploytype",
             "mspcat_applicationtype",
             "mspcat_businesscategory",
             "mspcat_description",
             "mspcat_applicationsid",
             "mspcat_publisherid",
             "mspcat_name",
             "statuscode"),
        Criteria = new FilterExpression(LogicalOperator.And)
        {
            Conditions = {
                 { new ConditionExpression("statecode", ConditionOperator.Equal, 0) }
            }
        }
    };

    LinkEntity linkToPackages = query.AddLink(
        "mspcat_packages",
        "mspcat_packageasset",
        "mspcat_packagesid",
        JoinOperator.Inner);

    linkToPackages.Columns = new ColumnSet(
        "statecode",
        "mspcat_uniquename",
        "mspcat_version",
        "statuscode");

    linkToPackages.EntityAlias = "pkg";

    EntityCollection catalogs = service.RetrieveMultiple(query);

    var table = new ConsoleTables.ConsoleTable(
        "Catalog Item Name",
        "Publisher Name",
        "Catalog Item ID",
        "Revision ID",
        "Version",
        "Status");

    foreach (Entity catalog in catalogs.Entities)
    {

        string catalogItemName = catalog.GetAttributeValue<string>("mspcat_name");
        string publisherName = catalog.FormattedValues["mspcat_publisherid"];
        string catalogItemId = catalog.GetAttributeValue<string>("mspcat_tpsid");
        Guid revisionId = catalog.GetAttributeValue<Guid>("mspcat_applicationsid");
        string version = (string)catalog.GetAttributeValue<AliasedValue>("pkg.mspcat_version").Value;
        string status = catalog.FormattedValues["statuscode"];

        string[] rowData = {
            catalogItemName,
            publisherName,
            catalogItemId,
            revisionId.ToString(),
            version,
            status
        };

        table.Rows.Add(rowData);

    }

    table.Write();
}
```

The output of this example might look something like this:

```text
 -----------------------------------------------------------------------------------------------------------------------------------------------------------------
 | Catalog Item Name                  | Publisher Name          | Catalog Item ID                   | Revision ID                          | Version | Status    |
 -----------------------------------------------------------------------------------------------------------------------------------------------------------------
 | Contoso Conference Custom Connector| Catalog Conferences Team| ContosoConferencesCustomConnector | 4e882dd6-74f3-ed11-8849-000d3a0a286b | 1.0.0.1 | Published |
 -----------------------------------------------------------------------------------------------------------------------------------------------------------------
 | Contoso Themed Components          | ContosoPublisher        | ContosoThemedComponents           | efbc469d-f1b2-ed11-83fd-000d3a0a2d9d | 1.0.0.1 | Published |
 -----------------------------------------------------------------------------------------------------------------------------------------------------------------
```

[Use the Dataverse SDK for .NET](/power-apps/developer/data-platform/org-service/overview)   
[Query data using QueryExpression](/power-apps/developer/data-platform/org-service/queryexpression/overview)


### [Web API](#tab/webapi)

The static `RetrieveCatalogItems` method retrieves and prints a table of data from the `mspcat_applications` and `mspcat_packages` tables about items in the catalog. This function depends on the `Get-Records` function introduced in [Use PowerShell and Visual Studio Code with the Dataverse Web API](/power-apps/developer/data-platform/webapi/use-ps-and-vscode-web-api)

```powershell
function Get-CatalogItems{

   $columns = @(
      "mspcat_tpsid",
      "mspcat_deploytype",
      "mspcat_applicationtype",
      "mspcat_businesscategory",
      "mspcat_description",
      "mspcat_applicationsid",
      "_mspcat_publisherid_value",
      "mspcat_name",
      "statuscode"
   )
   $select = "?`$select=" + ($columns -join ',')

   $filter = "&`$filter=statecode eq 0 and _mspcat_packageasset_value ne null"

   $expandColumns = @(
      "statecode",
      "mspcat_uniquename",
      "mspcat_version",
      "statuscode"
   )

   $expand = "&`$expand=mspcat_PackageAsset"
   $expand += "(`$select=" + ($expandColumns -join ',')+ ")"

   (Get-Records `
      -setName 'mspcat_applicationses' `
      -query ($select + $filter + $expand)).value 
      | Format-Table @{Name='Catalog Item Name' ; Expression={$_.mspcat_name}}, `
         @{Name='Publisher Name' ; Expression={$_.'_mspcat_publisherid_value@OData.Community.Display.V1.FormattedValue'}}, `
         @{Name='Catalog Item ID' ; Expression={$_.mspcat_tpsid}}, `
         @{Name='Revision ID' ; Expression={$_.mspcat_applicationsid }}, `
         @{Name='Version' ; Expression={$_.mspcat_PackageAsset.mspcat_version}}, `
         @{Name='Status' ; Expression={$_.mspcat_PackageAsset.'statuscode@OData.Community.Display.V1.FormattedValue'}}
}
```

This is the query composed:

```http
GET [Organization URI]/api/data/v9.2/mspcat_applicationses?$select=mspcat_tpsid,mspcat_deploytype,mspcat_applicationtype,mspcat_businesscategory,mspcat_description,mspcat_applicationsid,_mspcat_publisherid_value,mspcat_name,statuscode&$filter=statecode%20eq%200%20and%20_mspcat_packageasset_value%20ne%20null&$expand=mspcat_PackageAsset($select=statecode,mspcat_uniquename,mspcat_version,statuscode) HTTP/1.1
OData-MaxVersion: 4.0
Authorization: Bearer [REDACTED]
Prefer: odata.include-annotations="*"
OData-Version: 4.0
Accept: application/json
User-Agent: Mozilla/5.0 (Windows NT 10.0; Microsoft Windows 10.0.22631; en-US) PowerShell/7.4.2
Accept-Encoding: gzip, deflate, br
```

The output of this example might look something like this:

```text
Catalog Item Name                   Publisher Name           Catalog Item ID                   Revision ID                          Version Status
----------------------------------- ------------------------ --------------------------------- -----------------------------------  ------- ---------
Contoso Conference Custom Connector Catalog Conferences Team ContosoConferencesCustomConnector 4e882dd6-74f3-ed11-8849-000d3a0a286b 1.0.0.1 Published
Contoso Themed Components           ContosoPublisher         ContosoThemedComponents           efbc469d-f1b2-ed11-83fd-000d3a0a2d9d 1.0.0.1 Published
```


[Use the Microsoft Dataverse Web API](/power-apps/developer/data-platform/webapi/overview)

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

[What is Microsoft Power Platform CLI?](../cli/introduction.md)

### [SDK for .NET](#tab/sdk)

[Use the Dataverse SDK for .NET](/power-apps/developer/data-platform/org-service/overview)

### [Web API](#tab/webapi)

[Use the Microsoft Dataverse Web API](/power-apps/developer/data-platform/webapi/overview)

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

[What is Microsoft Power Platform CLI?](../cli/introduction.md)

### [SDK for .NET](#tab/sdk)

[Use the Dataverse SDK for .NET](/power-apps/developer/data-platform/org-service/overview)

### [Web API](#tab/webapi)

// Send base64 encoded submission document as `EncodedApprovalRequest`
POST //mspcat_SubmitCatalogApprovalRequest
Returns AsyncOperationId and CertificationRequestId

[Use the Microsoft Dataverse Web API](/power-apps/developer/data-platform/webapi/overview)

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

[What is Microsoft Power Platform CLI?](../cli/introduction.md)

### [SDK for .NET](#tab/sdk)

[Use the Dataverse SDK for .NET](/power-apps/developer/data-platform/org-service/overview)

### [Web API](#tab/webapi)

// Poll for status of certification request
GET /mspcat_certificationrequests(id)?$select=statuscode

[Use the Microsoft Dataverse Web API](/power-apps/developer/data-platform/webapi/overview)

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
