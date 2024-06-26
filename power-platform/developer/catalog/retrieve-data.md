---
title: "Retrieve data about the catalog in Power Platform (preview)"
description: "Learn about APIs to use to retrieve data about the catalog in Power Platform using code."
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
# Retrieve data about the catalog in Power Platform (preview)


## Tables added by the Power Platform catalog manager application

When you [install the Power Platform Catalog manager application](../../admin/administer-catalog.md#set-up-the-catalog) in an environment in your tenant, the following tables are added to that environment:


|Schema Name|Display Name|Description |
|---------|---------|---------|
|`mspcat_applicationreference`|**Catalog Item Cross Reference**|Cross Reference table between Catalog items as they are versioned.|
|`mspcat_applications`|**Catalog Item**|Entry that will appear in the Catalog|
|`mspcat_bpf_06d86bf860814221be8c81204be2199d`|**Certification Request Life Cycle**|Base entity for process Approval Request Life Cycle|
|`mspcat_CatalogDescription`|**Catalog Configuration**|Contains descriptive data for the Catalog|
|`mspcat_CatalogItemFile`|**Catalog Item File**|Supporting Files for the a catalog item|
|`mspcat_CertificationRejectionAppliedPolicy`|**Approval Rejection Applied Policy**|*None provided*|
|`mspcat_certificationrequest`|**Approval Request**|Contains Approval records that are used to process new or updated submissions to the catalog system.|
|`mspcat_configurationforpowerapps`|**Configuration for PowerApps Checker**|*None provided*|
|`mspcat_crmgeo`|**Power Platform Geo**|This lists the Power Platform GEO's that are available to be assigned|
|`mspcat_crmgeodeploymentstatus`|**GEO Deployment Status**|Tracks the deployment status of a given Application to a CRM Region.|
|`mspcat_InstallActivity`|**Install Activity**|Install History Activity Id's|
|`mspcat_InstallHistory`|**Install History**|Contains record of installations and their status|
|`mspcat_packagedsolutioncomponents`|**Packaged Solution Components**|Component types that are in solutions stored in a package|
|`mspcat_packagelocales`|**Package Locales**|*None provided*|
|`mspcat_packages`|**Package**|Deployment Assets for a Catalog Item.|
|`mspcat_PackageSolutions`|**Packaged Solution**|Solutions that relate to packages|
|`mspcat_powerappsScanStatus`|**Status of PowerApps Checker package scan**|*None provided*|
|`mspcat_publisher`|**Catalog Publisher**|This the publisher Entity for holding TPS Publisher data.|
|`mspcat_publisheridentity`|**Publisher Identity**|*None provided*|
|`mspcat_PublisherUsers`|**Publisher Users**|Users that have access to the related Publisher|
|`mspcat_rulesetforpowerappschecker`|**Rule set for PowerApps Checker**|*None provided*|
|`mspcat_sspolicy`|**Policy**|Smart Cert policy table|
|`mspcat_ssPolicyTemplate`|**Policy Template**|*None provided*|
|`mspcat_staticanalysispolicy`|**Static Analysis Policy**|*None provided*|
|`mspcat_templates`|**Templates**|*None provided*|

> [!NOTE]
> The [Catalog Submission Files (mspcat_CatalogSubmissionFiles)](/power-apps/developer/data-platform/reference/entities/mspcat_catalogsubmissionfiles) and [Package Submission Store (mspcat_PackageStore)](/power-apps/developer/data-platform/reference/entities/mspcat_packagestore) tables are found in every Dataverse environment. They are not added by the Power Platform Catalog manager application.

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

There are two Dataverse functions you can use to get information about the catalog.

### mspcat_GetPowerCatalogInformationRequest

#### [PAC CLI](#tab/cli)

There is no PAC CLI command to return this information.

#### [SDK for .NET](#tab/sdk)

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

#### [Web API](#tab/webapi)

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

### mspcat_GetPowerCatalogDetails

TODO: Tell what mspcat_GetPowerCatalogDetails is for.

#### [PAC CLI](#tab/cli)

There is no PAC CLI command to return this information.

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

The static `GetPowerCatalogDetailsExample` method will write something like this to the console:

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

Use the `mspcat_GetPowerCatalogDetails` function to get information about the catalog in the environment.

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

The output of this function will look something like this:

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

## Next steps

> [!div class="nextstepaction"]
> [Submit and approve catalog items (preview)](submit-items.md)
