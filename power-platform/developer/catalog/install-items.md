---
title: "Install items from the catalog in Power Platform using code"
description: "Learn how to install items to your organization's catalog of templates and components using code."
author: MattB-msft
ms.author: mbarbour
ms.subservice: developer
ms.date: 11/05/2024
ms.reviewer: jdaly
ms.topic: install-set-up-deploy
search.audienceType: 
  - developer
contributors:
 - JimDaly
 - singhguru2001us  
---
# Install items from the catalog in Power Platform using code

Catalog items are stored in the [Catalog Item (mspcat_applications) table](tables/mspcat_applications.md). This table has a [`mspcat_TPSID` (**Catalog Item Id**) column](tables/mspcat_applications.md#BKMK_mspcat_TPSID) that stores a unique string value you can use to refer to a catalog item.

## Install a specific version

When using PAC CLI [pac catalog install](../cli/reference/catalog.md#pac-catalog-install) command or the `mspcat_InstallCatalogItemByCID` message, pass a string catalog item ID (`cid` or `CID`) parameter.

When you want to install a specific version of a catalog item, append the version number to the string value passed to the catalog item ID parameter. The version value comes from the related [Package (mspcat_packages) record Version (mspcat_version) value](tables/mspcat_packages.md#BKMK_mspcat_Version).

For example, let's say that the following table represents the available versions of the `MyCatalogItem` catalog item:


|Version|Description|
|---------|---------|
|3.0.0.0|Published|
|2.0.0.0|Active but not published|
|1.0.0.0|inactive|

The following catalog item ID parameter values have different behaviors:

|Example  |Result|
|---------|---------|
|`MyCatalogItem`|Installs version 3.0.0.0 (Published version)|
|`MyCatalogItem@3.0.0.0`|Installs version 3.0.0.0 (Published version)|
|`MyCatalogItem@2.0.0.0`|Installs version 2.0.0.0|
|`MyCatalogItem@1.0.0.0`|Fails with an error indicating that the version isn't available.|

### [PAC CLI](#tab/cli)

Use the [pac catalog install](../cli/reference/catalog.md#pac-catalog-install) command to install items from the catalog.

In this example, you're [connected](../cli/reference/auth.md#connect-to-your-tenant) to the `EnvironmentWithCatalog`.

Use the `-cid` parameter to specify the catalog item ID and `-te` to specify the environment to install the catalog item in. [You can also specify a specific version](#install-a-specific-version).

```powershell
pac catalog install  `
   -cid ContosoConferencesCustomConnector `
   -te https://<org to install item>.crm.dynamics.com/
Connected as user@domain
Connected to... EnvironmentWithCatalog
Tracking ID for this installation is 9cc47262-2f33-ef11-8409-6045bdd3aec3
```

The Tracking ID returned is the primary key of the [Install History (mspcat_InstallHistory)](tables/mspcat_installhistory.md) record which you can review to see whether the installation succeeds.

[What is Microsoft Power Platform CLI?](../cli/introduction.md)

### [SDK for .NET](#tab/sdk)

There are two messages you can use to install catalog items: `mspcat_InstallCatalogItemByCID` and `mspcat_InstallCatalogItem`. Most of the time you should use `mspcat_InstallCatalogItemByCID`.

### mspcat_InstallCatalogItemByCIDRequest

Use this message with the [`mspcat_TPSID` (**Catalog Item Id**) column](tables/mspcat_applications.md#BKMK_mspcat_TPSID) value. [You can specify a specific version](#install-a-specific-version). PAC CLI and the application use this message.

The following static `InstallCatalogItemByCIDExample` method shows how to invoke this message using the early-bound classes generated for it using [pac modelbuilder build](../cli/reference/modelbuilder.md#pac-modelbuilder-build).


```csharp
/// <summary>
/// Demonstrates how to install a catalog item in Power Platform.
/// </summary>
/// <param name="service">The authenticated IOrganizationService instance.</param>
/// <param name="catalogItemId">The mspcat_TPSID value of the catalog item, optionally with @version</param>
/// <param name="deployToOrgUrl">The URL of the environment to install the item in.</param>
/// <param name="settings">The settings to apply (optional)</param>
/// <returns>A reference to the install history so you can check the status</returns>
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

#### Usage example

The following example shows using the static `InstallCatalogItemByCIDExample` method.

```csharp
EntityReference installHistoryReference =  InstallCatalogItemByCIDExample(
    service: service, 
    catalogItemId: "MyCatalogItem@1.0.0.0", 
    deployToOrgUrl: new Uri("https://<org to install item>.crm.dynamics.com/"));

  Console.WriteLine(installHistoryReference.Id);
```


#### Settings parameter

The settings passed to the request as a string that represents the [IImportExtensions2.RuntimeSettings Property](/dotnet/api/microsoft.xrm.tooling.packagedeployment.crmpackageextentionbase.iimportextensions2.runtimesettings) where the settings are a serialized `Dictionary<String,Object>` and the pipe character is a delimiter between the settings. If `settings` represents the dictionary of settings, serialize the setting using code like this:

```csharp
string serializedSettings = string.Join("|", settings.Select(kvp => $"{kvp.Key}:{kvp.Value}"));
```

### mspcat_InstallCatalogItemRequest

This message is provided for completeness and generally you shouldn't use it. Use [mspcat_InstallCatalogItemByCIDRequest](#mspcat_installcatalogitembycidrequest) for normal operations. This message is used by the PAC CLI [pac catalog install command](../cli/reference/catalog.md#pac-catalog-install) when the optional  `--target-version` parameter is specified.

Use this message when you have a reference to the catalog item you want to install or you want to include a reference to a specific package record to install related to the catalog item.

The following static `InstallCatalogItemExample` method shows how to invoke this message using the early-bound classes generated for it using [pac modelbuilder build](../cli/reference/modelbuilder.md#pac-modelbuilder-build).

```csharp
/// <summary>
/// Demonstrates how to install a catalog item in Power Platform.
/// </summary>
/// <param name="service">The authenticated IOrganizationService instance.</param>
/// <param name="target">Reference to the catalog item to install</param>
/// <param name="deployToOrgUrl">The URL of the environment to install the item in.</param>
/// <param name="settings">The settings to apply (optional)</param>
/// <param name="packageId">The packageId to apply (optional)</param>
/// <returns>A reference to the install history so you can check the status</returns>
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

The settings passed to this message are the same used for [mspcat_InstallCatalogItemByCIDRequest](#mspcat_installcatalogitembycidrequest). See [Settings parameter](#settings-parameter)


[Use the Dataverse SDK for .NET](/power-apps/developer/data-platform/org-service/overview)   
[Generate early-bound classes for the SDK for .NET](/power-apps/developer/data-platform/org-service/generate-early-bound-classes)


### [Web API](#tab/webapi)

There are two operations you can use to install catalog items: `mspcat_InstallCatalogItemByCID` action and `mspcat_InstallCatalogItem` function. Most of the time you should use the `mspcat_InstallCatalogItemByCID` action.


### mspcat_InstallCatalogItemByCID action

The following `Install-CatalogItemByCID` PowerShell function describes how to use the `mspcat_InstallCatalogItemByCID` action. With this action, [you can specify a specific version](#install-a-specific-version) to install.

This function depends on the `$baseURI` and `$baseHeaders` global variable values set by the `Connect` example function described in [Create a Connect function](/power-apps/developer/data-platform/webapi/use-ps-and-vscode-web-api#create-a-connect-function).

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
   -catalogItemId 'ContosoConferencesCustomConnector' `
   -deployToOrgUrl 'https://<org to install item>.crm.dynamics.com/' `
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


### mspcat_InstallCatalogItem function

The following `Install-CatalogItem` PowerShell function describes how to use the `mspcat_InstallCatalogItem` function. This function depends on the `$baseURI` and `$baseHeaders`  global variable values set by the `Connect` example function described in [Create a Connect function](/power-apps/developer/data-platform/webapi/use-ps-and-vscode-web-api#create-a-connect-function).

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
   -deployToOrgUrl 'https://<org to install item>.crm.dynamics.com/' `
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

The following table shows the [statuscode Choices/Options](tables/mspcat_installhistory.md#statuscode-choicesoptions) options of the [Install History (mspcat_InstallHistory) table](tables/mspcat_installhistory.md). **Completed** (526430003) represents a successful submission, **Failed** (526430003) represents an unsuccessful submission. [Custom state model transitions](/power-apps/developer/data-platform/define-custom-state-model-transitions) ensure that the status value moves through the active status reasons until the installation becomes inactive.

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

The following static `GetInstallSuccess` method checks the status of the [Install History (mspcat_InstallHistory) record](tables/mspcat_installhistory.md) to determine whether the installation succeeded.

```csharp
/// <summary>
/// Polls the install success of a catalog item
/// </summary>
/// <param name="service">The authenticated IOrganizationService instance.</param>
/// <param name="id">The mspcat_installhistoryid value</param>
/// <param name="intervalInSeconds">The number of seconds of interval</param>
/// <returns>Whether the installation succeeded</returns>
/// <exception cref="Exception">The polling is limited to 10 attempts.</exception>
static bool GetInstallSuccess(IOrganizationService service, Guid id, int intervalInSeconds = 60) {

    int maxAttempts = 10;
    int attempts = 0;

    while (attempts < maxAttempts)
    {
        attempts++;
        Entity currentValue = service.Retrieve("mspcat_installhistory", id, new ColumnSet("statecode", "statuscode"));

        // Wait until the state of the operation is inactive
        if (currentValue.GetAttributeValue<OptionSetValue>("statecode").Value.Equals(1))
        {
            if  (currentValue.GetAttributeValue<OptionSetValue>("statuscode").Value.Equals(526430003))
            {
               // When the statuscode values is 'Completed'
                return true;
            }
            // Any other status code: 'Inactive' or 'Failed'.
            return false;
        }
        Thread.Sleep(intervalInSeconds * 1000);
    }

    throw new Exception("Maximum number of polling attempts exceeded.");
}
```

[Use the Dataverse SDK for .NET](/power-apps/developer/data-platform/org-service/overview)

### [Web API](#tab/webapi)

The following `Get-InstallSuccess` function checks the status of the [Install History (mspcat_InstallHistory) record](tables/mspcat_installhistory.md) to determine whether the installation succeeded. This function depends on the `Get-Record` function described in [Create table operations functions](/power-apps/developer/data-platform/webapi/use-ps-and-vscode-web-api#create-table-operations-functions).

```powershell
<#
.SYNOPSIS
Polls the install success of a catalog item.

.DESCRIPTION
The `Get-InstallSuccess` function polls the install success of a catalog item by retrieving its state 
and status codes. It continues polling at specified intervals until the installation is either 
completed or failed, or until the maximum number of attempts is reached.

.PARAMETER id
The ID of the catalog item to be checked. This parameter is mandatory.

.PARAMETER intervalInSeconds
The interval in seconds between each polling attempt. This parameter is optional and defaults to 
60 seconds.

.RETURNVALUE
[bool] Returns `$true` if the installation is completed successfully, `$false` if the installation 
is inactive or failed.

.EXAMPLE
$id = "b54f3dff-b297-ef11-8a69-7c1e520056af"
$intervalInSeconds = 60

$result = Get-InstallSuccess -id b54f3dff-b297-ef11-8a69-7c1e520056af
Write-Output "Installation success: $result"

#>
function Get-InstallSuccess {
   param (
       [Parameter(Mandatory)]
       [string]$id,
       [int]$intervalInSeconds = 60
   )

   $maxAttempts = 10
   $attempts = 0

   while ($attempts -lt $maxAttempts) {
       $attempts++
   
       # Retrieve the record
       $response = Get-Record `
         -setName 'mspcat_installhistories' `
         -id $id `
         -query '?$select=statecode,statuscode'
       
       # Retrieve the record

       # Wait until the state of the operation is inactive
       if ($response.statecode -eq 1) {
           if ($response.statuscode -eq 526430003) {
               # When the statuscode value is 'Completed'
               return $true
           }
           # Any other status code: 'Inactive' or 'Failed'
           return $false
       }
       Start-Sleep -Seconds $intervalInSeconds
   }

   throw "Maximum number of polling attempts exceeded."
}
```

[Use the Microsoft Dataverse Web API](/power-apps/developer/data-platform/webapi/overview)   
[Use PowerShell and Visual Studio Code with the Dataverse Web API](/power-apps/developer/data-platform/webapi/use-ps-and-vscode-web-api)


---
