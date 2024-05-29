---
title: "Request credentials to access D365 product database"
description: "Learn how to request credentials to access D365 product database just in time."
author: pathaku
ms.date: 05/21/2024
ms.topic: how-to
ms.reviewer: phecke
ms.author: pathaku
ms.subservice: developer
---

# Request credentials to access D365 finance and operations product database (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

A developer at times benefits from read/write access to the product database. We enable you to request credentials just in time, right from Visual Studio. 
As explained in [Write, deploy, and debug X++ code (preview)](finance-operations-debug.md) the business data is hosted in the cloud. 
This feature applies only to Unified development environments. The developer needs to be a sysAdmin in the environment.


1. Launch Visual Studio if not already running.
1. In the **Tools** menu, select **SQL Credentials for Dynamics 365 FinOps...** .
   :::image type="content" source="../media/unified-experience/UDE_SQLJitMenu.png" alt-text="Visual Studio> Tools> SQL Credentials for Dynamics 365 FinOps...":::
3. Enter the reason for requesting access credentials to the database.
4. The credentials are allowed for use only from clients using allowed IP v4 addresses so connections attempts from machines other than in the specified IPv4 range are denied by the Azure SQL firewall.
5. The dialog is pre populated by default with only the current developer machine's public ip v4 address.
6. You may need to update this IP V4 address range in case you want to use the credentials from other machines or your developer machine has ip address allocated to it very dynamically. 
   :::image type="content" source="../media/unified-experience/UDE_SQLJitWindowRequest.png" alt-text="Visual Studio> Tools> SQL Credentials for Dynamics 365 FinOps Request window":::
7. The dialog indicates that the access request is being processed.
   :::image type="content" source="../media/unified-experience/UDE_SQLJitProgress.png" alt-text="Visual Studio> Tools> SQL Credentials for Dynamics 365 FinOps Progress":::
5. On successful completion of request the dialog is populated with the credentials, and you can use the buttons to copy the same to clipboard.
   :::image type="content" source="../media/unified-experience/UDE_SQLJitWindowResponse.png" alt-text="Visual Studio> Tools> SQL Credentials for Dynamics 365 FinOps Response":::
7. The dialog includes the expiration time for the credentials.
8. You can request new credentials anytime. If credentials, already requested, are still valid and were requested from the same instance of Visual studio you can access them by reopening the dialog.
9. A credential granted for a given user in an environment invalidates any existing credential for the same user in the same environment.
10. Multiple users can have an active credential each, in a given environment
11. A user can have a credential each in multiple environments.

### See also

[Write, deploy, and debug X++ code (preview)](finance-operations-debug.md)
[Unit testing in the unified developer experience](finance-operations-testing.md)   
[Create and manage environments in the Power Platform admin center](/power-platform/admin/create-environment)  
[Manage Dynamics 365 apps](../../admin/manage-apps.md)
[Use SQL to query data in Dataverse](/power-apps/developer/data-platform/dataverse-sql-query)

[!INCLUDE [footer-banner](../../includes/footer-banner.md)]
