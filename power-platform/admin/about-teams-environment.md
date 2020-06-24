---
title: "About Teams environment | MicrosoftDocs"
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
---
# About Teams environment

## Lifecycle

- A Teams environment is bound to a Team. It’s created during first app acquisition or creation in a Team, bound to the M365 group and deleted when a Team is deleted, or all apps deleted.​
- The M365 group associated with a Teams environment cannot be edited and it’s only controlled by Teams.​
- Given the numbers can be large and administration is not equivalent, these environments will be available in a separate view/ filter in the Admin center.​
- A Teams environment cannot be “converted” to other environment types unless “promoted”. ​
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














