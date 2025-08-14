---
title: Set up the Business value toolkit
description: Instructions for how to set up the Business value toolkit component of the CoE Starter Kit.
author: stjeffer
ms.component: pa-admin
ms.topic: how-to
ms.date: 08/07/2024
ms.subservice: guidance-toolkit
ms.author: stjeffer
ms.reviewer: sericks
search.audienceType: 
  - admin
ms.custom: sfi-image-nochange
---
# Set up the Business value toolkit

This article helps you set up the Microsoft Power Platform [Business value toolkit](business-value-toolkit.md), a component of the Center of Excellence (CoE) Starter Kit.

The business value toolkit solution contains the following artifacts:

| Type | Name | Description |
|----|-----|----|
| Dataverse table | Average cost | Stores the _average cost of things_ - used to help calculate tangible value of a solution. |
| Dataverse table | Business unit | Stores the hierarchical structure of the organization. |
| Dataverse table | Personal productivity collected data | Stores value data associated with personal productivity use cases. |
| Dataverse table | Proposal assessment collected data | Stores data captured during proposal analysis. |
| Dataverse table | Strategic objective | Stores data used to describe strategic objectives of business units. |
| Dataverse table | Value assessment collected data | Stores data captured during the analysis of an app, including calculated value. |
| Dataverse table | Value assessment story | Stores the raw and enhanced versions of a success story. |
| AI prompt | Assess a proposal | Used to assess a proposal, including ideas for an app or solution, against strategic objectives. |
| AI prompt | Assess an existing app | Used to assess an existing app against strategic objectives.|
| AI prompt | Generate enhanced success story | Used to generate enhanced success stories. |
| AI prompt | Review and refine the story | Used to refine an enhanced story. |
| AI prompt | Proposal comparison | Used to identify similar apps or proposals. |
| AI prompt | Summarize the proposal | Used to summarize the proposal for value. |
| App | Business value admin | Used to define organizational structure, strategic objectives, and average cost of things. |
| App | Business value capture | Used to author success stories, perform value analysis, and calculation. |
| App | Display value cards in SharePoint Online | When added to SharePoint news articles, provides visualization of value. |
| Cloud flow | AI-EnhancedStoryGen | Used to generate an enhanced story. |
| Cloud flow | AI-ValueAssessmentExistingApp | Used to analyze app against strategic objectives. |
| Cloud flow | AI-ValueAssessmentProposal | Used to analyze a proposal, such a an app or solution idea, against strategic objectives. |
| Cloud flow | New-AdminInitiatedAssessment | Launched by an admin to assess a specific app. |
| Cloud flow | New-PersonalProductivityAssessment | Used to iterate through all flows in an environment to assess value. |
| Cloud flow | SPO-CreateSuccessStory | Used to create a success story in SharePoint Online. |
| Cloud flow | AI-ProposalComparison | Used to identify similar apps or proposals. |
| Cloud flow | AI-RunComparisonCheckAgainstProposal | Used to summarize the potential impact of an idea or proposal. |
| Connection references | Microsoft Dataverse, Microsoft Teams, Office 365 users, Power Apps for admins, Power Apps for makers, Power Automate for admins, Power Automate management, SharePoint Online | Used throughout the Business value toolkit. |
| Environment variable | BusinessValueAppUrl | Launch URI for the Business value capture app. |
| Environment variable | CommunityHubUrl | SharePoint Online site collection URL for success stories. |

> [!NOTE]
> The Business value toolkit component doesn't have a dependency on other components of the CoE Starter Kit. It can be used independently.

> [!NOTE]
> The Business value toolkit utilizes generative AI actions in Power Automate. Be sure you consider the global availability of this feature.

## Import the Business value toolkit component solution

Begin by downloading the CoE Starter Kit file to install the Business value toolkit. The solution doesn't mandate the installation or use of the remaining components of the CoE Starter Kit.

1. Download the CoE Starter Kit compressed file at [aka.ms/CoeStarterKitDownload](https://aka.ms/CoeStarterKitDownload).

2. Extract the zip file.

   The CoE Starter Kit compressed file contains all solution and nonsolution components that make up the CoE Starter Kit.

   > [!IMPORTANT]
   > The solution name contains the version number. In the following step, use the **business_value_core_x_x_x_xx_managed** zip solution from the download.

3. Import the solution.

The import can take up to 15 minutes to be completed.

## Import sample data

> [!NOTE]
> Importing the sample task data is optional, but recommended.

If you want to prepopulate the solution with strategic objectives, organizational hierarchy, and the average cost of things, complete the following steps. This can be helpful when you're just getting started with the Business value toolkit, or are testing.

1. Sample data must be installed through the **Configuration Migration Tool** - part of [PAC CLI](/power-platform/developer/cli/introduction?tabs=windows#install-microsoft-power-platform-cli).

1. From the PAC CLI command line, launch the tool by typing **pac tool cmt**.

1. Select **Office 365** for the **Deployment type**.

1. Select **Import data**.

1. Select **Show advanced** and enter your username and password.

1. Select the environment in which you have imported the Business value toolkit.

1. Select **Log in** and enter your username and password, if using a different account to connect.

1. Browse to the zip file that you downloaded, **BV-sample-data.zip**.

1. Select **Import data**.

## Populate data in the Business Value Admin app

The Business Value Admin app serves as the central repository for data related to your organization’s structure, strategic objectives, and average costs. This essential data underpins the toolkit's capabilities in value alignment analysis and value calculation.

The following table provides guidance for populating the Business value Admin app with essential data.

| **Task**                               | **Description**                                                                                          |
|----------------------------------------|----------------------------------------------------------------------------------------------------------|
| Set up business units             | Use the Business Value Admin app and select the **Business units** page. Add the teams, departments, and business units that represent your organization and hierarchy. |
| Add strategic objectives           | Work closely with the various teams and departments to capture the objectives and how they're measuring progress towards them. This is a crucial component of the sample solution. Assign strategic objectives to the relevant team or department. |
| Add the average cost of things            | This data is used to calculate the tangible impact an app is having against a strategic objective. Work with your teams and departments to add this data. This data is assigned to business units. |

### Schema overview of the Business Value Admin App

The schema below outlines the various tables and columns used within the Business Value Admin app, detailing their specific purposes.

| Table             | Column            | Purpose |
|-------------------|-------------------|---------|
| Business unit     | Name              | Identifies the name of the business unit, team, or department. |
| Business unit     | Parent business   | Links a business unit, team, or department to its overarching entity. |
| Strategic objective | Name            | Names the strategic objective such as _Foster a safe and healthy work environment_. |
| Strategic objective | Description     | Provides detailed information about the strategic objective. For example _Contoso prioritizes employee well-being by ensuring a safe and healthy workplace_. |
| Strategic objective | Measures        | Lists metrics that indicate progress towards the strategic objective. For example, _workplace incidents_, _accident severity_, and _training completion rates_. |
| Strategic objective | Business unit   | Associates the strategic objective with a specific business unit. |
| Strategic objective | Owner           | Indicates the user who created the strategic objective record. |
| Strategic objective | Action verb     | Specifies the action type the objective promotes, using a choice column. For example, _Decrease_. |
| Strategic objective | Key result area | Categorizes objectives for analytics purposes, useful for Power BI dashboards. For example, _Employee engagement_. |
| Strategic objective | Quantifiable target | Details the type of measure used employing a choice column. For example, _%_, _$_, _qty_, _time_, _rating_, and _score_). |
| Strategic objective | Time period     | Defines the duration for achieving the objective using a choice column. For example, _Annual_. |
| Strategic objective | Measurable component | Expands on the **Measures** column to describe detailed tracking methods for the objective's progress. For example, _Track the number of workplace incidents_, _frequency and severity of injuries_, and _monitor employee safety training completion_. |
| Strategic objective | Objective target | Sets a specific target for the objective. For example _75%_, when combined with the quantifiable target. |
| Strategic objective | Current measure | Specifies the type of current measure using a choice column. For example, _%_, _$_, _qty_, _time_, _rating_, and _score_. |
| Strategic objective | Current value   | Records the current value, if available. |
| Average cost       | Name            | Names the average cost item. For example, _Average cost of workplace injury_. |
| Average cost       | Average cost    | Specifies the numerical average cost. For example, _$10,000_. |
| Average cost       | Unit            | Defines the unit of measurement. For example _qty_ and _time_). |
| Average cost       | Business unit   | Associates the cost data with a particular business unit. |

> [!NOTE]
>To effectively populate this data, collaborate closely with stakeholders across various business units. Since strategic objectives are often decentralized and embedded within individual units, gathering this information directly from the teams involved is crucial. Engage with these teams to gain a thorough understanding of their strategic goals and the average costs associated with their operations.

## Assess the value of an existing app

The Business value toolkit is designed to systematically capture and articulate the story behind the app, ensuring organizations can consistently produce high-quality success stories. Using generative AI capabilities through the _create text using a prompt_ action in Power Automate, the toolkit enhances the narrative quality of these stories and analyzes for alignment and impact on strategic goals of the organization.

### AI-enhanced success story generation

The toolkit employs specific prompts within Power Automate to enhance and refine the narratives provided by app owners. The following information is an overview of the prompts used in this process.

| Prompt name                  | Description                                                                                                                      | Where used                     |
|------------------------------|----------------------------------------------------------------------------------------------------------------------------------|--------------------------------|
| Generate enhanced success story | This prompt transforms the initial story text into a polished format similar to a business magazine article. It also converts the text into HTML for publication on SharePoint Online, pending approval from the app owner. | Cloud flow: AI-EnhancedStoryGen |
| Review and refine the story    | This prompt further refines the enhanced story, improving readability and flow by processing the AI-generated content through more refinement stages. | Cloud flow: AI-EnhancedStoryGen |

These prompts facilitate the creation of engaging and well-structured success stories that resonate with business audiences, making complex app functionalities accessible and relatable.

#### Story data schema

The following table illustrates the data schema relating to stories and proposals.

| Table                              | Column                     | Purpose                                                                                                                       |
|------------------------------------|----------------------------|-------------------------------------------------------------------------------------------------------------------------------|
| Value assessment stories    | AI assist                   | If story has been enhanced with generative AI. |
| Value assessment stories    | Blog post                  | Currently unused, but can facilitate curated versions of the AI-enhanced story. |
| Value assessment stories    | Enhanced AI story                   | Restructured, enhanced, and HTML-formatted story. |
| Value assessment stories    | Name                   | If row is a story, represents the GUID of the app assessed. If row is a proposal, it's the proposal title. |
| Value assessment stories    | Original story               | JSON-formatted, original text provided by the user for both assessments and proposals. |
| Value assessment stories    | Story type                   | Defines if row is an existing app or proposal. |
| Value assessment stories    | Supplemental content                  | Generated to summarize the app or idea. |
| Value assessment stories    | Story status                  | If story has been approved by the user. |
| Value assessment stories    | Story title                   | Title of story or proposal. |

### Story approval and communication

Before a story is shared within the organization, it must receive user approval. Once approved, the story is created as a news article in SharePoint Online. Initially, as an unpublished page, the article then requires an administrator or a user with appropriate permissions to finalize it by adding images and making any necessary adjustments before publishing.

> [!NOTE]
>To integrate with SharePoint Online, ensure you populate the environment variable: **CommunityHubUrl**. This URL should point to a SharePoint Online site collection provisioned using the communications site template. Success stories are housed within the Pages library. For instance, your SharePoint site URL might resemble: `https://contoso.sharepoint.com/sites/power-platform-coe`. You should also ensure the account that the cloud flow runs with has at least **Member** access in the SharePoint Online site collection.

#### Add value cards to a success story in SharePoint Online

The Business value toolkit provides a canvas app, **Display value card in SharePoint Online**, that can be added to the success story. The following steps explain how to add and configure the canvas app.

Complete the following steps before you edit the page in SharePoint Online.

1. Sign in to [Power Apps](https://make.powerapps.com?utm_source=padocs&utm_medium=linkinadoc&utm_campaign=referralsfromdoc).
1. Select **Solutions** .
1. Select **Business Value** > **Apps**.
1. Select the ellipsis (**...**) next to the canvas app named **Display value cards in SharePoint Online**.
1. Copy the web link.
1. Copy the **Story ID** of the success story that you want to add the canvas app to.
1. Enter 'edit' mode on the story page, by selecting the **Edit** button.
1. Choose the area in the page where you would like to add the canvas app, then select the plus icon (**+**) and select **Microsoft Power Apps (Preview)**.
1. In the **App web link or Id** input, add the following parameter to the web link URL:

    ``` ?&storyId=<paste story Id> ```
   
1. Save the page and republish the page when ready.

### Initiation

The Business value toolkit provides flexible methods for initiating a value assessment and catering to different roles and use cases within the organization. These methods ensure that assessments can be effectively managed and initiated according to specific needs and in the correct context.

- **User initiated - existing app assessment**:
   - Users launch the Business Value Capture app.
   - Users select an application to assess from within the app.

- **Admin initiated - existing app assessment**:
   - Administrators identify an application that requires assessment.
   - Administrators initiate the value assessment process.

- **Admin initiated - personal productivity flows**:
   - Administrators identify an environment to assess personal productivity flows.
   - Administrators initiate the assessment process.

These initiation methods offer tailored approaches for different organizational stakeholders, enhancing the efficiency and relevance of value assessments.

#### User-initiated, value assessment

The following steps outline the user-initiated, value assessment process.

1. The user launches the **Business Value Capture** app.
2. The user selects **Assess an existing app** from the navigation options.
3. From the list of available apps, the user chooses the app they want to assess.
4. The user shares the story behind the app, including:
   - The challenges faced
   - The solution developed
   - Any obstacles encountered
   - The initial value realized
   - Future plans
5. The system utilizes generative AI to enhance and reformat the story. The user can edit and approve the final version.
6. The story is created as an unpublished news article in SharePoint Online, allowing administrators or users with the required permissions to add images and make final edits before publishing.
7. The user reviews and selects the strategic objectives impacted by the solution, identifying the areas of greatest impact.
8. The final phase involves using the value calculator to accurately determine the app's value.

#### Administrator-initiated, value assessment

The following steps apply to the administrator-initiated, value assessment scenario.

1. The administrator identifies an app either through CoE Starter Kit dashboard, Power Platform admin center dashboard, or a custom solution.

   :::image type="content" source="media/admin-dashboard-PPAC.png" alt-text="Screenshot of Power Platform admin center screen.":::

1. The administrator copies the ID of the app and ID of the environment.
1. The administrator runs the cloud flow titled, **New-AdminInitiatedAssessment**, pasting the ID for the app and environment.

   :::image type="content" source="media/bv-admin-initiated-runtime-params.png" alt-text="Screenshot of runtime parameters.":::

1. The flow runs and sends an adaptive card to the flow owner, inviting them to complete an assessment.

   :::image type="content" source="media/Admin-Initiated-Assessment.png" alt-text="The flow runs and sends an adaptive card to the flow owner.":::

1. The user selects the button to start the assessment and launches the **Business value capture** app with context.

> [!NOTE]
>Administrator-initiated assessments are initiated by populating the **New-AdminInitiatedAssessment** cloud flow. This flow requires that the **BusinessValueAppUrl** environment variable is populated with the launch URL of the **Business Value Capture** canvas app.  You can retrieve this URL by selecting the elipsis (**...**) > **Details** and copying the **Web link** URL.

#### Administrator-initiated, personal productivity assessment

The following steps apply to the administrator-initiated, personal productivity assessment.

1. The administrator identifies an environment that they want to assess.
1. The administrator copies the ID of the environment.
1. The administrator runs the cloud flow **New-PersonalProductivityAssessment**, pasting the ID for the environment into the variable **Environment ID**.
1. The flow runs and sends an adaptive card to the owner of each flow in the environment, containing two questions designed to establish value (in time saved) and criticality of flow.

:::image type="content" source="media/personal-productivity-helper.png" alt-text="Screenshot of personal productivity assessment.":::

#### Personal productivity assessment data schema

The data collected from user responses is described in the following table.

| Table                              | Column                     | Purpose                                                                                                                       |
|------------------------------------|----------------------------|-------------------------------------------------------------------------------------------------------------------------------|
| Personal productivity collected data    | Asset type                   | Describes the asset type assessed. Currently, only cloud flows are assessed.                                                          |
| Personal productivity collected data    | Criticality                  | Integer defining criticality of cloud flow to the user, team, department, or organization.                                         |
| Personal productivity collected data    | Duration                | Describes the duration of saving hours or minutes.  |
| Personal productivity collected data    | Value                  | Describes the amount of time saved.                                  |
| Personal productivity collected data    | Name                   | The identifier of the asset assessed.          |

#### Value assessment data schema

The data collected during value assessment is described in the following table.

| Table                              | Column                     | Purpose                                                                                                                       |
|------------------------------------|----------------------------|-------------------------------------------------------------------------------------------------------------------------------|
| Value assessment collected data    | Accepted                   | Indicates whether the analysis has been agreed upon by the user.                                                              |
| Value assessment collected data    | Action category            | Describes the type of strategic objective. For example, _improvement_ or _reduction_).                                                     |
| Value assessment collected data    | Action verb                | Specifies the action associated with the strategic objective.                                                                 |
| Value assessment collected data    | Actual impact measure      | Quantifies the impact of the app on a scale of 1 to 5 during value analysis.                                                   |
| Value assessment collected data    | After implementation value| Reflects the value observed after the implementation of the app.                                                               |
| Value assessment collected data    | Alignment to objective     | Indicates the degree of alignment between the app's impact and the strategic objective, rated on a scale of 1 to 5.           |
| Value assessment collected data    | Average costs              | Represents the average cost utilized in calculating the value impact.                                                          |
| Value assessment collected data    | Impact                     | Illustrates the impact of the app on the strategic objective.                                                                  |
| Value assessment collected data    | Impact type                | Categorizes the impact as tangible or intangible, determined through analysis.                                                |
| Value assessment collected data    | Key value statement        | A concise statement generated during analysis that summarizes the app's impact.                                                |
| Value assessment collected data    | Objective title            | Provides the title of the strategic objective being assessed.                                                                  |
| Value assessment collected data    | Summary                    | Offers a summary of the assessment when used in proposals.                                                                      |
| Value assessment collected data    | Value statement action     | Identifies the type of impact in the value card.                                                                               |
| Value assessment collected data    | Value statement measure    | Specifies the impact the app has on achieving the strategic objective.                                                         |
| Value assessment collected data    | Value statement verb       | Describes the impact the app has on achieving the strategic objective in verb form.                                           |
| Value assessment collected data    | Before implementation value| Represents the value before the app was implemented.                                                                           |
| Value assessment collected data    | Confidence                 | Indicates the level of confidence in the analysis.                                                                             |
| Value assessment collected data    | User acceptance            | Indicates whether the analysis has been agreed upon by the user.                                                                |

These datasets can be used to develop dashboards providing valuable insights into the time saved by personal productivity flows.

## Assess the potential value of an idea or proposal

The toolkit employs specific prompts within Power Automate to assess the potential impact of an idea or proposal, along with conducting checks for similar apps and ideas to reduce duplication of effort.

:::image type="content" source="media/BVTK-ProposalAnalysis.png" alt-text="Screenshot of proposal analysis results.":::

The following table provides an overview of the prompts used in the process.

| Prompt name                  | Description                                                                                                                      | Where used                     |
|------------------------------|----------------------------------------------------------------------------------------------------------------------------------|--------------------------------|
| Assess a proposal | This prompt takes the idea created by the app user and analyzes for alignment and impact against each strategic objective | Cloud flow: AI-ValueAssessmentProposal|
| Proposal comparison | This prompt checks for similarities with other stories and proposal over two scopes: similarity in audience and similarity of features and functionality. | Cloud flow: AI-ProposalComparison |
| Summarize proposal impact | This prompt summarizes the potential impact, providing an overview of the solution, potential business value, and positive impact on stakeholders. | Cloud flow: AI-RunComparisonCheckAgainstProposal |

These prompts facilitate the creation of engaging and well-structured success stories that resonate with business audiences, making complex app functionalities accessible and relatable.

### Proposal or idea assessment data schema

The data collected from an idea or proposal is stored in the **Proposal assessment collected data** Dataverse table. The table stores data relating to the assessment of a proposal or idea. 

Data is stored in the following columns:

| Table                              | Column               | Data type  |Purpose                                                                                                                       |
|------------------------------------|----------------------|-------------------------------------------------------------------------------------------------------------------------------|
| Proposal assessment collected data    | AppStoryName      |  Text        | The title provided for the idea or proposal.     |
| Proposal assessment collected data  | AudienceMatch       |  Text        | Summary data from checking for audiences.    |
| Proposal assessment collected data    | ComparisonScore   |  Integer     | Score provided for confidence in overall comparison.            |
| Proposal assessment collected data    | FeatureMatch      |  Text        | Summary data from checking for similar features.     |
| Proposal assessment collected data    | Name              |  Text (GUID) | ID of the idea or proposal.  |
| Proposal assessment collected data    | StoryId           | Text (GUID)  | ID of the related story.    |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
