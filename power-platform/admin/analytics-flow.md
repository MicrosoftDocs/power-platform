---
title: "Power Automate analytics  | MicrosoftDocs"
description: The admin reports provide a view into environment level usage, errors, service performance.
author: "MSFTMan"
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/04/2020
ms.author: deonhe
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# View analytics for flows

Environment admins can access analytics for Power Automate in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/analytics/flow). The reports provide insights into runs, usage, errors, types of flows created, shared flows, and details on connectors associated with all the different flow types like automated flows, button flows, scheduled flows, approval flows, business process flows. These reports are not available for the UI flows type.

To access these reports:

1. Go to the navigation bar on the left side.
2. Select **Analytics**.
3. Select **Microsoft Power Automate**.
4. View the reports on the right side.

## Who can view these reports?

Admins with the following roles and a [license](pricing-billing-skus.md) can view the reports in Power Automate analytics:
- Environment Admin - can view reports for the environments that the admin has access to.
- Power Platform admin – can view reports for all environments.
- Dynamics 365 admin - can view reports for all environments.
- Microsoft 365 Global admin – can view reports for all environments.

For more information on the different roles for managing your tenant across the platform, see [Use service admin roles to manage your tenant](use-service-admin-role-manage-tenant.md).

## Data storage

When a user creates an environment in a region, the environment is hosted in that region. All data for that environment resides within that region for a maximum period of 28 days. 

The data refresh cycle is about 3 hours and you can find the last refresh time at the top right corner of the page.

## Available reports

The preview contains 6 reports with multiple KPIs in each report. By default, you see reports for the last viewed environment. 


## Runs report

By default, you see the **Runs** report. It provides a view into the daily, weekly, and monthly run data of all flows in an environment.


![Daily runs](media/analytics-flow/daily-runs.png)


## Usage report

This report provides insights into the different types of flows in use, the trends, and the flow creator's names.

![Usage report](media/analytics-flow/usage-report.png)

## Created report

This report provides insights into the types of flows created, trends, and details like the created date and the creator's email address.

![Created report](media/analytics-flow/created-report.png)


## Error report

This report provides insights into recurring error types and details like the error count, creator's email address, last occurred time, and the creator's email address for each flow.

![Error report](media/analytics-flow/error-report.png)

## Shared report

This report provides details on the flows shared and trends in the environment.

![Shared report](media/analytics-flow/shared-report.png)

## Connectors report

This report provides details on connectors and their associated flows. Metrics like the number of calls from each flow per connector, flow runs, and the flow creator's email address are available for both standard and custom connectors.


![Connector report](media/analytics-flow/connectors-report.png)

## Download reports

The reports are built with Power BI. Users can select the ellipsis (…) for a KPI and then select **Export data**.

![Export report](media/analytics-flow/export-report.png)

## View reports in other environments

To view reports in another environment:

1. Select **Change Filters**.
1. Select the new environment from the **Environment** list and optionally, select a **Time Period**.
1. Select **Apply**.


![View reports from another environment](media/analytics-flow/new-environment.png)
