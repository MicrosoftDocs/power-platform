---
title: Connect to your data from Microsoft Fabric Lakehouses
description: Learn how to connect to Microsoft Fabric Lakehouses to enable rich analysis over your enterprise data stored in OneLake.
author: colinbirkett
ms.author: colinbirkett
ms.reviewer: colinbirkett
ms.date: 01/07/2026
ms.service: power-platform
ms.topic: concept-article
---

# Connect to your data from Microsoft Fabric Lakehouses

You can connect to Microsoft Fabric Lakehouses to enable rich analysis over your enterprise data stored in OneLake. When selecting the Lakehouse option, the Sales Research Agent automatically discovers Lakehouse shortcuts that you have permission to access and makes them available as data sources for AI-powered reasoning.

For a **Fabric Lakehouse connection**:

- **Your sign-in information for D365 is used to authenticate to Microsoft Fabric.**  
  Connections use your Entra ID (Azure AD) identity and inherit the same permissions you have in Fabric workspaces and OneLake.

- **The Sales Research Agent only shows Lakehouses and Lakehouse shortcuts that you already have access to.**  
  If you cannot see a Lakehouse or shortcut in Fabric, you will not see it in Sales Research Agent.

- **If no Lakehouses are found, then the option to connect to Microsoft Fabric Lakehouses is not available.**  
  This may occur if:

  - You do not have Fabric enabled in your tenant.

  - You do not have access to any workspaces that contain a Lakehouse or Lakehouse shortcut.

  - Your admin has restricted Fabric access controls.

- **The Sales Research Agent depends on the Lakehouse metadata to find relevant data.**  
  Metadata includes:

  - Table and column names

  - Directory structure within the “Tables” area of the Lakehouse

The more descriptive your metadata, the better Sales Research Agent can reason over your data.

- **Sales Research Agent respects all Fabric and OneLake access controls.**  
  The agent can only read data that:

  - Exists inside Lakehouse *Tables* (Delta Lake/Parquet) or shortcut-mounted folders

  - The signed-in user has permission to read

  - Is not blocked by workspace or item-level security settings

If row-level or column-level security is enforced through a semantic model, that security is also applied.

- **Lakehouse shortcuts are supported.**  
  Shortcuts allow a Lakehouse to reference data stored elsewhere (for example, another OneLake location or Azure Data Lake Storage).  
  Sales Research Agent can surface and query data through these shortcuts **as long as the signed-in user has read permissions on the shortcut target**.

- **The connection has similar constraints as other large enterprise data connections.**  
  Sales Research Agent may limit the number of tables scanned at once or the volume of raw data materialized depending on internal system limits.

- **If you do not have at least “Viewer” access to the workspace containing the Lakehouse, Sales Research Agent will not show the option to connect.**  
  In this case, contact your Fabric administrator to grant the necessary permissions.

**How administrators manage access**

Fabric administrators manage Lakehouse access using standard Fabric and OneLake security controls:

1.  **Workspace Permissions**  
    Access to a Lakehouse requires Workspace-level Viewer, Contributor, or Admin permissions.

2.  **Item-Level Permissions**  
    Lakehouses support item-level access controls. Users must have explicit permission to the Lakehouse itself even if they have workspace access.

3.  **OneLake Permissions for Shortcuts**  
    For shortcuts that reference external storage:

    - The user must have access to the *target* location (e.g., another Lakehouse, an ADLS Gen2 folder).

    - If the user cannot access the shortcut target, Sales Research Agent cannot surface or use that data.

4.  **Data Governance & Security Policies**

    - Fabric Data Permissions

    - Purview policies

    - Row-level security (RLS) and column-level security (CLS) when exposed through semantic models

5.  **What Sales Research Agent Never Bypasses**

    - Workspace roles

    - OneLake ACLs and shortcut access permissions

    - Item-level Fabric permissions

    - RLS/CLS

Sales Research Agent always operates under the user’s security context and never elevates permissions.

**What Sales Research Agent does when you ask a question**

When you query your Lakehouse:

1.  Sales Research Agent enumerates Lakehouses and shortcuts the signed-in user can access.

2.  It uses metadata (table names, folder names, schema information, descriptions) to identify relevant data.

3.  It generates safe, read-only queries against Lakehouse Tables or Files folders.

4.  It applies all Fabric and OneLake permissions before returning data.
