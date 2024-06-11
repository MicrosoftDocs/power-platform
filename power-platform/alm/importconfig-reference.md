---
title: "ImportConfig Reference"
description: "Contains reference information about editing the ImportConfig.xml file used by the package deployer tool"
author: marcelbf
ms.author: marcelbf
ms.subservice: alm
ms.date: 06/10/2024
ms.reviewer: jdaly
ms.topic: reference
search.audienceType: 
  - developer
---
# ImportConfig Reference

The ImportConfig.xml file used with package deployer contains information about the solutions and data to import. The following is an example:

```xml
<?xml version="1.0" encoding="utf-16"?>
<configdatastorage 
   installsampledata="true"
   waitforsampledatatoinstall="true"
   agentdesktopzipfile=""
   agentdesktopexename=""
   crmmigdataimportfile="data_1033.zip">
   <solutions>
      <configsolutionfile 
         solutionpackagefilename="SampleSolutionOne_1_0_managed.zip"
         overwriteunmanagedcustomizations="false"
         publishworkflowsandactivateplugins="true" />
      <configsolutionfile 
         solutionpackagefilename="SampleSolutionTwo_1_0_managed.zip"
         overwriteunmanagedcustomizations="false"
         publishworkflowsandactivateplugins="true" />
      <configsolutionfile 
         solutionpackagefilename="SampleSolutionThree_1_0_managed.zip" />
   </solutions>
   <filestoimport>
      <configimportfile filename="SampleOption.csv"
         filetype="CSV"
         associatedmap="SampleOption"
         importtoentity="sample_option"
         datadelimiter=""
         fielddelimiter="comma"
         enableduplicatedetection="true"
         isfirstrowheader="true"
         isrecordownerateam="false"
         owneruser=""
         waitforimporttocomplete="false" />
      <configimportfile filename="File.zip"
         filetype="ZIP"
         associatedmap="FileMapName"
         importtoentity="FileEntity"
         datadelimiter=""
         fielddelimiter="comma"
         enableduplicatedetection="true"
         isfirstrowheader="true"
         isrecordownerateam="false"
         owneruser=""
         waitforimporttocomplete="true" />
      <zipimportdetails>
         <zipimportdetail filename="subfile1.csv"
            filetype="csv"
            importtoentity="account" />
         <zipimportdetail filename="subfile2.csv"
            filetype="csv"
            importtoentity="contact" />
      </zipimportdetails>
   </filestoimport>
   <filesmapstoimport>
      <configimportmapfile filename="SampleOption.xml" />
   </filesmapstoimport>
   <cmtdatafiles>
      <cmtdatafile filename="data_1033.zip"
         lcid="1033"
         usermapfilename="UserMap.xml" />
      <cmtdatafile filename="data_1041.zip"
         lcid="1041"
         usermapfilename="" />
   </cmtdatafiles>
</configdatastorage>
```

The following sections provide details about the valid XML elements and attributes for this document.

## `configdatastorage` element

`configdatastorage` is the root element.

### configdatastorage attributes

All of these attributes are optional.

|Name|Description|
|---------|---------|
|`installsampledata`|Whether to install sample data. This is the same sample data installed using these other methods:<br />- [Add or remove sample data](../admin/add-remove-sample-data.md)<br />- [Add and remove sample data with code](/power-apps/developer/data-platform/sample-data) |
|`waitforsampledatatoinstall`|If `true`, and if `installsampledata` is also set to `true`, waits for sample data to install before deploying the package. Don't set this to `true` when `installsampledata` is `false`.|
|`agentdesktopzipfile`|File name of the zip file to unpack. If you specify a .zip file name here, it adds a screen during the package deployment process that prompts you to select a location where you want to unpack the contents of the file.<br /><br />This attribute is commonly used for creating packages for [Unified Service Desk for Dynamics 365](/dynamics365/unified-service-desk/unified-service-desk). |
|`agentdesktopexename`|Name of the .exe or .msi file in the zip file or a URL to be invoked at the end of the deployment process.<br /><br />This attribute is commonly used for creating packages for [Unified Service Desk for Dynamics 365](/dynamics365/unified-service-desk/unified-service-desk).|
|`crmmigdataimportfile`|File name of the default configuration data file (.zip) exported using the Configuration Migration tool.|

### configdatastorage elements

These are the valid child elements:

|Element|Descriptions|
|---------|---------|
|`solutions`|Contains 0 or many [`configsolutionfile` elements](#configsolutionfile-element) that describe solutions to import.|
|`filestoimport`|Contains<br /> - 1 or many [`configimportfile` elements](#configimportfile-element)<br /> - 0 or many [`zipimportdetails` element](#zipimportdetails-element) that describe individual files and zip files to be imported.|
|`filesmapstoimport`|Contains 1 or many [`configimportmapfile` element](#configimportmapfile-element). The order of the map files in this element indicates the order in which they're imported. [Learn more about creating data maps for import](/power-apps/developer/data-platform/create-data-maps-for-import) |
|`cmtdatafiles`|Contains 1 or many [`cmtdatafile` elements](#cmtdatafile-element) that contain localized version of the configuration data file to be imported.|

## `configsolutionfile` element

Describes solutions to import in the `configdatastorage.solutions` element.

### configsolutionfile attributes

|Name|Description|
|---------|---------|
|`solutionpackagefilename`|**Required** Specify the .zip file name of your solution.|
|`overwriteunmanagedcustomizations`|**Optional** Whether to overwrite any unmanaged customizations when importing a solution that already exists in the target environment. If you don't specify this behavior, the unmanaged customizations in the existing solution are maintained on the target environment.|
|`publishworkflowsandactivateplugins`|**Optional** Whether to publish workflows and activate plug-ins in the target environment after the solution is imported.If you don't specify this behavior, the workflow are published and plug-ins activated.|

## `configimportfile` element

Describes files to import in the `configdatastorage.filestoimport` element.

### configimportfile attributes

|Name|Description|
|---------|---------|
|`filename`|Name of the file that contains the import data. |
|`filetype`|This value can be `csv`, `xml`, or `zip`. If the file is a .zip file, a [`zipimportdetails` element](#zipimportdetails-element) must be present with a [`zipimportdetail` element](#zipimportdetail-element) for each file in the .zip file.|
|`associatedmap`|Name of the Dataverse import data map to use with this file. If blank, Dataverse attempts to use the system determined import data map name for this file.|
|`importtoentity`|Can be the name of the exe in the zip file, a URL, or an .msi file to provide a link to invoke at the end of the process.|
|`datadelimiter`|Name of the data delimiter used in the import file. Valid values are single quote or double quotes.|
|`fielddelimiter`|Name of the field delimiter used in the import file. Valid values are comma or colon, or single quote.|
|`enableduplicatedetection`|Whether to enable duplicate detections rules on data import. Valid values are `true` or `false`.|
|`isfirstrowheader`|Whether the first row of the import file contains the field names. Valid values are `true` or `false`.|
|`isrecordownerateam`|Whether the owner of the record on import should be a team. Valid values are `true` or `false`.|
|`owneruser`|The user ID that should own the records. The default value is the currently logged in user.|
|`waitforimporttocomplete`|If `true`, the system waits for the import to complete before proceeding. If `false`, it queues the jobs and moves on.|


## `zipimportdetails` element

Describes zip files to import in the `configdatastorage.filestoimport` element when the `configimportfile.filetype` is `zip`.

Contains 1 or more [`zipimportdetail` elements](#zipimportdetail-element) that provide information about an individual file within the zip file specified in the [`configimportfile` element](#configimportfile-element).


## `zipimportdetail` element

Provide information about an individual file within the zip file specified in the [`configimportfile` element](#configimportfile-element).

### zipimportdetail attributes

|Name|Description|
|---------|---------|
|`filename`|Name of the file that contains the import data.|
|`filetype`|This value can be `csv` or `xml`.|
|`importtoentity`|Can be the name of the exe in the zip file, a url, or an .msi file to provide a link to invoke at the end of the process.|

## `configimportmapfile` element

Contains information about an individual map file to import in Dataverse.

### configimportmapfile attributes

|Name|Description|
|---------|---------|
|`filename`|The name of the file containing the mapping data.|

## `cmtdatafile` element

Specifies the localized configuration data files along with locale ID (required) and user information map file (optional).

### cmtdatafile example

```xml
<cmtdatafiles>
   <cmtdatafile filename="data_1033.zip"
      lcid="1033"
      usermapfilename="UserMap.xml" />
   <cmtdatafile filename="data_1041.zip"
      lcid="1041"
      usermapfilename="" />
</cmtdatafiles>
```

### cmtdatafile attributes

|Name|Description|
|---------|---------|
|`filename`|The name of the file containing the mapping data.|
|`lcid`|The string representation of the LCID language code identifier.|
|`usermapfilename`|For Dynamics 365 (on-premises) only. Contains the user map file (.xml) generated using the Configuration Migration tool in your project. This file is required to import user information to a Dynamics 365 (on-premises) instance on a different domain.|
