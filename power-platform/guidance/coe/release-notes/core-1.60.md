---
title: "Release notes and latest version of the CoE starter kit Core components 1.55 | MicrosoftDocs"
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

# Released version Core Components 1.60

## Introduction

Version 1.60 for the CoE Starter Kit Core Components is now available. This article describes the updates, including the new features and the fixes to existing functionality, included in this release. This version was first made available on August 14, 2020.

## Table changes

Tables **Chatbot, Flow and PowerApps Connector** have been updated to include columns that support the Compliance process of the [Governance Components](governance-1.21.md)

- Admin Requirement - Risk Assessment
- Admin Requirement - Reviewed
- Maker Requirement - Business Justification
- Maker Requirement - Business Impact
- Maker Requirement - Dependencies
- Maker Requirement - Access Management

## Power Platform Admin View

The Power Platform Admin View has been updated to show new icons for Virtual Agents, Audit Log and Power Platform Users.

The Flow, Connector and Chatbot main forms have been updated with an Audit tab to enable admins to validate maker requirements, and add admin requirements.

The Flow, Connector and Chatbot tables have new Admin Review views, similar to the PowerApps App Admin Review view.

Business Process Flows to manage the Audit process for Flow, Connector and Chatbot tables have been added.

## Bug Fixes

- Increase field lengths in Flow Resources table for more robust handling
- Sync Flows adjusted to short circuit when user doesn’t have permissions or the object of interest do not exist in the target environment.
- CDS meta data stored in Environments table and called from Sync Flows to reduce calls and reduce logic redundancy.
