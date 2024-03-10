---
title: Tenant page of ISV Studio | Microsoft Docs
description: Learn about the Tenant page capabilities provided by the ISV Studio portal.
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

# The Tenant page

To view the install history of a tenant, the ISV can switch to **Top tenants** view on the home page and select a tenant.

:::image type="content" source="media/isv-portal-homepage-tenantpivot.png" alt-text="Install history of a tenant":::

The Tenant page contains the following graphs and metrics:

:::image type="content" source="media/isv-portal-tenantpage.png" alt-text="Tenant page":::

## Installs by date

The line chart shown below illustrates the number of app installations occurred by date. 

When hovering over the graph, the following information is shown:

Install Count: Number of app installations happened on a particular date.

:::image type="content" source="media/isv-portal-tenantpage-graph1.png" alt-text="Successfully installed apps":::

## Installs by geo

The pie chart shown below illustrates the number of app installations occurred by Geo.

When hovering over the graph, the following information is shown:

1. Geo
2. Install Count

:::image type="content" source="media/isv-portal-tenantpage-graph2.png" alt-text="Package installs by environment type":::

## Installs by environment

The pie chart shown below illustrates the ratio of production vs. sandbox app installs across the install base.

When hovering over the graph, the following information is shown:

1. Environment
2. Install Count

:::image type="content" source="media/isv-portal-tenantpage-graph3.png" alt-text="Package Installs by environment location":::

## Installs by application

The column chart shown below displays the package unique names where versions of the selected app are displayed. All packages are selected by default, and all installed versions of all package (by tenant) are displayed on the graph. The user can select one or more packages and versions for further slicing and dicing. When the user selects a package, the version drop-down is updated to have the corresponding version of the selected package.

When hovering over any item of the graph, the following information is shown:

1. Application
1. Count
1. Package
1. Version 
1. Environment

:::image type="content" source="media/isv-portal-tenantpage-graph4.png" alt-text="Package and version installs by environment":::

## Filtering the tenant page

ISVs can filter the tenant page using the filters available. For example, an ISV can filter to see the metrics at Package & Solution version, Geo, and Date range level.

### See also

[Introduction to ISV Studio for the Power Platform](index.md)  
[Home page](home.md)<br/> 
[App page](app.md)<br/> 
[AppSource checker](appsource-checker.md)<br/> 
[Connector Certification](connector-certification.md)
