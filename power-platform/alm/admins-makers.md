---
title: "ALM for admins and makers"
description: "Learn what ALM tools and services are available to admins when creating and publishing solutions."
author: mcaburk
ms.subservice: alm
ms.author: matp
ms.custom: ""
ms.date: 11/02/2022
ms.reviewer: "matp"
ms.topic: "article"
search.audienceType: 
  - maker
search.app: 
  - PowerApps
  - D365CE
---

# ALM for admins and makers

This section describes how you as a Power Platform administrator or app maker can use available features, tools, and other resources to implement application lifecycle management (ALM) using Microsoft Power Platform.

## Power Platform pipelines (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

> [!IMPORTANT]
> - This is a preview feature. More information: [Model-driven apps and app management](/power-apps/maker/powerapps-preview-program#model-driven-apps-and-app-management)
> - [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

### Create a pipeline

Power Platform administrators can create one or more pipelines.

#### Prerequisites

- At least two Power Platform environments. Each must include a Microsoft Dataverse database.
- Power Platform administrator or Dataverse system administrator role.

Before you begin, you’ll need to choose which environments will participate in pipelines. A common set up might include the following environments:

- Host environment. This environment acts as the storage for all pipeline configuration and run history. As this is the control center for all deployment activities, we recommend you keep this as a dedicated environment separate from development, testing, and production environments. It stores all pipeline configuration and run information. You might have multiple hosts within a tenant, such as for different business organizations or projects.
- Development environment. This is where you’ll build solutions.
- QA environment. This is where you’ll deploy solutions for testing prior to moving them to production.
- Production environment. The final destination for a deployment pipeline. This is where end users will run the apps that are deployed.

> [!TIP]
> Provide environment names that indicate their purpose. For example, *Contoso Host*, *Contoso Dev*, and so on.

#### Install the Power Platform Pipelines package in your host environment

1. First, copy and paste the Environment ID’s of all environments participating in the pipelines to a notepad. You’ll need these later. More information: [Find your environment and organization ID](/power-platform/admin/determine-org-id-name#find-your-environment-and-organization-id)
1. Sign into the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), go to **Environments** > **New**, and create a new environment with a Dataverse database or Dataverse plus Dynamics 365 Customer Engagement apps database in either Canada, South America, France, or India.
1. Select **Frequent** as the **Refresh cadence** to ensure you quickly receive the latest updates. You can change this later by editing the environment details.
1. Install the Deployment Pipelines application in your host environment. Open a new browser tab and go to [Appsource to get the pipeline app](https://appsource.microsoft.com/product/dynamics-crm/mscrm.4709698f-7284-429e-bed9-fe711a54e8b6-preview?flightCodes=deploymentpipelines).
1. Select **Get it now**.
1. Enter the required information, then select **Continue**.
1. Select the appropriate host environment, accept the terms, then then select **Install**.
   > [!IMPORTANT]
   > You only need to install the Deployment Pipelines application in the host environment. You don't need to install it in other environments, such as development, QA or production, that will be part of your pipelines.

Once installed the Deployment Pipelines Configuration application will appear in the list of installed Dynamics 365 apps.

#### Configure a deployment pipeline

1. Once the Deployment Pipeline package installation has completed, go to [Power Apps](https://make.powerapps.com/?utm_source=padocs&utm_medium=linkinadoc&utm_campaign=referralsfromdoc), then select the dedicated host environment (where you’ve just installed the application).
1. Play the **Deployment Pipeline Configuration** App.
1. Select **Environments** on the left pane, and then select **New** to create the environment records in Dataverse:
   - **Name**. Enter the name for the environment record, it's a good idea to include the same name as the actual environment, such as **Contoso Dev**.
   - **EnvironmentType**: Select either **DevEnvironment** or **TargetEnvironment**. Select **DevEnvironment** for all source environments where unmanaged solutions will be exported. Select **TargetEnvironment** for QA and production environments where the managed solution artifacts will be deployed.
   - EnvironmentId: Paste in the environment ID that you copied in the earlier step.
1. Select **Save**.
1. Select **Pipelines** on the left navigation pane, and then select **New** to create a new deployment pipeline. Note that a pipeline must be linked to a development environment before it can be used:
   - **Name**. Enter a name for the pipeline, such as *Contoso Sales App Deployment Pipeline*.
   - **Description**. Optionally, enter a description for the pipeline.
1. On the right side of the **Linked Development Environments grid**, select the **Stages** icon. This is where you configure the stages for this pipeline.
   :::image type="content" source="media/pipeline-stages-icon.png" alt-text="Pipeline stages icon":::

1. Select **New Deployment Stage** to insert a new stage, and then enter the details for each of the stages:
   - **Name**: The name of the stage. 
   - **Description**: Optional description for the stage.
   - **Previous Deployment Stage**: Specifies a deployment stage that must be deployed to before deploying to the current stage. For example, when creating a production stage, you would add the test stage as the **Previous Deployment Stage**. Note that for the first stage, this field can be left blank.
   - **Target Deployment Environment**: This is the target environment that is associated with this stage. It is a lookup to the deployment environment records that were created in the previous step. In this example, two target stages are created (test to prod).
   :::image type="content" source="media/pipeline-target-stages.png" alt-text="Pipeline target stages":::

### Run pipelines

To run a pipeline, first [grant access to run pipelines](#grant-access-to-run-pipelines).
Then makers can [run pipelines](#run-pipelines) they have access to.

#### Grant access to run pipelines

Grant access to run one or more pipelines. Typically, makers won’t be allowed to create or edit pipelines, nor will they be able to run pipelines they don’t have access to.

1. Assign makers the **Deployment Pipeline User** security role within the host environment. This security role is installed with the Power Platform Pipelines package. More information: [Assign a security role to a user](../admin/assign-security-roles.md)
1. In the Deployment Pipeline Configuration app, share pipeline record(s) with makers (or AAD groups). [Share rows with a user or team](/power-apps/user/share-row)
1. Makers must also have security roles within the development, test, and production environments that are linked to the pipeline they’ll use. Note that the same privileges are required as for manually exporting and importing solutions from and to these environments.

#### Run a pipeline

1. Sign into a Power Platform preview environment (make.preview.powerapps.com)and select your development environment.
1. To enable the feature, append the following to your browserURL:`?cdsCommon.enableAppDeployment=true&powerappsConnections.enableInlineConnectionCreation=true&cdsCommon.enableAppDeploymentPipelinesPolling=true&make.enableMultiEnvironmentGraphQLService=true`. For example: https://make.preview.powerapps.com?cdsCommon.enableAppDeployment=true&powerappsConnections.enableInlineConnectionCreation=true&cdsCommon.enableAppDeploymentPipelinesPolling=true&make.enableMultiEnvironmentGraphQLService=true
1. To deploy a solution using a pipeline, go to **Solutions** and create or select an unmanaged solution to deploy.
1. Choose between two options to include the solution in the pipeline:
   - Select **Pipelines** from the left navigation pane.
   - Select **Overview** from the left navigation pane, and then select **Deploy** on the command bar.
1. Select the stage you want, such as *Test Stage*, and then select **Next**. This will initiate validation of the solution against the test environment. This validation can also be referred to as “pre-flight” checks. Missing dependencies and other common issues are checked that might cause a deployment to fail.
1. If connection references or environment variables are present, you’ll be prompted to provide these (just as you would when manually importing solutions).
1. Select **Deploy**. This initiates an automated deployment to the target environment.

> [!NOTE]
> You must complete the deployment stages in order. For example, you can't deploy version 1.0.0.1 to production before it has been deployed to test. After deploying to test, that same solution will be deployed to production –even if afterward you made changes to the solution without incrementing the version.

### Monitor pipeline deployments

The **Pipelines** page in the **Solutions** area displays all deployment activity for the current pipeline and solution.

Select a pipeline to view additional detail as well as error information in case of failure.
:::image type="content" source="media/pipeline-monitoring.png" alt-text="Monitoring a pipeline":::

### Pipeline security roles

When you install the Power Platform Pipelines package, two security roles are created:

- Deployment Pipeline Administrator. Has full control over all pipeline configuration, without needing system administrator security role membership.
- Deployment Pipeline User. Has privileges to run pipelines that have been shared with them. More information: [Grant access to run pipelines](#grant-access-to-run-pipelines)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
