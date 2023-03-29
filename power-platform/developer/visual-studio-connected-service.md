---
title: "Use Visual Studio and Power Apps to create a front-end app for ASP.NET web API"
description: "Add Power Platform as a connected service in Visual Studio to create a Custom Connector."
author: marcelbf
ms.subservice: developer
ms.author: marcelbf
ms.custom: ""
ms.date: 3/28/2023
ms.reviewer: kvivek
ms.topic: "tutorial"
search.audienceType: 
  - developer
search.app: 
  - PowerPlatform
  - PowerApps
  - VisualStudio
  - CustomConnector
  - Azure
---
# Use Visual Studio and Power Apps to create a front-end app for ASP.NET web API

Power Platform enables web API developers to quickly build mobile or web applications as a front end. With the Power Platform as a connected service in Visual Studio, AST.NET web API developers can create a Custom Connector to be used to create Power Apps and Power Automate.
Leveraging the tunnelling feature from Visual Studio, you can start creating a power app before publishing your API to a public endpoint. This allows the web API to be running locally, build a Power App during the inner loop and debug in real time.

This tutorial uses the sample ASP.NET Weather web API to create a custom connector that you can use with a canvas application.

:::image type="content" source="media/vs-powerApp.png" alt-text="Power app created from sample ASP.NET Weather web API":::

## Prerequisites

- Download Visual Studio 2022 Preview with the ASP.NET and web development workload installed.
- One Power Platform environment with permission to create custom connectors.

>[!NOTE]
>
> If you need help getting started with Microsoft Power Platform, go to [Create a Developer Environment](create-developer-environment.md).

## Step 1: Create a new ASP.NET project in Visual Studio

1. On the menu bar, select File > New > Project.
2. On the Create a new project page, type "web api" into the search box.
3. Select the ASP.NET Core Web API, and then click Next.
    :::image type="content" source="media/vs-step1-1.png" alt-text="Create a new project screen":::
4. Enter “WeatherSample” into Project name, and then click Next.
    :::image type="content" source="media/vs-step1-2.png" alt-text="Configure your new project screen":::
5. Click Create.
    :::image type="content" source="media/vs-step1-3.png" alt-text="Additional information screen":::

A Solution WeatherSample will be created with a Project WeatherSample. This project contains an example controller for a RESTful HTTP service.

## Step 2: Add Power Platform as a connected service

1. In Solution Explorer, right-click the Connected Services node, and, from the context menu, select Manage Connected Services.
2. In the Connected Services tab, select the + icon for Service Dependencies.
3. On the Add dependency page, type “Power Platform” into the search box.
4. Select Microsoft Power Platform, and then click Next.
5. If you aren’t signed in already, sign into your Microsoft Power Platform account. If you don’t have an Power Platform account, [Create a Developer Environment](create-developer-environment.md).
6. In the Connect to Microsoft Power Platform screen: select your developer environment.
7. In the Custom connectors, click the + icon and click in create.
8. In the Select a public dev tunnel, click the + icon.
    a. In the field Name, insert “SampleTunnel”.
    b. Select Tunnel Type = Persistent.
    c. Select Access = public.
    d. Click OK.
9. Click Finish
10. Once the connected service is configured, Click Close.

## Step 3: Create a Power App with the Custom Connector

When a tunnel is active and Visual Studio runs a web app, the web browser opens to a tunnel URL instead of a localhost URL.

1. In Visual Studio, Press F5, choose Debug > Start with debugging from the Visual Studio menu, or select the green Start arrow.
2. The browser will open. A warning page is show on the first request sent to the tunnel URL. Click Continue.
3. With the web API running, in a new browser, open the maker portal. Select your developer environment in the top right corner.
4. In the page, select Start from Blank app, and select Blank canvas app.
5. In App name, enter “WeatherSample”, select Phone as a format and click create.
6. Click in skip.
7. In the top menu, select add data.Type “WeatherSample” in the search box. Select the WeatherSample_Connector, and click in Connect.
8. In the menu, select Insert, Button. Drag and drop the button to the bottom of the form. Change the Text to Load Data.
9. Add the following formula to the OnSelect Property: ClearCollect(weatherCollection, WeatherSample_Connector.GetWeatherForecast())
10. In the menu, click Insert Vertical Gallery. Select the weatherCollection as the data source. Change the layout to title and subtitle.

## Step 4: Debug your API
