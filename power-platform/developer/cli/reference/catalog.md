---
title: Microsoft Power Platform CLI catalog command group| Microsoft Docs
description: "Describes commands and parameters for the Microsoft Power Platform CLI catalog command group."
keywords: "pac cli"
ms.subservice: developer
author: laneswenka
ms.author: laswenka
ms.reviewer: jdaly
ms.topic: generated-reference
contributors: 
 - JimDaly
---
<!-- 
Do not edit this file. 
This file is generated by a program and any changes will be overwritten when this topic is re-generated.
Use the include files to add additional content to this topic.
-->
# pac catalog

Commands for working with Catalog in Power Platform

[!INCLUDE [catalog-intro](includes/catalog-intro.md)]

## Commands

|Command|Description|
|---------|---------|
|[pac catalog create-submission](#pac-catalog-create-submission)|Create catalog submission document. Note: This command will be removed in a future release.|
|[pac catalog install](#pac-catalog-install)|Install a catalog item to the target environment.|
|[pac catalog list](#pac-catalog-list)|List all published catalog items from the current Dataverse organization.|
|[pac catalog status](#pac-catalog-status)|Get status of the catalog install/submit request.|
|[pac catalog submit](#pac-catalog-submit)|Submit catalog approval request.|
|[pac catalog update](#pac-catalog-update)|Update settings for the catalog.|


## pac catalog create-submission

Create catalog submission document. Note: This command will be removed in a future release.

[!INCLUDE [catalog-create-submission-intro](includes/catalog-create-submission-intro.md)]


### Optional Parameters for catalog create-submission

#### `--path` `-p`

Path to catalog submission document

[!INCLUDE [catalog-create-submission-remarks](includes/catalog-create-submission-remarks.md)]

## pac catalog install

Install a catalog item to the target environment.

[!INCLUDE [catalog-install-intro](includes/catalog-install-intro.md)]


### Required Parameters for catalog install

#### `--catalog-item-id` `-cid`

Catalog item to be installed on the target environment.


### Optional Parameters for catalog install

#### `--environment` `-env`

Url or ID of the environment that has catalog installed. When not specified, the active organization selected for the current auth profile will be used.

#### `--poll-status` `-ps`

Poll to check status of your request

This parameter requires no value. It's a switch.

#### `--settings` `-s`

Runtime Package Settings for the installation framework to execute. The format of the string must be `key=value|key=value`.

**Note**: The format of the string must be `key=value|key=value`.

#### `--target-env` `-te`

Url or ID of the target environment for catalog item installation

#### `--target-url` `-tu`

**Deprecated**: Use `--target-env` instead.
#### `--target-version` `-tv`

Target version to install. If left empty, the published version is selected.

[!INCLUDE [catalog-install-remarks](includes/catalog-install-remarks.md)]

## pac catalog list

List all published catalog items from the current Dataverse organization.

[!INCLUDE [catalog-list-intro](includes/catalog-list-intro.md)]


### Optional Parameters for catalog list

#### `--catalog-item-id` `-cid`

Catalog item ID to search for. When catalog item ID is used, catalog item name is ignored.

#### `--catalog-item-name` `-n`

Catalog item name to search for.

#### `--environment` `-env`

Url or ID of the environment that has catalog installed. When not specified, the active organization selected for the current auth profile will be used.

#### `--include-active` `-ia`

Include active items.

This parameter requires no value. It's a switch.

[!INCLUDE [catalog-list-remarks](includes/catalog-list-remarks.md)]

## pac catalog status

Get status of the catalog install/submit request.

[!INCLUDE [catalog-status-intro](includes/catalog-status-intro.md)]


### Required Parameters for catalog status

#### `--tracking-id` `-id`

Request tracking ID.

#### `--type` `-t`

Request type

Use one of these values:

- `Install`
- `Submit`


### Optional Parameters for catalog status

#### `--environment` `-env`

Url or ID of the environment that has catalog installed. When not specified, the active organization selected for the current auth profile will be used.

[!INCLUDE [catalog-status-remarks](includes/catalog-status-remarks.md)]

## pac catalog submit

Submit catalog approval request.

[!INCLUDE [catalog-submit-intro](includes/catalog-submit-intro.md)]


### Required Parameters for catalog submit

#### `--path` `-p`

Path to catalog submission document


### Optional Parameters for catalog submit

#### `--environment` `-env`

Url or ID of the environment that has catalog installed. When not specified, the active organization selected for the current auth profile will be used.

#### `--package-zip` `-pz`

Path to package zip file.

#### `--poll-status` `-ps`

Poll to check status of your request

This parameter requires no value. It's a switch.

#### `--solution-zip` `-sz`

Path to solution zip file.

[!INCLUDE [catalog-submit-remarks](includes/catalog-submit-remarks.md)]

## pac catalog update

Update settings for the catalog.

[!INCLUDE [catalog-update-intro](includes/catalog-update-intro.md)]


### Required Parameters for catalog update

#### `--path` `-p`

Path to catalog settings document


### Optional Parameters for catalog update

#### `--environment` `-env`

Url or ID of the environment that has catalog installed. When not specified, the active organization selected for the current auth profile will be used.

[!INCLUDE [catalog-update-remarks](includes/catalog-update-remarks.md)]

[!INCLUDE [catalog-remarks](includes/catalog-remarks.md)]

### See also

[Microsoft Power Platform CLI Command Groups](index.md)<br />
[Microsoft Power Platform CLI overview](../introduction.md)