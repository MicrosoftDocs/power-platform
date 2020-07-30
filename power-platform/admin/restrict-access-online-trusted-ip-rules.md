---
title: "Block access by location with Azure AD Conditional Access  | MicrosoftDocs"
description: Block access by location with Azure AD Conditional Access
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/20/2019
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Block access by location with Azure AD Conditional Access

You can limit access to users with block access by location to reduce unauthorized access. When block access by location restrictions are set in a user’s profile and the user tries to log in from a blocked location, access to model-driven apps in Dynamics 365, such as Dynamics 365 Sales and Customer Service, are blocked.  
  
 **Requirements**  
  
- A subscription to [Azure Active Directory Premium](https://www.microsoft.com/cloud-platform/azure-active-directory).  
  
- A federated [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)] tenant. See [What is Conditional Access?](https://docs.microsoft.com/azure/active-directory/conditional-access/overview)
  
<a name="BKMK_AdditionalConsiderations"></a>   

## Additional security considerations  
Block access is only enforced during user authentication.  This is done by the [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)] Conditional Access capability. Model-driven apps in Dynamics 365 set a session timeout limit to balance protecting user data and the number of times users are prompted for their sign-in credentials. Block access for devices (including laptops) is not applied until the session timeout expires.  
  
 For example, block access is setup to only allow access to model-driven apps in Dynamics 365 when users are working from a corporate office.  When a user signs in into model-driven apps in Dynamics 365 using their laptop from their office and establishes a session, the user can continue to access model-driven apps in Dynamics 365 after leaving the office until the session timeout expires.  This behavior also applies to mobile and offsite connections such as: Dynamics 365 for Phones and Tablets, and [!INCLUDE[pn_crm_app_for_outlook_short](../includes/pn-crm-app-for-outlook-short.md)].  
  
<a name="BKMK_CreateSecurityGroup"></a>   

## Create a security group (optional)  
You can block access to all Users or groups of users.  It's more efficient to restrict by a group if only a subset of your Azure Active Directory (Azure AD) users are accessing model-driven apps in Dynamics 365.  

For information, see: [Create a basic group and add members using Azure Active Directory](https://docs.microsoft.com/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal).
  
<a name="BKMK_CreateTrustedIPRule"></a>   

## Create a block access by location
Block access by location is set using Azure Active Directory (AD) Conditional Access. For the cloud app, select **Common Data Service** to control access to model-driven apps in Dynamics 365 (such as Dynamics 365 Sales and Dynamics 365 Customer Service).
  
> [!NOTE]
>  Setting Conditional Access is only available with an [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)] Premium license.  Upgrade your Azure AD to a Premium license in the Microsoft 365 admin center (**<https://admin.microsoft.com>** > **Billing** > **Purchase services**).  
  
**To create a block access by location for your users:**

1. Create a Named location. See [Define locations](https://docs.microsoft.com/azure/active-directory/conditional-access/howto-conditional-access-policy-location#define-locations). 
2. Create a Conditional Access policy. See [Create a Conditional Access policy](https://docs.microsoft.com/azure/active-directory/conditional-access/howto-conditional-access-policy-location#create-a-conditional-access-policy).

   For **Step 6. Under Cloud apps or actions**, select the Common Data Service application.

  > [!div class="mx-imgBorder"] 
  > ![Restricted IP Common Data Service cloud app](media/restrictedip-cds.png "Restricted IP Common Data Service cloud app")

### See also  
 [How to set Azure Active Directory device-based conditional access policy for access control to Azure Active Directory connected applications](https://azure.microsoft.com/documentation/articles/active-directory-conditional-access-policy-connected-applications/)   
