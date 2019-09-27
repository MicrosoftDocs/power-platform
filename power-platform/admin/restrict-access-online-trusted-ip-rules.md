---
title: "Restrict access with trusted IP rules  | MicrosoftDocs"
description: Restrict access with trusted IP rules
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/24/2019
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Restrict access with trusted IP rules

You can limit access to Dynamics 365 apps to users with   trusted IP addresses to reduce unauthorized access. When trusted IP address restrictions are set in a user’s profile and the user tries to log in from an untrusted IP address, access to Dynamics 365 apps are blocked.  
  
 **Requirements**  
  
- A subscription to [Azure Active Directory Premium](https://www.microsoft.com/cloud-platform/azure-active-directory).  
  
- A federated [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)] tenant. See [Azure AD conditional access and federated authentication](https://docs.microsoft.com/azure/active-directory/conditional-access/overview#azure-ad-conditional-access-and-federated-authentication).
  
- Federated tenants require that multi-factor authentication (MFA) be enabled.  
  
<a name="BKMK_AdditionalConsiderations"></a>   

## Additional security considerations  
 IP restriction is only enforced during user authentication.  This is done by the [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)] Conditional Access capability. Dynamics 365 apps sets a session timeout limit to balance protecting user data and the number of times users are prompted for their sign-in credentials. Trusted IP restriction for devices (including laptops) is not applied until the Dynamics 365 apps session timeout expires.  
  
 For example, a trusted IP restriction is setup to only allow access to Dynamics 365 apps when users are working from a corporate office.  When a Dynamics 365 apps user signs in into Dynamics 365 apps using their laptop from their office and establishes a Dynamics 365 apps session, the user can continue to access Dynamics 365 apps after leaving the office until the Dynamics 365 apps session timeout expires.  This behavior also applies to mobile and offsite connections such as: Dynamics 365 apps for phones and tablets, and [!INCLUDE[pn_crm_app_for_outlook_short](../includes/pn-crm-app-for-outlook-short.md)].  
  
<a name="BKMK_CreateSecurityGroup"></a>   

## Create a security group (optional)  
You can restrict access to all Users or groups of users.  It's more efficient to restrict by a group if only a subset of your Azure Active Directory (Azure AD) users are accessing Dynamics 365 apps.  

For information, see: [Create a basic group and add members using Azure Active Directory](https://docs.microsoft.com/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal).
  
<a name="BKMK_CreateTrustedIPRule"></a>   

## Create a location based restriction
Access restriction is set using Azure Active Directory (AD) Conditional Access and the Trusted IPs feature of Azure Multi-Factor Authentication. 

See:
- [Getting started with conditional access to Azure AD](https://azure.microsoft.com/documentation/articles/active-directory-conditional-access-azuread-connected-apps/)
- [Trusted IPs](https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-mfasettings#trusted-ips)  
  
> [!NOTE]
>  Setting Conditional Access is only available with an [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)] Premium license.  Upgrade your Azure AD to a Premium license in the Microsoft 365 admin center (**<https://admin.microsoft.com>** > **Billing** > **Purchase services**).  
  
### See also  
 [How to set Azure Active Directory device-based conditional access policy for access control to Azure Active Directory connected applications](https://azure.microsoft.com/documentation/articles/active-directory-conditional-access-policy-connected-applications/)   
