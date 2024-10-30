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

|Column1  |Column2  |
|---------|---------|
|`-cid MyCatalogItem`|Installs version 3.0.0.0 (Published version)|
|`-cid MyCatalogItem@3.0.0.0 `|Installs version 3.0.0.0 (Published version)|
|`-cid MyCatalogItem@2.0.0.0 `|Installs version 2.0.0.0|
|`-cid MyCatalogItem@1.0.0.0 `|fails with an error indicating that the version is not available.|


The Tracking ID returned is the primary key of the [Install History (mspcat_InstallHistory)](tables/mspcat_installhistory.md) record which you can review to see whether the installation succeeds.

[What is Microsoft Power Platform CLI?](../cli/introduction.md)

### [SDK for .NET](#tab/sdk)

There are two messages you can use to install catalog items: `mspcat_InstallCatalogItemByCID` and `mspcat_InstallCatalogItem`.

### mspcat_InstallCatalogItemByCID

Use this message with the [`mspcat_TPSID` (**Catalog Item Id**) column](tables/mspcat_applications.md#BKMK_mspcat_TPSID) value. This is the message that is invoked by the PAC CLI and the application. This is the message you should use most of the time.

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

There are two actions you can use to install catalog items: `mspcat_InstallCatalogItem` and `mspcat_InstallCatalogItemByCID`.

### mspcat_InstallCatalogItemByCID

> TODO: Web API example

### mspcat_InstallCatalogItem

> TODO: Web API example


[Use the Microsoft Dataverse Web API](/power-apps/developer/data-platform/webapi/overview)

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


