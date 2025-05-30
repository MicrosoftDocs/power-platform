---
title: "Catalog item submission document reference"
description: "Find details about the structure of the JSON data that must be included when submitting an item to the catalog in Power Platform"
author: isaacwinoto
ms.author: isaacwinoto
ms.subservice: developer
ms.date: 11/05/2024
ms.reviewer: jdaly
ms.topic: reference
search.audienceType: 
  - developer
contributors:
 - JimDaly
 - singhguru2001us
---
# Catalog item submission document reference

You must include data in JSON format when you submit an item to the catalog. This article describes the valid properties for that document. This JSON is an example:

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
    },
      "packageFile": {
         "name": "packageFileName.zip",
         "filesaslink": "https://Contoso.blob.core.windows.net/ContosoConferencesCustomConnector/packageFileName.zip"
      }
  }
}
```

This table describes the properties for the submission document:


|Property|Type|Required|Description|
|--------|----|--------|-----------|
|`modelVersion`|string|No|Version number of the submission document. Default is 1.0.0.0.|
|`sourcePortal`|int|No|Identifies the source of this request. Defaults to `526430005` which is the PAC CLI. For other sources, use `526430000`. The `mspcat_GetPowerCatalogDetails` function returns the full list. The `mspcat_GetPowerCatalogDetailsResponse.CatalogDetails.sourceOptions` property lists the available options.|
|`submissionId`|guid|No|Guid to identify the submission. This value is a foreign key to allow for linking the request to other systems.|
|`operation`|string|Yes|For future expansion and isn't currently respected. The type of operation that to be used. Valid values:<br /> - `CreateOrUpdate` (Default)<br /> - `Create`<br /> - `Update`<br /> - `Disabled`<br />|
|`businessJustification`|string|No|Describes the business value of the submission to the approver. This value can contain HTML or Rich Text Format (RTF). This information appears in the planned consumption experience in the maker discovery user experience. Users might say their submission helps with cost reduction or productivity, for example. Some organizations require certain classes of value and those values can be entered here.|
|`publisherDetails`|[Publisher](#publisher)|Yes|The publisher associated with this item submission.|
|`catalogItemDefinition`|[CatalogItemDefinition](#catalogitemdefinition)|Yes|Defines the catalog item being submitted.|

## Publisher

Use this data to specify the catalog submission item `publisherDetails` property.

Creates a publisher record that can be associated to one or more Microsoft Entra ID groups containing authorized users who can make updates to the catalog item going forward.

> [!NOTE]
> Don't confuse this term with *Solution Publisher*. Catalog item publisher isn't used with solutions.

You need to provide the `publisherDisplayName` at a minimum. `publisherId` can be any string value. The system checks if that publisher exists, else creates it and assigns an `publisherId`.

For example, HR IT team of developers can create a publisher and ID the developers using a Microsoft Entra ID group.

Here's a sample of a publisher record that includes operations to add a person and an Entra ID group

```json
{
   "publisherId": "MyPublisherId",
   "publisherDisplayName": "Contoso Publishing",
   "publisherUpnList": [
      {
         "action": "Add",
         "upn": "john.doe@contoso.com"
      }
   ],
   "publisherAADGroupOIDS": [
      {
         "action": "Add",
         "groupName": "PowerCatalogSubmitters",
         "groupOID": "2ded6de9-ab44-4478-9bd4-e609947daa2e",
         "groupType": "Security"
      }
   ]
}
```

|Property|Type|Required|Description|
|--------|----|--------|-----------|
|`publisherId`|string|Yes|The unique ID for this publisher. Use this ID to identify this publisher anytime you're creating or updating a catalog item for this publisher. Catalog Items can only be associated to one publisher at a time. The value can be a GUID or string. Once set, it must be maintained.|
|`publisherDisplayName`|string|Yes|Consumers see this data in the catalog gallery.|
|`publisherUpnList`|[CatalogUPNOperation](#catalogupnoperation)[]|No|People that can submit new or update catalog items as this publisher. Always includes the submitting user the first time the Publisher is created.|
|`publisherAADGroupOIDS`|[CatalogGroupOperation](#cataloggroupoperation)[]|No|Entra ID Groups whose members are allowed to access this publisher.|


### CatalogUPNOperation

Use this data to specify the [Publisher](#publisher) `publisherUpnList` property.

Defines an operation to add or remove people that can submit new or update catalog items as this publisher.

|Property|Type|Required|Description|
|--------|----|--------|-----------|
|`action`|string|Yes|The action to take with this UPN. Valid values: `Add` or `Remove`. |
|`upn`|string|Yes|User Principal Name (UPN) of the user.|
|`userOid`|guid|Yes|Object Identifier for the user.|

### CatalogGroupOperation

Use this data to specify the [Publisher](#publisher) `publisherAADGroupOIDS` property.

Defines an operation to add or remove an Entra ID Group that can access this publisher.

|Property|Type|Required|Description|
|--------|----|--------|-----------|
|`action`|string|Yes|The action to take with this UPN. Valid values: `Add` or `Remove`.|
|`groupName`|string|Yes|Name of group.|
|`groupOid`|guid|Yes|Object identifier for group.|
|`groupType`|string|Yes|Type of Group being addressed. Valid Values are `Security` and `Modern`.|

## CatalogItemDefinition

Use this data to specify the catalog submission item `catalogItemDefinition` property.

These properties define the catalog item being submitted. This is the actual Power Platform solution. A package is what is stored in the catalog.

Here's an example of a catalog item including its `engineeringName` and `supportName` contacts that are mandatory.

```json
"catalogItemDefinition": {
   "id": "ContosoTravelsApp",
   "displayName": "Contoso Travel Expense App",
   "description": "Submit expenses on the go!",
   "offer": {
   "businessCategories": [526430000, 526430001, 526430002],
   "type": "Component_Collection",
   "deploymentType": "Normal",
   "small48x48Image": {
      "name": "Small48Image",
      "fileSasLink": "https://www.contoso.com/icon48.jpg"      
   },
   "large216x216Image": {
      "name": "Large216image2",
      "fileSasLink": "https://www.contoso.com/icon216.jpg"
   },
   "documents": [
      {
         "name": "ImaNewfile",
         "fileSasLink": "https://www.contoso.com/screenshot1.jpg"
      },
      {
         "name": "ImaNewfile2",
         "fileSasLink": "https://www.contoso.com/screenshot2.jpg"
      }
   ],
   "helpLink": "https://www.contoso.com/help.html",
   "privacyPolicyLink": "https://www.contoso.com/privacy.html",
   "legalTerms": "https://www.contoso.com/legal.html",
   "engineeringName": {
      "firstName": "John",
      "lastName": "Roon",
      "email": "john@contoso.com",
      "phoneNumber": "999-111-1234"
   },
   "supportName": {
      "firstName": "Jane",
      "lastName": "Drill",
      "email": "jane@contoso.com",
      "phoneNumber": "999-111-1234"
   }
   }
}
```

|Property|Type|Required|Description|
|--------|----|--------|-----------|
|`id`|guid|Yes|The unique ID of the catalog item. Use this ID when updating or installing the catalog item.|
|`displayName`|string|Yes|Name shown to consumers in the catalog galleries.|
|`description`|string|No|Description shown to consumers in the catalog galleries.|
|`offer`|[OfferDetails](#offerdetails)|Yes|The details of the catalog item submission.|
|`packageFile`|[CatalogFileAsset](#catalogfileasset)|Yes|Describes where to get the catalog package file for the submission.|

### OfferDetails

Use this data to specify the [CatalogItemDefinition](#catalogitemdefinition) `offer` property.

These properties define the details of the catalog item submission.

|Property|Type|Required|Description|
|--------|----|--------|-----------|
|`businessCategories`|int[]|No|List of choice option values respected by the target catalog. Identifies the business categories to associate with this catalog item. See [Business categories](#business-categories) for the valid values to use.|
|`type`|string|Yes|Type of catalog item. Valid values:<br />- `Application`<br />- `Component_Collection`|
|`supportsApplicationTypes`|string[]|No|List of the supported application types. Valid values:<br />- `CanvasApps`<br />- `ModelApps`<br />- `PowerPortals`<br />- `PowerAutomate`|
|`deploymentType`|string|Yes|Indicates the type of deployment to deploy this catalog item. Valid values:<br />- `Normal` represents a **managed item**.<br />- `Template` A copy of your unmanaged solution that other makers can edit however they choose. <br /> [Learn more about catalog item types](/power-apps/maker/data-platform/catalog-overview#catalog-basics)|
|`searchKeywords`|string[]|No|Words that people might use to find this catalog item.|
|`small48x48Image`|[CatalogFileAsset](#catalogfileasset)|No|Image for gallery view. If you don't provide this image, a system default icon is used.|
|`large216x216Image`|[CatalogFileAsset](#catalogfileasset)|No|Image for detail view. Provide an icon to be displayed in the maker or other discovery UI. Some user experiences uses larger icons to render cards for discovery.|
|`useCaseDocument`|[CatalogFileAsset](#catalogfileasset)|No|Use case description and explanation to approvers.|
|`videos`|[CatalogFileAsset](#catalogfileasset)[]|No|Detail view displays links to these video/gif files.|
|`documents`|[CatalogFileAsset](#catalogfileasset)[]|No|Detail view displays links to these files.|
|`screenshots`|[CatalogFileAsset](#catalogfileasset)[]|No|Detail view displays these images. You can pass screenshots here of your application to help makers identify whether this app provides the functionality or capability they're looking for. The most common thing people do before downloading an app or template is look at its images and screenshots to understand the capabilities instead of reading the description.|
|`helpLink`|uri|No|Link to documentation. These URLs can be links to internal docs or sharepoint resources.|
|`privacyPolicyLink`|uri|No|Link to privacy document. Policies regarding careful usage of the component or application being submitted.|
|`legalTermsLink`|uri|No|Link to the Terms and Conditions document. Any legal terms or internal guidance for evaluation of the consumer of the catalog item.|
|`legalTerms`|string|No|Markdown, HTML, or text version of the Terms and Conditions document. Any legal terms or internal guidance for evaluation of the consumer of the catalog item.|
|`sourceCodeRepositoryLink`|uri|No|Link to the source code repository|
|`engineeringName`|[PersonContactInformation](#personcontactinformation)|Yes|Contact information for engineer or group that developed this catalog item.|
|`supportName`|[PersonContactInformation](#personcontactinformation)|No|Contact information for support or group that supports this catalog item. Can be same as the engineering contact that the consumer of a catalog item can reach out to if they run into issues with the application.|

### Business categories

Set the [OfferDetails](#offerdetails) `businessCategories` property to one or more of these business categories:

|Code|Description|
|-----|-----|
|`526430000`|Customer Service|
|`526430001`|Project Management|
|`526430002`|Calendar Management & Scheduling|
|`526430003`|Email Management|
|`526430004`|Files & Documentation|
|`526430005`|Notification & Reminders|
|`526430006`|Analytics|
|`526430007`|Collaboration|
|`526430008`|Commerce|
|`526430009`|Finance|
|`526430010`|Compliance & Legal|
|`526430011`|Sales|
|`526430012`|IT Tools|
|`526430013`|Marketing|
|`526430014`|Operations & Supply Chain|
|`526430015`|Internet of Things|
|`526430016`|AI Machine Learning|
|`526430017`|Geolocation|
|`526430018`|Human Resources|

Currently, new business categories can't be configured, but they can be retrieved from the Catalog Business Category (`mspcat_catalogbusinesscategory`) global choice.

### CatalogFileAsset

These properties define a file referenced in the [CatalogItemDefinition](#catalogitemdefinition) `packageFile` and the [OfferDetails](#offerdetails) `small48x48Image`, `large216x216Image`, `useCaseDocument`, `videos`, `documents`, and `screenshots` properties.

|Property|Type|Required|Description|
|--------|----|--------|-----------|
|`name`|string|Yes|Name of the file.|
|`filesaslink`|uri|Yes|Link to download the file. If the link requires authentication, provide a [shared access signature (SAS) URL](/azure/storage/common/storage-sas-overview). |

### PersonContactInformation

These properties define people in the catalog item [OfferDetails](#offerdetails) `engineeringName` and `supportName` properties.

|Property|Type|Required|Description|
|--------|----|--------|-----------|
|`firstName`|string|No|Person first name.|
|`lastName`|string|Yes|Person family name.|
|`email`|string|Yes|Person email address.|
|`phoneNumber`|string|No|Person phone number.|
