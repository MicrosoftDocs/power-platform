---
title: "Visual Studio Integration (Preview)"
description: "Add Power Platform as a connected service in Visual Studio to create a Custom Connector."
author: marcelbf
ms.subservice: developer
ms.author: marcelbf
ms.custom: ""
ms.date: 4/6/2023
ms.reviewer: kvivek
ms.topic: "article"
search.audienceType: 
  - developer
search.app: 
  - PowerPlatform
  - PowerApps
  - VisualStudio
  - CustomConnector
  - Azure
---
# Visual Studio Integration

Today, when code-first developers build Microsoft Azure Functions or APIs, they can register such capabilities directly in Azure without having to leave their Visual Studio development environment. Now, they can also create custom connectors from within Visual Studio, thereby allowing a complete end-to-end experience in custom connector development.

With the Power Platform as a connected service in Visual Studio, AST.NET web API developers can create a Custom Connector to be used to create Power Apps and Power Automate.

## Tunnelling

When a developer is working in an API within Visual Studio, the service is running in your localhost. By using the tunnelling feature from Visual Studio, you can expose your local service to public endpoint before before publishing your API.

## Open API definition

To create a custom connector, you must describe the API you want to connect to so that the connector understands the API's operations and data structures. You can provide an open api file, or Visual Studio will generate it for you.

