---
title: "Configure Relevance Search to improve search results and performance   | MicrosoftDocs"
description: Configure Relevance Search to improve search results and performance 
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/04/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Configure Relevance Search to improve search results and performance 

<!-- legacy procedure -->

Relevance Search delivers fast and comprehensive search results in a single list, sorted by relevance. It is powered by [!INCLUDE[pn_Windows_Azure](../includes/pn-windows-azure.md)] Search to provide an improved Dynamics 365 apps search experience. As an administrator or customizer, you'll be able to enable and configure Relevance Search in the model-driven apps in Dynamics 365 user interface without writing code. Many of the configuration steps will look familiar to you, as they use the same user interface as the Quick Find configuration.  

 Relevance Search is available in addition to other model-driven apps in Dynamics 365 search experience you're already familiar with. You can still use single-entity Quick Find on the entity grid. You can also use multi-entity Quick Find (now called Categorized Search) from the **Search Dynamics 365 apps data** search box on the navigation bar.  

 Relevance Search brings the following enhancements and benefits:  

- Improves performance with [!INCLUDE[pn_azure_shortest](../includes/pn-azure-shortest.md)] Search technology.  

- Finds matches to any word in the search term in any field in the entity. Matches may include inflectional words, like "stream," "streaming," or "streamed."  

- Returns results from all searchable entities in a single list sorted by relevance, based on factors, such as number of words matched or their proximity to each other in the text.  

- Matches in the result list are highlighted.  

- Includes the ability to search documents found in Notes and Attachments on Emails and Appointments tracked in model-driven apps in Dynamics 365.

<a name="BKMK_CompareCRMSearches"></a>   
## Compare model-driven apps in Dynamics 365 searches  
 There are three kinds of search:  

-   Relevance Search  

-   Full-text Quick Find (single-entity or multi-entity)  

-   Quick Find (single-entity or multi-entity)  

The following table provides a brief comparison of the three available searches.  


|       Functionality        |                                                                                                                             Relevance Search                                                                                                                              |                                                                            Full-Text Quick Find                                                                             |                                                                                            Quick Find                                                                                             |
|----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|        Availability        | Available for model-driven apps in Dynamics 365 that have installed version 9.0. Not available for Customer Engagement (on-premises) organizations. | Available for Customer Engagement (on-premises) organizations, starting with [!INCLUDE[pn_crm_2015](../includes/pn-crm-2015.md)] Update Rollup 1. |                Available for model-driven apps in Dynamics 365 organizations and Customer Engagement (on-premises) organizations.                 |
|    Enabled by default?     |                                                                                                               No. An administrator must manually enable it.                                                                                                               |                                                                No. An administrator must manually enable it.                                                                |                                                                                                Yes                                                                                                |
| Single-entity search scope |                                                                                   Not available in an entity grid. You can filter the search results by an entity on the results page.                                                                                    |                                                                        Available in an entity grid.                                                                         |                                                                                   Available in an entity grid.                                                                                    |
| Multi-entity search scope  |                               There is no maximum limit on the number of entities you can search. **Note:**  While there is no maximum limit on the number of entities you can search, the Record Type filter shows data for only 10 entities.                                |                                                              Searches up to 10 entities, grouped by an entity.                                                              |                                                                         Searches up to 10 entities, grouped by an entity.                                                                         |
|      Search behavior       |                                                                                                 Finds matches to any word in the search term in any field in the entity.                                                                                                  |                    Finds matches to all words in the search term in one field in an entity; however, the words can be matched in any order in the field.                    | Finds matches as in a SQL query with "Like" clauses. You have to use the wildcard characters in the search term to search within a string. All matches must be an exact match to the search term. |
|       Search results       |                                                                                                 Returns the search results in order of their relevance, in a single list.                                                                                                 | For single-entity, returns the search results in an entity grid. For multi-entity, returns the search results grouped by categories, such as accounts, contacts, or leads.  |            For single-entity, returns the search results in an entity grid. For multi-entity, returns the search results grouped by categories, such as accounts, contacts, or leads.             |

<a name="BKMK_HowRSWorks"></a>   
## How Relevance Search works  
 Relevance Search uses the same default scoring concepts as [!INCLUDE[pn_azure_shortest](../includes/pn-azure-shortest.md)] Search. Scoring refers to the computation of a search score for every item returned in search results. The score is an indicator of an item's relevance in the context of the current search operation. The higher the score, the more relevant the item. In search results, items are ranked in order from high to low, based on the search scores calculated for each item. By default, a search score is computed based on statistical properties of the data and the query. Relevance Search finds documents that include the search terms in the query string, favoring the documents that contain many environments of the words in the search term and their close proximity to each other in the document. The search score goes up even higher if the term is rare across the index, but common within the document.  The results are then ranked by search score before they're returned. Search score values can be repeated throughout a result set. For example, you might have 10 items with a score of 1.2, 20 items with a score of 1.0, and 20 items with a score of 0.5. When multiple hits have the same search score, the ordering of same-score items isn't defined, and isn't stable. Run the query again and you might see items shift position. Given two items with an identical score, there is no guarantee which one appears first. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Add scoring profiles to a search index (Azure Search Service REST API)](https://msdn.microsoft.com/library/azure/dn798928.aspx)  

 Searchable fields are analyzed in the [!INCLUDE[pn_azure_shortest](../includes/pn-azure-shortest.md)] Search index to provide a more natural, end-user friendly search experience by breaking words into their root forms, text normalization, and filtering out noise words. All searchable fields in Relevance Search are analyzed with the [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)] Natural language analyzer, which uses Lemmetization to break words down into their root linguistic forms. For example, "ran" will match to "run" and "running" since "run" is considered the base form of the word. Word stemmers, such as SQL full-text indexes, don't have any linguistic context and only consider matches where the root is the same as the inflectional form. With stemming, "run" would match to "running" and "runner", but not "ran" since it doesn't consider "ran" to be a word linguistically related to "run". All searchable fields in Relevance Search use an analyzer that most closely matches the organization's base language. For Kazakh, which is the only language supported by model-driven apps in Dynamics 365 but not by [!INCLUDE[pn_azure_shortest](../includes/pn-azure-shortest.md)] Search, all fields are analyzed using the default analyzer. For more information about language analysis and a list of the supported languages, see:          [Language support (Azure Search Service REST API)](https://msdn.microsoft.com/library/azure/dn879793.aspx).  

### Search results
You'll see hit highlights when your search term matches a term in your application. These appear as bolded and italicized text in the search results. Notice these search terms are often returned as only a portion of the full value in a field since only the matched terms are highlighted. For example, using the search term *L. Wendell* returns the record for the contact with first name *L. Wendell* and last name *Overby*, as **Wendell Overby** in the search results.

<a name="BKMK_Architecture"></a>   
## Relevance Search architecture  
 Relevance Search is hosted on the [!INCLUDE[pn_Windows_Azure](../includes/pn-windows-azure.md)] cloud computing platform and infrastructure that uses [!INCLUDE[pn_azure_shortest](../includes/pn-azure-shortest.md)] Search, which provides the search results. Changes made may take up to 15 minutes to appear in the search service. It may take up to up to an hour or more to complete a full sync for average to large size organizations.  

 The following diagram shows the high level Relevance Search architecture.  

 ![Relevance Search architecture](../admin/media/relevance-search-architecture.PNG "Relevance Search architecture")  

<a name="BKMK_EnableSearch"></a>   
## Enable Relevance Search  

Relevance Search is an opt-in feature, set to off by default. Depending on the size of your organization, it may take up to an hour or more for the data to become available in the external search index after you enable the search. Enabling Relevance Search makes this search option available to all members of your organization.
  
 By default, Relevance Search is disabled. To enable Relevance Search, do the following:  

1. In the Power Platform admin center, select an environment. 

2. Select **Settings** > **Product** > **Features**.

3. Under **Search**, set **Relevance Search** to **On**.

4. Select **Save**.

<a name="BKMK_SelectEntities"></a>   
## Select entities for Relevance Search  
 To configure Relevance Search, use the **Configure Relevance Search** selection on the task bar, as shown here.  

 ![Configure Relevance Search](../admin/media/relevance-search-configure-search.png "Configure Relevance Search")  

 There is no limit on how many entities you can include in the Relevance Search results. However, there is a limit on the total number of fields that can be enabled in Relevance Search. Currently, the maximum is 1000 searchable fields for an organization. When you select an entity to include in the search results, you'll notice a number in parentheses next to the entity name. The number indicates how many fields each entity uses in the Relevance Search index. Some fields, such as **Primary Name** and **ID**, are shared by multiple entities and don't count toward the total. Additionally, some field types use more than one field in the Relevance Search index as indicated in this table.  

|Field type|Number of fields used in the Relevance Search index|  
|----------------|--------------------------------------------------------|  
|Lookup (customer, owner, or Lookup type attribute)|3|  
|Option Set (state, or status type attribute)|2|  
|All other types of fields|1|  

 The progress bar **Total fields indexed** shows the percentage of indexed fields to the maximum allowed number of searchable fields.  

 When you have reached the indexed field limit, you'll see a warning message. If you want to add more fields to the index, you'll have to free up space, either by removing some of the fields that are already in the index or removing entire entities from Relevance Search.  

 To select entities for the Relevance Search results, do the following:  

1. [!INCLUDE[proc_settings_customization](../includes/proc-settings-customization.md)]  

2. Click **Customize the System**.  

3. Under **Components**, expand **Entities**, and then click **Configure Relevance Search**.  

4. The **Select Entities** dialog box opens. Click **Add** to select the entities for the search results. When you're done, click **OK**.  

   ![Relevance Search entity selection](../admin/media/relevance-search-select-entities.png "Relevance Search entity selection")  

5. Click **Publish All Customizations** for your changes to take effect.  

By default, some out-of-the-box system entities are included in Relevance Search. However, custom entities aren't included. You have to add them to Relevance Search.  

<a name="BKMK_ConfigureFields"></a>   
## Configure searchable fields for Relevance Search  
 The fields you add in the Quick Find view become part of the Relevance Search index. There is no limit on how many searchable fields you can add for each entity. However, there is a limit on the total number of indexed fields, as was explained in the previous section. **Find Columns** on a **Quick Find View** define the searchable fields in the Relevance Search index. Text fields such as Single Line of Text and Multiple Lines of Text, Lookups, and Option Sets are searchable. **Find Columns** with other data types are ignored. The **View Columns** on a **Quick Find View** define the fields that are displayed in the user interface by default, when the matched results are returned. The fields that are highlighted replace the fields that don't have the highlighting. The first four matched fields are displayed in the results. The **filter** on a Quick Find view is also applied to the Relevance Search results.  See the table below for the list of filter clauses not supported by Relevance Search. 

> [!NOTE]
> There are some fields, called common fields, common to every CRM entity that are defined on the index by default. They are:
> 1. ownerid (Name of lookup)
> 2. owningbusinessunit (Name of lookup)
> 3. statecode (Label of optionset)
> 4. statuscode (Label of optionset)
> 5. name (Primary name field of any entity. This may or may not be the same as the logical name (fullname, subject etc.) of the entity)
> If a common field is added to any entity for Relevance Search, search will be performed for that common field across all entities. However, once you choose a specific entity through the Record Type facet, Relevance Search will follow the settings you have defined for that specific entity through Quick Find View.


 You can use the **Quick Find** view to define which fields appear as facets when users search by using Relevance Search.  All **View Columns** with data types other than Single Line of Text and Multiple Lines of Text are marked as facetable and filterable in the index. By default, the first four facetable fields in the **Quick Find** view for the selected entity are displayed as facets when users search by using Relevance Search. At any time, you can only have four fields selected as facets.  

1. [!INCLUDE[proc_settings_customization](../includes/proc-settings-customization.md)]  

2. Click **Customize the System**.  

3. Under **Components**, expand **Entities**, and then expand the entity you want.  

4. In the navigation tree, click **View**. Double-click **Quick Find View**. The following illustration shows the **Quick Find** view for the                  `Account` entity.  

   ![Quick Find view](../admin/media/relevance-search-quick-find-view-screen.png "Quick Find view")  

5. Click **Add Find Columns**. In the dialog box, select the fields you want to add to the search index. When done, click **OK**. In the following illustration, you see the                  `Account` entity fields added to the Relevance Search index.  

   ![Quick Find field selection](../admin/media/relevance-search-quick-find-add-find-fields.png "Quick Find field selection")  

6. Repeat the steps for the **View Columns**.  

7. Click **Publish All Customizations** for your changes to take effect.  

> [!NOTE]
> The changes you make in **Quick Find** view also apply to single-entity and multi-entity (Categorized Search) Quick Find configurations. This is why we don't prevent you from including the fields that aren't supported for Relevance Search when you configure **Quick Find** view. However, unsupported fields aren't synced to the Relevance Search index and don't appear in the Relevance Search results.  

 For Relevance Search, fields on a related entity are not supported as Find, View, or Filter fields.  

 The following table contains the **Quick Find Filter** operators that aren't supported for Relevance Search:  

|Operator|  
|---------------------------|  
|**Like**|  
|**NotLike**|  
|**BeginsWith**|  
|**DoesNotBeginWith**|  
|**EndWith**|  
|**DoesNotEndWith**|  
|**ChildOf**|  
|**Mask**|  
|**NotMask**|  
|**MaskSelect**|  
|**EqualUserLanguage**|  
|**Under**|  
|**NotUnder**|  
|**UnderOrEqual**|  
|**Above**|  
|**AboveOrEqual**|  
|**NotNull** |
|**Null** |

<a name="BKMK_SetPropertiy"></a>   
## Set managed property for Relevance Search  
 If you want to include an entity in Relevance Search, the **Can enable sync to external search index** managed property for this entity must be set to **True**. By default, the property is set to **True** for some of the out-of-the-box system entities and all custom entities. Some of the system entities can't be enabled for Relevance Search.  

 To set the managed property, do the following:  

1. [!INCLUDE[proc_settings_customization](../includes/proc-settings-customization.md)]  

2. Click **Customize the System**.  

3. Under **Components**, expand **Entities**, and then click the entity you want.  

4. On the menu bar, click **Managed Properties**. For **Can enable sync to external search index**, click **True** or **False** to set the property to the desired state. Click **Set** to exit, as shown here.  

   ![Entity managed properties](../admin/media/relevance-search-managed-properties.PNG "Entity managed properties")  

5. Click **Publish** for your changes to take effect.  

   If you want to change the **Can enable sync to external search index** property to **False**, you must first deselect the entity from Relevance search. If the entity is included in Relevance Search, you'll see the following message: "This entity is currently syncing to an external search index. You must remove the entity from the external search index before you can set the **Can Enable Sync to External Search Index** property to **False**." If **Can Enable Sync to External Search Index** is set to **False**, you'll see the following message when you try to include an entity in Relevance Search: "Entity can't be enabled for Relevance Search because of the configuration of its managed properties." For custom entities with particularly sensitive data, you may consider setting the **Can enable sync to external search index** property to **False**. Keep in mind, after you install the managed solution on the target system, you won't be able to change the value of the property because it's a managed property.  

<a name="BKMK_PrivacyNotice"></a>   
## Privacy notice  
[!INCLUDE[cc_privacy_crm_relevance_search](../includes/cc-privacy-crm-relevance-search.md)]

### See also  
 [Use relevance search to search for records](https://docs.microsoft.com/powerapps/user/relevance-search)
