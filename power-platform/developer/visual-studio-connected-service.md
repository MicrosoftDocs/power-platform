---
title: "Visual Studio connected service (preview)"
description: "Add Power Platform as a connected service in Visual Studio to create a custom connector."
author: marcelbf
ms.subservice: developer
ms.author: marcelbf
ms.date: 4/11/2023
ms.reviewer: jdaly
ms.topic: article
search.audienceType: 
  - developer
contributors:
- JimDaly
---
# Visual Studio connected service (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Code-first developers can now create custom connectors from within Visual Studio. Together with the existing capabilities developers have to build Microsoft Azure Functions or APIs in Visual Studio, this Visual Studio integration enables a complete end-to-end experience in custom connector development.

> [!IMPORTANT]
> - This is a preview feature.
> - [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)].

[Connected Services](/visualstudio/azure/overview-connected-services) is a collection of tools in Visual Studio that help you connect to different services. For Visual Studio 2022, we added support for the Microsoft Power Platform for [ASP.NET Core Web API projects](/aspnet/core/tutorials/first-web-api?tabs=visual-studio). With this integration, you can do the following:

- Connect to a [Microsoft Power Platform environment](/power-platform/admin/create-environment)
- Automatically generate a [custom connector](/connectors/custom-connectors/) for your Power Platform environment
- Configure a [dev tunnel](/aspnet/core/test/dev-tunnels) to locally connect to your custom connector

Dev tunnels enable an ad-hoc connection between your web API running locally and your Power Apps. This feature can be used, to locally debug and test your web API in the context of the Microsoft Power Platform in real time (inner loop).

## Prerequisites

- [Visual Studio 2022 version 17.6 Preview 2](/visualstudio/releases/2022/release-notes-preview) with the ASP.NET and web development workload installed. You need to be signed in to Visual Studio to create and use dev tunnels. The feature isn't available in Visual Studio for Mac.
- An [ASP.NET Core Web API project](/aspnet/core/tutorials/first-web-api?tabs=visual-studio)
- A Microsoft Power Platform environment. More information: [Create a developer environment](create-developer-environment.md).

## Limitations

The current integration only works for the following dev tunnels configurations:

- Tunnel type: Persistent
- Access type: Public

## Next steps

Get started by right-clicking on the **Connected Services** node in **Solution Explorer** and select **Manage Connected Services**. Search for **Power Platform** and setup your connection.

> [!div class="nextstepaction"]
> [Create a canvas app front end for your ASP.NET web API](visual-studio-create-canvas-app.md)<br/>

