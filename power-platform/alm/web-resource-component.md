---
title: "Web resources | Microsoft Docs"
description: "Learn about including Web resources in solutions."
keywords: 
author: phecke
ms.author: pehecke
manager: kvivek
ms.custom: ""
ms.date: 04/10/2020
ms.reviewer: "pehecke"
ms.service: powerapps
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
applies_to: 
  - "Dynamics 365 (online)"
  - "Dynamics 365 Version 9.x"
  - "powerapps"
ms.assetid: 
search.audienceType: 
  - developer
search.app: 
  - PowerApps
  - D365CE
---

# Web resources

Solutions can be used to package and deploy web resources to other environments.
To manually add a web resource to a solution, follow these steps.

1.  Open the unmanaged solution you want to add the web resource to by using [Power Apps](https://make.powerapps.com/?utm_source=padocs&utm_medium=linkinadoc&utm_campaign=referralsfromdoc)

2.  Select **Add existing** \> **Other** \> **Web resource**.

3.  Search for the web resource by name.

4.  Select the web resource, and then select **Add**

You can also add web resources to a solution by using code. Use the
`SolutionUniqueName` optional parameter to associate a web resource with a
specific solution when the web resource is created. This is demonstrated in this
sample: [Import files as web resources](../developer/model-driven-apps/sample-import-files-web-resources.md).

### See also

[Configuration Migration and Package Deployer tools](configure-and-deploy-tools.md)

<!--
### See also

[ALM for developers](alm-for-developers.md)  
[Use Power Apps build tools with Azure DevOps](devops-build-tools.md)  
[Power Apps component framework](component-framework.md)  
[Plug-ins](plugin-component.md)  
[Configuration Migration and Package Deployer tools](configure-and-deploy-tools.md)  
[Solution Packager tool](solution-packager-tool.md)  
[Online Management API (REST) to manage environments](online-management-api.md)  
[Work with solutions using the APIs](solution-api.md)  
-->