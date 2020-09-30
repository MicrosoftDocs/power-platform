---
title: "Power Apps analytics   | MicrosoftDocs"
description: The admin reports provide a view into environment level usage, errors, service performance.
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/04/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Admin Analytics for Power Apps

Analytics for the environment admin is available at the Power Platform admin center. The admin reports provide a view into environment level usage, errors, service performance to drive governance, and change management services to users. These reports are available for canvas apps only and not available for model-driven apps.

To access these reports, sign in to the Power Platform admin center and select **Analytics** > **Power Apps**. Reports appear in a menu bar at the top of the page.

> [!div class="mx-imgBorder"] 
> ![Power Apps analytics menu](media/powerapps-analytics-menu.png "Power Apps analytics menu")

## Who can view these reports?

Admins with the following roles and a [license](pricing-billing-skus.md) can view the reports in Power Apps analytics:
- Environment Admin - can view reports for the environments that the admin has access to.
- Power Platform admin – can view reports for all environments.
- Dynamics 365 admin - can view reports for all environments.
- Microsoft 365 Global admin – can view reports for all environments.

For more information on the different roles for managing your tenant across the platform, see [Use service admin roles to manage your tenant](use-service-admin-role-manage-tenant.md).

## Where is my data stored? 

When a user first creates an environment from a region, the environment is always hosted in that region. The data is stored only in the region that an environment is hosted in. Data is stored for a maximum of 28 days. The data refresh cycle is about 3 hours and the last refresh time in UTC time standard is displayed on the upper-right corner of the page. 

## What are the available reports? 

There are six reports available for Power Apps admins. The last viewed environment is selected by default.  

**Usage** report is the default reports seen by the logged in environment admin. It provides total app launches and daily active users across all apps in the environment. Admins can filter the view with attributes like device platform, player version, country, state, and city.

> [!div class="mx-imgBorder"] 
> ![Power Apps analytics usage report](media/powerapps-analytics-usage.png "Power Apps analytics usage report")

**Location** report provides a map-based view of usage. It gives an insight into regional adoption and usage trends.  

> [!div class="mx-imgBorder"] 
> ![Power Apps analytics location report](media/powerapps-analytics-location.png "Power Apps analytics location report")

**Toast Errors** report provides insights into the toast error trends, types, and counts per app to help drive improvements in app quality. The toast errors are errors displayed to the end users of the app. 

> [!div class="mx-imgBorder"] 
> ![Power Apps analytics error report](media/powerapps-analytics-toast-errors.png "Power Apps analytics error report")

**Service Performance** report provides details of all standard and custom connectors to understand performance bottlenecks and client versus service API issues. An environment admin will get insights into:  

- Connectors used in the environment. 
- Best and least performant service and the API service response times.  
- Success rates for each service to determine areas that need attention. 
- The 50th, 75th, and 90th percentile response times for each service. 
- The number of HTTP 500 error codes of connectors indicating issues around the server not responding to calls from the client. 
- The number of successful connection requests. 

All the service performance KPI's can be filtered with attributes like a specific service or connector, device platform, player version, and country, state, or city to drill down into the specific API. 

> [!div class="mx-imgBorder"] 
> ![Power Apps analytics service performance report](media/powerapps-analytics-service-performance.png "Power Apps analytics service performance report")

**Connectors report** provides visibility into the standard and custom connectors being used by canvas apps. The last 28 days of data is visible at the environment level.  

Admins can gain insights into the number of connectors associated with each app, the specific connectors being used by each app, and the owner of the connector. It also provides data on the number of times the app has been shared, the number of app sessions, and the last accessed time for visibility into high usage apps and connectors.  

**A sample scenario**: An admin can gain insight into the number of shares and usage of a specific finance app using one or more connectors. This will allow the admin to engage with the app owner to ensure no sensitive data is inadvertently being shared through the app.  

Note that the current iteration of this specific report does not have a download report feature. 

> [!div class="mx-imgBorder"] 
> ![Power Apps analytics connector report](media/powerapps-analytics-connector.png "Power Apps analytics connector report")

## How can I download the reports? 

The reports are built on Power BI. To download a report, select the ellipsis (…) of the specific KPI and select **Export data**. 

> [!div class="mx-imgBorder"] 
> ![Power Apps analytics export data](media/powerapps-analytics-export-data.png "Power Apps analytics export data")

## How do I change environments? 

Select **Change Filter** or the **Filter** button (![Filter button](media/filters-button.png "Filter button")) in the upper-right corner of the page.

> [!div class="mx-imgBorder"] 
> ![Select Change Filter or Filter](media/powerapps-analytics-filter.png "Select Change Filter or Filter")

Select the environment and time period from the drop-down lists, and then select **Apply** to save the changes. All the Power Apps analytics reports will now use this selection.

> [!div class="mx-imgBorder"] 
> ![Power Apps analytics change environments](media/powerapps-analytics-change-environments.png "Power Apps analytics change environments")

## FAQ

### Why are some apps missing in my report?
Currently, Power Apps analytics reports do not display model-driven apps data. Only canvas apps related data is displayed.