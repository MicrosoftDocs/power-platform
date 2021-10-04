---
title: "Configure Dataverse search to improve search results and performance   | MicrosoftDocs"
description: Configure Dataverse search to improve search results and performance 
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/15/2021
ms.subservice: admin
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Configure Dataverse search to improve search results and performance 

<!-- legacy procedure -->

Dataverse search delivers fast and comprehensive search results in a single list, sorted by relevance. As an administrator or customizer, you'll be able to enable and configure Dataverse search as described below. Many of the configuration steps use the same user interface as the Quick Find configuration.

Dataverse search is available in addition to single-entity Quick Find on the entity grid, and as an alternative to multi-entity Quick Find (also called Categorized Search), which is accessible from the navigation bar. When Dataverse search is turned on, it becomes your default and only global search experience for all of your model-driven apps. Dataverse search searches across all tables that your administrator has configured for Dataverse search and that are included in your model-driven apps. You won't be able to switch to [quick find search also known as categorized search](/powerapps/user/quick-find). 

Changes made to the Dataverse search configuration or to the searchable data may take up to 15 minutes to appear in the search service. It may take up to an hour or more to complete a full sync for average size organizations, and a couple of days for very large size organizations.

> [!NOTE]
> We're updating some terminology in Dataverse to be more intuitive and make its usage more productive. The terminology updates are listed in [Terminology Updates](/powerapps/maker/data-platform/data-platform-intro#terminology-updates). We will make these changes as we update the user interface.

## What is Dataverse search?

Dataverse search brings the following benefits:

- Improved performance compared to Categorized Search. 

- Finds matches to any word in the search term in any field in the entity. Matches may include inflectional words, like "stream," "streaming," or "streamed."

- Returns results from all searchable entities in a single list sorted by relevance, based on factors, such as number of words matched or their proximity to each other in the text.

- Matches in the result list are highlighted. These appear as bolded and italicized text in the search results.

- Includes the ability to search documents found in Notes and Attachments on Emails and Appointments 

For more information about Dataverse search, see: [Using Dataverse search to search for records](/powerapps/user/relevance-search).

Dataverse search is available in customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation) that have installed version 9.0. It is not available for Customer Engagement (on-premises) organizations. Full-text Quick Find is available for Customer Engagement (on-premises) organizations, starting with Dynamics CRM 2015 Update Rollup 1. Quick Find is available for customer engagement apps organizations and Customer Engagement (on-premises) organizations.

For more detailed comparison of the searches available in Microsoft Dataverse, see: [Compare search options in Dataverse](/powerapps/user/search).

### Language support

All searchable fields in Dataverse search  are processed in the language most closely matching the organization's base language, except Kazakh where all fields are processed using a basic, language-agnostic text processor.

## Enable Dataverse search

Dataverse search is an opt-in feature, set to **Off** by default. Enabling Dataverse search makes this search option available to all members of your organization. All of your apps will have the global search experience with the search bar in the header for all model-driven apps in your environment. Individual users won't be able to switch to [categorized search](/powerapps/user/quick-find).

Dataverse search doesn't support lifecycle operations (create, delete, backup, recover, copy, reset, and so on). In the event of such an operation, re-enable Dataverse search.

To enable Dataverse search, do the following:

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select an environment.

2. Select **Settings** > **Product** > **Features**.

3. Under **Search**, set **Dataverse search** to **On**.

4. Select **Save**.


## Select entities for Dataverse search 
 To configure Dataverse search, use the **Configure Dataverse search** selection on the task bar, as shown here.  

 ![Configure Dataverse search.](../admin/media/relevance-search-configure-search.png "Configure Dataverse search")  

 There is no limit on how many entities you can include in the Dataverse search results. However, there is a limit on the total number of fields that can be enabled in Dataverse search. The maximum is 1000 searchable fields for an organization. Out of these 1000 fields, up to 50 fields are required by the Dataverse search system, so you can configure up to 950 searchable fields in Dataverse search. When you select an entity to include in the search results, you'll notice a number in parentheses next to the entity name. The number indicates how many fields each entity uses in the Dataverse search index. Some fields, such as **Primary Name** and **ID**, are shared by multiple entities and don't count toward the total. Additionally, some field types use more than one field in the Dataverse search index as indicated in this table.  

|Field type|Number of fields used in the Dataverse search index|  
|----------------|--------------------------------------------------------|  
|Lookup (customer, owner, or Lookup type attribute)|3|  
|Option Set (state, or status type attribute)|2|  
|All other types of fields|1|  

 The progress bar **Total fields indexed** shows the percentage of indexed fields to the maximum allowed number of searchable fields.  

 When you have reached the indexed field limit, you'll see a warning message. If you want to add more fields to the index, you'll have to free up space, either by removing some of the fields that are already in the index or removing entire entities from Dataverse search scope.  

 To select entities for the Dataverse search results, do the following:  

1. [!INCLUDE[proc_settings_customization](../includes/proc-settings-customization.md)]  

2. Select **Customize the System**.  

3. Under **Components**, select **Entities**, and then select **Configure Dataverse search**.  

4. The **Select Entities** dialog box opens. Select **Add** to select the entities for the search results. When you're done, select **OK**.  

   ![Dataverse search entity selection.](../admin/media/relevance-search-select-entities.png "Dataverse search entity selection")  

5. Select **Publish All Customizations** for your changes to take effect.  

By default, some out-of-the-box system entities are included in Dataverse search. However, custom entities aren't included. You must add them to Dataverse search.  

> [!NOTE]
> Dataverse search configuration is not solution aware and does not get deployed with solutions. You must enable Dataverse search and configure the entities in each environment.


## Configure searchable fields for Dataverse search  

 The fields you add in the Quick Find view become part of the Dataverse search index. There is no limit on how many searchable fields you can add for each entity. However, there is a limit on the total number of indexed fields, as was explained in the previous section. **Find Columns** on a **Quick Find View** define the searchable fields in the Dataverse search index. Text fields such as Single Line of Text and Multiple Lines of Text, Lookups, and Option Sets are searchable. **Find Columns** with other data types are ignored. The **View Columns** on a **Quick Find View** define the fields that are displayed in the user interface by default when the matched results are returned. The fields that are highlighted replace the fields that don't have the highlighting. The first four matched fields are displayed in the results. The **filter** on a Quick Find view is also applied to the Dataverse search results.  See the table below for the list of filter clauses not supported by Dataverse search. 

> [!NOTE]
> There are some fields, called common fields, common to every CRM entity that are defined on the index by default. They are:
> 1. ownerid (Name of lookup)
> 2. owningbusinessunit (Name of lookup)
> 3. statecode (Label of optionset)
> 4. statuscode (Label of optionset)
> 5. name (Primary name field of any entity. This may or may not be the same as the logical name (fullname, subject etc.) of the entity)
> If a common field is added to any entity for Dataverse search, search will be performed for that common field across all entities. However, once you choose a specific entity through the Record Type facet, Dataverse search will follow the settings you have defined for that specific entity through Quick Find View.
>
> Updates to calculated fields and lookups are not automatically synced in Dataverse search. Data is refreshed whenever a field that is configured for Dataverse search is updated in a record.

 You can use the **Quick Find** view to define which fields appear as facets when users search by using Dataverse search.  All **View Columns** with data types other than Single Line of Text and Multiple Lines of Text are marked as facetable and filterable in the index. By default, the first four facetable fields in the **Quick Find** view for the selected entity are displayed as facets when users search by using Dataverse search. At any time, you can only have four fields selected as facets.  

1. [!INCLUDE[proc_settings_customization](../includes/proc-settings-customization.md)]  

2. Select **Customize the System**.  

3. Under **Components**, expand **Entities**, and then expand the entity you want.  

4. In the navigation tree, click **View**. In the **Type** column, double-click **Quick Find View**. The following illustration shows the **Quick Find** view for the `Account` entity.  

   ![Quick Find view.](../admin/media/relevance-search-quick-find-view-screen.png "Quick Find view")  

5. Select **Add Find Columns**. In the dialog box, select the fields you want to add to the search index. When done, select **OK**. In the following illustration, you see the                  `Account` entity fields added to the Dataverse search index.  

   ![Quick Find field selection.](../admin/media/relevance-search-quick-find-add-find-fields.png "Quick Find field selection")  

6. Repeat the steps for the **View Columns**.  

7. Select **Publish All Customizations** for your changes to take effect.  

> [!NOTE]
> The changes you make in **Quick Find** view also apply to single-entity and multi-entity (Categorized Search) Quick Find configurations. This is why we don't prevent you from including the fields that aren't supported for Dataverse search when you configure **Quick Find** view. However, unsupported fields aren't synced to the Dataverse search index and don't appear in the Dataverse search results.  

 For Dataverse search, fields on a related entity are not supported as Find, View, or Filter fields.  

 The following table contains the **Quick Find Filter** operators that aren't supported for Dataverse search:  

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

## Set managed property for Dataverse search  

 If you want to include an entity in Dataverse search, the **Can enable sync to external search index** managed property for this entity must be set to **True**. By default, the property is set to **True** for some of the out-of-the-box system entities and all custom entities. Some of the system entities can't be enabled for Dataverse search.  

 To set the managed property, do the following:  

1. [!INCLUDE[proc_settings_customization](../includes/proc-settings-customization.md)]  

2. Select **Customize the System**.  

3. Under **Components**, expand **Entities**, and then select the entity you want.  

4. On the menu bar, select **Managed Properties**. For **Can enable sync to external search index**, select **True** or **False** to set the property to the desired state. Select **Set** to exit, as shown here.  

   ![Entity managed properties.](../admin/media/relevance-search-managed-properties.PNG "Entity managed properties")  

5. Select **Publish** for your changes to take effect.  

   If you want to change the **Can enable sync to external search index** property to **False**, you must first deselect the entity from Dataverse search. If the entity is included in Dataverse search, you'll see the following message: "This entity is currently syncing to an external search index. You must remove the entity from the external search index before you can set the **Can Enable Sync to External Search Index** property to **False**." If **Can Enable Sync to External Search Index** is set to **False**, you'll see the following message when you try to include an entity in Dataverse search: "Entity can't be enabled for Dataverse search because of the configuration of its managed properties." For custom entities with particularly sensitive data, you may consider setting the **Can enable sync to external search index** property to **False**. Keep in mind, after you install the managed solution on the target system, you won't be able to change the value of the property because it's a managed property.  

## Configure quick actions

The new Dataverse search experience brings some of the most frequently used actions closer to search results, to help end users complete their tasks without having to navigate to the record page in model-driven apps. Quick actions are a small set of commands specific to a table. End users can see quick actions when they are interacting with search in model-driven apps running on a web browser. Some of the commonly used tables are configured to show a set of commands to help them complete their task without losing context.


|Table  |Quick actions  |
|---------|---------|
|Account     | Assign, Share, Email a link        |
|Contact     | Assign, Share, Email a link        |
|Appointment     | Mark complete, Cancel, Set Regarding, Assign, Email a link        |
|Task     | Mark complete, Cancel, Set Regarding, Assign, Email a link        |
|Phone call     | Mark complete, Cancel, Set Regarding, Assign, Email a link        |
|Email     | Cancel, Set Regarding, Email a link        |


Quick actions are a subset of the table's homepage grid commands. For example, when you select an account in its homepage grid, the Account table's quick actions are derived from the set of commands at the top of the page. This is important to understand the customization options available to configure quick actions. You can use the ribbon’s **EnableRule** to hide or show quick actions for a table. To learn more about defining ribbon enable rules in Power Apps, see [Define ribbon enable rules](/powerapps/developer/model-driven-apps/define-ribbon-enable-rules).

The following three new enable rules give you the flexibility to optimize quick actions:

- **ShowOnQuickAction rule**
  Use this rule to make a command appear only as a quick action.

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

- **ShowOnGridAndQuickAction rule**
  Use this rule to make a command appear on the homepage grid as well as a quick action.

- **ShowOnGrid rule**
  Use this rule to make a command appear on the homepage grid only. You can use this command to hide an existing quick action.

  > [!NOTE]
  > Each table can have up to five quick actions. 
  > 
  > Quick actions currently show up only in the context of search - alongside suggestions and in the results page on the primary column. The same set of quick actions appears alongside suggestions and in the results page.

## Help improve Dataverse search results

To help Microsoft improve Dataverse search, you can share your organization’s Dataverse search queries in Dynamics 365 and Power Platform applications with Microsoft. This data will help Microsoft build, improve, and validate the Microsoft machine learning model for the Dynamics 365 Natural Language search query technology.

Your organization’s queries and results are reviewed by people using secured computers in the United States. Aggregate data about queries and results are used by Microsoft engineers and data scientists to improve future search query results for all users worldwide. Your data remains your property. Your organization’s data will be stored within your tenant’s compliance boundary and is automatically deleted after 30 days. You can delete the data at any time by navigating to the Power Platform admin center and toggling **Improve Dataverse search results** to **Off**. For more information, see **Terms of Service** in the Power Platform admin center.

**Improve Dataverse search results** is off by default. To enable:

1.	In the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select an environment.

2.	Select **Settings** > **Product** > **Features**.

3. Under **Search**, set **Improve Dataverse search results** to **On**.

   > [!div class="mx-imgBorder"] 
   > ![Improve Dataverse search results.](media/improve-relevance-search-results.png "Improve Dataverse search results")

4.	Select **Save**.

### See also  
 [Use Dataverse search to search for records](/powerapps/user/relevance-search) <br />
 

[!INCLUDE[footer-include](../includes/footer-banner.md)]
