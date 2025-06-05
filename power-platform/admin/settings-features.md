---
title: Manage feature settings
description: Learn how to manage feature settings to adjust how features appear and function in Power Platform.
author: sericks007
ms.component: pa-admin
ms.topic: concept-article
ms.date: 05/28/2025
ms.subservice: admin
ms.custom: NewPPAC
ms.author: sericks
ms.reviewer: sericks
contributors:
    - jekom1
    - sriharibs-msft 
    - V-Camille
    - jasongr
    - v-aangie
ms.Contributors:
    - v-linhvovan
search.audienceType: 
  - admin
ms.collection: 
    - bap-ai-copilot
---

# Manage feature settings

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Use feature settings to adjust how features appear and function in Power Apps [canvas apps](/power-apps/maker/canvas-apps/getting-started) and [model-driven apps](/powerapps/maker/model-driven-apps/model-driven-app-overview).

These settings can be found in the Power Platform admin center for an environment.

## [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.
1. Expand **Product**, and then select **Features**. 

## [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.
1. Expand **Product**, and then select **Features**. 
---

Make sure you have the System Administrator security role or equivalent permissions to update the settings. To check your security role, see [View your user profile](/powerapps/user/view-your-user-profile). If you don’t have the correct permissions, contact your system administrator.

> [!NOTE]
> These settings might not yet be available in your environment. The settings availability depends on the region's release plan.

## Copilot (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

> [!NOTE]
> Turning off Copilot in Power Apps for your tenant turns off [Copilot for makers](/power-apps/maker/canvas-apps/ai-conversations-create-app). It doesn't turn off [Copilot control for canvas apps](/power-apps/maker/canvas-apps/add-ai-copilot), [Copilot for model-driven apps](/power-apps/maker/canvas-apps/add-ai-copilot), or [Copilot in Dynamics 365 Sales apps](/dynamics365/sales/enable-setup-copilot).

| Setting | Description | Default value |
|---------|-------------|---------------|
| Enable new AI-powered Copilot features for people who make apps. | When **On**, lets preview Copilot features that help create apps, tables apps, tables, edit apps, generate formulas, answering how-to questions and AI Builder GPT experiences. Learn more in [AI Copilot overview ](/power-apps/maker/canvas-apps/ai-overview). <br><br>**Note**: [Generally available](general-availability-deployment.md) Copilot features are turned on by default and can't be turned off. To turn them off, a tenant admin must [contact support](get-help-support.md).| On |
| Allow users to analyze data using an AI-powered chat experience in canvas and model-driven apps. <br><br>**Note**: For model-driven apps, this environment needs to be set to the monthly release channel.| When **On**, lets Copilot in canvas apps, model-driven apps, and Dynamics 365 Sales apps for users to ask questions and have a natural language conversation about data in the app. Learn more in [Add Copilot control to a canvas app ](/power-apps/maker/canvas-apps/add-ai-copilot), [Add Copilot to model-driven apps](/power-apps/maker/model-driven-apps/add-ai-copilot), and [Enable and configure Copilot in Dynamics 365 Sales](/dynamics365/sales/enable-setup-copilot).<br><br>When set to **Default**, only [Copilot in Dynamics 365 Sales apps](/dynamics365/sales/enable-setup-copilot) is turned on. | Default |
| Allow canvas editors to insert the Copilot answer component, which allows users to receive an AI-powered answer to a predefined data query.| When **On**, lets makers add a Copilot answer control that allows users to receive an AI-powered answer to a predefined question set by a maker. Learn more in [Use Copilot answer control for canvas apps (preview)](/power-apps/maker/canvas-apps/copilot-answer-control-overview).| Off |

## Copilot Studio agents

### Sharing Copilot Studio agent data with Viva Insights (preview)

| Setting | Description | Default value |
|---------|-------------|---------------|
| Allow Copilot Studio to share data with Viva Insights | When **On**, enables Copilot Studio data to flow to Microsoft Viva Insights for [analytical reports](/microsoft-copilot-studio/analytics-viva-insights). Also requires [Microsoft 365 services](geographical-availability-copilot.md?tabs=new#copilots-and-generative-ai-features-that-are-available-when-you-allow-data-movement-across-regions) to be turned on. For information on what data is shared with Viva Insights, see [View advanced analytics in Microsoft Viva Insights](/microsoft-copilot-studio/analytics-viva-insights#viva-insights-advanced-insights-settings) in the Copilot Studio documentation. | On |
| Allow cross-geo boundary sharing of aggregated analytics data of your tenant preferred data location for Viva Insights is different than the location of your Copilot Studio environment | For tenants with Power Platform environments across multiple geos. When **On**, Microsoft Copilot Studio is sent and stored in the base location of the tenant in Viva Insights, even when crossing geo boundaries. Requires turning on **Allow Copilot Studio to share data with Viva Insights**.  | Off |

## Microsoft 365 Copilot

| Setting | Description | Default value |
|---------|-------------|---------------|
| Allow data and objects in this environment to be used with Microsoft 365 Copilot. | Use this setting to allow integration of Copilot plugins from this environment. Learn more in [Use actions in Microsoft Copilot](/microsoft-copilot-studio/copilot-plugins-overview#use-actions-in-microsoft-copilot).  | Off |

## AI Builder

| Setting | Description | Default value |
|---------|-------------|---------------|
| Enable the usage of AI Builder model types that are in preview.  | If **Off**, the environment doesn't have access to AI Builder model types that are in preview. Not all environments have this setting. Learn more about environments that are eligible for this feature and related details in [Administer AI Builder](/ai-builder/administer).  | On |

## AI prompts

| Setting | Description | Default value |
|---------|-------------|---------------|
| Enable the AI prompts feature in Power Platform and Copilot Studio. | If you turn off AI prompts, you aren't be able to use custom or prebuilt prompts. These prompts are essential for tasks like summarizing, categorizing, translating, text completion and generation, and more. They help automate and streamline your work in Power Automate, Power Apps, and Copilot Studio.<br><br>Learn more in [Enable or disable AI prompts in Power Platform and Copilot Studio](/ai-builder/administer#enable-or-disable-ai-prompts-in-power-platform-and-copilot-studio). | On |

## AI form fill assistance

> [!NOTE]
> Users might need to clear the cache and refresh the browser twice for the setting change to take effect.

| Setting | Description | Default value |
|---------|-------------|---------------|
|Automatic suggestions | Allow AI to generate suggestions for fields in model-driven apps. Learn more in [Use Copilot's form fill assistance feature in model-driven apps](/power-apps/user/form-filling-assistance). | Default<br><br>**Note:** If the **Default** option is selected, the feature is turned on for users of Dynamics 365 model-driven apps, and the feature is kept off for users of Power Apps model-driven apps. |
| Smart paste and file suggestions (production-ready preview) | Smart paste and file suggestions (production-ready preview) use the text or image copied to your clipboard or files you upload via the form fill assist toolbar to suggest text for specific fields. They also provide inline suggestions in the form. Learn more in [Use smart paste](/power-apps/user/form-filling-assistance#use-smart-paste-preview).  | Default<br><br>**Note:** In the monthly channel, if the **Default** option is selected, the feature is turned on for users of Dynamics 365 model-driven apps, and the feature is kept off for users of Power Apps model-driven apps. |
| Form fill assist toolbar | The form fill assist toolbar lets users access form fill assistance features, view and manage suggestions in the form, and provide feedback.  | Default<br><br>**Note:** In the monthly channel, if the **Default** option is selected, the feature is turned on for users of all model-driven apps. The toolbar appears when at least one of the above AI form fill assistance features is enabled.<br><br> You can override this setting for individual apps using the form fill assist toolbar setting in app designer, documented in [Manage model-driven app settings in the app designer](/power-apps/maker/model-driven-apps/app-properties#features).  |

Makers can learn more about form fill assistance in [Manage model-driven app settings in the app designer](/power-apps/maker/model-driven-apps/app-properties#features).

## AI suggestions for formula columns (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

| Setting | Description | Default value |
|---------|-------------|---------------|
| Allow users to get AI suggestions when creating formula columns. | If **On**, app makers are able to describe what the formula should do and get AI generated results to help create or edit a Microsoft Dataverse formula column. Formula suggestions in formula columns accept natural language input to interpret and suggest a Power Fx formula using a GPT-based AI model. Learn more in [Get formula suggestions](/power-apps/maker/data-platform/formula-columns#get-formula-suggestions-preview-1). | Off |

## Natural language grid and view search (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

| Setting | Description | Default value |
|---------|-------------|---------------|
| Enable this feature for:  | When searching for data in a grid, you can ask questions with natural language. For example, requesting “cases with high priority with overdue follow-up by date” filters your view to display only those relevant cases. Learn more in [Smart grid (preview)](/power-apps/user/grid-filters#smart-grid-preview).<br><br>To allow natural language search in an environment, users in that environment must have a Dynamics 365 license. If the environment only has users with Power Apps licensing, other Copilot licenses are required to use this feature in production.   | Users as the feature becomes available (default)<br><br>**Note**: Starting with the December monthly channel, users with Dynamics 365 licenses start seeing the feature in their apps.  We expect this rollout to be gradual. While quality of the feature is maintained for all users, it's possible that different users might see some UI variations in their experience.|
| Allow AI to generate charts to visualize the data in a view (Preview) | When **On**, users can select the **Visualize** button on the view pages of model-driven apps to see an AI-generated chart that aggregates the records in the view to show trends and distributions. Learn more in [Visualize data in a view with Copilot](/power-apps/user/visualize-data-in-copilot). | Auto<br><br>This feature is turned on by default for all users who have **Natural language grid and view search (preview)** turned on.|

## AI insight cards (preview)

| Setting | Description | Default value |
|---------|-------------|---------------|
| Displays a summary generated by Copilot on records in model-driven app main forms. | If **On**, summaries generated by Copilot are displayed to users for rows (records) on model-driven app main forms. More information: [Configure a row summary for a model-driven app main form](/power-apps/maker/data-platform/configure-form-row-summary) | Off |

## Embedded content

| Setting | Description | Default value |
|---------|-------------|---------------|
|Power BI visualization embedding| Learn more in [Add or edit Power BI visualizations on your dashboard](/powerapps/user/add-powerbi-dashboards).| Off |
|Bing Maps| If **On**, Customer Engagement (on-premises) users need to enter a Bing Maps key. Users don't need to enter a key. | Off | 
|Prevent social data in Dynamics | If you don't want to receive social data in customer engagement apps (such as Dynamics 365 Sales and Customer Service), select **Off**. If you disable social engagement, your organization can't receive social data in customer engagement apps (such as Dynamics 365 Sales and Customer Service). Users can continue to work with existing social data, however.| Off  |

## Communications

| Setting | Description | Default value |
|---------|-------------|---------------|
|Country/region code prefixing for numbers|If **On**, customer engagement apps prefix the country/region code to numbers that users are trying to call.|  On|

## Hosted RPA

| Setting | Description | Default value |
|---------|-------------|---------------|
| Enable hosted machine groups.| If **On**, users can run unattended automation at scale with [hosted machine group](/power-automate/desktop-flows/hosted-machine-groups).  | On |
| Enable work or school accounts for hosted machine groups.| If **On**, your hosted machine group has access to your resources that are part of [your work or school account](/power-automate/desktop-flows/hosted-machine-groups#use-your-work-or-school-account). | On |
| Enable hosted machines.| If **On**, users can build, test, and run attended and unattended desktop flows without providing or setting up any physical machine with [hosted machines](/power-automate/desktop-flows/hosted-machines). | On |
| Enable cross-geo support for hosted machines| If **On**, this option allows users to provision hosted machines in a geography different from the configured tenant country. Learn more in [Azure tenant country/region and supported geographies in the public cloud](/power-automate/desktop-flows/hosted-machines#azure-tenant-countryregion-and-supported-geographies-in-the-public-cloud). | On |

## Power Automate automation center

| Setting | Description | Default value |
|---------|-------------|---------------|
| Enable Power Automate automation center preview features|If **On**, preview features are available in the automation center alongside the generally available features. | On |

## Enhanced desktop flows schema

| Setting | Description | Default value |
|---------|-------------|---------------|
| Enable storage of desktop flow files into v2 schema.| If **On**, Dataverse database consumption for paid license users is reduced. Also, it offloads components of your desktop flows into your Dataverse for Apps File Capacity. Learn more in [Enable the v2 schema](/power-automate/desktop-flows/schema#enable-the-v2-schema). | On |
| Opt-out of desktop flow schema v2 enabled by default.| In 2024, v2 schema is turned **On** for all environments without the option to turn off the feature. We recommend turning on the feature in advance so users can benefit from the product enhancements. Learn more in [Schema v2 enabled by default](/power-automate/desktop-flows/schema#schema-v2-enabled-by-default).  | Off |

## Desktop flow run action logs configuration

| Setting | Description | Default value |
|---------|-------------|---------------|
| Activation status of run action logs.| Defines when desktop flow run action logs should be captured and even allows you to turn them off completely. Learn more in [Desktop flow action logs configuration](/power-automate/desktop-flows/configure-desktop-flow-logs). | Enabled |
| Action logs version.| The Action logs version allows you to choose V1, V2, or both. Learn more in [Configure desktop flow action log version](/power-automate/desktop-flows/configure-desktop-flow-logs#configure-desktop-flow-action-log-version).   | V1 |
| FlowLogs entity time to live in minutes | Determines how long action logs should be retained in the Flow Logs elastic table. Dataverse automatically deletes records that are older than the specified time-frame. Learn more in [Configure desktop flow action log version](/power-automate/desktop-flows/configure-desktop-flow-logs#configure-desktop-flow-action-log-version). | 40320 |

## Savings (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

| Setting | Description | Default value |
|---------|-------------|---------------| 
| Disable money saving rules |  When **On**, prevents makers from creating money savings rules and track money savings generated by their Power Automate automation. Any pre-existing money saving rule at time of enforcement stops generating new money saving records, but pre-existing money saving records remain. Learn more in [Savings in Power Automate (preview)](/power-automate/savings) for makers.| Off |
| Time to live (in days) of savings events in Flow Aggregation entity | Determines how long savings records (not savings rules) should be retained in the Flow Aggregation entity. Dataverse automatically deletes records that are older than the specified time-frame. Set the value to `-1` to never delete them. Learn more in [Savings in Power Automate (preview)](/power-automate/savings) for makers.| 365 days |

## Grids and views

| Setting | Description | Default value |
|---------|-------------|---------------|
| Enable the modern read-only grid experience. | If **On**, the Power Apps read-only grid control lets users view and open records from views and subgrids. | On |
|Show the Edit columns button on views |  If **On**, users can create personal views by adding, removing, and reordering columns on a view accessible to them in a model-driven app. Learn more in [Edit columns on a grid page](/powerapps/user/grid-filters-advanced#column-editor). This setting only appears if you turned on 2022 Release Wave 1. |  On| 
|Show the Edit filters button on views | If **On**, users can create personal views by filtering data based on conditional expressions starting with a view accessible to them in a model-driven app. Learn more in [Edit filters on a grid page](/powerapps/user/grid-filters-advanced#filter-editor). This setting only appears if you turned on 2022 Release Wave 1.| On |
|Enable focused view for all records. | Focused view allows you to view and manage account, contact, lead, opportunity, and other records and their associated activities on one page. Learn more in [View and manage records in focused view](/dynamics365/sales/focused-view). | On |

## Advanced find options

| Setting | Description | Default value |
|---------|-------------|---------------|
|Modern advanced find in model-driven apps| If **On**, legacy advanced find is replaced with a modern experience that enhanced view management capabilities like searching on views and the ability to share, hide, and delete personal views. Learn more in [Advanced find in model-driven apps](/powerapps/user/advanced-find). This setting only appears if you turned on 2022 Release Wave 1. |  On|
|Allow users to hide system views| If **On**, users can hide system views in the view selector to manage their view list in model-driven apps. Learn more in [Hide views on a grid page](/powerapps/user/grid-filters-advanced#hide-views). This setting only appears if you turned on 2022 Release Wave 1.| Off |

## Activities

| Setting | Description | Default value |
|---------|-------------|---------------|
| Show only activities configured in the app when accessing **New activity** button in related activities of a record. Setting to **Off** shows all activities.   | To limit the number of activities showing up in the **New Activity** dropdown list to activities that are relevant to the model-driven app, select **On**. |Off |

## Asynchronous merge

| Setting | Description | Default value |
|---------|-------------|---------------|
| Allow records to be merged asynchronously | If **On**, records merged through the Unified Client interface are merged asynchronously in the background. |Off |

## Create new canvas apps and cloud flows in a Dataverse solution (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

| Setting | Description | Default value |
|---------|-------------|---------------|
| Canvas apps | Learn more in [Add canvas apps and cloud flows to solution by default (preview)](/power-apps/maker/canvas-apps/add-app-solution-default). | Off |
| Cloud flows | Learn more in [Add canvas apps and cloud flows to solution by default (preview)](/power-apps/maker/canvas-apps/add-app-solution-default). | Off |

## Cloud flow run history in Dataverse (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

| Setting | Description | Default value |
|---------|-------------|---------------|
| FlowRun entity time to live | Time in seconds of when this run record is automatically deleted. | Enabled - 28 days retention (default) |

## Block unmanaged customizations

| Setting | Description | Default value |
|---------|-------------|---------------|
| Dataverse blocks unmanaged customizations in the environment.  |  Prevents the creation of unmanaged customizations in Dataverse environments, which facilitates healthy application lifecycle management. Learn more in [Block unmanaged customizations (preview)](../alm/block-unmanaged-customizations.md). | Off |

## Data validation

| Setting | Description | Default value |
|---------|-------------|---------------|
| Enable email address validation in model-driven apps (preview).  |  When **On**, allows smart data validation for certain columns, such as text columns using the email format. Learn more in [Email address validation for email columns](/power-apps/maker/data-platform/data-validation-email-column) | Off |

## Attachment security

| Setting | Description | Default value |
|---------|-------------|---------------|
| Enable security on Attachment entity |  Earlier versions of the Power Platform lacked a security model to restrict access to attachments. This setting was introduced to allow customers to revert in case any issues arose with the implementation of attachment security enforcement. It's recommended that this setting remains enabled. | On |

## Microsoft Fabric

| Setting | Description | Default value |
|---------|-------------|---------------|
| Enable admins to link Dataverse tables with a Microsoft Fabric workspace and get real-time insights. |  Enables a system admin to disable the “Link to Fabric: feature in the selected environment. The [Link to Fabric](/power-apps/maker/data-platform/azure-synapse-link-view-in-fabric#link-to-microsoft-fabric) feature is used to get insights on Dataverse and Finance and operations data. Admins can reduce data exposure by disabling this feature in specific environments such as sandbox and dev environments. | On |
| Enable users to define Dataverse virtual tables using data from Microsoft Fabric and build apps (preview). | Enables a system admin to disable the feature where makers can [create virtual tables using Fabric OneLake data](/power-apps/maker/data-platform/azure-synapse-link-build-apps-with-fabric). While this feature is useful for building apps and driving insights from Fabric One Lake data, admins can disable this feature in specific sandbox and developer environments as needed. | On |

## Power Automate capacity

| Setting | Description | Default value |
|---------|-------------|---------------| 
| Allow process capacity overage  |  When **On**, enables machines and cloud flows to go into process capacity overage. New process capacity overage is only possible in an environment with at least one process / hosted process / unattended capacity assigned. Learn more in [Process capacity overage](/power-automate/desktop-flows/capacity-utilization-process#capacity-overage). | On |
| Allow auto-claim of process capacity |  When **On**, enables automatic assignment of process capacity to the environment (if any is available in the admin center) when required by an assignation of process capacity to a cloud flow, or to a machine while there's no available capacity in the environment. Learn more in [Process capacity](/power-automate/desktop-flows/capacity-process). | On |

## Search

| Setting | Description | Default value |
|---------|-------------|---------------|
|Dataverse search| If **On**, you can use Dataverse search to find records across multiple tables, sorted by relevance.| Off|
|Single table search option| If **On**, users get another option to search on a single table on view pages of search-enabled tables in all model-driven apps.|Off|
|Prevent slow keyword filter for quick find terms on view pages |  If **On**, users are prevented from searching with keywords that begin with an asterisk (\*) in grid search in all model-driven apps, and a message displays in the application. If **Off**, users can search with keywords that begin with an asterisk (\*) in grid search in all model-driven apps, but an information tooltip displays indicating the search might be slow. Learn more in [Grid search](/power-apps/user/grid-filters#grid-search). | Off|
|Quick Find record limits| If **On**, if more than 10,000 records are found, a message displays that suggests a more selective search. Learn more in [Configure Dataverse search for the organization](configure-relevance-search-organization.md).| On |
| Use quick find view of an entity for searching on grids and subgrids|  Select **Yes** to show the traditional Quick Find search in an entity grid. The traditional Quick Find search applies the [Quick Find View](/powerapps/maker/model-driven-apps/create-edit-views#system-views) filters and displays the Quick Find columns after searching.  |Off|
| Search for records in Microsoft 365 apps | You can quickly enable your users to access the records they most recently used in their application. The records are available in the Outlook Web client using a simple /mention gesture.  | On |

## Map and address services

| Setting | Description | Default value |
|---------|-------------|---------------|
| Limited   |  Select **On** to allow map display, latitude, and longitude pins, and shapes.  |On|
| Full      | In addition to the Limited actions, allows map routing, address input control, and pins loaded from addresses. | Off |

## Help features

| Setting | Description | Default value |
|---------|-------------|---------------|
|Custom help for customizable tables| Select **On** to replace the default Help content with custom Help designed for your users. After you enable custom Help, you can enter a Global Custom Help URL.|  Off |
|Global custom help URL| To replace the default Help with a single URL for all customizable record types (tables), enter the URL here. You also have the option of entering override URLs for each record type (table) for customizable record types. Learn more in [Create your own guided help](/powerapps/maker/model-driven-apps/create-guided-help-learning-path).|  No default value |
|Append parameters to URL| Select **On** to append parameters to the URL, you can make your Help content more dynamic. For example, you can access parameters for User Language Code, Table Name, Entry Point, and Form ID. Learn more in [Create your own guided help](/powerapps/maker/model-driven-apps/create-guided-help-learning-path).|  Not selected|
| Enable Custom Help Panes | Select **On** to enable a custom in-product help experience that is tailored to your organization. Learn more in [Create guided help for your Unified Interface app](/power-apps/maker/data-platform/create-custom-help-pages).|  Off|

## Power Apps component framework for canvas apps

| Setting | Description | Default value |
|---------|-------------|---------------|
|Allow publishing of canvas apps with code components| In Power Apps, when importing a solution that includes a Power Apps component framework component, it's essential that the target environment has the **Allow publishing of canvas apps with code components** setting turned on. This setting must be turned on prior to deployment, otherwise the component framework component doesn't function properly within canvas apps.<br><br>After the setting is turned on, and the solution is successfully imported and published. The component becomes part of the app's runtime. As a result, even if the setting is turned off afterwards, the Power Apps component framework continues to work as expected. However, if you need to make further updates or republish the app with changes to the component framework, you must turn on the setting again to ensure continued support for code components.<br><br>This setting is particularly critical for environments that use custom controls or UI enhancements built with the component framework inside canvas apps.  | Off |

## Delete disabled users

| Setting | Description | Default value |
|---------|-------------|---------------|
|Enable delete disabled users| Lets you delete disabled users permanently from the environment. Learn more in [Permanently delete users](delete-users.md#permanently-delete-users-in-power-platform). |Off |

## TDS endpoint

| Setting | Description | Default value |
|---------|-------------|---------------|
|Enable TDS endpoint |  Enables [Tabular Data Stream](/openspecs/windows_protocols/ms-tds/893fcc7e-8a39-4b3c-815a-773b7b982c50) (TDS) endpoint (a SQL data connection) for Microsoft Dataverse in an environment. Learn more in [Use SQL to query data](/powerapps/developer/common-data-service/cds-sql-query) and [View entity data in Power BI Desktop](/powerapps/maker/common-data-service/view-entity-data-power-bi)|On |
|Enable user level access control for TDS endpoint | When off, all environment users have access to the TDS endpoint. If on, users only have access when members of a security role that has the **Allow user to access TDS endpoint** privilege. Learn more in [Control access of the TDS endpoint](control-tds-settings.md). | Off |

## Record ownership across business units

| Setting | Description | Default value |
|---------|-------------|---------------|
| Record ownership across business units   |  Set to **On** to enable the Matrix data access structure. Not recommended for production environments. Learn more in [Matrix data access structure (Modernize Business Units - Preview)](wp-security-cds.md#matrix-data-access-structure-modernized-business-units). |Off|

## Disable empty address record creation

|Setting  |Description  |Default value  |
|---------|---------|---------|
|Disable empty address record creation in Dataverse | When **On**, if the incoming payload doesn't have any address relevant data, an empty address data record aren't created. This feature is supported only for **Account** and **Contact** tables. Learn more in [Disable empty record creation](/power-apps/developer/data-platform/customer-entities-account-contact#disable-empty-record-creation). |    Off    |

## Enable deletion of address records

|Setting  |Description  |Default value  |
|---------|---------|---------|
|Enable deletion of address records in Dataverse |When **On**, address records created in Dataverse for **Account** and **Contact** tables can be deleted through the user interface or through bulk deletion. Learn more in [Delete embedded address records](/power-apps/developer/data-platform/customer-entities-account-contact#delete-embedded-address-records).|    Off    |

## Power Apps ideas for canvas apps

| Setting | Description | Default value |
|---------|-------------|---------------|
| Share ideas query data to help improve ideas results. |To help Microsoft improve Power Apps Ideas, you can share your ideas query data with Microsoft. Learn more in [Power Apps Ideas (preview)](/power-apps/maker/canvas-apps/power-apps-ideas).|  Off |

## Power BI components (preview)
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

| Setting | Description | Default value |
|---------|-------------|---------------|
 |Allow creation of Power BI components  |  If **Off**, the environment doesn't have access to Power BI. Environments with a Dataverse database have this setting. Creating a Power BI component generates a dedicated Power BI workspace for that environment. All the Power BI artifacts corresponding to the Power BI components created in an environment are generated in that dedicated Power BI environment workspace. Learn more in [Permission sync between Power Apps environment and Power BI workspace](/power-apps/maker/model-driven-apps/customize-manage-powerbi-components#permission-sync-between-power-apps-environment-and-power-bi-workspace). |On |
|Automatically assign permission to Power BI workspaces | If **On**, synchronization takes place between predefined role privileges and the permissions of the dedicated Power BI environment workspace. The following roles are assigned with permissions:<br/><br/>System administrator: Power BI workspace admin > Power BI workspace admin permission.<br/><br/> System Customizer: Power BI workspace contributor > Power BI workspace contributor permission.<br/><br/> Power BI workspace viewer > Power BI workspace viewer permission.<br/><br/> [Learn more about Power BI workspace permission](/power-bi/collaborate-share/service-roles-new-workspaces#workspace-roles). | On|
 |Allow information sharing between this environment and Power BI workspaces in other geographic regions | When this setting is **On** and the Power BI tenant setting **[Power Platform interregional access](/power-bi/admin/service-admin-portal-integration#power-platform-interregional-access)** is also **On**, cross-geo operations can take place. Learn more in [Cross-geo operations](/power-bi/collaborate-share/service-power-bi-powerapps-integration-considerations#cross-geo-operations). |On|

## Recycle Bin (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

|Setting  |Description  |Default value  |
|---------|---------|---------|
| Enable recycle bin for Dataverse tables  | When **On**, you can use recycle bin for Dataverse tables to restore deleted records. |    **Off**     |
|Configure recovery time interval     | Recover table record data for up to *30* days after the record was deleted. Learn more in [Restore deleted Microsoft Dataverse table records](restore-deleted-table-records.md).     |   **30**      |
