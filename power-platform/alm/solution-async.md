---
title: "Import and export solutions using an asynchronous job | Microsoft Docs"
description: "Learn about using an asynchronous job for import and export of large solution files."
keywords: 
author: mikkelsen2000
ms.author: pemikkel
manager: kvivek
ms.custom: ""
ms.date: 01/20/2021
ms.reviewer: "pehecke"
ms.service: powerapps
ms.topic: "article"
search.audienceType: 
  - developer
search.app: 
  - PowerApps
  - D365CE
---

# Import and export solutions using an asynchronous job

Have you ever run into the situation during the import or export of a large solution where the operation times out? If so, you may be a candidate for performing the solution import/export using an asynchronous job. This topic describes how to initiate the asynchronous import or export job using the SDK and Web APIs.

## Solution import

`ImportSolution` is the action (or message) that performs the synchronous import operation. To execute the import operation as an asynchronous job use `ImportSolutionAsync`.

| Operation | Web API | SDK API |
| --- | --- | --- |
| Import a solution | [ImportSolutionAsync](/dynamics365/customer-engagement/web-api/importsolution) | [ImportSolutionAsyncRequest](/dotnet/api/microsoft.crm.sdk.messages.importsolutionrequest) |

## Solution export

`ExportSolution` is the action (or message) that performs the synchronous export operation. To execute the export operation as an asynchronous job use `ExportSolutionAsync`.

| Operation | Web API | SDK API |
| --- | --- | --- |
| Export a solution | [ExportSolutionAsync](/dynamics365/customer-engagement/web-api/exportsolution) | [ExportSolutionAsyncRequest](/dotnet/api/microsoft.crm.sdk.messages.exportsolutionrequest) |
