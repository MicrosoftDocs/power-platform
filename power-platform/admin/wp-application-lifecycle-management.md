---
title: "Application Lifecycle Management  | MicrosoftDocs"
description: Application Lifecycle Management.
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/27/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Application Lifecycle Management

Application Lifecycle Management (ALM) is important as the applications your organization builds becomes more complex and as more of your company depends on their stability. In other parts of the paper we discussed some of the ALM building blocks that just happen such as versioning of Power Apps canvas apps or versioning regarding solutions. We also covered some of the self-service actions that makers can do such as exporting and importing their Common Data Service solutions. In this section we are going to have a more cohesive discussion about ALM bringing together some of these individual concepts and using them to handle more complex scenarios.

ALM is not a one size fits all concept, it can vary from organization to organization and even within based on the type of solution being built. If you were to look at a typical mission critical solution the following is a good health check of your current Power Platform ALM maturity:

- Are you deploying managed solutions? Managed solutions are how Microsoft intends for solutions to be deployed to environments beyond development. All ALM tooling and solution features from Microsoft to support deployment will be targeted towards this goal.
- Are your development environments single purpose? As much as capacity allows you should try to have individual development environments for each solution. This ensures you don’t get cross solution contamination.
- Are your development environments disposable? You should at any point in time be able to easily re-create the development environment. This could be due to someone making corrupting changes or just because you finished development and deleted the old environment and now you’re ready to build V2 of the solution. The key to success here is having the unmanaged solution and any dependent managed solutions to import to re-create the environment. Don’t forget any reference data that might be needed. Ideally, these assets are stored in source control as we will discuss next.
- Is source control/Version control your definitive source of truth? Using a tool like Azure Dev Ops Git repos or another source/version control to track your solution assets allows tracking changes made and by who across releases. While you can check in the whole solution file, this works best in combination with Solution Packager which shards out to a source control friendly and readable format. This also enables you to quickly re-create your dev environment or deploy to production since the solution assets come from the source control repo ensuring a consistent process.
- Are you using Solution Packager? Solution Packager allows taking a solution file and breaking it down into individual files for each solution component. This allows what you check into source control to be traced at a very granular level and helps avoid conflicts with multiple people checking in changes. Solution Packager is also how you take individual files from source control and re-package them for managed solution deployment to other environments like test and production.
- Can you service (bug fix) production while working on your next version? A key concept of a healthy ALM practice is not making changes in test or production. By having a good source control and environment strategy you can ensure your dev – test – production release pipeline stays viable even while you are working on the next version.
- Do you have automated ALM? While all of the above can be done manually, having an automated repeatable process is ideal. Using the tooling like Power Apps build tools that we will discuss later with Azure Dev Ops much of the ALM process can be automated including the approvals to progress through the release pipeline.

Use the above ALM health check to measure where you are in your goal of having healthy ALM practices for your solutions.

Next, let’s look at some of the things you should consider as an administrator to consider helping guide the application through its lifecycles from new to production and then ongoing maintenance and enhancements. For purposes of this section, application refers to the whole set of components from Power Apps canvas or model-driven apps, workflows and any Common Data Service customizations.

|New Applications  |Existing Applications being upgraded  |
|---------|---------|
|Who is the application owner, and who is involved in maintaining it?     | Are any new connectors being used by the application?        |
|Who are the users of the apps? Are they already licensed?     | Is there any new reference data to update?        |
|What environment did you build the app in?     | Are there any new Canvas, Power Automate flows or Common Data Service solutions added in this update?        |
|Are there any Power Apps canvas or model-driven apps as part of the application?     | Any changes to how users are assigned security roles?        |
|Are there any flows?     | Any impact on existing Common Data Service data?        |
|What connectors are the apps using?     |Any changes in the required licenses?         |
|Does anything require an on-premises gateway?     | Potentially any of the considerations from the New Application column, if it was not a consideration at the time.       |
|Does the application use Common Data Service entities?     | Are there any ALM automation that is needed?    |
|Is the application dependent on any other existing applications or external services?     |         |
|Are there different security roles for different types of users?     |         |
|Is there any existing data that must be migrated into the new production system?     |         |
|Does the application have reference data that needs to be in the production environment?     |         |
|Who will be testing the application? Will it be in a separate environment?     |         |
|How will users report problems or enhancements?     |         |
|How frequently do you plan to do updates?     |         |
| How will ALM be handled? |    |

The answers to these questions will help you put together an application profile and decide how best to support the team with deploying the application. This is not an exhaustive list, but a starting point for you to develop your own set of questions for applications.

## Getting ready for a new application

Armed with the above information, consider each of the following as you get ready to deploy the new application:

- Licensing – acquire licenses and assign them for users.
- Azure AD Group – consider if having a group that had all the app users would help with sharing the applications components with them. In fact, you might find having a few groups with subsets of the overall application users allows sharing with just the right subset that needs the components.
- Environments – if necessary, create new environments, considering how the application will be tested prior to production deployment.
- Data Loss Prevention policies – do current ones support the app? Are new ones needed? Do you need to adjust for how the application components are using connectors?
- Automation – is there any automation that would help with ongoing app administration?

## Tools to help Manage, Plan, Track, and Deploy

Depending on the complexity of the application, anything from using a SharePoint List to track work to be done and new features, and a OneDrive to store exported assets to a more complete solution like Visual Studio Team Services can help add some structure to your application life cycle process. What is appropriate for your organization depends on the size and maturity of the team that is building the overall application. The less technical will probably find a solution like OneDrive and SharePoint more approachable. Visual Studio Team Services (VSTS) has several features that are tailored to support application lifecycle management. VSTS is also free to get started. See [Azure DevOps](https://visualstudio.microsoft.com/team-services/). The following are some of those features:

- Work item planning and tracking
- Version control – offers a way to store exported assets – using SDK tools like Solution Packager allows this to scale up to larger teams working on Common Data Service Solution package customizations. For more details, review [SolutionPackager tool](https://docs.microsoft.com/powerapps/developer/common-data-service/compress-extract-solution-file-solutionpackager).
- Build and release automation – this can be helpful for automating everything from exporting of Common Data Service solutions for backup, to compiling developer-built components. The release automation can take solutions and developer assets and coordinate deploying to test and production environments. These deployments can also leverage approval checkpoints as appropriate. Microsoft has released a preview of Power Apps build tool that include a number of Azure DevOps tasks for automating deployment of Common Data Service solutions. There are also community tools like [Xrm.CI.Framework](https://marketplace.visualstudio.com/items?itemName=WaelHamze.xrm-ci-framework-build-tasks) with which you can deploy Common Data Service solutions.

The following is an example of the Team Status Dashboards that gives the team an all up view of their progress.

> [!div class="mx-imgBorder"] 
> ![](media/team-status-dashboard.png "Team Status Dashboard")

## Exporting from the source environment

We’ve already covered the concept of exporting from Power Apps, Power Automate, and Common Data Service earlier in the document. Let’s look at some additional things to consider when exporting as part of an application lifecycle management process.

- Always save a copy of the exported Power Apps canvas app, Power Automate or Common Data Service solution file.
- For Common Data Service solutions make sure if you are publishing a managed solution, that you also export an unmanaged solution as well. 
- For Common Data Service solution export you should always perform a publish on the solution or publish all for all solutions prior to export to ensure all changes are exported as expected. You should also when possible run Solution checker to ensure there are no problems identified.
- For workflows and canvas apps review the connectors that are used. Any custom connectors will need to be re-created prior to import in the target environment or must be included in the Common Data Service solution.

## Importing into the target environment

We also covered import, but let’s look at a few more things to consider.

- Always evaluate what is already in the target environment.
- Create any necessary custom connectors prior to import.
- If you are importing a Common Data Service solution that is dependent on other Common Data Service solutions make sure those are already imported into the Common Data Service environment.
- If you import an unmanaged Common Data Service solution make sure you publish all after import has completed.
- Remember when you import an update to a Power Apps canvas application you must publish the new version before others will see it.
- If you are importing Common Data Service changes that remove any entities and data, consider a proactive on demand backup prior to the import.

## Updating existing applications

Shown earlier, the import feature allows the maker to update an existing app in the target environment. Here are some considerations.

- Custom connectors updates must be performed first, as your app may rely on new data definitions.
- Custom connector updates may take a few minutes to be reflected in the portal. During that time, new operations may return a 404 error when invoked.
- If extensive changes are being made, consider creating a new custom connector and leaving the old connector intact. This can also be beneficial in the event the maker needs to roll back, as the previous version of the app will use the old (existing) connector.
- Power Apps uses caching for the web and mobile clients, so changes may not be immediate. For the web client, be sure to clear your cache to see the new changes. On the mobile client, swipe down to refresh app metadata.

## Ongoing application maintenance

Once your application has been deployed you can mostly go into maintenance mode responding to user inquires as needed. Here are a few things to consider while you are between updates.

- Power Apps canvas applications need to be periodically republished for best performance and stability. About every six months you should re-publish your deployed Power Apps canvas applications even if they haven’t changed. This ensures the application picks up the latest runtime changes in the environments.
- Keep an eye on your Common Data Service environment storage usage as well as your API quotas and adjust resources and licensing as needed.

## Retiring and removing an application

As your organization evolves it’s likely one or more of the applications deployed will no longer be needed. In this section we will walk through some of the things to consider when retiring an application.

- Confirm that if there are users, they understand the shutdown. Consider shutdown notifications in advance to ensure business continuity and minimize impact.
- Removing access to the application components is often a good first step. Leaving it in this state for a period of time also helps to ensure users know and have a chance to argue their case or save any data needed.
- Deleting an environment will remove all associated Power Apps, workflows and Common Data Service data. This is not the approach to take if you have multiple applications sharing the environment and you are just retiring a single application.
- When removing connections, you need to first consider the Power Apps canvas apps and workflows that might still be using them. This can be checked by looking at what is associated with the connection prior to deleting.
- Custom connections are sometimes better to be left if they might be reused later as they would require extra effort to re-establish in the future.
- To remove a Power Apps model-driven app depends if the Common Data Service solution containing it was installed as managed or unmanaged. If it was installed as unmanaged you can delete the application module to remove it from users. Removing unmanaged Common Data Service solution components requires manually removing one item at a time from the environment. Removing the Common Data Service solution itself in this situation only removes the container and not the components. This is one of the key benefits of managed solution is the ability to uninstall them as a unit.
- If the solution installed is managed, you would uninstall/remove the Common Data Service solution containing it from the instance. When you remove the Common Data Service solution that contains that application it’s important to note that also removes any other components and data as well. If only desiring to remove the application best approach would be to remove the application in the development environment for that Common Data Service solution and then import the update in using the Stage for Upgrade option on import. This will cause only that component to be removed leaving all other components and data intact.

## Moving reference data to another environment

Often applications have data that is configuration, or reference data. This could be, for example, a list of territories, product lists, or other data that configures and makes the app work. Often components in the application take dependencies on the IDs of this data. The Configuration Migration Tool is designed to move this type of data from one Common Data Service environment to another. The key features of the tool are:

- Select only the entities and fields you for which you want to move data.
- Maintain unique IDs of the records as they are moved.
- Avoid duplicate records by defining a uniqueness condition for each entity based on combination of fields.
- Support updating of existing records.
- Ability to define a schema for what data is moved and use it over and over.

The following outlines the basic process for using the tool.

> [!div class="mx-imgBorder"] 
> ![](media/moving-reference-data.png "Moving reference data")

The output from the tool is a zip file containing the data and the schema file. The same tool can be used to import the data into the target Common Data Service environment. You can also package the data with a Solution Deployer package that we will discuss shortly allowing it to be deployed alongside one or more Common Data Service solutions. More information: [Move configuration data across environments](https://docs.microsoft.com/power-platform/admin/manage-configuration-data).

## Using the Package Deployer

So far, we’ve only talked about importing Common Data Service solutions manually via the user interface. The package deployer also works for Common Data Service solutions. The package deployer allows building a package that contains one or more Common Data Service solutions as well as one or more data files to import after the solutions are imported. It is also possible for developers to build custom code that reacts to events from the package deployment process. This code can be used to handle updates to the target environment. Once the package is built, the package can be deployed interactively via the tool, or by command line using PowerShell. More information: [Create packages for the Package Deployer](https://docs.microsoft.com/powerapps/developer/common-data-service/package-deployer/create-packages-package-deployer)







