---
title: "Manage email feature settings | MicrosoftDocs"
description: View and manage feature settings for Common Data Service.
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/07/2019
ms.author: jimholtz 
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Manage feature settings 

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Use feature settings to adjust how features appear and function in Dynamics 365 model-driven apps such as Dynamics 365 Sales and Dynamics 365 Customer Service.

These settings can be found in the Power Platform admin center by going to **Environments** > [select an environment] > **Settings** > **Features**.

Make sure you have the System Administrator or System Customizer security role or equivalent permissions to update the business closures.

**Check your security role**

- Follow the steps in [View your user profile](https://docs.microsoft.com/powerapps/user/view-your-user-profile).
- Don’t have the correct permissions? Contact your system administrator.

## Settings 

> [!div class="mx-tableFixed"]
> |Settings|Description|  
> |--------------|-----------------|  
> |**AI Builder (preview)**  |   |
> |Create AI models in Power Apps  | Default: On. If **Off**, the environment will not have access to AI Builder. Not all environments will have this setting. For information about environments eligible for this feature and related details, see [Administer AI Builder](https://docs.microsoft.com/ai-builder/administer)  |
> |**Embedded content**||  
> |Power BI visualization embedding|Default: Off. More information: [Add or edit Power BI visualizations on your dashboard](https://docs.microsoft.com/powerapps/user/add-powerbi-dashboards)|  
> |Bing Maps|Default: Off. If **On**, Customer Engagement (on-premises) users will need to enter a Bing Maps key. Users don’t need to enter a key. |  
> |Prevent social data in Dynamics|Default: Off. If you don’t want to receive social data in model-driven apps in Dynamics 365, select **Off**. If you disable social engagement, your organization will not be able to receive social data in model-driven apps in Dynamics 365. Users can continue to work with existing social data, however.|  
> |**Communications**| |
> |Skype presence|Default: On. If **On**, instant messaging will display the current status for users, contacts, opportunities, or leads. This only applies to lists and sub-lists for entities with an updated user interface.|  
> |Country/region code prefixing for numbers|Default: On. If **On**, model-driven apps in Dynamics 365 will prefix the country/region code to numbers that users are trying to call.|  
> |Set the telephony provider|Default: On. Choose which provider to enable outbound calls from within model-driven apps in Dynamics 365. This setting doesn’t apply to Dynamics 365 for tablets or Dynamics 365 for phones.|  
> |Use Skype| Default: enabled. [More information: Set up model-driven apps in Dynamics 365 to use Skype or Skype for Business](set-up-skype-or-skype-for-business.md)|
> |Use Skype for Business| Default: not enabled. |
> |**Search**||  
> |Relevance Search|Default: Off. If **On**, you can use Relevance search to find records across multiple entities, sorted by relevance.|  
> |Quick Find record limits|Default: On. If **On**, if more than 10,000 records are found, a message will be displayed that suggests a more selective search. More information: [Configure Relevance search for the organization](configure-relevance-search-organization.md)| 
> |**Help features**||  
> |Custom help for customizable entities|Default: Off. Select **On** to replace the default Help content with custom Help designed for your users. After you enable custom Help, you can enter a Global Custom Help URL.|  
> |Global custom help URL| To replace the default Help with a single URL for all customizable record types (entities), enter the URL here. You also have the option of entering override URLs for each record type (entity) for customizable record types. More information: [Create your own guided help](https://docs.microsoft.com/powerapps/maker/model-driven-apps/create-guided-help-learning-path)|  
> |Append parameters to URL|Default: Not selected.  Select **On** to append parameters to the URL, you can make your Help content more dynamic. For example, you can access parameters for User Language Code, Entity Name, Entry Point, and Form ID. More information: [Create your own guided help](https://docs.microsoft.com/powerapps/maker/model-driven-apps/create-guided-help-learning-path)|  
> |Learning path|Default: Off. Changes access to Learning Path for an entire organization. More information: [On-off switch for Learning Path (guided help)](on-off-switch-for-learning-path-guided-help.md).|  
> |Learning path authoring|Default: Off. Set to **On** if you want enable users to author Learning Path content. More information: [Create your own guided help (Learning Path) for your customers](https://docs.microsoft.com/powerapps/maker/common-data-service/create-custom-help-pages)|
> |**Auditing**| |
> |Start Auditing|Default: Off. Start or stop auditing.|  
> |Log access|Default: Off. If enabled, model-driven apps in Dynamics 365 track when the user started accessing model-driven apps in Dynamics 365 and whether or not the user accessed the application by using the web application or Dynamics 365 for Outlook.| 
> |Read logs |Default: Off. | 

