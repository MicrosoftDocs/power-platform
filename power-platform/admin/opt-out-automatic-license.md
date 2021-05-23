---
title: "Opt-out of automatic license-based user roles management  | MicrosoftDocs"
description: Turn off automatically adding and removing user security roles based on the licenses the user has. 
author: paulliew
ms.author: paulliew
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/23/2021
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Opt-out of automatic license-based user roles management 

You can now request to turn off Microsoft Power Platform from automatically adding and removing the user security roles based on the licenses the user has. 

## How to request my organization opt-outs?

Submit a [support ticket](get-help-support.md) requesting to turn off the automatic license-based user role management for your environment/organization or tenant. Include the information of your [organization unique name or ID](determine-org-id-name.md) and your tenant ID (**portal.azure.com** > under **Azure services** > **Tenant properties**).

## What to expect once the automatic role assignment is turned off for your organization

- System will no longer be automatically adding or removing the roles from users based on the licenses assigned to them.
- Only license-based roles will be impacted by this setting. Default security roles or any other roles management will continue to behave like they currently do.
- Existing license-based roles assigned to users in the system will not be altered with this setting. 
- Once the feature for auto management is turned off, it can’t be re-enabled for auto management.

## How do users get these roles that used to be automatically added or removed once opted-out?

Administrators can add and remove the appropriate roles to users through the Power Platform admin center.

