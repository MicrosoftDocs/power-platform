---
title: Set up pipelines in Power Platform
description: Learn how to create, configure, share, and manage Power Platform pipelines.
author: caburk
ms.author: matp
ms.topic: how-to
ms.date: 03/18/2024
ms.custom: template-how-to
contributors:
- asheehi1
---
# Set up pipelines in Power Platform

Create and run pipelines to easily deploy solutions to environments.

## Create a personal pipeline using the platform host (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Pipelines are now available to all who navigate to the pipelines page for the first time. Create personal pipelines from your development environments to other target environments that you have import access to. Apply the benefits of pipelines such as no downloads or uploads required, deployment scheduling, inline target environment solution validation, upfront connection reference and environment variable value validation, and Copilot-generated deployment notes with an easy setup process.

> [!IMPORTANT]
>
> - This is a preview feature.
> - [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]
>

### Prerequisites for personal pipelines

- Two environments can be associated to a personal pipeline created from the **Pipelines** page: one current development environment and one target environment.
- All environments used in pipelines must have a Microsoft Dataverse database.
- All target environments used in a pipeline must be enabled as [Managed Environments](../admin/managed-environment-overview.md).

### Current limitations with personal pipelines

- Personal pipelines can't be extended.
- Only two environments, a source and a target, can be configured.
- Personal pipelines can't be shared with other users.

### Setting up the platform host for the first time

If you're the first user in your tenant to navigate to the **Pipelines** page in an environment not already associated with a custom pipelines host, the platform host is provisioned for everyone in the tenant to use.

### Create a pipeline in Power Apps

First, ensure that you are in the development environment where you want your pipeline to start from.

Select **Create pipeline** on the command bar or from the **Pipeline** dropdown list.

A panel opens, where you enter:

- **Pipeline name**: A name for the pipeline.
- **Description**: An optional description to describe what the pipeline is used for.
- **Target environment**: The environment that solutions in the current development environment are deployed to.

Once you select **Save**, the current (source) environment and the selected target environment are associated with the platform host, and environment records for each are created in the platform host. Then, the newly created pipeline is autoselected and you're ready to [run the pipeline](run-pipeline.md).

> [!IMPORTANT]
>
> Environments can only be associated with one pipelines host. If you would like to use a governed pipeline with advanced extensibility, shareability, and more than two environments, ensure that environment records in the platform host are deleted within the **Manage pipelines** experience so they are freed up to be associated with a custom host. Deleting a pipeline doesn't delete the environment records linked to that pipeline.
>

#### Delete a pipeline you own from Power Apps

Select **Delete** on the command bar to delete the currently selected pipeline in the dropdown list. A confirmation message appears regarding your intent and knowledge of the consequence.

This action doesn't remove the run history for the pipeline nor does it delete the associated environment records from the host.

## Create a pipeline using a custom pipelines host

Power Platform administrators can create one or more pipelines, associate any number of environments, then share access with those people that administer or run pipelines.

### Prerequisites for custom pipelines host

- Four environments are recommended, but you can use as few as three Power Platform environments to create a pipeline.
- All environments used in pipelines must have a Microsoft Dataverse database.
- You must have a Power Platform administrator or Dataverse system administrator role to install the pipelines application.
- All target environments used in a pipeline must be enabled as [Managed Environments](../admin/managed-environment-overview.md).

#### Create or choose environments for pipelines

Before you begin, you’ll need to identify which environments participate in pipelines. Be sure to enable all target environments as [Managed Environments](../admin/managed-environment-overview.md). Managed Environments isn't required for the pipelines host or developer environments.

- **Host environment**. This special-purpose environment acts as the **storage** and management plane for all pipeline configuration, security, and run history.
  - We recommend you keep this setting as a **dedicated production environment** separate from the development and target environments.
  - If desired, you can configure multiple different hosts within a tenant, such as for separately managing pipelines for different business organizations or geographic locations. One host for the entire tenant is also acceptable as long as all environments are in the same geographic location.

   > [!IMPORTANT]
   >
   > Deleting the host environment deletes all pipelines and run data. Use caution and understand the impact of data and configuration loss as well as maker access to pipelines hosted in the environment.
   >
- **Development environment**. This environment is where you develop solutions. A pipeline can be run from within any development environments linked to it.
- **Target environment**. The destination environment a pipeline deploys to. For example, integration testing, user assistance testing (UAT), production, and so on.

> [!TIP]
> Use environment names that indicate their purpose. For example, *Contoso Host*, *Contoso Development*, *Contoso QA*, and so forth.

### Install the pipelines application in your host environment

This step is only required for the initial host setup. You might skip to the next section if you already have access to a host environment where you'll create pipelines.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), go to **Environments** > **New**, and create a new environment with a Dataverse database. Be sure to choose the same region that your development, QA, and production environments are created in.
2. Install the **Power Platform Pipelines** application in your host environment by selecting the host environment, then select **Resources** > **Dynamics 365 apps**.
3. Select **Install app** and scroll down within the right-side panel until you find **Power Platform Pipelines**.
4. Select **Next**, if you agree, accept the terms, and then select **Install**.
   > [!IMPORTANT]
   > You only need to install the deployment pipelines application in the host environment. You don't need to install it in other environments, such as development, QA or production environments that will be associated with your pipelines.

Once installed, the deployment pipelines configuration application appears in the list of installed apps.

### Configure a deployment pipeline

1. Copy the environment IDs of all development and target [Managed Environments](../admin/managed-environment-overview.md) that are linked to pipelines. You’ll need these IDs later. More information: [Find your environment and organization ID](/power-platform/admin/determine-org-id-name#find-your-environment-and-organization-id)
1. Once the **Deployment Pipeline** package installation has completed, go to [Power Apps](https://make.powerapps.com/?utm_source=padocs&utm_medium=linkinadoc&utm_campaign=referralsfromdoc), then select the dedicated host environment (where you installed the application).
1. **Play** the **Deployment Pipeline Configuration** app.
1. Select **Environments** on the left pane, and then select **New** to create the environment records in Dataverse:
   - **Name**: Enter the name for the environment record. It's a good idea to include the same name as the actual environment, such as **Contoso Dev**.
   - **Environment Type**: Select either **Development Environment** or **Target Environment**. Select **Development Environment** for all source environments where unmanaged solutions will be developed. Select **Target Environment** for QA and production environments where the managed solution artifacts are deployed.
   - **Environment Id**: Be sure to select the correct ID. You can find the environment ID for the current environment within make.powerapps.com. Select the **Settings** icon on the command bar, and then select **Developer resources**. More information: [Find your environment and organization ID](/power-platform/admin/determine-org-id-name#find-your-environment-and-organization-id)
1. Select **Save**.
1. Refresh the form, then verify **Validation Status** equals **Success**.
1. Repeat steps 4-6 until all environments that will participate in the pipeline have environment records created.
1. Select **Pipelines** on the left navigation pane, and then select **New** to create a new deployment pipeline:
   - **Name**: Enter a name for the pipeline, such as *Contoso Standard Deployment Pipeline* or *Contoso Hotfix Pipeline*.
   - **Description**: Optionally, enter a meaningful description for the pipeline.
    :::image type="content" source="media/Create new pipeline.png" alt-text="New pipeline icon":::

1. Within the **Linked Development Environments** grid, select **Add Existing Development Environment**, then associate one or more development environments. A pipeline must have at least one development environment and one stage before it can be run.
:::image type="content" source="media/Pipelines add development environment.png" alt-text="Add development environment icon":::

1. Within the **Deployment Stages** grid, select **New Deployment Stage**, to display the quick create pane.
   :::image type="content" source="media/Pipelines create stage QA.png" alt-text="Pipeline stages icon":::

1. Enter the details for each stage, and then select **Save and Close**:
   - **Name**: The name of the stage.
   - **Description** (optional): Optional description for the stage.
   - **Previous Deployment Stage** (optional): Specifies a deployment stage that must be deployed to before deploying to the current stage. For example, when creating a production stage, you can add the test stage as the **Previous Deployment Stage**. For the first stage, or pipelines containing only one stage, this stage should be left blank.
   - **Target Deployment Environment**: This is the target environment where this stage will deploy to.
   - **PreDeployment Step Required** (optional): Deployment requests will be pending until approved via custom business logic. Requires additional configuration. More information: [Extend pipelines in Power Platform](extend-pipelines.md)  
1. Repeat the previous two steps for each stage you'd like to add to the pipeline. You must have at least one stage. You can add up to seven stages.

  :::image type="content" source="media/pipelines-pre-step-config.png" alt-text="Pipelines pre-deployment step required":::

## Grant access to edit or run pipelines

Pipeline security is managed within the host environment by assigning security roles. Additionally, users must currently have access to all environments associated with a pipeline in order to create or run the pipeline.

When you installed the Power Platform pipelines application, two security roles were added:

- **Deployment Pipeline User**: Has privileges to run pipelines that have been shared with them.
- **Deployment Pipeline Administrator**: Has full control over all pipeline configuration, without needing system administrator security role membership.

### Share pipelines with makers

The **Deployment Pipeline User** security role grants access to run one or more pipelines. It doesn't grant access to create, edit, or delete pipelines. Users with the Deployment Pipeline User security role won't see the host environment within the environment picker in Power Apps or Power Automate, or otherwise need to be aware of it.

To share pipelines:

- Assign makers the **Deployment Pipeline User** security role within the host environment. This security role is installed with the Power Platform pipelines application. More information: [Assign a security role to a user](../admin/assign-security-roles.md)
- In the deployment pipeline configuration app, **Share** the pipeline record with makers (or Microsoft Entra groups). **Read** privilege is sufficient to view and run a pipeline from within the development environment. More information: [Share rows with a user or team](/power-apps/user/share-row)
- Makers must also have privileges to export solutions from the source development environments, as well as privileges to import solutions to the target test and production environments for which the pipeline deploys to. By default, system customizer and environment maker roles have these privileges.

### Share with pipeline administrators

The Deployment Pipeline Administrator security role grants full privileges to all pipelines (and tables, which store pipeline information) within the host environment. It also grants access to run all pipelines associated with the current host. The Deployment Pipeline Administrator security role doesn't grant privileges to perform other activities within the host environment.

> [!IMPORTANT]
> Pipeline administrators must also have access to all development, test, and production environments that are associated with pipelines they create or run.

Assign the **Deployment Pipeline Administrator** security role to users or Microsoft Entra groups within the host environment. This security role is installed with the **Power Platform Pipelines** application. More information: [Assign a security role to a user](../admin/assign-security-roles.md)

## Centrally manage and monitor deployments

The pipeline configuration app and host environment provide many other benefits such as:

- Centrally view all deployment activity. Filtered views are also accessible within the maker experience for a given pipeline and solution.
- Audit where a certain solution version is deployed as well as who initiated the request.
- View error logs, validation results, and deployment settings. Environment variables and connections are provided during deployment.
- Retain backups of all solution artifacts by version.
- Schedule bulk delete jobs to remove unwanted data and conserve database capacity. More information: [Remove a large amount of specific, targeted data with bulk deletion](../admin/delete-bulk-records.md)
- Use a dashboard to visualize deployment metrics. You might also build your own reports using data stored within the host.

### Accessing the Deployment Pipeline Configuration app from Power Apps

From the **Pipelines** page within any solution, the **Manage pipelines** button in the command bar will navigate to the app of the pipelines host that is associated with the current environment:

1. If the current environment is associated with a custom pipelines host, the button links to the Deployment Pipeline Configuration app within the dedicated Host environment.
1. If the current environment is associated with the Platform host, the button will link to an embedded Deployment Pipeline Configuration app within Power Apps.

The Deployment Pipeline Configuration app can be accessed by anyone with the Deployment Pipeline Administrator role if using a custom host, and any tenant administrator for the app associated with the Platform host.

#### Disassociating environments from one host and associating them with another host

1. From the Power Apps (make.powerapps.com), begin in an environment that you want to disassociate, and select **Solutions**.
1. Choose any solution that you have access to, and select into it.
1. Navigate to the **Pipelines** page from the left navigation pane, and then select **Manage pipelines** on the command bar. If you're beginning with a custom host, you can also go directly to the dedicated host environment and run the **Deployment Pipeline Configuration** app from there.
1. Now that you are in the **Deployment Pipeline Configuration** app, navigate to **Environments** from the left navigation pane.
1. In the **Added Deployment Environments** table shown by default, select the environment records for the environments that you want to disassociate from this host.
1. Select **Delete** on the command bar, and confirm deletion.
1. For associating the deleted environments to the new host, Repeat steps 1-4 but in the context of the desired host to associate the environments with.
1. In the **Added Deployment Environments** table shown by default, select **New** in the command bar.
1. Create the environment record by assigning a name, type, environment ID, and optional description.

Now you're able to link the environments to pipelines in the new host.

## Frequently Asked Questions

### Why can I still create a pipeline with a target environment that is not a Managed Environment?
Pipelines in Power Platform is not currently strictly enforced as a Managed Environments feature. There is prevalent messaging that "Pipelines is a feature of managed environments", but you can still create pipelines with target environments that are not managed today. However, we are planning to enforce this in the near future.

### Why am I seeing an error that states "this environment is already associated with another pipelines host"?
This error indicates that another host already contains an active environment record that you are trying to associate with the current host. To resolve this, refer to the section above on [Disassociating environments from one host and associating them with another host](#Disassociating). We will also soon have a "Force link" capability for admins to forgo the environment record removal process.

### Do the pipelines and data within the platform host count towards my Dataverse capacity?
No, the data consumption in the platform host does not count against your current plan. The same does not apply to a custom host, which is not an implementation in the platform but instead in a customizable environment.

### Will personal pipelines conflict with any pipelines that I have already set up?
No. Thanks to the host separation dynamic that we have in place, there is no way for a Maker creating a personal pipeline (in the platform host) to associate an environment that is already associated with a custom host. Nor will Makers be able to see the new Pipelines for All experience (that enables the creation of lightweight personal pipielines) in environments already associated with a custom host; the new experience only shows up by default in environments that are not already associated with a host and those associated with the platform host. Makers also do not receive any elevated access to environments as a result of this feature. Selectable target environments are filtered to only include environments that a Maker could import to today.

### What if I want to enable Makers to create personal pipelines in a custom host? Can I do that?
Yes. As an admin, you can assign the **Deployment Pipeline Default** role to anyone you would like to grant these lightweight pipeline creation permissions to. This is **not** assigned to anyone by default in the case of custom hosts.

## Next steps

- [Extend pipelines in Power Platform](extend-pipelines.md)
- [Run pipelines in Power Platform](run-pipeline.md)
