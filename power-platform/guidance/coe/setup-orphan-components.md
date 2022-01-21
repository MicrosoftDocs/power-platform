---
title: "Set up clean-up for orphaned objects | MicrosoftDocs"
description: "Learn how to set up the clean-up for orphaned objects components of the CoE Starter Kit"
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/10/2022
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Set up clean-up for orphaned objects

This article will help you to set up the clean-up for orphaned objects.

You use this functionality to identify objects where the maker has left the organization, and ask managers to maintain permissions of their former employees.

>[!IMPORTANT]
>This article assumes you have [installed the governance components solution](before-setup-gov.md), and you have your [environment set up](setup.md#create-your-environment) and are signed in with the [correct identity](setup.md#what-identity-should-i-install-the-coe-starter-kit-with).

## Turn on flows

Turn on the following flows, which are installed as part of the governance components solution:

- [Request Orphaned Objects Reassigned (Child)](governance-components.md#request-orphaned-objects-reassigned-child)
- [Request Orphaned Objects Reassigned (Parent)](governance-components.md#request-orphaned-objects-reassigned-parent)

## It looks like I found a bug with the CoE Starter Kit; where should I go?

To file a bug against the solution, go to [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
