---
title: Introductions to the Power Platform ISV Studio app install failure analytics| Microsoft Docs
description: Measure app's performance and get insights.
ms.date: 04/03/2023
ms.reviewer: jdaly
author: angela21k
ms.author: angelakim
suite: powerapps
ms.topic: article
ms.subservice: developer
search.audienceType: 
  - developer
contributors: 
  - JimDaly
---

# Install failures


[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

As an ISV, you need data like failure details or failure count to quickly resolve the issues for the customers. You can use the install failures feature to get the install failures data.

The install failures features makes it easy for you to quickly resolve the issues that customer encounter while installing your application by providing the detailed error logs thus reducing the time for the customers to get the issues resolved.

With the install failures feature, you can see the install failures data by date, GEO, package, and by solution version. You can also see the failure details on the install failures dashboard.

:::image type="content" source="media/isv-install-failure-report.png" alt-text="Install failure dashboard.":::
 
## View the install failure dashboard

To view the install failure data:

1. Sign in to [ISV studio](https://aka.ms/ISVStudio/).
1. On the **Home** page, you can see a list of published applications. Select the desired application for which you want to see the install failure details.
1. Scroll-down to the page to view all the apps. Select the app and select the **Install Failures** tab.
1. You can also see the install failure details by directly selecting the install failure icon from the list of apps as shown in the screenshot:

   :::image type="content" source="media/isv-install-failure-icon.png" alt-text="Failure icon":::

The install failures tab contains the following graphs and metrics.

### Failure by date

The line chart shown below illustrates the number of app installation failures occurred by date. When hovering over the graph, the following information is shown:

 1. Failure Count
 1. Date

:::image type="content" source="media/isv-failure-by-date.png" alt-text="Date":::

### Failure by Geo

The pie chart shown below illustrates the number app installation failures by GEO. When hovering over the graph, the following information is shown:

1. Geo 
1. Failure Count

:::image type="content" source="media/isv-failure-by-geo.png" alt-text="Geo":::

### Failure by solution version

The bar chart shown below illustrates the number of app installation failures occurred by package version. When hovering over the graph, the following information is shown:

1. Package Version
1. Failure Type
1. Failure Count

:::image type="content" source="media/isv-failure-by-package-version.png" alt-text="Package version":::

### Failure details

Tracks the information about the app install failure error in detail. The following details are shown in the failure details tab:

1. Category
1. Date
1. Count
1. Failure
1. Type
1. Package
1. Version
1. Environment
1. Tenant

:::image type="content" source="media/isv-install-error-details.png" alt-text="Install error details":::

You can drill through the **Failure** column to see the full failure details. To see the full failure details, right-click on one of the error messages on the **Failure details** tab and then select **Drill through** > **Failure details**.

:::image type="content" source="media/isv-failure-details-drill-through.png" alt-text="Failure details":::

### Filtering the install failure dashboard

ISVs can filter the install failures dashboard using the filters available. For example, an ISV can filter to see the metrics at **Package & Solution version**, **Geo**, and **Date range** level.

### See also

[App usage analytics](usage-analytics.md)<br/>
[Home page](home.md)  
[App page](app.md)<br/> 
[Tenant page](tenant.md)<br/>
[AppSource checker](appsource-checker.md)<br/>
[Connector Certification](connector-certification.md)
