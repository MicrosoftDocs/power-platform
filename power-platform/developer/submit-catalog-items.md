---
title: "Submit catalog items (Preview)"
description: "Learn how to submit items to your organization's catalog of templates and components."
author: samathur
ms.subservice: developer
ms.author: samathur
ms.date: 05/09/2023
ms.reviewer: jdaly
ms.topic: article
search.audienceType: 
  - developer
contributors:
 - JimDaly
---
# Submit catalog items (Preview)

Application makers and developers can submit solutions and templates to the catalog so that they can help their colleagues solve business problems.

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

1. [View available catalogs in your tenant](#view-available-catalogs-in-your-tenant)
1. [View items in the catalog](#view-items-in-the-catalog)
1. [Install items from the catalog](#install-items-from-the-catalog)
1. [Submit items to the catalog](#submit-items-to-the-catalog)
1. [Check status of catalog submissions](#check-status-of-catalog-submissions)

## View available catalogs in your tenant

Use the [pac admin list](cli/reference/admin.md#pac-admin-list) command to view the catalogs available in your tenant.

When using this command, you must use the following `--application-id` parameter:

```powershell
pac admin list --application-id 83a35943-cb41-4266-b7d2-81d60f383695
```

`83a35943-cb41-4266-b7d2-81d60f383695` is the application ID associated with the catalog. The requirement to include this value will be removed in a future update.


## View items in the catalog

Use the [pac catalog list](cli/reference/catalog.md#pac-catalog-list) command to view items in the catalog.

```powershell
pac catalog list //TODO
```

## Install items from the catalog

Use the [pac catalog install](cli/reference/catalog.md#pac-catalog-install) command to install items from the catalog.

```powershell
pac catalog install //TODO
```

## Submit items to the catalog

To submit an item to the catalog, you need:

- A solution or package deployer package containing the item you want to submit
- A submission metadata JSON document

Use the [pac catalog create-submission](cli/reference/catalog.md#pac-catalog-create-submission) command to get an example submission metadata JSON document. You must edit this document and more submission attributes can be added. More information: [Submission Attributes](#submission-attributes)

After your submission metadata JSON document is ready, use the [pac catalog submit](cli/reference/catalog.md#pac-catalog-submit) command to submit it.

## Check status of catalog submissions

Use the [pac catalog status](cli/reference/catalog.md#pac-catalog-status) command to check the status of catalog submissions.

```powershell
pac catalog status //TODO
```


## Submission Attributes

The [pac catalog create-submission](cli/reference/catalog.md#pac-catalog-create-submission) command generates the following `submission.json` file:

<!-- Why have a command? Is any unique data included here?
Why not just copy this from the documentation? -->

```json
{
  "modelVersion": "1.0.0.0",
  "sourcePortal": 526430000,
  "operation": "CreateOrUpdate",
  "businessJustification": "Business Justification",
  "publisherDetails": {
    "publisherId": "f3f22fca-5bd3-43f1-bd62-9069a3918631",
    "publisherDisplayName": "Publisher Display Name"
  },
  "catalogItemDefinition": {
    "id": "a17cf4d2-6363-4c7c-bab5-a21b0a771e21",
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
    },
    "packageFile": {
      "name": "FileName.zip",
      "fileSasLink": "File SAS Link HERE"
    }
  }
}
```

You need to edit this file to submit an item. See the following instructions about the items to add or edit.

### Required Data

The following items are required for all submissions:

- [Submission ID](#submission-id)
- [Publisher](#publisher)
- [Catalog Item](#catalog-item)
- [Engineering contact](#engineering-contact)
- [Support contact](#support-contact)

#### Submission ID

Unique identifier for a submission

You can pass a unique string value

```json
//TODO example
```

#### Publisher

Creates a publisher record that can be associated to one or more Microsoft Azure Active Directory (Azure AD) groups containing authorized users who can make updates to the Catalog item going forward.

Don't confuse this term with *Solution Publisher*. Catalog item publisher is entirely a different concept.

You need to provide the ID publisher `DisplayName` at a minimum. ID can be any string value. System checks if that publisher exists, else creates it and assigns an ID. 

Example: HR IT team of developers can create a publisher and ID the developers using an Azure AD group. 

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
```


#### Catalog Item

The actual power platform solution (package is what is stored in the Catalog) 

ID and displayName are mandatory. Description and business categories are optional. Seeded Business Categories list of value is in the appendix. ComponentUsedInApplication is for future use only.

```json
id: String  (generated if not provided)
displayName: String (required)
description: String
offer: businessCategories 
type: "Application" or "Component_Collection"
deploymentType: "Normal" or "Template"
```

#### Engineering contact

Dev/ Product contact

Contact that the consumer of catalog item can reach out to if they have technical questions to extend / reuse the app for another purpose 

```json
firstName: String
lastName: String (required)
email: String (required)
phoneNumber: String
```

#### Support contact

IT/ Biz Support Specialist

Can be same as Engineering Contact that the consumer of catalog item can reach out to if they run into issues with the said application

```json
firstName: String
lastName: String (required)
email: String (required)
phoneNumber: String
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
name: String
fileSasLink: fully qualified publicly accessible url
LogicalName: string, for future use, ignored
RecId: guid, for future use, ignored
AttributeName: string, for future use, ignored
```

#### Documents

You can pass screenshots here of your Application to help Makers ID if this App provides functionality/ capability they're looking for.

Number #1 thing people do before downloading an App or template is to look at its images/ screenshots to gauge capabilities vs reading the description

```json
name: String
fileSasLink: fully qualified publicly accessible url
LogicalName: string, for future use, ignored
RecId: guid, for future use, ignored
AttributeName: string, for future use, ignored
```


#### Help Link

URL link to help documentation

Fully qualified URLs your users are able to access. These URLs can be links to internal docs or sharepoint resources.

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

List of values. Example PACCLI = 526430005

```json
//TODO example
```

#### Operation

Possible values:

- `CreateOrUpdate`
- `Create`
- `Update`
- `Disabled`

`CreateOrUpdate` for new submissions

```json
//TODO example
```

#### Business Justification

Explains the business value created by this Catalog item. This information is visible to Approvers and appears in the planned consumption experience in Maker Discovery UX

User can say their submission helps with Cost reduction or productivity, for example. Some organizations require certain classes of value and those values can be entered here.

String can contain HTML, RTF

```json
//TODO example
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

#### Privacy policy

URL link to pertinent policies

Policies regarding careful usage of the component/ application being submitted

```json
//TODO example
```

#### Legal terms

URL link to pertinent terms and conditions

Any legal terms/ internal guidance for evaluation of the consumer of the catalog item

```json
//TODO example
```

#### Package

Only needed when providing a Package as input to submission. 

packageFile is a public accessible link

```json
name: String
fileSasLink: fully qualified publicly accessible url
```


