---
title: Microsoft Power Platform CLI paportal command| Microsoft Docs
description: "Includes descriptions and supported parameters for the paportal command."
keywords: Microsoft Power Platform CLI, code components, component framework, CLI
ms.subservice: 
author: kkanakas
ms.author: kartikka
manager: pemikkel
ms.date: 06/07/2022
ms.reviewer: jdaly
ms.topic: reference
contributors: 
  - JimDaly
---

# Paportal

Commands to work with [Portals support for Microsoft Power Platform CLI](/power-apps/maker/portals/power-apps-cli).

## Parameters

|Property Name|Description|Example|
|-------------|-----------|-------|
|download|Download portal website content from the current Dataverse environment. It has the following parameters: <ul><li>*path*: Path where the website content will be downloaded (alias: -p).</li><li>*webSiteId*: Portal website ID to download (alias: -id).</li><li>*overwrite*: (Optional) true to overwrite existing content, false to fail if the folder already has website content (alias: -o).</li></ul>|`pac paportal download --path "C:\portals" --webSiteId f88b70cc-580b-4f1a-87c3-41debefeb902`|
|list|Lists all portal websites from the current Dataverse environment. |`pac paportal list`|
|upload|Upload portal website content to the current Dataverse environment. It has the following parameter:<ul><li>*path*: Path where the website content is stored (alias: -p).</li><li>*deploymentProfile*: Upload portal data with environment details defined through [profile variables](/powerapps/maker/portals/power-apps-cli) in *deployment-profiles/[profile-name].depoyment.yaml* file.</li></ul> |`pac paportal upload --path "C:\portals\starter-portal"`|

### See also

[What is Microsoft Power Platform CLI?](../power-platform-cli.md)

[!INCLUDE [footer-banner](../../../includes/footer-banner.md)]