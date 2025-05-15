---
title: Configure Dataverse search for your environment
description: Configure Dataverse search for your environment to improve search results and performance in model-driven apps. 
author: marianaraujo 
ms.component: pa-admin
ms.topic: get-started
ms.date: 05/15/2025
ms.subservice: admin
ms.custom: NewPPAC
ms.author: maaraujo
ms.reviewer: EllenWehrle
search.audienceType: 
  - admin
contributors:
- wobushixinxin67

---
# Configure Dataverse search for your environment

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Dataverse search delivers fast and comprehensive search results across multiple tables in a single list, sorted by [relevance](/azure/search/index-similarity-and-scoring), to give you an easy and well-informed search experience in model-driven apps. As an administrator with environment-level permissions, you can go to the [Power Platform admin center](/power-platform/admin/new-admin-center) to configure Dataverse search for all the model-driven apps within a specific environment using Quick Find views to manage global, quick find, and lookup search behavior.

With Dataverse search enabled, a search box is always available at the top of every page in all the model-driven apps in the environment. The search box allows you to start a new search and quickly find the information you're looking for from the searchable tables included in the app. With Dataverse search enabled, it's the default, and only, global search experience in all model-driven apps in the environment—you can't disable Dataverse search per app and users can't switch to [quick find search](/powerapps/user/quick-find), formerly known as categorized search.  

[Dataverse search can be extended to other Microsoft Search canvases](/microsoftsearch/manage-dynamics365), including SharePoint Online, Bing, and Office. With a connector enabled, you can search for and find information from the selected canvas as if you're searching in the app. For example, you can quickly look up a contact's phone number or email address without opening the app.

## Learn about the benefits of Dataverse search

Dataverse search helps you quickly find what you're looking for in model-driven apps. 

Dataverse search has these benefits:

- **Fast and accurate search**. Provides a precise and quick search experience for model-driven apps, and performance that's superior to [categorized search](/power-apps/user/quick-find#multiple-table-quick-find-categorized-search).

- **Suggested results as you type**. Finds what you're looking for and shows you the top results, as you type.

- **Better matching**. Finds matches to any word in the search term for columns in a table. Provides a better user experience compared to [quick find](/power-apps/user/quick-find) search, where all words in the search term must be found in one column.

- **Smart**. Finds matches that include inflectional words such as **stream**, **streaming**, or **streamed**.

- **Search activities**. Search includes notes and attachments in activities.

- **Understanding of underlying data**. Understands data types like **Choice** and **Lookup**, so it can effectively interpret a search query that includes multiple search terms.

- **Operators for advanced search**. Lets you use simple Boolean operators in your search term and craft the query to get the results you want.

- **Intelligence**. Applies AI technology to interpret natural language such as misspellings, common abbreviations, and synonyms to deliver quality results.
  
- **Search across documents in Microsoft Dataverse**. Search for and find information contained in PDF, Microsoft Office document, HTML, XML, ZIP, EML, plain text, and JSON file formats. It also searches text in notes and attachments.
  
For more information about Dataverse search, see [Search for tables and rows by using Dataverse search](/powerapps/user/relevance-search).


### Availability and language support

- Dataverse search is available in customer engagement apps such as Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation.

- Dataverse search isn't available for Customer Engagement (on-premises) organizations. Quick Find is the only search option for (on-premises) customer engagement apps organizations and Customer Engagement (on-premises) organizations.

- Full-text Quick Find is available for Customer Engagement (on-premises) organizations, starting with Dynamics CRM 2015 Update Rollup 1.

- For a more detailed comparison of the searches available in Microsoft Dataverse, go to [Compare search options in Microsoft Dataverse](/powerapps/user/search).

- All searchable fields in Dataverse search are processed in the language most closely matching the organization's base language, except Kazakh where all fields are processed using a basic, language-agnostic text processor.

## Enable Dataverse search

Dataverse search is an opt-out feature, set to **On** for all new production environments. We recommend turning on Dataverse search so users have a superior search experience in model-driven apps.

- When set to **On**, you see the search bar in the header of all model-driven apps in the environment allowing your users to have a global-search experience.
- When set to **Off**, you don't see the search bar in the header of all model-driven apps in the environment.


Individual users aren't able to switch to [Quick Find search, formerly known as categorized search](/powerapps/user/quick-find). Tables must be included in the application you're using with Dataverse search. Be sure that any table you want users to search on are included in your application.

> [!IMPORTANT]
> If you're using your own encryption key, you can turn off Dataverse search after allowing early access of 2021 release wave 2 in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

> [!NOTE]
> Dataverse search doesn't support lifecycle operations such as create, delete, backup, recover, copy, and reset. If such an operation, be sure to turn on Dataverse search again.

Take these steps to turn on Dataverse search:

## [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) as a system administrator.
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings** .
1. Expand **Product**, and then select **Features**.
1. Under **Dataverse search**, select **On**.
1. Select **Save** to apply the change.

## [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) as a system administrator.
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings** .
1. Expand **Product**, and then select **Features**.
1. Under **Dataverse search**, select **On**.
1. Select **Save** to apply the change.
---

Turning on Dataverse search allows global-search in all of your model-driven apps within that environment. You can't turn it off in specific apps.

When you provision a Dataverse search index, an indication that provisioning is in progress is visible. Once index provisioning is complete, it may take anywhere between an hour or more to complete a full sync for average size organizations, to a couple of days for large organizations.

> [!IMPORTANT]
> Turning off Dataverse search deprovisions and removes the index within a period of 12 hours. If you turn on Dataverse search after its been off for 12 hours, it provisions a fresh index that needs to go through a full sync. Syncing may take up to an hour or more for average size organizations, and a couple of days for large organizations. Be sure to consider these implications when you turn off Dataverse search temporarily.

## Set up Dataverse search

Setting up Dataverse search after turning it on in the Power Platform admin center involves four steps:

1. Select the _searchable tables_ for Dataverse search.

2. Review the columns that will be searched, the columns that are displayed, and the filter conditions that are applied in model-driven Power Apps as detailed in the [_Select searchable fields and filters for each table_](#select-searchable-fields-and-filters-for-each-table) section.

3. Be sure to include the tables allowed for Dataverse search in the model-driven app. Use the app designer to verify table inclusion in an app's components. For more information, go to [Add or edit model-driven app components](/powerapps/maker/model-driven-apps/add-edit-app-components#add-a-component).

4. Make sure your table is customizable and that the settings to **Track changes** and **Appear in search results** in the **Advanced options** area are both set to **On**. For more information, go to [Create and edit tables using Power Apps](/power-apps/maker/data-platform/create-edit-entities-portal?tabs=excel).

### Select tables for Dataverse search

Setting up search starts with reviewing the tables that are allowed for Dataverse search, in context of a solution. Using the new solution explorer, you can see a snapshot of the Dataverse search index on the **Overview** page.

   > [!NOTE]
   > If you're selecting tables for Dataverse search on a Power Apps US Government environment, use the legacy solution explorer to choose the tables to be indexed for Dataverse search.

1. Sign in to [Power Apps](https://make.powerapps.com/).
2. In the navigation pane, select **Solutions**.
3. Choose the solution you want to modify, then select **Edit** in the command bar.
4. On the **Objects** page, in the navigation pane, select **Overview**. 
5. In the **Dataverse search** pane, select **Manage search index**.

Although there's no limit on how many tables you can index for Dataverse search, there's a limit on the total number of **fields** that you can enable for Dataverse search. Dataverse search indexes 50 fields by default. Since the maximum is 1,000 searchable fields for an organization, this means you can configure up to **950 searchable fields**.

> [!IMPORTANT]
> Some columns are common to all tables, like **Primary Name** and **ID**, which are part of the 50 fields indexed by default for all tables, and aren't counted for every table.

When you select a table to index for Dataverse search, you can see the number of fields that are added to the index.

The number of fields indexed for a table is dependent on the tables Quick Find view. Additionally, some field types are treated as multiple fields in the Dataverse search index, as indicated in this table.

| Field type          |  Number of fields used in <br /> the Dataverse search index  |
|----------------------------------------------------|----|
| Lookup (customer, owner, or Lookup type attribute) | 3   |
| Option Set (state, or status type attribute)       | 2   |
| All other types of fields                          | 1  |

The progress bar at the bottom shows the percentage of indexed fields as a fraction of the maximum allowed number of searchable fields.

A warning message appears when you reach the indexed field limit. If you want to add more fields to the index, you have to free up space, either by removing some of the fields that are already in the index or removing entire tables from Dataverse search scope.

By default, the following system tables are indexed for Dataverse search. However, you must add custom tables to Dataverse search for them to be searchable. In the table, the numbers in parenthesis indicate the total number of columns included in the index for that table.

| Tables used for Dataverse search <br /> without Dynamics 365 apps allowed | Tables used for Dataverse search <br /> with Dynamics 365 apps allowed |
|-------------------------|-------------------------|
| Account (8)</br>Contact (11)</br>Goal (19)</br>Goal Metric (3)</br>Knowledge Article (56) | Campaign (2)</br>Campaign Activity (4)</br>Campaign Response (6)</br>Case (5)</br>Competitor (1)</br>Contract (7)</br>Invoice (4)</br>Lead (6)</br>Marketing List (5)</br>Opportunity (11)</br>Opportunity Product (8)</br>Order (4)</br>Product (5)</br>Quote (4)</br>Service (1)</br>Service Activity (9) |

> [!NOTE]
> Changes made to the Dataverse search configuration or to the searchable data may take up to 15 minutes to appear in the search service. It may take up to an hour or more to complete a full sync for average-size organizations, and a couple of days for large-size organizations.

### Select searchable fields and filters for each table

The table's Quick Find view drives the searchable table fields and filters used for Dataverse search. The complete set of **Find columns**, **View columns**, and **Filter columns** in a table's Quick Find view become part of the Dataverse search index when you enable it for Dataverse search. There's no limit to how many searchable fields you can add for each table. However, as previously noted, there's a limit on the total number of indexed fields.

- The **Find columns** on a Quick Find view define the searchable fields in the Dataverse search index. Text fields such as _Single Line of Text_ and _Multiple Lines of Text_, _Lookups_, and _Option Sets_ are searchable. **Find columns** of all other data types are ignored.
  > [!NOTE]
  > Currency fields must be added to the **Find Columns** so the currency symbol that is visible on the record are returned in the search results. If the currency field isn't added to the search index, users see the currency symbol localized according to their language settings.

- The **View columns** on a Quick Find view define the fields that are displayed in model-driven apps' search results page when the matched results are returned.

- The **Filter conditions** on a Quick Find view are applied to the Dataverse search results. The following table provides a list of filter clauses **not supported** by Dataverse search.

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

To edit the searchable fields of a table:

1. Sign in to [Power Apps](https://make.powerapps.com/).
2. In the navigation pane, select **Tables**.
3. On the **Tables** page, select the table you want to edit.
4. In the **Data experiences** pane, select **Views**.
5. From the list of views, select the **Quick Find View** type. For example, select **Quick Find Active Accounts**.
6. Edit _View_ columns and _Find_ columns by adding, removing, or reordering the columns. For a more detailed description of how to add or remove columns in a view, go to [Choose and configure columns in model-driven app views in Power Apps](/powerapps/maker/model-driven-apps/choose-and-configure-columns).
7. Select **Save and Publish** to publish the changes to the view.

> [!IMPORTANT]
> Changes to Quick Find view also apply to single-table and multi-table Quick Find configurations. Therefore, **we don't prevent you from including fields that aren't supported for Dataverse search when you configure Quick Find view**. However, unsupported fields aren't synced to the Dataverse search index and don't appear in the Dataverse search results.

> [!TIP]
> You can use the **Quick Find view** to define which fields appear as facets in model-driven apps with Dataverse search enabled. All **View columns** with data types other than _Single Line of Text_ and _Multiple Lines of Text_ are marked as facetable and filterable in the index. By default, the first four facetable fields in the **Quick Find view** for the selected table appear as facets when users search by using Dataverse search. At any time, you can only select four fields as facets.

> [!NOTE]
>
> - Changes made to the Dataverse search configuration or to the searchable data may take up to 15 minutes to appear in the search service. It may take up to an hour or more to complete a full sync for average size organizations, and a couple of days for large size organizations.
>
> - The maximum search-term size is 1,024 characters.
>
> - Although you can have related table fields as a **View column** or a **Find column** or a **Filter column** in a table's Quick Find view, related table fields aren't supported by Dataverse search and hence ignored.
>
> - If you change the length of text in a table column and the column is set to **Simple Search view**, the import may not be successful and you may see this error: _Length isn't valid because this is an indexed attribute and hence cannot have size greater than 1,700_.
>
> - The indexed attribute can't extend beyond 1,700 bytes. If the corresponding column is registered in the **Quick Find view**, remove the corresponding column from the **Quick Find view** and try to re-export after a time interval. If you change or delete a **Quick Find view** setting, it may take up to 24 hours to be reflected in the index, as it's a once-a-day maintenance job for the on-premises product. For more information, go to [Maximum capacity specifications for SQL Server](/sql/sql-server/maximum-capacity-specifications-for-sql-server?view=sql-server-ver16&preserve-view=true).
>
> - Updates to calculated fields and lookups don't automatically sync in Dataverse search. Data is refreshed whenever a field configured for Dataverse search is updated in a record.
>
> - There are some common fields, that are part of every table in Dataverse, so you see these fields in the Dataverse search index by default. Some common field examples are:
>
>   - **ownerid** (Name of lookup)
>   - **owningbusinessunit** (Name of lookup)
>   - **statecode** (Label of optionset)
>   - **statuscode** (Label of optionset)
>   - **name** (Primary name field of any table that may or may not be the same as the logical name, such as _fullname_ or _subject_, of the table.)
>
> - If you add a common field to any table for Dataverse search, search is performed for that common field across all entities. However, once you choose a specific table through the Record Type facet, Dataverse search follows the tables' defined settings you set up through Quick Find view.

### Configure quick actions that appear with Dataverse search in model-driven apps

Dataverse search experience brings some of the most frequently used actions closer to search results, to help users complete their tasks without having to navigate to the record page in model-driven apps. _Quick actions_ are a small set of commands specific to a table. Users can see quick actions when they're interacting with search in model-driven apps running on a web browser. Some of the commonly used tables are configured to show a set of commands to help them complete their task without losing context.

| Table            | Quick actions      |
|-------------|------------------------------------------------------------|
| Account     | Assign, Share, Email a link                                |
| Contact     | Assign, Share, Email a link                                |
| Appointment | Mark complete, Cancel, Set Regarding, Assign, Email a link |
| Task        | Mark complete, Cancel, Set Regarding, Assign, Email a link |
| Phone call  | Mark complete, Cancel, Set Regarding, Assign, Email a link |
| Email       | Cancel, Set Regarding, Email a link                        |

Quick actions are a subset of the table's homepage grid commands. For example, when you select an account in its homepage grid, the Account table's quick actions are derived from the set of commands at the top of the page. You can use the ribbon's **EnableRule** to hide or show quick actions for a table. To learn more about defining ribbon-enable rules in Power Apps, go to [Define ribbon enable rules](/powerapps/developer/model-driven-apps/define-ribbon-enable-rules).

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

If you include a table for Dataverse search, the **Can enable sync to external search index** managed property must be set to **True** for the table. By default, the property is set to **True** for some of the out-of-the-box tables and all custom tables. Some of the system tables can't be enabled for Dataverse search.

To set the managed property, take these steps:

1. Go to **Advanced Settings** > **Customizations**.

2. Select **Customize the System**.

3. Under **Components**, expand **Entities**, and then select the table you want.

4. On the menu bar, select **Managed Properties**. For **Can enable sync to external search index**, select **True** or **False** to set the property to the desired state. Select **Set** to exit.

5. Select **Publish** for your changes to take effect.

If you want to change the **Can enable sync to external search index** property to **False**, you must first _deselect_ the table from Dataverse search. This message appears if the table is included in the Dataverse search:

_This entity is currently syncing to an external search index. You must remove the entity from the external search index before you can set the **Can enable sync to external search index** property to **False**._

If **Can enable sync to external search index** is set to **False** and you try to include a table in Dataverse search, this message appears:

_Entity can't be enabled for Dataverse search because of the configuration of its managed properties_. For custom tables with sensitive data, consider setting the **Can enable sync to external search index** property to **False**._

> [!IMPORTANT]
> Once you install the managed solution on the target system, it becomes a managed property and you aren't able to change the value of the property.

## Dataverse search reporting FAQs

This section provides answers to frequently asked questions about Dataverse search reporting.

### How can I find out how much storage Dataverse search consumes?

There's a table called **RelevanceSearch** that reports on the storage consumed by Dataverse search at the environment level. Respectively, Dataverse search is reported as part of database storage consumption in the **Summary** tab. You can also view Dataverse search in the **Environment** report in Power Platform admin center or **Capacity** report:

## [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Licensing**.
1. In the **Licensing** pane, select **Capacity add-ons**.
1. On the **Capacity** page, go to the **Dataverse** tab, select an environment, then select the **Chart** icon for details.
1. In the **Licensing** pane, select **Dataverse**.
1. On the **Licenses** page, go to the **Environments** tab, then select an environment to view.
   
## [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, expand **Resources**, and then select **Capacity**.
1. On the **Capacity** page, go to the **Dataverse** tab, select an environment, and then select the **Chart** icon for details.
1. In the navigation pane, expand **Billing**, then select **Licenses**.
1. On the **Licenses** page, go to the **Environments** tab, then select an environment to view.
---

We recommend turning on Dataverse search so users can enjoy a better search experience in model-driven apps. As an environment admin, you can opt out of this feature bu managing your environments by selecting the option **Off**.

> [!IMPORTANT]
> Dataverse search counts towards the different storage entitlements you have in the tenant.

### Related content

- [Search for tables and rows by using Dataverse search](/powerapps/user/relevance-search)
- [Configure facets and filters](/power-apps/user/facets-and-filters)
- [Frequently asked questions about Dataverse search](/power-apps/user/relevance-faq)
- [Dynamics 365 results in Microsoft Search](/microsoftsearch/manage-dynamics365)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
