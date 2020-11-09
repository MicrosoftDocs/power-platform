---
title: "Analyze your data with Excel templates  | MicrosoftDocs"
description: Analyze your data with Excel templates
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/04/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Analyze and share your data with Excel templates 

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

<!-- legacy procedure -->
  
 [!INCLUDE[pn_microsoft_excel](../includes/pn-microsoft-excel.md)] provides powerful ways to analyze and present your data. With [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] templates, you can easily create and share your customized analysis with others in your organization.  
  
 Use [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] templates for:  
  
- Sales Forecasting  
  
- Pipeline Management  
  
- Leads Scoring  
  
- Territory Planning  
  
- And much more…  
  
  You can try out the [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] templates included with customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), to get a quick view of what kind of analysis is possible.  
  
  ![Example of a pipeline analysis Excel template](../admin/media/excel-template-example-pipeline-analysis.png "Example of a pipeline analysis Excel template")  
  
> [!TIP]
> [![Video symbol](../admin/media/video-thumbnail-4-crm.png "Video symbol")](https://go.microsoft.com/fwlink/p/?LinkId=404225) Check out the following video: [Create documents directly from Dynamics CRM by using Word and Excel templates (2:38)](https://go.microsoft.com/fwlink/p/?LinkID=723604)  
  
<a name="BKMK_CreateTemplate"></a>   
## Create a new Excel template  
 Following are the steps for creating an [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template.  
  
 ![The process to create an Excel template](../admin/media/excel-template-create-process.png "The process to create an Excel template")  
  
<a name="BKMK_CreateStep1"></a>   
### Step 1: Create a new template from existing data  
 There are two places where you can create an [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template:  
  
- **From the Settings page**. Go to **Settings** > **Templates** > **Document Templates** > **New** (![New or Add button](../admin/media/nb-ua-r1-plus.png "New or Add button")). You must have sufficient permissions to access to the Settings page, such as System Administrator or System Customizer.  
  
- **From a list of records**. For example, go to **Sales** > **Opportunities** > **My Open Opportunities**. On the menu bar, click **Excel Templates** > **Create Excel Template**.  
  
  ![Create Excel Template menu option](../admin/media/excel-template-create-menu.png "Create Excel Template menu option")  
  
  The **Create template** page appears.  
  
  ![Create Excel Template page](../admin/media/excel-template-create-from-data-page.png "Create Excel Template page")  
  
#### Select the data to include in the template  
  
1. Click **Excel Template**.  
  
2. Select an entity (record type) to include that entity's data. The views you can select in the next field depend on the entity you select.  
  
3. Select a view.  
  
4. Click **Edit Columns** to add, remove, and adjust properties for the columns to include in the template.  
  
5. Click **Download File** to create the template file.  
  
> [!WARNING]
>  You can also download a template containing no data except for the columns associated with the record type (entity) using **Settings** > **Data Management** > **Templates for Data Import**. For more information, see: [Download a template for data import](../admin/download-template-data-import.md).  

> [!IMPORTANT]
> Document template downloaded from one environment can only be used within that environment. environment to environment migration for Word or Excel templates isn't currently supported.
>
> During the creation of an Excel template, a maximum of 50 records are exported in the template file.
  
<a name="BKMK_CreateCustomize"></a>   
### Step 2: Customize the data in Excel  
 Open the newly-created template in [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] to customize the data.  
  
 ![New Excel Template](../admin/media/excel-template-new.png "New Excel Template")  
  
 Let's walk through a simple example of customizing an [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template using  sample data.  
  
#### Example customization of Opportunities data  
  
1. Click **Enable Editing** to allow customization of the [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] spreadsheet.  
  
2. Add a new column and name it "Expected Revenue".  
  
   ![Customize the Excel template](../admin/media/excel-template-customize.png "Customize the Excel template")  
  
3. Create a formula for expected revenue. Don't refer to cells using their addresses; define and use names instead.  
  
   ![Create a formula in the Excel template](../admin/media/excel-template-create-formula.png "Create a formula in the Excel template")  
  
4. Create a pivot table and chart. These and other demo steps will be explained in a future update to this topic.  
  
    Place user-added content above or to the right of the existing data table. This prevents the content from being overwritten if you add new data later and you create a new [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template. For more information, see: [Best practices and considerations for using Excel templates](../admin/analyze-your-data-with-excel-templates.md#BKMK_BestPractices).  
  
   ![Excel template with Pivot Chart](../admin/media/excel-template-pivot-chart.png "Excel template with Pivot Chart")  
  
5. Save the spreadsheet.  
  
   You're now ready to upload the [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template.  
  
<a name="BKMK_CreateUpload"></a>   
### Step 3: Upload the template and share with others  
 When you have your [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template customized the way you want, you can upload it. Where you upload the template determines its availability.  
  
 Administrators can use the Settings page to upload the [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template. A template uploaded in Settings is available to all users.  
  
#### For admins: Upload the Excel template
  
1. Go to **Settings** > **Templates** > **Document Templates**.  
  
2. Click **Upload Template**.  
  
3. Drag the [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] file into the dialog box or browse to find and upload the file.  
  
   ![Upload Template dialog box](../admin/media/word-template-upload-dialog-box.png "Upload Template dialog box")  
  
4. Click **Upload**.  
  
   Non-admin users can upload a template for their own use from a list of records.  
  
#### For non-admins or admins wanting to create a personal template: Upload the Excel template
  
1. Open a page with a list of records, for example, the list of Sales Opportunities. Go to **Sales** > **Opportunities** > **My Open Opportunities**.  
  
2. On the menu bar, click **Excel Templates** > **Create Excel Template**.  
  
3. Click **Excel Template** > **Upload**.  
  
   ![Click Upload to add the Excel template](../admin/media/excel-template-upload.png "Click Upload to add the Excel template")  
  
4. Drag the file into the dialog box or browse to find and upload the file.  
  
5. Click **Upload**.  
  
<a name="BKMK_CreateChoose"></a>   
### Step 4: Choose who can use the new template  
 Access to the newly-created [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template depends on how you uploaded it, and on the access granted to the security role. Be sure to check out [Use security roles to control access to templates](../admin/analyze-your-data-with-excel-templates.md#BKMK_SecurityRole).  
  
 **If you uploaded the template from the Settings page**  
  
 The Information page for the uploaded [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template will look like this.  
  
 ![Excel template uploaded from Settings page](../admin/media/excel-template-uploaded-from-settings-page.png "Excel template uploaded from Settings page")  
  
 Templates uploaded from the Settings page are available to all users. You don't need to take any further action.  
  
 **If you uploaded the template from a list of records**  
  
 The Information page for the uploaded [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template will look like this.  
  
 ![An Excel template uploaded from a list of records](../admin/media/excel-template-uploaded-from-list.png "An Excel template uploaded from a list of records")  
  
 Templates uploaded from a list of records are available to the user who uploaded the template. To share the template with others, following these steps:  
  
1. From the template Information page, click **Share**.  
  
2. Use the **Share personal document template** page to share the [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template with others and to set permissions.  
  
   ![Share the Excel template with other users](../admin/media/excel-template-share.png "Share the Excel template with other users")  
  
<a name="BKMK_UseTemplate"></a>   
## Export and analyze data using the new template  
 The process for using an [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template looks like this.  
  
 ![Process flow to use Excel template](../admin/media/excel-template-process-flow.png "Process flow to use Excel template")  
  
<a name="BKMK_UseSelectEntity"></a>   
### Step 1: Select an entity to analyze  
 Select an entity (record type) to analyze with the [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template you created. For example, go to **Sales** > **Opportunities** > **My Open Opportunities**. Two new opportunities were added since the template was created.  
  
 ![List of Open Opportunities](../admin/media/excel-template-list-open-opportunities.png "List of Open Opportunities")  
  
<a name="BKMK_UseExport"></a>   
### Step 2: Export data using your new Excel template  
 Choose the [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template you created.  
  
 ![Choose the template you created](../admin/media/excel-template-choose-template.png "Choose the template you created")  
  
 This template was created from the Settings page so it will appear on the menu under **Excel Templates**. If it had been created from a records list, it would appear under **Personal Excel Templates**.  
  
 If you have [!INCLUDE[pn_microsoft_excel_online](../includes/pn-microsoft-excel-online.md)], you can see the data in place in an [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] window in customer engagement apps (such as Dynamics 365 Sales and Customer Service). If not, or if you'd rather create the [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] file, click **Download \<template name>**.  
  
<a name="BKMK_UseAnalyze"></a>   
### Step 3: Analyze your data in Excel  
 What you see in the [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] spreadsheet is based on two things:  
  
- **Records**. The view you choose to export from determines what records you see in the exported [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] file. For example, if you selected Closed Opportunities, you'll see those records even if you used the template created with My Open Opportunities.  
  
- **Columns**. The template you used determines what columns appear in the table in the exported [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] file. For example, the Closed Opportunities view has these columns: Potential Customer, Status, Actual Revenue, and Actual Close Date. But if the template you used was based on My Open Opportunities, you'd see columns associated with that view and any column filtering done when you created the template.  
  
<a name="BKMK_UseShare"></a>   
### Step 4: Share the results with others  
 If you're using [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)], save a copy either online or to your computer. Send the file to others for their review and input.  
  
<a name="BKMK_SampleTemplates"></a>   
## Try out the sample Excel templates  
 There are four [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] templates included with customer engagement apps.  
  
 ![Try out the included Excel templates](../admin/media/excel-template-included.png "Try out the included Excel templates")  
  
 The sample [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] templates were created with a specific record type (entity). You'll only be able to apply the template to records of the same record type.  
  
|Name|Entity|  
|----------|------------|  
|Pipeline Management|Opportunity (Sales area)|  
|Campaign Overview|Campaign (Marketing area)|  
|Cases SLA Status|Case (Service area)|  
|Case Summary|Case (Service area)|  
  
### To apply a sample Excel template  
  
1. Open a list of records with information with the entity type that matches the sample template. For example, open a list of sales opportunities to apply the Pipeline Management template.  
  
2. Click **> Excel Templates**, and then under **Excel Templates**, select the sample template.  
  
3. Download the template or open it in place in [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)].  
  
> [!TIP]
>  You can export the templates that are included in customer engagement apps, modify them, and then reimport them as new templates. This can give you a running start on creating your own custom [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] templates.  
  
<a name="BKMK_BestPractices"></a>   
## Best practices and considerations for using Excel templates  
 Here are some things you need to be aware of to create and make best use of [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] templates.  
  
### Test your Excel templates  
 [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] has lots of features. It's a good idea to test your customizations to see that all [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] features work as expected in your templates.  
  
### Privacy and pivot charts  
 By default pivot chart data is not updated when a spreadsheet is opened. This can create a security issue if certain pivot chart data should not be seen by users with insufficient permissions.  
  
 **Consider the following scenario:**  
  
- An administrator creates a template with sensitive data in pivot charts and uploads the template.  
  
- A salesperson who should not have access to the sensitive data in the pivot charts uses the template to create an [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] file to do some data analysis.  
  
  **The outcome.** The salesperson might be able to see the pivot chart data as uploaded by the administrator including access to views the salesperson does not have permissions for.  
  
  **In addition.** iOS does not support updating pivot data and pivot charts when using the [!INCLUDE[pn_microsoft_excel](../includes/pn-microsoft-excel.md)] app on iOS devices.  
  
  **Recommendation.** Sensitive data should not be included in pivot tables and pivot charts.  
  
### Set pivot chart data to automatically refresh  
 Be default, pivot chart data does not automatically refresh when you open the spreadsheet. Regular charts automatically update.  
  
 In [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)], right-click the pivot chart, and then click **PivotChart Options** > **Refresh data when opening the file**.  
  
 ![Use this setting to ensure data is refreshed](../admin/media/excel-template-ensure-data-refreshed.png "Use this setting to ensure data is refreshed")  
  
### Placing new data  
 If you want to add content to the [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template, place your data above or to the right of the existing data. A second option is to place your new content on a second sheet.  
  
### Excel templates with images may cause an error  
 If you try to analyze data with an [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template that has an image saved in it, you may see the following error: "An error occurred while attempting to save your workbook. As a result, the workbook was not saved." Try removing the image from the template and reloading it.  
  
### Excel templates and Office Mobile app in Windows 8.1  
 [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] templates will not open in [!INCLUDE[pn_windows_8_1](../includes/pn-windows-8-1.md)] devices with Office Mobile app. You'll get the following error message: "We've recovered as much of your document as we could, but you can't edit it. Try to open and repair the document on your PC to fix the problem."  
  
 This is a known issue.  
  
### Use table column names and range names in formulas  
 When you create [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] formulas, don't use column titles or cell numbers. Instead, use the table column names, and define names for cells or cell ranges.  
  
<a name="BKMK_SecurityRole"></a>   
## Use security roles to control access to templates  
 Administrators can control access to [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] templates with some granularity. For example, you can give salespeople Read but not Write access to an [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template.  
  
1. Click **Settings** > **Security** > **Security Roles**.  
  
2. Select a role, and then click the Business Management tab.  
  
3. Select **Document Template** to set access for templates available to the entire organization. Select **Personal Document Template** for templates shared to individual users.  
  
4. Click the circles to adjust the level of access.  
  
   ![Adjust access using the security role](../admin/media/excel-template-restrict-access-using-security-role.png "Adjust access using the security role")  
  
### To view and delete personal document templates  
 Follow these steps to delete personal document templates:  
  
1.  Click Advanced Find (![Screen shot of Advanced Find button](../admin/media/advanced-find-button.PNG "Screen shot of Advanced Find button")).  
  
2.  For **Look for**, select **Personal Document Templates**.  
  
3.  Click **Results** **(!)**.  
  
4.  Select the personal document template to delete, and then click Delete (![Delete button](../admin/media/nb-ua-r1-trashbin.png "Delete button")).  
  
### Excel template does not upload in Microsoft Edge  
 If your [!INCLUDE[pn_microsoft_excel](../includes/pn-microsoft-excel.md)] template does not upload when using [!INCLUDE[pn_microsoft_edge](../includes/pn-microsoft-edge.md)] as your browser, update [!INCLUDE[pn_microsoft_edge](../includes/pn-microsoft-edge.md)] and try again.  
  
## Privacy notice  
[!INCLUDE[cc_privacy_export_to_excel](../includes/cc-privacy-export-to-excel.md)]
  
### See also  
 [Download a template for data import](../admin/download-template-data-import.md)   
 [Using Word templates](../admin/using-word-templates-dynamics-365.md)
