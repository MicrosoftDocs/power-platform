---
title: "Use Word templates to create standardized documents  | MicrosoftDocs"
description: Use Word templates to create standardized documents
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/11/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Use Word templates to create standardized documents

<!-- legacy procedure -->

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

 After you create and import [!INCLUDE[pn_MS_Word_Full](../includes/pn-ms-word-full.md)] templates into customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), with one click users can generate standardized documents automatically populated with data. This feature has some special considerations you should know about to successfully create [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] templates.  

> [!TIP]
> [![Video symbol](../admin/media/video-thumbnail-4-crm.png "Video symbol")](https://go.microsoft.com/fwlink/p/?LinkId=404225) Check out the following video: [Create documents directly from Dynamics CRM by using Word and Excel templates (2:38)](https://go.microsoft.com/fwlink/p/?LinkID=723604)  

> [!WARNING]
>  There is a known issue when creating templates in [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)]. This topic contains information on how to prevent interactions that could potentially destabilize [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)]. See: [Important! A known issue and how to avoid it](../admin/using-word-templates-dynamics-365.md#BKMK_Important)  

 The following are the supported versions of [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)].  


|                                                                          Area                                                                           | [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] Version |
|---------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------|
|                                    Creating a [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] template                                    |                              2013, 2016                               |
| Using a [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] document generated in customer engagement apps |                           2010, 2013, 2016                            |

> [!NOTE]
> Macro-enabled Word documents (.docm) are not supported.

 Follow the steps in this topic to successfully create and use [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] templates in customer engagement apps.  

<a name="BKMK_AboutSelectEntity"></a>   

## Step 1: Create a [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] template  

### Where you can create a template  
 There are three places in customer engagement apps where you can create a [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] template:  

- **From the Settings page**. Go to **Settings** > **Templates** > **Document Templates** > **New**(![New or Add button](../admin/media/nb-ua-r1-plus.png "New or Add button")). You'll need sufficient permissions to access to the Settings page, such as System Administrator or System Customizer.  

- **From a record**. Open a record such as an account in Sales. Go to **Sales** > **Client_Accounts** > **My Active Accounts**. Click an account to open it, and then click **More** (**…**) > **Word Templates** > **Create Word Template**. Templates created here are personal and available only to the user creating the template.  

- **From a list of records**. For example, go to **Sales** > **Client_Accounts** > **My Active Accounts**. Select a single account, and then click **More** (**…**) > **Word Templates** > **Create Word Template**.  

  ![Create a Word template from an entity](../admin/media/word-template-create-from-entity.png "Create a Word template from an entity")  

> [!TIP]
>  To delete personal document templates, do the following:  
>   
> 1.  Click Advanced Find (![Screen shot of Advanced Find button](../admin/media/advanced-find-button.PNG "Screen shot of Advanced Find button")).  
> 2.  For **Look for**, select **Personal Document Templates**.  
> 3.  Click **Results** (!).  
> 4.  Select the personal document template to delete and then click Delete (![Delete button](../admin/media/nb-ua-r1-trashbin.png "Delete button")).  

 After clicking **Create Word Template**, select an entity to filter with, and then click **Word Template** > **Select Entity**.  

 ![Choose Word Template and select entity](../admin/media/word-template-select-entity.png "Choose Word Template and select entity")  

 The relationship selection page appears.  

 ![Select entities for the Word template](../admin/media/word-template-select-entities.png "Select entities for the Word template")  

### What are 1:N, N:1, and N:N relationships?  
 This screen requires an understanding of your customer engagement apps data structure. Your administrator or customizer can provide information about entity relationships. For admin content, see: [Entity relationships overview](https://docs.microsoft.com/powerapps/maker/common-data-service/relationships-overview).  

 Here are some example relationships for the Account entity.  

|Relationship|Description|  
|------------------|-----------------|  
|![A 1:N entity relationship](../admin/media/word-template-1n-entity-relationship.png "A 1:N entity relationship")|An account can have multiple contacts.|  
|![An N:1 entity relationship](../admin/media/word-template-n-1-entity-relationship.png "An N:1 entity relationship")|A lead, account, or contact can have multiple accounts.|  
|![An N:N entity relationship](../admin/media/word-template-n-n-entity-relationship.png "An N:N entity relationship")|An account can have multiple marketing lists.<br /><br /> A marketing list can have multiple accounts.|  

 The relationships you select on this screen determine what entities and fields are available later when you define the [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] template. Only select relationships you need to add data to the [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] template.  

> [!NOTE]
>  To ensure documents download in a timely matter, there is an upper limit of 100 for the number of related records returned for each relationship. For example, if you're exporting a template for an account, and you want to include a list of its contacts, the document will return at most 100 of the account's contacts.  

### Download the template  
 Click **Download Template** on the **Select Entity** page to create a [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] file on your local computer with the exported entity included as XML data.  


> [!IMPORTANT]
> Document template downloaded from one environment can only be used within that environment. environment to environment migration for Word or Excel templates isn't currently supported.


<a name="BKMK_EnableDeveloper"></a>   
## Step 2: Enable the Developer tab  
 Open the [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] template file. At this point, the document appears to be blank.  

 ![The Word template when first opened](../admin/media/word-template-first-open.png "The Word template when first opened")  

 To see and add customer engagement apps XML data, you need to enable the [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] Developer tab.  

1. Go to **File** > **Options** > **Customize Ribbon**, and then enable **Developer**.  

   ![Add Developer to the Word Ribbon](../admin/media/word-template-developer-word-ribbon.png "Add Developer to the Word Ribbon")  

2. Click **OK**.  

   **Developer** now appears in the [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] ribbon.  

   ![Developer tool on Word Ribbon](../admin/media/word-template-developer-tool-word-ribbon.png "Developer tool on Word Ribbon")  

<a name="BKMK_Important"></a>   
## Important! A known issue and how to avoid it  
 There's a known issue with customer engagement apps apps-generated [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] templates and [!INCLUDE[pn_MS_Word_Full](../includes/pn-ms-word-full.md)]. In the next section, you'll be adding XML content control fields to the [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] template.  

> [!WARNING]
>  A few things  can cause [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] to freeze, requiring you to use [!INCLUDE[pn_ms_TaskManager_short](../includes/pn-ms-taskmanager-short.md)] to stop [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)]:  
> 
> - You insert a content control other than **Picture** or **Plain Text**.  
> - You make a textual change, such as changing the capitalization or adding text, to a content control. These changes can occur through AutoCorrect as well as user edits. By default, Microsoft [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] AutoCorrect capitalizes sentences. When you add a content control field, [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] sees it as a new sentence and will capitalize it when focus shifts away from the field.  

 To prevent issues with control fields, do the following:  

#### Only add fields as Plain Text or Picture  

1. You use the XML Mapping Pane to add entity fields to your [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] template. Be sure to only add fields as **Plain Text** or **Picture**.  

   ![Insert the field as Plain Text](../admin/media/word-template-insertfield-plain-text.png "Insert the field as Plain Text")  

#### Do not make any textual changes to the added content control  

1. You can make formatting changes to content control fields, such as bolding the text, but no other textual changes, including capitalization changes.  

   ![Don't change any text in these fields&#33;](../admin/media/word-template-dont-change-text-fields.png "Don't change any text in these fields!")  

   If you experience [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] freezing or performance degradation, try turning off AutoCorrect.  

#### Turn off AutoCorrect  

1. With the template file open in [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)], go to **File** > **Options** > **Proofing** > **AutoCorrect Options**.  

   ![In Word, select Proofing &#62; AutoCorrection Options](../admin/media/word-template-proofing-auto-correct-options.png "In Word, select Proofing > AutoCorrection Options")  

2. Deselect **Capitalize first letter of sentences** and **Automatically use suggestions from the spelling checker**.  

   ![Deselect the AutoCorrect settings](../admin/media/word-template-deselect-auto-correct-settings.png "Deselect the AutoCorrect settings")  

3. Deselect **Hyphens (--) with dash (-)** on the **AutoFormat** and **AutoFormat as You Type** tabs.  

4. Click **OK**.  

   If you followed the above recommendations, you're ready to define the [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] template.  

<a name="BKMK_DefineTemplate"></a>  

## Step 3: Define the [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] template  
 Use the XML Mapping Pane to define the [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] template with entity fields.  

1. In your [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] template, click **Developer** > **XML Mapping Pane**.  

   ![Select XML Mapping Pane in the Word ribbon](../admin/media/word-template-xml-map-pane.png "Select XML Mapping Pane in the Word ribbon")  

    The default XML schema is selected.  

   ![The default XML Mapping schema](../admin/media/word-template-upload-dynamics-365.png "The default XML Mapping schema")  

2. Select the XML schema. It will begin with "urn:microsoft-crm/document-template/".  

   ![Select the XML schema](../admin/media/word-template-select-xml-schema.png "Select the XML schema")  

   > [!IMPORTANT]
   >  If you have frequent accidental edits that cause [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] to freeze or have performance degradation, be sure to turn off the AutoCorrect options according to the section: "A known issue and how to avoid it".  

3. Expand the entity, right-click the entity field, and then click **Insert Content Control** > **Plain Text**.  

   ![Insert the field as Plain Text](../admin/media/word-template-insertfield-plain-text.png "Insert the field as Plain Text")  

   The entity field is added to the [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] template.  

   ![The field is inserted into the Word template](../admin/media/word-template-insert-field.png "The apps field is inserted into the Word template")  

   Add additional entity fields, add descriptive labels and text, and format the document.  

   A completed template might look like this:  

   ![Sample Word template](../admin/media/word-template-sample.png "Sample Word template")  

   Some content control fields you entered likely have multiple lines of data. For example, accounts have more than one contact. To include all the data in your [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] template, set the content control field to repeat.  

### Set content control fields to repeat  

1. Put fields with repeating data in a table row.  

2. Select the entire table row in the template.  

   ![Create a table and add content control fields](../admin/media/word-template-create-table-content-control-fields.png "Create a table and add content control fields")  

3. In the XML Mapping Pane, right-click the relationship containing the content control fields, and then click **Repeating**.  

   ![Set the table row to repeating](../admin/media/word-template-set-table-row-repeating.png "Set the table row to repeating")  

   When you use the [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] template in customer engagement apps to create a document, the table will populate with multiple rows of data.  

   When the template has the fields and formatting you want, save it and upload it into customer engagement apps.  

<a name="BKMK_Upload"></a>  

## Step 4: Upload the Word template back into customer engagement apps 
When you have your [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] template built the way you want, save it so you can upload it into customer engagement apps.  

 Access to the newly created Word template depends on how you uploaded it and to the access granted to the security role. Be sure to check out [Use Security Roles to control access to templates](../admin/using-word-templates-dynamics-365.md#BKMK_SecurityRoles).  

 Administrators can use the Settings page to upload the [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] template into customer engagement apps. A template uploaded in Settings is available to all users in your organization.  

### For admins: Upload the Word template into customer engagement apps

1. Go to **Settings** > **Templates** > **Document Templates**.  

2. Click **Upload Template**.  

3. Drag the [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] file in the dialog box or browse to the file.  

   ![Upload Template dialog box](../admin/media/word-template-upload-dialog-box.png "Upload Template dialog box")  

4. Click **Upload**.  

   Non-admin users can upload a template for their own use from a list of records.  

### For non-admins or admins wanting to create a personal template: Upload the Word template into customer engagement apps

1. Open a page with a list of records, for example, the list of customer accounts in Sales.  

2. Select a single item such as an account, click **More** (**…**) > **Word Templates** > **Create Word Template**.  

3. Click **Word Template** > **Upload**.  

   ![Click Upload to bring the template into customer engagement apps](../admin/media/word-template-upload-button.png "Click Upload to bring the template into customer engagement apps")  

4. Drag the [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] file in the dialog box or browse to the file.  

5. Click **Upload**.  

<a name="BKMK_Generate"></a>

## Step 5: Generate a document from the [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] template  
 To use the [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] template you've created, do the following:  

1. Open a record with information you want to create a document. For example, open a customer account record in Sales.  

2. Click **More** (**…**) **> Word Templates**, and then under **Word Templates** select the template you created.  

    If the template you created is not visible, there are two possibilities:  

   1. Only templates built for the selected record type (entity) will be displayed. For example, if you open an opportunity record, you will not see a template you created with the Account entity.  

   2. You need to refresh customer engagement apps to see the template. Either refresh your browser or close and reopen customer engagement apps.  

   After you select your [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] template, customer engagement apps create a [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] document from the record you selected.  

<a name="BKMK_SampleTemplates"></a>  

### Try out the sample [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] templates  
 There are five [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] templates included with customer engagement apps.  

 ![These templates are included with customer engagement apps](../admin/media/template-bundled.png "These templates are included with customer engagement apps")  

 The sample [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] templates were created with a particular record type (entity). You'll only be able to apply the template to records of the same record type.  

|Name|Entity|  
|----------|------------|  
|Opportunity Summary|Opportunity (Sales area)|  
|Campaign Summary|Campaign (Marketing area)|  
|Case Summary|Case (Service area)|  
|Invoice|Invoice (Sales area)|  
|Account Summary|Client_Account (Sales, Service, and Marketing areas)|  

### To apply a sample [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] template  

1. Open a record with information with the entity type that matches the sample template. For example, open a customer account record in Sales to apply the Account Summary template.  

2. Click **More** (**…**) **> Word Templates**, and then under **Word Templates** select the sample template.  

   Open the newly-created [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] template and give it a look.  

> [!NOTE]
>  You can review but not edit templates that are included in customer engagement apps.  

## Additional considerations  

<a name="BKMK_SecurityRoles"></a> 

### Use Security Roles to control access to templates  
 Administrators can control access to Word templates with some granularity. For example, you can give salespeople Read but not Write access to a Word template.  

1. Click **Settings** > **Security** > **Security Roles**.  

2. Select a role, and then click the Business Management tab.  

3. Select **Document Template** to set access for templates available to the entire organization. Select **Personal Document Template** for templates shared to individual users.  

4. Click the circles to adjust the level of access.  

   ![Adjust access using the security role](../admin/media/excel-template-restrict-access-using-security-role.png "Adjust access using the security role")  

### Lists in created documents are not in the same order as records  
 Lists of records created from a custom template may not appear in the same order in [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] documents as the order in customer engagement apps. Records are listed in the order of the time and date they were created.  

### See also  

[Analyze your data with Excel templates](../admin/analyze-your-data-with-excel-templates.md)

[Troubleshooting Word templates](troubleshoot-word-templates-dynamics-365.md)
