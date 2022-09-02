---
title: "Set up Azure AD Conditional Access - Microsoft Power Platform | MicrosoftDocs"
description: "By using Conditional Access policies, you can apply the right access controls when needed to keep your organization secure and stay out of your user’s way when not needed."
author: manuelap-msft
manager: devkeydet

ms.component: pa-admin
ms.topic: conceptual
ms.date: 12/17/2021
ms.subservice: guidance
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

[Conditional Access policies](/azure/active-directory/conditional-access/) in Azure Active Directory (Azure AD) at their simplest are if-then statements: *if* a user wants to access a resource, *then* they must complete an action.

**Example:** A payroll manager wants to access the payroll app that has been built with Power Apps and is required to perform multifactor authentication to access it.

Administrators are faced with two primary goals:

- Empower users to be productive wherever and whenever.
- Protect the organization's assets.

By using Conditional Access policies, you can apply the right access controls when needed to keep your organization secure, and stay out of your user’s way when they're not needed. Conditional Access policies are enforced after the first-factor authentication has been completed.

Only *Global Admins* can configure Conditional Access policies. This isn't available for Microsoft Power Platform or Dynamics 365 admins.

![Conceptual Conditional Access process flow.](media/conditional-access.png "Conceptual Conditional Access process flow")

To learn how to set up Conditional Access policies, see [Plan a Conditional Access deployment](/azure/active-directory/conditional-access/plan-conditional-access).

> [!NOTE]
> If you’re using Conditional Access polices to limit access to Power Automate and it’s features, the following apps must be included in **Cloud apps** policy application:
> 
> - Microsoft Power Apps
> - Microsoft Flow
> 
> Currently, **having conditional access to only Microsoft Flow is not enough**. To learn how to set up Conditional Access policies, see [Plan a Conditional Access deployment](/azure/active-directory/conditional-access/plan-conditional-access) and [Control Access to Power Apps and Power Automate with Azure AD Conditional Access Policies](https://devblogs.microsoft.com/premier-developer/control-access-to-power-apps-and-power-automate-with-azure-ad-conditional-access-policies/#:~:text=Control%20Access%20to%20Power%20Apps%20and%20Power%20Automate,a%20Conditional%20Access%20Policy.%20...%204%20Summary.%20).

## Further resources

[Best practices for Conditional Access in Azure Active Directory](/azure/active-directory/conditional-access/best-practices)<br>
[License Requirements to enable Conditional Access](//azure/active-directory/conditional-access/overview#license-requirements)



[!INCLUDE[footer-include](../../includes/footer-banner.md)]