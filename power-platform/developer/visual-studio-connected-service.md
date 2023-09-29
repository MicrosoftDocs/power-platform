---
title: Visual Studio connected service
description: Add Power Platform as a connected service in Visual Studio to create a custom connector.
author: marcelbf
ms.author: marcelbf
ms.reviewer: jdaly
ms.date: 6/14/2023
ms.subservice: developer
ms.topic: overview
search.audienceType: 
  - developer
contributors:
- JimDaly
ms.custom: bap-template
---

# Visual Studio connected service

Developers can use [Connected Services](/visualstudio/azure/overview-connected-services) within Visual Studio to create custom connectors. Connected Services is a collection of tools in Visual Studio that help you connect to services. With the existing capabilities developers have to build Microsoft Azure Functions or APIs in Visual Studio, the Connected Services integration offers a complete end-to-end experience in custom connector development.

For Visual Studio 2022 17.7, we added Connected Services support for the Microsoft Power Platform for [ASP.NET Core web API projects](/aspnet/core/tutorials/first-web-api?tabs=visual-studio). This integration allows you to:

- Connect to a [Power Platform environment](/power-platform/admin/create-environment).
- Automatically generate a [custom connector](/connectors/custom-connectors/) for your Power Platform environment.
- Configure a [dev tunnel](/aspnet/core/test/dev-tunnels) to locally connect to your custom connector.

Dev tunnels create an ad-hoc connection between your web API running locally and your Power Apps. You can use them to locally test and debug your web API in the context of the Power Platform in real-time (inner loop).

## Prerequisites

- [Visual Studio 2022 version 17.7(/visualstudio/releases/2022/release-notes#power-platform-connected-services) with the ASP.NET and web development workload installed. You need to be signed in to Visual Studio to create and use dev tunnels. The feature isn't available in Visual Studio for Mac.

- An [ASP.NET Core web API project](/aspnet/core/tutorials/first-web-api?tabs=visual-studio)
- A [Power Platform developer environment](create-developer-environment.md)

## Limitations

The current integration works only for the following configurations of dev tunnels:

- Tunnel type: Persistent
- Access type: Public

## Next steps

To get started, right-click the **Connected Services** node in **Solution Explorer** and select **Manage Connected Services**. Search for and select **Power Platform**, and then set up your connection.

> [!div class="nextstepaction"]
> [Create a canvas app front end for your ASP.NET web API](visual-studio-create-canvas-app.md)
