---
title: "Block access by location with Azure AD Conditional Access  | MicrosoftDocs"
description: Block access by location with Azure AD Conditional Access
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/29/2021
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: jimholtz
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Block access by location with Azure AD Conditional Access

You can limit access to users with block access by location to reduce unauthorized access. By using Conditional Access policies, you can apply the right access controls when needed to help keep your organization secure and stay out of your user's way when not needed. Conditional Access analyses signals such as user, device, and location to automate decisions and enforce organizational access policies for resources. For example, when location restrictions are set in a user’s profile and the user tries to sign in from a blocked location, access to customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, Dynamics 365 Project Service Automation), and Finance and Operations apps are denied. For more information about Conditional Access, see the [Conditional Access](/azure/active-directory/conditional-access/) documentation.

**Requirements**  
  
- A subscription to [Azure Active Directory Premium](https://www.microsoft.com/cloud-platform/azure-active-directory).  
  
- A federated [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)] tenant. See [What is Conditional Access?](/azure/active-directory/conditional-access/overview)

## Additional security considerations  
Block access is only enforced during user authentication.  This is done by the [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)] Conditional Access capability. Customer engagement and Finance and Operations apps set a session timeout limit to balance protecting user data and the number of times users are prompted for their sign-in credentials. Block access for devices (including laptops) is not applied until the session timeout expires.  
  
 For example, block access is set up to only allow access to customer engagement and Finance and Operations apps when users are working from a corporate office.  When a user signs in into customer engagement and Finance and Operations apps using their laptop from their office and establishes a session, the user can continue to access customer engagement and Finance and Operations apps after leaving the office until the session timeout expires.  This behavior also applies to mobile and offsite connections such as: Dynamics 365 for Phones and Tablets, [!INCLUDE[pn_crm_app_for_outlook_short](../includes/pn-crm-app-for-outlook-short.md)], and Finance and Operations (Dynamics 365) mobile app.
  
## Create a security group (optional)  
You can block access to all Users or groups of users.  It's more efficient to restrict by a group if only a subset of your Azure Active Directory (Azure AD) users are accessing customer engagement and Finance and Operations apps.  

For information, see: [Create a basic group and add members using Azure Active Directory](/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal).

## Create a block access by location
Block access by location is set using Azure Active Directory (AD) Conditional Access. For the cloud app, select **Common Data Service** to control access to customer engagement apps (such as Dynamics 365 Sales and Customer Service), or for the cloud app, select **Microsoft Dynamics ERP** to control access to Finance and Operations apps.
  
> [!NOTE]
> Setting Conditional Access is only available with an [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)] Premium license.  Upgrade your Azure AD to a Premium license in the Microsoft 365 admin center (**<https://admin.microsoft.com>** > **Billing** > **Purchase services**).  
  
**To create a block access by location for your users:**

1. Create a Named location. See [Define locations](/azure/active-directory/conditional-access/howto-conditional-access-policy-location#define-locations). 
2. Create a Conditional Access policy. See [Create a Conditional Access policy](/azure/active-directory/conditional-access/howto-conditional-access-policy-location#create-a-conditional-access-policy).

  For **Step 6. Under Cloud apps or actions**, select the Microsoft Dataverse application.

  > [!div class="mx-imgBorder"] 
  > ![Restricted IP Dataverse cloud app.](media/restrictedip-cds.png "Restricted IP Dataverse cloud app")

  or

  For **Step 6. Under Cloud apps or actions**, select the Microsoft Dynamics ERP for Finance and Operations application.

  > [!div class="mx-imgBorder"] 
  > ![Restricted IP Microsoft Dynamics ERP cloud app.](media/restrictedip-erp.png "Restricted IP Microsoft Dynamics ERP cloud app")

### See also  
[How to set Azure AD device-based conditional access policy for access control to Azure AD connected applications](/azure/active-directory/conditional-access/require-managed-devices) <br />
[Azure AD Conditional Access docs](/azure/active-directory/conditional-access/) <br />
[Restrict access with Conditional access for Finance and Operations apps](https://github.com/microsoft/Dynamics-365-FastTrack-Implementation-Assets/blob/master/CloudSecurity/ConditionalAccess/readme.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]

