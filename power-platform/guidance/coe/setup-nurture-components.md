---
title: Set up nurture component
description: Follow these instructions to install the nurture components provided in the Center of Excellence (CoE) Starter Kit.
author: manuelap-msft
ms.component: pa-admin
ms.topic: how-to
ms.date: 08/21/2025
ms.subservice: guidance-toolkit
ms.author: mapichle
ms.reviewer: jhaskett-msft
search.audienceType: 
  - admin
---

# Set up nurture components

Multiple nurture components are provided in the Center of Excellence (CoE) Starter Kit and require configuration to install. The installation instructions in this article are segmented based on the set of components that should be grouped and installed together. Dependencies on other segments are outlined in each section.

## Prerequisites

1. Complete the instructions in [Before setting up the CoE Starter Kit](setup.md) and [Set up inventory components](setup-core-components.md).
1. [Set up your environment](setup.md#create-your-environments).
1. Sign in with the [correct identity](setup.md#which-identity-should-i-use-to-install-the-coe-starter-kit).

## Import the solution

The core components solution is required for the nurture components solution to work.

1. Import the `CenterOfExcellenceNurtureComponents_x_x_x_xx_managed.zip` file solution from the download to [install the solution](faq.md#install-a-solution-in-a-production-environment).
1. Leave all environment variables blank on import.

## Set up **Video hub** components

### Set up the **Video hub** components using the Setup Wizard

1. Open the **Center of Excellence - Core Components** solution.
1. Open the **CoE Setup and Upgrade Wizard** app.
1. Open the **More features** page and select **Video hub**.

   This **Video hub** app guides you step-by-step through the configuration steps.

   :::image type="content" source="media/setupwizard-video.png" alt-text="Screesnhot that shows the CoE Starter Kit Setup Wizard - Video hub app." lightbox="media/setupwizard-video.png":::

> [!NOTE]
> The Setup Wizard is currently in preview. If you experience issues with the Setup Wizard, [raise them on GitHub](https://aka.ms/coe-starter-kit-issues) and set up the inventory components manually.

### Set up the **Video hub** components manually

#### Review and enable **Video hub** canvas app features

The canvas app has two features you can enable:

1. Comments
2. Related video

You can enable either or both by updating environment variables in the CoE Admin Command Center app:

1. **Video Hub** - Enable Comments
1. **Video Hub** - Related Videos

Follow the [instructions for setting environment variables](/power-platform/guidance/coe/faq#update-environment-variables).

##### Enable Comments

When enabled, **Video hub** users can comment on selected videos. Comment moderation is managed through the admin app. Comments must be approved before being visible in the **Video hub**.

:::image type="content" source="media/approve-or-reject-comment.png" alt-text="Screenshot that shows where you can approve or reject a single comment in the **Video hub** app." lightbox="media/approve-or-reject-comment.png":::

##### Related video

When enabled, **Video hub** users see a list of similar videos to the one that they selected. The *content category* value of content filters similar videos.  

:::image type="content" source="media/Video-hub-RelatedVideoEnabled.png" alt-text="Screenshot that shows the similar or related video content." lightbox="media/Video-hub-RelatedVideoEnabled.png":::

#### Share **Video hub** apps with admins and makers

The **Video hub** components are two apps:

- [**Nurture apps - admin**](nurture-components.md#video-hub---admin)
  
  An app to manage content, playlists, and comments. Share this app with other admins and assign them to the Power Platform SR security role.
- [**Video hub**](nurture-components.md#video-hub)

  A canvas app for video content. Share this app with your makers and assign them to the Power Platform SR security role.

For more information, see [Share a canvas app in Power Apps](faq.md#share-an-app-from-a-production-environment).

### Import starter data (optional)

If you want to prepopulate the **Video hub** with videos from the [Microsoft Power Platform YouTube channel](https://www.youtube.com/@mspowerplatform), you can import data from the **Video hub** starter workbook.

1. Open the **Nurture - Admin app** and navigate to the **Content** page.
1. From the command bar, select **Import from Excel**.
1. Select **Choose File**.
1. Go to the location where you saved the **microsoft-video-hub-starter-data.xlsx** file, and then select **Open**.
1. Select **Next**.
1. Select **Finish**.

An import job is created. You can track its progress by selecting **Track Progress**.

### Manage content in admin Nurture apps

#### Video content

The video content schema:

|Column|Column type|Description|
|------|-----|------|
| Name | Text | The title of the video, for example 'Building responsive Power Apps'|
| Owner | User | The creator of the record |
| Content description | Text | Detailed description of the video |
| Content URL | Text (URL) | The URL to the video |
| View count | Number | The count is updated, via the **Video hub** canvas app, when a user watches a video. |
| Power Platform product | Choice | Categorizes the video based on Power Platform product |
| Content category | Choice | Select the type of video; for example: How-to, Success story, Community session |

#### Playlists

Playlists are curated lists of video content managed by administrators.

The playlists schema:

|Column|Column type|Description|
|------|-----|------|
| Name | Text | Represents the display name for the playlist |
| Owner | User | The creator of the record |
| Playlist description | Text | Represents a detailed description of the playlist |
| Playlist type | Choice | Represents the playlist type. Options available are personal or shared. Shared playlists are visible to all users. Private playlists are only visible to the author.<br>**Note**: Private playlists are coming in a future release. |

Playlists are a curated collection of videos. One playlist has many playlist items.

The playlist item schema:

|Column|Column type|Description|
|------|-----|------|
| Name | Text | The name can be set to any value. The name isn't used in the **Video hub** canvas app. |
| Playlist | Lookup | This lookup column returns a list of playlists. |
| Community hub content | Lookup| This lookup column returns a list of video content. |

#### Comments

Users of the **Video hub** canvas app create comments. Comments are moderated and only visible when an administrator sets the **Comment status** column value to **Approved**.

The comments schema:

|Column|Column type|Description|
|------|-----|------|
| Name | Text | Unused in the admin app. The name column is populated when comments are created via the **Video hub** canvas app. |
| Comment text | Text | The users comment text|
| Comment status | Choice | Approved or rejected. Only approved comments appear in the **Video hub** canvas app. |
| Community hub content | Lookup | The video related to the comment |

## Set up **Training in a day** components

### **Training in a day** - Setup Wizard

1. Open the **Center of Excellence - Core Components** solution.
1. Open the **CoE Setup and Upgrade Wizard** app.
1. Open the **More features** page and select **Training in a day**.

   This app provides a guided step by step experience through the configuration steps.
   :::image type="content" source="media/setupwizard-training.png" alt-text="CoE Starter Kit Setup Wizard - Training in a day" lightbox="media/setupwizard-training.png":::

> [!NOTE]
> The Setup Wizard is currently in preview. If you experience issues with the Setup Wizard, [raise them on GitHub](https://aka.ms/coe-starter-kit-issues) and set up the Inventory components manually.

### **Training in a day** - set up manually

#### Update **training in a day** environment variables

[Update environment variables](faq.md#update-environment-variables) used by the environment request management components as described in the following table.

| Name | Description |
|------|---------------|
| **Training in a day** - Feedback Form | The **Training in a day** package includes a flow that automatically sends a feedback request to attendees on the day of the event. Configure the form through [Microsoft Forms](https://forms.office.com/) or the [Forms](https://forms.osi.apps.mil/) app for a DoD tenant. |
| Community URL | Link to your internal Microsoft Power Platform community, for example Yammer or Teams. |

#### Set up a feedback form for your **Training in a day**

1. Open this [template form](https://forms.office.com/Pages/ShareFormPage.aspx?id=v4j5cvGGr0GRqy180BHbR8FBqAfISVJDqMM6DZbPmghUMUxUS1EwSVkxRExKVzdET1lZTTdWQ0FaOS4u&sharetoken=xjgXNluBcJOrLb2xg0TI).
1. Select **Duplicate it**.
1. Edit the form to add your own questions.
1. Select **Share**, and copy the link for **Send and collect responses**.
   :::image type="content" source="media/nurture-feedback.png" alt-text="Screensohot that shows location of the URL you can copy from the Share and collect reponses pane. The pane is opened from the Share button of Microsoft Forms." lightbox="media/nurture-feedback.png":::

1. When importing the solution, update thee *Training in a day - Feedback Form* with this value.

#### Turn on flows

There are several flows that need to be turned on for the **Training in a day** components to work:

- **Training in a day**: Feedback Reminder
- **Training in a day**: Registration Confirmation
- **Training in a day**: Reminder 3 days before an event

#### Share **Training in a day** apps with admins and makers

The **Training in a day** components consist of two apps:

- [**Nurture apps - Admin**](nurture-components.md#nurture-apps---admin) app for training organizers to view and manage events and registrations. Share this app with other admins or training organizers and assign them the Power Platform Admin SR security role.
- [**Nurture apps - Maker**](nurture-components.md#training-in-a-day-pages-in-nurture-apps---maker-app) app for attendees to register to training events. Share this app with your makers and assign them the Power Platform Maker SR security role.

For more information, see [Share a canvas app in Power Apps](faq.md#share-an-app-from-a-production-environment).

## Set up maker assessment components

### Maker assessment - Setup Wizard

1. Open the **Center of Excellence - Core Components** solution.
1. Open the **CoE Setup and Upgrade Wizard** app.
1. Open the **More features** page and select **Maker Assessment**.

   This app provides a guided step by step experience through the configuration steps.
   :::image type="content" source="media/setupwizard-assessment.png" alt-text="Screenshot that shows the CoE Starter Kit Setup Wizard - Solution Assessment." lightbox="media/setupwizard-assessment.png":::

>[!NOTE]
> The Setup Wizard is currently in preview. If you experience issues with the Setup Wizard, [raise them on GitHub](https://aka.ms/coe-starter-kit-issues) and set up the Inventory components manually.

### Maker assessment - set up manually

[Update environment variables](faq.md#update-environment-variables) used by the environment request management components as described in the following table.

| Name | Description |
|------|---------------|
| Maker Assessment Admin eMail | The eMail of the admin or CoE team responds to queries from the Maker Assessment app. |

#### Import starter data set for the Maker Assessment app

Import an initial set of assessment questions to get started using the [Maker Assessment](nurture-components.md#solution-assessment-page-in-nurture-apps---maker-apps) app. You can add your own questions or customize the existing ones using the admin app for this solution.

#### Turn on flow

Turn on the flow:

1. Add Maker Assessment Starter Data

1. Run the **Add Maker Assessment Starter Data** flow once to add starter data for the Maker Assessment apps: categories, questions, and answers.

#### Share maker assessment apps with admins and makers

The maker assessment components consist of two apps:

- [**Nurture apps - Admin**](nurture-components.md#nurture-apps---admin) app for admins to manage assessment questions. Share this app with other admins or training organizers, and assign them the Power Platform Admin SR security role.
- [**Nurture apps - Maker**](nurture-components.md#solution-assessment-page-in-nurture-apps---maker-apps) app for makers to complete assessments. Share this app with your makers, and assign them the Power Platform Maker SR security role.

More information:

- [Share a canvas app in Power Apps](faq.md#share-an-app-from-a-production-environment)

## Set up Pulse feedback survey

>[!NOTE]
>The flows supporting this processes post adaptive cards to users using the [Microsoft Teams](/connectors/teams/) connector. The ability to post adaptive cards in Teams is not available in GCC, GCC High and DoD. These flows should remain turned off in these regions as they will not work.

### Pulse feedback - Setup Wizard

1. Open the **Center of Excellence - Core Components** solution.
1. Open the **CoE Setup and Upgrade Wizard** app.
1. Open the **More features** page and select **Pulse feedback**.
1. This app provides a guided step by step experience through the configuration steps.
 :::image type="content" source="media/setupwizard-pulse.png" alt-text="CoE Starter Kit Setup Wizard - Pulse Feedback" lightbox="media/setupwizard-pulse.png":::

>[!NOTE]
> The Setup Wizard is currently in preview. If you experience issues with the Setup Wizard, please [raise them on GitHub](https://aka.ms/coe-starter-kit-issues) and proceed with setting up the Inventory components manually.

### Pulse feedback survey - set up manually

[Update environment variables](faq.md#update-environment-variables) used by the environment request management components as described in the following table.

| Name | Description |
|------|---------------|
| Pulse - How many makers to survey? | The Pulse survey is sent to makers to provide feedback on their experience working with the CoE and Power Platform. Provide the number of makers you want to survey regularly here. If you set this number to `5`, the survey is sent to `5` random makers per week. A default value of `1` is provided. |

#### Turn on flows to start collecting feedback

There are several flows that need to be turned on for the Pulse feedback survey components to work:

- Pulse [Child] - post adaptive cards to maker
- Pulse - Survey Makers for CoE feedback

#### Set up the Power BI dashboard to view feedback

1. Download and install [Microsoft Power BI Desktop](https://www.microsoft.com/download/details.aspx?id=58494).
1. Enable the [TDS endpoint](/power-platform//admin/settings-features) on your environment.
1. Get the [environment URL](setup-powerbi.md#get-the-environment-url).
1. In Power BI Desktop, open the Pulse_CoEDashboard.pbit file, which can be found in the CoE Starter Kit you downloaded from [aka.ms/CoeStarterKitDownload](https://aka.ms/CoEStarterKitDownload).
1. Enter the URL of your environment instance. Don't include the `https://` prefix or `/` postfix for **OrgUrl**.
1. Save the dashboard locally, or select **Publish** and choose the workspace you want to publish the report to.
1. [Configure scheduled refresh](/power-bi/connect-data/refresh-data#configure-scheduled-refresh) for your Power BI Dataset to update the report daily.

You can find the report later by going to [app.powerbi.com](https://app.powerbi.com/).

## Set up template catalog components

### Template catalog - Setup Wizard

1. Open the **Center of Excellence - Core Components** solution.
1. Open the **CoE Setup and Upgrade Wizard** app.
1. Open the **More features** page and select **Template Catalog**.
1. This app provides a guided step by step experience through the configuration steps.
 :::image type="content" source="media/setupwizard-template.png" alt-text="CoE Starter Kit Setup Wizard - Template Catalog" lightbox="media/setupwizard-template.png":::

>[!NOTE]
> The Setup Wizard is currently in preview. If you experience issues with the Setup Wizard, please [raise them on GitHub](https://aka.ms/coe-starter-kit-issues) and proceed with setting up the Inventory components manually.

### Template catalog - set up manually

If you have existing templates, such as template apps, brand guidelines, or app and flow samples, you can add them to the CoE Templates table. The templates appear in the template catalog once added.

1. Go to [make.powerapps.com](https://make.powerapps.com) and select your CoE environment
1. On the left pane, select **Solutions**.
1. Select the **Center of Excellence - Nurture components** solution.
1. Open the **CoE Templates** table.
1. Select **Data**.
1. Select **+ Add Record** to add your template description and file.

#### Share the template catalog apps with admins and makers

The template catalog components have one app:

- [**Nurture apps - Maker**](nurture-components.md#template-catalog-page-in-nurture-apps---maker-app) app for makers and end users to browse available templates. Share this app with end users, and assign them the Power Platform User SR security role.

For more information, see [Share a canvas app in Power Apps](faq.md#share-an-app-from-a-production-environment).

## Set up product newsletter

Turn on the **Admin \| Newsletter with Product Updates** flow to receive a weekly email with updates from the Power Apps, Power Automate, Power BI and Microsoft Copilot Studio blog posts. This email is sent to the admin only.

## All environment variables

This list of environment variables impact the nurture solution, including environment variables with default values. You might have to [update environment variables](faq.md#update-environment-variables) after import.

> [!IMPORTANT]
> You don't have to change the environment variables in setup. However, you can change the environment variable you configured during import or when you want to change a default value. Restart all flows after you change environment variables to see the latest values.

Environment variables are used to store application and flow configuration data with data specific to your organization or environment.

| Name | Description | Default Value |
|------|-------------|---------------|
| **Training in a day** - Feedback Form | The **Training in a day** package includes a flow that automatically sends a feedback request to attendees on the day of the event. Configure the form through [Microsoft Forms](https://forms.office.com/) or the [Forms](https://forms.osi.apps.mil/) app for a DoD tenant.  | n/a |
| Power User Site URL (SharePoint Site) | The site that your Microsoft Power Platform power users can use to communicate and share files. You use it here to house the template library for them. *Currently not used.* |  n/a |
| Innovation Backlog URL | (optional) URL to the [Innovation Backlog](use-innovationbacklog.md) canvas app, if you're using this app. | n/a |
| Maker Assessment Admin eMail | The eMail of the admin or CoE team that responds to queries from the Maker Assessment app. | n/a |
| Community URL | Link to your internal Microsoft Power Platform community, for example Yammer or Teams | n/a |
| Pulse - How many makers to survey? | The Pulse survey is sent to makers to provide feedback on their experience working with the CoE and Power Platform. Provide the number of makers you want to survey regularly here. If you set this number to `5`, the survey is sent to `5` random makers per week. | 1 |
| **Video hub** - Enable comments | Enable or disable end users to leave comments on videos published via the **Video hub**. Disabled by default. | No |
| **Video hub** - Related Videos | Enable or disable showing related videos in the **Video hub**. Enabled by default. | Yes |

[!INCLUDE[file-an-issue](../../includes/file-issue.md)]
