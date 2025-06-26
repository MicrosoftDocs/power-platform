---
title: Create a canvas app front end for your ASP.NET web API
description: Learn how to use dev tunnels and the Power Platform connected service integration with Visual Studio to create a canvas app for your ASP.NET web API.
ms.date: 06/02/2025
ms.subservice: developer
author: marcelbf
ms.author: marcelbf
ms.reviewer: jdaly
ms.topic: how-to
search.audienceType: 
  - developer
contributors:
  - JimDaly
ms.custom: bap-template
---

# Create a canvas app front end for your ASP.NET web API

Power Platform enables web API developers to quickly build mobile or web applications using a Power Apps canvas app as a front end. With the Power Platform connected service in Visual Studio 2022, ASP.NET web API developers can easily create a custom connector for use with Power Apps and Power Automate.

You can use Visual Studio [*dev tunnels*](/aspnet/core/test/dev-tunnels#create-a-tunnel) to create a canvas app before you publish your API to a public endpoint. Dev tunnels create an ad-hoc connection between your web API running locally and your Power Apps. You can use them to locally test and debug your web API in the context of the Power Platform in real-time (inner loop).

This tutorial uses the sample ASP.NET Weather web API to [add a connection to a canvas app](/power-apps/maker/canvas-apps/add-data-connection). It's based on the [Create a web API with ASP.NET Core](/aspnet/core/tutorials/first-web-api?tabs=visual-studio) tutorial.

## Prerequisites

- [Visual Studio 2022 version 17.6 Preview 2](/visualstudio/releases/2022/release-notes-preview) with the ASP.NET and web development workload installed. You need to be signed in to Visual Studio to create and use dev tunnels. The feature isn't available in Visual Studio for Mac.
- A [Power Platform developer environment](create-developer-environment.md) with permission to create custom connectors

## Create an ASP.NET project in Visual Studio

1. Create an ASP.NET Core web API project.
1. Select **Next**.
1. Enter *WeatherSample* for the **Project name**, and then select **Next**.
1. Select **Create**.

The `WeatherSample` project contains an example controller for a RESTful HTTP service.

## Add Power Platform as a connected service

:::image type="content" source="media/vs-step2-1.png" alt-text="Screenshot of adding a service dependency in Visual Studio." lightbox="media/vs-step2-1.png":::

1. In **Solution Explorer**, right-click the **Connected Services** node and select **Manage Connected Services** from the context menu.
1. In the **Connected Services** tab, select the **+** icon for **Service Dependencies**.
1. On the **Add dependency** dialog, type `Power Platform` into the search box.
1. Select **Microsoft Power Platform**, and then select **Next**.

   If you aren't signed in already, sign into your Microsoft Power Platform account. If you don't have a Power Platform account, [Create a Developer Environment](create-developer-environment.md).

1. In the **Connect to Microsoft Power Platform** screen: select your developer environment.
1. In **Custom connectors name**, the value `WeatherSample_Connector` should already be set.
1. In **Select a public dev tunnel**, select the **+** icon.

   1. In the field **Name**, type `SampleTunnel`.
   1. Select **Tunnel Type**: **Persistent**.
   1. Select **Access** : **public**.
   1. Select **OK**.

1. Select **Finish**
1. Once the connected service is configured, select **Close**.

## Create a canvas app with the custom connector

When Visual Studio runs a web app and a tunnel is active, the web browser opens to a tunnel URL instead of a localhost URL.

1. Run your Visual Studio solution and start debugging.
1. When the browser opens, a warning page opens with the first request sent to the tunnel URL. Select **Continue**.
1. With the web API running, open [Power Apps](https://make.powerapps.com) in a new browser tab.
1. Select your developer environment in the upper-right corner.
1. [Create a blank canvas app](/power-apps/maker/canvas-apps/create-blank-app) with **Phone** as the format.
1. In the top menu, select **Add data**.
1. Search for and select the **WeatherSample_Connector**, and then select **Connect**. More information: [Add connections to your canvas app](/power-apps/maker/canvas-apps/add-data-connection)
1. Insert a button and drag it to the bottom of the form.
1. Change the button **Text** to *Load Data*.
1. Enter the following formula in the button's **OnSelect** property:

   ```power-fx
   ClearCollect(weatherCollection, WeatherSample_Connector.GetWeatherForecast())
   ```

1. Insert a [vertical gallery](/power-apps/maker/canvas-apps/add-gallery)
1. Select the **weatherCollection** as the data source, and then change the layout to **Title and subtitle**.
1. Run the app. It should look like the following example:

    :::image type="content" source="media/vs-powerApp.png" alt-text="Screenshot of a Power Apps canvas app created using the sample ASP.NET Weather web API.":::

## Debug your API

With your canvas app running, set a breakpoint and debug it. You can also use [Hot Reload](/visualstudio/debugger/hot-reload).

### See also

[What are canvas apps](/power-apps/maker/canvas-apps/getting-started)  
[How to use dev tunnels in Visual Studio 2022 with ASP.NET Core apps](/aspnet/core/test/dev-tunnels)
