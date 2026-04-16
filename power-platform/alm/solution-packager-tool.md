---
title: "SolutionPackager tool (Microsoft Dataverse) | Microsoft Docs"
description: "SolutionPackager is a tool that can reversibly decompose a Microsoft Dataverse compressed solution file into multiple XML files."
ms.date: 04/07/2026
ms.reviewer: pehecke
ms.topic: concept-article
author: caburk
ms.subservice: alm
ms.author: caburk
search.audienceType: 
  - developer
---
# SolutionPackager tool

SolutionPackager is a tool that can reversibly decompose a Microsoft Dataverse compressed solution file into multiple XML files and other files. You can then easily manage these files by using a source control system. The following sections show you how to run the tool and how to use the tool with managed and unmanaged solutions.  

> [!IMPORTANT]
> The SolutionPackager tool is no longer the recommended way to unpack and pack solutions. The capabilities of the SolutionPackager tool are incorporated into the [Power Platform CLI](../developer/cli/introduction.md). The [`pac solution`](../developer/cli/reference/solution.md) command has many verbs including [`unpack`](../developer/cli/reference/solution.md#pac-solution-unpack), [`pack`](../developer/cli/reference/solution.md#pac-solution-pack), [`clone`](../developer/cli/reference/solution.md#pac-solution-clone), and [`sync`](../developer/cli/reference/solution.md#pac-solution-sync) that incorporate the same underlying capabilities of the SolutionPackager tool.
  
<a name="bkm_where"></a>

## Where to find the SolutionPackager tool  

 The SolutionPackager tool is distributed as part of the [Microsoft.CrmSdk.CoreTools](https://www.nuget.org/packages/Microsoft.CrmSdk.CoreTools) NuGet package. To install the program, follow these steps.

1. Download the NuGet package.
1. Rename the package filename extension from \.nupkg to \.zip.
1. Extract the contents of the compressed (zip) file.

Find the SolutionPackager.exe executable in the \<extracted-folder-name\>/contents/bin/coretools folder. Run the program from the coretools folder or add that folder to your PATH.
  
<a name="arguments"></a>

## SolutionPackager command-line arguments  

 SolutionPackager is a command-line tool that can be invoked with the parameters identified in the following table.  
  
|Argument|Description|  
|--------------|-----------------|  
|/action: {Extract&#124;Pack}|Required. The action to perform. The action can be either to extract a solution .zip file to a folder, or to pack a folder into a .zip file.|  
|/zipfile: \<file path>|Required. The path and name of a solution .zip file. When extracting, the file must exist and be readable. When packing, the file is replaced.|  
|/folder: \<folder path>|Required. The path to a folder. When extracting, this folder is created and populated with component files. When packing, this folder must already exist and contain previously extracted component files.|  
|/packagetype: {Unmanaged&#124;Managed&#124;Both}|Optional. The type of package to process. The default value is Unmanaged. This argument may be omitted in most occasions because the package type can be read from inside the .zip file or component files. When extracting and Both is specified, managed and unmanaged solution .zip files must be present and are processed into a single folder. When packing and Both is specified, managed and unmanaged solution .zip files are produced from one folder. For more information, see the section on working with managed and unmanaged solutions later in this article.|  
|/allowWrite:{Yes&#124;No}|Optional. The default value is Yes. This argument is used only during an extraction. When /allowWrite:No is specified, the tool performs all operations but is prevented from writing or deleting any files. The extract operation can be safely assessed without overwriting or deleting any existing files.|  
|/allowDelete:{Yes&#124;No&#124;Prompt}|Optional. The default value is Prompt. This argument is used only during an extraction. When /allowDelete:Yes is specified, any files present in the folder specified by the /folder parameter that aren't expected are automatically deleted. When /allowDelete:No is specified, no deletes occur. When /allowDelete:Prompt is specified, the user is prompted through the console to allow or deny all delete operations. If /allowWrite:No is specified, no deletes occur even if /allowDelete:Yes is also specified.|  
|/clobber|Optional. This argument is used only during an extraction. When /clobber is specified, files that have the read-only attribute set are overwritten or deleted. When not specified, files with the read-only attribute aren't overwritten or deleted.|  
|/errorlevel: {Off&#124;Error&#124;Warning&#124;Info&#124;Verbose}|Optional. The default value is Info. This argument indicates the level of logging information to output.|  
|/map: \<file path>|Optional. The path and name of an .xml file containing file mapping directives. When used during an extraction, files typically read from inside the folder specified by the /folder parameter are read from alternate locations as specified in the mapping file. During a pack operation, files that match the directives aren't written.|  
|/nologo|Optional. Suppress the banner at runtime.|  
|/log: \<file path>|Optional. A path and name to a log file. If the file already exists, new logging information is appended to the file.|  
|@ \<file path>|Optional. A path and name to a file that contains command-line arguments for the tool.|  
|/sourceLoc: \<string>|Optional. This argument generates a template resource file, and is valid only on extract.<br /><br /> Possible values are `auto` or an LCID/ISO code for the language you want to export. When this argument is used, the string resources from the given locale are extracted as a neutral .resx file. If `auto` or just the long or short form of the switch is specified, the base locale or the solution is used. You can use the short form of the command: /src.|  
|/localize|Optional. Extract or merge all string resources into .resx files. You can use the short form of the command: /loc. The localize option supports shared components for .resx files. More information: [Using RESX web resources](/power-apps/developer/model-driven-apps/resx-web-resources)|  
|/SolutionName: \<name>|Optional. The unique name of the solution to pack or extract when the source folder contains multiple solutions under `solutions/*/solution.yml`. Required when more than one solution is detected. Only applies to the YAML source control format. You can use the short form of the command: /sn.|
|/remapPluginTypeNames|Optional. When specified, plug-in fully qualified type names are remapped based on the assemblies included in the solution. Enabled by default in the YAML source control format. You can use the short form of the command: /fp.|

<a name="use_command"></a>

## Source control file formats

SolutionPackager supports two folder layouts when extracting and packing solutions.

### XML format (legacy)

The original format. Solution metadata is stored in `Other\Solution.xml` and `Other\Customizations.xml`, and all component files are extracted into a flat folder hierarchy alongside those files. This format is the default format when extracting a `.zip` file without more configuration.

### YAML source control format

Introduced alongside [Dataverse Git integration](git-integration/overview.md), this format stores solution metadata as YAML files distributed across a structured folder hierarchy. It's the format written when you commit solutions using native Git integration in Power Apps.

#### Advantages over XML format

- Produces cleaner, more readable per-component diffs in source control
- Supports multiple solutions in a single repository folder
- Canvas app `.msapp` files and modern flows are only supported in this format
- Plug-in type name remapping is enabled by default

#### Required folder structure

```
<rootFolder>/
├── solutions/
│   └── <SolutionUniqueName>/
│       ├── solution.yml              (solution metadata)
│       ├── solutioncomponents.yml    (paths to all component files)
│       ├── rootcomponents.yml        (root-level components)
│       └── missingdependencies.yml   (dependency info)
├── publishers/
│   └── <PublisherUniqueName>/
│       └── publisher.yml             (publisher definition)
├── entities/                         (entity components, if present)
├── workflows/                        (classic workflows, if present)
├── modernflows/                      (Power Automate cloud flows, if present)
├── canvasapps/                       (canvas app .msapp files, if present)
└── [other component folders]/
```

> [!IMPORTANT]
> The YAML format is autodetected by the presence of a `solutions/` subfolder containing `*solution.yml` files.
> If your YAML manifest files (`solution.yml`, `solutioncomponents.yml`, and so on) are placed at the root of the folder rather than under `solutions/<SolutionUniqueName>/`, the tool doesn't detect the YAML format. The tool falls back to the XML path and reports a misleading error about a missing `Customizations.xml`. See [Troubleshooting](#troubleshooting) for information on how to fix this issue.

More information: [Solution YAML source control format reference](solution-source-control-yaml-format.md)

#### Format auto-detection rules

| Condition | Format used |
|---|---|
| `solutions/*/solution.yml` found — exactly one solution | YAML format, where the solution name is inferred from the folder |
| `solutions/*/solution.yml` found — multiple solutions | YAML format, where the `/SolutionName` argument is required |
| No `solutions/` subdirectory present | XML format (legacy) |

#### Packing a YAML format folder

The following command packs a YAML format folder.

```
SolutionPackager.exe /action:Pack /zipfile:MySolution.zip /folder:C:\repos\myrepo
```

#### Packing from a multi-solution folder

The following command packs a specified solution in a multi-solution folder.

```
SolutionPackager.exe /action:Pack /zipfile:SolutionA.zip /folder:C:\repos\myrepo /SolutionName:SolutionA
```

## Use the /map command argument  

The following discussion details the use of the /map argument to the SolutionPackager tool.  
  
Files that are built in an automated build system, such as \.xap Silverlight files and plug-in assemblies, are typically not checked into source control. Web resources may already be present in source control in locations that aren't directly compatible with the SolutionPackager tool. By including the /map parameter, the SolutionPackager tool can be directed to read and package such files from alternate locations and not from inside the Extract folder as it would typically be done. The /map parameter must specify the name and path to an XML file containing mapping directives. Those directives instruct the SolutionPackager to match files by their name and path, and indicate the alternate location to find the matched file. The following information applies to all directives equally.  
  
- Multiple directives may be listed including those directives that match identical files. Directives listed early in the file take precedence over directives listed later.  
  
- If a file is matched to any directive, it must be found in at least one alternative location. If no matching alternatives are found, the SolutionPackager issues an error.  
  
- Folder and file paths may be absolute or relative. Relative paths are always evaluated from the folder specified by the /folder parameter.  
  
- Environment variables may be specified by using a %variable% syntax.  
  
- A folder wildcard "**" may be used to mean "in any subfolder". It can only be used as the final part of a path, for example: "c:\folderA\\\*\*".  
  
- File name wildcards may be used only in the forms "*.ext" or "\*.\*". No other pattern is supported.  
  
  The three types of directives mappings are described here, along with an example that shows you how to use them.  
  
<a name="Folder_mapping"></a>

### Folder mapping  

The following information provides detailed information on folder mapping.  
  
**Xml Format**

`<Folder map="folderA" to="folderB" />`  
  
**Description**

File paths that match "folderA" are switched to "folderB".  
  
- The hierarchy of subfolders under each must exactly match.  
  
- Folder wildcards aren't supported.  
  
- No file names may be specified.  
  
  **Examples**

  ```xml  
  <Folder map="folderA" to="folderB" />  
  <Folder map="folderA\folderB" to="..\..\folderC\" />  
  <Folder map="WebResources\subFolder" to="%base%\WebResources" />  
  ```  
  
<a name="file_mapping"></a>

### File To file mapping  

The following information provides more details on file-to-file mapping.  
  
 **Xml Format**

`<FileToFile map="path\filename.ext" to="path\filename.ext" />`  
  
**Description**

Any file matching the `map` parameter is read from the name and path specified in the `to` parameter.  
  
 For the `map` parameter:  
  
- A file name must be specified. The path is optional. If no path is specified, files from any folder may be matched.  
  
- File name wildcards aren't supported.  
  
- The folder wildcard is supported.  
  
  For the `to` parameter:  
  
- A file name and path must be specified.  
  
- The file name may differ from the name in the `map` parameter.  
  
- File name wildcards aren't supported.  
  
- The folder wildcard is supported.  

**Examples**

```xml  
  <FileToFile map="assembly.dll" to="c:\path\folder\assembly.dll" />  
  <FileToFile map="PluginAssemblies\**\this.dll" to="..\..\Plugins\**\that.dll" />  
  <FileToFile map="Webresrouces\ardvark.jpg" to="%SRCBASE%\CrmPackage\WebResources\JPG format\aardvark.jpg" />  
```

```xml  
  <FileToFile
    map="pluginpackages\cr886_PluginPackageTest\package\cr886_PluginPackageTest.nupkg"
    to="myplg\bin\Debug\myplg.1.0.0.nupkg" /> 
```

In the above NuGet package example, cr886_PluginPackageTest.nupkg is not overwritten if the file already exists in the specified location.
  
<a name="file_path_mapping"></a>

### File to path mapping  

The following provides detailed information on file-to-path mapping.  
  
**Xml Format**

`<FileToPath map="path\filename.ext" to="path" />`  
  
**Description**  

Any file matching the `map` parameter is read from the path specified in the `to` parameter.  
  
For the `map` parameter:  
  
- A file name must be specified. The path is optional. If no path is specified, files from any folder may be matched.  
  
- File name wildcards are supported.  
  
- The folder wildcard is supported.  
  
For the `to` parameter:  
  
- A path must be specified.  
  
- The folder wildcard is supported.  
  
- A file name must not be specified.  
  
  **Examples**

```xml  
  <FileToPath map="assembly.dll" to="c:\path\folder" />  
  <FileToPath map="PluginAssemblies\**\this.dll" to="..\..\Plugins\bin\**" />  
  <FileToPath map="*.jpg" to="%SRCBASE%\CrmPackage\WebResources\JPG format\" />  
  <FileToPath map="*.*" to="..\..\%ARCH%\%TYPE%\drop" />  
```  
  
<a name="Example_mapping"></a>

### Example mapping  

The following XML code sample shows a complete mapping file that enables the SolutionPackager tool to read any web resource and the two default generated assemblies from a Developer Toolkit project named CRMDevTookitSample.  
  
```xml  
<?xml version="1.0" encoding="utf-8"?>  
<Mapping>  
       <!-- Match specific named files to an alternate folder -->  
       <FileToFile map="CRMDevTookitSamplePlugins.dll" to="..\..\Plugins\bin\**\CRMDevTookitSample.plugins.dll" />  
       <FileToFile map="CRMDevTookitSampleWorkflow.dll" to="..\..\Workflow\bin\**\CRMDevTookitSample.Workflow.dll" />  
       <!-- Match any file in and under WebResources to an alternate set of subfolders -->  
       <FileToPath map="WebResources\*.*" to="..\..\CrmPackage\WebResources\**" />  
       <FileToPath map="WebResources\**\*.*" to="..\..\CrmPackage\WebResources\**" />  
</Mapping>  
```  
  
<a name="managed"></a>

## Managed and unmanaged solutions  

 A Dataverse compressed solution (.zip) file can be exported in one of two types as shown here.  
  
 **Managed solution**  
 A completed solution ready to be imported into an organization. Once imported, components can't be added or removed, although they can optionally allow further customization. This is recommended when development of the solution is complete.  
  
 **Unmanaged solution**  
 An open solution with no restrictions on what can be added, removed, or modified. This is recommended during development of a solution.  
  
 The format of a compressed solution file will be different based on its type, either managed or unmanaged. The SolutionPackager can process compressed solution files of either type. However, the tool can't convert one type to another. The only way to convert solution files to a different type, for example from unmanaged to managed, is by importing the unmanaged solution .zip file into a Dataverse server and then exporting the solution as a managed solution.  
  
 The SolutionPackager can process unmanaged and managed solution .zip files as a combined set via the /PackageType:Both parameter. To perform this operation, it is necessary to export your solution twice as each type, naming the .zip files as follows.  

:::row:::
   :::column span="":::
      Unmanaged .zip file: AnyName.zip
   :::column-end:::
   :::column span="":::
      Managed .zip file: AnyName_managed.zip
   :::column-end:::
:::row-end:::
  
 The tool will assume the presence of the managed zip file in the same folder as the unmanaged file and extract both files into a single folder preserving the differences where managed and unmanaged components exist.  
  
 After a solution has been extracted as both unmanaged and managed, it is possible from that single folder to pack both, or each type individually, using the /PackageType parameter to specify which type to create. When specifying both files, two .zip files will be produced using the naming convention as above. If the /PackageType parameter is missing when packing from a dual managed and unmanaged folder, the default is to produce a single unmanaged .zip file.  
  
## Troubleshooting  

### Message displayed when using Visual Studio to edit resource files

If you use Visual Studio to edit resource fsiles created by the solution packager, you may receive a message when you repack similar to this: `"Failed to determine version id of the resource file <filename>.resx the resource file must be exported from the solutionpackager.exe tool in order to be used as part of the pack process."` This happens because Visual Studio replaces the resource file's metadata tags with data tags.  
  
#### Workaround  
  
1. Open the resource file in your favorite text editor and locate and update the following tags:  
  
   ```xml  
   <data name="Source LCID" xml:space="preserve">  
   <data name="Source file" xml:space="preserve">  
   <data name="Source package type" xml:space="preserve">  
   <data name="SolutionPackager Version" mimetype="application/x-microsoft.net.object.binary.base64">  
  
   ```  
  
2. Change the node name from `<data>` to `<metadata>`.  
  
    For example, this string:  
  
   ```xml  
   <data name="Source LCID" xml:space="preserve">  
     <value>1033</value>  
   </data>  
  
   ```  
  
    Changes to:  
  
   ```xml  
   <metadata name="Source LCID" xml:space="preserve">  
     <value>1033</value>  
   </metadata>  
  
   ```  
  
   This allows the solution packager to read and import the resource file. This problem has only been observed when using the Visual Studio Resource editor.  

### Error: "Cannot find required file …\Other\Customizations.xml" with a YAML folder

This error appears when you run SolutionPackager (or `pac solution pack`) against a folder that contains YAML files such as `solution.yml`, but those files are placed at the root of the folder rather than inside the required `solutions/<SolutionUniqueName>/` subfolder.

**Cause:** The tool detects the YAML source control format by looking for a `solutions/` subfolder containing `*solution.yml` files. When that directory is absent, the tool silently falls back to the XML (legacy) format and expects `Other\Customizations.xml`. The resulting error message refers to an XML file and doesn't mention YAML, which is misleading.

**Fix:** Reorganize the folder so that the YAML manifest files are under the correct paths:

```
<rootFolder>/
  solutions/<YourSolutionUniqueName>/   ← move solution.yml here
    solution.yml
    solutioncomponents.yml
    rootcomponents.yml
    missingdependencies.yml
  publishers/<YourPublisherUniqueName>/
    publisher.yml
```

If you obtained the folder from a Git integration commit or `pac solution clone`, the folder structure should already be correct. A folder that only contains the top-level YAML files without the `solutions/` subdirectory represents an incomplete extract and can't be packed directly.

### Warning: component declared in rootcomponents.yml has no source files

This warning appears when a component, such as a canvas app, is listed in `rootcomponents.yml` but no corresponding source files exist in the expected component folder (for example, `canvasapps/<schema-name>/`).

**Effect:** The tool still succeeds (exit code 0) and produces a valid `.zip` file, but the declared component is omitted from the packaged solution.

**Cause:** The folder was produced by a partial extract, or the component's source files weren't included in the repository. For example, only the solution manifest files were committed and not the canvas app itself.

**Fix:** Ensure all components declared in `rootcomponents.yml` have corresponding source files present in the folder. For canvas apps, the `.msapp` file must exist under `canvasapps/<schema-name>/`. If any files are missing, re-export the full solution from Dataverse and unpack it again, or use `pac solution clone` to obtain a complete extract.

### See also

- [Use Source Control with Solution Files](use-source-control-solution-files.md)
- s[Solution concepts](solution-concepts-alm.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
