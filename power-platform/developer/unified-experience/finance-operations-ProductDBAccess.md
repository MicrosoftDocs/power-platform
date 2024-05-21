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

As explained in [Write, deploy, and debug X++ code (preview)](finance-operations-debug.md) the cloud hosts the business data and executes X++ code.

As a developer you may at times benefit from read/write access to the product database. We enable you to request credentials just in time right from Visual Studio.


## Summary

As a recap, here's a summary and the points to take away from this exercise.

We started with using Visual Studio to create a simple runnable class. After the compilation, the package needed to be pushed to the cloud endpoint for execution. X++ code can only be executed in the cloud, so we performed a deployment operation. Once the deployment was complete, we executed the code by setting a breakpoint and running the debugger. We then started a form from the browser, and noticed that breakpoints were hit correctly as the form was used, and we did'nt have to restart the debugger for that to happen. In fact, the debugger can be started by using the **Launch debugger** option on the **Extension** menu. You can then enter a URL in the browser and the breakpoints are hit.

### See also

[Write, deploy, and debug X++ code (preview)](finance-operations-debug.md)
[Unit testing in the unified developer experience](finance-operations-testing.md)   
[Create and manage environments in the Power Platform admin center](/power-platform/admin/create-environment)  
[Manage Dynamics 365 apps](../../admin/manage-apps.md)

[!INCLUDE [footer-banner](../../includes/footer-banner.md)]
