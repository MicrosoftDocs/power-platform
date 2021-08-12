---
title: "Set up default sync filters for multiple users for appointments, contacts, or tasks | MicrosoftDocs"
description: Configure default sync filters for appointments, contacts, or task rows.
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

# Set up default sync filters for multiple users for appointments, contacts, or tasks

Server-side synchronization uses the sync filter criteria that has been set by a user to determine which app rows will be synchronized with Exchange for that user. Sync filters are initialized when a user first configures server-side synchronization for rows such as appointments, contacts, and tasks. More information: [Create or modify online synchronization filters](choose-records-synchronize-dynamics-365-outlook-exchange.md#create-or-modify-online-synchronization-filters)

When a user's mailbox is set up with server-side synchronization, the sync filters that are listed in **User Filters** in a user's [personal options](/powerapps/user/set-personal-options#email-tab-options) are the default sync filters that will be applied for server-side synchronization. When the next sync cycle takes place, server-side sync uses the sync filters set by the user to synchronize existing rows that meet the FetchXML logic.
 
> [!div class="mx-imgBorder"] 
> ![Screenshot showing the Synchronization Settings for Outlook or Exchange page.](media/default-sync-filter-1.png "Sync setting for Outlook or Exchange")

In some scenarios, you might not want to use the default sync filter logic. In the image below, an organization is using a sync filter template called **My Outlook Contacts**, but the sync filter criteria in the template doesn't work for the organization.

> [!div class="mx-imgBorder"] 
> ![Screenshot showing My Outlook Contacts filter where Owner equals the current user and the Status equals Active.](media/default-sync-filter-2.png "My Outlook Contacts filter")

Perhaps the organization doesn't want to synchronize every active contact that's owned by the synchronizing user, and wants to put additional restrictions in the filter logic that's distributed by default. The logic can be changed one by one for each user, but that would be time-consuming, and every time a user set up server-side sync the default logic would need to be changed. A better way to modify this logic would be to change the default logic distributed to users when they're initially set up to use server-side synchronization.

This topic explains how to find the current sync filter and replace it with a new sync filter for multiple users in your environment.

## Use XrmToolBox

You can't edit default synchronization templates from within the Dynamics 365 organization solution editor; this needs to be done through calls to the Dynamics 365 API made by using XrmToolBox. [XrmToolBox](https://www.xrmtoolbox.com/) is a third-party application that has many different tools for interacting with Dynamics 365 app data. More information: [Welcome to XrmToolBox documentation](https://www.xrmtoolbox.com/documentation/)

Open XrmToolBox and connect to your organization. On the **Configuration** tab, select **Tool Library**, enter **sync filter** in the search box, and then select **Sync Filter Manager**.

> [!div class="mx-imgBorder"] 
> ![Open the Tool Library menu.](media/default-sync-filter-3.png "Tool Library")


> [!div class="mx-imgBorder"] 
> ![Search for Sync Filter in the Tool Library.](media/default-sync-filter-4.png "Search for Sync Filter")


## Step 1. Check the current default sync filter 

1. In [XrmToolBox](https://www.xrmtoolbox.com/), go to the the **Tools** menu and open **Sync Filter Manager.** 

   > [!div class="mx-imgBorder"] 
   > ![Open the Sync Filter Manager.](media/default-sync-filter-5.png "Sync filter manager")

    The default landing page will open. This is where you can modify the default sync filters.


   > [!div class="mx-imgBorder"] 
   > ![Screenshot of the default landing page.](media/default-sync-filter-6.png "Default landing page")

2. On the **Synchronization Filters Templates** tab, select **Load Synchronization Filter Templates**.

   > [!NOTE] 
   >  There are two types of templates, **Outlook templates** and **offline templates**. Server-side synchronization uses Outlook templates. You can ignore the offline templates, which were used for offline mode with the [deprecated Dynamics 365 for Outlook (COM add-in)](../important-changes-coming.md#dynamic-365-for-outlook-is-deprecated).
  
   > [!div class="mx-imgBorder"] 
   > ![Screenshot of the Synchronization Filters Templates tab.](media/default-sync-filter-7.png "Synchronization Filters Templates tab")


    If no changes have been made by the user, the Outlook templates should match what the user has in their sync filter settings in their [personal options](/powerapps/user/set-personal-options#email-tab-options).

   > [!div class="mx-imgBorder"] 
   > ![Screenshot of personal options.](media/default-sync-filter-8.png "Personal options settings")


   > [!div class="mx-imgBorder"] 
   > ![Screenshot of the personal options user filter.](media/default-sync-filter-9.png "User filters")


## Step 2. Create a view for the table and set sync filters

To modify the default filter for a table, you'll need to edit the default view for the table.

1. Open [solution explorer](/powerapps/maker/model-driven-apps/advanced-navigation.md#solution-explorer), expand **Entities**, select the table that you want, and then select **Views**. 

2. Select **Create a new view**.

   > [!div class="mx-imgBorder"] 
   > ![Create a new view.](media/default-sync-filter-10.png "Create new view")
 
3. In the **View Properties** dialog, enter a name and description for the view (in this example, we use the name **My Outlook Contacts Updated**), and then select **OK**.
4. Under **Common Tasks**, select **Edit Filter Criteria**.

   > [!div class="mx-imgBorder"] 
   > ![Select Edit Filter Criteria.](media/default-sync-filter-11.png "Edit filter criteria")

5. In the **Edit Filter Criteria** dialog, define the filter criteria for the view. For example, you can set the contact table filter to only synchronize contacts past a certain date. The other conditions that were already included in the existing **My Outlook Contacts** filter remain the same.

   > [!div class="mx-imgBorder"] 
   > ![Screenshot of the Edit Filter Criteria dialog with an additional line, Created On, with the operator On or After and the date 7/29/2021.](media/default-sync-filter-12.png "Edited filter criteria")

6. Select **OK** to save the view.


## Step 3. Set the new view as the default sync filter 

After saving the view, load the view by using XrmToolBox.

1. Open [XrmToolBox](https://www.xrmtoolbox.com/).
2. From the default landing page, select the **System Views** tab.
3. From the list of views, select the view that you created in step 2, and then select **Create** > **Synchronization Filter Template from selected view(s)**.

   > [!div class="mx-imgBorder"] 
   > ![Screenshot of the XrmToolBox system views screen.](media/default-sync-filter-13.png "System views in XrmToolBox")

4. In the **Select Rule Template type** dialog, select **Outlook Template**, and then select **OK**.

   > [!div class="mx-imgBorder"] 
   > ![Screenshot selecting the Outlook template.](media/default-sync-filter-14.png "Outlook template")

5. On the next screen, when asked to apply the filter to some users, select **NO**. Note that current users who have been set up with server-side sync already have the **My Outlook Contacts** sync filter, so adding it now would just create an additional contact table filter.  

6. Select the **Synchronization Filters Templates** tab, find the new view that you created, select it, and then select **Define as default**.

   > [!div class="mx-imgBorder"] 
   > ![Screenshot showing My Outlook Contacts Updated selected, and the Define as default command highlighted on the command bar.](media/default-sync-filter-15.png "Define the default filter template")


Only the filter templates where the **Is Default** value is set to **True** will be distributed to new users. When new users are set up in your organization, they'll have **My Outlook Contacts Updated** set as the filter criteria along with all of the other default views shown in the preceding image. This won't change the filter set of any existing user who has already been configured to use server-side sync for appointments, contacts, and tasks. You can delete the old **My Outlook Contacts** filter if you're not going to use it anymore.


## Step 4. Delete the old sync filter

You need to remove the old default filter for users who have it. 


1. Open [XrmToolBox](https://www.xrmtoolbox.com/).
2. From the default landing page, select the **Users Synchronization Filters** tab, and then clear the **Display Offline Filters** checkbox.

   > [!div class="mx-imgBorder"] 
   > ![Clear the Display Offline Filters checkbox.](media/default-sync-filter-16.png "Clear the Display Offline Filters checkbox")

3. On the command bar, select **Load Users Synchronization Filters**, and then select **For all users**. It might take time to load the list, depending on the number of users in your organization.

   > [!div class="mx-imgBorder"] 
   > ![From the Load Users Synchronization Filters menu, select For all users.](media/default-sync-filter-17.png "From the Load Users Synchronization Filters menu, select For all users")

4. When the list is fully loaded, select **Group By**, and then select **Returned Type**. This will group the filters by table so they can be deleted as a group.

   > [!div class="mx-imgBorder"] 
   > ![From the Group by menu, select Returned Type.](media/default-sync-filter-18.png "From the Group by menu, select Returned Type")


5. Select the rows that you want to delete, and then select **Delete**.


## Step 5. Apply the new sync filter

After the old filters are deleted, you can apply the new Outlook filter template.

1. Open [XrmToolBox](https://www.xrmtoolbox.com/).
2. From the default landing page, select the **Synchronization Filter Templates** tab, and then select the new filter template you created in step 2 (**My Outlook Contacts Updated**, in our example). On the command bar, select **Apply to users**.

   > [!div class="mx-imgBorder"] 
   > ![Select the new template.](media/default-sync-filter-20.png "Select the new template")


3. In the pop-up window, search for and select the users who you want to apply the template for, and then select **OK**. You can check the users who have had the filter applied on the **Users Synchronization Filters** tab.

   After the new filter is applied, a user will be able to see the applied template via **Set Personal Options** settings.
  
  
   > [!div class="mx-imgBorder"] 
   > ![Set personal options screen.](media/default-sync-filter-22.png "Set personal options")
  
## Best practices for synchronization filter logic

Changing default synchronization filter logic can change row synchronization significantly. Here are some best practices to use when making modifications:

- Validate your custom synchronization filters in a test environment before you apply them to a production environment.

- Applying filter conditions to an advanced find filter will show the rows being synchronized for the current user. This is important to know when troubleshooting filter conditions that don't work correctly.

- Activity parties and their party types shouldn't be changed, because they're tied to values in Exchange. A good example is the Owner participation type, which has nothing to do with row ownership. For a breakdown of Activity Party SDK values, go to [ActivityParty TableType](/dynamics365/customer-engagement/web-api/activityparty?view=dynamics-ce-odata-9).

- The best approach to applying more restrictive filter criteria is to add a custom field to the table being modifie, and add the field as a condition for synchronization. A common modification is to add the **Sync This Record** Boolean field to the contact table, and set the contact table synchronization filter criteria to require that this field be set to **yes** or **true**.

## Frequently asked questions

### What happens if two filters exist for the same table?

When synchronization occurs for a table, each filter is independently applied to a set of rows to synchronize, and any rows found in each of those filter sets is synchronized. This means that because each filter is applied independently, the different row sets will still synchronize even when the filters contain conflicting logic.

Here's an example: If filter A has **Synchronize everything** and filter B has **Synchronize this subset**, the end result is that everything will be synchronized, including that subset. The resulting sync filter is essentially a combination of all synchronization filter criteria specified for a certain table.

It's important to note that due to this, row synchronization can't be further restricted by adding additional filters, only by modifying or removing existing ones.

### What happens if no enabled filters exist for a given table?

If all filters for a table are removed, no data will be synchronized for that table. The system will still sync data for other tables that have sync filters enabled.
  
### How can I check to ensure that the correct list of rows that will be synchronized by a filter are being created in Exchange?

Use advanced find and search for the exact name of the filters listed on the **Synchronization Filters** tab in XrmToolBox. The rows listed in the search results are the rows that will be synchronized with Exchange for the user who has the filters applied for the specific table.
