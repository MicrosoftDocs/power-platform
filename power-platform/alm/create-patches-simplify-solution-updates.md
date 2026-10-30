---
title: "Create patches to simplify solution updates with Microsoft Dataverse"
description: "Patches help you manage tables and all of its related assets when you add a table to a solution and export that solution"
ms.custom: ""
ms.date: 10/28/2026
ms.reviewer: "pehecke"
ms.topic: how-to
author: "caburke"
ms.subservice: alm
ms.author: "jdaly"
search.audienceType: 
  - developer
---
# Create patches to simplify solution updates

If you add a table to a solution and export the solution, you export the table and all related assets in that solution. These assets include columns (attributes), forms, views, relationships, and visualizations, along with any other assets that are packaged with the table. Exporting all objects means you can unintentionally modify objects on the target deployment or carry over unintended dependencies.  
  
 To address dependencies, create and publish solution patches that contain subcomponents of tables rather than publishing the entire table and all its assets. You can roll up (merge) the original solution and one or more related patches at a later time into an updated version of the solution, which can then replace the original solution in the target Microsoft Dataverse organization.  
  
## Patches

You can apply patches to either managed or unmanaged solutions and include only changes to tables and related table assets. Patches don't contain any noncustomized system components or relationships that they depend on because these components already exist in the deployed-to organization. At some point in your development cycle, you can roll up all the patches into a new solution version to replace the original solution that the patches were created from.  
  
The Dataverse database stores patches as `Solution` table records. A non-null `ParentSolutionId` attribute indicates that the solution is a patch. You can create and manage patches through the SDK for .NET or Web APIs, which are useful for developing automation such as a product install script. However, the Dataverse web application provides various web forms that enable you to interactively create and manage patches.  
  
- You can only create patches from a parent solution by using <xref:Microsoft.Crm.Sdk.Messages.CloneAsPatchRequest> or <xref href="Microsoft.Dynamics.CRM.CloneAsPatch?text=CloneAsPatch Action" />.  
- The patch parent can't be a patch.  
- Patches can only have one parent solution.  
- A patch creates a dependency, at the solution level, on its parent solution.  
- You can only install a patch if the parent solution is present.  
- You can't install a patch unless the unique name and major or minor version number of the parent solution, as identified by `ParentSolutionId`, don't match those of the parent solution installed in the target organization.  
- A patch version must have the same major and minor number, but a higher build and release number, than the parent solution version number. The display name can be different.  
- If a solution has patches, subsequent patches must have a numerically higher version number than any existing patch for that solution.  
- Patches support the same operations as solutions, such as additive update, but not removal. You can't remove components from a solution by using a patch. To remove components from a solution, perform an upgrade.  
- You must import patches exported as managed on top of a managed parent solution. The rule is that patch protection (managed or unmanaged) must match its parent.  
- Don't use unmanaged patches for production purposes.  
  
The SolutionPackager and PackageDeployer tools support solution patches. Refer to the tool's online help for any command-line options that are related to patches.  
  
## Create a patch

Create a patch from an unmanaged solution in an environment by using the <xref:Microsoft.Crm.Sdk.Messages.CloneAsPatchRequest> message or the <xref href="Microsoft.Dynamics.CRM.CloneAsPatch?text=CloneAsPatch Action" />, or by using the web application. When you create the patch, you lock the original solution and can't change or export it as long as dependent patches exist in the environment that identify the solution as the parent solution. Patch versioning is similar to solution versioning and specified in the following format: *major.minor.build.release*. You can't change the existing major or minor solution versions when you create a patch.
  
## Export and import a patch

Use the SDK for .NET or Web APIs, the web application, or the Package Deployer tool to export and import a patch. The relevant SDK for .NET request classes are <xref:Microsoft.Crm.Sdk.Messages.ImportSolutionRequest> and <xref:Microsoft.Crm.Sdk.Messages.ExportSolutionRequest>. The relevant actions for the Web API are <xref href="Microsoft.Dynamics.CRM.ImportSolution?text=ImportSolution Action" /> and <xref href="Microsoft.Dynamics.CRM.ExportSolution?text=ExportSolution Action" />.  
  
### Patching examples

The following table lists the details of a patching example. In this example, you import the solution and patches in numerical order and are additive, which is consistent with solution import in general.  
  
|Patch name|Description|  
|----------------|-----------------|  
|`SolutionA`, version 1.0 (unmanaged)|Contains `entityA` with six fields.|  
|`SolutionA`, version 1.0.1.0 (unmanaged)|Contains `entityA` with six fields (three updated), and adds `entityB` with 10 fields.|  
|`SolutionA`, version 1.0.2.0 (unmanaged)|Contains `entityC` with 10 fields.|  
  
 The import process is as follows.  
  
1. The developer or customizer first imports the base solution (`SolutionA` 1.0) into the environment. The result is `entityA` with six fields in the environment.  
1. Next, import the `SolutionA` patch 1.0.1.0. The environment now contains `entityA` with six fields (three updated), plus `entityB` with 10 fields.  
1. Finally, import the `SolutionA` patch 1.0.2.0. The environment now contains `entityA` with six fields (three updated), `entityB` with 10 fields, plus `entityC` with 10 fields.  
  
### Another patching example

Let's look at another patching example. The following table lists the details.  
  
|Patch name|Description|  
|----------------|-----------------|  
|`SolutionA`, version 1.0 (unmanaged, base solution)|Contains the `Account` table where the length of the account number column is adjusted from 20 to 30 characters.|  
|`SolutionB`, version 2.0 (unmanaged, different vendor)|Contains the `Account` table where the length of the account number column is adjusted to 50 characters.|  
|`SolutionA`, version 1.0.1.0 (unmanaged, patch)|Contains an update to the `Account` table where the length of the account number column is adjusted to 35 characters.|  
  
The import process is as follows:  
  
1. The developer or customizer first imports the base solution (`SolutionA` 1.0) into the environment. The result is an `Account` table with an account number column of 30 characters.  
1. Import `SolutionB`. The environment now contains an `Account` table with an account number column of 50 characters.  
1. Import `SolutionA` patch 1.0.1.0. The environment still contains an `Account` table with an account number column of 50 characters, as applied by `SolutionB`.  
1. Uninstall `SolutionB`. The environment now contains an `Account` table with an account number column of 35 characters, as applied by the `SolutionA` 1.0.1.0 patch.  
  
## Delete a patch  

You can delete a patch or base (parent) solution by using <xref:Microsoft.Xrm.Sdk.Messages.DeleteRequest> or, for the Web API, use the `HTTP DELETE` method. The delete process is different for a managed or unmanaged solution that has one or more patches existing in the environment.  
  
For an unmanaged solution, you must uninstall all patches to the base solution first, in reverse version order that they were created, before uninstalling the base solution.  
  
For a managed solution, you simply uninstall the base solution. The Dataverse system automatically uninstalls the patches in reverse version order before uninstalling the base solution. You can also just uninstall a single patch.  
  
## Update a solution

Updating a solution involves merging all patches to that solution into a new version of the solution. Afterwards, that solution becomes unlocked and can once again be modified (unmanaged solution only) or exported. For a managed solution, no further modifications of the solution are allowed except for creating patches from the newly updated solution. To roll up patches into an unmanaged solution, use <xref:Microsoft.Crm.Sdk.Messages.CloneAsSolutionRequest> or the <xref href="Microsoft.Dynamics.CRM.CloneAsSolution?text=CloneAsSolution Action" />. Cloning a solution creates a new version of the unmanaged solution, incorporating all its patches, with a higher *major.minor* version number, the same unique name, and a display name.
  
For a managed solution, things are handled slightly differently. You first clone the unmanaged solution (A), incorporating all of its patches, and then export it as a managed solution (B). In the target organization that contains the managed version of the (A) solution and its patches, you import managed solution (B) and then execute <xref:Microsoft.Crm.Sdk.Messages.DeleteAndPromoteRequest> or the <xref href="Microsoft.Dynamics.CRM.DeleteAndPromote?text=DeleteAndPromote Action" /> to replace managed solution (A) and its patches with the upgraded managed solution (B) that has a higher version number.  
  
### See also

[Use segmented solutions](segmented-solutions-alm.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
