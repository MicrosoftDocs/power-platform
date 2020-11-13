---
title: "Manage feature settings | MicrosoftDocs"
description: View and manage feature settings for Microsoft Dataverse.
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/19/2020
ms.author: jimholtz 
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Manage feature settings

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

Use feature settings to adjust how features appear and function in Dynamics 365 model-driven apps such as Dynamics 365 Sales and Dynamics 365 Customer Service.

These settings can be found in the Power Platform admin center by going to **Environments** > [select an environment] > **Settings** > **Product** > **Features**.

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
> |**Power Apps component framework for canvas apps**  |  |
> |Allow publishing of canvas apps with code components | Default: Off. Enables Power Apps component framework feature that allows the execution of code that may not be generated by Microsoft when a maker adds code components to an app. Make sure that the code component solution is from a trusted source. More information: [Code components for canvas apps](https://docs.microsoft.com/powerapps/developer/component-framework/component-framework-for-canvas-apps) |
> |**TDS endpoint (Preview)** | Default: Off. Enables [Tabular Data Stream](https://docs.microsoft.com/openspecs/windows_protocols/ms-tds/893fcc7e-8a39-4b3c-815a-773b7b982c50) (TDS) endpoint (a SQL data connection) for Microsoft Dataverse in an environment. This option is only available for environments enabled for this [public preview](what-are-preview-features-how-do-i-enable-them.md) and version 9.1.0.17437 or higher. To determine your version, select an environment and review the information under **Version**. More information: [Use SQL to query data (Preview)](https://docs.microsoft.com/powerapps/developer/common-data-service/cds-sql-query) and [View entity data in Power BI Desktop (Preview)](https://docs.microsoft.com/powerapps/maker/common-data-service/view-entity-data-power-bi)
