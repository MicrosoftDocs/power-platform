---
title: "Visual Studio Integration (Preview)"
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
# Visual Studio Integration (Preview)

[!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

Code-first developers can now create custom connectors from within Visual Studio. Together with the existing capabilities developers have to build Microsoft Azure Functions or APIs in Visual Studio, this Visual Studio integration enables a complete end-to-end experience in custom connector development.

With the Power Platform as a connected service in Visual Studio, ASP.NET web API developers can create a custom connector to be used to create Power Apps and with Power Automate.

## Tunneling

When a developer is working in an API within Visual Studio, the service is running in your localhost. By using the tunneling feature from Visual Studio, you can expose your local service to a public endpoint before publishing your API.

## OpenAPI definition

To create a custom connector, you must describe the API you want to connect to so that the connector understands the API's operations and data structures. You can provide an OpenAPI file, or Visual Studio generates it for you.

## Next steps

Try the Power Platform connected service

> [!div class="nextstepaction"]
> [Create a Canvas App front end for your ASP.NET web API](visual-studio-create-canvas-app.md)<br/>

