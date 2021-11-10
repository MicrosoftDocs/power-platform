---
title: "How to set up nurture components"
description: "Multiple nurture components are provided in the Center of Excellence (CoE) Starter Kit. Follow these instructions to install the components where you need them."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/06/2021
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Set up nurture components

Multiple nurture components are provided in the Center of Excellence (CoE) Starter Kit; each will require some configuration to install. The installation instructions in this article have been segmented based on the set of components that should be grouped and installed together, and dependencies on other segments are outlined in each section.

The Nurture Components can be used in both Production environments and Dataverse for Teams environments. Where you install it will depend on your organization setup, your adoption of Microsoft Power Platform so far and what you want to achieve with the CoE Starter Kit. Before you decide, compare [Dataverse vs Dataverse for Teams](/powerapps/teams/data-platform-compare)

Learn more: [What is Dataverse for Teams](/powerapps/teams/overview-data-platform)

## Prepare content for consumption by solution objects

### Create a SharePoint document library

This library is used to store templates, components, and documents that you want to share with makers in your organization. In this section, you'll create and populate the library by using a set of starter materials.

The Template Catalog app depends on this library. If you don't intend to use the template catalog, you can skip this step and go straight to [Update environment variables](#update-environment-variables).

### Create the site

If you don't already have a SharePoint site for the Microsoft Power Platform power users in your tenant, create a new team now for them to access. This site is the one you will specify in the following environment variable once the solution is installed: *Power User Site URL (SharePoint Site)*. More information: [Create a team site in SharePoint](https://support.office.com/article/create-a-team-site-in-sharepoint-ef10c1e7-15f3-42a3-98aa-b5972711777d)

### Create the library

1. Create a new document library named AppTemplates
1. Add the following columns in the default view:

   | Column name | Type |
   |----|----|
   |Title | Single line of text |
   |DisplayName | Single line of text |
   |ItemDescription | Multiple lines of text |
   |Featured | Yes/No |
   |TemplateType | Choice (the options are **App**, **Flow**, **Component**, **Image**, or **Document**)|

   Ensure that you've set up the correct permissions for your SharePoint site; we recommend that you give view-only access to your power users. More information: [Create a document library in SharePoint](https://support.office.com/article/create-a-document-library-in-sharepoint-306728fe-0325-4b28-b60d-f902e1d75939)

   > [!NOTE]
   > You can't complete setup for the [Template Catalog](nurture-components.md#template-catalog) app, which uses this environment, until you extend the app. More information: [Modify components](modify-components.md#set-up-the-template-catalog-and-upload-components)

<!--- Commenting this out until version 3.20041.19 is live so that these msapp files will work in production
### Load sample templates
We've created a starter set of templates for you. To access them, do the following:

1. Download the CoE Starter Components zip file from the [GitHub repository](https://github.com/microsoft/powerapps-tools/tree/master/Administration/CoEStarterKit) and extract: CoE Components.zip
2. Browse to the newly created document library.
![BrowseToLib.](media\sp-upload-1.png)
3. Choose to upload files.
![BrowseToLib.](media\sp-upload-2.png)
4. Select all files in the library downloaded in the preceding step.
![BrowseToLib.](media\sp-upload-3.png)
5. In the document library, select **Quick edit**.
![BrowseToLib.](media\sp-upload-4.png)
6. Select the first row under **DisplayName**, and paste the data from the following into the table.

    | DisplayName | ItemDescription |Featured|TemplateType|
    |------------------|---------|--------|--------|
    |Calendar Control|A control for your users to get date values from a calendar for use in their Power Apps canvas apps  | Yes |Component|
    |Components Demo App|App showing the starter components from the CoE Starter Kit  | Yes |App|
    |Dual Range Slider|A control for your users to get numeric values from a slider control that lets them pick two numbers, for use in their Power Apps canvas apps | Yes |Component|
    |Header Nav Control|A control for your users to easily have a nice header with navigation control for their Power Apps canvas apps | Yes |Component|
    |Admin White Paper|An example document, to show how they'll appear in the Template Library. This document is also useful to you as an admin. | No |Document|

7. You now have a starter set of components for your power user usage.
![BrowseToLib.](media\sp-upload-5.png)
-->

### Add your own templates

If you have existing templates that you'd like to share with your makers (for example, template apps, brand guidelines, or app and flow samples), upload them to the AppTemplates document library so they show up in the template catalog.

### Set up a feedback form for your Training in a day

1. Go to [forms.office.com](https://forms.office.com).
1. Select **New Form**.
1. Enter **Microsoft Power Platform Training Feedback** for the title.
1. Select **+ Add New** to add the following questions:
    1. Rating: **Please rate the training course**
    1. Text: **What went well?**
    1. Text: **What didn't go well?**
1. Select **Share**, and copy the link for **Send and collect responses**.

    ![Copy the feedback form URL to send and collect responses.](media/nurture-feedback.png "Copy the feedback form URL to send and collect responses")

1. Save the link to the form for the *Training in a day - Feedback Form* environment variable, which will be available once the solution is installed.

## Import the solution

The core components solution is required for the nurture components solution, or any other component in the starter kit, to work.

1. Follow the instructions in [Set up core components](setup-core-components.md) to import the solution either into your Production or your Dataverse for Teams environment.

1. Import the CenterOfExcellenceNurtureComponents_*x_x_x_xx*_managed.zip file.
1. Create a new connection to the **RSS** connector, and set your Microsoft Dataverse connection.
    ![Import the CoE nurture components solution.](media/msi-nurture.png "Import the CoE nurture components solution")
1. Update the environment variable values. Note that if you choose, you can leave the values empty on import and [update them](#update-environment-variables) later after the import is completed.

    | Name | Description |
    |------|---------------|
    | Training in a day - Feedback Form     | The Training in a Day package includes a flow that automatically sends a feedback request to attendees on the day of the event. Configure the form URL (<https://forms.office.com/>...) here.    |
    | Power User Site URL (SharePoint Site) | The site that your Microsoft Power Platform power users can use to communicate and share files. You'll use it here to house the template library for them. |
    | Innovation Backlog URL | (optional) URl to the [Innovation Backlog](use-innovationbacklog.md) canvas app, if you are using this app |
    | Maker Assessment Admin eMail | eMail of the admin or CoE team that will respond to queries from the Maker Assessment app. |
    | Community URL | Link to your internal Microsoft Power Platform community (for example, Yammer or Teams) |

## Import starter data set for the Maker Assessment app

Import an initial set of assessment questions to get started using the [Maker Assessment](nurture-components.md#maker-assessment) app. You can add your own questions or customize the existing ones using the admin app for this solution.

### Upload starter data to SharePoint Online

The initial set of assessment questions is provided in an Excel spreadsheet.

1. Upload the **MakerAssessmentStarterData.xlsx** file to the Documents library of a SharePoint site in your tenant. You will find this file in the initial download of the CoEStarterKit.zip. 

1. Note down the document library URL in this format, including the prefix and the trailing slash: [https://mytenant.sharepoint.com/sites/TargetSite/Shared%20Documents/](https://mytenant.sharepoint.com/sites/TargetSite/Shared%20Documents/)

This file is only needed once for import, and can be deleted after the dataflow runs.

### Update and run the Dataflow to load initial data into Dataverse

Now load the initial data from SharePoint Online into Dataverse using a Dataflow:

1. In your CoE environment, browse to **Data > Dataflows**, and edit the **Maker Assessment Starter Dataflow**
   ![Edit the Dataflow.](media/MakerJourneyDataSetup1.png "Edit the Dataflow")

1. Select **SPFolder** under Queries. Enter the document library you have uploaded the file to, including prefix and trailing slash.
   ![Update the parameter with your SharePoint document library.](media/MakerJourneyDataSetup2.png "Update the parameter with your SharePoint document library")

1. Select **assessmentCategoriesTable** under Queries and select **Configure connection**
   ![Configure the connection for the dataflow.](media/MakerJourneyDataSetup3.png "Configure the connection for the dataflow")

1. Choose an existing connection or create a new one and select **Connect**

   ![Choose connection for the dataflow to connect to SharePoint.](media/MakerJourneyDataSetup5.png "Choose connection for the dataflow to connect to SharePoint")

1. Data should now be loaded into the editor. If you see a connection error instead, make sure the **SPFolder** parameter is correct. Select **Next**.

   ![Initial data will be loaded into the table view.](media/MakerJourneyDataSetup6.png "Initial data will be loaded into the table view")

1. Select **Next** without changing any default setting.

   ![Select Next without changing any default settings.](media/MakerJourneyDataSetup7.png "Select Next without changing any default settings")

1. Select **Create** to create the Dataflow.

   ![Create the dataflow.](media/MakerJourneyDataSetup8.png "Create the dataflow")

1. Wait while the Dataflow refresh is in progress.

   ![Wait while the Dataflow refresh is in progress.](media/MakerJourneyDataSetup9.png "Wait while the Dataflow refresh is in progress")

>[!TIP]
>If you see connection error, please select **Refresh** as the connection may not have resolved in time for the initial load:
   ![Error.](media/MakerJourneyDataSetup10.png "Error")

## Update environment variables

Environment variables are used to store application and flow configuration data. This means that you only have to set the value once per environment and it will be used in all necessary flows and apps in that environment.

All flows in this solution depend on all environment variables' being configured.

>[!TIP]
>Learn how to update environment variables for Production and Dataverse for Teams environments: [Update Environment Variables](setup-core-components.md#update-environment-variables).

1. Select **See Environment Variables** to set the current values as described in the following table.

| Name | Description |
|------|---------------|
| Training in a day - Feedback Form     | The Training in a Day package includes a flow that automatically sends a feedback request to attendees on the day of the event. Configure the form URL (<https://forms.office.com/> or https://forms.osi.apps.mil/ for a DoD tenant) here.    |
| Power User Site URL (SharePoint Site) | The site that your Microsoft Power Platform power users can use to communicate and share files. You'll use it here to house the template library for them. |
| Innovation Backlog URL | (optional) URl to the [Innovation Backlog](use-innovationbacklog.md) canvas app, if you are using this app |
| Maker Assessment Admin eMail | eMail of the admin or CoE team that will respond to queries from the Maker Assessment app |
| Community URL | Link to your internal Microsoft Power Platform community (for example, Yammer or Teams) |

## Activate the flows

The nurture components solution contains five flows:

- Admin \| Newsletter with Product Updates

- Training in a day \| Feedback Reminder

- Training in a day \| Registration Confirmation

- Training in a day \| Reminder 3 days prior to event

Follow the same instructions to configure the flows as explained in [Activate the sync template flows](setup-core-components.md#activate-the-flows).

## Share apps with your organization

The nurture components solution contains four apps. As soon as you're ready to adopt the CoE, share these apps as follows:

- Maker Assessment: Share with your makers or your entire organization.

- Template Catalog: Share with your makers or your entire organization.

- Power Platform Training Management: Share with admins only.

- Power Platform Training Registration: Share with your entire organization.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
