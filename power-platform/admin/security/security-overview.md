---
title: Security overview
description: Learn how to manage security in the Power Platform admin center with security features available.
ms.subservice: admin
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/16/2024
author: matapg007
ms.author: matgupta
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Security overview
                                                  
The Security page in the Power Platform admin center helps you manage security in your organization with best practices and a comprehensive set of security features in the safest way possible. You can use this page to:

- Assess your security score: Understand and improve your organization’s security policies specific to your needs.
- Act on recommendations: Identify and act on the top-most, impactful recommendations to improve the assessment.
- Set up proactive policies: Use the rich set of tools and security capabilities available to gain deep visibility, detect threats, and proactively set policies in place to help safeguard the organization from vulnerabilities and risks.
  
## Prerequisite
To get insights into the security assessment and recommendations for your tenant, turn on tenant-level analytics. For instructions, see How do I enable tenant-level analytics.

> [!Note]
> It might take up to 48 hours to populate the Security page with data after you turn on tenant-level analytics. Until then, most sections on the page show “Not available”.

To access the Security page:
1.	Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
2.	From the left-side menu, select **Security**.

## Security score for your tenant
The security assessment is illustrated on a qualitative scale with labels of Standard, Enhanced, or Advanced. The assessment is calculated based on system recommendations, user and maker activity, and security configurations that you have applied. It's a measurement of your organizational security position for Power Platform workloads. Enhanced and Advanced assessment labels indicate that more recommended actions have been taken and the security position of the tenant is improved.

Your security assessment is calculated as a sum of your achieved impact over total possible impact.

Formula: Total achieved impact/Total possible impact

Each feature is assigned an impact status based on the feature scope (tenant or environment), and the number of resources impacted by turning the feature on or off.

## Reactive governance through recommendations
The system generates various recommendations based on common, best practices that improve the security assessment of your tenant. Recommendations refer to actions or measures that the administrator can take to enhance their overall security status.

- System-generated recommendations can be acted upon by selecting the link under the recommended action of that feature.
- To configure features outside of the recommendations, select the **Manage** button.

## Manage proactive policies for governance and security
There are several security features that help secure your tenant, you may visit to below page to view and manage proactive policies for governance and security.

- [Network security](network-security.md)
- [Access control](access-control.md)
- [Threat detection](threat-detection.md)
- [Compliance](compliance.md)

## FAQ

### When will the Security page be available for Government Community Cloud (GCC)?
The **Security** page is planned for availability in GCC after the general availability release.

### Can customers modify the recommendations or parameters based on their needs?
No. The recommendations are system-generated and are based on Microsoft's best practices and guidance.


