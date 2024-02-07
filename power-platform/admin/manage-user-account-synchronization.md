---
title: "Manage user account synchronization  | MicrosoftDocs"
description: Manage user account synchronization

ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/21/2021
author: sericks007
ms.subservice: admin
ms.author: sericks
ms.reviewer: jimholtz
ms.custom: "admin-security"
search.audienceType: 
  - admin
---
# Manage user account synchronization 

Because user identities are provisioned through [!INCLUDE[pn_MS_Online_Services](../includes/pn-ms-online-services.md)], you have multiple options for managing user synchronization between your online and on-premises environments.  
  
## Decide on a user management approach  
 You can choose from three main identity models in [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] when you set up and manage user accounts:

1. **Cloud identity**. Manage your user accounts in [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] only. No on-premises servers are required to manage users; it's all done in the cloud.

2. **Synchronized identity**. Synchronize on-premises directory objects with [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] and manage your users on-premises. You can also synchronize passwords so that the users have the same password on-premises and in the cloud, but they will have to sign in again to use [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)].

3. **Federated identity**. Synchronize on-premises directory objects with [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] and manage your users on-premises. The users have the same password on-premises and in the cloud, and they do not have to sign in again to use [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)]. This is often referred to as single sign-on.
  
It’s important to carefully consider which identity model to use to get up and running. Think about time, existing complexity, and cost. These factors are different for every organization. Your choice is based largely on the size of your company and the depth and breadth of your IT resources.  
  
Review the following resources to equip you to make the right decision for your company:  
  
-   [Microsoft 365 identity models and Microsoft Entra ID](/microsoft-365/enterprise/about-microsoft-365-identity)  
  
-   [What is Microsoft Entra Connect?](/azure/active-directory/connect/active-directory-aadconnect)  
  
-   [Microsoft 365 integration with on-premises environments](https://support.office.com/article/Office-365-integration-with-on-premises-environments-263faf8d-aa21-428b-aed3-2021837a4b65)  
  
## Tip for admins: provide a single sign-on organization URL for your users  
 If you’ve deployed synchronization with single sign-on (option 3 above), you can provide a URL to your users that takes advantage of your company’s Active Directory and simplifies the sign-in experience.  
  
 The URL follows this pattern:  
  
 https://\<*yourCRMOrganizationName*>.crm.dynamics.com?whr=\<*yourFederationServiceIdentifier*>  
  
 You can get the \<*yourCRMOrganizationName*> by looking at the URL you use to access environments. For example, in `https://contoso.crm.dynamics.com`, *contoso* is \<*yourCRMOrganizationName*>.  
  
> [!IMPORTANT]
> The following URLs would be used for subscriptions hosted in these locations.  
>   
> - LATAM/SAM: https://\<*yourCRMorganizationname*>.crm2.dynamics.com?whr=\<*yourFederationServiceIdentifier*>  
> - CAN: https://\<*yourCRMorganizationname*>.crm3.dynamics.com?whr=\<*yourFederationServiceIdentifier*>  
> - EMEA: https://\<*yourCRMorganizationname*>.crm4.dynamics.com?whr=\<*yourFederationServiceIdentifier*>  
> - APAC: https://\<*yourCRMorganizationname*>.crm5.dynamics.com?whr=\<*yourFederationServiceIdentifier*>  
> - OCE: https://\<*yourCRMorganizationname*>.crm6.dynamics.com?whr=\<*yourFederationServiceIdentifier*>  
> - JPN: https://\<*yourCRMorganizationname*>.crm7.dynamics.com?whr=\<*yourFederationServiceIdentifier*>  
> - IND: https://\<*yourCRMorganizationname*>.crm8.dynamics.com?whr=\<*yourFederationServiceIdentifier*>  
> - United States of America Government: https://\< *yourCRMorganizationname*>.crm9.dynamics.com?whr=\<*yourFederationServiceIdentifier*>  
> - UK: https://\<*yourCRMorganizationname*>.crm11.dynamics.com?whr=\<*yourFederationServiceIdentifier*>  
> - FRA: https://\<*yourCRMorganizationname*>.crm12.dynamics.com?whr=\<*yourFederationServiceIdentifier*>  
> - UAE: https://<*yourCRMorganizationname*>.crm15.dynamics.com?whr=<*yourFederationServiceIdentifier*>
> - DEU: https://\<*yourCRMorganizationname*>.crm.microsoftdynamics.de?whr=\<*yourFederationServiceIdentifier*>  

 You can get the Federation Service identifier for your organization by using the following steps:  
  
1. On the server that is running [!INCLUDE[pn_ADFS2](../includes/pn-adfs2.md)], click or tap **Start** > **Administrative Tools** > **AD FS 2.0 Management**.  
  
2. In the console tree, right-click or tap **AD FS 2.0**, and then click or tap **Edit Federation Service Properties**.  
  
3. Select the **General** tab.  
  
    Make note of your Federation Service identifier. For example: `http://sts1.fabrikam.com/adfs/services/trust`  
  
   Your URL should look like: https://<em>contoso</em>.crm.dynamics.com?whr=`<http://sts1.fabrikam.com/adfs/services/trust>`  
  
   Send this URL to your users and encourage them to bookmark it.


[!INCLUDE[footer-include](../includes/footer-banner.md)]