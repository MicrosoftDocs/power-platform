---
title: View licensing and capacity recommendations
description: Learn how the actions page helps admins manage licenses and capacity with weekly recommendations for better efficiency.
author: sidhartg
ms.component: pa-admin
ms.topic: concept-article
ms.date: 05/08/2026
ms.subservice: admin
ms.author: sidhartg
ms.reviewer: sericks
ms.contributors:
  - DanaMartens
search.audienceType:
  - admin
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/04/2025
---

# View licensing and capacity recommendations

The actions page helps you optimize and manage licensing and capacity for your Power Platform tenant with actionable recommendations. These recommendations highlight ways to improve resource allocation, governance, and cost efficiency. You can view licensing and capacity recommendations in the [actions page](power-platform-advisor.md) in the Power Platform admin center.

The following recommendations are grouped by type:

## Licenses

The following recommendations relate to licenses:

### Review Power Apps license recommendations

- **Severity**: High  
- **Refresh Frequency**: Weekly  
- **Managed environments only**: Yes  

### Assign licenses to pending Power Apps license requests

This recommendation lists the number of pending license requests in your tenant. Delay in license assignment can lead to loss of productivity and might result in noncompliant use of premium apps and resources.

> [!IMPORTANT]
> You must have adequate permissions on the Microsoft 365 admin center to assign licenses. If you don't have the right privileges, you may share the recommendation with someone in your organization who can assign the licenses to the requested users.

- **Severity**: High  
- **Refresh Frequency**: Weekly  
- **Managed environments only**: Yes  

### User(s) are out of compliance in Managed Environments — Action required

There are users in Managed Environments actively using apps without required licenses. Every user running an app in a Managed Environment must have a Power Apps Premium license or a qualifying license that includes premium Power Apps usage rights. Starting June 2026, users without appropriate licenses will receive in-app compliance notifications. Assign licenses now to resolve.

**What can I do?**

Review and assign premium licenses to resolve noncompliance before users are notified. A list of users is available below, along with an option to download detailed reports.

For more information, see [Managed Environments licensing FAQ](/power-platform/admin/managed-environment-licensing#faq).

- **Severity**: High  
- **Refresh Frequency**: Weekly  
- **Managed environments only**: Yes  

### Review and assign capacity to avoid degraded performance

This recommendation identifies environments where capacity consumption is nearing or exceeding the assigned limits. To prevent performance degradation, review the affected environments and allocate more capacity as needed. Select an environment to manage and adjust capacity assignments accordingly.

- **Severity**: High
- **Refresh frequency**: Daily
- **Managed environments only**: No

## Capacity

The following recommendations relate to capacity:

### Optimize Dataverse storage for email attachments

- **Severity**: Medium  
- **Refresh Frequency**: Weekly  
- **Managed environments only**: Yes  

### Optimize Dataverse storage for workflows and async plugins

- **Severity**: Medium  
- **Refresh Frequency**: Weekly  
- **Managed environments only**: Yes  

### Optimize Dataverse storage for Smart Matching

- **Severity**: Medium  
- **Refresh Frequency**: Weekly  
- **Managed environments only**: Yes  

### Optimize Dataverse storage for plugin logging

- **Severity**: Medium  
- **Refresh Frequency**: Weekly  
- **Managed environments only**: Yes  

### Optimize Dataverse storage for table stale mailbox subscriptions

- **Severity**: Medium  
- **Refresh Frequency**: Weekly  
- **Managed environments only**: Yes  

### Optimize Dataverse storage for server-side sync logs

- **Severity**: Medium  
- **Refresh Frequency**: Weekly  
- **Managed environments only**: Yes  
