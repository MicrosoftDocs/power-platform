---
title: View licensing and capacity recommendations
description: Learn how the actions page helps admins manage licenses and capacity with weekly recommendations for better efficiency.
author: sidhartg
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/28/2025
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

### Assign licenses to active users using premium apps with standard licenses

This recommendation lists users that are actively using Power Apps applications with Microsoft 365 under extended use rights and will be restricted starting April 1, 2025.

Learn more about [Microsoft Power Apps and Power Automate use rights for Microsoft 365 applications](/power-platform/admin/powerapps-flow-licensing-faq#what-are-microsoft-power-apps-and-power-automate-use-rights-for-microsoft-365-applications) with additional information about the April 1,2025 enforcement in the [Power Platform licensing FAQs](/power-platform/admin/powerapps-flow-licensing-faq).

> [!NOTE]
> This recommendation only checks for Power Apps premium plans and may show users from apps that use [Power Apps per app](about-powerapps-perapp.md) or [Pay-as-you-go](pay-as-you-go-overview.md) plans. Review if your apps use [per app plans](about-powerapps-perapp.md#step-3-set-up-apps-to-use-per-app-plans) or [pay-as-you-go plans](pay-as-you-go-set-up.md#set-up-pay-as-you-go-for-your-environment-from-your-apps-setting).

- **Severity**: Medium  
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
