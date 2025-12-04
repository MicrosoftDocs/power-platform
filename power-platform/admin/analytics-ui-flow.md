---
title: View analytics for Power Automate desktop flows | Microsoft Docs
description: Learn about trends, usage patterns, and more analytics for desktop flows in the Power Platform admin center.
author: Zeffin
ms.topic: how-to
ms.date: 12/04/2025
ms.subservice: admin
ms.author: cvassallo
ms.reviewer: sericks
search.audienceType: 
  - flowadmin
contributors:
  - isaacwinoto
  - EllenWehrle
---

# View analytics for desktop flows

As an admin, you need to view the overall status of automation that runs in your organization. There are two options to monitor the analytics for automation that's built with desktop flows:

- The Power Platform admin center.
- The Center of Excellence (CoE) Starter Kit.

The easiest option to view your organization's desktop flows analytics is to visit [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

This article discusses who can view the reports, how to access the reports, and what kind of desktop flow data you can view in the Power Platform admin center.

## Who can view these reports?

Admins with these roles and a [license](pricing-billing-skus.md) can view the reports in Power Automate analytics:

- Environment Admin - can view reports for the environments that the admin has access to.
- Power Platform admin – can view reports for all environments.
- Dynamics 365 admin - can view reports for all environments.
- Microsoft 365 Global admin – can view reports for all environments.

For more information on the different roles for managing your tenant across the platform, see [Use service admin roles to manage your tenant](use-service-admin-role-manage-tenant.md).

## Access desktop flows analytics

1. Sign in to [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

   > [!NOTE]
   > If it's your first time signing in, you may need to select your country/region.

1. In the **Manage** pane, under **Products**, select **Power Automate**.
1. Select **Environment View**.

:::image type="content" source="media/analytics-ui-flow/environment-desktop-flows.png" alt-text="Access environment-level reports for Power Automate Desktop flows." lightbox="media/analytics-ui-flow/environment-desktop-flows.png":::

## View desktop flows analytics

Different types of reports can be viewed specifically for cloud flows *or* desktop flows. These reports are **Runs**, **Usage**, **Created**, and **Errors**. Reports for **Shared** and **Connectors** are for all flows.

To view desktop flows reports in the *Environment View*, select a report type and then select **Desktop flows**. By default, you see reports for the last viewed environment. Select **Change filters** to choose a different environment and/or time period.

> [!IMPORTANT]
> In order to generate accurate report data, ensure the Power Automate Desktop app is version 2.1.43.20312 or later.

|Report | Description|
|--- | ---|
|Runs | This report gives you an overview of the daily, weekly, and monthly desktop flows run statistics. This report also provides trend lines and run results (success/failure/cancel). This report gives insights on how actively desktop flows are used in each environment.|
|Usage | This report shows you the desktop flows that are being used most, giving you insights into your automation inventory.|
|Created | This report shows you analytics against recently created desktop flows, giving you insights into your most active desktop flows makers.|
|Errors | This report provides insights into recurring error types and details like the error count, creator's email address, last occurred time, and the creator's email address for each flow.|
|Shared | This report provides details on shared flows trends in the environment for both cloud flows and desktop flows. |
|Connectors | This report provides details on connectors and their associated cloud and/or desktop flows. Metrics like the number of calls from each flow per connector, flow runs, and the flow creator's email address are available for both standard and custom connectors.|

**Runs reports**
:::image type="content" source="media/analytics-ui-flow/runs-desktop-flows.png" alt-text="View desktop flows runs reports in Power Platform admin center." lightbox="media/analytics-ui-flow/usage-desktop-flows.png":::

**Usage reports**
:::image type="content" source="media/analytics-ui-flow/usage-desktop-flows.png" alt-text="View of desktop flows usage reports in Power Platform admin center." lightbox="media/analytics-ui-flow/usage-desktop-flows.png":::

**Created reports**
:::image type="content" source="media/analytics-ui-flow/created-desktop-flows.png" alt-text="View of desktop flows created reports in Power Platform admin center." lightbox="media/analytics-ui-flow/created-desktop-flows.png":::

## Limitations of downloaded reports

Some fields, such as the creator's email address and the app or flow display name, may appear blank in the exported reports. This is expected behavior, as these values are resolved at runtime and aren't part of the underlying stored dataset.

## Related content

- Run [desktop flows](/power-automate/desktop-flows/run-desktop-flow).

[!INCLUDE[footer-include](../includes/footer-banner.md)]
