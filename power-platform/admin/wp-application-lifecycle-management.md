---
title: "Application Lifecycle Management  | MicrosoftDocs"
description: Application Lifecycle Management.
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/27/2018
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Application Lifecycle Management

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Application Lifecycle Management (ALM) is important as the applications your organization builds becomes more complex and as more of your company depends on their stability. In other sections we discussed some of the ALM building blocks that just happen such as versioning of PowerApps canvas apps. We also covered some of the self-service actions that makers can do such as exporting and importing their Common Data Service solutions. In this section we are going to have a more cohesive discussion about ALM bringing together some of these individual concepts and using them to handle more complex scenarios.

Let’s look first at things you should consider as an administrator to consider to help guide the application through its lifecycles from new to production and then ongoing maintenance and enhancements. For purposes of this section, application refers to the whole set of components form PowerApps canvas or model-driven apps, flows and any Common Data Service customizations.

|New Applications  |Existing Applications being upgraded  |
|---------|---------|
|Who is the application owner, and who is involved in maintaining it?     | Are any new connectors being used by the application?        |
|Who are the users of the apps? Are they already licensed?     | Is there any new reference data to update?        |
|What environment did you build the app in?     | Are there any new Canvas, Flows or Common Data Service solutions added in this update?        |
|Are there any PowerApps canvas or model-driven apps as part of the application?     | Any changes to how users are assigned security roles?        |
|Are there any flows?     | Any impact on existing Common Data Service data?        |
|What connectors are the apps using?     |Any changes in the required licenses?         |
|Does anything require an on-premises gateway?     | Potentially any of the considerations from the New Application column, if it was not a consideration at the time.       |
|Does the application use Common Data Service entities?     |         |
|Is the application dependent on any other existing applications or external services?     |         |
|Are there different security roles for different types of users?     |         |
|Is there any existing data that must be migrated into the new production system?     |         |
|Does the application have reference data that needs to be in the production environment?     |         |
|Who will be testing the application? Will it be in a separate environment?     |         |
|How will users report problems or enhancements?     |         |
|How frequently do you plan to do updates?     |         |

The answers to these questions will help you put together an application profile and decide how best to support the team with deploying the application. This is not an exhaustive list, but a starting point for you to develop your own set of questions for applications.

## Getting ready for a new application

Armed with the above information, consider each of the following as you get ready to deploy the new application:

- Licensing – acquire licenses and assign them for users
- Azure AD Group – consider if having a group that had all the app users would help with sharing the applications with them (good for canvas apps)
- Environments – if necessary create the new environments, considering how the application will be tested prior to production deployment
- Data Loss Prevention policies – do current ones support the app? Are new ones needed?
- Automation – is there any automation that would help with ongoing app administration?

## Tools to help Manage, Plan, Track, and Deploy

Depending on the complexity of the application, anything from using a SharePoint List to track work to be done and new features, and a OneDrive to store exported assets to a more complete solution like Visual Studio Team Services can help add some structure to your application life cycle process. What is appropriate for your organization depends on the size and maturity of the team that is building the overall application. The less technical will probably find a solution like OneDrive and SharePoint more approachable. Visual Studio Team Services (VSTS) has several features that are tailored to support application lifecycle management. VSTS is also free to get started
https://visualstudio.microsoft.com/team-services/. The following are some of those features:

- Work item planning and tracking
- Version control – offers a way to store exported assets – using Dynamics 365 SDK tools like Solution Packager allows this to scale up to larger teams working on Common Data Service Solution package customizations.
- Build and release automation – This can be helpful for automating everything from exporting of Common Data Service solutions for backup, to compiling developer-built components. The release automation can take solutions and developer assets and coordinate deploying to test and production environments. These deployments can also leverage approval checkpoints as appropriate. Using community tools like Xrm.CI.Framework https://marketplace.visualstudio.com/items?itemName=WaelHamze.xrm-ci-framework-build-tasks you can deploy Common Data Service solution packages from the release tasks.

The following is an example of the Team Status Dashboards that gives the team an all up view of their progress.

> [!div class="mx-imgBorder"] 
> ![](media/team-status-dashboard.png "Team Status Dashboard")

## Exporting from the source environment

We’ve already covered the concept of exporting from PowerApps, Flow and Common Data Service earlier in the document. Let’s look at some additional things to consider when exporting as part of an application lifecycle management process.

- Always save a copy of the exported PowerApp, Microsoft Flow or Common Data Service solution file.
- For Common Data Service Solutions make sure if you are publishing a managed solution, that you also export an unmanaged solution as well. If you are not familiar with the differences, we cover that in the Platform Architecture section.
- For Common Data Service solution export you should always perform a publish on the solution or publish all for all solutions prior to export to ensure all changes are exported as expected.
- For Flows and canvas apps review the connectors that are used. Any custom connectors will need to be re-created prior to import in the target environment.

## Importing into the target environment

We also covered import, but let’s look at a few more things to consider.

- Always evaluate what is already in the target environment.
- Create any necessary custom connectors prior to import
- If you are importing a Common Data Service solution that is dependent on other Common Data Service solutions make sure those are already imported into the Common Data Service environment
- If you import an unmanaged Common Data Service solution make sure you publish all after import has completed
- Remember when you import an update to a PowerApps canvas application you must publish the new version before others will see it
- If you are importing Common Data Service changes that remove any entities and data, consider a proactive on demand backup prior to the import.

## Updating existing applications

Shown earlier, the import feature allows the maker to update an existing app in the target environment. Here are some considerations.

- Custom connectors updates must be performed first, as your app may rely on new data definitions.
- Custom connector updates may take a few minutes to be reflected in the portal. During that time, new operations may return a 404 error when invoked.
- If extensive changes are being made, consider creating a new custom connector and leaving the old connector intact. This can also be beneficial in the event the maker needs to roll back, as the previous version of the app will use the old (existing) connector.
- PowerApps uses caching for the web and mobile clients, so changes may not be immediate. For the web client, be sure to clear your cache to see the new changes. On the mobile client, swipe down to refresh app metadata.

## Ongoing application maintenance

Once your application has been deployed you can mostly go into maintenance mode responding to user inquires as needed. Here are a few things to consider while you are between updates.

- PowerApps canvas applications need to be periodically republished for best performance and stability. About every six months you should re-publish your deployed PowerApps canvas applications even if they haven’t changed. This ensures the application picks up the latest runtime changes in the environments.
- Keep an eye on your Common Data Service environment storage usage as well as your Flow quotas and adjust resources and licensing as needed.

## Retiring and removing an application

As your organization evolves it’s likely one or more of the applications deployed will no longer be needed. In this section we will walk through some of the things to consider when retiring an application.

- Confirm that if there are users they understand the shutdown. Consider shutdown notifications in advance to ensure business continuity and minimize impact
- Removing access to the application components is often a good first step. Leaving it in this state for a period of time also helps to ensure users know and have a chance to argue their case or save any data needed.
- Deleting an environment will remove all associated PowerApps, Flows and Common Data Service data. This is not the approach to take if you have multiple applications sharing the environment and you are just retiring a single application.
- PowerApps canvas apps and Flows can usually be removed without lots of dependency considerations. Currently it is necessary to remove these one at a time even if you imported both a PowerApp canvas app and a Flow at the same time. The connections for these will not be removed automatically.
- When removing connections, you need to first consider the PowerApps canvas apps and Flows that might still be using them. This can be checked by looking at what is associated with the connection prior to deleting.
- Custom connections are sometimes better to be left if they might be reused later as they would require extra effort to re-establish in the future.
- To remove a PowerApps model-driven app depends if the Common Data Service solution containing it was installed as managed or unmanaged. If it was installed as unmanaged you can delete the application module to remove it from users. Removing unmanaged Common Data Service solution components requires manually removing one item at a time from the environment. Removing the Common Data Service solution itself in this situation only removes the container and not the components. This is one of the key benefits of managed solution is the ability to uninstall them as a unit.
- If the solution installed is managed, you would uninstall/remove the Common Data Service solution containing it from the environment. When you remove the Common Data Service solution that contains that application it’s important to note that also removes any other components and data as well. If only desiring to remove the application best approach would be to remove the application in the development environment for that Common Data Service solution and then import the update in using the Stage for Upgrade option on import. This will cause only that component to be removed leaving all other components and data intact.

## Moving reference data to another environment

Often applications have data that is configuration, or reference data. This could be, for example, a list of territories, product lists, or other data that configures and makes the app work. Often components in the application take dependencies on the IDs of this data. The Configuration Migration Tool is designed to move this type of data from one Common Data Service environment to another. The key features of the tool are:

- Select only the entities and fields you for which you want to move data
- Maintain unique IDs of the records as they are moved
- Avoid duplicate records by defining a uniqueness condition for each entity based on combination of fields
- Support updating of existing records
- Ability to define a schema for what data is moved and use it over and over.

The following outlines the basic process for using the tool.

> [!div class="mx-imgBorder"] 
> ![](media/moving-reference-data.png "Moving reference data")

The output from the tool is a zip file containing the data and the schema file. The same tool can be used to import the data into the target Common Data Service environment. You can also package the data with a Solution Deployer package that we will discuss shortly allowing it to be deployed alongside one or more Common Data Service solutions. You can read more about how to use the tool here https://docs.microsoft.com/dynamics365/customer-engagement/admin/manage-configuration-data.

## Using the Dynamics 365 Package Deployer

So far, we’ve only talked about importing Common Data Service solutions manually via the user interface. The Dynamics 365 package deployer also works for Common Data Service solutions. The package deployer allows building a package that contains one or more Common Data Service solutions as well as one or more data files to import after the solutions are imported. It is also possible for developers to build custom code that reacts to events from the package deployment process. This code can be used to handle updates to the target environment. Once the package is built, the package can be deployed interactively via the tool, or by command line using PowerShell. You can read more about package deployer here https://docs.microsoft.com/dynamics365/customer-engagement/developer/create-packages-package-deployer.






