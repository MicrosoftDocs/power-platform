---
title: "Manage solutions using PowerShell | Microsoft Docs"
description: "Learn about the PowerShell APIs, service, and module that are available to analyze solutions against a set of best practice rules."
author: marcelbf
ms.author: marcelbf
ms.subservice: alm
ms.date: 12/23/2022
ms.reviewer: pehecke
ms.topic: concept-article
search.audienceType: 
  - developer
---

# Manage solutions using PowerShell

The PowerShell cmdlets let you automate many of the monitoring, management, and quality assurance tasks in Power Platform.

## Microsoft.PowerApps.Administration.PowerShell

The Power Apps administration module is used to manage users, databases, connectors, apps, flows, and permissions in Dataverse environments. More information: [Use Microsoft.PowerApps.Administration.PowerShell](/powershell/powerapps/get-started-powerapps-admin)

## Microsoft.Xrm.Tooling.CrmConnector

The connector module is used to connect to and retrieve environment or organization details from Dataverse and Dynamics 365 Customer Engagement (on-premises) deployments. More information: [Use Microsoft.Xrm.Tooling.CrmConnector](/powershell/powerapps/get-started-connector)

## Microsoft.Xrm.Tooling.PackageDeployment

The package deployment module is used to deploy packages. More information: [Use Microsoft.Xrm.Tooling.PackageDeployment](/powershell/powerapps/get-started-packagedeployment)

## Microsoft.PowerApps.Checker.PowerShell

The Power Apps checker module interacts with the Power Apps checker service providing the ability to run static analysis jobs and download the results. The module is a community supported tool that's available in the [PowerShell Gallery](https://www.powershellgallery.com/packages/Microsoft.PowerApps.Checker.PowerShell). More information: [Use Microsoft.PowerApps.Checker.PowerShell](/powershell/powerapps/get-started-powerapps-checker)

The current restriction is
that it does require Windows PowerShell in your project pipeline. If you're unable to meet this requirement, interacting directly with the [Power Checker Web API](checker-api/overview.md) might be a better approach.

There is a checker task in the Azure DevOps build tools include a checker task. More information about using that task in your build pipeline: [Quality check](devops-build-tool-tasks.md#quality-check).

> [!NOTE]
> [Microsoft.Xrm.Data.PowerShell](https://github.com/seanmcne/Microsoft.Xrm.Data.PowerShell) module is another community supported tool that lets you easily manage solutions using PowerShell as part of your custom automation. See sample code [here](https://github.com/seanmcne/Microsoft.Xrm.Data.PowerShell.Samples/tree/master/Solutions). For example:<br/>
> `Export-CrmSolution "MySolution"`<p/>
> `Export-CrmSolution -conn $conn -SolutionName "MySolution" -Managed -SolutionFilePath "C:\temp" -SolutionZipFileName "MySolution_Managed.zip"`<p/>
> `Import-CrmSolutionAsync -SolutionFilePath c:\temp\mysolution.zip -ActivateWorkflows -OverwriteUnManagedCustomizations -MaxWaitTimeInSeconds 600`

### See also

[PowerShell modules](/powershell/powerapps/overview)  

[!INCLUDE[footer-include](../includes/footer-banner.md)]
