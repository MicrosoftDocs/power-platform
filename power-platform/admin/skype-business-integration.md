---
title: "Skype for Business and Skype integration  | MicrosoftDocs"
description: Skype for Business and Skype integration
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/14/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Skype for Business and Skype integration

If your organization uses [!INCLUDE[pn_skype_for_business](../includes/pn-skype-for-business.md)] (formerly known as [!INCLUDE[pn_Microsoft_Lync](../includes/pn-microsoft-lync.md)]) or [!INCLUDE[pn_skype](../includes/pn-skype.md)], you can take advantage of connectivity features like click-to-call or checking user availability from within model-driven apps in Dynamics 365, such as Dynamics 365 Sales and Customer Service, or [!INCLUDE[pn_microsoft_dynamics_crm_for_outlook](../includes/pn-microsoft-dynamics-crm-for-outlook.md)].  
  
<a name="BKMK_UseLync"></a>   
## Using Skype for Business with model-driven apps in Dynamics 365

 When you use [!INCLUDE[pn_skype_for_business](../includes/pn-skype-for-business.md)] and Dynamics 365 apps together, you can use [!INCLUDE[pn_skype_for_business](../includes/pn-skype-for-business.md)]) presence and click-to-call from within Dynamics 365 apps.  
  
 Your organization must have a Skype for Business Online license.
  
  **Client requirements and configuration**  
  
- To use click-to-call, [!INCLUDE[pn_skype_for_business](../includes/pn-skype-for-business.md)] must be selected as the telephony provider. You can set this by selecting an environment in the Power Platform admin center, and then select **Settings** > **Product** > **Features**. Under **Communications** review the Skype settings.  
  
- By default, [!INCLUDE[pn_skype_for_business](../includes/pn-skype-for-business.md)] presence is enabled in model-driven apps in Dynamics 365. System administrators can enable or disable presence in model-driven apps in Dynamics 365. To do this, set **Skype presence** to **On** or **Off**.  
  
- Each user must have the [!INCLUDE[pn_skype_for_business](../includes/pn-skype-for-business.md)] client installed and running on their PC.  
  
- For [!INCLUDE[pn_skype_for_business](../includes/pn-skype-for-business.md)] presence, users must have `https://*.dynamics.com` added to their web browsers trusted sites list in Internet options in [!INCLUDE[pn_Internet_Explorer](../includes/pn-internet-explorer.md)].  
  
### Supported devices and web browsers when you use Skype for Business with model-driven apps in Dynamics 365
  
|                             Mobile app or web browser                             | Skype for Business click-to-call | Skype for Business presence |
|-----------------------------------------------------------------------------------|----------------------------------|-----------------------------|
|            [!INCLUDE[pn_crm_for_ipad](../includes/pn-crm-for-ipad.md)]            |               Yes                |             No              |
|        [!INCLUDE[pn_moca_CRM_Android](../includes/pn-moca-crm-android.md)]        |               Yes                |             No              |
| [!INCLUDE[pn_ms_Windows_short](../includes/pn-ms-windows-short.md)]-based tablets |               Yes                |             No              |
|       [!INCLUDE[pn_Internet_Explorer](../includes/pn-internet-explorer.md)]       |               Yes                |             Yes             |
|           [!INCLUDE[tn_Google_Chrome](../includes/tn-google-chrome.md)]           |               Yes                |             No              |
|         [!INCLUDE[tn_Mozilla_Firefox](../includes/tn-mozilla-firefox.md)]         |               Yes                |             No              |
|            [!INCLUDE[tn_Apple_Safari](../includes/tn-apple-safari.md)]            |               Yes                |             No              |
  
<a name="BKMK_UseSkype"></a>   

## Using Skype with model-driven apps in Dynamics 365 
 When you use [!INCLUDE[pn_skype](../includes/pn-skype.md)] and model-driven apps in Dynamics 365 together, you can use [!INCLUDE[pn_skype](../includes/pn-skype.md)] click-to-call from within model-driven apps in Dynamics 365.  
  
**Client requirements and configuration**  
  
- Each user must have the [!INCLUDE[pn_skype_for_windows](../includes/pn-skype-for-windows.md)] desktop client or the [!INCLUDE[pn_skype_for_windows_8](../includes/pn-skype-for-windows-8.md)] app installed and running on their PC or [!INCLUDE[pn_windows8](../includes/pn-windows8.md)] device.  
  
- **Skype** must be selected as the telephony provider. Select an environment in the Power Platform admin center, and then select **Settings** > **Product** > **Features**. Under **Communications** set **Set the telephony provider** to **Use Skype for Business**. 
  
### Supported devices and web browsers when you use Skype with model-driven apps in Dynamics 365
  
|                                                    Mobile app or web browser                                                     | Skype click-to-call |
|----------------------------------------------------------------------------------------------------------------------------------|---------------------|
|                                   [!INCLUDE[pn_crm_for_ipad](../includes/pn-crm-for-ipad.md)]                                    |         Yes         |
| [!INCLUDE[pn_moca_CRM_Android](../includes/pn-moca-crm-android.md)] on [!INCLUDE[tn_android](../includes/tn-android.md)] tablets |         Yes         |
|                        [!INCLUDE[pn_ms_Windows_short](../includes/pn-ms-windows-short.md)]-based tablets                         |         Yes         |
|                              [!INCLUDE[pn_Internet_Explorer](../includes/pn-internet-explorer.md)]                               |         Yes         |
|                                  [!INCLUDE[tn_Google_Chrome](../includes/tn-google-chrome.md)]                                   |        Yes\*        |
|                                [!INCLUDE[tn_Mozilla_Firefox](../includes/tn-mozilla-firefox.md)]                                 |       Yes\*\*       |
|                                   [!INCLUDE[tn_Apple_Safari](../includes/tn-apple-safari.md)]                                    |         Yes         |
  
 \* The [Skype Click-to-call plugin](https://www.skype.com/go/clicktocall) must be installed on the [!INCLUDE[tn_chrome](../includes/tn-chrome.md)] browser and enabled. More information: [How do I enable Skype Click to Call in Chrome?](https://support.skype.com/en/faq/FA12243/how-do-i-enable-skype-click-to-call-in-chrome)  
  
 Additionally, [!INCLUDE[pn_skype](../includes/pn-skype.md)] click-to-call is supported with [!INCLUDE[pn_crm_for_windows_8](../includes/pn-crm-for-windows-8.md)], [!INCLUDE[pn_moca_CRM_Windows_8_1](../includes/pn-moca-crm-windows-8-1.md)], and [!INCLUDE[pn_windows_10](../includes/pn-windows-10.md)].  
  
### See also  
 [Set up model-driven apps in Dynamics 365 to use Skype or Skype for Business](../admin/set-up-skype-or-skype-for-business.md)   
 [Requirements](online-requirements.md)
