---
title: "Troubleshooting: Unblock required URLs  | MicrosoftDocs"
description: "Troubleshooting: Unblock required URLs"
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/11/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Troubleshooting: Unblock required URLs

The [model-driven apps](/powerapps/maker/model-driven-apps/model-driven-app-overview) and customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), use several Microsoft URLs to help provide security, services, and features. However, your computer or your organization's computer network may block access to some of these URLs. Blocking any of the required URLs will cause model-driven apps and customer engagement apps to operate incorrectly or not at all.  
  
 You may see a network or server error message if your computer or your organization's network blocks the URLs you need. The error message might look like one of these:  
  
- "The specified [!INCLUDE[pn_microsoftcrm_server](../includes/pn-microsoftcrm-server.md)] address (URL) is not responding. Ask your administrator to verify that the server is turned on, and then try again."  
  
- "There is a problem communicating with the [!INCLUDE[pn_microsoftcrm_server](../includes/pn-microsoftcrm-server.md)]. The server might be unavailable."  
  
You can unblock these URLs on your computer by adding them to a list of approved sites in your browser.  
  
> [!IMPORTANT]
>  If the following procedure doesn't unblock the URLs required for model-driven apps and customer engagement apps, ask your system administrator to unblock the URLs on the organization's network.  
   
### Unblock apps URLs in Internet Explorer  
  
1.  On the Explorer bar, click or tap the **Tools** icon (the white gear shape), and then click or tap **Internet options**.  
  
2.  Click or tap the **Security** tab > **Trusted sites** > **Sites**.  
  
3.  In **Add this website to the zone**, type the URL for your organization. For example, https://contoso.crm.dynamics.com  
  
4.  Click or tap **Add** > **Close** > **OK**.  
  
For a list of other URLs you may need to add to unblock, see [Internet accessible URLs required for Microsoft Dynamics CRM Online](https://support.microsoft.com/kb/2655102)
