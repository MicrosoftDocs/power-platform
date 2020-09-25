---
title: "Diagnose user access in an environment  | MicrosoftDocs"
description: About diagnose user access in an environment 
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/25/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Diagnose user access in an environment 

Multiple factors affect user access to Common Data Service environments. The "Run diagnostics" feature allows administrators to assess user access to an environment and provides details and mitigation suggestions as to why a user can or can't access a Common Data Service environment. 

A user’s access to a Common Data Service environment is determined through the following criteria.

The user: 

1.	must be enabled for sign-in in Azure Active Directory.
2.	must have a valid license that has a Dynamics or Power Platform recognized service plan or the environment must have active per app plans.
3.	must be a member of the environment’s Azure Active Directory Group (if one has been associated with the environment).
4.	must have at least one Common Data Service security role assigned directly to them or to a [group team ](manage-teams.md#about-group-teams) they are a member of.

Users’ level of access within the environment and to the resources (apps and data) in the environment is determined by the privileges defined in the security roles assigned to them. Their access mode being Administrative or Read-Write also determines their level of access within an environment.

To run user access diagnostics on a user in an environment with Common Data Service database:

