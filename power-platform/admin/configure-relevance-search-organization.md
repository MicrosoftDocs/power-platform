---
title: Configure Dataverse search for your environment
description: Configure Dataverse search for your environment to improve search results and performance in model-driven apps. 
author: marianaraujo 
ms.component: pa-admin
ms.topic: get-started
ms.date: 02/19/2026
ms.subservice: admin
ms.custom: NewPPAC
ms.author: maaraujo
ms.reviewer: sericks
search.audienceType: 
  - admin
contributors:
  - seanwat-msft 
  - JasonHQX
  - wobushixinxin67


---
# Configure Dataverse search for your environment

Dataverse search delivers fast and comprehensive search results across multiple tables in a single list, sorted by [relevance](/azure/search/index-similarity-and-scoring). It gives you an easy and well-informed search experience in model-driven apps. As an administrator with environment-level permissions, you can go to the [Power Platform admin center](/power-platform/admin/new-admin-center) to configure Dataverse search for all the model-driven apps within a specific environment. Use Quick Find views to manage global, quick find, and lookup search behavior.

## Benefits of Dataverse search

- **Integration with AI/Copilot experiences**: Users can have a "conversation" with their data and identify themes, patterns, and insights by using natural language. Apply AI technology to interpret natural language such as misspellings, common abbreviations, and synonyms to deliver quality results.
  	
- **Unified search**: Dataverse search lets you quickly find content in model-driven apps and other products that use Dataverse through a single, unified search experience. It provides a better user experience compared to [quick find](/power-apps/user/quick-find) search, where all words in the search term must be found in one column. 
  	
- **Efficient relevance-based results**: Intelligent, ranking algorithms return the most relevant records first, with a performance that's superior to [categorized search](/power-apps/user/quick-find#multiple-table-quick-find-categorized-search). This feature reduces the time you spend searching and increases accuracy.
  	
- **Smart fuzzy search**: Handles variations in spelling and terminology so that it doesn't depend on exact keyword matches.
    
- **Security and compliance**: Respects Dataverse security roles and permissions. Users can only see search results for records that they have access to.
  	
- **Scalability and performance**: Optimized for large datasets and supports multiple data types, such as choice and lookups.

- **Search across documents in Dataverse**: Includes search results for text in documents that are stored in Dataverse such as PDF, Office documents, HTML, XML, ZIP, EML, plain text, and JSON file formats. It also searches text in notes and attachments.

> [!NOTE]
> Global search supports up to 2 MB of file search.

### Availability and language support

- Dataverse search is available in customer engagement apps such as Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation.

- Dataverse search isn't available for customer engagement, on-premises organizations. Quick Find is the only search option for on-premises, customer engagement apps organizations.

- Full-text Quick Find is available for customer engagement, on-premises organizations starting with Dynamics CRM 2015 Update Rollup 1.

- For a more detailed comparison of the searches available in Microsoft Dataverse, go to [Compare search options in Microsoft Dataverse](/powerapps/user/search).

- All searchable fields in Dataverse search are processed in the language that most closely matches the organization's base language, except Kazakh where all fields are processed by using a basic, language-agnostic text processor.

## Managing Dataverse search

Dataverse search is an opt-out feature. It's set to **On** for all new production environments and **Default** for all other [environment types](/power-platform/admin/environments-overview#environment-types). Use Dataverse search so users have a search experience in model-driven apps and harness the power of Copilot experiences.

You can find this setting in the Power Platform admin center. For more information, see [Search](settings-features.md#search).

:::image type="content" source="https://github.com/user-attachments/assets/ee6047e9-fe9a-4796-89e5-c6f59b518b46" alt-text="Screenshot of the Dataverse search settings in the Power Platform admin center.":::

In the Power Platform admin center, admins can [use the Dataverse Search setting](configure-relevance-search-organization.md#managing-dataverse-search) to manage it. The state selected for Dataverse search impacts the ability to use Dataverse data across the enabled experiences for all the organization.

The following tables show how each Dataverse search setting impacts global search experiences including SearchQuery API and generative AI experiences, and how admins can use this setting to manage it.

## What the Dataverse search setting means for global search

When you set Dataverse search to **On**, a search box appears at the top of every page in model-driven apps in the environment. The search box lets you start a new search and quickly find the information you're looking for from the searchable tables included in the app. When you turn on Dataverse search, it becomes the default and only global search experience in all model-driven apps in the environment. 

> [!NOTE]
> You can't turn off global search for individual apps.
> 
> Once you set Dataverse search to "On", [quick find search](/powerapps/user/quick-find) (formerly known as _categorized search_) becomes unavailable.


[Dataverse search can be extended to other Microsoft search canvases](/microsoftsearch/manage-dynamics365), including SharePoint Online, Bing, and Office. By enabling a connector, you can search for and find information from the selected canvas as if you're searching in the app. For example, you can quickly look up a contact's phone number or email address without opening the app. For more information, see [Search for records by using Dataverse search](/power-apps/user/relevance-search).

| Dataverse search set to On	|  Dataverse search set to Default	|   Dataverse search set to Off  |
|-----------------------------|-----------------------------------|--------------------------------|
| Search bar is visible. (Quick Find isn't visible or accessible.)  |	Search bar isn't visible. (Quick Find can be used alternatively.)  |  Quick Find can be used alternatively.  |
|  Dataverse search is used for all production environments.  |  Dataverse search isn't available for global search in any environment.	|  Dataverse search isn't available for global search in any environment.  |
|  Dataverse data is automatically indexed and is searchable to be used for global search.  |  Dataverse data isn't indexed and data isn't searchable for global search.	|  Dataverse data isn't indexed and data isn't searchable for global search. |


## What Dataverse search means for generative AI-enabled experiences

Some generative AI experiences use Dataverse search data. When you enable Dataverse search, you can access Copilot chat through the Copilot icon in the right navigation bar in a model-driven app. You can open or minimize the Copilot chat pane as you want.

-	**Power Apps**: [Copilot chat for model-driven apps in Power Apps](/power-apps/maker/model-driven-apps/add-ai-copilot) is a next-generation AI assistant that helps app users get insights about the data in their apps through conversation in natural language.
- **Copilot Studio**: [Integrating Dataverse tables as your knowledge source](/microsoft-copilot-studio/knowledge-add-dataverse) allows you to ground your agent in the data contained in your tables. This can also happen using [unstructured data as knowledge](/microsoft-copilot-studio/knowledge-unstructured-data) or [Dataverse tools](/microsoft-copilot-studio/advanced-plugin-actions).

| Dataverse search set to On	|  Dataverse search set to Default	|   Dataverse search set to Off  |
|-----------------------------|-----------------------------------|--------------------------------|
|  An enabled, generative AI feature's availability isn't managed by Dataverse search itself. It might be enabled through its own feature setting.  |
|  Dataverse search is used in all production environments.	|  Dataverse search is used for generative AI experiences in Sandbox, Trial, Developer, and Dataverse for Teams environments.	|  Dataverse search isn't used in any environment.  |
|  Selected Dataverse data (tables and files) is automatically indexed and data is searchable.  |  Selected Dataverse data (tables and files) is indexed when triggered and data is searchable. 	|  Dataverse data isn't indexed and isn't searchable.  |

Individual users can't switch to [quick find search](/powerapps/user/quick-find), formerly known as _categorized search_. You must include tables in the application you're using with Dataverse search. Be sure that your application includes any table you want users to search.

> [!NOTE]
> As of September 2025, the **Dataverse search** setting for all previously created environments was migrated one time as required to maintain a consistent user experience. Environments that didn't have prior dependencies on Dataverse search or Copilot were designated as **Default** (equivalent to the former **Off** setting), whereas those with Dataverse search enabled retained the **On** configuration.

> [!IMPORTANT]
> If you're using your own encryption key, you can turn off Dataverse search after allowing early access of 2021 release wave 2 in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

> [!NOTE]
> - Dataverse search must be turned on to support lifecycle operations such as create, delete, backup, recover, copy, and reset.
> - Dataverse search must be maually set to **On** in required environments to support copying lifecycle operations between environments.

Take these steps to turn on Dataverse search:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) as a system administrator.
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings** .
1. Expand **Product**, then select **Features**.
1. Under **Dataverse search**, select **On**.
1. Select **Save** to apply the change.

When you turn on Dataverse search, you allow global search in all model-driven apps in that environment and allow generative AI experiences to work. 

> [!NOTE]
> - You can't turn off Dataverse search in specific apps.
> - Dataverse search doesn't turn on any other feature automatically.

When you provision a Dataverse search index, you see an indication that provisioning is in progress.

> [!IMPORTANT]
> Turning off Dataverse search deprovisions and removes the index within 12 hours. If you turn on Dataverse search after it's been off for 12 hours, it provisions a fresh index that needs to go through a full sync. Syncing can take an hour or more for average size organizations, and a couple of days for large organizations. Be sure to consider these implications when you turn off Dataverse search temporarily.

## Set up Dataverse search for global search

After you turn on Dataverse search in the Power Platform admin center, set up Dataverse search by completing four steps:

1. Select the _searchable tables_ for Dataverse search.

1. Review the columns that are searched, the columns that are displayed, and the filter conditions that apply in model-driven Power Apps as detailed in the [_Select searchable fields and filters for each table_](#select-searchable-fields-and-filters-for-each-table-for-global-search) section.

1. Include the tables allowed for Dataverse search in the model-driven app. Use the app designer to verify table inclusion in an app's components. For more information, see [Add or edit model-driven app components](/powerapps/maker/model-driven-apps/add-edit-app-components#add-a-component).

1. Make sure your table is customizable and that the settings to **Track changes** and **Appear in search results** in the **Advanced options** area are both set to **On**. For more information, see [Create and edit tables using Power Apps](/power-apps/maker/data-platform/create-edit-entities-portal?tabs=excel).

### Select tables for Dataverse search's global search

To set up search, review the tables that are allowed for Dataverse search in the context of a solution. By using the new solution explorer, you can see a snapshot of the Dataverse search index on the **Overview** page.

   > [!NOTE]
   > If you're selecting tables for Dataverse search on a Power Apps US Government environment, use the legacy solution explorer to choose the tables to be indexed for Dataverse search.

1. Sign in to [Power Apps](https://make.powerapps.com/).
1. In the navigation pane, select **Solutions**.
1. Choose the solution you want to modify, and then select **Edit** in the command bar.
1. On the **Objects** page, in the navigation pane, select **Overview**. 
1. In the **Dataverse search** pane, select **Manage search index**.

Although there's no limit on how many tables you can index for Dataverse search, there's a limit on the total number of **fields** that you can enable for Dataverse search. Dataverse search indexes 50 fields by default. Since the maximum is 1,000 searchable fields for an organization, you can configure up to **950 searchable fields**.

> [!IMPORTANT]
> Some columns are common to all tables, like **Primary Name** and **ID**, which are part of the 50 fields indexed by default for all tables, and aren't counted for every table.

When you select a table to index for Dataverse search, you can see the number of fields that are added to the index.

The number of fields indexed for a table depends on the table's Quick Find view. Additionally, some field types are treated as multiple fields in the Dataverse search index, as indicated in this table.

| Field type          |  Number of fields used in <br /> the Dataverse search index  |
|----------------------------------------------------|----|
| Lookup (customer, owner, or Lookup type attribute) | 3   |
| Option Set (state, or status type attribute)       | 2   |
| All other types of fields                          | 1  |

The progress bar at the bottom shows the percentage of indexed fields as a fraction of the maximum allowed number of searchable fields.

A warning message appears when you reach the indexed field limit. To add more fields to the index, you need to free up space by removing some of the fields that are already in the index or by removing entire tables from Dataverse search scope.

By default, the following system tables are indexed for Dataverse search. However, you must add custom tables to Dataverse search for them to be searchable. In the table, the numbers in parenthesis indicate the total number of columns included in the index for that table.

| Tables used for Dataverse search <br /> without Dynamics 365 apps allowed | Tables used for Dataverse search <br /> with Dynamics 365 apps allowed |
|-------------------------|-------------------------|
| Account (8)</br>Contact (11)</br>Goal (19)</br>Goal Metric (3)</br>Knowledge Article (56) | Campaign (2)</br>Campaign Activity (4)</br>Campaign Response (6)</br>Case (5)</br>Competitor (1)</br>Contract (7)</br>Invoice (4)</br>Lead (6)</br>Marketing List (5)</br>Opportunity (11)</br>Opportunity Product (8)</br>Order (4)</br>Product (5)</br>Quote (4)</br>Service (1)</br>Service Activity (9) |

> [!NOTE]
> Changes that you make to the Dataverse search configuration or to the searchable data might take up to 15 minutes to appear in the search service. It might take up to an hour or more to complete a full sync for average-size organizations, and a couple of days for large-size organizations.

### Select searchable fields and filters for each table for global search

The table's Quick Find view drives the searchable table fields and filters used for Dataverse search. When you enable Dataverse search, the complete set of **Find columns**, **View columns**, and **Filter columns** in a table's Quick Find view become part of the Dataverse search index. You can add unlimited searchable fields for each table. However, as previously noted, the total number of indexed fields has a limit.

- The **Find columns** on a Quick Find view define the searchable fields in the Dataverse search index. Text fields such as _Single Line of Text_ and _Multiple Lines of Text_, _Lookups_, and _Option Sets_ are searchable. **Find columns** of all other data types are ignored.
  
  > [!NOTE]
  > Add currency fields to the **Find Columns** so the currency symbol that's visible on the record is returned in the search results. If you don't add the currency field to the search index, users see the currency symbol localized according to their language settings.
  > To use a **lookup field**, turn on the reference table to be searchable.

- The **View columns** on a Quick Find view define the fields that display in model-driven apps' search results page when the matched results are returned.

- The **Filter conditions** on a Quick Find view apply to the Dataverse search results. The following table provides a list of filter clauses **not supported** by Dataverse search.

    | Operator          |
    |-----------------------|
    | Like             |
    | NotLike          |
    | BeginsWith       |
    | DoesNotBeginWith  |
    | EndWith           |
    | DoesNotEndWith    |
    | ChildOf           |
    | Mask              |
    | NotMask           |
    | MaskSelect        |
    | EqualUserLanguage |
    | Under             |
    | NotUnder          |
    | UnderOrEqual      |
    | Above             |
    | AboveOrEqual      |
    | NotNull           |
    | Null              |
    | DoesNotConatinData|  

To edit the searchable fields of a table:

1. Sign in to [Power Apps](https://make.powerapps.com/).
1. In the navigation pane, select **Tables**.
1. On the **Tables** page, select the table you want to edit.
1. In the **Data experiences** pane, select **Views**.
1. From the list of views, select the **Quick Find View** type. For example, select **Quick Find Active Accounts**.
1. Edit _View_ columns and _Find_ columns by adding, removing, or reordering the columns. For a more detailed description of how to add or remove columns in a view, go to [Choose and configure columns in model-driven app views in Power Apps](/powerapps/maker/model-driven-apps/choose-and-configure-columns).
1. Select **Save and Publish** to publish the changes to the view.

> [!IMPORTANT]
> To ensure search results are available, confirm that:
> - The table is included in the model-driven app.
> - The **Quick Find View** is set as the default view for the table.
> 
> Changes to Quick Find view also apply to single-table and multitable Quick Find configurations. Therefore, **we don't prevent you from including fields that aren't supported for Dataverse search when you configure Quick Find view**. However, unsupported fields aren't synced to the Dataverse search index and don't appear in the Dataverse search results.

> [!TIP]
> Use the **Quick Find view** to define which fields appear as facets in model-driven apps with Dataverse search enabled. All **View columns** with data types other than _Single Line of Text_ and _Multiple Lines of Text_ are marked as facetable and filterable in the index. By default, the first four facetable fields in the **Quick Find view** for the selected table appear as facets when users search by using Dataverse search. At any time, you can only select four fields as facets.

> [!NOTE]
> - Changes made to the Dataverse search configuration or to the searchable data might take up to 15 minutes to appear in the search service. It might take up to an hour or more to complete a full sync for average size organizations, and a couple of days for large size organizations.
>
> - The maximum search-term size is 1,024 characters.
>
> - Although you can add related table fields as a **View column**, **Find column**, or **Filter column** in a table's Quick Find view, Dataverse search doesn't support related table fields and hence ignores them.
>
> - If you change the length of text in a table column and set the column to **Simple Search view**, the import might not succeed and you might see this error: _Length isn't valid because this is an indexed attribute and hence cannot have size greater than 1,700_.
>
> - The indexed attribute can't extend beyond 1,700 bytes. If the corresponding column is registered in the **Quick Find view**, remove the corresponding column from the **Quick Find view** and try to re-export after a time interval. If you change or delete a **Quick Find view** setting, it might take up to 24 hours to be reflected in the index, as it's a once-a-day maintenance job for the on-premises product. For more information, see [Maximum capacity specifications for SQL Server](/sql/sql-server/maximum-capacity-specifications-for-sql-server?view=sql-server-ver16&preserve-view=true).
>
> - Updates to calculated fields and lookups don't automatically sync in Dataverse search. Data refreshes whenever a field configured for Dataverse search is updated in a record.
>
> - Some common fields are part of every table in Dataverse, so you see these fields in the Dataverse search index by default. Some common field examples are:
>
>   - **ownerid** (Name of lookup)
>   - **owningbusinessunit** (Name of lookup)
>   - **statecode** (Label of optionset)
>   - **statuscode** (Label of optionset)
>   - **name** (Primary name field of any table that might or might not be the same as the logical name, such as _fullname_ or _subject_, of the table.)
>
> - If you add a common field to any table for Dataverse search, search is performed for that common field across all entities in global search. However, once you choose a specific table through the Record Type facet, Dataverse search follows the tables' defined settings you set up through Quick Find view. As a result, the number of records returned in global search might differ from those returned in an entity-level search. This behavior is expected and by design.

### Configure quick actions that appear with Dataverse search in model-driven apps

The Dataverse search experience brings some of the most frequently used actions closer to search results. It helps users complete their tasks without having to navigate to the record page in model-driven apps. _Quick actions_ are a small set of commands specific to a table. Users can see quick actions when they're interacting with search in model-driven apps running on a web browser. Some of the commonly used tables are configured to show a set of commands to help users complete their tasks without losing context.

| Table            | Quick actions      |
|-------------|------------------------------------------------------------|
| Account     | Assign, Share, Email a link                                |
| Contact     | Assign, Share, Email a link                                |
| Appointment | Mark complete, Cancel, Set Regarding, Assign, Email a link |
| Task        | Mark complete, Cancel, Set Regarding, Assign, Email a link |
| Phone call  | Mark complete, Cancel, Set Regarding, Assign, Email a link |
| Email       | Cancel, Set Regarding, Email a link                        |

Quick actions are a subset of the table's homepage grid commands. For example, when you select an account in its homepage grid, the Account table's quick actions come from the set of commands at the top of the page. You can use the ribbon's **EnableRule** to hide or show quick actions for a table. To learn more about defining ribbon-enable rules in Power Apps, see [Define ribbon enable rules](/powerapps/developer/model-driven-apps/define-ribbon-enable-rules).

These three new enable rules give you the flexibility to optimize quick actions:

- **ShowOnQuickAction rule** is a rule to make a command appear only as a quick action.

  ```XML
  <CommandDefinition Id="new.contact.Command.Call">
    <EnableRules>
      <EnableRule Id="Mscrm.SelectionCountExactlyOne" />
      <EnableRule Id="Mscrm.ShowOnQuickAction" />
    </EnableRules>
    <DisplayRules />
    <Actions>
      <JavaScriptFunction FunctionName="simplealert" />
    </Actions>
  </CommandDefinition>
  ```

- **ShowOnGridAndQuickAction rule** is a rule to make a command appear on the homepage grid and as a quick action.

- **ShowOnGrid rule** is a rule to make a command appear only on the homepage grid. You can use this command to hide an existing quick action.

  > [!NOTE]
  > Each table can have up to six quick actions.
  >
  > Quick actions currently show up only in the context of search—alongside suggestions and in the results page on the primary column. The same set of quick actions appears alongside suggestions and in the results page.

## Set managed properties for Dataverse search

If you include a table for Dataverse search, set the **Can enable sync to external search index** managed property to **True** for the table. By default, the property is set to **True** for some of the out-of-the-box tables and all custom tables. Some of the system tables can't be enabled for Dataverse search.

To set the managed property, take these steps:

1. Go to **Advanced Settings** > **Customizations**.

1. Select **Customize the System**.

1. Under **Components**, expand **Entities**, and then select the table you want.

1. On the menu bar, select **Managed Properties**. For **Can enable sync to external search index**, select **True** or **False** to set the property to the desired state. Select **Set** to exit.

1. Select **Publish** for your changes to take effect.

If you want to change the **Can enable sync to external search index** property to **False**, first _deselect_ the table from Dataverse search. This message appears if the table is included in the Dataverse search:

_This entity is currently syncing to an external search index. You must remove the entity from the external search index before you can set the **Can enable sync to external search index** property to **False**._

If **Can enable sync to external search index** is set to **False** and you try to include a table in Dataverse search, this message appears:

_Entity can't be enabled for Dataverse search because of the configuration of its managed properties_. For custom tables with sensitive data, consider setting the **Can enable sync to external search index** property to **False**.

> [!IMPORTANT]
> After you install the managed solution on the target system, the property becomes a managed property and you can't change its value.

## Dataverse search reporting FAQs

This section provides answers to frequently asked questions about Dataverse search reporting.

### How can I find out how much storage Dataverse search consumes?

The **DataverseSearch** table (previously known as **RelevanceSearch**) reports on the storage consumed by Dataverse search at the environment level. Dataverse search is part of database storage consumption in the **Summary** and **Dataverse** tabs. You can also view Dataverse search in the **Environment** report in Power Platform admin center or **Capacity** report.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Licensing**.
1. In the **Licensing** pane, select **Capacity add-ons**.
1. On the **Capacity** page, go to the **Dataverse** tab, select an environment, and then select the **Chart** icon for details.
1. In the **Licensing** pane, select **Dataverse**.
1. On the **Licenses** page, go to the **Environments** tab, and then select an environment to view.

We recommend turning on Dataverse search so users can enjoy a better search experience in model-driven apps with optimized, generative AI experiences. As an environment admin, you can opt out of this feature by turning if off. If Dataverse search is turned **Off**, generative AI experiences are limited for makers and end users.

> [!IMPORTANT]
> Dataverse search counts towards the different storage entitlements you have in the tenant.

For all FAQ about Dataverse search, go to [Frequently asked questions about Dataverse search](/power-apps/user/relevance-faq).

### Related content

- [Search for tables and rows by using Dataverse search](/powerapps/user/relevance-search)
- [Configure facets and filters](/power-apps/user/facets-and-filters)
- [Frequently asked questions about Dataverse search](/power-apps/user/relevance-faq)
- [Dynamics 365 results in Microsoft Search](/microsoftsearch/manage-dynamics365)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
