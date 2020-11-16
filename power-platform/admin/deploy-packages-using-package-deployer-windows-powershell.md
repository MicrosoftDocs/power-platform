---
title: "Deploy packages using Package Deployer and Windows PowerShell | MicrosoftDocs"
ms.custom: 
ms.date: 06/10/2020
ms.reviewer: 
ms.service: powerapps
ms.topic: article
ms.assetid: 27676d3a-d35c-4452-9ff3-bcdadd943bef
caps.latest.revision: 36
author: Mattp123
ms.author: matp
manager: brycho
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Deploy packages using Package Deployer and Windows PowerShell

[!INCLUDE[pn_package_deployer_long](../includes/pn-package-deployer-long.md)] enables administrators to deploy packages to a Microsoft Dataverse environment. 

> [!NOTE]
> Package deployer also works with Dynamics 365 Customer Engagement (on-premises) organizations.

A “package” can consist of any or all of the following:  
  
- One or more Dataverse solution files.  
  
- Flat files or exported data files from the Configuration Migration tool. For information about the Configuration Migration tool, see [Manage your configuration data](manage-configuration-data.md).  
  
- Custom code that can run during or after the package is deployed to Dataverse environment.  
  
- HTML content specific to the package that can display at the beginning and end of the package deployment process. This can be useful to provide a description of the solutions and files that are deployed in the package.  
  
  Developers create packages by using the package deployment template in [!INCLUDE[pn_Visual_Studio](../includes/pn-visual-studio.md)]. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Create packages for Package Deployer](https://docs.microsoft.com/dynamics365/customerengagement/on-premises/developer/create-packages-package-deployer)
  
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
  
     For detailed information about creating a package by using [!INCLUDE[pn_Visual_Studio_short](../includes/pn-visual-studio-short.md)], see [Create a package for the Package Deployer tool](https://docs.microsoft.com/dynamics365/customerengagement/on-premises/developer/create-packages-package-deployer). 
  
     For this topic, let us assume that the package folder and assembly from the [!INCLUDE[pn_Visual_Studio_short](../includes/pn-visual-studio-short.md)] project debug folder (*\<Project>*\Bin\Debug) are copied to the `c:\DeployPackage` folder.  
  
2. Obtain the Package Deployer tool. [!INCLUDE[cc-use-package-deployer](../includes/cc-use-package-deployer.md)]
  
3. Copy the package folder and assembly from the `c:\DeployPackage` to the `[ExtractedLocation]\tools` folder.  
  
4. After the files are copied, run the tool by double-clicking the `PackageDeployer.exe` file in the `[ExtractedLocation]\tools` folder.  
  
5. Click **Continue** on the main screen of the tool.  
  
6. In the **Connect to Microsoft Dynamics 365 for Customer Engagement** screen, provide authentication details to connect to your [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] server where you want to deploy the package. If you have multiple organizations, and want to select the organization where you want to deploy the package, select the **Always display list of available orgs** check box. Click **Login**.  
  
7. If you have multiple organizations on your [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] server, select a [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps organization to connect to.  
  
8. Select the package to be deployed, and click **Next**.  
  
   ![Select your package in the Package Deployer Tool](../admin/media/package-deployer-4.png "Select your package in the Package Deployer Tool")  
  
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
  
 For more information about the parameters and values that can be passed to packagedeployer.exe, see [Create packages for the CRM Package Deployer](https://docs.microsoft.com/dynamics365/customerengagement/on-premises/developer/create-packages-package-deployer).
  
<a name="PowerShell"></a>   

## Use Windows PowerShell to deploy packages  
 The Package Deployer tool also provides [!INCLUDE[pn_PowerShell](../includes/pn-powershell.md)] support to deploy packages.  
  
 Perform the following steps to use the [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] cmdlets to deploy packages:  
  
 [Prerequisites](../admin/deploy-packages-using-package-deployer-windows-powershell.md#Prereq)  
  
 [Import the Package Deployer PowerShell module](../admin/deploy-packages-using-package-deployer-windows-powershell.md#import)  
  
 [Use the cmdlet to retrieve packages](../admin/deploy-packages-using-package-deployer-windows-powershell.md#retrieve)  
  
 [Use the cmdlet to connect to your Dynamics 365 Server](../admin/deploy-packages-using-package-deployer-windows-powershell.md#connect)  
  
 [Use the cmdlet to deploy packages](../admin/deploy-packages-using-package-deployer-windows-powershell.md#deploy)  
  
 [Get detailed help on cmdlets](../admin/deploy-packages-using-package-deployer-windows-powershell.md#help)  
  
<a name="Prereq"></a>   

### Prerequisites  
 Here are the prerequisites for using the [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] cmdlets:  
  
- [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] 3.0 or later is required to deploy a package by using [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)]. To check your [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] version, run a [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] window, and then run the following command: `$Host`  
  
- Set the execution policy to run the signed [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] scripts. To do so, run a [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] window as an administrator, and then run the following command: `Set-ExecutionPolicy -ExecutionPolicy AllSigned`  
  
<a name="import"></a>   

### Import the Package Deployer PowerShell module  
 You must import the [!INCLUDE[pn_PowerShell](../includes/pn-powershell.md)] module for the Package Deployer tool before you can use it. To import:  
  
1. Obtain the PowerShell files for the Package Deployer. [!INCLUDE[cc-use-package-deployer-powershell](../includes/cc-use-package-deployer-powershell.md)]  
  
2. Start [!INCLUDE[pn_PowerShell](../includes/pn-powershell.md)] on your computer with elevated privileges (run as administrator).  
  
3. At the prompt in the [!INCLUDE[pn_PowerShell](../includes/pn-powershell.md)] window, change your directory to the folder where you extracted the files. In this case:  
  
   ```powershell
   cd [ExtractedLocation]\tools\  
   ```  
  
4. Run the `RegisterXRMPackageDeployment.ps1` script available at the `[ExtractedLocation]\tools` folder by running the following command:  
  
   ```powershell
   .\RegisterXRMPackageDeployment.ps1  
   ```
  
   You are now ready to use the [!INCLUDE[pn_PowerShell](../includes/pn-powershell.md)] cmdlets. To list the cmdlets that you registered, run the following command at the prompt in the [!INCLUDE[pn_PowerShell](../includes/pn-powershell.md)] window:  
  
   ```powershell  
   Get-Help “Crm”  
   ```  
  
<a name="retrieve"></a>   

### Use the cmdlet to retrieve packages  
 Before you can use the cmdlet, ensure that you have copied your package to the **PackageDeployer** folder (in this case, `[ExtractedLocation]\tools`). A package is a collection of files and folders that is created in your [!INCLUDE[pn_Visual_Studio_short](../includes/pn-visual-studio-short.md)] project folder (*\<Project>*\Bin\Debug) when you build your project in [!INCLUDE[pn_Visual_Studio_short](../includes/pn-visual-studio-short.md)]. Copy the entire contents of your project debug folder to the **PackageDeployer** folder. For detailed information about building a package using [!INCLUDE[pn_Visual_Studio_short](../includes/pn-visual-studio-short.md)], see [Create packages for the CRM Package Deployer](https://docs.microsoft.com/dynamics365/customerengagement/on-premises/developer/create-packages-package-deployer). 
  
1. In the [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] window, use the following cmdlet to return a list of packages available for import in the specified folder (in this case, c:\CRM\SDK\Tools\PackageDeployer):  
  
   ```powershell  
   Get-CrmPackages –PackageDirectory [ExtractedLocation]\tools  
   ```  
  
2. If you want information about a package in a folder, you can use the **Get-CrmPackages** cmdlet along with the **–PackageName** parameter to specify the name of the assembly in the folder that contains the package definition.  
  
   ```powershell 
   Get-CrmPackages –PackageDirectory [ExtractedLocation]\tools –PackageName SampleCRMPackage.dll  
   ```  
  
3. The package assembly location can be stored in a variable by using the Get-CrmPackages cmdlet. Then it may be reused in the Import-CrmPackage cmdlet to specify a value for the PackageDirectory parameter. For example, you can store the information of one or more  packages returned from the Get-CrmPackages cmdlet in a variable called $MyPackages.  
  
   ```powershell
   $MyPackages = Get-CrmPackages –PackageDirectory [ExtractedLocation]\tools   
   ```  
  
    To display all the packages.  
  
   ```powershell
   $MyPackages  
   ```  
  
    To display only the third package.  
  
   ```powershell
   $MyPackages[2].PackageAssemblyLocation  
   ```  
  
    Then, you can reference each package in the array from 0 through n. For example, this cmdlet imports the first package found in $MyPackages.  
  
   ```powershell
   Import-CrmPackage -CrmConnection $CRMConn -PackageDirectory $MyPackages[0].PackageAssemblyLocation  
   ```  
  
  
<a name="connect"></a>  
 
### Use the cmdlet to connect to your Dynamics 365 for Customer Engagement instance  
  
1. Provide your credentials to connect to your [!INCLUDE[pn_CRM_Online](../includes/pn-crm-online.md)] apps or Dynamics 365 for Customer Engagement apps (on-premises) instance. Running the following command will prompt you to type your user name and password to connect to the [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] instance, and we will store it in the `$Cred` variable, and use it later for connecting to your Dynamics 365 Server.  
  
   ```powershell
   $Cred = Get-Credential  
   ```  
  
2. Use the following command to get a connection to your [!INCLUDE[pn_CRM_Online](../includes/pn-crm-online.md)] apps or Dynamics 365 for Customer Engagement apps (on-premises) instance. We will store the connection information in the `$CRMConn` variable:  
  
   - If you are connecting to the Dynamics 365 for Customer Engagement apps (on-premises) instance:  
  
     ```powershell 
     $CRMConn = Get-CrmConnection -ServerUrl https://<your_CRM_Server> -OrganizationName <your_Org_Name> -Credential $Cred  
     ```  
  
   - If you are connecting to the [!INCLUDE[pn_CRM_Online](../includes/pn-crm-online.md)] server:  
  
     ```powershell
     $CRMConn = Get-CrmConnection -DeploymentRegion NorthAmerica –OnlineType Office365 –OrganizationName <your_Org_Name> -Credential $Cred  
     ```  
  
     > [!NOTE]
     >  For the `DeploymentRegion` parameter, valid values are `NorthAmerica`, `EMEA`, APAC`SouthAmerica`, `Oceania`, `JPN`, and `NorthAmerica2`. For the `OnlineType` parameter, valid values are `Office365` and `LiveID`.  
  
3. Your supplied credentials are validated when you run the command in step 2.  
  
<a name="deploy"></a>   

### Use the cmdlet to deploy packages  
 Next, use the [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps connection information stored in the `$CRMConn` variable to deploy packages to the [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] instance.  The following command deploys a package, disassembles the package in the *c:\UnpackedFiles* folder, and records  information to a log file in the *c:\MyLogFiles* folder.  
  
```powershell
Import-CrmPackage –CrmConnection $CRMConn –PackageDirectory c:\CRM\SDK\Tools\PackageDeployer –PackageName SampleCRMPackage.dll –UnpackFilesDirectory c:\UnpackedFiles -LogWriteDirectory C:\MyLogFiles -Verbose  
```  
  
> [!NOTE]
> - `CrmConnection`, `PackageDirectory`, and `PackageName` parameters are mandatory.  
> - Instead of manually specifying the package folder, you can use a variable with the PackageDirectory parameter. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Use the cmdlet to retrieve packages](#retrieve)  
> - For the `PackageName` parameter, you have to specify the name of the assembly that contains the package definition.  
> - You do not need to specify the `UnpackFilesDirectory` parameter if your package does not unpack files during package deployment. While defining a package in [!INCLUDE[pn_Visual_Studio_short](../includes/pn-visual-studio-short.md)], you specify whether to unpack files using the **agentdesktopzipfile** parameter in the ImportConfig.xml file. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Create packages for the CRM Package Deployer](https://docs.microsoft.com/dynamics365/customerengagement/on-premises/developer/create-packages-package-deployer)
> - The `Verbose` parameter is optional, and is used to display a detailed log of the activities performed during the package deployment process.  
> - The optional `RuntimePackageSettings` parameter can be used together with the following parameters:  
> 
>   -   The `LCID=localeID` parameter specifies the locale ID, such as 1033 for English-United States or 1036 for French-France, from the available locale IDs in the package. If not specified, the default language will be used.  
>   -   The `SkipChecks=true/false` parameter should only be used when the target environment does not contain any other solutions or customizations. When set to true, solution import will bypass some safety checks, which can improve import performance.  
> - The folder that you specify when you use the `LogWriteDirectory` parameter must already exist, and the user who is running the Import-CrmPackage cmdlet must have write permission to the folder. Additionally, the -Verbose parameter is required  when you use the LogWriteDirectory parameter.  
> 
>    The LogWriteDirectory parameter was first introduced with [!INCLUDE[pn_crm_9_0_0_online](../includes/pn-crm-9-0-0-online.md)]. 
>   [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Dynamics 365 for Customer Engagement apps Developer Guide](https://docs.microsoft.com/dynamics365/customerengagement/on-premises/developer/overview)  

 The following example command imports a package named *SampleCRMPackage* and specifies English-United States (1033) as the language to import the package.  
  
```powershell
Import-CrmPackage –CrmConnection $CRMConn –PackageDirectory c:\CRM\SDK\Tools\PackageDeployer –PackageName SampleCRMPackage.dll –UnpackFilesDirectory c:\UnpackedFiles –RuntimePackageSettings LCID=1033  
```  
  
<a name="help"></a>  

### Get detailed help on cmdlets  
 In the [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] window, use the `Get-Help` cmdlet with a cmdlet name to view a detailed help for the cmdlet. For example, to get detailed help for the `Import-CrmPackage` cmdlet:  
  
```powershell
Get-Help Import-CrmPackage -full  
```  
  
 To view the online help for the cmdlets, see [Dynamics 365 for Customer Engagement apps PowerShell Reference](https://technet.microsoft.com/library/dn756318.aspx).  
  
<a name="Logfiles"></a>   

## Troubleshoot package deployment issues by using log files  
 The Package Deployer tool provides logging support to get detailed information about errors that can occur when someone signs in to the Microsoft Dynamics 365 for Customer Engagement instance using the tool and deploying packages. By default, the tool generates three log files that are available at the following location on the computer where you run the tool: c:\Users\\*\<UserName>*\AppData\Roaming\Microsoft\Microsoft Dynamics CRM Package Deployer\\*\<Version>*. To specify a different folder, use the -LogWriteDirectory [!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] cmdlet parameter. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Use the cmdlet to retrieve packages](#retrieve)  
  
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
 [Create packages for the CRM Package Deployer](https://docs.microsoft.com/dynamics365/customerengagement/on-premises/developer/create-packages-package-deployer)
