---
title: "Requirements/supported configurations  | MicrosoftDocs"
description: Requirements/supported configurations 
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/08/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Requirements/supported configurations  

The customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), give you the following options to access data:  
  
- Web browser. No need to install anything to run customer engagement apps from a computer running a supported web browser.  

- [!INCLUDE[pn_ms_dyn_crm_app_for_outlook](../includes/pn-ms-dyn-crm-app-for-outlook.md)]. An [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] add-in that provides you with a complete set of customer engagement apps capabilities right within [!INCLUDE[pn_MS_Outlook_Full](../includes/pn-ms-outlook-full.md)].  
  
- [!INCLUDE[pn_Mobile_Express_long](../includes/pn-mobile-express-long.md)] and [!INCLUDE[pn_moca_short](../includes/pn-moca-short.md)]. Lightweight applications that let you access Microsoft Dataverse data on almost any web browser running on a tablet, smartphone, or non-Windows computer.  
  
## Web browser requirements  
 You use a common web browser, such as [!INCLUDE[pn_Internet_Explorer](../includes/pn-internet-explorer.md)], [!INCLUDE[tn_Mozilla_Firefox](../includes/tn-mozilla-firefox.md)], [!INCLUDE[tn_Google_Chrome](../includes/tn-google-chrome.md)] or [!INCLUDE[tn_Apple_Safari](../includes/tn-apple-safari.md)] to view, add, or edit information stored in your organization’s  database. For more information about the supported web browsers and hardware requirements, see [Web application requirements for Microsoft Dynamics 365 apps](web-application-requirements.md).  

## Mobile device requirements  
 Users can work in customer engagement apps by using a supported browser on a mobile device, or by using [!INCLUDE[pn_Mobile_Express_long](../includes/pn-mobile-express-long.md)]. For more information about the mobile experience, see [Set up Dynamics 365 apps for phones and Dynamics 365 apps for tablets](/dynamics365/customer-engagement/mobile-app/set-up-dynamics-365-for-phones-and-dynamics-365-for-tablets).  

## Microsoft Office requirements  
 Customer engagement apps leverage the capabilities of on-premises versions of [!INCLUDE[pn_MS_Office](../includes/pn-ms-office.md)] or [!INCLUDE[pn_MS_Office_365](../includes/pn-ms-office-365.md)] and integrates with [!INCLUDE[pn_MS_Word_Full](../includes/pn-ms-word-full.md)] and [!INCLUDE[pn_MS_Excel_Full](../includes/pn-ms-excel-full.md)]. For more information about the supported versions of [!INCLUDE[pn_MS_Office](../includes/pn-ms-office.md)], see [Supported versions of Office](web-application-requirements.md#supported-versions-of-office).  
  
 [!INCLUDE[cc_Office365PlanRequirement](../includes/cc-office365planrequirement.md)]  

## IP addresses and URLs
If certain IP address ranges or individual IP addresses are blocked in the environment, users may not be able to reach Microsoft Dynamics 365 environments. Blocked IPs can also impact connecting Dynamics 365 apps to [Microsoft Exchange Server (on-premises)](connect-exchange-server-on-premises.md). See the following:

- [Azure IP Ranges and Service Tags – Public Cloud](https://www.microsoft.com/download/details.aspx?id=56519)
- [Azure IP Ranges and Service Tags – US Government Cloud](https://www.microsoft.com/download/details.aspx?id=57063)
- [Azure IP Ranges and Service Tags – China Cloud](https://www.microsoft.com/download/details.aspx?id=57062)
- [Azure IP Ranges and Service Tags – Germany Cloud](https://www.microsoft.com/download/details.aspx?id=57064)

> [!NOTE]
> You can search the Azure IP Ranges json file for the AzureCloud service tag for your region. For example, for Japan you'd search for "azurecloud.japaneast" and "azurecloud.japanwest" to find the list of IP addresses to allow.
>
> [!div class="mx-imgBorder"] 
> ![AzureCloud service tag for region IPs](media/example-azurecloud-tag.png "AzureCloud service tag for region IPs")

Dynamics 365 apps use several Microsoft URLs to help provide security, services, and features. Blocking any of the required URLs will cause apps in Dynamics 365 to operate incorrectly or not at all. See:

- [Troubleshooting: Unblock required URLs](troubleshooting-unblock-urls-required.md).
- [Internet accessible URLs required for connectivity to Microsoft Dynamics 365](https://support.microsoft.com/help/2655102/internet-accessible-urls-required-for-connectivity-to-microsoft-dynami)
  
## Internet accessible URLs required

If you cannot access Microsoft Dynamics 365 apps, or specific URLs fail to load when you use Microsoft Dynamics 365, a proxy or firewall may be configured to prevent  Dynamics 365 URLs from accessing server resources.

Add the following URLs to the approved list to allow traffic to proceed to these URLs.

Select your region:
> [!div class="op_single_selector"]
> - [North America-based organizations](internet-url-north-america.md)
> - [South America-based organization](internet-url-south-america.md)
> - [Europe, Africa, and Middle East-based organization](internet-url-europe-africa-middle-east.md)
> - [Asia/Pacific area-based organization](internet-url-asia-pacific.md)
> - [Japan area-based organizations](internet-url-japan.md)
> - [India area-based organizations](internet-url-india.md)
> - [Canada area-based organizations](internet-url-canada.md)
> - [Oceania area-based organizations](internet-url-oceania.md)
> - [Dynamics 365 US Government environments](internet-url-us-government.md)
> - [United Kingdom area-based organizations](internet-url-united-kingdom.md)

### See also  
 [Plan for Deployment and Administration](../admin/plan-for-deployment-and-administration.md)  <br /> 
 [Work with requirements as a solution architect for Power Platform and Dynamics 365](https://docs.microsoft.com/learn/modules/work-with-requirements/index)

