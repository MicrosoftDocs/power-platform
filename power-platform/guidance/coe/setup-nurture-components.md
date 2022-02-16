---
title: "How to set up nurture components"
description: "Multiple nurture components are provided in the Center of Excellence (CoE) Starter Kit. Follow these instructions to install the components where you need them."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/10/2022
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

>[!IMPORTANT]
>Complete the instructions in [Before setting up the CoE Starter Kit](setup.md) and [Set up inventory components](setup-core-components.md) before continuing with the setup here. This article assumes you have your [environment set up](setup.md#create-your-environment) and are logged in with the [correct identity](setup.md#what-identity-should-i-install-the-coe-starter-kit-with).

## Import the solution

The core components solution is required for the nurture components solution to work.

1. Import the solution
    1. If [Installing to Production Environment](faq.md#installing-a-solution-in-a-production-environment) – use the solution file from the download called  CenterOfExcellenceNurtureComponents_x_x_x_xx_managed.zip.
    1. If [Installing to Dataverse for Teams Environment](faq.md#installing-a-solution-in-a-dataverse-for-teams-environment) – use the solution file from the download called  CenterOfExcellenceNurtureComponents_x_x_x_xx_managed.zip.
1. Update the environment variable values. Note that if you choose, you can leave the values empty on import and [update them](#all-environment-variables) later after the import is completed.

    | Name | Description |
    |------|---------------|
    | Training in a day - Feedback Form     | The Training in a Day package includes a flow that automatically sends a feedback request to attendees on the day of the event. Configure the form URL (<https://forms.office.com/>...) here.    |
    | Power User Site URL (SharePoint Site) | The site that your Microsoft Power Platform power users can use to communicate and share files. You'll use it here to house the template library for them. |
    | Innovation Backlog URL | (optional) URl to the [Innovation Backlog](use-innovationbacklog.md) canvas app, if you are using this app |
    | Maker Assessment Admin eMail | eMail of the admin or CoE team that will respond to queries from the Maker Assessment app. |
    | Community URL | Link to your internal Microsoft Power Platform community (for example, Yammer or Teams) |

## Set up training in a day components

### Set up a feedback form for your Training in a day

1. Open this [template form](https://forms.office.com/Pages/ShareFormPage.aspx?id=v4j5cvGGr0GRqy180BHbR8FBqAfISVJDqMM6DZbPmghUMUxUS1EwSVkxRExKVzdET1lZTTdWQ0FaOS4u&sharetoken=xjgXNluBcJOrLb2xg0TI).
1. Select **Duplicate it**.
1. Edit the form to add your own questions.
1. Select **Share**, and copy the link for **Send and collect responses**.

    ![Copy the feedback form URL to send and collect responses.](media/nurture-feedback.png "Copy the feedback form URL to send and collect responses")

1. When importing the solution, update thee *Training in a day - Feedback Form* with this value.

### Turn on flows

There are several flows which will need to be turned on for the training in a day components to work:

- Training in a day \| Feedback Reminder
- Training in a day \| Registration Confirmation
- Training in a day \| Reminder 3 days prior to event
- Training in a day \| Create New Outlook Meeting
- Training in a day \| Sync Outlook Event (Update & Delete)

### Share apps with admins and makers

The training in a day components consist of two apps:

- [**Power Platform Training Management**](nurture-components.md#training-in-a-day--management) app for training organizers to view and manage events and registrations. Share this app with other admins or training organizers, and assign them the Power Platform Admin SR security role.
- [**Power Platform Training Registration**](nurture-components.md#training-in-a-day--registration) app for attendees to register to training events. Share this app with your makers, and assign them the Power Platform Maker SR security role.

More information:

- [Share a canvas app in Power Apps](faq.md#share-an-app-from-a-production-environment)
- [Share a canvas app in Microsoft Teams](faq.md#share-an-app-from-a-dataverse-for-teams-environment)

## Set up maker assessment components

### Import starter data set for the Maker Assessment app

Import an initial set of assessment questions to get started using the [Maker Assessment](nurture-components.md#maker-assessment) app. You can add your own questions or customize the existing ones using the admin app for this solution.

Run the **Add Maker Assessment Starter Data** once to add starter data for the Maker Assessment apps: categories, questions, and answers.

### Share apps with admins and makers

The maker assessment components consist of two apps:

- [**Maker Assessment Admin app**](nurture-components.md#maker-assessment-admin-app) app for admins to manage assessment questions. Share this app with other admins or training organizers, and assign them the Power Platform Admin SR security role.
- [**Maker Assessment**](nurture-components.md#maker-assessment) app for makers to complete assessments. Share this app with your makers, and assign them the Power Platform Maker SR security role.

More information:

- [Share a canvas app in Power Apps](faq.md#share-an-app-from-a-production-environment)
- [Share a canvas app in Microsoft Teams](faq.md#share-an-app-from-a-dataverse-for-teams-environment)

## Set up Pulse feedback survey

### Update environment variables values

[Update environment variables](faq.md#update-environment-variables) used by the environment request management components as described in the following table.

| Name | Description |
|------|---------------|
| Pulse - How many makers to survey? | The Pulse survey is send to makers to provide feedback on their experience working with the CoE and Power Platform. Provide the number of makers you want to survey regularly here. If you set this number to 5, the survey will be sent to 5 random makers per week. A Default value of 1 is provided. |

### Turn on flows to start collecting feedback

There are several flows which will need to be turned on for the Pulse feedback survey components to work:

- Pulse [Child] - ost adaptive cards to maker
- PUlse - Survey Makers for CoE feedback

### Set up the Power BI dashboard to view feedback

1. Download and install [Microsoft Power BI Desktop](https://www.microsoft.com/download/details.aspx?id=58494).
1. Enable the [TDS endpoint](/admin/settings-features) on your environment.
1. Get the [environment URL](setup-powerbi.md#get-the-environment-url).
1. In Power BI Desktop, open the Pulse_CoEDashboard.pbit file, which can be found in the CoE Starter Kit you downloaded from [aka.ms/CoeStarterKitDownload](https://aka.ms/CoEStarterKitDownload).
1. Enter the URL of your environment instance. Do not include the https:// prefix or / postfix for **OrgUrl**.
1. Save the dashboard locally, or select **Publish** and choose the workspace you want to publish the report to.
1. [Configure scheduled refresh](/power-bi/connect-data/refresh-data#configure-scheduled-refresh) for your Power BI Dataset to update the report daily.

You can find the report later by going to [app.powerbi.com](https://app.powerbi.com/).

## Set up template catalog

## Add your own templates to the Template Catalog

If you have existing templates that you'd like to share with your makers (for example, template apps, brand guidelines, or app and flow samples), add them to the CoE Templates table so they show up in the template catalog.

1. Go to [make.powerapps.com](https://make.powerapps.com) and select your CoE environment
1. On the left pane, select **Solutions**.
1. Select the **Center of Excellence - Nurture components** solution.
1. Open the **CoE Templates** table.
1. Select **Data**.
1. Select **+ Add Record** to add your template description and file.

### Share apps with admins and makers

The template catalog components consist of one apps:

- [**Template Catalog**](nurture-components.md#template-catalog) app for makers and end users to browse available templates. Share this app with end users, and assign them the Power Platform User SR security role.

More information:

- [Share a canvas app in Power Apps](faq.md#share-an-app-from-a-production-environment)
- [Share a canvas app in Microsoft Teams](faq.md#share-an-app-from-a-dataverse-for-teams-environment)

## Set up product newsletter

Turn on the **Admin \| Newsletter with Product Updates** flow to receive a weekly email with updates from the Power Apps, Power Automate, Power BI and Power Virtual Agents blog posts. This email is sent to the admin only.

## All environment variables

Here is the full list of environment variables that impact the nurture solution, including environment variables with Default values. You may have to [update environment variables](faq.md#update-environment-variables) after import.

>[!IMPORTANT]
> You don't have to change the values during setup, just when you need to change the value of an environment variable that you configured during import or when you want to change a default value. Re-start all flows after you change environment variables, to make sure the latest value is picked up.

Environment variables are used to store application and flow configuration data with data specific to your organization or environment.

| Name | Description |
|------|---------------|
| Training in a day - Feedback Form     | The Training in a Day package includes a flow that automatically sends a feedback request to attendees on the day of the event. Configure the form URL (<https://forms.office.com/> or https://forms.osi.apps.mil/ for a DoD tenant) here.    |
| Power User Site URL (SharePoint Site) | The site that your Microsoft Power Platform power users can use to communicate and share files. You'll use it here to house the template library for them. |
| Innovation Backlog URL | (optional) URl to the [Innovation Backlog](use-innovationbacklog.md) canvas app, if you are using this app |
| Maker Assessment Admin eMail | eMail of the admin or CoE team that will respond to queries from the Maker Assessment app |
| Community URL | Link to your internal Microsoft Power Platform community (for example, Yammer or Teams) |
| Pulse - How many makers to survey? | The Pulse survey is send to makers to provide feedback on their experience working with the CoE and Power Platform. Provide the number of makers you want to survey regularly here. If you set this number to 5, the survey will be sent to 5 random makers per week. A Default value of 1 is provided. |

## It looks like I found a bug with the CoE Starter Kit; where should I go?

To file a bug against the solution, go to [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]

<!--## Import starter data set for the Maker Assessment app

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

1. Select **Publish now** to create the Dataflow.

1. Wait while the Dataflow refresh is in progress.

   ![Wait while the Dataflow refresh is in progress.](media/MakerJourneyDataSetup9.png "Wait while the Dataflow refresh is in progress")

>[!TIP]
>If you see connection error, please select **Refresh** as the connection may not have resolved in time for the initial load:
   ![Error.](media/MakerJourneyDataSetup10.png "Error")-->