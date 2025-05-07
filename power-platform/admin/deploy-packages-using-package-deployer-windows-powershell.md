---
title: "Deploy packages using Package Deployer and Windows PowerShell | MicrosoftDocs"
description: Learn about deploying packages using Package Deployer and Windows PowerShell.
ms.custom: 
ms.date: 08/12/2021
ms.reviewer: 
ms.topic: install-set-up-deploy
ms.assetid: 27676d3a-d35c-4452-9ff3-bcdadd943bef
caps.latest.revision: 36
author: Mattp123
ms.subservice: admin
ms.author: matp
search.audienceType: 
  - admin
---
# Deploy packages using Package Deployer and Windows PowerShell

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

[!INCLUDE[pn_package_deployer_long](../includes/pn-package-deployer-long.md)] enables administrators to deploy packages to an environment. 

> [!NOTE]
> Package deployer also works with Dynamics 365 Customer Engagement (on-premises) organizations.

A “package” can consist of any or all of the following:  
  
- One or more Dataverse solution files.  
  
- Flat files or exported data files from the Configuration Migration tool. For information about the Configuration Migration tool, see [Manage your configuration data](manage-configuration-data.md).  
  
- Custom code that can run during or after the package is deployed to an environment.  
  
- HTML content specific to the package that can display at the beginning and end of the package deployment process. This can be useful to provide a description of the solutions and files that are deployed in the package.  
  
  Developers create packages by using the package deployment template in [!INCLUDE[pn_Visual_Studio](../includes/pn-visual-studio.md)]. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Create packages for Package Deployer](/dynamics365/customerengagement/on-premises/developer/create-packages-package-deployer)
  
  After a package is created, you can deploy it either by running [!INCLUDE[pn_package_deployer_short](../includes/pn-package-deployer-short.md)] or by using [!INCLUDE[pn_PowerShell](../includes/pn-powershell.md)] cmdlets for the tool.  
  
> [!IMPORTANT]
>  Before you import and run a package in a production organization, test the package on a non-production mirror image of the production organization.  
>   
>  Always back up the production organization before you deploy a package.  
  
<a name="GUI"></a>   
<a name="DeployerPackages"></a>   

## Deploying packages using the Package Deployer tool

 You can use the Package Deployer tool (packagedeployer.exe) to deploy packages in the following ways.  
  
 [Use CRM Package Deployer tool to deploy packages](#PD_tool)  
  
 [Use CRM Package Deployer tool at the command line](#PD_command)  
  
<a name="PD_tool"></a>   

## Use Package Deployer tool to deploy packages

 The Package Deployer tool can only process one package at a time. However, it provides users with the ability to select a package to deploy from multiple packages available in the Package Deployer tool directory. Some of the screens and actions in the tool differ based on the package definition. You do not have to install the Package Deployer tool. Just download and run it.  
  
1. Obtain the package to be deployed. A package is a collection of files and folders that is created in your Visual studio project folder *(\<Project>*\Bin\Debug) when you build your package project in Visual Studio. Copy the following from your project debug folder:  
  
   - **\<PackageName> folder**: This folder contains the solutions, import configuration, and the contents for your package.  
  
   - **\<PackageName>.dll**: The assembly contains the code for your package. By default, the name of the assembly is the same as your [!INCLUDE[pn_Visual_Studio_short](../includes/pn-visual-studio-short.md)] project name.  
  
     For detailed information about creating a package by using [!INCLUDE[pn_Visual_Studio_short](../includes/pn-visual-studio-short.md)], see [Create a package for the Package Deployer tool](/dynamics365/customerengagement/on-premises/developer/create-packages-package-deployer). 
  
     For this topic, let us assume that the package folder and assembly from the [!INCLUDE[pn_Visual_Studio_short](../includes/pn-visual-studio-short.md)] project debug folder (*\<Project>*\Bin\Debug) are copied to the `c:\DeployPackage` folder.  
  
2. Obtain the Package Deployer tool. [!INCLUDE[cc-use-package-deployer](../includes/cc-use-package-deployer.md)]
  
3. Copy the package folder and assembly from the `c:\DeployPackage` to the `[ExtractedLocation]\tools` folder.  
  
4. After the files are copied, run the tool by double-clicking the `PackageDeployer.exe` file in the `[ExtractedLocation]\tools` folder.  
  
5. Click **Continue** on the main screen of the tool.  
  
6. In the **Connect to Microsoft Dynamics 365 for Customer Engagement** screen, provide authentication details to connect to your [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] server where you want to deploy the package. If you have multiple organizations, and want to select the organization where you want to deploy the package, select the **Always display list of available orgs** check box. Click **Login**.  
  
7. If you have multiple organizations on your [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] server, select a [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps organization to connect to.  
  
8. Select the package to be deployed, and click **Next**.  
  
   ![Select your package in the Package Deployer Tool.](../admin/media/package-deployer-4.png "Select your package in the Package Deployer Tool")  
  
9. Follow the instructions on the subsequent screens to complete the deployment of your package.  
  
     The screens appear based on the definition of the package that you selected for deployment. For an end-to-end package deployment that uses the Package Deployer tool, see the topic for the deployment of [!INCLUDE[pn_unified_service_desk](../includes/pn-unified-service-desk.md)] packages: [Deploy sample Unified Service Desk applications to CRM Server using Package Deployer](/dynamics365/customer-engagement/unified-service-desk/admin/deploy-sample-unified-service-desk-applications-using-package-deployer)  
  
<a name="PD_command"></a>   

## Use Package Deployer tool at the command line

 System administrators and customizers can pass parameters, such as a regional language code, to packagedeployer.exe from the command line.  These parameters may only be configured by running Package Deployer tool at the command line.  
  
> [!NOTE]
>  This feature was first introduced in [!INCLUDE[pn_crm_8_0_1_online](../includes/pn-crm-8-0-1-online.md)].  
  
 Available parameters are in this table.  
  
|Parameter|Description|Default Value|  
|---------------|-----------------|-------------------|  
|RuntimePackageSettings|Instructs packagedeployer.exe to accept command line parameters such as LCID and SkipChecks.|Not applicable|  
|LCID=*localeID*|Specifies the locale ID, such as 1033 for English-United States or 1036 for French-France, from the available locale IDs in the package. If not specified, the default language will be used.|Use the default language|  
|SkipChecks=true/false|Use this parameter only  when the target environment does not contain any other solutions or customizations. When set to true, solution import will bypass some safety checks, which can improve performance of the import.|False|  
  
 The following example instructs [!INCLUDE[pn_package_deployer_short](../includes/pn-package-deployer-short.md)] to  bypass some safety checks and sets the language to import as Polish.  
  
```powershell 
packagedeployer.exe /Settings:"SkipChecks=true|lcid=1045"
```  
  
> [!NOTE]
>  Use the pipe character &#124; to separate parameters when you run packagedeployer.exe at the command line with multiple parameters.  
  
 For more information about the parameters and values that can be passed to packagedeployer.exe, see [Create packages for the CRM Package Deployer](/dynamics365/customerengagement/on-premises/developer/create-packages-package-deployer).
  
<a name="PowerShell"></a>   

## Use Windows PowerShell to deploy packages

The Package Deployer tool also provides [!INCLUDE[pn_PowerShell](../includes/pn-powershell.md)] support to deploy packages. More information: [Get started using the package deployment module](/powershell/powerapps/get-started-packagedeployment)

## Troubleshoot package deployment issues by using log files  
 The Package Deployer tool provides logging support to get detailed information about errors that can occur when someone signs in to the Microsoft Dynamics 365 for Customer Engagement instance using the tool and deploying packages. By default, the tool generates three log files that are available at the following location on the computer where you run the tool: c:\Users\\*\<UserName>*\AppData\Roaming\Microsoft\Microsoft Dynamics CRM Package Deployer\\*\<Version>*. To specify a different folder, use the -LogWriteDirectory [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] cmdlet parameter. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Use the cmdlet to retrieve packages](/powershell/powerapps/get-started-packagedeployment#retrieve)  
  
- `Login_ErrorLog.log`: Provides information about the issues that occurred when you use the tool to sign in to the [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] instance. If there are any issues during sign in, a message appears on the tool’s login screen with a link to this log file. The message states that an error occurred while processing the login request and the user can view the error log. You can click the link in the message to view this log file. The log file is created the first time you encounter any sign-in issues in the tool. Thereafter, the log file is used to log information about a sign-in issue, whenever it occurs.  
  
- `PackageDeployer.log`: Provides detailed information about each task performed in the tool during the deployment of the packages. You can view the log file from the tool by clicking the **View Log File** link at the bottom of the screen.  
  
- `ComplexImportDetail.log`: Provides detailed information about the data imported in the last deployment by using the tool. Each time you deploy a package using this tool, the existing details from the log file are moved to a file called ComplexImportDetail._old.log in the same directory, and the ComplexImportDetail.log file displays information about the latest import done using the tool.  
  
<a name="BestPractices"></a>  
 
## Best practices for deploying packages  
 While deploying packages, [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] administrators must:  
  
-   Insist on a signed package assembly so that they can track an assembly back to its source.  
  
-   Test the package on a pre-production instance (preferably a mirror image of the Production instance) before running it on a production server.  
  
-   Back up the Production instance before deploying a package.  
 
### See also  
 [Create packages for the CRM Package Deployer](/dynamics365/customerengagement/on-premises/developer/create-packages-package-deployer)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
