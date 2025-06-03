---
title: "Administrator analytics and reports for Microsoft Power Apps"
description: "Admins can view Microsoft Power Apps analytics in the Power Platform admin center, including reports on environment-level usage, errors, and service performance."
author: Zeffin
contributor: yingchin
ms.component: pa-admin
ms.topic: concept-article
ms.date: 06/02/2025
ms.subservice: admin
ms.author: sericks
ms.reviewer: ellenwehrle
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
1. View the reports on the Power Apps analytics page.

### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, expand **Analytics**, then select **Power Apps**.
1. View the reports on the Power Apps analytics page.

---

:::image type="content" source="media/analytics-powerapps/powerapps-analytics-menu.png" alt-text="Shows the menu on the Power Apps analytics page." lightbox="media/analytics-powerapps/powerapps-analytics-menu.png":::

## Who can view these reports?

Admins with the these roles and a [license](pricing-billing-skus.md) can view the reports in Power Apps analytics:

- Environment Admin - can view reports for the environments that the admin has access to.
- Power Platform admin – can view reports for all environments.
- Dynamics 365 admin - can view reports for all environments.
- Microsoft 365 Global admin – can view reports for all environments.

For more information on the different roles for managing your tenant across the platform, see [Use service admin roles to manage your tenant](use-service-admin-role-manage-tenant.md).

## Data Storage

When a user first creates an environment from a region, the environment is always hosted in that region. The data is stored only in the region that an environment is hosted in. Data is stored for a maximum of 28 days. The data refresh cycle is about 24 hours and the last refresh time in UTC time standard is displayed on the upper-right corner of the page.

## What are the available reports?

There are six reports available for Power Apps admins. The last viewed environment is selected by default.  

**Usage** report is the default report available to environment admins. It provides total app launches and daily active users across all apps in the environment. As an admin, you can filter the view with attributes like device platform, player version, country/region, state, and city.

:::image type="content" source="media/analytics-powerapps/powerapps-analytics-usage.png" alt-text="Shows the Power Apps usage report." lightbox="media/analytics-powerapps/powerapps-analytics-usage.png":::

**Toast Errors** report provides insights into the toast error trends, types, and counts per app to help drive improvements in app quality. The toast errors are errors displayed to the end users of the app.

:::image type="content" source="media/analytics-powerapps/powerapps-analytics-toast-errors.png" alt-text="Shows the Power Apps error report." lightbox="media/analytics-powerapps/powerapps-analytics-toast-errors.png":::

**Service Performance** report provides details of all standard and custom connectors to understand performance bottlenecks and client versus service API issues. As an environment admin, you get insights into:  

- Connectors used in the environment.
- Best and least performant service and the API service response times.  
- Success rates for each service to determine areas that need attention.
- The 50th, 75th, and 90th percentile response times for each service.
- The number of HTTP 500 error codes of connectors indicating issues around the server not responding to calls from the client.
- The number of successful connection requests.

Service performance KPIs are filterable by attributes such as service, connector, device platform, player version, and location (country, state, or city) to enhance API analysis.

:::image type="content" source="media/analytics-powerapps/powerapps-analytics-service-performance.png" alt-text="Shows the Power Apps analytics service performance report." lightbox="media/analytics-powerapps/powerapps-analytics-service-performance.png":::

**Connectors report** provides visibility into the standard and custom connectors used by canvas apps. The last 28 days of data are visible at the environment level.  

As an admin, you can analyze the number of connectors linked to each app, the specific connectors in use, and their respective owners. Additionally, you can track app-sharing frequency, total sessions, and last accessed time to identify high-usage apps and connectors. Currently, this functionality is limited to connections owned by the admin/admin team and activity within those specific connections.

**A sample scenario**: An admin can monitor the number of shares and usage of a specific finance app that utilizes one or more connectors. This enables the admin to collaborate with the app owner to ensure no sensitive data is inadvertently shared through the app.  

The current iteration of this specific report doesn't have a download report feature.

:::image type="content" source="media/analytics-powerapps/powerapps-analytics-connector.png" alt-text="Shows the Power Apps analytics connector report." lightbox="media/analytics-powerapps/powerapps-analytics-connector.png":::

## How can I download the reports?

The reports are built on Power BI. To download a report, select the ellipsis (…) of the specific KPI and select **Export data**.

:::image type="content" source="media/analytics-powerapps/powerapps-analytics-export-data.png" alt-text="Shows the Power Apps analytics export data page." lightbox="media/analytics-powerapps/powerapps-analytics-export-data.png":::

## How do I change environments?

You can change environments by selecting **Change Filter** on the page.

:::image type="content" source="media/analytics-powerapps/powerapps-analytics-filter.png" alt-text="Shows how to select change filter or Filter in Power Apps analytics." lightbox="media/analytics-powerapps/powerapps-analytics-filter.png":::

Select the environment and time period from the drop-down lists, and then select **Apply** to save the changes. All Power Apps analytics reports now reflect this selection.

:::image type="content" source="media/analytics-powerapps/powerapps-analytics-change-environments.png" alt-text="Shows how to view and change environments in Power Apps analytics." lightbox="media/analytics-powerapps/powerapps-analytics-change-environments.png":::

### Why are some apps missing in my report?

Currently, Power Apps analytics reports don't display model-driven apps data. Only canvas apps related data is displayed.

### See also

[Tenant-level analytics (default)](tenant-level-analytics.md) <br />
[Tenant-level Analytics for Power Apps (preview)](powerapps-analytics-reports.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
