---
title: "Using REST APIs via custom connectors with canvas apps in Power Apps  | Microsoft Docs"
description: With custom connectors, developers can capitalize on existing investments in REST API services or create new APIs to expose complex server-side operations not available with out-of-the-box connectors.
author: slaouist
ms.service: power-platform
ms.topic: conceptual
ms.date: 06/20/2021
ms.author: mehdis
ms.reviewer: kvivek 
  
---
# Using REST APIs via custom connectors with canvas apps in Power Apps

With custom connectors, developers can capitalize on existing organization investments in REST API services or create new APIs to expose complex server-side operations that are not available with the out-of-the-box connectors. In this case, we're dealing with a middle-tier architecture where Power Apps is used as a UI layer. This architecture offers flexibility, but also means that more pro-developer work is needed to develop and maintain the web service and data layer. In general, as the complexity of the app increases, you should strongly consider this type of architecture. For example, when multiple data sources are needed to build a single view, we recommend that you use an API layer to deliver a performant experience, because the data response can be shaped server-side and delivered to the client more efficiently. The use of this middle-tier layer means that you can add a server-side caching layer and implement richer telemetry for the app. 

To enable Logic Apps, Power Automate, or Power Apps to communicate with the REST or SOAP API, use a custom connector, which is a wrapper around a REST API (Logic Apps also supports SOAP APIs). A high-level architecture of how custom connectors work is shown in the following image.

<!--![Diagram of custom connector architecture.](./media/CustomConnectorArchitecture.png)-->
:::image type="complex" source="./media/CustomConnectorArchitecture.png" alt-text="Diagram of custom connector architecture.:::
   <!--NOTE FROM EDITOR: NEED DETAILED ALT TEXT HERE-->
:::image-end:::


For detailed information, go to [Connectors overview](/connectors/connectors).

As an example, Microsoft built a suite of employee engagement mobile apps that have been deployed worldwide to more than 100,000 employees. The apps are built on top of existing APIs deployed by IT.

<!--![Diagram of Thrive apps architecture.](./media/Thrivearch.png)-->
:::image type="complex" source="./media/Thrivearch.png" alt-text="Diagram of Thrive apps architecture.":::
   <!--NOTE FROM EDITOR: NEED DETAILED ALT TEXT HERE-->
:::image-end:::


In particular, the Thrive home app (which is essentially an internal company news feed) shows various events and activities happening within the company and also shows various user-customized cards such as a vacation balance card. <!--note from editor: The following is repeated from earlier in the article: The IT team found that when multiple data sources are needed to build a single view, the use of an API layer was instrumental to delivering a performant experience, because the data response can be shaped server-side and delivered to the client more efficiently.--> 

View the full story here: [Blog: Microsoft HR uses the Power Platform to transform employee experiences](https://powerapps.microsoft.com/blog/microsoft-thrive/)


![Screenshot of the Thrive home app showing news highlights, apps, and common tasks for employees.](./media/thrive.png)