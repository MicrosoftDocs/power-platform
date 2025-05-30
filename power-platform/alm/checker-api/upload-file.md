---
title: "Upload a file for analysis | Microsoft Docs"
description: "Read how to form a POST request using the Power Apps checker web API to retrieve to upload a file to analyze."
ms.custom: ""
ms.date: 06/09/2020
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: how-to
applies_to: 
  - "Dynamics 365 (online)"
ms.assetid: 08d7d73b-1377-4d3f-b8ef-5c89b19dd735
caps.latest.revision: 21
author: "mhuguet" # GitHub ID
ms.subservice: alm
ms.author: "michu"
ms.reviewer: "pehecke"
search.audienceType: 
  - developer
---

# Upload a file for analysis

The initiation of an analysis job requires a path to an Azure blob that is accessible by URL. The ability to upload a file to Azure blob storage in the specified geography using the upload service is provided. It is not required that the upload API be used in order to run analysis. You can upload using a `POST` request to the following: `[Geographical URI]/api/upload?api-version=1.0`. Uploading a file up to 30 MB in size is supported. For anything larger you will need to provide your own externally accessible Azure storage and SAS URI.

> [!NOTE]
> This API does require an OAuth token.

<a name="bkmk_headers"></a>

## Headers

|Name|Type|Expected value|Required?|
|---|---|---|---|
|Authorization|string|The OAuth 1 bearer token with Microsoft Entra ID Application ID claim.|yes|
|x-ms-tenant-id|GUID|The ID of the tenant for the application.|yes|
|x-ms-correlation-id|GUID|The Identifier for the analysis run. You should provide the same ID for the entire execution (upload, analyze, status).|yes|
|Content-Type|object|multipart/form-data|yes|
|Content-Disposition|object|Include the name and filename parameters, for example:<br />`form-data; name="solution1.zip"; filename="solution1.zip"`|yes|

<a name="bkmk_responses"></a>

## Expected responses

|HTTP status code|Scenario|Result|
|---|---|---|
|200|Upload was a success|No result body|
|400|A non zip file was sent, incorrect parameters, or a file was included with a virus|No result body|
|413|File is too large|No result body|

<a name="bkmk_upload"></a>

## Example: upload a file

This example demonstrates how a file can be uploaded that is to be analyzed.

**Request**

```http
POST [Geographical URI]/api/upload
Accept: application/json
x-ms-correlation-id: aaaa0000-bb11-2222-33cc-444444dddddd
x-ms-tenant-id: aaaabbbb-0000-cccc-1111-dddd2222eeee
Content-Type: multipart/form-data
Content-Disposition: form-data; name=mySolution.zip; filename=mySolution.zip
```

**Response**

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

["https://mystorage.blob.core.windows.net/solution-files/0a4cd700-d1d0-4ef8-8318-e4844cc1636c/mySolution.zip?sv=2017-11-09&sr=b&sig=xyz&se=2019-06-11T19%3A05%3A20Z&sp=rd"]
```

### See also

[Use the Power Apps checker web API](overview.md)<br />
[Retrieve the list of rulesets](retrieve-rulesets.md)<br />
[Retrieve the list of rules](retrieve-rules.md)<br />
[Invoke analysis](analyze.md)<br />
[Check for analysis status](check-status.md)<br />

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
