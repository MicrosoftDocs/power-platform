---
title: "Visual Studio connected service (Preview)"
description: "Add Power Platform as a connected service in Visual Studio to create a Custom Connector."
author: marcelbf
ms.subservice: developer
ms.author: marcelbf
ms.date: 4/6/2023
ms.reviewer: jdaly
ms.topic: article
search.audienceType: 
  - developer
---
# Visual Studio connected service (Preview)

[!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

Code-first developers can now create custom connectors from within Visual Studio. Together with the existing capabilities developers have to build Microsoft Azure Functions or APIs in Visual Studio, this Visual Studio integration enables a complete end-to-end experience in custom connector development.

[Connected Services](https://learn.microsoft.com/en-us/visualstudio/azure/overview-connected-services?view=vs-2022) is a collection of tools in Visual Studio that help you connect to different services. For Visual Studio 2022, we added support for the Microsoft Power Platform for [ASP.NET Core Web API projects](https://learn.microsoft.com/en-us/aspnet/core/tutorials/first-web-api?view=aspnetcore-7.0&tabs=visual-studio). With this integration, you can do the following:

- Connect to a [Microsoft Power Platform environment](https://learn.microsoft.com/en-us/power-platform/admin/create-environment)
- Automatically generate a [custom connector](https://learn.microsoft.com/en-us/connectors/custom-connectors/) for your Power Platform environment
- Configure a [dev tunnel](https://learn.microsoft.com/en-us/aspnet/core/test/dev-tunnels?view=aspnetcore-7.0) to locally connect to your custom connector

Dev tunnels enable an ad-hoc connection between your web API running locally and your Power Apps. This feature can be used, to locally debug and test your web API in the context of the Microsoft Power Platform in real time (inner loop).

## Prerequisites

- [Visual Studio 2022](https://visualstudio.microsoft.com/vs/) version 17.5 or later with the ASP.NET and web development workload installed. You need to be signed in to Visual Studio to create and use dev tunnels. The feature isn't available in Visual Studio for Mac.
- [Dev tunnels](https://learn.microsoft.com/en-us/aspnet/core/test/dev-tunnels?view=aspnetcore-7.0) preview feature enabled. Select Tools > Options > Environment > Preview Features > Enable dev tunnels for Web Applications.
- An ASP.NET Core Web API project - Tutorial: Create a web API with ASP.NET Core | Microsoft Learn
- A Microsoft Power Automate environment – more info: [Create a Developer Environment](https://review.learn.microsoft.com/en-us/power-platform/developer/create-developer-environment).

## Limitations

The current integration only works for the following dev tunnels configurations:
- Tunnel type: Persistent
- Access type: Public

## Next steps

Get started by right-clicking on the Connected Services node in Solution Explorer and select Manage Connected Services. Search for Power Platform and setup your connection.

> [!div class="nextstepaction"]
> [Create a Canvas App front end for your ASP.NET web API](visual-studio-create-canvas-app.md)<br/>

