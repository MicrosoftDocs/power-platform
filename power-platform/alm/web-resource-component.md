---
title: "How to add web resources to a solution"
description: "Developers implementing ALM can use solutions to package and deploy web resources to other environments. Follow these steps to add a resource to a solution."
keywords: 
author: mikkelsen2000
ms.subservice: alm
ms.author: pemikkel
manager: kvivek
ms.custom: ""
ms.date: 05/05/2020
ms.reviewer: "pehecke"
ms.service: power-platform
ms.topic: "article"
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
sample: [Import files as web resources](/powerapps/developer/model-driven-apps/sample-import-files-web-resources).

### See also

[Configuration Migration and Package Deployer tools](configure-and-deploy-tools.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
