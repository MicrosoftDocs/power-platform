---
title: Manage feature settings
description: Learn how to manage feature settings to adjust how features appear and function in Power Platform.
author: sericks007
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/17/2024
ms.subservice: admin
ms.author: sericks
ms.reviewer: sericks
contributors:
    - V-Camille
    - jasongr
    - v-aangie
search.audienceType: 
  - admin
ms.collection: 
    - bap-ai-copilot
---

# Manage feature settings

Use feature settings to adjust how features appear and function in Power Apps [canvas apps](/power-apps/maker/canvas-apps/getting-started) and [model-driven apps](/powerapps/maker/model-driven-apps/model-driven-app-overview).

These settings can be found in the Power Platform admin center by going to **Environments** > [select an environment] > **Settings** > **Product** > **Features**.

To update the business closures, make sure you have the System Administrator or System Customizer security role or equivalent permissions.

**Check your security role**

- Follow the steps in [View your user profile](/powerapps/user/view-your-user-profile).
- Don't have the correct permissions? Contact your system administrator.

> [!NOTE]
> These settings might not yet be available in your environment. The settings availability depends on the region's release plan.

## Copilot (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]

> [!NOTE]
> Turning off Copilot in Power Apps for your tenant turns off [Copilot for makers](/power-apps/maker/canvas-apps/ai-conversations-create-app). It doesn't turn off [Copilot control for canvas apps](/power-apps/maker/canvas-apps/add-ai-copilot), [Copilot for model-driven apps](/power-apps/maker/canvas-apps/add-ai-copilot), or [Copilot in Dynamics 365 Sales apps](/dynamics365/sales/enable-setup-copilot). 

| Setting | Description | Default value |
|---------|-------------|---------------|
| Enable new AI-powered Copilot features for people who make apps. | When **On**, enables preview Copilot features that help create apps, tables apps, tables, edit apps, generate formulas, answering how-to questions and AI Builder GPT experiences. For more information, see [AI Copilot overview ](/power-apps/maker/canvas-apps/ai-overview). <br><br>**Note**: [Generally available](general-availability-deployment.md) Copilot features are enabled by default and can't be turned off. To disable them, a tenant admin must  [contact support](get-help-support.md).| On |
| Allow users to analyze data using an AI-powered chat experience in canvas and model-driven apps. <br><br>**Note**: For model-driven apps, this environment needs to be set to the monthly release channel.| When **On**, enables Copilot in canvas apps, model-driven apps, and Dynamics 365 Sales apps for users to ask questions and have a natural language conversation about data in the app. More information: [Add Copilot control to a canvas app ](/power-apps/maker/canvas-apps/add-ai-copilot), [Add Copilot to model-driven apps](/power-apps/maker/model-driven-apps/add-ai-copilot) and [Enable and configure Copilot in Dynamics 365 Sales](/dynamics365/sales/enable-setup-copilot). When set to **Default**, only [Copilot in Dynamics 365 Sales apps](/dynamics365/sales/enable-setup-copilot) is enabled. | Off |
| Allow canvas editors to insert the Copilot answer component, which allows users to receive an AI-powered answer to a predefined data query.| When **On**, lets makers add a Copilot answer control that allows users to receive an AI-powered answer to a predefined question set by a maker. More information: [Use Copilot answer control for canvas apps (preview)](/power-apps/maker/canvas-apps/copilot-answer-control-overview).| Off |

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## Copilot for Microsoft 365

| Setting | Description | Default value |
|---------|-------------|---------------|
| Allow data and objects in this environment to be used with Copilot for Microsoft 365. | Use this setting to allow integration of Copilot agents from this environment. Learn more in [Use actions in Microsoft Copilot](/microsoft-copilot-studio/copilot-plugins-overview#use-actions-in-microsoft-copilot).  | Off |

## AI Builder

| Setting | Description | Default value |
|---------|-------------|---------------|
| Enable the usage of AI Builder model types that are in preview.  | If **Off**, the environment won't have access to AI Builder. Not all environments have this setting. Learn more about environments that are eligible for this feature and related details in [Administer AI Builder](/ai-builder/administer).  | On |

## AI prompts

| Setting | Description | Default value |
|---------|-------------|---------------|
| Enable the AI prompts feature in Power Platform and Copilot Studio. | If you turn off AI prompts, you aren't be able to use custom or prebuilt prompts. These prompts are essential for tasks like summarizing, categorizing, translating, text completion and generation, and more. They help automate and streamline your work in Power Automate, Power Apps, and Copilot Studio.<br><br>Learn more in [Enable or disable AI prompts in Power Platform and Copilot Studio](/ai-builder/administer#enable-or-disable-ai-prompts-in-power-platform-and-copilot-studio). | On |

## AI form fill assistance

| Setting | Description | Default value |
|---------|-------------|---------------|
|Enable this feature for:  | Allow AI to generate suggestions for fields in model-driven apps. More information: [Copilot assistance for form fill in model-driven apps](/power-apps/user/form-filling-assistance)  | Users as the feature becomes available |

## AI suggestions for formula columns

| Setting | Description | Default value |
|---------|-------------|---------------|
| AI suggestions for formula columns  | If **On**, app makers are able to describe what the formula should do and get AI generated results to help create or edit a Microsoft Dataverse formula column. Formula suggestions in formula columns accept natural language input to interpret and suggest a Power Fx formula using GPT-based AI model. More information: [Get formula suggestions](/power-apps/maker/data-platform/formula-columns#get-formula-suggestions-preview-1)  | Off |

## Embedded content

| Setting | Description | Default value |
|---------|-------------|---------------|
|Power BI visualization embedding| More information: [Add or edit Power BI visualizations on your dashboard](/powerapps/user/add-powerbi-dashboards)| Off |
|Bing Maps| If **On**, Customer Engagement (on-premises) users need to enter a Bing Maps key. Users don't need to enter a key. | Off | 
|Prevent social data in Dynamics | If you don't want to receive social data in customer engagement apps (such as Dynamics 365 Sales and Customer Service), select **Off**. If you disable social engagement, your organization won't be able to receive social data in customer engagement apps (such as Dynamics 365 Sales and Customer Service). Users can continue to work with existing social data, however.| Off  |

## Communications

| Setting | Description | Default value |
|---------|-------------|---------------|
|Country/region code prefixing for numbers|If **On**, customer engagement apps will prefix the country/region code to numbers that users are trying to call.|  On|

## Hosted RPA

| Setting | Description | Default value |
|---------|-------------|---------------|
| Enable hosted machine groups.| If **On**, users can run unattended automation at scale with [hosted machine group](/power-automate/desktop-flows/hosted-machine-groups).  | On |
| Enable work or school accounts for hosted machine groups.| If **On**, your hosted machine group has access to your resources that are part of [your work or school account](/power-automate/desktop-flows/hosted-machine-groups#use-your-work-or-school-account). | On |
| Enable hosted machines.| If **On**, users can build, test, and run attended and unattended desktop flows without providing or setting up any physical machine with [hosted machines](/power-automate/desktop-flows/hosted-machines). | On |
| Enable cross-geo support for hosted machines| If **On**, this allows users to provision hosted machines in a geography different from that of the configured tenant country. More information: [Azure tenant country/region and supported geographies in the public cloud](/power-automate/desktop-flows/hosted-machines#azure-tenant-countryregion-and-supported-geographies-in-the-public-cloud). | On |

## Enhanced desktop flows schema

| Setting | Description | Default value |
|---------|-------------|---------------|
| Enable storage of desktop flow files into v2 schema.| If **On**, Dataverse database consumption for paid license users is reduced. Also, it offloads components of your desktop flows into your Dataverse for Apps File Capacity. More information: [Enable the v2 schema](/power-automate/desktop-flows/schema#enable-the-v2-schema). | On |
| Opt-out of desktop flow schema v2 enabled by default.| In 2024, v2 schema will be turned **On** for all environments without the option to disable the feature. We recommend that you enable the feature in advance so users can benefit from the product enhancements that come with it. More information: [Schema v2 enabled by default](/power-automate/desktop-flows/schema#schema-v2-enabled-by-default).  | Off |

## Grids and views

| Setting | Description | Default value |
|---------|-------------|---------------|
| Enable the modern read-only grid experience. | If **On**, the Power Apps read-only grid control lets users view and open records from views and subgrids. | On |
|Show the Edit columns button on views |  If **On**, users can create personal views by adding, removing, and reordering columns on a view accessible to them in a model-driven app. More information: [Edit columns on a grid page](/powerapps/user/grid-filters-advanced#column-editor). This setting only appears if you enabled 2022 Release Wave 1. |  On| 
|Show the Edit filters button on views | If **On**, users can create personal views by filtering data based on conditional expressions starting with a view accessible to them in a model-driven app. More information: [Edit filters on a grid page](/powerapps/user/grid-filters-advanced#filter-editor). This setting only appears if you enabled 2022 Release Wave 1.| On |

## Advanced find options

| Setting | Description | Default value |
|---------|-------------|---------------|
|Modern advanced find in model-driven apps| If **On**, legacy advanced find is replaced with a modern experience that enhanced view management capabilities like searching on views and the ability to share, hide, and delete personal views. More information: [Advanced find in model-driven apps](/powerapps/user/advanced-find). This setting only appears if you enabled 2022 Release Wave 1. |  On|
|Allow users to hide system views| If **On**, users can hide system views in the view selector to manage their view list in model-driven apps. More information: [Hide views on a grid page](/powerapps/user/grid-filters-advanced#hide-views). This setting only appears if you enabled 2022 Release Wave 1.| Off |

## Activities

| Setting | Description | Default value |
|---------|-------------|---------------|
| Show only activities configured in the app when accessing **New activity** button in related activities of a record. Setting to **Off** shows all activities.   | To limit the number of activities showing up in the **New Activity** dropdown list to activities that are relevant to the model-driven app, select **On**. |Off |

## Asynchronous merge

| Setting | Description | Default value |
|---------|-------------|---------------|
| Allow records to be merged asynchronously | If **On**, records merged through the Unified Client interface are merged asynchronously in the background. |Off |

## Create new canvas apps and cloud flows in a Dataverse solution

> [!IMPORTANT]
> This is a preview feature.

| Setting | Description | Default value |
|---------|-------------|---------------|
| Canvas apps | More information: [Add canvas apps and cloud flows to solution by default (preview)](/power-apps/maker/canvas-apps/add-app-solution-default) | Off |
| Cloud flows | More information: [Add canvas apps and cloud flows to solution by default (preview)](/power-apps/maker/canvas-apps/add-app-solution-default) | Off |

## Preferred solution

> [!IMPORTANT]
> This is a preview feature.

| Setting | Description | Default value |
|---------|-------------|---------------|
| Preferred solution | Lets makers set which unmanaged solution maintains their created and edited components that occur anywhere in Power Apps. If not set, all components for all makers not already in the context of an unmanaged solution are maintained in the Common Data Services Default Solution. More information: [Set the preferred solution](/power-apps/maker/data-platform/preferred-solution) | Off |

## Block unmanaged customizations

> [!IMPORTANT]
> This is a preview feature.

| Setting | Description | Default value |
|---------|-------------|---------------|
| Block unmanaged customizations |  Prevents the creation of unmanaged customizations in Dataverse environments, which facilitates healthy application lifecycle management. More information: [Block unmanaged customizations (preview)](../alm/block-unmanaged-customizations.md) | Off |

## Finance and Operations in Dataverse

| Setting | Description | Default value |
|---------|-------------|---------------|
| Enable Finance and Operations user impersonation in Dataverse | When enabled, the Finance and Operations application in this environment has permissions to impersonate Dataverse users. This allows users of Finance and Operations to make calls to Dataverse which run as that same user in Dataverse, using the Dataverse permissions assigned to that user. Only select this option if the Finance and Operations administrator is trusted with the same level of permissions in Dataverse as the Dataverse administrator. | Off |

> [!IMPORTANT]
> Beginning March 1, 2024, the **Enable Finance and Operations user impersonation in Dataverse** toggle will be removed. With continued efforts to unify finance and operations apps with the Power Platform through the [Power Platform integration](/dynamics365/fin-ops-core/dev-itpro/power-platform/overview) and [unified admin experiences](unified-experience/finance-operations-apps-overview.md), finance and operations apps are now considered applications within the Power Platform environment. In a unified environment, the capabilities granted by the toggle are now assumed to be true for any environment with finance and operations apps installed with the same level of governance, oversight and scrutiny as all other apps in a Power Platform environment.

## Data validation

| Setting | Description | Default value |
|---------|-------------|---------------|
| Enable email address validation in model-driven apps (preview).  |  When **On**, enables smart data validation for certain columns, such as text columns using the email format. More information: [Address validation for email columns](/power-apps/maker/data-platform/data-validation-email-column) | Off |

## Power Automate capacity

| Setting | Description | Default value |
|---------|-------------|---------------| 
| Allow process capacity overage  |  When **On**, enables machines and cloud flows to go into process capacity overage. New process capacity overage is only possible in an environment with at least one process / hosted process / unattended capacity assigned. More information: [Process capacity overage](/power-automate/desktop-flows/capacity-utilization-process#capacity-overage) | On |
| Allow auto-claim of process capacity |  When **On**, enables auto-assignation of process capacity to the environment (if any is available in the admin center) when required by an assignation of process capacity to a cloud flow, or to a machine while there's no available capacity in the environment. More information: [Process capacity](/power-automate/desktop-flows/capacity-process) | On |

## Search

| Setting | Description | Default value |
|---------|-------------|---------------|
|Dataverse search| If **On**, you can use Dataverse search to find records across multiple tables, sorted by relevance.| Off|
|Share search analytics with Microsoft |  To help Microsoft improve Dataverse search, you can share your environment's Dataverse search queries in Dynamics 365 and Power Platform applications with Microsoft. More information: [Help improve Dataverse search](configure-relevance-search-organization.md#help-improve-dataverse-search)      |Off|
|Single table search option| If **On**, users get another option to search on a single table on view pages of search-enabled tables in all model-driven apps.|Off|
|Prevent slow keyword filter for quick find terms on view pages |  If **On**, users are prevented from searching with keywords that begin with an asterisk (\*) in grid search in all model-driven apps, and a message displays in the application. If **Off**, users can search with keywords that begin with an asterisk (\*) in grid search in all model-driven apps, but an information tooltip displays indicating the search might be slow. More information: [Grid search](/power-apps/user/grid-filters#grid-search) | Off|
|Quick Find record limits| If **On**, if more than 10,000 records are found, a message displays that suggests a more selective search. More information: [Configure Dataverse search for the organization](configure-relevance-search-organization.md)| On |
| Use quick find view of an entity for searching on grids and sub-grids|  Select **Yes** to show the traditional Quick Find search in an entity grid. The traditional Quick Find search applies the [Quick Find View](/powerapps/maker/model-driven-apps/create-edit-views#system-views) filters and displays the Quick Find columns after searching.  |Off|
| Search for records in Microsoft 365 apps | You can quickly enable your users to access the records they most recently used in their application.  The records are available in the Outlook Web client using a simple /mention gesture.  | On |

## Map and address services

| Setting | Description | Default value |
|---------|-------------|---------------|
| Limited   |  Select **On** to allow map display, latitude, and longitude pins, and shapes.  |On|
| Full      | In addition to the Limited actions, allows map routing, address input control, and pins loaded from addresses. | Off |

## Help features

| Setting | Description | Default value |
|---------|-------------|---------------|
|Custom help for customizable tables| Select **On** to replace the default Help content with custom Help designed for your users. After you enable custom Help, you can enter a Global Custom Help URL.|  Off |
|Global custom help URL| To replace the default Help with a single URL for all customizable record types (tables), enter the URL here. You also have the option of entering override URLs for each record type (table) for customizable record types. More information: [Create your own guided help](/powerapps/maker/model-driven-apps/create-guided-help-learning-path)|  No default value |
|Append parameters to URL| Select **On** to append parameters to the URL, you can make your Help content more dynamic. For example, you can access parameters for User Language Code, Table Name, Entry Point, and Form ID. More information: [Create your own guided help](/powerapps/maker/model-driven-apps/create-guided-help-learning-path)|  Not selected|
| Enable Custom Help Panes | Select **On** to enable a custom in-product help experience that is tailored to your organization. More information: [Create guided help for your Unified Interface app](/power-apps/maker/data-platform/create-custom-help-pages).|  Off|

## Power Apps component framework for canvas apps

| Setting | Description | Default value |
|---------|-------------|---------------|
|Allow publishing of canvas apps with code components| Enables Power Apps component framework feature that allows the execution of code that might not be generated by Microsoft when a maker adds code components to an app. Make sure that the code component solution is from a trusted source. More information: [Code components for canvas apps](/powerapps/developer/component-framework/component-framework-for-canvas-apps) | Off |

## Delete disabled users

| Setting | Description | Default value |
|---------|-------------|---------------|
|Enable delete disabled users| Delete disabled users permanently from the environment. More information: [Permanently delete users](delete-users.md#permanently-delete-users-in-power-platform) |Off |

## TDS endpoint

| Setting | Description | Default value |
|---------|-------------|---------------|
|Enable TDS endpoint |  Enables [Tabular Data Stream](/openspecs/windows_protocols/ms-tds/893fcc7e-8a39-4b3c-815a-773b7b982c50) (TDS) endpoint (a SQL data connection) for Microsoft Dataverse in an environment. More information: [Use SQL to query data](/powerapps/developer/common-data-service/cds-sql-query) and [View entity data in Power BI Desktop](/powerapps/maker/common-data-service/view-entity-data-power-bi)|On |
|Enable user level access control for TDS endpoint | When off, all environment users have access to the TDS endpoint. If on, users only have access when members of a security role that has the **Allow user to access TDS endpoint** privilege. More information: [Control access of the TDS endpoint](control-tds-settings.md) | Off |

## Record ownership across business units

| Setting | Description | Default value |
|---------|-------------|---------------|
| Record ownership across business units   |  Set to **On** to enable the Matrix data access structure. Not recommended for production environments.  More information: [Matrix data access structure (Modernize Business Units - Preview)](wp-security-cds.md#matrix-data-access-structure-modernized-business-units) |Off|

## Disable empty address record creation

|Setting  |Description  |Default value  |
|---------|---------|---------|
|Disable empty address record creation in Dataverse | When **On**, if the incoming payload doesn't have any address relevant data, an empty address data record aren't created. This feature is supported only for **Account** and **Contact** tables. More information: [Disable empty record creation](/power-apps/developer/data-platform/customer-entities-account-contact#disable-empty-record-creation) |    Off    |

## Enable deletion of address records

|Setting  |Description  |Default value  |
|---------|---------|---------|
|Enable deletion of address records in Dataverse |When **On**, address records created in Dataverse for **Account** and **Contact** tables can be deleted through the user interface or through bulk deletion. More information: [Delete embedded address records](/power-apps/developer/data-platform/customer-entities-account-contact#delete-embedded-address-records)|    Off    |

## Power Apps ideas for canvas apps

| Setting | Description | Default value |
|---------|-------------|---------------|
| Share ideas query data to help improve ideas results. |To help Microsoft improve Power Apps Ideas, you can share your ideas query data with Microsoft. More information: [Power Apps Ideas (preview)](/power-apps/maker/canvas-apps/power-apps-ideas).|  Off |

## Power BI components (preview)

| Setting | Description | Default value |
|---------|-------------|---------------|
 |Allow creation of Power BI components  |  If **Off**, the environment doesn't have access to Power BI. Environments with a Dataverse database have this setting. Creating a Power BI component generates a dedicated Power BI workspace for that environment. All the Power BI artifacts corresponding to the Power BI components created in an environment are generated in that dedicated Power BI environment workspace. More information: [Permission sync between Power Apps environment and Power BI workspace](/power-apps/maker/model-driven-apps/customize-manage-powerbi-components#permission-sync-between-power-apps-environment-and-power-bi-workspace) |On |
|Automatically assign permission to Power BI workspaces | If **On**, synchronization takes place between predefined role privileges and the permissions of the dedicated Power BI environment workspace. The following roles are assigned with permissions:<br/><br/>System administrator:Power BI workspace admin > Power BI workspace admin permission.<br/><br/> System Customizer:Power BI workspace contributor > Power BI workspace contributor permission.<br/><br/> Power BI workspace viewer > Power BI workspace viewer permission.<br/><br/> [Learn more about Power BI workspace permission](/power-bi/collaborate-share/service-roles-new-workspaces#workspace-roles). | On|
 |Allow information sharing between this environment and Power BI workspaces in other geographic regions | When this setting is **On** and the Power BI tenant setting **[Power Platform interregional access](/power-bi/admin/service-admin-portal-integration#power-platform-interregional-access)** is also **On**, cross-geo operations can take place. For more information, see [Cross-geo operations](/power-bi/collaborate-share/service-power-bi-powerapps-integration-considerations#cross-geo-operations). |On|

## Recycle Bin (preview)

|Setting  |Description  |Default value  |
|---------|---------|---------|
| Enable recycle bin for Dataverse tables  | When **On**, you can use recycle bin for Dataverse tables to restore deleted records.       |    **Off**     |
|Configure recovery time interval     | Recover table record data for up to *30* days after the record was deleted. More information: [Restore deleted Microsoft Dataverse table records](restore-deleted-table-records.md)       |   **30**      |

