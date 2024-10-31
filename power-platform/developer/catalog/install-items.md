---
title: "Install items from the catalog in Power Platform using code"
description: "Learn how to install items to your organization's catalog of templates and components using code."
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
# Install items from the catalog in Power Platform using code

Catalog items are stored in the [Catalog Item (mspcat_applications) table](tables/mspcat_applications.md). This table has a [`mspcat_TPSID` (**Catalog Item Id**) column](tables/mspcat_applications.md#BKMK_mspcat_TPSID) that stores a unique string value you can use to refer to a catalog item.

### [PAC CLI](#tab/cli)

Use the [pac catalog install](../cli/reference/catalog.md#pac-catalog-install) command to install items from the catalog.

In this example, you are connected to the `EnvironmentWithCatalog`.

Use the `-cid` parameter to specify the catalog item ID and `-te` to specify the environment to install the catalog item in.

```powershell
pac catalog install  `
   -cid ContosoConferencesCustomConnector `
   -te https://<org to install item>.crm.dynamics.com/
Connected as user@domain
Connected to... EnvironmentWithCatalog
Tracking ID for this installation is 9cc47262-2f33-ef11-8409-6045bdd3aec3
```

When you want to install a specific version of a catalog item, you can append the version number to the end of the string value passed to the `-cid` parameter. For example, let's say that the following table represents the available versions of the `MyCatalogItem` catalog item:


|Version|Description|
|---------|---------|
|3.0.0.0|Published|
|2.0.0.0|Active but not published|
|1.0.0.0|inactive|

The following `-cid` parameter values will have different behaviors:

|Example  |Result|
|---------|---------|
|`-cid MyCatalogItem`|Installs version 3.0.0.0 (Published version)|
|`-cid MyCatalogItem@3.0.0.0`|Installs version 3.0.0.0 (Published version)|
|`-cid MyCatalogItem@2.0.0.0`|Installs version 2.0.0.0|
|`-cid MyCatalogItem@1.0.0.0`|Fails with an error indicating that the version is not available.|


The Tracking ID returned is the primary key of the [Install History (mspcat_InstallHistory)](tables/mspcat_installhistory.md) record which you can review to see whether the installation succeeds.

[What is Microsoft Power Platform CLI?](../cli/introduction.md)

### [SDK for .NET](#tab/sdk)

There are two messages you can use to install catalog items: `mspcat_InstallCatalogItemByCID` and `mspcat_InstallCatalogItem`. Most of the time you should use `mspcat_InstallCatalogItemByCID`.

### mspcat_InstallCatalogItemByCID

Use this message with the [`mspcat_TPSID` (**Catalog Item Id**) column](tables/mspcat_applications.md#BKMK_mspcat_TPSID) value. This is the message that is invoked by the PAC CLI and the application.

The following static `InstallCatalogItemByCIDExample` method shows how to invoke this message using the early-bound classes generated for it using [pac modelbuilder build](../cli/reference/modelbuilder.md#pac-modelbuilder-build).


```csharp
static EntityReference InstallCatalogItemByCIDExample(IOrganizationService service,
    string catalogItemId,
    Uri deployToOrgUrl,
    string? settings = null)
{

    var request = new mspcat_InstallCatalogItemByCIDRequest
    {
        CID = catalogItemId,
        DeployToOrganizationUrl = deployToOrgUrl.ToString(),
    };
    if (string.IsNullOrEmpty(settings))
    {
        request.Settings = settings;
    }

    var response = (mspcat_InstallCatalogItemByCIDResponse)service.Execute(request);

    return response.InstallHistoryReferance;

}
```

#### Settings parameter

The settings passed to the request as a string that represents the [IImportExtensions2.RuntimeSettings Property](/dotnet/api/microsoft.xrm.tooling.packagedeployment.crmpackageextentionbase.iimportextensions2.runtimesettings) where the settings are a serialized `Dictionary<String,Object>` and the pipe character is a delimiter between the settings.  If `settings` represents the dictionary of settings, serialize the setting using code like this:

```csharp
string serializedSettings = string.Join("|", settings.Select(kvp => $"{kvp.Key}:{kvp.Value}"));
```

### mspcat_InstallCatalogItem

This message is provided for completeness and generally you should not use it. Use [mspcat_InstallCatalogItemByCID](#mspcat_installcatalogitembycid) for normal operations.

Use this message when you have a reference to the catalog item you want to install or you want to include a reference to a specific package record to install related to the catalog item.

The following static `InstallCatalogItemExample` method shows how to invoke this message using the early-bound classes generated for it using [pac modelbuilder build](../cli/reference/modelbuilder.md#pac-modelbuilder-build).

```csharp
static EntityReference InstallCatalogItemExample(IOrganizationService service,
    EntityReference target,
    Uri deployToOrgUrl,
    string? settings = null,
    Guid? packageId = null)
{

    if (target.LogicalName != "mspcat_applications")
    {
        throw new Exception("target parameter must be a reference to a Catalog Item (mspcat_applications) record");
    }

    var request = new mspcat_InstallCatalogItemRequest
    {
        Target = target,
        DeployToOrganizationUrl = deployToOrgUrl.ToString(),

    };

    if (packageId.HasValue)
    {
        request.PackageId = packageId.Value;
    }

    if (string.IsNullOrEmpty(settings))
    {
        request.Settings = settings;
    }

    var response = (mspcat_InstallCatalogItemResponse)service.Execute(request);

    return response.InstallHistoryReferance;

}
```

The settings passed to this message are the same used for [mspcat_InstallCatalogItemByCID](#mspcat_installcatalogitembycid). See [Settings parameter](#settings-parameter)


[Use the Dataverse SDK for .NET](/power-apps/developer/data-platform/org-service/overview)   
[Generate early-bound classes for the SDK for .NET](/power-apps/developer/data-platform/org-service/generate-early-bound-classes)


### [Web API](#tab/webapi)

There are two operations you can use to install catalog items: `mspcat_InstallCatalogItemByCID` action and `mspcat_InstallCatalogItem` function.

### mspcat_InstallCatalogItemByCID

The following `Install-CatalogItemByCID` PowerShell function describes how to use the `mspcat_InstallCatalogItemByCID` action.  This function depends on the `$baseURI` and `$baseHeaders` global variable values set by the `Connect` example function described in [Create a Connect function](/power-apps/developer/data-platform/webapi/use-ps-and-vscode-web-api#create-a-connect-function).

```powershell
<#
.SYNOPSIS
Installs a catalog item to a specified organization URL using its catalog item ID (CID).

.DESCRIPTION
The `Install-CatalogItemByCID` function installs a catalog item to a specified organization URL using the Microsoft Dynamics CRM API. 
It constructs the appropriate request body with mandatory and optional parameters and sends a POST request to the API.

.PARAMETER catalogItemId
The ID of the catalog item to be installed. This parameter is mandatory.

.PARAMETER deployToOrgUrl
The URL of the organization where the catalog item will be deployed. This parameter is mandatory.

.PARAMETER settings
Optional settings for the installation. This parameter is optional.

.PARAMETER skipSendToCatalogService
A boolean flag indicating whether to skip sending to the catalog service. This parameter is optional.

.RETURNVALUE
[string] The `mspcat_installhistoryid` value from the API response, which is the ID of the installation history record.

.EXAMPLE
Install-CatalogItemByCID `
   -catalogItemId 'ExampleTable' `
   -deployToOrgUrl 'https://example.crm.dynamics.com/' `
   -settings = 'Key=Value|Key1=Value1'

#>
function Install-CatalogItemByCID {
   param (
      [Parameter(Mandatory)]
      [string]
      $catalogItemId,
      [Parameter(Mandatory)]
      [string]
      $deployToOrgUrl,
      [string]
      $settings,
      [bool]
      $skipSendToCatalogService
   )

   $body = @{
      CID                    = $catalogItemId
      DeployToOrganizationUrl = $deployToOrgUrl
   }

   if ($settings) {
      $body.Add('Settings', $settings)
   }

   if ($skipSendToCatalogService) {
      $body.Add('SkipSendToCatalogService', $skipSendToCatalogService)
   }

   $postHeaders = $baseHeaders.Clone()
   $postHeaders.Add('Content-Type', 'application/json')

   $results = Invoke-RestMethod `
      -Method Post `
      -Uri $baseURI"mspcat_InstallCatalogItemByCID" `
      -Headers $postHeaders `
      -Body ($body | ConvertTo-Json)
   
   return $results.mspcat_installhistoryid
}
```


### mspcat_InstallCatalogItem

The following `Install-CatalogItem` PowerShell function describes how to use the `mspcat_InstallCatalogItem` function.  This function depends on the `$baseURI` and `$baseHeaders`  global variable values set by the `Connect` example function described in [Create a Connect function](/power-apps/developer/data-platform/webapi/use-ps-and-vscode-web-api#create-a-connect-function).

```powershell
<#
.SYNOPSIS
Installs a catalog item to a specified organization URL.

.DESCRIPTION
The `Install-CatalogItem` function installs a catalog item to a specified organization URL using the Microsoft Dynamics CRM API. 
It constructs the appropriate URL with mandatory and optional parameters and sends a GET request to the API.

.PARAMETER catalogItemId
The GUID ID of the catalog item to be installed. This parameter is mandatory.

.PARAMETER deployToOrgUrl
The URL of the organization where the catalog item will be deployed. This parameter is mandatory.

.PARAMETER settings
Optional settings for the installation. This parameter is optional.

.PARAMETER skipSendToCatalogService
A boolean flag indicating whether to skip sending to the catalog service. This parameter is optional.

.RETURNVALUE
Returns the `mspcat_installhistoryid` value from the API response, which is the ID of the installation history record.

.EXAMPLE

Install-CatalogItem `
   -catalogItemId df32c7c8-2137-ef11-8409-6045bdd3aec3 `
   -deployToOrgUrl 'https://example.crm.dynamics.com/' `
   -settings = 'Key=Value|Key1=Value1'
#>
function Install-CatalogItem {
   param (
      [Parameter(Mandatory)]
      [string]
      $catalogItemId,
      [Parameter(Mandatory)]
      [string]
      $deployToOrgUrl,
      [string]
      $settings,
      [bool]
      $skipSendToCatalogService
   )

   # This is a bound function that requires a GUID identifier for the 
   # catalog item
   $url = $baseURI + 'mspcat_applicationses(' + $catalogItemId + ')'
   $url += '/Microsoft.Dynamics.CRM.mspcat_InstallCatalogItem'
   $url += '(DeployToOrganizationUrl=@deployToOrgUrl'

   # Set optional parameters
   if ($settings) {
      $url += ',Settings=@settings'
   }
   if ($skipSendToCatalogService) {
      $url += ',SkipSendToCatalogService=@skipSendToCatalogService'
   }

   $url += ")?@deployToOrgUrl='" + $deployToOrgUrl +"'"

   # Set optional parameter values
   if ($settings) {
      $url += "&@settings='" + $settings +"'"
   }
   if ($skipSendToCatalogService) {
      $url += '&@skipSendToCatalogService=' + $skipSendToCatalogService
   }

   $results = Invoke-RestMethod `
      -Method Get `
      -Uri $url `
      -Headers $baseHeaders

   return  $results.mspcat_installhistoryid
}
```


[Use the Microsoft Dataverse Web API](/power-apps/developer/data-platform/webapi/overview)   
[Use PowerShell and Visual Studio Code with the Dataverse Web API](/power-apps/developer/data-platform/webapi/use-ps-and-vscode-web-api)

---

## Check status of catalog installation

The [statuscode Choices/Options](tables/mspcat_installhistory.md#statuscode-choicesoptions) options of the [Install History (mspcat_InstallHistory) table](tables/mspcat_installhistory.md). **Completed** (526430003) represents a successful submission.

|State|Value|Label|Allowed Transition to|
|---|---|---|
|`0` (**Active**)|`1`|**Requested**|2,526430001,526430002,526430003,526430004|
|`1` (**Inactive**)|`2`|**Inactive**||
|`0` (**Active**)|`526430001`|**Pending**|2, 526430002,526430003,526430004,|
|`0` (**Active**)|`526430002`|**In Progress**|2,526430003,526430004,|
|`1` (**Inactive**)|`526430003`|**Completed**||
|`1` (**Inactive**)|`526430004`|**Failed**||


### [PAC CLI](#tab/cli)

Use the [pac catalog status](../cli/reference/catalog.md#pac-catalog-status) command to check the status of catalog installations.

```powershell
pac catalog status --tracking-id 0e6b119d-80f3-ed11-8849-000d3a0a2d9d --type Install
Connected to... TestCatalog
Connected as user@domain
Status of the Install request: Requested
```

[What is Microsoft Power Platform CLI?](../cli/introduction.md)

### [SDK for .NET](#tab/sdk)

> TODO: Show how to poll a [Install History (mspcat_InstallHistory) record to check the status](tables/mspcat_installhistory.md)

[Use the Dataverse SDK for .NET](/power-apps/developer/data-platform/org-service/overview)

### [Web API](#tab/webapi)

> TODO: Show how to poll a [Install History (mspcat_InstallHistory) record to check the status](tables/mspcat_installhistory.md)

// Poll for status of certification request
GET /mspcat_installhistories(id)?$select=statuscode

[Use the Microsoft Dataverse Web API](/power-apps/developer/data-platform/webapi/overview)

---


