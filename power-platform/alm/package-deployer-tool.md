---
title: "Create packages for the Package Deployer tool"
description: "Learn about migrating configuration data, solutions, and more from one environment to another."
keywords: 
author: marcelbf
ms.author: marcelbf
ms.subservice: alm
ms.date: 07/10/2025
ms.reviewer: pehecke
ms.topic: how-to
search.audienceType: 
  - developer
---

# Create packages for the Package Deployer tool

Package Deployer lets administrators deploy packages on Microsoft Dataverse instances. A Package Deployer *package* can consist of any or all of the following:  

- One or more Dataverse solution files.  
- Flat files or exported configuration data file from the Configuration Migration tool. For more information about the tool, see  [Move configuration data across instances and organizations with the Configuration Migration tool](../admin/manage-configuration-data.md).  
- Custom code that can run before, while, or after the package is deployed to the Dataverse instance.  
- HTML content specific to the package that can display at the beginning and end of the deployment process. This content can be useful to provide a description of the solutions and files that are deployed in the package.

> [!NOTE]
> There is another package type called a *plug-in package*. That kind of package is for plug-in dependent assemblies and has no relationship with Package Deployer packages.

## Prerequisites  

- Ensure that you have all the solution and other files ready that you want to include in the package.  
- Visual Studio 2019 or later, or Visual Studio Code.

## Process overview  

To create a Package Deployer package, perform the following steps.
> [!div class="checklist"]
>
> - Create a Visual Studio or MSBuild project
> - Add solutions and other files to the project  
> - Update provided HTML files (optional)
> - Specify configuration values for the package
> - Define custom code for the package
> - Build and deploy the package

These steps are described in detail in this article.

## Create a package project

The first step is to create a Visual Studio or MSBuild project for the package. To do that, you must have one of two available tool extensions installed on your development computer. If using Visual Studio Code, install [Microsoft Power Platform CLI](../developer/cli/introduction.md#install-microsoft-power-platform-cli). Otherwise, if using Visual Studio 2019 or later, install [Power Platform tools for Visual Studio](/power-apps/developer/data-platform/tools/devtools-install).

Select the appropriate tab below to find out how to create a project using the desired tool extension. Both tools output the project in a similar format.

### [Power Platform CLI](#tab/cli)

Run the [pac package init](../developer/cli/reference/package.md#pac-package-init) command to create the initial package. More information: [pac package](../developer/cli/reference/package.md)

```bash
pac package init help
pac package init --outputDirectory DeploymentPackage
```

The resulting CLI output contains the folders and files shown below. The "DeploymentPackage" folder name was used here as an example.

```bash
C:.
└───DeploymentPackage
    │   DeploymentPackage.csproj
    │   PackageImportExtension.cs
    │
    └───PkgAssets
            ImportConfig.xml
            manifest.ppkg.json
```

In the created project, find the ImportConfig.xml configuration file in the PkgAssets folder and the PackageImportExtension.cs file. You'll modify these files as described later in this article.

### [Power Platform tools](#tab/pptools)

You can create a Visual Studio project using the Power Platform Solution Template and later add a package project using the Power Platform Package Deployment Project template, or create a project directly using the Power Platform Package Deployment Project template.

:::image type="content" source="media/pptools-add-package-project.png" alt-text="Add a package project.":::

> [!NOTE]
> Do not choose the Power Platform Package template. That template is for plug-in packages.

The resulting Visual Studio solution and project contains the folders and files shown below. The "Deployment-package" name was used here as an example. The contents of the Content folder isn't shown here for brevity.

```bash
C:.
│   Deployment-package.csproj
│   Deployment-package.sln
│   GettingStarted.html
│   PackageTemplate.cs
│
├───PkgFolder
│   │   ImportConfig.xml
│   │
│   └───Content
```

In the created project, find the ImportConfig.xml configuration file in the PkgFolder folder and the PackageTemplate.cs file. You'll modify these files as described later in this article.

More information about using the Power Platform tools extension: [Quickstart: Create a Power Platform Tools project](/power-apps/developer/data-platform/tools/devtools-create-project)

---

## Add package files

After you have created a package project, you can begin adding solutions and other files to that project.

### [Power Platform CLI](#tab/cli)

When using the CLI, you can add external packages, solutions, and references to your package project using one of the **add** subcommands. Enter `pac package help` to see the list of subcommands. Let's add a solution to our package.

```bash
> pac package add-solution help

Commands:
Usage: pac package add-solution --path [--import-order] [--skip-validation] [--publish-workflows-activate-plugins] [--overwrite-unmanaged-customizations] [--import-mode] [--missing-dependency-behavior] [--dependency-overrides]

> cd .\DeploymentPackage\
> pac package add-solution --path ..\TestSolution_1_0_0_1_managed.zip

The item was added successfully.
```

### [Power Platform tools](#tab/pptools)

1. In the **Solutions Explorer** pane, add your Dataverse solutions and other files under the **PkgFolder** folder. HTML files belong under the **Content** folder. More about this HTML content later.
2. For each file that you add, in the **Properties** pane, set the **Copy to Output Directory** value to **Copy Always**.  Setting this value ensures that your files are available in the generated package.

Next, update the HTML language specific files.  

1. In the **Solution Explorer** pane, expand **PkgFolder** > **Content** > **en-us**. Find two folders called `EndHTML` and `WelcomeHTML`. These folders contain the  HTML and associated files that enable you to display (to the user) information at the end and beginning of the package deployment process. Edit the files in the HTML folder of these folders to add information to display for your package.

2. You can also add the HTML files in your package in other languages so that the content in the HTML appears in the language based on the locale settings of the user's computer. To do so:  

    1. Create a copy of the **en-us** folder under **PkgFolder** > **Content**.  
    2. Rename the copied folder to the appropriate language. For example, for the Spanish language, rename it to **es-ES**.  
    3. Modify the content of the HTML files to add Spanish content.

---

## Configure the package  

Define the package configuration by adding information about your package in the **ImportConfig.xml** file in the project. Refer to [ImportConfig Reference](importconfig-reference.md) for an example and descriptions of the valid elements and attributes to use.

## Add custom code  

You can add custom code that executes before, during, and after the package is imported into an environment. To do so, follow these instructions.

1. Edit the **PackageTemplate.cs** (or **PackageImportExtension.cs**) file in the project's root folder.  

2. In the C# file, you can:  

   1. Enter custom code to execute when the package is initialized in the override method definition of `InitializeCustomExtension`.  

       This method can be used to let users use the runtime parameters while running a package. As a developer, you can add support for any runtime parameter to your package by using the <xref:Microsoft.Xrm.Tooling.PackageDeployment.CrmPackageExtentionBase.IImportExtensions2.RuntimeSettings> property as long as you have code to process it based on the user input.  

       For example, the following sample code enables a runtime parameter called `SkipChecks` for the package that has two possible values: true or false. The sample code checks if the user has specified any runtime parameters while running Package Deployer (either by using the command line or PowerShell), and then accordingly processes the information. If no runtime parameter is specified by the user while running the package, the value of the <xref:Microsoft.Xrm.Tooling.PackageDeployment.CrmPackageExtentionBase.IImportExtensions2.RuntimeSettings> property will be null.  

      ```csharp  
      public override void InitializeCustomExtension()  
      {
        // Validate the state of the runtime settings object.  
        if (RuntimeSettings != null)  
        {  
            PackageLog.Log(string.Format("Runtime Settings populated.  Count = {0}",
                RuntimeSettings.Count));  
            foreach (var setting in RuntimeSettings)  
            {  
                PackageLog.Log(string.Format("Key={0} | Value={1}", setting.Key, 
                    setting.Value.ToString()));  
            }  

            // Check to see if skip checks is present.  
            if ( RuntimeSettings.ContainsKey("SkipChecks") )  
            {  
                bool bSkipChecks = false;  
                if (bool.TryParse((string)RuntimeSettings["SkipChecks"], out bSkipChecks))  
                    OverrideDataImportSafetyChecks = bSkipChecks;  
            }  
        }  
        else
        {
            PackageLog.Log("Runtime Settings not populated");
        }  
      } 
      ```  

       This code enables the administrator use the command line or the [Import-CrmPackage](/powershell/module/microsoft.xrm.tooling.packagedeployment/import-crmpackage) cmdlet to specify whether to skip the safety checks while running the Package Deployer tool to import the package. More information: [Deploy packages using Package Deployer and Windows PowerShell](../admin/deploy-packages-using-package-deployer-windows-powershell.md)  

   2. Enter custom code to execute before the solutions are imported in  the override method definition of `PreSolutionImport` to specify whether to maintain or overwrite customizations while updating the specified solution in a target Dataverse instance, and whether to automatically activate plug-ins and workflows.  

   3. Use the override method definition of `RunSolutionUpgradeMigrationStep` to perform data transformation or upgrade between two versions of a solution This method is called only if the solution you're importing is already present in the target Dataverse instance.  

        This function expects the following parameters:  

        |    Parameter    |            Description             |
        |-----------------|------------------------------------|
        | `solutionName`  |        Name of the solution        |
        |  `oldVersion`   | Version number of the old solution |
        |  `newVersion`   | Version number of the new solution |
        | `oldSolutionId` |     GUID of the old solution.      |
        | `newSolutionId` |     GUID of the new solution.      |

   4. Override the method `OverrideSolutionImportDecision` to return a [UserRequestedImportAction](/dotnet/api/microsoft.xrm.tooling.packagedeployment.crmpackageextentionbase.userrequestedimportaction) enum controlling whether the import of a solution will be skipped, updated or upgraded (the default).

      ```csharp
      public override UserRequestedImportAction OverrideSolutionImportDecision(
        string solutionUniqueName, Version organizationVersion,
        Version packageSolutionVersion, Version inboundSolutionVersion,
        Version deployedSolutionVersion, ImportAction systemSelectedImportAction )
      {
        return systemSelectedImportAction == 
            ImportAction.Import ? UserRequestedImportAction.ForceUpdate
            : base.OverrideSolutionImportDecision(solutionUniqueName, organizationVersion,
            packageSolutionVersion, inboundSolutionVersion, deployedSolutionVersion,
            systemSelectedImportAction);
      }
      ```

   5. Enter custom code to execute before the solution import completes in the override definition of the `BeforeImportStage` method. The sample data and some flat files for solutions specified in the `ImportConfig.xml` file are imported before the solution import completes.  

   6. Override the currently selected language for configuration data import using the override method definition of `OverrideConfigurationDataFileLanguage`. If the specified locale ID (LCID) of the specified language isn't found in the list of available languages in the package, the default data file is imported.  

       You specify the available languages for the configuration data in the `<cmtdatafiles>` node in the `ImportConfig.xml` file. The default configuration data import file is specified in the `crmmigdataimportfile` attribute in the `ImportConfig.xml` file.  

       Skipping data checks (<xref:Microsoft.Xrm.Tooling.PackageDeployment.CrmPackageExtentionBase.IImportExtensions2.OverrideDataImportSafetyChecks> = true) can be effective here if you're sure that the target Dataverse instance doesn't contain any data.  

   7. Enter custom code to execute after the import completes in the override definition of `AfterPrimaryImport`>method. The remaining flat files that weren't imported earlier, before the solution import started, are imported now.  

   8. Change the default name of your package folder to the package name that you want. To do so, rename the `PkgFolder` (or **PkgAssets**) folder in the **Solution Explorer** pane, and then edit the return value under the `GetImportPackageDataFolderName` property.  

      ```csharp  
      public override string GetImportPackageDataFolderName  
      {  
          get  
          {  
              // WARNING this value directly correlates to the folder name in Solution 
              // Explorer where the ImportConfig.xml and sub content is located.  
              // Changing this name requires that you also change the correlating name
              // in Solution Explorer.
              return "PkgFolder";  
          }  
      }  
      ```  

   9. Change the package name by editing the return value under the `GetNameOfImport` property.  

      ```csharp  
      public override string GetNameOfImport(bool plural)  
      {  
          return "Package Short Name";  
      }  
      ```  

       This returned value is the name of your package that appears on the package selection page in the Dynamics 365 Package Deployer wizard.  

   10. Change the package description by editing the return value under the `GetImportPackageDescriptionText` property.  

       ```csharp  
       public override string GetImportPackageDescriptionText  
       {  
           get { return "Package Description"; }  
       }  
       ```  

        This returned value is the package description that appears alongside the package name on the package selection page in the Package Deployer wizard.  

   11. Change the package long name by editing the return value under the `GetLongNameOfImport` property.  

       ```csharp  
       public override string GetLongNameOfImport  
       {  
           get { return "Package Long Name"; }  
       }  
       ```  

        The package long name appears on the next page after you have selected the package to install.  

3. Additionally, the following function and variables are available to the package:  

   |Name|Type|Description|
   |--|--|--|
   |<xref:Microsoft.Xrm.Tooling.PackageDeployment.CrmPackageExtentionBase.ImportExtension.CreateProgressItem(System.String)> |Function|Used to create a new progress item in the user interface (UI). |
   |<xref:Microsoft.Xrm.Tooling.PackageDeployment.CrmPackageExtentionBase.ImportExtension.RaiseUpdateEvent(System.String,Microsoft.Xrm.Tooling.PackageDeployment.CrmPackageExtentionBase.ProgressPanelItemStatus)> |Function| Used to update the progress created by the call to <xref:Microsoft.Xrm.Tooling.PackageDeployment.CrmPackageExtentionBase.ImportExtension.CreateProgressItem(System.String)>.<br /><br /> <xref:Microsoft.Xrm.Tooling.PackageDeployment.CrmPackageExtentionBase.ProgressPanelItemStatus> is an enum with the following values:<br /><br /> Working = 0<br />Complete = 1<br />Failed = 2<br />Warning = 3<br />Unknown = 4 |
   |<xref:Microsoft.Xrm.Tooling.PackageDeployment.CrmPackageExtentionBase.ImportExtension.RaiseFailEvent(System.String,System.Exception)>|Function|Used to fail the current status import with an exception message.|
   |<xref:Microsoft.Xrm.Tooling.PackageDeployment.CrmPackageExtentionBase.ImportExtension.IsRoleAssoicatedWithTeam(System.Guid,System.Guid)>|Function|Used to determine if a role is associated with a specified team.|
   |<xref:Microsoft.Xrm.Tooling.PackageDeployment.CrmPackageExtentionBase.ImportExtension.IsWorkflowActive(System.Guid)>|Function|Used to determine if a specified workflow is active. |
   |<xref:Microsoft.Xrm.Tooling.PackageDeployment.CrmPackageExtentionBase.ImportExtension.PackageLog>| Class Pointer|A pointer to the initialized logging interface for the package. This interface is used by a package to log messages and exceptions to the package log file.|
   |<xref:Microsoft.Xrm.Tooling.PackageDeployment.CrmPackageExtentionBase.ImportExtension.RootControlDispatcher>|Property|A dispatcher interface used to allow your control to render its own UI during package deployment. Use this interface to wrap any UI elements or commands. It's important to check this variable for null values before using it as it might not be set to a value.  |
   |<xref:Microsoft.Xrm.Tooling.PackageDeployment.CrmPackageExtentionBase.ImportExtension.CrmSvc>|Property |A pointer to <xref:Microsoft.Xrm.Tooling.Connector.CrmServiceClient> class that allows for a package to address Dynamics 365 from within the package. Use this pointer to execute SDK methods and other actions in the overridden methods.|
   |<xref:Microsoft.Xrm.Tooling.PackageDeployment.CrmPackageExtentionBase.IImportExtensions2.DataImportBypass> |Property|Specify whether Dynamics 365 Package Deployer skips all data import operations such as importing Dataverse sample data, flat file data, and data exported from the Configuration Migration tool. Specify true or false. Default is `false`.|
   | <xref:Microsoft.Xrm.Tooling.PackageDeployment.CrmPackageExtentionBase.IImportExtensions2.OverrideDataImportSafetyChecks> |Property|Specify whether Dynamics 365 Package Deployer bypasses some of its safety checks, which helps in improving the import performance. Specify `true` or `false`. Default is `false`.<br /><br /> You should set this property to `true` only if the target Dataverse instance doesn't contain any data.|

4. Save your project. The next step is to build the package.
  
## Build and deploy  

The following sections describe how to build and deploy a package.

### Build

Building your package is described below depending on which tool you're using.

#### [Power Platform CLI](#tab/cli)

To build a package created with the CLI, you could load the .csproj file into Visual Studio, but instead we're going to use the dotnet command and MSBuild. The example below assumes the working directory contains the *.csproj file.

```bash
> dotnet publish

DeploymentPackage -> C:\Users\peter\Downloads\DeploymentPackage\bin\Debug\DeploymentPackage.1.0.0.pdpkg.zip
```

You can optionally look at the details of the built package.

```bash
> pac package show --package .\bin\Debug\DeploymentPackage.1.0.0.pdpkg.zip
```

#### [Power Platform tools](#tab/pptools)

To build the package, press F5 in Visual Studio or select **Build** > **Build solution**.

---

Your package is made of the following files under the *\<Project>*\Bin\Debug folder.  

- **\<PackageName> folder**: The folder name is the same as the one you changed for your package folder name in step 2.g of this section [Add custom code](#add-custom-code). This folder contains all solutions, configuration data, flat files, and the contents for your package.

> [!NOTE]
> You may see a .NET folder (e.g, net472) containing a pdpublish folder. Your DLL and other project files are in that pdpublish folder.

- **\<PackageName>.dll**: The assembly contains the custom code for your package. By default, the name of the assembly is the same as your project name.

### Deploy

 After you create a package, you can deploy it on the Dataverse instance by using the Package Deployer tool, Windows PowerShell, or a CLI command.

- To deploy using the Package Deployer tool, first download the tool as described in [Dataverse development tools](/power-apps/developer/data-platform/download-tools-nuget). Next, follow the detailed information on package deployment in the article [Deploy packages using Package Deployer or Windows PowerShell](../admin/deploy-packages-using-package-deployer-windows-powershell.md).

- To deploy using the CLI, use the `pac package deploy` command.

    ```bash
    > pac package deploy --package .\bin\Debug\DeploymentPackage.1.0.0.pdpkg.zip
    ```

  > [!NOTE]
  > To deploy a package to a target environment using the CLI, you must first set up an authentication profile and select an organization. More information: [pac auth create](../developer/cli/reference/auth.md#commands), [pac org select](../developer/cli/reference/org.md#commands)

## Best practices  

Listed below are a few best practice tips to follow when working with Package Deployer packages.

### Creating packages

When creating packages, developers must:

- *Ensure that package assemblies are signed*.

### Deploying packages

When deploying packages, Dataverse administrators must:  

- *Insist on signed package assemblies* so that you can track an assembly back to its source.  
- *Test the package on a preproduction instance*, preferably a mirror image of the production instance, before running it on a production instance.  
- *Back up the production instance* before deploying the package.  

### See also

[Solution Packager tool](solution-packager-tool.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
