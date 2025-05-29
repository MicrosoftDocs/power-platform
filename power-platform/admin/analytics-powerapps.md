---
title: "Administrator analytics and reports for Microsoft Power Apps"
description: "Admins can view Microsoft Power Apps analytics in the Power Platform admin center, including reports on environment-level usage, errors, and service performance."
author: Zeffin
ms.component: pa-admin
ms.topic: concept-article
ms.date: 08/03/2023
ms.subservice: admin
ms.author: sericks
ms.reviewer: sericks
ms.custom: NewPPAC
search.audienceType: 
  - admin
---
# Admin Analytics for Power Apps

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Analytics for the environment admin is available at the Microsoft Power Platform admin center. The admin reports provide a view into environment level usage, errors, service performance to drive governance, and change management services to users. These reports are available for canvas apps only and not available for model-driven apps.

To access these reports:

### [Modern admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, under **Products**, select **Power Apps**.
1. View the reports on the right side. 

### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, expand **Analytics**, then select **Power Apps**.
1. View the reports on the right side. 
---

> [!div class="mx-imgBorder"] 
> ![Power Apps analytics menu.](media/powerapps-analytics-menu.png "Power Apps analytics menu")

## Who can view these reports?

Admins with the following roles and a [license](pricing-billing-skus.md) can view the reports in Power Apps analytics:
- Environment Admin - can view reports for the environments that the admin has access to.
- Power Platform admin – can view reports for all environments.
- Dynamics 365 admin - can view reports for all environments.
- Microsoft 365 Global admin – can view reports for all environments.

For more information on the different roles for managing your tenant across the platform, see [Use service admin roles to manage your tenant](use-service-admin-role-manage-tenant.md).

## Data Storage 

When a user first creates an environment from a region, the environment is always hosted in that region. The data is stored only in the region that an environment is hosted in. Data is stored for a maximum of 28 days. The data refresh cycle is about 24 hours and the last refresh time in UTC time standard is displayed on the upper-right corner of the page. 

## What are the available reports? 

There are six reports available for Power Apps admins. The last viewed environment is selected by default.  

**Usage** report is the default reports seen by the logged in environment admin. It provides total app launches and daily active users across all apps in the environment. Admins can filter the view with attributes like device platform, player version, country/region, state, and city.

> [!div class="mx-imgBorder"] 
> ![Power Apps analytics usage report.](media/powerapps-analytics-usage.png "Power Apps analytics usage report")

**Toast Errors** report provides insights into the toast error trends, types, and counts per app to help drive improvements in app quality. The toast errors are errors displayed to the end users of the app. 

> [!div class="mx-imgBorder"] 
> ![Power Apps analytics error report.](media/powerapps-analytics-toast-errors.png "Power Apps analytics error report")

**Service Performance** report provides details of all standard and custom connectors to understand performance bottlenecks and client versus service API issues. An environment admin gets insights into:  

- Connectors used in the environment. 
- Best and least performant service and the API service response times.  
- Success rates for each service to determine areas that need attention. 
- The 50th, 75th, and 90th percentile response times for each service. 
- The number of HTTP 500 error codes of connectors indicating issues around the server not responding to calls from the client. 
- The number of successful connection requests. 

Service performance KPIs are filterable by attributes such as service, connector, device platform, player version, and location (country, state, or city) to enhance API analysis. 

> [!div class="mx-imgBorder"] 
> ![Power Apps analytics service performance report.](media/powerapps-analytics-service-performance.png "Power Apps analytics service performance report")

**Connectors report** provides visibility into the standard and custom connectors being used by canvas apps. The last 28 days of data are visible at the environment level.  

Admins can analyze the number of connectors linked to each app, the specific connectors in use, and their respective owners. Additionally, they can track app-sharing frequency, total sessions, and last accessed time to identify high-usage apps and connectors. Currently, this functionality is limited to connections owned by the admin and activity within those specific connections.   

**A sample scenario**: An admin can monitor the number of shares and usage of a specific finance app that utilizes one or more connectors. This enables the admin to collaborate with the app owner to ensure no sensitive data is inadvertently shared through the app.  

The current iteration of this specific report doesn't have a download report feature. 

> [!div class="mx-imgBorder"] 
> ![Power Apps analytics connector report.](media/powerapps-analytics-connector.png "Power Apps analytics connector report")

## How can I download the reports? 

The reports are built on Power BI. To download a report, select the ellipsis (…) of the specific KPI and select **Export data**. 

> [!div class="mx-imgBorder"] 
> ![Power Apps analytics export data.](media/powerapps-analytics-export-data.png "Power Apps analytics export data")

## How do I change environments? 

Select **Change Filter** in the page.

> [!div class="mx-imgBorder"] 
> ![Select Change Filter or Filter.](media/powerapps-analytics-filter.png "Select Change Filter or Filter")

Select the environment and time period from the drop-down lists, and then select **Apply** to save the changes. All Power Apps analytics reports now reflect this selection.

> [!div class="mx-imgBorder"] 
> ![Power Apps analytics change environments.](media/powerapps-analytics-change-environments.png "Power Apps analytics change environments")

## FAQ

### Why are some apps missing in my report?
Currently, Power Apps analytics reports don't display model-driven apps data. Only canvas apps related data is displayed.


### See also
[Tenant-level analytics (default)](tenant-level-analytics.md) <br />
[Tenant-level Analytics for Power Apps (preview)](powerapps-analytics-reports.md)




[!INCLUDE[footer-include](../includes/footer-banner.md)]
