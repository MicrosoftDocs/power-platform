---
title: "Manage feature settings | MicrosoftDocs"
description: Manage feature settings to adjust how features appear and function in Power Platform.
author: KumarVivek
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/05/2023
ms.subservice: admin
ms.author: kvivek 
contributors:
    - ProfessorKendrick
search.audienceType: 
  - admin
---
# Manage feature settings

Use feature settings to adjust how features appear and function in Power Apps [model-driven apps](/powerapps/maker/model-driven-apps/model-driven-app-overview) and in Dynamics 365 model-driven apps such as Dynamics 365 Sales and Dynamics 365 Customer Service.

These settings can be found in the Power Platform admin center by going to **Environments** > [select an environment] > **Settings** > **Product** > **Features**.

Make sure you have the System Administrator or System Customizer security role or equivalent permissions to update the business closures.

**Check your security role**

- Follow the steps in [View your user profile](/powerapps/user/view-your-user-profile).
- Don’t have the correct permissions? Contact your system administrator.

> [!NOTE]
> These settings might not yet be available in your environment. The settings availability depends on the region's release plan.

## Settings

> [!div class="mx-tableFixed"]
> |Settings|Description|  
> |--------------|-----------------|  
> |AI Builder  |   |
> |AI Builder preview models  | Default: On. If **Off**, the environment will not have access to AI Builder. Not all environments will have this setting. For information about environments eligible for this feature and related details, see [Administer AI Builder](/ai-builder/administer)  |
> |**Embedded content**||  
> |Power BI visualization embedding|Default: Off. More information: [Add or edit Power BI visualizations on your dashboard](/powerapps/user/add-powerbi-dashboards)|  
> |Bing Maps|Default: Off. If **On**, Customer Engagement (on-premises) users will need to enter a Bing Maps key. Users don’t need to enter a key. |  
> |Prevent social data in Dynamics|Default: Off. If you don’t want to receive social data in customer engagement apps (such as Dynamics 365 Sales and Customer Service), select **Off**. If you disable social engagement, your organization will not be able to receive social data in customer engagement apps (such as Dynamics 365 Sales and Customer Service). Users can continue to work with existing social data, however.|
> |**Power BI components**  ||
> |Allow creation of Power BI components  | Default: On. If **Off**, the environment will not have access to Power BI. Environments with a Dataverse database will have this setting. Creating a Power BI component will generate a dedicated Power BI workspace for that environment. All the Power BI artifacts corresponding to the Power BI components created in an environment will be generated in that dedicated Power BI environment workspace. See [Permission sync between Power Apps environment and Power BI workspace](/power-apps/maker/model-driven-apps/customize-manage-powerbi-components#permission-sync-between-power-apps-environment-and-power-bi-workspace) for more information. |
> |Automatically assign permission to Power BI workspaces |Default: On. If **On**, synchronization will take place between pre-defined role privileges and the permissions of the dedicated Power BI environment workspace. The following roles will be assigned with permissions:<br/><br/>System administrator:Power BI workspace admin > Power BI workspace admin permission.<br/><br/> System Customizer:Power BI workspace contributor > Power BI workspace contributor permission.<br/><br/> Power BI workspace viewer > Power BI workspace viewer permission.<br/><br/> [Learn more about Power BI workspace permission](/power-bi/collaborate-share/service-roles-new-workspaces#workspace-roles). |
> |Allow information sharing between this environment and Power BI workspaces in other geographic regions |Default: On. When this setting is **On** and the Power BI tenant setting **[Power Platform interregional access](/power-bi/admin/service-admin-portal-integration#power-platform-interregional-access)** is also **On**, cross-geo operations can take place. For more information, see [Cross-geo operations](/power-bi/collaborate-share/service-power-bi-powerapps-integration-considerations#cross-geo-operations). |
> |**Communications**| |
> |Country/region code prefixing for numbers|Default: On. If **On**, customer engagement apps will prefix the country/region code to numbers that users are trying to call.|  
> |Set the telephony provider|Default: On. Choose which provider to enable outbound calls from within customer engagement apps. This setting doesn’t apply to Dynamics 365 for tablets or Dynamics 365 for phones.|  
> |Use Skype| Default: enabled. More information:  [Set up customer engagement apps to use Skype or Skype for Business](set-up-skype-or-skype-for-business.md)|
> |Use Skype for Business| Default: not enabled. |
> | Hosted RPA bots (Preview) | Default: On. If **On**, users can run unattended automation at scale without the need to provide or setup any machine. More information: [Hosted RPA bots (preview)](/power-automate/desktop-flows/hosted-rpa-bots).
> |**Grids and views**||  
> | Enable the modern read-only grid experience. | Default: On. If **On**, the Power Apps read-only grid control lets users view and open records from views and subgrids. |
> |Show the Edit columns button on views | Default: On. If **On**, users can create personal views by adding, removing, and reordering columns on a view accessible to them in a model-driven app. More information: [Edit columns on a grid page](/powerapps/user/grid-filters-advanced#column-editor). This setting only appears if you have enabled 2022 Release Wave 1. |  
> |Show the Edit filters button on views | Default: On. If **On**, users can create personal views by filtering data based on conditional expressions starting with a view accessible to them in a model-driven app. More information: [Edit filters on a grid page](/powerapps/user/grid-filters-advanced#filter-editor). This setting only appears if you have enabled 2022 Release Wave 1.|
> |**Advanced find options**||  
> |Modern advanced find in model-driven apps|Default: Off. If **On**, legacy advanced find will be replaced with a modern experience that has enhanced view management capabilities like searching on views and the ability to share, hide, and delete personal views. More information: [Advanced find in model-driven apps](/powerapps/user/advanced-find). This setting only appears if you have enabled 2022 Release Wave 1. |  
> |Allow users to hide system views|Default: Off. If **On**, users can hide system views in the view selector to manage their view list in model-driven apps. More information: [Hide views on a grid page](/powerapps/user/grid-filters-advanced#hide-views). This setting only appears if you have enabled 2022 Release Wave 1.|
> |Show advanced lookup in lookup fields within Edit filters|Default: Off. If **On**, users see **Advanced lookup**, an option to see more fields and search for records within a specific view, when looking up a value as part of a condition in Edit filters panel in all model-driven apps.|
> |Show co-presence of colleagues on forms | Default: Off. Turn **On**, to allow users to see each others presence status on a form when they're working on the same record. For more information see, [Collaborate with others in model-driven apps](/powerapps/user/collaboration).  |
> | **Activities**   | Default: Off. Select **On** to limit the number of activities showing up in the **New Activity** dropdown list to activities that are relevant to the model-driven app. |
> |**Asynchronous merge** | |
> | Allow records to be merged asynchronously | Default: Off. If **On**, records merged through the Unified Client interface will be merged asynchronously in the background. |
> |**Search**||  
> |Dataverse search|Default: Off. If **On**, you can use Dataverse search to find records across multiple tables, sorted by relevance.|
> |Share search analytics with Microsoft | Default: Off. To help Microsoft improve Dataverse search, you can share your environment's Dataverse search queries in Dynamics 365 and Power Platform applications with Microsoft. More information: [Help improve Dataverse search](configure-relevance-search-organization.md#help-improve-dataverse-search)      |
> |Single table search option|Default: Off. If **On**, users will see an additional option to search on a single table on view pages of search-enabled tables in all model-driven apps.|
> |Prevent slow keyword filter for quick find terms on view pages | Default: Off. If **On**, users will be prevented from searching with keywords that begin with an asterisk (\*) in grid search in all model-driven apps, and a message will be displayed in the application. If **Off**, users can search with keywords that begin with an asterisk (\*) in grid search in all model-driven apps, but an information tooltip will be displayed indicating the search might be slow. More information: [Grid search](/power-apps/user/grid-filters#grid-search) |
> |Quick Find record limits|Default: On. If **On**, if more than 10,000 records are found, a message will be displayed that suggests a more selective search. More information: [Configure Dataverse search for the organization](configure-relevance-search-organization.md)|
> | Use Quick Find View of an entity for searching on grids and sub-grids| Default Off. Select **Yes** to show the traditional Quick Find search in an entity grid. The traditional Quick Find search applies the [Quick Find View](/powerapps/maker/model-driven-apps/create-edit-views#system-views) filters and displays the Quick Find columns after searching.      |
> | **Map and address services**   |    |
> | Limited   | Default: On. Select **On** to allow map display, latitude, and longitude pins, and shapes.  |
> | Full      | In addition to the Limited actions, allows map routing, address input control, and pins loaded from addresses. |
> |**Help features**|  |  
> |Custom help for customizable tables|Default: Off. Select **On** to replace the default Help content with custom Help designed for your users. After you enable custom Help, you can enter a Global Custom Help URL.|  
> |Global custom help URL| To replace the default Help with a single URL for all customizable record types (tables), enter the URL here. You also have the option of entering override URLs for each record type (table) for customizable record types. More information: [Create your own guided help](/powerapps/maker/model-driven-apps/create-guided-help-learning-path)|  
> |Append parameters to URL|Default: Not selected.  Select **On** to append parameters to the URL, you can make your Help content more dynamic. For example, you can access parameters for User Language Code, Table Name, Entry Point, and Form ID. More information: [Create your own guided help](/powerapps/maker/model-driven-apps/create-guided-help-learning-path)|  
> | Enable Custom Help Panes | Default: Off. Select **On** to enable a custom in-product help experience that is tailored to your organization. More information: [Create guided help for your Unified Interface app](/power-apps/maker/data-platform/create-custom-help-pages).
> |**Power Apps component framework for canvas apps** | Default: Off. Enables Power Apps component framework feature that allows the execution of code that may not be generated by Microsoft when a maker adds code components to an app. Make sure that the code component solution is from a trusted source. More information: [Code components for canvas apps](/powerapps/developer/component-framework/component-framework-for-canvas-apps) |
> |**Delete disabled users (preview)** | Default: Off. Delete disabled users permanently from the environment. More information: [Permanently delete users](delete-users.md#permanently-delete-users-in-power-platform) |
> |**TDS endpoint** | Default: On. Enables [Tabular Data Stream](/openspecs/windows_protocols/ms-tds/893fcc7e-8a39-4b3c-815a-773b7b982c50) (TDS) endpoint (a SQL data connection) for Microsoft Dataverse in an environment. More information: [Use SQL to query data](/powerapps/developer/common-data-service/cds-sql-query) and [View entity data in Power BI Desktop](/powerapps/maker/common-data-service/view-entity-data-power-bi)|
> | **Record ownership across business units (Preview)**  | Default: Off. Set to **On** to enable the Matrix data access structure. Not recommended for production environments.  More information: [Matrix data access structure (Modernize Business Units - Preview)](wp-security-cds.md#matrix-data-access-structure-modernized-business-units) |
> | **Dynamics 365 Sales mobile app** |  |
> | Create new records and activities using Unified Interface forms instead of quick view forms | Default: Off. |
> | Disable the option to quick create new records and activities in the Mobile application | Default: Off. |
> | Edit and view records and activities using Unified Interface forms instead of quick view forms | Default: Off. |
> | **Power Apps Ideas for Canvas Apps** | |
> | Share ideas query data to help improve ideas results. | Default: Off. To help Microsoft improve Power Apps Ideas, you can share your ideas query data with Microsoft. More information: [Power Apps Ideas (preview)](/power-apps/maker/canvas-apps/power-apps-ideas).
> | **Create new canvas apps as Dataverse solutions (preview)**  | Default: Off. Set to **On** to add all newly created canvas apps to the default environment solution.  More information: [Add canvas apps and cloud flows to solution by default (preview)](/power-apps/maker/canvas-apps/add-app-solution-default) |
> | **Data Validation**  | Default: Off. When **On**, enables smart data validation for certain columns, such as text columns using the email format. More information: [Address validation for email columns](/power-apps/maker/data-platform/data-validation-email-column) |

[!INCLUDE[footer-include](../includes/footer-banner.md)]
