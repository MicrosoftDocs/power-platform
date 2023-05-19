---
title: Migrating apps and flows from the default environment | Power Platform
description: Learn about how to migrate apps and flows from the default environment in Power Platform.
author: robstand
ms.date: 05/29/2023
ms.component: pa-admin
ms.topic: conceptual
ms.subservice: guidance
ms.author: ravichada
ms.reviewer: sericks
search.audienceType: 
  - admin
---
# Migrating apps and flows from the Default environment

Microsoft Power Platform is the world’s most complete low code platform. It's a conglomeration of multiple low code tools. Some of these tools like Power BI, Dataverse, Power Pages have had years of maturity while tools like Power Virtual Agents, Custom Connectors, Power Automate have emerged to empower the citizen developers. The primary reason for the distinction between the mature and newly created tools is because of how packaging and movement of assets across environments has evolved individually within these products.

This document aims to address a key need of how organizations and administrators can plan migration of their various assets from default environment. This by no means is going to be comprehensive but attempts to provide options available.

## Default environment

The default environment of Microsoft Power Platform empowers every employee in an organization, with a Microsoft 365 license to create apps and cloud flows. Default environment becomes the first playground studio for these employees (makers - citizen developers and professionals alike) to start building their apps and flows. Most Organizations often [rename the default environment as Personal Productivity](/power-platform/admin/environments-overview).

Every employee in an organization using the Power Platform has access to the default environment. Since it isn't possible to remove the environment maker role from the default environment. Overtime, Makers start to build personal productivity apps and flows and even start to share these within their teams for others to benefit.

Admins reactively discover that many apps and flows are created in the default environment. It may not be appropriate for the app or flow to be in the default environment, in instances such as:

- An app is shared with many users – production like behavior.
- An app uses Excel workbooks with sensitive data.
- An app based on SharePoint lists is getting many data interactions – inserts, updates.
- An app or flow is using connectors that aren't allowed in new Data Loss Prevention (DLP) policies.

Custom Connector(s) being enabled and used in the Default Environment instead of being secured via dedicated environment

The above scenarios are worth consideration and provide an indication that you should start moving these apps and flows from the default environment into their own developer and/or another shared environment. Other factors that come into play are the limitations associated with the default environment. See [default environment](#) definition.

Center of excellence/enablement (CoE) Teams that monitor Power Platform will be forced to react once the limits are reached. This may also negatively hamper those productive apps that may be still running out of the default environment. This may be something an administrator or the CoE team need to perform regularly as well.

There are three broad stages:

### Identification of the Power Platform objects

The first step is to identify apps, flows and assets that need to be moved over (or) cleaned-up. The [CoE Starter Kit](/power-platform/guidance/coe/overview) provides an inventory of all the apps and flows, and the Power BI reports also help determine usage. This helps you evaluate the app usage and should help to label them. As you go through the exercise, be sure to [tag](#)apps and flows that should be migrated to another environment. A tag could be based on the connectors used, user location, user department, and so on. We'll also outline a method for recognizing items that should be cleaned or relocated based on Data Loss Prevention (DLP) [later in this document](#).

### Move the Power Platform objects

If the component is intended for a move to a different environment this document addresses the options available to move the app. A move is an interactive process and would need some level of Maker interaction as well. The level of complexity to move an app, flow increases with the mix of components used to build an app, flow.

For example, an App with six screens has 10 buttons through multiple screens. Let’s assume that these 10 buttons call an individual flow. There are also a couple of flows that get triggered daily to fix data or integrate data with another system. Let’s also assume that there's some AI Builder image processing model that is used as part of the automation. To move such an app, all components need to be added to a solution, connection references used across be adjusted correctly and tested out before confirming the completion.

In another case, let’s assume a simple Canvas app that uses office 365 connection. In this case, the maker just needs to add the canvas app only to the solution.

As you can gather from the above there's a certain complexity and risk associated. This document aims to provide guidance to navigate this complexity and options to choose from that fits your organizational needs.

### Clean up the Power Platform objects

If a component is tagged for cleanup, then there are two main options. The first option is to just delete it directly and the second option is to delete after taking a backup. In the latter case of backup, there may be some overlap of steps coinciding with moving objects.

As an example, CoE Team administrators find that most of the makers created test apps and flows to learn and abandoned them. These can be confirmed by looking at the usage metrics. Another way is to [quarantine](#) the app and if no one approaches then you can delete such apps as well.

A [communication strategy](#) all through this process plays a key role. Admins should plan to communicate about establishing connections that makers need to permit as they launch the app in the new environment, the new URL of the app from the target environment and navigate to the right environment.

This document presents diverse options for relocating objects. Some of these solutions are ready-made and may require a [standalone Power Apps and Power Automate license](/power-platform/admin/pricing-billing-skus), that provides users the ability to create and run apps across data sources that extend beyond Microsoft 365.

## Strategies

The entire process of identifying and moving apps, flows from default environment is better when it's based on a strategy. Also develop a strategy on how best to communicate and at what points do we need to communicate. That provides consistency in objective and helps with communication for the makers. There are multiple strategies that you can apply.

### DLP Based strategy

Data loss prevention (DLP) policies function as guardrails to help prevent users from unintentionally exposing organizational data and to protect information security in the tenant. DLP policies enforce rules for which connectors are enabled for each environment, and which connectors can be used together. Connectors are classified as either **business data only**, **no business data allowed**, or **blocked**. A connector in the business data only group can only be used with other connectors from that group in the same app or flow. It's recommended to have at least one policy. This article provides guidance on building a DLP strategy - [Establishing a DLP strategy - Microsoft Power Platform - Power Platform | Microsoft Learn](/power-platform/guidance/adoption/dlp-strategy)

Effectively, your environment strategy is defined through DLP and that provides a destination for the apps and flows in default environment.

### Environment Based strategy

Developing an environment strategy means configuring environments and other layers of data security in a way that supports productive development in your organization, while securing and organizing resources. A strategy to manage environment provisioning and access, and controlling resources within them, is important to:

Secure data and access.

Govern the default environment in a compliant way.

Manage the correct number of environments to avoid sprawl and conserve capacity.

Facilitate and implement a healthy application lifecycle management (ALM).

Organize resources in logical partitions.

Support operations (and helpdesk) in identifying apps that are in production by having them in dedicated environments.

Ensure data is being stored and transmitted in acceptable geographic regions (for performance and compliance reasons).

Ensure isolation of applications being developed.

Enablement of internal invoicing services to business end-users or business units consuming the services

This article provides guidance on building an environment strategy - [Establishing an environment strategy - Microsoft Power Platform - Power Platform | Microsoft Learn](/power-platform/guidance/adoption/environment-strategy)

You have well-established departments that can self-sustain and have existing ALM process in place. In such cases, environments provide isolation and organize resources based on the department. A strategy based on that can be achieved by creating separate environments for each department. These environments then become the destination for the apps, flows in the default environment.

### Communication strategy

As part of the migration and/or clean-up effort. An important aspect is to make sure the process is smooth to the makers, stakeholders and leadership informed.

- CoE starter kit could be used as an asset tracker, you can add custom cloud flows to send notifications at various stages. You can also create template emails that get sent out to communicate with the maker(s).
- Things to keep in mind are.
  - Change in URL of the app – Any bookmarks to an app in the default environment needs to be updated by all users of the app.
  - If there's a URL-based HTTP trigger flow, that must be updated in dependent flows to ensure it still acts as a webhook.
- Provide detailed steps to establish connections once the move is complete for both makers and app users. In most cases it’s intuitive but the user shouldn't be worried about creating a connection when they launch the app for the first time from the new environment.

A good start for setting up communications requires a self-serve model to scale and be more real time for users than just leaving it for a single user’s email or a distribution list. If you plan to establish a SharePoint site, there's a template available that you could use, [create an internal Microsoft Power Platform hub](/power-platform/guidance/adoption/wiki-community). This becomes the general and common place to learn about strategy and guidance so makers get to make right decisions for what they intend to build and where they should go for it.

There are some existing solution components like [Set up inactivity notifications components](/power-platform/guidance/coe/setup-archive-components) and [Set up Developer Compliance components](/power-platform/guidance/coe/setup-governance-components) in the CoE starter kit that you could take advantage of. These components come with email templates, and they can be duplicated to fit your purpose and need for migrating them from default environment. A good addition is to capture some success stories as well on the communication site.

## Individual Migration of Objects

First let’s recap the steps that are involved in migrating each of these objects individually (Canvas app, Model Driven app, Power Automate Cloud Flows, Power Pages, and Power Virtual Agents). Next, we'll identify the opportunities for automation using Solutions.

The distinction between App and Solution is an important one. Exporting and importing an app will only affect that object. On the other hand, a Solution is a container that can have multiple apps, flows, and other objects.

### Export and import a canvas app

![Export package GIF demo with example export walkthrough.](media/image2.gif)

Link to Gif showing export and import of a canvas app - </power-apps/maker/canvas-apps/media/export-import-app/export-app.gif>

The detailed steps are documented at [Exporting a canvas app package](/power-apps/maker/canvas-apps/export-import-app) and [Importing a canvas app package](/power-apps/maker/canvas-apps/export-import-app).

### Export and import flow

**Exporting a flow**

To export a flow package, click on "…" menu, select **'Export'** then click on **'Package (.zip)’.**

On the next screen, supply a name and a description for your package first. You can then configure defaults and add comments that will be accessible during the import phase.

Next, click on the "**Export**" button in the bottom right corner and your package should start downloading shortly after. If your download doesn't start automatically, you can also click on the "**Download**" button.

An old blog but still has the relevant steps with gifs - [Export and import your flows across environments with packaging | Power Automate Blog (microsoft.com)](https://powerautomate.microsoft.com/en-us/blog/import-export-bap-packages/)

**Importing a flow**

To import a flow, click on the import button on the screen.

Next, upload the package file and wait for the screen to show the package details.

When configuring the flow settings, you can choose to either create a new flow or update an existing one with the flow definition from the package.

You'll also need to select the connections that are required to set up the flow as part of the import process. You should see the ***Import*** button light up once you have successfully configured all the required settings.

Once you have imported the flow, it must be activated. Remember, if the flow has any connection references, the user activating it must have access to those connections. If not, the connection owner can grant access to the activation user.

### Export and import a model driven app

A model driven app is always part of a solution. The packaged app, included in the solution file (.zip), can be shared with users based on their security roles after it has been successfully exported from the source environment and imported into the target environment.<br>A detailed step by step process is well documented here - [Export a solution](/power-apps/maker/model-driven-apps/distribute-model-driven-app) and [Import a solution](/power-apps/maker/model-driven-apps/distribute-model-driven-app)

### Export and import a Power Virtual Agents bot

You can export and import bots using solutions. A detailed list of steps are documented here - [Export and import bots using solutions](/power-virtual-agents/authoring-export-import-bots).

### Export and import Power pages site

Migration pages involve exporting the existing configuration from the source Microsoft Dataverse environment, and then importing it into the target Dataverse environment. There are some prerequisite steps that need to be performed in the target environment and these are well documented here - [Prepare the target environment](/power-apps/maker/portals/admin/migrate-portal-configuration?tabs=CMT). Once the preparation work is complete the portal configuration data can be exported using the [Configuration migration tool](/power-apps/maker/portals/admin/migrate-portal-configuration?tabs=CMT). A detailed of steps to use the configuration migration tool are captured here - [Export portal configuration data](/power-apps/maker/portals/admin/migrate-portal-configuration?tabs=CMT) and [Import portal configuration data](/power-apps/maker/portals/admin/migrate-portal-configuration?tabs=CMT)

### SharePoint Form app – special case for default environment

[SharePoint form apps](/power-apps/maker/canvas-apps/sharepoint-form-integration) can be associated with only one environment and if not configured otherwise, will be in the default environment. A migration, of all apps. means setting the destination to be a different environment instead of the default environment. A list of the commands that an administrator can use is well documented here - [Designate SharePoint custom form environment](/power-platform/admin/powerapps-powershell). Existing custom forms don't automatically migrate to the newly designated environment. Only production environments may be designated for SharePoint custom forms. The manual process follows like moving a canvas app.

## Backing up Microsoft Power Platform objects

At various points in this document, the backing up of Microsoft Power Platform objects has been recommended but what are the options available and what is the process?

Most Microsoft Power Platform objects are exported as zip files if not they have at least a file format. These files in their original format as a zip file or whatever extension they come with can be added to any file storage location or a repository of your choice. A few options to mention are Azure DevOps, GitHub, SharePoint, One Drive or any other solution that supports all file formats.

## Mass Migration Options

The migration of an app or flow can be considered successful if it functions the same way as it did before. However, there are certain elements that can't be transferred:

Flow Run data – data about the past runs of the flow. The data about flow runs is only stored for 28 days. If you need the data, then it can be exported and stored, by either using the CoE starter kit or if you have [set up Export to data lake](/power-platform/admin/self-service-analytics-schema-definition). The latest version of the CoE starter kit has the flow run data if used with Data Export.

Versions of the Canvas App – as makers iterate through the development process, there may be multiple versions created. The prior versions can't migrate, only the latest version can be.

Data accessed by the app or flow, using connectors, won't be included in the migration, only App Meta data is included as part of export.

Any collaboration comments made in the app or flow are also not included.

This document outlines some possibilities. It's important to carefully consider the implications and advantages of each possibility before deciding.

## Migrate all – DB backup and restore option

As with every other environment, default environment is backed up as well. These system backups are performed automatically and there's no on demand option. for the default environment. This goes through a support request.

Once backed up, it can be restored into a new environment keeping all the data within Dataverse. This option is only to show the reader about its existence and educate the reader on when to consider. It shouldn't be pursued as the primary choice, as it would only yield partial migration.

| **Supported** | **Not fully supported** |
|---|---|
| **DataverseDynamics apps** | Canvas appComponent libraryCustom pagesPower AutomatePower Virtual Agents |

Not fully supported indicates that there may be potential data loss during migration and more steps required.

## Migrate Metadata and then data

A recommended approach is to use Solutions to move the metadata and then either dataflows, Azure Data Factory, or another tool of preference could be employed to transfer data. Complete automation from start to finish may not be achievable in all cases, due to the diverse connectors, but close approximation is possible.

At a high level, the steps are:

1. Add App to a Solution
1. Add Flow to Solution
1. Add existing PVA.
1. Adjust connection references in Apps and Flows
1. Check for solution dependencies and add objects.
1. Export the Solution
1. Import the Solution

### Checking for solution dependencies

The success of a solution import in target environment can only be ensured when you have all related components added to solution or they're available in the target environment. If there are missing components, then the import of solution is likely to fail. To ensure that all required components are present, there are options best if used in combination:

Manually add selected components to the solution. In this case, it's assumed that you know that all dependent components are already available on the target environment.

Use the [Show dependencies](/power-apps/maker/data-platform/view-component-dependencies) button from within the solution to let system identify dependencies for you. You have the option to add all or selectively add only those that don't exist in the target.

![Component dependency for the account table.](media/image3.png)

An image showing dependencies of account table.

### Adding a component to a Solution (manual)

Assuming that a Solution is created (check this [documentation](/power-apps/maker/data-platform/create-solution) to create a solution and add objects), a maker needs to use the Add existing component menu option to add an existing app, flow or Power Virtual Agent

![Graphical user interface, application  Description automatically generated](media/image4.png)

### Adjust connection references

Canvas apps and flows handle connections differently. Flows use connection references for all connectors, while canvas apps only use them for implicitly shared (non-OAuth) connections, such as SQL Server Authentication.

#### Updating an app to use connection references instead of connections

Canvas apps that aren't solution aware when added to a solution won't automatically be upgraded to use connection references. Connection references get associated with canvas apps only at the time a data source is added to the app. To upgrade apps, you must

Add an app that is nonsolution aware to a solution.

Remove the connection from the app.

As best practice, create a new connection reference in the solution.

Add a connection containing an associated connection reference.

#### Updating a flow to use connection references instead of connections

When a flow is not in a solution, it uses connections. If that flow is then added into solution, it continues to use connections initially. Flows can be updated to use connections references instead of connections in one of two ways:

If the flow is exported in an unmanaged solution and imported, the connections are removed with connection references.

When a solution flow is opened, the flow checker on the flow details page shows a warning to **Use connection references**. The warning message has an action to **Remove connections so connection references can be added**. Selecting that action removes connections from the trigger and actions in the flow and allow connection references to be selected and created.

### Adding an object to a Solution (automation)

PowerShell scripts can be used to move apps in bulk to a solution. Adding pre-existing Canvas apps and cloud flows to solutions can also be done via the command line. Install the latest PowerShell modules to try this option. The two main commands are “Set-PowerAppAsSolutionAware” and “Set-FlowAsSolutionAware”.

Once the modules are installed, insert your own Environment ID, App ID, Flow ID, and Solution ID

**Canvas app** example:

Set-PowerAppAsSolutionAware -EnvironmentName *{Environment ID}* -AppName {App ID} -SolutionId {Solution ID}

**Flow** example:

Set-FlowAsSolutionAware -EnvironmentName {Environment ID} -FlowName {Flow ID} - SolutionId {Solution ID}

**Connection references** are data entries into connection reference table. Details on connection references management and deployment can be found here: </power-platform/alm/conn-ref-env-variables-build-tools>. To use the connection reference as part of the App or Flow, this requires a modification of the core App/Flow definition. To make this happen “connectionReferences” node needs to be parsed and then replaced with the connection reference.

```
A full source code for this might be of interest but a generic script might not solve the need for all ALM requirements. 
```

### Solution export and import

Assuming the solutions are ready the next stage of automation can be done in multiple ways.

1. Manually export and import the solutions into the target environment. The steps for Export and Import are detailed here – [Export solutions](/power-apps/maker/data-platform/export-solutions) and [Import solutions](/power-apps/maker/data-platform/import-update-export-solutions)

The next set of options are automations that can be developed by the reader.

1. Make use of packages – [Deploy packages using Package Deployer and Windows PowerShell](/power-platform/admin/deploy-packages-using-package-deployer-windows-powershell)to automate the packaging. This can be used to move multiple solutions in a single pass.

1. Make use of Microsoft Power Platform build tools tasks to perform multiple operations like [pack solution](/power-platform/alm/devops-build-tool-tasks), [unpack solution](/power-platform/alm/devops-build-tool-tasks), [export solution](/power-platform/alm/devops-build-tool-tasks) and [import solution](/power-platform/alm/devops-build-tool-tasks). DevOps provides the ability to automate ALM and these tasks are all built to support ALM for Microsoft Power Platform.

- PAC CLI (Power Platform Command line interface) also provides options to export and import solutions. All solution related [commands](/power-platform/developer/cli/reference/solution) can be used to build solution, [export](/power-platform/developer/cli/reference/solution) and [import](/power-platform/developer/cli/reference/solution). You can also use PAC CLI to transfer data in and out, consult the [documentation](/power-platform/developer/cli/reference/data) for more information.
- A maker friendly option is to use Pipelines that are intended to democratize ALM for Microsoft Power Platform. By bringing ALM automation and CI/CD capabilities into a single feature service, in such a manner that is more approachable for all makers, admins, and developers. This feature usage does require the default environment to be set as Managed environment.

### Creating Connections (Manual)

In the target environment before the import operation is set, create the missing connections that are required by the app or flow. This should help as a refresher to create connections - [Manage connections in Power Automate (contains video) - Power Automate | Microsoft Learn](/power-automate/add-manage-connections)

### Data Migration

There are multiple options available for data migration ranging from manual to full automation.

1. Manually export and import the data using Excel workbooks.
1. A Power Automate cloud flow can be developed to extract data from source tables and write directly to destination. However, this will need the maker to use the Dynamics 365 Connector or Dataverse (Legacy) connector. As of this document authoring, Dataverse connector doesn’t support connecting across environments, yet. This feature is on the roadmap and once released that may be used to move data from one to the other.
1. Configuration migration tool (CMT) – This is a tool that is used for portal migration but can also be used for regular data migration. A good overview and how CMT works is captured here -  [Configuration Migration tool](/power-platform/admin/manage-configuration-data). CMT can also be used in conjuncture with PowerShell. PAC CLI "tool" gives the ability to call CMT. - [PAC CLI tool command](/power-platform/developer/cli/reference/tool)
1. Dataflows can be used to create mappings between the environments and used to move the data. HTTP Web connector may be used as an alternative to Dataverse.
1. Azure data factory can be used with Dataverse connector to pull data from source and inserted into the destination.

Given that Default environment is limited in size one of the above options should suffice to move data out of the default environment.

#### **Clean up** **considerations:**

- Decide the order of importing the data. The least dependent tables go first and most dependent come at the last.
- Not all fields need be mapped. Fields like version, Modified date, Created date and some other system fields need not be mapped.
- If you would like to preserve the Original created on date, then use map the Source Created On date field to OverRiddenCreatedOn field on the destination table.
- Audit data can't be migrated.
- Don't enable any workflows, flows that get triggered based on data insertion unless intended. This increases the time for data migration.

## Conclusion

Power Platform is a tool for citizen developers and pro developers alike. Default environment usage should primarily focus on personal productivity using Microsoft 365 products. All other apps and flow development should be happening in designated shared, individual or Developer environments. A strong recommendation is to develop an independent environment strategy based on DLP, which will help makers to develop their apps and flows in the right environment. There's also a great benefit to establishing a communication strategy and providing users with self-serve models of learning about the strategy, implementation of solutions and best practices to develop apps and flows. A good addition is to capture some success stories as well on the communication site. Success stories published internally help makers to connect with and open for possibilities that could be achieved using Power Platform.

Through the document, it’s laid out that a strong governance strategy is essential when migrating or moving specific objects. There are various strategies available for migrating objects, including individual and mass migration. The best fit option depends on our organization policies. Solutions are the most recommended way to organize the components of your application and make migrations more straightforward.

## Appendix

### Identification of Objects using DLP

DLP policy-based identification is helpful to define target environments for your apps and flows. There might be an App or Flows that are using a connector that is blocked by the DLP or a mix of Business and Non-Business connectors, which, upon DLP activation, will stop working. Noncompliant objects based on DLP.

To prevent downtime of potential critical objects, due DLPs, part of CoE Starter Kit, you can find **DLP editor (impact analysis) tool**. The goal of the DLP Editor is to allow admins to see the impact of existing policies or the potential impact of policy changes. It provides admins with a view of impacted apps and flows, and resources that would be disabled if new or updated policies were to be enforced. The app can be used to review existing policies, change existing policies, and mitigate risk by contacting makers and informing them about the best course of action for their app or flow.

Update existing DLP policies to review impact:

![Graphical user interface, application  Description automatically generated](media/image5.gif)

Follow this [link](/power-platform/guidance/coe/after-setup-tenant-hygiene) to find more information about the DLP Editor.

Before turning on the Data Loss Prevention (DLP) feature, you can identify which Apps/Flows will be affected and alert the makers. The DLP Editor can send a list of all the Apps/Flows that will be affected to an email address, which will generate a .csv file for each type of object.

Using The DLP Editor v2, in the "Impact Analysis” choose “Export impacted apps and flows to CSV.”

![Graphical user interface, application  Description automatically generated](media/image6.png)

Each generated csv file (flow.csv and apps.csv) will have information regarding:

1. Name of App/Flow
1. Owner of App/Flow
1. OwnerEmail of App/Flow
1. Connections, all connections used by App/Flow
1. ID of App/flow to unique identify the object
1. EnvironmentID where the App/Flow is located

Notice the “Connections” will give you the list of all connections used by the App or Flow, if you need to identify exactly which connector is impacted by the DLP in question, an automation is needed at this time, we are evaluating changing this situation in the tool. <br><br>Example of implementation to identify the connection:

1. Create a Power Automate Flow.
1. Use the “Get Tenant DLP Policy” connector specifying the DLP in question.
1. The result is two arrays, Business Data and Non-Business Data, as an example the Twitter connector will show as below:

   | |
   |---|

   ```json
   [
     {
       "id": "/providers/Microsoft.PowerApps/apis/shared_twitter",
       "name": "Twitter",
       "type": "Microsoft.PowerApps/apis"
     }
   ]
   ```

1. From this list you have access to the “name” of the connector that will match with the name list of the csv App/Flow Connection column.
1. By converting the csv to Excel format and placing it in your OneDrive, you can read all the impacted Apps/Flows from Power Automate and check which connection is the affected based on logic to compare connections with connector names.
1. After you have a match on which connection is causing the impact, you can generate a new list with App/Flow ID and connector affected by the DLP.
1. Use the earlier information to notify the maker about the future impact, you can use Power Cards to collect the feedback from the maker if the App/Flow can be deleted or need to be migrated to another Environment.

Based on your analysis, if you determine that the affected Flows aren't being used (it hasn't been running for a while, isn't shared with anyone, hasn't been updated in a while), you can put it in quarantine and send an email to the make with instructions on how to move it to a different environment. This encourages a DIY (Do it Yourself) culture and removes the shadow IT. In some situations, you might want to exempt some objects from the DLP. For instance, you would like to apply a specific DLP only for new resources created and exempt the current resources. More information about DLP resource exemption can be found [here](/power-platform/admin/dlp-resource-exemption).

## Cleanup Options

A cleanup maybe be a good idea objects for apps, flow that have not been updated in a long time or they haven't been used for a good amount of time. In most cases, these are simply test flows, apps created by makers as part of their personal productivity learning and experimenting. There are different paths for an administrator to consider as far as cleanup is concerned.

## Tagging options

CoE starter kit doesn’t have a tagging option today. However, it could be a simple customization that you could add to the Starter Kit.

Create a Table called Tags and set up an N-N relationship with App, Flows and other inventory tables. You can then Create a Tag and associate these records with the appropriate inventory items. For better user experience, you can embed a grid on the Main form of Apps, Flows and other inventory tables. This option is recommended as it has referential consistency.

Create a Text field on each inventory table and use that to capture a Text(tag) that you can later use.

If you want a more fixed list Create a Global Option Set and add that to all the inventory tables and their forms as well.

## Quarantine option

If you're uncertain about the necessity of certain applications, you could try isolating them for a while and put them in quarantine, during this state, the app can only be used by the owner. After a suitable amount of time has elapsed and no response from the owner has been received, you can feel more secure in removing them from the environment.

Flows don’t support quarantine state, but a similar approach can be used by stopping the flow and check is gets activated again by the owner.

In both cases having proper communication with the owner is important, for instance, using Email or messages in Microsoft Teams.

## Only Delete option

If there's really no loss of productivity and reuse of the objects as determined this option is the best. Most Test flow and apps fall into this category.

In this case, once the list of objects is identified, a PowerShell batch could be developed, and a csv list passed to it, which would then delete all those assets.

As you loop through the IDs of apps and flows the below command can be used to remove them from the default environment.

- Remove-AdminFlow -EnvironmentName Default-[Guid] -FlowName [Guid]
- Remove-AdminPowerApp -AppName [Guid] -EnvironmentName [Guid]

## Objects backup and Delete option

As an example, assume that Power Automate flow is created to address a specific seasonal need, but it hasn't been used for a long time. In this case, it’s good to take a backup of the component before deleting the component.

To make a backup of the component either options of [Individual Migration](#) or [Mass Migration](#) could be used to generate an exported solution. This can then be added to either a file repository of your choice or to OneDrive location.

Once the backup is secured then the options from Delete above can be applied to complete the cleanup process.

## Solution Aware (be part of a solution)

Microsoft Power Platform is a collection of low-code tools that have their own ALM processes. For example, a Canvas app can be exported as a zip file and imported into a new environment, while a Cloud flow can be exported and imported as zip files. Dataverse objects use Solutions as a packaging tool, which can also be exported as a zip file and imported into a new environment.

There are different ways of exporting your apps and flows to move them to a new environment. Solutions are a single file that can include nearly anything your makers build in Microsoft Power Platform and move them together.  Canvas apps and cloud flows can be exported directly.

Over time, Microsoft Power Platform objects have evolved to be solution aware. Now apps and flows can be solution aware by default, though this requires manual activation. Makers could still create apps and flows from make.powerapps.com and make.powerautomate.com, which can be classified as non-Solution aware, and these can be exported individually, or add them to a solution. By adding to a Solution, the maker can take advantage of Environment variables and Connection references to configure and deploy endpoints across environments.

The goal is to have all Microsoft Power Platform components added to a single Solution, which allows multiple components to be easily moved as a single unit between environments.

### Common questions about solutions**

#### Can I make existing objects solution aware?

Yes, with the guidance provided in the sections following you'll understand the different options available.

#### I'm building an app using non-Premium connectors. Can I still use Solutions?

Yes, you can still use solutions in a Dataverse enabled environment. The app and connection references can all be part of a one solution package. This helps to move the app into a new environment. You can iterate the development of the app in a Developer environment and deploy it to the downstream environments simply by exporting the solution and importing it into the target environment. Also, the Solutions zip file can be stored in the file repository for future reference and works as a back-up and restore purposes.

## Definitions

### Default Environment

A single default environment is automatically created by Power Apps for each tenant and shared by all users in that tenant. Whenever a new user signs up for Power Apps, they're automatically added to the Maker role of the default environment. No users are automatically added to the Environment Admin role of the default environment. The default environment is created in the region closest to the default region of the Azure AD tenant and is named as follows: "{Azure AD tenant name} (default)".

You can't delete the default environment. You can't manually back up the default environment; system backups are done continuously.

The default environment is limited to 1 TB of storage capacity. To store more data, you can create a production environment. The default environment has the following:

3 GB Dataverse Database Capacity

3 GB Dataverse File Capacity

1 GB Dataverse Log Capacity

The capacity check conducted prior to creating new environments exclude the default environment's included storage capacity when calculating whether you have sufficient capacity to create a new environment.

### Managed Environment

Managed Environments is a suite of capabilities that allows admins to manage Microsoft Power Platform at scale with more control, less effort, and more insights. Admins can use Managed Environments with any type of environment except the developer environments.

Managed Environments is included as an entitlement in standalone Power Apps, Power Automate, Power Virtual Agents, Power Pages, and Dynamics 365 licenses that give premium usage rights. When Managed Environments is activated in an environment, every app, Power Automate flow, Power Virtual Agents bot, and Power Pages website in that environment requires standalone licenses for accessing respective resources. For example:

Every user running an app in a managed environment must have a Power Apps per user or per app license or a Dynamics 365 license that gives premium Power Apps usage rights.

Every user running a Power Automate cloud flow in a managed environment must have a standalone Power Automate per user license, a Power Automate per flow license, or a Dynamics 365 license with premium Power Automate usage rights. Power Automate cloud flows that are triggered within apps or in context of apps or chatbots are covered by the respective Power Apps or Power Virtual Agents standalone licenses.

### Solutions

Solutions are the mechanism for implementing ALM in Power Apps and other Microsoft Power Platform products, such as Power Automate. Solutions are used to transport apps and objects from one environment to another or to apply a set of customizations to existing apps. A solution can contain one or more apps and other objects such as site maps, tables, processes, web resources, choices, flows, and more.

### Environment Variables in a solution

Environment variables enable the basic ALM scenario of moving an application between Microsoft Power Platform environments. Environment variables store the parameter keys and values, which then serve as input to various other application objects. Separating the parameters from the consuming objects allows you to change the values within the same environment or when you migrate solutions to other environments.

In this scenario, the applications stay the same except for some key external application references (such as tables, connections, and keys) that are different between the source environment and the destination environment. The applications require the structure of the tables or connections to be the same between the source and the destination environments, with some differences. Environment variables allow you to specify which of these different external references should be updated as the application is moved across environments.

Benefits of using environment variables:

Provide new parameter values while **importing solutions** to other environments.

Store configuration for the **data sources** used in canvas apps and flows. For example, SharePoint Online site and list parameters can be stored as environment variables; therefore, allowing you to connect to different sites and lists in different environments without needing to modify the apps and flows.

Package and transport your customization and configuration together and manage them in a single location.

Package and transport secrets, such as credentials used by different objects, separately from the objects that use them.

One environment variable can be used across many different solution objects - whether they're the same type of component or different. For example, a canvas app and a flow can use the same environment variable. When the value of the environment variable needs to change, you only need to change one value.

Additionally, if you need to retire a data source in production environments, you can simply update the environment variable values with information for the new data source. The apps and flows don't require modification and will start using the new data source.

The environment variables can be unpacked and stored in source control. You may also store different environment variables values files for the separate configuration needed in different environments. Solution Packager can then accept the file corresponding to the environment the solution will be imported to.

## Connection References in a solution

A connection is a proxy or a wrapper around an API that allows the underlying service to talk to Microsoft Power Automate, Microsoft Power Apps, and Azure Logic Apps. It provides a way for users to connect their accounts and use a set of prebuilt actions and triggers to build their apps and workflows.

A connection reference is a solution component that contains information about a connector. Both canvas app and operations within a Power Automate flow bind to a connection reference. You can import your connection reference into a target environment with no further configuration needed after the import is completed. To change a specific connection associated with a canvas app or flow, you edit the connection reference component within the solution.

## Reference Links

The material below has been referenced as part of this paper.

[Blog Post - ALM at scale automation capabilities - Casey Burke](https://powerapps.microsoft.com/en-us/blog/alm-at-scale-new-features-and-automation-capabilities/)

[Blog | Connection References with ALM – Scott Durrow](https://www.develop1.net/public/post/2021/04/01/connection-references-with-alm-mind-the-gap)

[Solutions in Power Apps - Power Apps | Microsoft Learn](/power-apps/maker/data-platform/solutions-overview)

[Migrate an environment to a different tenant - Power Platform | Microsoft Learn](/power-platform/admin/move-environment-tenant?tabs=image)

[Connection references in solutions - Power Apps | Microsoft Learn](/power-apps/maker/data-platform/create-connection-reference)

[Use environment variables in solutions - Power Apps | Microsoft Learn](/power-apps/maker/data-platform/environmentvariables)

[Managed Environments Licensing - Power Platform | Microsoft Learn](/power-platform/admin/managed-environment-licensing)

[The Default Environment overview - Power Platform | Microsoft Learn](/power-platform/admin/environments-overview)

[Automatic cleanup of inactive environments - Power Platform | Microsoft Learn](/power-platform/admin/automatic-environment-cleanup)

[Overview - Power Virtual Agents | Microsoft Learn](/power-virtual-agents/fundamentals-what-is-power-virtual-agents)

[Administration mode - Power Platform | Microsoft Learn](/power-platform/admin/admin-mode)

[Application lifecycle management (ALM) basics with Microsoft Power Platform - Power Platform | Microsoft Learn](/power-platform/alm/basics-alm)

[Solution concepts - Power Platform | Microsoft Learn](/power-platform/alm/solution-concepts-alm)

[Build tool tasks - Power Platform | Microsoft Learn](/power-platform/alm/devops-build-tool-tasks)

[Overview of Power Platform Pipelines (preview) - Power Platform | Microsoft Learn](/power-platform/alm/pipelines)

[Manage solutions using PowerShell - Power Platform | Microsoft Learn](/power-platform/alm/powershell-api)

[Get started using the Dataverse package deployment module | Microsoft Learn](/powershell/powerapps/get-started-packagedeployment)

[Move configuration data across organizations - Power Platform | Microsoft Learn](/power-platform/admin/manage-configuration-data)

[Dataverse development tools (Microsoft Dataverse) - Power Apps | Microsoft Learn](/power-apps/developer/data-platform/download-tools-nuget)

[Microsoft Power Platform CLI - Power Platform | Microsoft Learn](/power-platform/developer/cli/introduction)

[Establishing a DLP strategy - Microsoft Power Platform - Power Platform | Microsoft Learn](/power-platform/guidance/adoption/dlp-strategy)
