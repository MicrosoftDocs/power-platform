---
title: Audit Power Platform logs in Microsoft Purview
description: In this article, you learn how to view Power Platform administrative logs using auditing solutions in Microsoft Purview.
ms.component: pa-admin
ms.topic: how-to
ms.date: 10/21/2025
author: EllenWehrle
ms.subservice: admin
ms.author: ellenwehrle
ms.reviewer: ellenwehrle 
search.audienceType: 
  - admin
---

# Audit Power Platform logs in Microsoft Purview

Use Microsoft Purview to monitor activity, maintain compliance, and troubleshoot issues across data, agents, apps, flows, and pages. This article introduces the key concepts and features that enable visibility and governance.

Auditing are essential for:

- **Compliance and security**: Track user actions and system events to meet regulatory requirements.
- **Operational insight**: Understand usage patterns and diagnose problems quickly.
- **Governance**: Maintain control over data access and connector usage.

## Requirements

- At least one user assigned a Microsoft Office 365 E1 or greater license.
- Power Platform production environments.

## Power Platform activities to audit

Logging takes place at the SDK layer which means a single action can trigger multiple events that are logged. You can audit various user activities.

### Power Apps activities

- Capture app usage and performance data.
- Identify errors and optimize user experience.

###