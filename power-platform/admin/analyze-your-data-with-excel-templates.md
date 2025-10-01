---
title: "Create and share data analysis Excel templates"
description: "Excel templates provide powerful ways to analyze and present your data. Learn tips for creating new templates, exporting data, and following best practices."
author: sericks007
contributor: yingchin
ms.component: pa-admin
ms.topic: how-to
ms.date: 05/16/2025
ms.subservice: admin
ms.custom: NewPPAC
ms.author: sericks
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
---
# Analyze and share your data with Excel templates 

<!-- legacy procedure -->
  
[!INCLUDE[pn_microsoft_excel](../includes/pn-microsoft-excel.md)] provides powerful ways to analyze and present your data. With [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] templates, you can easily create and share your customized analysis with others in your organization.  
  
Use [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] templates for:  
  
- Sales Forecasting  
  
- Pipeline Management  
  
- Leads Scoring  
  
- Territory Planning  
  
- And much more…  
  
You can try out the [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] templates included with customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), to get a quick view of what kind of analysis is possible.  
  
  ![Example of a pipeline analysis Excel template.](../admin/media/excel-template-example-pipeline-analysis.png "Example of a pipeline analysis Excel template")  
 
## Create a new Excel template

Follow the steps to create an [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template.  
  
 ![The process to create an Excel template.](../admin/media/excel-template-create-process.png "The process to create an Excel template")  

### Step 1: Create a new template from existing data

There are two places where you can create an [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template:  
  
- **From [Power Platform admin center](https://admin.powerplatform.microsoft.com/)**.

Access requires sufficient permissions, such as System Administrator or System Customizer role. To check your security role, see [View your user profile](/powerapps/user/view-your-user-profile). If you don’t have the correct permissions, contact your system administrator.

#### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the command bar, select **Settings**. 
1. Expand **Templates**, then select **Document templates**.
1. In the command bar, select **New**, then select **Excel Template**.
1. In the dialog window, select the **Entity** to filter and the **View** to use, then select **Download** to download the template.
   
#### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the command bar, select **Settings**. 
1. Expand **Templates**, then select **Document templates**.
1. In the command bar, select **New**, then select **Excel Template**.
1. In the dialog window, select the **Entity** to filter and the **View** to use, then select **Download** to create the template file.

---

- **From a list of records**. 
For example:
1. Sign in to the **Sales Hub** app.
1. In the navigation pane, select **Opportunities**.
1. From the grid view selector in the command bar, choose **My Open Opportunities** to display a list of records.
1. In the command bar, select **Excel Templates**, then select **Create Excel Template - Download Template**.
1. In the dialog window, select the **Entity** to filter and the **View** to use, then select **Download** to create the template file.
    
#### Select the data to include in the template  
  
Follow steps described above:
1. In the dialog window, select the **Entity** to filter and the **View** to use.
1. Select **Edit Columns** to customize the columns—add, remove, and adjust properties as needed.  
1. Select **Download** to create the template file.  
  
> [!WARNING]
>  You can also download a template containing no data except for the columns associated with the record type (entity). You can learn more in the article, [Download a template for data import](../admin/download-template-data-import.md).  

> [!IMPORTANT]
> Document template downloaded from one environment can only be used within that environment. Environment to environment migration for Word or Excel templates isn't currently supported.
>
> During the creation of an Excel template, a maximum of 50 records are exported in the template file.
  
### Step 2: Customize the data in Excel  

Open the newly-created template in your local instance of Excel to customize the data.  
  
 ![New Excel Template.](../admin/media/excel-template-new.png "New Excel Template")  

> [!IMPORTANT]
> Do not use Excel online for customizing the template data as the changes cannot be saved. Any updates to the template data made in Excel online will be lost after you close the tab.
  
Let's walk through a simple example of customizing an [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template using  sample data.  
  
#### Example customization of Opportunities data  
  
1. Select **Enable Editing** to allow customization of the [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] spreadsheet.  
  
2. Add a new column and name it *Expected Revenue*.  
  
   ![Customize the Excel template.](../admin/media/excel-template-customize.png "Customize the Excel template")  
  
3. Create a formula for expected revenue. Don't refer to cells using their addresses; define and use names instead.  
  
   ![Create a formula in the Excel template.](../admin/media/excel-template-create-formula.png "Create a formula in the Excel template")  
  
4. Create a pivot table and chart. These and other demo steps will be explained in a future update to this topic.  
  
    Place user-added content above or to the right of the existing data table. This prevents the content from being overwritten if you add new data later and you create a new [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template. You can learn more in the article, [Best practices and considerations for using Excel templates](#best-practices-and-considerations-for-using-excel-templates).  
  
   ![Excel template with Pivot Chart.](../admin/media/excel-template-pivot-chart.png "Excel template with Pivot Chart")  
  
5. Save the spreadsheet.  
  
   You're now ready to upload the [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template.  
  
### Step 3: Upload the template and share with others  
 When you have your [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template customized the way you want, you can upload it. Where you upload the template determines its availability.  

 Administrators can go to **[Power Platform admin center](https://admin.powerplatform.microsoft.com/)** to upload the [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template. A template uploaded is available to all users.  
 
#### For admins: Upload the Excel template

#### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the command bar, select **Settings**. 
1. Expand **Templates**, then select **Document templates**.
1. In the command bar, select **Upload Template**, then select **Excel Template**.
1. In the dialog window, choose a file to upload, then select **Upload** to upload the template file.
   
#### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the command bar, select **Settings**. 
1. Expand **Templates**, then select **Document templates**.
1. In the command bar, select **Upload Template**, then select **Excel Template**.
1. In the dialog window, choose a file to upload, then select **Upload** to upload the template file.

---
   
#### For non-admins or admins wanting to create a personal template: Upload the Excel template

Non-admin users can upload a template for their own use from a list of records.  

For example:
1. Sign in to the **Sales Hub** app.
1. In the navigation pane, select **Opportunities**.
1. From the grid view selector in the command bar, choose **My Open Opportunities** to display a list of records.
1. In the command bar, select **Excel Templates**, then select **Create Excel Template - Upload Template**.
1. In the dialog window, choose a file to upload, then select **Upload** to upload the template file.

### Step 4: Choose who can use the new template  

 Access to the newly-created [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template depends on how you uploaded it, and on the access granted to the security role. Be sure to check out [Use security roles to control access to templates](#use-security-roles-to-control-access-to-templates).  
  
 **If you uploaded the template from the [Power Platform admin center](https://admin.powerplatform.microsoft.com/)**  
  
 Templates are available to all users. You don't need to take any further action.  
  
 **If you uploaded the template from a list of records**  
  
 Templates are available to the user who uploaded the template. To share the template with others, following these steps:  
  
1. From the template Information page, select **Share**.  
  
2. Use the **Share personal document template** page to share the [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template with others and to set permissions.  
  
   ![Share the Excel template with other users.](../admin/media/excel-template-share.png "Share the Excel template with other users")  
  
## Export and analyze data using the new template

 The process for using an [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template looks like this.  
  
 ![Process flow to use Excel template.](../admin/media/excel-template-process-flow.png "Process flow to use Excel template")  
  
### Step 1: Select an entity to analyze

Select an entity (record type) to analyze with the [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template you created. For example, go to **Sales** > **Opportunities** > **My Open Opportunities**. Two new opportunities were added since the template was created.  
  
![List of Open Opportunities.](../admin/media/excel-template-list-open-opportunities.png "List of Open Opportunities")  
  
### Step 2: Export data using your new Excel template

Choose the [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template you created.  
  
![Choose the template you created.](../admin/media/excel-template-choose-template.png "Choose the template you created")  
  
You created the template from the **Settings** page so you can find it on the menu under **Excel Templates**. If you created the template from a records list, you would find it under **Personal Excel Templates**.  
  
If you have [!INCLUDE[pn_microsoft_excel_online](../includes/pn-microsoft-excel-online.md)], you can see the data in place in an [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] window in customer engagement apps (such as Dynamics 365 Sales and Customer Service). If not, or if you'd rather create the [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] file, select **Download \<template name>**.  
  
### Step 3: Analyze your data in Excel

What you see in the [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] spreadsheet is based on two things:  
  
- **Records**. The view you choose to export from determines what records you see in the exported [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] file. For example, if you selected Closed Opportunities, you'll see those records even if you used the template created with My Open Opportunities.  
  
- **Columns**. The template you use determines what columns appear in the table in the exported [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] file. For example, the *Closed Opportunities* view has these columns:
Potential Customer, Status, Actual Revenue, and Actual Close Date. But if you use a template based on *My Open Opportunities*, you see columns associated with that view and any column filtering done when you created the template.  
  
### Step 4: Share the results with others

 If you're using [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)], save a copy either online or to your computer. Send the file to others for their review and input.  
  
## Try out the sample Excel templates

 There are four [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] templates included with customer engagement apps.  
  
 ![Try out the included Excel templates.](../admin/media/excel-template-included.png "Try out the included Excel templates")  
  
 The sample [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] templates were created with a specific record type (entity). You'll only be able to apply the template to records of the same record type.  
  
|Name|Entity|  
|----------|------------|  
|Pipeline Management|Opportunity (Sales area)|  
|Campaign Overview|Campaign (Marketing area)|  
|Cases SLA Status|Case (Service area)|  
|Case Summary|Case (Service area)|  
  
### To apply a sample Excel template  
  
1. Open a list of records with information with the entity type that matches the sample template. For example, open a list of sales opportunities to apply the *Pipeline Management* template.  
  
2. Expand **> Excel Templates**, and then select the **sample template**.  
  
3. Download the template or open it in place in [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)].  
  
> [!TIP]
> You can export the templates that are included in customer engagement apps, modify them, and then reimport them as new templates. This can give you a running start on creating your own custom [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] templates.  
  
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

 By default, pivot chart data does not automatically refresh when you open the spreadsheet. Regular charts automatically update.  
  
 In [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)], right-click the pivot chart, and then select **PivotChart Options** > **Refresh data when opening the file**.  
  
 ![Use this setting to ensure data is refreshed.](../admin/media/excel-template-ensure-data-refreshed.png "Use this setting to ensure data is refreshed")  
  
### Placing new data

If you want to add content to the [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template, place your data above or to the right of the existing data. A second option is to place your new content on a second sheet.  
  
### Excel templates with images may cause an error

If you try to analyze data with an [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template that has an image saved in it, you may see the following error: *An error occurred while attempting to save your workbook. As a result, the workbook was not saved.* Try removing the image from the template and reloading it.  
  
### Excel templates and Office Mobile app in Windows 8.1

[!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] templates will not open in [!INCLUDE[pn_windows_8_1](../includes/pn-windows-8-1.md)] devices with Office Mobile app. You'll get the following error message: *We've recovered as much of your document as we could, but you can't edit it. Try to open and repair the document on your PC to fix the problem.*  
  
 This is a known issue.  
  
### Use table column names and range names in formulas

When you create [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] formulas, don't use column titles or cell numbers. Instead, use the table column names, and define names for cells or cell ranges.  
  
## Use security roles to control access to templates

Administrators can control access to [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] templates with some granularity. For example, you can give salespeople Read but not Write access to an [!INCLUDE[pn_Excel_short](../includes/pn-excel-short.md)] template.  
  
1. Select **Settings** > **Security** > **Security Roles**.  
  
2. Choose a role, and then select the **Business Management** tab.  
  
3. Select **Document Template** to set access for templates available to the entire organization. Select **Personal Document Template** for templates shared with individual users.  
  
4. Select the circles to adjust the level of access.  
  
   ![Adjust access using the security role.](../admin/media/excel-template-restrict-access-using-security-role.png "Adjust access using the security role")  
  
### To view and delete personal document templates

Follow these steps to delete personal document templates:  
  
1.  Select **Advanced Find** (![Screen shot of Advanced Find button.](../admin/media/advanced-find-button.PNG "Screen shot of Advanced Find button")).  
  
2.  For **Look for**, select **Personal Document Templates**.  
  
3.  Select **Results** **(!)**.  
  
4.  Select the personal document template to delete, and then select **Delete** (![Delete button.](../admin/media/nb-ua-r1-trashbin.png "Delete button")).  
  
### Excel template does not upload in Microsoft Edge

If your [!INCLUDE[pn_microsoft_excel](../includes/pn-microsoft-excel.md)] template does not upload when using [!INCLUDE[pn_microsoft_edge](../includes/pn-microsoft-edge.md)] as your browser, update [!INCLUDE[pn_microsoft_edge](../includes/pn-microsoft-edge.md)] and try again.  
  
## Privacy notice

[!INCLUDE[cc_privacy_export_to_excel](../includes/cc-privacy-export-to-excel.md)]
  
### See also

[Download a template for data import](../admin/download-template-data-import.md)   
 [Using Word templates](../admin/using-word-templates-dynamics-365.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
