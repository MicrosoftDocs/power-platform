---
title: "Release notes and latest version of the CoE starter kit Core components 1.54 | MicrosoftDocs"
description: "Release notes and latest version of the CoE Starter Kit."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/10/2020
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Released version Core Components 1.54

## Introduction

Version 1.54 for the CoE Starter Kit Core Components is now available. This article describes the updates, including the new features and the fixes to existing functionality, included in this release. This version was first made available on July 24, 2020.

## Bug Fixes

This version fixed a bug in the **Admin | Sync Template v2 (Power Apps User Shared With)** flow, which caused fetching user permissions in Default environment to fail.

This version fixed a bug in the **Admin | Sync Template v2 (Model Driven Apps)** flow, which caused environments with crm urls not ending in .crm to fail to sync. Example impacts are environments like those with *crm4* in the url.

This version fixed a bug in the **Admin | Sync Template v2 (PVA)** flow, which caused a failure when syncing a chatbot  component’s flow, when that flow has not yet been added to the Flow table.
