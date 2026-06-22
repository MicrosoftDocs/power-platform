---
title: View licensing and capacity recommendations
description: Learn how the actions page in Power Platform admin center helps admins manage licenses and capacity with weekly recommendations for better efficiency.
author: sidhartg
ms.component: pa-admin
ms.topic: concept-article
ms.date: 05/08/2026
ms.subservice: admin
ms.author: sidhartg
ms.reviewer: sericks
ms.contributors:
  - DanaMartens
  - sandhangitms
search.audienceType:
  - admin
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/04/2025
---

# View licensing and capacity recommendations

The [actions page](power-platform-advisor.md) in the Power Platform admin center helps you optimize and manage licensing and capacity for your Power Platform tenant with actionable recommendations. These recommendations highlight ways to improve resource allocation, governance, and cost efficiency. To see your recommendations on the the actions page, go to the [Power Platform admin center](https://admin.preview.powerplatform.microsoft.com) and select **Actions**.

The following information highlights recommendations that pertain to licenses and capacity, including the severity of the recommendation, refresh frequency, and whether the recommendation applies to managed environments only.

## Licenses

The following recommendations relate to licenses:

### Review Power Apps license recommendations

- **Severity**: High  
- **Refresh Frequency**: Weekly  
- **Managed environments only**: Yes  

### Assign licenses to pending Power Apps license requests

This recommendation lists the number of pending license requests in your tenant. Delay in license assignment can lead to loss of productivity and might result in noncompliant use of premium apps and resources.

> [!IMPORTANT]
> You must have adequate permissions in the Microsoft 365 admin center to assign licenses. If you don't have the right privileges, you can share the recommendation with someone in your organization who can assign the licenses to the requested users. For more information, see [About administrator roles in the Microsoft 365 admin center](/microsoft-365/admin/add-users/about-admin-roles).

- **Severity**: High  
- **Refresh Frequency**: Weekly  
- **Managed environments only**: Yes  

### Users are out of compliance in managed environments — Action required

This recommendation lists users in managed environments that use apps without required licenses. Every user running an app in a managed environment must have a Power Apps Premium license or a qualifying license that includes premium Power Apps usage rights. Starting June 2026, users without appropriate licenses receive in-app compliance notifications. For more information, see [managed environments licensing compliance FAQ](managed-environment-licensing.md#faq).

The list shows usage in the last 90 days calculated from the refresh date shown in the recommendation. The recommendation provides the following actions you can take as an admin to review and assign licenses to users in managed environments:

1. **Download License Report** - This option takes you directly to the **Download Report** panel in the Power Apps Licensing, with the report **Users requiring licenses in Managed Environments** selected. You should download and review this detailed report that provides the app, environment, and license information for users in managed environments without required licenses.

1. **Download as CSV** - This option only allows you to download the list of users visible in the recommendation. Since the list only fetches 500 user records at a time, you should use the **Download License Report** action and use detailed reports for review.

- **Severity**: High  
- **Refresh Frequency**: Daily  
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
