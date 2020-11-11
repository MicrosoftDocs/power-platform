---
title: "Set up OneNote integration  | MicrosoftDocs"
description: Learn how to integrate OneNote with customer engagement apps
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/10/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Set up OneNote integration

Gather your thoughts, ideas, plans and research in one single place with [!INCLUDE[pn_onenote](../includes/pn-onenote.md)] in model-driven Power Apps and customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation).  

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]
  
 When you turn on [!INCLUDE[pn_microsoft_onenote](../includes/pn-microsoft-onenote.md)] integration, you have the benefits of using [!INCLUDE[pn_onenote](../includes/pn-onenote.md)] to take or review customer notes from within your records.  
  
 You can configure [!INCLUDE[pn_onenote](../includes/pn-onenote.md)] integration when you're also using [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)]. You must have a subscription to [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] to use [!INCLUDE[pn_onenote](../includes/pn-onenote.md)] in model-driven and customer engagement apps.  
  
<a name="BKMK_EnableSharePointInt"></a>   
## Step 1: Turn on server-based SharePoint integration  

 Before you can enable [!INCLUDE[pn_onenote](../includes/pn-onenote.md)] integration, you need to [turn on server-based SharePoint integration](set-up-sharepoint-integration.md).  
  
 [!INCLUDE[proc_permissions_system_admin](../includes/proc-permissions-system-admin.md)] Or, make sure that you have Read and Write privileges on all record types that are customizable.  
  
#### Check your security role  
  
- [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  
  
- [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  
  
  ![Enable SharePoint Integration](../admin/media/enable-sharepoint-integration.png "Enable SharePoint Integration")  
  
<a name="BKMK_EnableOneNote"></a>   
## Step 2: Turn on OneNote integration  

 When server-based [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] integration is turned on, **[!INCLUDE[pn_onenote](../includes/pn-onenote.md)] integration** is listed in **Document Management**.  
  
1. In the Power Platform admin center, select an environment. 

2. Select **Settings** > **Integration** > **Document management settings**.  
  
3. Select **OneNote Integration**.  
  
   ![Choose OneNote Integration](../admin/media/onenote-integration.png "Select OneNote Integration")  
  
4. Follow the instructions in the wizard to turn on [!INCLUDE[pn_onenote](../includes/pn-onenote.md)] integration for selected entities. Choose entities that need a full notebook per record. Only entities that are already enabled for document management are listed. Select **Finish**.  
  
   ![Follow instructions in wizard](../admin/media/onenote-integration-wizard.png "Follow instructions in the wizard")  
  
5. You can also enable [!INCLUDE[pn_onenote](../includes/pn-onenote.md)] integration for an entity from the customization form, as long as document management has been enabled for that entity.  
  
   ![Select OneNote integration for an entity](../admin/media/onenote-select-entity.png "Select OneNote integration for an entity")  
  
6. A [!INCLUDE[pn_onenote](../includes/pn-onenote.md)] notebook is automatically created for a record the first time you select the **OneNote** tab in the activities area in model-driven and customer engagement apps. After the dedicated [!INCLUDE[pn_onenote](../includes/pn-onenote.md)] notebook is created for that record, you can view and navigate to that notebook from any Dynamics 365 apps client.  
  
[!INCLUDE[proc-more-information](../includes/proc-more-information.md)] [Take notes by using OneNote](/powerapps/user/onenote)
  
## To turn off OneNote integration  
  
1. In the Power Platform admin center, select an environment. 

2. Select **Settings** > **Integration** > **Document management settings**.  
  
3. Select **OneNote Integration**.  
  
   ![Choose OneNote Integration](../admin/media/onenote-integration.png "Select OneNote Integration")  
  
4. In the **OneNote Integration Setting** dialog box, clear the check boxes for all entities, and then select **Finish**.  

## Troubleshooting OneNote integration

### Why do OneNote files show a folder icon?  
 This is a known issue. Select the file name to open the OneNote as expected.  
  
### Why aren't my OneNote notebooks showing up in the OneDrive documents area?  
 OneNote notebooks saved to the Microsoft 365 Groups OneDrive won't be shown.  
  
### Error message: We can't find the notebook
You receive this error message:

We can't find the notebook. The OneNote notebook might have been removed or moved to another location. Check the notebook location or contact your administrator to update the location record stored in Dynamics 365 Customer Engagement. (Error: 0x80060729)  

To resolve the issue, follow these steps:   
1. Sign into the [Power Platform](https://admin.powerplatform.microsoft.com/), and open the environment you want. 
1. Select **Settings** > **Integration**, and then select **Document management settings**.  
1. Select **SharePoint Document Locations**, open that document location record, and then change the corresponding URL to match your notebook location.  
  
### Can I edit a OneNote file from within a model-driven or Dynamics 365 customer engagement app?  
 No. This can be done only from the OneNote app that opens when you select the OneNote link.  
  
### I can't access my OneNote notebook
 Don't delete any OneNote .onetoc2 or .one file types in the OneNote section in the app. If you do, you won't be able to access your OneNote notebooks.  
  
### Are section groups supported?
 Sections groups that keep related sections together in OneNote aren't supported in model-driven Power Apps or customer engagement apps.  
  
### Can I rename a section in OneNote Online?

 No. You can only rename a section in the desktop version of OneNote. If you rename a section in OneNote Online, you won't see the updated section name in the app.  
  
### Why do I see records that should be in the OneNote tab?

 This happens when you have deleted all of the sections in the notebook. It's recommended that you have at least one section in your OneNote notebook. To fix the issue do this:  
  
1. Go to the record where you see the issue. For example, from the main menu select, **Sales** > **Accounts** > select an account record.  
  
2. From the main menu select the drop down menu next to the record name, and then select **Documents**.  
  
3. Select **Open in SharePoint** and then create a new section using the desktop version of OneNote.  

### Changing the name of a OneNote file through document grid displays error message

Imagine the following events:
1. User A opens a OneNote note in a Power Apps model-driven app or Dynamics 365 customer engagement app and adds content. For example, **Sales** > **Contacts** > *contact* > **Summary** > **Timeline** section > **+** > OneNote.
1. User A, or another user, such as User B, changes the name of the OneNote file in a document grid. For example, **Sales** > **Contacts** > *contact* > **Related** > **Documents**.
1. User A opens the note in the timeline on a form. For example, **Sales** > **Contacts** > *contact* > **Summary** > **Timeline** section > **+** > **OneNote**.

When this occurs, user A sees the error message "Folder *contact* has been renamed or deleted from SharePoint. It was expected inside *SharePoint folder* path."
:::image type="content" source="media/one-note-error.png" alt-text="Error message due to renamed OneNote file in document grid":::

<!-- ## Error message: File cannot be found
I get this error message: 

    File cannot be found. (Error: 0x80060706)  

In an on-premises deployment, you can get this error when opening the [!INCLUDE[pn_onenote](../includes/pn-onenote.md)] tab in an entity enabled for [!INCLUDE[pn_onenote](../includes/pn-onenote.md)] if you turned off **CreateSPFoldersUsingNameandGuid** using the OrgDBOrgSettings tool.  Set this option to **True**. See: [OrgDBOrgSettings tool for Dynamics CRM](https://support.microsoft.com/kb/2691237).  

Note that [!INCLUDE[pn_onenote](../includes/pn-onenote.md)] requires [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] folders to include the GUID.  

## I get this error message: List does not support this operation. (Error: 0x80060715)  

On subsequent clicks in [!INCLUDE[pn_onenote](../includes/pn-onenote.md)], this error message appears: **No sections to display. Note that sections in a section group aren't supported.** To fix this issue, set the file path length to less than 70 characters.  

## Changing the name of a OneNote file in [!INCLUDE[pn-crm-9-0-0-online](../includes/pn-crm-9-0-0-online.md)] can create a conflict

Consider this scenario:

User A opens a OneNote note in Dynamics 365 Customer Engagement (on-premises) and adds content (For example: **Sales** > **Accounts** > <account> > **Summary** > Timeline section > **+** > OneNote). User A, or a second user, User B, changes the name of the OneNote file in a document grid (For example: **Sales** > **Accounts** > <account> > **Related** > **Documents**). User A opens the note using Timeline (For example: **Sales** > **Accounts** > <account> > **Summary** > Timeline section > **+** > **OneNote**). User A should see the renamed note with the existing content. Instead, a new note is opened. -->

### See also

[Turn on server-based SharePoint integration](set-up-sharepoint-integration.md)