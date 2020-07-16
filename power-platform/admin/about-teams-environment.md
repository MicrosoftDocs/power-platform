---
title: "About the Teams environment | MicrosoftDocs"
description: About Teams environment
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/20/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# About the Teams environment

## Lifecycle

- A Teams environment is bound to a team. It’s created during first app acquisition or creation in a team, bound to the Microsoft 365 group. A Teams environment is deleted when a Team is deleted, or all apps deleted.​
- The Microsoft 365 group associated with a Teams environment cannot be edited and it’s only controlled by Teams.​
- Teams  environments will be available in a separate view/filter in the Power Platform admin center.​
- A Teams environment cannot be converted to other environment types unless promoted. ​
- Non-essential settings will not be editable in Teams environments.​
- Teams environments are managed differently in the admin center by Tenant admins (P1) and Team owners (P2).

## Promotion lifecycle

- Tenant Admin can promote a Teams environment from a Teams environment to a Production environment.​
- CDS-Lite environment promotes to a CDS-Full. After promotion:​
  - The M365 Group association now becomes editable.​
  - Team owners will no longer have access to this environment, unless they are explicitly assigned the sys admin role.​
  - Team deletion or M365 group deletion will not delete the CDS-Full environment.​
  - Adding a new Teams Template app to the Team will create a new CDS-Lite for the Team.


## Teams centric operations


|  |Teams environment  |Production environment  |
|---------|---------|---------|
|**Admin related operations**    |         |         |
|Ability to edit a Microsoft 365 group associated to a CDS-Lite     | No        | Yes         |
|Support environment type conversion     | No        | Yes        | 
|Support a separate filter view for Teams environments     | Yes        | Yes        |
|Team owner specific admin capabilities like backup, restore, delete, but no reset, copy     | Yes        | No        |
|User sync can sync owners, members, guests     | Yes        | Yes        |
|Ability to edit settings     | Minimal        | Yes        |
|Specific governance controls for Teams environments including Templates     | Yes        | No        |
|**Power Apps related operations**     |         |         |
|Team owner, Team member, Team guest    |  Yes       | N/A        |
|Template app acquisition/blank app from within Teams creates an environment     | Yes       | N/A        |
|Deleting a team deletes the environment     | Yes       | N/A        |
|Embedded maker experience for Teams shows Teams specific view that hides Common Data Service and environment awareness     |  Yes       | N/A        |
|Power Apps maker apps experience for Teams apps     | No       | N/A        |
|Teams specific solution capabilities     | Yes       | N/A        |








