---
title: "Set up Azure AD Conditional Access - Microsoft Power Platform | MicrosoftDocs"
description: "By using Conditional Access policies, you can apply the right access controls when needed to keep your organization secure and stay out of your user’s way when not needed."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/09/2020
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Set up Azure AD Conditional Access

[Conditional Access policies](https://docs.microsoft.com/azure/active-directory/conditional-access/) in Azure Active Directory (Azure AD) at their simplest are if-then statements: *if* a user wants to access a resource, *then* they must complete an action.

**Example:** A payroll manager wants to access the payroll app that has been built with Power Apps and is required to perform multifactor authentication to access it.

Administrators are faced with two primary goals:

- Empower users to be productive wherever and whenever.
- Protect the organization's assets.

By using Conditional Access policies, you can apply the right access controls when needed to keep your organization secure, and stay out of your user’s way when they're not needed. Conditional Access policies are enforced after the first-factor authentication has been completed.

Only *Global Admins* can configure Conditional Access policies. This isn't available for Microsoft Power Platform or Dynamics 365 admins.

![Conceptual Conditional Access process flow](media/conditional-access.png "Conceptual Conditional Access process flow")

To learn how to set up Conditional Access policies, see [Plan a Conditional Access deployment](https://docs.microsoft.com/azure/active-directory/conditional-access/plan-conditional-access).

## Further resources

[Best practices for Conditional Access in Azure Active Directory](https://docs.microsoft.com/azure/active-directory/conditional-access/best-practices)<br>
[License Requirements to enable Conditional Access](https://docs.microsoft.com//azure/active-directory/conditional-access/overview#license-requirements)

