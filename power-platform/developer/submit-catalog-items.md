---
title: "View, Install and Submit catalog items (Preview)"
description: "Learn how to submit items to your organization's catalog of templates and components."
author: samathur
ms.subservice: developer
ms.author: samathur
ms.date: 05/16/2023
ms.reviewer: jdaly
ms.topic: article
search.audienceType: 
  - developer
contributors:
 - JimDaly
---
# Submit catalog items (Preview)

Application makers and developers can submit items to the catalog so that they can help their colleagues solve business problems.

## Get started

1. [Install PAC CLI](#install-pac-cli)
1. [Get access to catalog as Submitter or Reader](#get-access-to-catalog-as-submitter-or-reader)

### Install PAC CLI

Follow the steps to install Power Platform CLI found here: [Install Microsoft Power Platform CLI](cli/introduction.md#install-microsoft-power-platform-cli)

Use the [pac catalog](cli/reference/catalog.md) commands to interact with the catalog.

### Get access to catalog as Submitter or Reader

Contact your administrator to grant access to the catalog. You need the **Catalog Submitter** security role to be associated with your user account or a team that you belong to. More information: [Setup Users](catalog.md#setup-users)

## Use the catalog

After you have installed the PAC CLI, you must create an authentication profile using the [pac auth create](cli/reference/auth.md#pac-auth-create) command. Using the authentication profile for the environment where the catalog is installed, you can perform the following tasks using PAC CLI:

1. [View available catalogs in your tenant](#view-available-catalogs-in-your-tenant). Requires an admin auth profile. 
1. [View items in the catalog](#view-items-in-the-catalog)
1. [Install items from the catalog](#install-items-from-the-catalog)
1. [Submit items to the catalog](#submit-items-to-the-catalog)
1. [Check status of catalog submissions](#check-status-of-catalog-submissions)

## View available catalogs in your tenant

Use the [pac admin list](cli/reference/admin.md#pac-admin-list) command to view the catalogs available in your tenant.

When using this command, you must use the following `--application-id` parameter with the value `83a35943-cb41-4266-b7d2-81d60f383695`.

```powershell
pac admin list --application-id 83a35943-cb41-4266-b7d2-81d60f383695
```

`83a35943-cb41-4266-b7d2-81d60f383695` is the application ID associated with the catalog. The requirement to include this value will be removed in a future update.


## View items in the catalog

Use the [pac catalog list](cli/reference/catalog.md#pac-catalog-list) command to view items in the catalog.

```powershell
pac catalog list 
Connected to... TestCatalog
Connected as user@domain
Listing all published catalog items from the current Dataverse Organization...
Catalog Item Name                   Publisher Name            Catalog Item Id                      Revision Id                          Version Status
Contoso Conference Custom Connector Catalog Conferences Team  ContosoConferencesCustomConnector    4e882dd6-74f3-ed11-8849-000d3a0a286b 1.0.0.1 Published
Contoso Themed Components           ContosoPublisher          ContosoThemedComponents              efbc469d-f1b2-ed11-83fd-000d3a0a2d9d 1.0.0.1 Published
```

## Install items from the catalog

Use the [pac catalog install](cli/reference/catalog.md#pac-catalog-install) command to install items from the catalog.

```powershell
pac catalog install -tu https://<your org>.crm.dynamics.com/ -cid ContosoConferencesCustomConnector
Connected to... TestCatalog
Connected as user@domain
ContosoConferencesCustomConnector
Tracking id for this installation is 202012ec-80f3-ed11-8849-000d3a0a2d9d
```

## Submit items to the catalog

To submit an item to the catalog, you need:

- A solution or package deployer package containing the item you want to submit
- A submission metadata JSON document

Use the [pac catalog create-submission](cli/reference/catalog.md#pac-catalog-create-submission) command to get an example submission metadata JSON document. You must edit this document and more submission attributes can be added. More information: [Submission Attributes](#submission-attributes)

After your submission metadata JSON document is ready, use the [pac catalog submit](cli/reference/catalog.md#pac-catalog-submit) command to submit it.

```powershell
pac catalog submit -p "BuildDemoSubmission.json" -sz "ContosoConference_1_0_0_1_managed.zip"
Creating package for catalog submit request...
Connected to... TestCatalog
Connected as user@domain
Tracking id for this submission is 0e6b119d-80f3-ed11-8849-000d3a0a2d9d
```

## Check status of catalog submissions

Use the [pac catalog status](cli/reference/catalog.md#pac-catalog-status) command to check the status of catalog submissions.

```powershell
pac catalog status --tracking-id 0e6b119d-80f3-ed11-8849-000d3a0a2d9d --type submit
Connected to... TestCatalog
Connected as user@domain
Status of the Submit request: Submitted
```

## Submission Attributes

Before you can submit items to a catalog, you must prepare a JSON document that describes the items you want to submit. More information: [Submit items to the catalog](#submit-items-to-the-catalog)

To help you, the [pac catalog create-submission](cli/reference/catalog.md#pac-catalog-create-submission) command generates the following `submission.json` file:

<!-- Why have a command? Is any unique data included here?
Why not just copy this from the documentation?

The CLI has a pattern to enable initialization of settings files. This was done to help users quickly create a submissions file.

TODO:
But why is this valuable?
Why couldn't they (or shouldn't they) just copy the JSON below?
Are there any values generated by this JSON that they shouldn't change? Like sourcePortal?
 -->

```json
{
  "modelVersion": "1.0.0.0",
  "sourcePortal": 526430005,
  "operation": "CreateOrUpdate",
  "businessJustification": "Business Justification",
  "publisherDetails": {
    "publisherId": "MyPublisherId",
    "publisherDisplayName": "Publisher Display Name"
  },
  "catalogItemDefinition": {
    "id": "MyItemId",
    "displayName": "Catalog Item Display Name",
    "description": "Catalog Item Description",
    "offer": {
      "type": "Component_Collection",
      "deploymentType": "Normal",
      "engineeringName": {
        "firstName": "Eng",
        "lastName": "User",
        "email": "user@test.com",
        "phoneNumber": "999-111-1234"
      },
      "supportName": {
        "firstName": "Support",
        "lastName": "User",
        "email": "user@test.com",
        "phoneNumber": "999-111-1234"
      }
    }
  }
}
```
You need to edit this file to submit an item. See the following instructions about the items to add or edit.

Here's an example submission created from the JSON above.

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



### Required Data

The following items are required for all submissions:

- [Publisher](#publisher)
- [Catalog Item](#catalog-item)
- [Engineering contact](#engineering-contact)
- [Support contact](#support-contact)

#### Publisher

Creates a publisher record that can be associated to one or more Microsoft Azure Active Directory (Azure AD) groups containing authorized users who can make updates to the Catalog item going forward.

Don't confuse this term with *Solution Publisher*. Catalog item publisher is entirely a different concept.

You need to provide the ID publisher `DisplayName` at a minimum. ID can be any string value. System checks if that publisher exists, else creates it and assigns an ID.

Example: HR IT team of developers can create a publisher and ID the developers using an Azure AD group. 

<!-- 
jdaly: I don't think we need this.

```json
Publisher Id: String 
Publisher Name: String
upn: List of UPNs

Upn: 
UPN: string, example "bob@foo.com"
userOID guid 
action: Select from "Add" or "Remove"

publisherAADGroupOIDS (optional)
action: Select "Add" or "Remove" 
groupName: string (required)
groupOID:guid (required)
groupType: Select from "Security" or "Modern"
``` -->

Here's an example of a publisher record:

```json
"publisherDetails": {
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

#### Catalog Item

The actual power platform solution (package is what is stored in the Catalog) 

`id` and `displayName` are mandatory. `description` and `businessCategories` are optional. Seeded Business Categories list of value is in the appendix. ComponentUsedInApplication is for future use only.

<!-- 

TODO: appendix? 
Where do people get the businessCategories values?
-->

<!-- 
jdaly: I don't think this is necessary with the other example:

```json
id: String  (generated if not provided)
displayName: String (required)
description: String
offer: businessCategories 
type: "Application" or "Component_Collection"
deploymentType: "Normal" or "Template"
``` -->


<!-- 

TODO: names like 'fileSasLink' suggest that the file MUST be a SAS link.

> What is the SAS URL?
A shared access signature (SAS) is a URI that grants restricted access rights to Azure Storage resources. 

Does it have to be a SAS URL?
Or can it be a URL that doesn't require authorization to access?
 
 -->


Here is an example of a catalog item including its `engineeringName` and `supportName` contacts which are mandatory.

<!-- 

TODO> this example includes values like `attributebName` that are clearly not correct.
All the rest are suspect.
Examples below have different case, i.e. AttributeName. Which is correct?

 -->

```json
"catalogItemDefinition": {
   "id": "ContosoTravelsApp",
   "displayName": "Contoso Travel Expense App",
   "description": "Submit expenses on the go!",
   "offer": {
   "businessCategories": [526430000, 526430001, 526430002],
   "type": "Component_Collection",  // or "Application"
   "deploymentType": "Normal", // or "Template"
   "componentsUsedInApplication": [1, 3, 4],
   "small48x48Image": {
      "name": "Small48Image",
      "fileSasLink": "http_pub_available_link",
      "logicalName": "mspcat_files",
      "recId": "54ab9862-9e54-41e6-8a39-0bbaa68ea7a0",
      "attributebName": "filAttrib"
   },
   "large216x216Image": {
      "name": "Large216image2",
      "fileSasLink": "http_pub_available_link",
      "logicalName": "mspcat_files",
      "recId": "54ab9862-9e54-41e6-8a39-0bbaa68ea7a0",
      "attributebName": "filAttrib"
   },
   "documents": [
      {
         "name": "ImaNewfile",
         "fileSasLink": "http_pub_available_link",
         "logicalName": "mspcat_Files",
         "recId": "b0d034f5-0d61-42d9-8089-0f0e1d1a944e",
         "attributebName": "TESTAttrib"
      },
      {
         "name": "ImaNewfile2",
         "fileSasLink": "http_pub_available_link",
         "logicalName": "mspcat_Files",
         "recId": "b0d034f5-0d61-42d9-8089-0f0e1d1a944e",
         "attributebName": "TESTAttrib"
      }
   ],
   "helpLink": "https://www.microsoft.com",
   "privacyPolicyLink": "https://www.microsoft.com",
   "legalTerms": "https://www.microsoft.com",
   "engineeringName": {
      "firstName": "Eng",
      "lastName": "User",
      "email": "test@test.com",
      "phoneNumber": "999-111-1234"
   },
   "supportName": {
      "firstName": "Support",
      "lastName": "User",
      "email": "test1@test.com",
      "phoneNumber": "999-111-1234"
   }
   }
}
```


#### Engineering contact

Developer Product contact

Contact that the consumer of catalog item can reach out to if they have technical questions to extend or reuse the app for another purpose.

```json
"engineeringName": {
   "firstName": "String"
   "lastName": "String (required)"
   "email": "String (required)"
   "phoneNumber": "String"
}
```

#### Support contact

IT Biz Support Specialist

Can be same as Engineering Contact that the consumer of catalog item can reach out to if they run into issues with the said application

```json
"supportName": {
   "firstName": "String"
   "lastName": "String (required)"
   "email": "String (required)"
   "phoneNumber": "String"
}
```

### Recommended Data

The following items are highly recommended, but not required.

- [small48x48image](#small48x48image)
- [Documents](#documents)
- [Help Link](#help-link)


#### small48x48image

Provide information of the icon to be displayed in Maker/ Other discovery UX
If you don't provide this image a system default icon is used.

```json
"small48x48image":{
   "name": "String",
   "fileSasLink": "Fully qualified publicly accessible url",
   "LogicalName": "String for future use ignored",
   "RecId": "Guid for future use ignored",
   "AttributeName": "String for future use ignored"
}
```

#### Documents

You can pass screenshots here of your Application to help Makers ID if this App provides functionality/ capability they're looking for.

Number #1 thing people do before downloading an App or template is to look at its images/ screenshots to gauge capabilities vs reading the description

```json
{
   "name": "String",
   "fileSasLink": "Fully qualified publicly accessible url",
   "logicalName": "String for future use ignored",
   "recId": "Guid for future use ignored",
   "attributeName": "String for future use ignored"
}
```


#### Help Link

URL link to help documentation

Fully qualified URLs your users are able to access. These URLs can be links to internal docs or sharepoint resources.

<!-- TODO why is this example below? Help link looks like a single string value -->

```json
name: String
fileSasLink: fully qualified publicly accessible url
LogicalName: string, for future use, ignored
RecId: guid, for future use, ignored
AttributeName: string, for future use, ignored
```

### The following items are optional

- [Source Portal](#source-portal)
- [Operation](#operation)
- [Business Justification](#business-justification)
- [large216x216Image](#large216x216image)
- [Privacy policy](#privacy-policy)
- [Legal terms](#legal-terms)
- [Package](#package)

#### Source Portal

Source of submission

List of values.

When submitting from the PAC CLI please use `526430005` as the Source Portal value. For other sources, use 526430000.

<!-- TODO why bother documenting these if people can't use them? -->

The following values are reserved for future use:
PACBuildTask: `526430006` <br>
PowerAutomateMakerPortal: `526430001` <br>
PowerPlatformMakerPortal: `526430002` <br>
PowerVirtualAgentsMakerPortal: `526430003` <br>
PowerPlatformAdminAPI: `526430004` <br>

#### Operation

Possible values:

- `CreateOrUpdate`
- `Create`
- `Update`
- `Disabled`

Use `CreateOrUpdate` for new submissions.

```json
  "operation": "CreateOrUpdate",
```

#### Business Justification

Explains the business value created by this Catalog item. This information is visible to Approvers and appears in the planned consumption experience in Maker Discovery user experience.

Users can say their submission helps with cost reduction or productivity, for example. Some organizations require certain classes of value and those values can be entered here.

String can contain HTML, or Rich Text (RTF)

```json
"businessJustification": "Submit your travel expenses!"
```

#### large216x216Image

Provide information of the icon to be displayed in Maker/ Other discovery UX

Some user experiences uses larger icons to render cards for discovery

```json
name: String
fileSasLink: fully qualified publicly accessible url
LogicalName: string, for future use, ignored
RecId: guid, for future use, ignored
AttributeName: string, for future use, ignored
```

<!-- TODO The case of these properties is different. Is it RecId or recId? -->

```json
      "large216x216Image": {
        "name": "Large216image2",
        "fileSasLink": "https://mywebsite/largeicon.jpeg",
        "logicalName": "mspcat_files",
        "recId": "54ab9862-9e54-41e6-8a39-0bbaa68ea7a0",
        "attributebName": "filAttrib"
      },
```

#### Privacy policy

URL link to pertinent policies

Policies regarding careful usage of the component or application being submitted

```json
"privacyPolicyLink": "https://www.mycompany.com/privacy.html"
```

#### Legal terms

URL link to pertinent terms and conditions

Any legal terms/ internal guidance for evaluation of the consumer of the catalog item

```json
"legalTerms": "https://www.mycompany.com/legalterms.html"
```

#### Package

Only needed when providing a Package as input to submission. 

packageFile is a public accessible link

```json
name: String
fileSasLink: fully qualified publicly accessible url
```
