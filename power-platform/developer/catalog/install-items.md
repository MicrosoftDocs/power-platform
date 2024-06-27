---
title: "Install items from the catalog in Power Platform using code (preview)"
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
 - JimDaly
---
# Install items from the catalog in Power Platform using code (preview)

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

The Tracking ID returned is the primary key of the [Install History (mspcat_InstallHistory)](tables/mspcat_installhistory.md) record which you can review to see whether the installation succeeds.

[What is Microsoft Power Platform CLI?](../cli/introduction.md)

### [SDK for .NET](#tab/sdk)

There are two messages you can use to install catalog items: `mspcat_InstallCatalogItem` and `mspcat_InstallCatalogItemByCID`.

### mspcat_InstallCatalogItem

Use this message when you have a reference to the catalog item you want to install or you want to include a reference to a packageid for some reason. 
<!-- TODO: provide reason for packageid parameter -->

The following static `InstallCatalogItemExample` method shows how to invoke this messsage using the early-bound classes generated for it using [pac modelbuilder build](../cli/reference/modelbuilder.md#pac-modelbuilder-build).

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
        // TODO explain what this is for

        request.PackageId = packageId.Value;
    }

    if (string.IsNullOrEmpty(settings))
    {
        // TODO explain what these settings are
        request.Settings = settings;
    }

    var response = (mspcat_InstallCatalogItemResponse)service.Execute(request);

    return response.InstallHistoryReferance;

}
```


### mspcat_InstallCatalogItemByCID

Use this message when you have only the [`mspcat_TPSID` (**Catalog Item Id**) column](tables/mspcat_applications.md#BKMK_mspcat_TPSID) value. This is the message that is invoked by the PAC CLI and the application.

The following static `InstallCatalogItemByCIDExample` method shows how to invoke this messsage using the early-bound classes generated for it using [pac modelbuilder build](../cli/reference/modelbuilder.md#pac-modelbuilder-build).


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
        // TODO explain what these settings are
        request.Settings = settings;
    }

    var response = (mspcat_InstallCatalogItemByCIDResponse)service.Execute(request);

    return response.InstallHistoryReferance;

}
```


[Use the Dataverse SDK for .NET](/power-apps/developer/data-platform/org-service/overview)   
[Generate early-bound classes for the SDK for .NET](/power-apps/developer/data-platform/org-service/generate-early-bound-classes)


### [Web API](#tab/webapi)

There are two actions you can use to install catalog items: `mspcat_InstallCatalogItem` and `mspcat_InstallCatalogItemByCID`.

### mspcat_InstallCatalogItem

TODO: Web API example


### mspcat_InstallCatalogItemByCID

TODO: Web API example

[Use the Microsoft Dataverse Web API](/power-apps/developer/data-platform/webapi/overview)

---