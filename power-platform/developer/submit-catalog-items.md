---
title: "Using the catalog with Power Platform CLI"
description: "Learn how to submit items to your organization's catalog of templates and components."
author: derekkwanpm
ms.author: derekkwan
ms.subservice: developer
ms.date: 09/11/2024
ms.reviewer: jdaly
ms.topic: article
search.audienceType: 
  - developer
contributors:
 - JimDaly
---
# Using the catalog with Power Platform CLI

The catalog in Power Platform enables developers and makers to:

- Crowd-source and find templates and components within their environment easily.
- Find and install the latest and authoritative version of a component.
- Get started with templates and components that provide immediate value.

Before you can work with catalog items, you must install and configure it. More information: [Administer the catalog](../admin/administer-catalog.md)

Application makers and developers can submit items to the catalog so that they can help their colleagues solve business problems.

> [!IMPORTANT]
> Managed environments are required to submit items to the catalog. However, you can install items from any environments. [Learn more about managed environments](../admin/managed-environment-overview.md)

## Get started

1. [Install Power Platform CLI](#install-power-platform-cli)
1. [Get access to catalog as submitter or reader](#get-access-to-catalog-as-submitter-or-reader)

### Install Power Platform CLI

Follow the steps to install Power Platform CLI: [Install Microsoft Power Platform CLI](cli/introduction.md#install-microsoft-power-platform-cli)

<!-- Use the [pac catalog](cli/reference/catalog.md) commands to interact with the catalog.-->

### Get access to catalog as submitter or reader

Contact your administrator to grant access to the catalog. You need the **Catalog Submitter** security role to be associated with your user account or a team that you belong to. More information: [Edit user access](../admin/administer-catalog.md#edit-user-access)

## Use the catalog

After you have installed the Power Platform CLI, you must create an authentication profile using the [pac auth create](cli/reference/auth.md#pac-auth-create) command. Using the authentication profile for the environment where the catalog is installed, you can perform the following tasks using PAC CLI:

1. [View available catalogs in your tenant](#view-available-catalogs-in-your-tenant)
1. [View items in the catalog](#view-items-in-the-catalog)
1. [Install items from the catalog](#install-items-from-the-catalog)
1. [Submit items to the catalog](#submit-items-to-the-catalog)
1. [Check status of catalog submissions](#check-status-of-catalog-submissions)

## View available catalogs in your tenant

Use the [pac admin list](cli/reference/admin.md#pac-admin-list) command to view the catalogs available in your tenant.

> [!NOTE]
> This command requires an administrator authentication profile.

When using this command, you must use the following `--application` parameter with the value `83a35943-cb41-4266-b7d2-81d60f383695`.

```powershell
pac admin list --application 83a35943-cb41-4266-b7d2-81d60f383695
```

`83a35943-cb41-4266-b7d2-81d60f383695` is the application ID associated with the catalog.

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

Use the [pac catalog create-submission](cli/reference/catalog.md#pac-catalog-create-submission) command to get an example submission metadata JSON document. You must edit this document and more submission attributes can be added. More information: [Submission attributes](#submission-attributes)

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

## Submission attributes

Before you can submit items to a catalog, you must prepare a JSON document that describes the items you want to submit. More information: [Submit items to the catalog](#submit-items-to-the-catalog)

To help you, the [pac catalog create-submission](cli/reference/catalog.md#pac-catalog-create-submission) command generates a sample `submission.json` file.

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

### Required data

The following items are required for all submissions:

- [Publisher](#publisher)
- [Catalog item](#catalog-item)
- [Engineering contact](#engineering-contact)
- [Support contact](#support-contact)

#### Publisher

Creates a publisher record that can be associated to one or more Microsoft Entra ID groups containing authorized users who can make updates to the catalog item going forward.

Don't confuse this term with *Solution Publisher*. Catalog item publisher isn't used with solutions.

You need to provide the ID publisher `DisplayName` at a minimum. ID can be any string value. The system checks if that publisher exists, else creates it and assigns an ID.

For example, HR IT team of developers can create a publisher and ID the developers using a Microsoft Entra ID group.

Here's a sample of a publisher record:

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

#### Catalog item

The actual Power Platform solution. A package is what is stored in the catalog.

`id` and `displayName` are mandatory. `description` and `businessCategories` are optional.

Seeded business categories list of value is in the appendix. `ComponentUsedInApplication` is for future use only.

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

#### Engineering contact

Developer product contact.

Contact that the consumer of catalog item can reach out to if they have technical questions to extend or reuse the app for another purpose.

```json
"engineeringName": {
   "firstName": "String"
   "lastName": "String (required)"
   "email": "String (required)"
   "phoneNumber": "String"
}
```

Example

```json
   "engineeringName": {
      "firstName": "John",
      "lastName": "Roon",
      "email": "john@contoso.com",
      "phoneNumber": "999-111-1234"
   },
```

#### Support contact

IT support specialist.

Can be same as the engineering contact that the consumer of a catalog item can reach out to if they run into issues with the application.

```json
"supportName": {
   "firstName": "String"
   "lastName": "String (required)"
   "email": "String (required)"
   "phoneNumber": "String"
}
```

### Recommended data

The following items are highly recommended, but not required.

- [small48x48image](#small48x48image)
- [Documents](#documents)
- [Help Link](#help-link)

#### small48x48image

Provide information of the icon to be displayed in maker or other discovery UI. If you don't provide this image a system default icon is used.

```json
"small48x48image":{
   "name": "String",
   "fileSasLink": "Fully qualified publicly accessible url"
}
```

#### Documents

You can pass screenshots here of your application to help makers identify whether this app provides the functionality or capability they're looking for.

The most common thing people do before downloading an app or template is look at its images and screenshots to understand the capabilities instead of reading the description.

```json
{
   "name": "String",
   "fileSasLink": "Fully qualified publicly accessible url"
}
```

#### Help link

URL link to help documentation.

Fully qualified URLs your users are able to access. These URLs can be links to internal docs or sharepoint resources.

```json
 "helpLink": "https://www.yourcompany.com"
```

### The following items are optional

- [Source Portal](#source-portal)
- [Operation](#operation)
- [Business Justification](#business-justification)
- [large216x216Image](#large216x216image)
- [Privacy policy](#privacy-policy)
- [Legal terms](#legal-terms)

#### Source portal

Source of submission.

When submitting from the Power Platform CLI, use `526430005` as the **Source Portal** value. For other sources, use `526430000`.

#### Business categories

One or more of the business categories can be included in the submission from the list below.

|Code|Description|
|-----|-----|
|**526430000**|Customer Service|
|**526430001**|Project Management|
|**526430002**|Calendar Management & Scheduling|
|**526430003**|Email Management|
|**526430004**|Files & Documentation|
|**526430005**|Notification & Reminders|
|**526430006**|Analytics|
|**526430007**|Collaboration|
|**526430008**|Commerce|
|**526430009**|Finance|
|**526430010**|Compliance & Legal|
|**526430011**|Sales|
|**526430012**|IT Tools|
|**526430013**|Marketing|
|**526430014**|Operations & Supply Chain|
|**526430015**|Internet of Things|
|**526430016**|AI Machine Learning|
|**526430017**|Geolocation|
|**526430018**|Human Resources|

Currently, new business categories can't be configured.

#### Operation

Possible values:

- `CreateOrUpdate`
- `Create`
- `Update`
- `Disabled`

Use `CreateOrUpdate` for new submissions.

```json
  "operation": "CreateOrUpdate"
```

#### Business justification

Explains the business value created by this catalog item. This information is visible to approvers and appears in the planned consumption experience in the maker discovery user experience.

Users can say their submission helps with cost reduction or productivity, for example. Some organizations require certain classes of value and those values can be entered here.

String can contain HTML, or Rich Text (RTF).

```json
"businessJustification": "Submit your travel expenses!"
```

#### large216x216Image

Provide information of the icon to be displayed in the maker or other discovery UI.

Some user experiences uses larger icons to render cards for discovery.

```json
name: String
fileSasLink: fully qualified publicly accessible url
LogicalName: string, for future use, ignored
recId: guid, for future use, ignored
attributeName: string, for future use, ignored
```

An example of the image metadata.

```json
      "large216x216Image": {
        "name": "Large216image2",
        "fileSasLink": "https://mywebsite/largeicon.jpeg"
      },
```

#### Privacy policy

URL link to pertinent policies.

Policies regarding careful usage of the component or application being submitted.

```json
"privacyPolicyLink": "https://www.mycompany.com/privacy.html"
```

#### Legal terms

URL link to pertinent terms and conditions.

Any legal terms or internal guidance for evaluation of the consumer of the catalog item.

```json
"legalTerms": "https://www.mycompany.com/legalterms.html"
```

### See also

[Administer the catalog](../admin/administer-catalog.md)
