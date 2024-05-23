---
title: "Request credentials to access D365 product database"
description: "Learn how to request credentials to access D365 product database just in time."
author: pathaku
ms.date: 05/21/2024
ms.topic: how-to
ms.reviewer: phecke
ms.author: pvillads
ms.subservice: developer
---

# Request credentials to access D365 finance and operations product database (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

As a developer you may at times benefit from read/write access to the product database. We enable you to request credentials just in time right from Visual Studio. 
Note that, as explained in [Write, deploy, and debug X++ code (preview)](finance-operations-debug.md) the business data is hosted in the cloud.


1. Launch Visual Studio if not already running.
1. In the **Tools** menu, select **SQL Credentials for Dynamics 365 FinOps...** .
2. :::image type="content" source="../media/unified-experience/UDE_SQLJitMenu.png" alt-text="Visual Studio> Tools> SQL Credentials for Dynamics 365 FinOps...":::
3. Enter the reason for requesting access credentials to the database.
4. :::image type="content" source="../media/unified-experience/UDE_SQLJitWindowRequest.png" alt-text="Visual Studio> Tools> SQL Credentials for Dynamics 365 FinOps Request window":::
5. The dialog will indicate that the access request is being processed.
6. :::image type="content" source="../media/unified-experience/UDE_SQLJitProgress.png" alt-text="Visual Studio> Tools> SQL Credentials for Dynamics 365 FinOps Progress":::
5. Once the request completes successfully the dialog will be populated with the credentials and you can use the buttons to copy the same to clipboard.
6. :::image type="content" source="../media/unified-experience/UDE_SQLJitWindowResponse.png" alt-text="Visual Studio> Tools> SQL Credentials for Dynamics 365 FinOps Response":::

### See also

[Write, deploy, and debug X++ code (preview)](finance-operations-debug.md)
[Unit testing in the unified developer experience](finance-operations-testing.md)   
[Create and manage environments in the Power Platform admin center](/power-platform/admin/create-environment)  
[Manage Dynamics 365 apps](../../admin/manage-apps.md)

[!INCLUDE [footer-banner](../../includes/footer-banner.md)]
