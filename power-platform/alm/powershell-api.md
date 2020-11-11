---
title: "Work with solutions using PowerShell | Microsoft Docs"
description: "Learn about the PowerShell APIs, service, and module that are available to analyze solutions against a set of best practice rules."
keywords: 
author: mikkelsen2000
ms.author: pemikkel
manager: kvivek
ms.custom: ""
ms.date: 06/16/2020
ms.reviewer: "pehecke"
ms.service: powerapps
ms.topic: "article"
search.audienceType: 
  - developer
search.app: 
  - PowerApps
  - D365CE
---

# Work with solutions using PowerShell
The Power Apps checker web API provides a mechanism to run static analysis
checks against customizations and extensions to the Microsoft Dataverse
platform. It's available for makers and developers to perform rich static
analysis checks on their solutions against a set of best practice rules to
quickly identify problematic patterns. To begin using the Power Apps checker Web
API, see [Getting started](/checker-api/overview#getting-started).

The checker service provides the logic for the [solution checker feature](/powerapps/maker/common-data-service/use-powerapps-checker) in the Power Apps maker [portal](https://make.powerapps.com/) and is included as part of the automation for [applications submitted to AppSource](/powerapps/developer/common-data-service/publish-app-appsource). In this section, we describe how to run a best practice solution analysis of your customizations and extensions in your DevOps pipeline to verify the quality of your solution component.

> [!TIP]
> **Tip #1**: Consider using the PowerShell module,
> [Microsoft.PowerApps.Checker.PowerShell](https://www.powershellgallery.com/packages/Microsoft.PowerApps.Checker.PowerShell), instead of using the web API. The
> module is a fully supported tool that's available in the
> [PowerShell Gallery](https://www.powershellgallery.com/). The current restriction is
> that it does require Windows PowerShell in your project pipeline. If you're
> unable to meet this requirement, interacting with the web APIs directly
> will likely be the best approach.<p/>
> **Tip #2**: You can easily manage solutions using PowerShell as part of your custom automation. Refer to the [Microsoft.Xrm.Data.PowerShell](https://github.com/seanmcne/Microsoft.Xrm.Data.PowerShell) module and [sample code](https://github.com/seanmcne/Microsoft.Xrm.Data.PowerShell.Samples/tree/master/Solutions). For example:<br/>
> `Export-CrmSolution "MySolution"`<p/>
> `Export-CrmSolution -conn $conn -SolutionName "MySolution" -Managed -SolutionFilePath "C:\temp" -SolutionZipFileName "MySolution_Managed.zip"`<p/>
> `Import-CrmSolutionAsync -SolutionFilePath c:\temp\mysolution.zip -ActivateWorkflows -OverwriteUnManagedCustomizations -MaxWaitTimeInSeconds 600`

In addition, there is a checker task in the Azure DevOps build tools include a checker task. For more information about using that task in your build pipeline, see [Quality check](devops-build-tool-tasks.md#quality-check).

### See also
[PowerShell modules](tools-apps-used-alm.md#powershell-modules)  
[Online Management API (REST) to manage environments](online-management-api.md)
