---
title: "Create a Canvas App front end for your ASP.NET web API"
description: "Learn how to use the Power Platform connected service integration with Visual Studio to create a canvas Power App for your ASP.NET web API"
author: marcelbf
ms.subservice: developer
ms.author: marcelbf
ms.date: 04/06/2023
ms.reviewer: jdaly
ms.topic: how-to
search.audienceType: 
  - developer
---
# Create a Canvas App front end for your ASP.NET web API

Power Platform enables web API developers to quickly build mobile or web applications using a Power Apps canvas app as a front end. With the Power Platform connected service in Visual Studio, ASP.NET web API developers can create a custom connector you can use with Power Apps and Power Automate.

You can start creating a canvas app before publishing your API to a public endpoint using Visual Studio *dev tunnels*. Dev Tunnels allows the web API to be running locally, while you build a Power App during the inner loop and debug in real time.

This tutorial uses the sample ASP.NET Weather web API to create a custom connector that you can use with a canvas app.

:::image type="content" source="media/vs-powerApp.png" alt-text="Power app created from sample ASP.NET Weather web API":::

## Prerequisites

- Download [Visual Studio 2022 version 17.6 Preview 3](/visualstudio/releases/2022/release-notes-preview) with the **ASP.NET and web development**  workload installed.
- One Power Platform environment with permission to create custom connectors.

>[!NOTE]
>
> If you need help getting started with Microsoft Power Platform, go to [Create a Developer Environment](create-developer-environment.md).

## Step 1: Create a new ASP.NET project in Visual Studio

1. Create a new **ASP.NET Core Web API** project, and then select **Next**.
1. Type `WeatherSample` into **Project name**, and then select **Next**.
1. Select **Create**.

Step 1 created a solution named `WeatherSample` with a `WeatherSample` project. This project contains an example controller for a RESTful HTTP service.

## Step 2: Add Power Platform as a connected service

:::image type="content" source="media/vs-step2-1.png" alt-text="Add service dependency":::

1. In **Solution Explorer**, right-click the **Connected Services** node, and, from the context menu, select **Manage Connected Services**.
1. In the **Connected Services** tab, select the **+** icon for **Service Dependencies**.
1. On the **Add dependency** dialog, type `Power Platform` into the search box.
1. Select **Microsoft Power Platform**, and then select **Next**.
1. If you aren't signed in already, sign into your Microsoft Power Platform account. If you don't have a Power Platform account, [Create a Developer Environment](create-developer-environment.md).
1. In the **Connect to Microsoft Power Platform** screen: select your developer environment.
1. In **Custom connectors name**, the value `WeatherSample_Connector` should already be set.
1. In **Select a public dev tunnel**, select the **+** icon.
   
   1. In the field **Name**, type `SampleTunnel`.
   1. Select **Tunnel Type**: **Persistent**.
   <!-- I don't see the option to select Tunnel Type or Access after upgrading to VS 2022 v17.5.3 I don't have the preview version installed  -->
   1. Select **Access** : **public**.
   1. Select **OK**.
   
1. Select **Finish**
1. Once the connected service is configured, select **Close**.

## Step 3: Create a Power App with the Custom Connector

When a tunnel is active and Visual Studio runs a web app, the web browser opens to a tunnel URL instead of a localhost URL. With your Visual Studio Solution running:

1. In Visual Studio, start debugging. You can press **F5** or your preferred method.
1. The browser opens. You will see a warning page on the first request sent to the tunnel URL. Select **Continue**.
1. With the web API running, in a new browser, open [Power Apps](https://make.powerapps.com). Select your developer environment in the top right corner.
1. [Create a blank canvas app](/power-apps/maker/canvas-apps/create-blank-app). Select **Phone** as the format.
1. In the top menu, select **Add data**.
1. Type `WeatherSample` in the search box. Select the **WeatherSample_Connector**, and select **Connect**. More information: [Add connections to your canvas app](/power-apps/maker/canvas-apps/add-data-connection)
<!-- Above didn't work for me with VS 2022 v17.5.3. I don't have the preview version installed -->
1. In the menu, select **Insert** > **Button**. Drag and drop the button to the bottom of the form. Change the **Text** to **Load Data**.
1. Add the following formula to the **OnSelect** property:
   
   ```powerapps-dot
   ClearCollect(weatherCollection, WeatherSample_Connector.GetWeatherForecast())
   ```
   
1. In the menu, select [Insert Vertical Gallery](/power-apps/maker/canvas-apps/add-gallery). Select the **weatherCollection** as the data source. Change the layout to title and subtitle.
1. Run the app. You should see the result as shown at the top this article.

## Step 4: Debug your API

With your power app running you can set a breakpoint, and debug your Power Apps app or Power Automate flow. You can also use [Hot Reload](/visualstudio/debugger/hot-reload?view=vs-2022)


### See Also

[How to use dev tunnels in Visual Studio 2022 with ASP.NET Core apps](/aspnet/core/test/dev-tunnels)