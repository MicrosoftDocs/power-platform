---
title: "How the inventory Cloud Flows work"
description: "The core components of the CoE contains many flows relating to inventory. Learn how they work in this article."
author: stjeffer
manager: phtopnes

ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/28/2022
ms.subservice: guidance
ms.author: stjeffer
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# How the inventory Cloud Flows work

The CoE Starter Kit is broken down into components.  The 'Core Component' contains many cloud flows that this document provides detailed guidance for:

- Dependencies.
- Long running operation.
- Communications.
- Triggers.

## Cloud flow dependencies

The following table details Cloud flow dependencies:

| Cloud flow title | Dependency Cloud flow title |
|------------|------------|
| Helper - Maker Check | Admin - Sync Template v3 (Flows) <br> Admin - Sync Template v3 (Desktop Flows) <br> Admin - Sync Template v3 (Desktop Flows) <br> Admin - Sync Template v3 (Model Driven Apps) <br> Admin - Sync Template v3 (Portals) <br> Admin - Sync Template v3 (PVA) <br> Admin - Sync Template v3 <br> Admin - Sync Template v3 (Apps) <br> Admin - Sync Template v3 (Custom Connectors) <br> Admin - Compliance detail request v3 <br> Env Request - Create Approved Environment <br> Env Request - Notify requestor when rejected <br> Helper - CloudFlowOperations <br> Admin - Capacity Alerts |
| Helper - Send Email | Admin - Compliance detail request v3 <br> Admin - Sync Template v3 (Sync Flow Errors) <br> Welcome Email v3 |
| DLP Request - Sync Policy to Dataverse (Child) | DLP Request - Sync new policy <br> DLP Request - Sync Shared Policy |
| DLP Request - Apply policy to Environment (Child) | DLP Request - Process Approved Policy Change |
| Cleanup Helper - Power Apps User Shared | Cleanup - Admin - Sync Template v3 (Power Apps User Shared With) |
| Cleanup - Admin - Sync Template v3 (Check Deleted) | Cleanup Helper - Check Deleted (Canvas Apps) <br> Cleanup helper - Check Deleted (Cloud FLows) <br> Cleanup Helper - Check Deleted (Model Driven Apps) <br> Cleanup Helper - Check Deleted (PVA) <br> Cleanup Helper - Check Deleted (Custom Connectors) |

## Long running Cloud flows

The following table shows the cloud flows which need to access everything in your tenant.  The time these operations take depends on the number of apps, flows and other components:

| Cloud flow title | Long running detail |
|------------------|---------------------|
| Cleanup - Admin - Sync Template v3 (Check Deleted) | REASON HERE |
| Cleanup - Admin - Sync Template v3 (Power Apps User Shared With) | REASON HERE |
| Admin - Sync Template v3 | The first run of this sync flow performs a full inventory of all apps, flows, etc in your tenant.  Depending on the corpus, this could take a long time to complete. |

## Communication Cloud flows

Some flows in the core components solution send communications, either:

- Email
- Chat

>[!NOTE]Flow communications can be disabled by setting the ProductionEnvironment environment variable to false

The table below identifies the Cloud flows that send notifications to users:

| Cloud flow title | Notification type | Audience | Additional comment
|-----------------------|------------|----------|---|
| Admin - Welcome Email v3 | Email | The user who created the app |  |
| Admin - Sync Template v3 (Sync Flow Errors) | Email | Admin email address |  |
| Env Request - Cleanup Environments | Email | TBD |  Only sends warning mails on Mondays |
| Env Request - Notify admin when new request submitted | Email | TBD | |
| Env Request - Notify requestor when rejected | Email | TBD | |
