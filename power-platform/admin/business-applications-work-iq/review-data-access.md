---
title: Review user, agent, and application access for Business Applications in Work IQ (preview)
description: Learn how Business Applications in Work IQ uses existing permissions to control user, agent, and application access to your data.
#customer intent: As an administrator, I want to review existing security roles and permissions for users, so that I can confirm access matches current business responsibilities.
ms.date: 09/25/2026
author: karissa-larson
ms.author: kalars
ms.reviewer: ellenwehrle
ms.component: pa-admin
ms.topic: best-practice
ms.subservice: admin
ms.custom: NewPPAC
ai-usage: ai-assisted
search.audienceType:
  - admin
ms.collection: bap-ai-copilot
---

# Review user, agent, and application access for Business Applications in Work IQ (preview)

[!INCLUDE [cc-preview-work-iq](../../includes/cc-preview-work-iq.md)]

**Business Applications in Work IQ** is a capability that uses the access permissions already configured for your business applications data to determine what users, agents, and applications can see and do. As an administrator, you review what data users, agents, and applications are authorized to access and which operations they can perform, so that access aligns with the business scenarios your organization wants to support.

This article focuses on underlying data permissions. For Copilot availability, Work IQ MCP access, and application blocking through App Access, see [Manage AI experience access to Business Applications in Work IQ](manage-ai-experience-access.md).

## Before you begin

You need to be a Power Platform administrator to review and manage security settings in the selected environment.

## Review and manage access as a best practice

Reviewing existing permissions helps you prepare business data for use through AI experiences. Work with application owners to align access with the business scenarios your organization wants to support. Your review should include users, agents, and applications.

### User access

Review the data users need for their work and the permissions assigned to them:

1. Identify the users and teams participating in your business scenario.
1. Review their assigned security roles and access to relevant business data.
1. Update permissions where business responsibilities have changed.
1. Validate the resulting access with a representative user account.

For instructions, see [Security roles and privileges for Dataverse](../security-roles-privileges.md).

### Agent and application access

For each agent or application that connects to the environment:

1. Identify the identity or connection it uses to access data.
1. Confirm its business purpose and owner.
1. Review the permissions associated with that identity or connection.
1. Adjust access to support the intended scenario.
1. Test the required operations by using that agent or application.

### Access maintenance as scenarios evolve

Include permission reviews when you introduce new agents, expand to additional business scenarios, or change application ownership. Keep the review focused on:

- Who or what needs access.
- Which data and operations support the scenario.
- Which permissions to update as responsibilities change.

## Related content

- [Security roles and privileges for Dataverse](../security-roles-privileges.md)
- [Control which apps are allowed in your environment](../control-app-access-environment.md)
- [Manage participation in Business Applications in Work IQ](manage-participation.md)
- [Manage AI experience access to Business Applications in Work IQ](manage-ai-experience-access.md)
