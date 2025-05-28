---
title: "Retrieve data about the catalog in Power Platform"
description: "Learn about APIs to use to retrieve data about the catalog in Power Platform using code."
author: isaacwinoto
ms.author: isaacwinoto
ms.subservice: developer
ms.date: 11/05/2024
ms.reviewer: jdaly
ms.topic: how-to
search.audienceType: 
  - developer
contributors:
 - JimDaly
 - singhguru2001us
---
# Retrieve data about the catalog in Power Platform

To retrieve data about the catalogs for your tenant, you need to determine which environments have catalogs installed. Then you can retrieve data from that environment about the catalog by querying the tables or API designed to provide this information.

Most tenants only install one catalog, but it's possible to install a catalog on multiple environments in the tenant.

## Find environments with catalogs in your tenant

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

## Catalog tables

When you [install the Power Platform Catalog manager application](../../admin/administer-catalog.md#set-up-the-catalog) in an environment in your tenant, the tables listed in the [Catalog in Power Platform  table/entity reference](about-entity-reference.md) are added to that environment only.

Some of the most important tables you might use are in the following table:

|Table |Description|
|---------|---------|
|[Approval Request (mspcat_certificationrequest)](tables/mspcat_certificationrequest.md)|Contains Approval records that are used to process new or updated submissions to the catalog system.|
|[Catalog Publisher (mspcat_publisher)](tables/mspcat_publisher.md)|The publisher Entity for holding TPS Publisher data.|
|[Catalog Item (mspcat_applications)](tables/mspcat_applications.md)|Entry that appears in the Catalog|
|[Package (mspcat_packages)](tables/mspcat_packages.md)|Deployment Assets for a Catalog Item.|
|[Install History (mspcat_InstallHistory)](tables/mspcat_installhistory.md)|Contains record of installations and their status|
|[Install Activity (mspcat_InstallActivity)](tables/mspcat_installactivity.md)|Install History Activity IDs|


## View catalog information

There are two Dataverse messages you can use to get information about the catalog.

- `mspcat_GetPowerCatalogInformation` This message is intended to be fast and provide the minimal permissions and descriptive data for the catalog.
- `mspcat_GetPowerCatalogDetails` Use the contents of this message to populate the submission document and set the labels for what a Catalog Item and a Publisher should be called for this catalog.

### mspcat_GetPowerCatalogInformation

The `mspcat_GetPowerCatalogInformation` message has a single `permissionsonly` boolean parameter and returns the following information defined by the `mspcat_GetPowerCatalogInformationResponse` complex type:


|Name|Type|Description|
|---------|---------|---------|
|`SolutionVersion`|string|Version of the catalog solution installed|
|`CatalogDescription`|string|Describes what this catalog is for|
|`CanRead`|bool|Can the user read the items in the catalog|
|`CatalogName`|string|Name of the catalog installed on this environment|
|`ImageLink`|string|If set, is the image for the catalog|
|`CanSubmit`|bool|Can the user submit items to the catalog|

If the `permissionsonly` boolean parameter is true, the `CatalogDescription`, `CatalogName`, and `ImageLink` values aren't returned. `SolutionVersion`, `CanRead`, and `CanSubmit` values are always returned.


#### [SDK for .NET](#tab/sdk)

The following `GetPowerCatalogInformationExample` static method retrieves data using the `mspcat_GetPowerCatalogInformationRequest` and `mspcat_GetPowerCatalogInformationResponse` classes generated for the `mspcat_GetPowerCatalogInformation` message by the [pac modelbuilder build](../cli/reference/modelbuilder.md#pac-modelbuilder-build) command.

```csharp
/// <summary>
/// Returns data about the catalog for an environment
/// </summary>
/// <param name="service">The authenticated IOrganizationService instance.</param>
/// <param name="permissionsonly">Whether to only return information about permissions.</param>
static void GetPowerCatalogInformationExample(IOrganizationService service, bool permissionsonly = false)
{
   var request = new mspcat_GetPowerCatalogInformationRequest();
   if (permissionsonly) {
         request.permissionsonly = true;
   }
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

With `permissionsonly` equal false.

```
SolutionVersion: 1.1.24.500
CatalogDescription: Catalog in Power Platform applications created by your company.
CanRead: True
CatalogName: Default Catalog Name
ImageLink:
CanSubmit: True
```

[Generate early-bound classes for the SDK for .NET](/power-apps/developer/data-platform/org-service/generate-early-bound-classes)   
[Use the Dataverse SDK for .NET](/power-apps/developer/data-platform/org-service/overview)

#### [Web API](#tab/webapi)

The following `GetPowerCatalogInformationExample` PowerShell function invokes the `mspcat_GetPowerCatalogInformation` function and processes the results that are represented the `mspcat_GetPowerCatalogInformationResponse` complex type. This function depends on the `$baseURI` and `$baseHeaders` values set using the `Connect` function as described in [Create a Connect function](/power-apps/developer/data-platform/webapi/use-ps-and-vscode-web-api#create-a-connect-function)

```powershell
function GetPowerCatalogInformationExample {
   param (
      [bool]
      $permissionsonly
   )

   $uri = $baseURI + 'mspcat_GetPowerCatalogInformation'
   if ($permissionsonly) {
      $uri += '(?permissionsonly=true)'
   }
   $results = Invoke-RestMethod `
      -Method Get `
      -Uri $uri `
      -Headers $baseHeaders 

   return  @{
      SolutionVersion     = $results.SolutionVersion
      CatalogDescription  = $results.CatalogDescription
      CanRead             = $results.CanRead
      CatalogName         = $results.CatalogName
      ImageLink           = $results.ImageLink
      CanSubmit           = $results.CanSubmit
   }
}
```

[Use the Microsoft Dataverse Web API](/power-apps/developer/data-platform/webapi/overview)   
[Use Web API functions](/power-apps/developer/data-platform/webapi/use-web-api-functions)   
[Use PowerShell and Visual Studio Code with the Dataverse Web API](/power-apps/developer/data-platform/webapi/use-ps-and-vscode-web-api)

---

### mspcat_GetPowerCatalogDetails

Use the information returned by `mspcat_GetPowerCatalogDetails` to populate the submission document and set the labels for what a catalog item and a publisher should be called for this catalog.

This function returns an object with a single `CatalogDetails` string property that contains an encoded string. When decoded, the string contains JSON data with the following properties:

|Name|Type|Description|
|---------|---------|---------|
|`catalogId`|string|The unique ID of the catalog|
|`isSuccess`|string|For internal use only.|
|`sourceOptions`|option array|The options from the `mspcat_certificationrequest_requestsource` global choice.|
|`categoryOptions`|option array|The options from the `mspcat_catalogbusinesscategory` global choice.|
|`publisherLocalizedDisplayName`|string|The localized name of the catalog publisher.|
|`catalogItemLocalizedDisplayName`|string|The localized name used to refer to catalog items.|


#### [SDK for .NET](#tab/sdk)

The following `GetPowerCatalogDetailsExample` static method retrieves data using the `mspcat_GetPowerCatalogDetailsRequest` and `mspcat_GetPowerCatalogDetailsResponse` classes generated for the `mspcat_GetPowerCatalogDetails` message by the [pac modelbuilder build](../cli/reference/modelbuilder.md#pac-modelbuilder-build) command.

```csharp
/// <summary>
/// Outputs details of the catalog in Power Platform.
/// </summary>
/// <param name="service">The authenticated IOrganizationService instance.</param>
static void GetPowerCatalogDetailsExample(IOrganizationService service) {

    var request = new mspcat_GetPowerCatalogDetailsRequest();
    var response = (mspcat_GetPowerCatalogDetailsResponse)service.Execute(request);

   JsonDocument catalogDetails = JsonDocument.Parse(response.CatalogDetails);

    string catalogId = catalogDetails.RootElement.GetProperty("catalogId").GetString();
    bool isSuccess = catalogDetails.RootElement.GetProperty("isSuccess").GetBoolean();
    JsonElement sourceOptions = catalogDetails.RootElement.GetProperty("sourceOptions");
    JsonElement categoryOptions = catalogDetails.RootElement.GetProperty("categoryOptions");
    string publisherLocalizedDisplayName = catalogDetails.RootElement.GetProperty("publisherLocalizedDisplayName").GetString();
    string catalogItemLocalizedDisplayName = catalogDetails.RootElement.GetProperty("catalogItemLocalizedDisplayName").GetString();


    Console.WriteLine($"catalogId: {catalogId}");
    Console.WriteLine($"isSuccess: {isSuccess}");
    Console.WriteLine("sourceOptions:");
    foreach (JsonElement element in sourceOptions.EnumerateArray())
    {
        int id = element.GetProperty("id").GetInt32();
        string label = element.GetProperty("userLocalziedLabel").GetString();
        Console.WriteLine($"  {id} {label}");
    }
    Console.WriteLine("categoryOptions:");
    foreach (JsonElement element in categoryOptions.EnumerateArray())
    {
        int id = element.GetProperty("id").GetInt32();
        string label = element.GetProperty("userLocalziedLabel").GetString();
        Console.WriteLine($"  {id} {label}");
    }
    Console.WriteLine($"publisherLocalizedDisplayName: {publisherLocalizedDisplayName}");
    Console.WriteLine($"catalogItemLocalizedDisplayName: {catalogItemLocalizedDisplayName}");
}
```

**Output**

The static `GetPowerCatalogDetailsExample` method writes something like this to the console:

```dotnetcli
catalogId: 883278f5-07af-45eb-a0bc-3fea67caa544
isSuccess: True
sourceOptions:
  526430000 Other
  526430001 Power Automate Maker Portal
  526430002 Power Platform Maker Portal
  526430003 Power Virtual Agents Maker Portal
  526430004 Power Platform Admin API
  526430005 PAC CLI
  526430006 PAC Build Task
  526430007 Pipelines in Power Platform
categoryOptions:
  526430000 Customer Service
  526430001 Project Management
  526430002 Calendar Management & Scheduling
  526430003 Email Management
  526430004 Files & Documentation
  526430005 Notification & Reminders
  526430006 Analytics
  526430007 Collaboration
  526430008 Commerce
  526430009 Finance
  526430010 Compliance & Legal
  526430011 Sales
  526430012 IT Tools
  526430013 Marketing
  526430014 Operations & Supply Chain
  526430015 Internet of Things
  526430016 AI Machine Learning
  526430017 Geolocation
  526430018 Human Resources
publisherLocalizedDisplayName: Catalog Publisher
catalogItemLocalizedDisplayName: Catalog Item
```

[Generate early-bound classes for the SDK for .NET](/power-apps/developer/data-platform/org-service/generate-early-bound-classes)   
[Use the Dataverse SDK for .NET](/power-apps/developer/data-platform/org-service/overview)

#### [Web API](#tab/webapi)

Use this `GetPowerCatalogDetails` PowerShell function to use the `mspcat_GetPowerCatalogDetails` function. This function depends on the `$baseURI` and `$baseHeaders` values set using the `Connect` function as described in [Create a Connect function](/power-apps/developer/data-platform/webapi/use-ps-and-vscode-web-api#create-a-connect-function)

```powershell
function GetPowerCatalogDetails {
   $results = Invoke-RestMethod `
      -Method Get `
      -Uri $baseURI"mspcat_GetPowerCatalogDetails" `
      -Headers $baseHeaders

   $catalogDetails =  $results.CatalogDetails 
   | ConvertFrom-Json

   Write-Host "catalogId: $($catalogDetails.catalogId)"
   Write-Host "isSuccess: $($catalogDetails.isSuccess)"
   Write-Host "sourceOptions:"
   foreach($option in $catalogDetails.sourceOptions) {
      Write-Host ('   {0} {1}' -f $option.id, $option.userLocalziedLabel)
   }
   Write-Host "categoryOptions:"
   foreach($option in $catalogDetails.categoryOptions) {
      Write-Host ('   {0} {1}' -f $option.id, $option.userLocalziedLabel)
   }
   Write-Host "publisherLocalizedDisplayName: $($catalogDetails.publisherLocalizedDisplayName)"
   Write-Host "catalogItemLocalizedDisplayName: $($catalogDetails.catalogItemLocalizedDisplayName)"
}
```

The output of this function looks something like this:

```dotnetcli
catalogId: 883278f5-07af-45eb-a0bc-3fea67caa544
isSuccess: True
sourceOptions:
   526430000 Other
   526430001 Power Automate Maker Portal
   526430002 Power Platform Maker Portal
   526430003 Power Virtual Agents Maker Portal
   526430004 Power Platform Admin API
   526430005 PAC CLI
   526430006 PAC Build Task
   526430007 Pipelines in Power Platform
categoryOptions:
   526430000 Customer Service
   526430001 Project Management
   526430002 Calendar Management & Scheduling
   526430003 Email Management
   526430004 Files & Documentation
   526430005 Notification & Reminders
   526430006 Analytics
   526430007 Collaboration
   526430008 Commerce
   526430009 Finance
   526430010 Compliance & Legal
   526430011 Sales
   526430012 IT Tools
   526430013 Marketing
   526430014 Operations & Supply Chain
   526430015 Internet of Things
   526430016 AI Machine Learning
   526430017 Geolocation
   526430018 Human Resources
publisherLocalizedDisplayName: Catalog Publisher
catalogItemLocalizedDisplayName: Catalog Item
```

[Use the Microsoft Dataverse Web API](/power-apps/developer/data-platform/webapi/overview)   
[Use Web API functions](/power-apps/developer/data-platform/webapi/use-web-api-functions)   
[Use PowerShell and Visual Studio Code with the Dataverse Web API](/power-apps/developer/data-platform/webapi/use-ps-and-vscode-web-api)

---

## View items in the catalog

You can discover items in the catalog using PAC CLI or by querying the [Catalog Item (mspcat_applications)](tables/mspcat_applications.md) table.

### Using PAC CLI

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


You can also use these parameters to filter returned records:

|parameter|alias&nbsp;&nbsp;|description
|---------|---------|---------|
|`--catalog-item-id`|`-cid`|Catalog item ID to search for. When catalog item ID is used, any `--catalog-item-name` parameter values are ignored.|
|`--catalog-item-name`|`-n`|Catalog item name to search for.|
|`--include-active`|`-ia`|Include active items.|

Use the `--json` parameter to return JSON data.

Use the `--environment` (`-env`) parameter to query a catalog in a different environment.

### Query Dataverse tables

Information about catalog items is in the [Catalog Item (mspcat_applications)](tables/mspcat_applications.md) table, so you can retrieve data from it as you would any Dataverse table.

#### [SDK for .NET](#tab/sdk)

The following static `RetrieveCatalogItems` method retrieves and prints a table of data from the [Catalog Item (mspcat_applications)](tables/mspcat_applications.md) and [Package (mspcat_packages)](tables/mspcat_packages.md) tables about items in the catalog. This function depends on the [ConsoleTables NuGet package](https://www.nuget.org/packages/ConsoleTables) to render the table in a console application.

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
                {
                    new ConditionExpression(
                        attributeName: "statecode",
                        conditionOperator: ConditionOperator.Equal,
                        value: 0)
                }
            }
        }
    };

    LinkEntity linkToPackages = query.AddLink(
       linkToEntityName: "mspcat_packages",
       linkFromAttributeName: "mspcat_packageasset",
       linkToAttributeName: "mspcat_packagesid",
       joinOperator: JoinOperator.Inner);

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


#### [Web API](#tab/webapi)

This `RetrieveCatalogItems` PowerShell function retrieves and prints a table of data from the [Catalog Item (mspcat_applications)](tables/mspcat_applications.md) and [Package (mspcat_packages)](tables/mspcat_packages.md) tables about items in the catalog. This function depends on the `Get-Records` function introduced in [Use PowerShell and Visual Studio Code with the Dataverse Web API](/power-apps/developer/data-platform/webapi/use-ps-and-vscode-web-api)

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

The HTTP request sent by the `Get-CatalogItems` function looks like this:

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
[Query data using the Web API](/power-apps/developer/data-platform/webapi/query-data-web-api)

---

## Next steps

> [!div class="nextstepaction"]
> [Submit and approve catalog items](submit-items.md)
