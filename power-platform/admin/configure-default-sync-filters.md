---
title: "Configure default sync filters for appointments, contacts, and tasks | MicrosoftDocs"
description: Configure default sync filters for appointments, contacts, and tasks.
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/1/2021
author: revachauhan
ms.subservice: admin
ms.author: rechauha
ms.reviewer: mkaur
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Configure default sync filters for appointments, contacts, and tasks


   > [!div class="mx-imgBorder"] 
   > ![Screenshot showing ](media/default-sync-filter-.png "")


Server-side synchronization uses filter criteria that’s set in a user's synchronization filters to determine which app rows are synchronized with Exchange for each user. Sync filters are first initialized when server-side synchronization is first configured by a user for rows such as appointments, contacts, and tasks. For more information, see [Create or modify online synchronization filters](choose-records-synchronize-dynamics-365-outlook-exchange.md#create-or-modify-online-synchronization-filters).
 
When a user mailbox is set up to use server-side synchronization for appointments, contacts, and tasks, their personal option filters list will have default logic for each table applied immediately. When the next sync cycle happens server-side sync will use this logic to synchronize existing rows that meet the fetchXML logic provided in each filter.

> [!div class="mx-imgBorder"] 
> ![Screenshot showing sync setting for Outlook or Exchange](media/default-sync-filter-1.png "Sync setting for Outlook or Exchange")

There are times when the default logic might synchronize rows which an organization doesn’t want to push to Exchange, such as the default **My Outlook Contacts** filter.

> [!div class="mx-imgBorder"] 
> ![Screenshot showing My Outlook Contacts filter](media/default-sync-filter-2.png "My Outlook Contacts filter")

As an example, an organization might not want to synchronize every active contact that is owned by the synchronizing user and wants to put additional restrictions in the filter logic distributed by default. This logic could be changed one by one for every user, but this is time consuming and it would need to be changed each time a user is setup with server-side sync.mAnother way to modify this logic is to change the default logic distributed to users when they’re set up with server-side synchronization for the first time. 

> [!NOTE]
> Default synchronization templates can’t be edited within the Dynamics 365 organization solution editor. This needs to be done through calls to the Dynamics 365 API using the XrmToolBox. The [XrmToolBox](https://www.xrmtoolbox.com/) is a third-party application that has multiple different tools for interacting with Dynamics 365 app data. For more information on the tool, see [Documentation for XrmToolBox](https://www.xrmtoolbox.com/documentation/). 


## Check the current default Outlook template filters

After installing XrmToolBox and connecting to your organization, follow these steps to ensure the **Sync Filter Manager** tool is installed using the **Tools Library**.

> [!div class="mx-imgBorder"] 
> ![Open the Tool Library menu](media/default-sync-filter-3.png "Tools Library")


> [!div class="mx-imgBorder"] 
> ![Search for Sync filter in the Tool Library](media/default-sync-filter-4.png "Search for Sync filter")

1. From the **Tools** menu, open the **Sync Filter Manager.** 

   > [!div class="mx-imgBorder"] 
   > ![Open the sync filter manager ](media/default-sync-filter-5.png "Sync filter manager")

    The default landing page for the tool will open and where you have access to change the default filters.


   > [!div class="mx-imgBorder"] 
   > ![Screenshot of the default landing page](media/default-sync-filter-6.png "Default landing page")

2. To get the default filters for your organization, on the **Synchronization Filters Templates** tab, select **Load Synchronization Filter Templates**.
   
   > [!Note] 
   >  There is two types of templates, **Outlook templates** and **Offline templates**. Server-side synchronization uses **Outlook Templates**. You can igore the **Offline Templates** which was used for offline mode with the [deprecated Dynamics 365 for Outlook (COM add-in)](../important-changes-coming.md#dynamic-365-for-outlook-is-deprecated). 
  
   > [!div class="mx-imgBorder"] 
   > ![Screenshot of the Synchronization Filters Templates tab](media/default-sync-filter-7.png "Synchronization Filters Templates tab")


    As long as no changes have been made at a user level, the Outlook templates should match what a user has when accessing their filters from their Dynamics 365 app **Set Personal Options** settings. 

   > [!div class="mx-imgBorder"] 
   > ![Screenshot of personal options](media/default-sync-filter-8.png "Personal options settings")


   > [!div class="mx-imgBorder"] 
   > ![Screenshot of personal options user filter](media/default-sync-filter-9.png "User filters")

  


## Set a different filter as default

To set different default filter for a table, such as Contact row you'll need edit the default view.

1. Open [solution explorer](/powerapps/maker/model-driven-apps/advanced-navigation.md#solution-explorer), expand **Entities**, select the table that you want, and then select **Views**. 

2. Select **Create a new view**.

   > [!div class="mx-imgBorder"] 
   > ![Screenshot of personal options user filter](media/default-sync-filter-10.png "User filters")
 
3. On the **View Properties** dialog enter a nmae and descriptin for the view and then select **OK**.
4. Under **Common Tasks** select **Edit Filter Criteria**.

   > [!div class="mx-imgBorder"] 
   > ![Select edit fitler criteria](media/default-sync-filter-11.png "Edit filter criteria")

5. In the **Edit Filter Critera** dialog, define the filter criteria for the view. For example, let's set the Contact table filter with changes made to only synchronize Contacts past a certain date. The other conditions are present in the existing **My Outlook Contacts** filter.

   > [!div class="mx-imgBorder"] 
   > ![Enter fitler criteria](media/default-sync-filter-12.png "Enter filter criteria")






For this example, we are going to be setting a Contact table filter with changes made to only synchronize Contacts past a certain date. The other conditions are present in the existing "My Outlook Contacts" filter:

After saving the view, we can then load it from within XrmToolBox via the "System Views" tab. Select the view created and then "Create" -&gt; "Synchronization Filter Template from selected view(s)":

Select "Outlook Template" on the pop-up that displays:

On the next pop-up, select "No" when asked to apply to some users (current users setup with Server-Side Sync already have a "My Outlook Contacts" filter, so adding it now will just create an additional Contact table filter).

Click on the "Synchronization Filters Templates" tab and find the new view that was created as a template. Select it and click on "Define as Default":

Only table filters in this list with the "Is Default" value set to true will distribute to new users. If needed, the old "My Outlook Contacts" filter can be deleted if it will never be used again. From this point onwards, any new user setup in this organization context will have "My Outlook Contacts Updated" applied to their filter criteria along with all of the other default views presented in the above screenshot. This will not change the filter set of any existing user already configured to use Server-Side Sync for Appointments, Contacts and Tasks.

## Replace current user's default filters with newly created templates**

For users that have the old default filter configuration, the first step is to remove this filter en masse. To accomplish this, we first need to click on the "Users Synchronization Filters" tab and uncheck the "Display Offline Filters" checkbox:


**Click the "Load Users Synchronization Filters" button and select "For all users". This might take some time to pull depending on the number of users in the organization context:

Once the list has completed, select the "Group By" button and choose "Returned Type". This will group the filters by the table so they can be deleted as a group:

Select the row(s) to be deleted and click the delete button in the ribbon. Multiple rows can be selected at once.

Once removed, the new Outlook filter template needs to be applied to users within the organization context. Select "Synchronization Filter Templates" tab, highlight the newly created Outlook template, and click "Apply to users" in the ribbon:

In the pop-up, users can be searched one at a time or the search button can just be clicked to pull all users. Once you have selected the users to apply this Outlook template to, click "Ok".

The filter application can then be checked via the "User's Synchronization Filters" tab:

These users will also be able to see this filter appear within their personal options:

## Best practices for Synchronization filter logic

Changing default synchronization filter logic can change row synchronization significantly. Here are some best practices when making modifications:

-   Validation of custom synchronization filters should be performed within lower environments before being applied to production organization contexts.

-   Applying filter conditions to an advanced find filter will show the rows being synchronized within the current user context. This is important for troubleshooting filter conditions behaving in unintuitive/unexpected ways.

-   Activity parties and their party types shouldn't be changed, as they tie to values in Exchange. A good example is the "Owner" participation type, which has nothing to do with row ownership. A full breakdown of Activity Party SDK values can be found here:

    -   [ActivityParty TableType](https://docs.microsoft.com/en-us/dynamics365/customer-engagement/web-api/activityparty?view=dynamics-ce-odata-9)

-   The best approach to applying a more restrictive filter criteria is to add a custom field to the table being modified and add this field as a condition for synchronization.

    -   A common modification is to add the **Sync This Record** boolean field to the Contact table and set the Contact table synchronization filter criteria to require this field be set to yes/true.

## Frequently asked questions

*What happens if there are two filters that exist for the same table?*

When a synchronization occurs for that table, each filter is independently applied to a set of rows to synchronize, and any rows found in each of those filter sets is synchronized. This means that since each filter is applied independently, the different row sets will still synchronize in the event filters contain conflicting logic.

If filter A has "Synchronize everything" and filter B has "Synchronize this subset", the end result is everything will be synchronized, including that subset. The resulting sync filter is essentially a combination of all synchronization filter criteria specified for a certain table.

It's important to note that due to this, row **synchronization** **cannot be** **further restricted** **by adding additional filters, only by modifying or removing existing ones**.

*What happens if no enabled filters exist for a given table?*

If every filter for an table is removed for a user context, that user will not synchronize anything from that table, but will continue to sync items for any other table that still has enabled filters.

*How can the list of rows that will be synchronized by a filter set be checked to ensure the right rows are being created in Exchange?*

The filter logic present within the Synchronization Filters can be applied to an Advanced Find window verbatim. Any rows found in the results will be rows that are attempted to be created/synchronized with Exchange for user contexts employing that filter for the given table.
