---
title: Manage AI experience access to Business Applications in Work IQ (preview)
description: Connection controls determine which AI experiences and apps access business applications data. Learn how to manage Copilot, MCP server, and App Access settings.
#customer intent: As an IT admin, I want to understand the difference between Copilot access controls, MCP server controls, and App Access, so that I can apply the right control for a given scenario.
ms.date: 09/25/2026
author: karissa-larson
ms.author: kalars
ms.reviewer: ellenwehrle
ms.component: pa-admin
ms.topic: how-to
ms.subservice: admin
ms.custom: NewPPAC
ai-usage: ai-assisted
search.audienceType:
  - admin
ms.collection: bap-ai-copilot
---

# Manage AI experience access to Business Applications in Work IQ (preview)

[!INCLUDE [cc-preview-work-iq](../../includes/cc-preview-work-iq.md)]

**Connection controls** are administrative settings that determine which AI experiences and applications can connect to business applications data. These controls let administrators manage availability through Microsoft 365 Copilot, allow or block access to the Work IQ MCP server, and use App Access to control which applications can access data in an environment.

This article covers connection controls. For environment features and data participation, see [Manage participation in Business Applications in Work IQ](manage-participation.md). For the underlying data permissions, see [Review user, agent, and application access for Business Applications in Work IQ](review-data-access.md).

## Before you begin

You need to have the appropriate roles to manage AI experience access:

- **AI Administrator** role to work with settings in the Microsoft 365 admin center.
- **Power Platform Administrator** role to work with application-access settings in the Power Platform admin center.

## Copilot access control

The Microsoft 365 admin center provides a setting that determines who can access business applications through Microsoft 365 Copilot. For most customers, availability is on for all users by default.

The audience setting determines who can use the connection. Existing business-data permissions determine which data each person can access. Administrators can choose from these audience options:

1. **All users**: Make the connection available across your organization.
1. **Specific groups**: Make the connection available to selected groups.
1. **No users**: Turn off this connection for users in your organization.

To review or change this setting:

1. Sign in to the Microsoft 365 admin center.
1. Select **Copilot** > **Settings**.
1. Open the setting for **business applications availability** in Microsoft 365 Copilot.
1. Choose the **audience**.
1. Select **Save** if you made changes.

## Work IQ MCP server access control

The Work IQ MCP server has its own availability control for connected AI experiences and coding agents. This control applies to the entire Work IQ MCP server, separate from Copilot audience settings or App Access.

To review current availability:

1. Sign in to the Microsoft 365 admin center.
1. Select **Agents** > **Tools**.
1. Select **Work IQ MCP**.
1. Review its current availability.

To block access to the server, select **Block**.

## Application access control (App Access)

App Access is the mechanism used to choose which applications, including agentic applications such as Copilot Cowork, are allowed to access data in a particular environment. Some Microsoft applications have preauthorized access to data in Dataverse, which you can control through App Access. App Access addresses application access to the underlying environment data. Work IQ participation settings serve a different purpose and don't prevent agentic access.

Third-party applications never have preauthorized access to Dataverse data.

### Configuring application access

1. Sign in to the Power Platform admin center.
1. Select **Security** > **Identity & access**.
1. Select **App Access Control**.
1. Select the environment in which you want to enable app access.
1. Select **Enable**, and then select **Save**.
1. Return to the environment and select the applications you want to block from accessing the environment.

### Verifying and restoring access

After a change takes effect, test a request from an application covered by the configuration and verify the expected access result.

To restore access to a blocked application, update its App Access configuration for the same environment and test the connection again.

## Related content

- [Manage participation in Business Applications in Work IQ](manage-participation.md)
- [Review user, agent, and application access for Business Applications in Work IQ](review-data-access.md)
- [Work IQ MCP overview](/microsoft-365/copilot/extensibility/work-iq/mcp/overview)
- [Control which apps are allowed in your environment](../control-app-access-environment.md)
