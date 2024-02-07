---
title: Tenant-level analytics
description: View tenant-level analytics in various reports.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/03/2023
author: sericks007
ms.subservice: admin
ms.author: sericks
ms.reviewer: sericks
search.audienceType: 
  - admin
contributors:
- StephenRauchPM
- johnev
---

# Tenant-level analytics

Power Platform resources periodically emit telemetry data for various operations and user activities across environments and extensions. Tenant-level analytics allows admins to view and compare insights derived from the Platform telemetry data across environments they manage. Tenant admins can view reports containing analytics that apply to all environments within the tenant. 

Once enabled, this feature aggregates data from environments across all regions in your tenant and copies it into the default environment region for tenant-level reporting. A tenant-level administrator role is required for one-time operation of granting consent for tenant-level analytics. 

To access these reports, sign in to the Power Platform admin center and select **Analytics** > **Power Apps** or **Analytics** > **Power Automate**. Tenant-level reports can be accessed in the **Overview** tab, and environment-level reports can be accessed in the **Environment View** tab. 

## Who can view these reports?

Administrators with the following roles and a [license](pricing-billing-skus.md) can view the reports in Power Apps analytics:

- **Environment admin** - Can view reports for the environments where the admin is a member of the Contributor or Environment Admin role.
- **Power Platform admin** - Can view reports for all environments.
- **Dynamics 365 admin** - Can view reports for all environments. 
- **Microsoft 365 Global admin** - Can view reports for all environments.

For more information on the different roles for managing your tenant across the platform, see [Use service admin roles to manage your tenant](use-service-admin-role-manage-tenant.md).

## How do I enable tenant-level analytics?

A member of one of the following admin roles is required to enable tenant-level analytics:

- Power Platform admin
- Microsoft 365 Global admin
- Delegated admin 

The admin doesn't need to be a licensed user. Environment admins gain access to the tenant-level analytics once the service admin enables the feature using the following steps: 

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and select **Analytics** > **Power Apps** or **Analytics** > **Power Automate**.

1. Select the **Overview** tab.

1. Select **Enable** to redirect to the **Analytics** pane.

    :::image type="content" source="media/analytics-overview-tab-enble.png" alt-text="Select Enable on the Overview tab.":::
  
    You may also select the **Settings** icon in the upper-right corner of the site, and then select **Power Platform settings**. 

1. In the **Analytics** pane, grant consent for tenant-level analytics by enabling the **Tenant-level analytics** feature.

    :::image type="content" source="media/analytics-pane.png" alt-text="Select Enable to turn on tenant-level analytics.":::
 
    Once enabled, this feature aggregates data from environments across all regions in your tenant and copies it into the default environment region for tenant-level reporting. A tenant-level administrator role is required for one-time operation of granting consent for tenant-level analytics. 

1. Select **Save**, and then close the form. 

1. The **Overview** tab displays a message indicating that tenant-level analytics has been enabled. Typically, these reports are displayed within 24-48 hours of enabling the feature. 

    :::image type="content" source="media/analytics-overview-tab-feature-enabled.png" alt-text="Tenant-level analytics has been enabled.":::

## How do I disable tenant-level analytics?

Administrators with the following roles and a [license](pricing-billing-skus.md) can disable tenant-level analytics:

- Power Platform admin
- Microsoft 365 Global admin
- Delegated admin 

Environment admins aren't able to disable tenant-level analytics.

> [!IMPORTANT]
> When you disable the tenant-level analytics preview feature, note the following:
> - All the tenant-level aggregation of data from different environments (aggregating metrics, user object IDs, and resource names like app and flow names) will be permanently deleted. 
> - Tenant-level analytics reports will be disabled. 

1. Select the **Settings** icon in the upper-right corner of the site, and then select **Power Platform settings**. 

2. Turn off the option to **Enable tenant level analytics**.

3. Select **Save**.

## Where is this feature available?

The Power Platform admin center tenant-level views are available in all supported regions in the public cloud. This feature is pending availability in Government and Sovereign clouds.

### See also
[Tenant-level analytics for Power Apps](powerapps-analytics-reports.md) <br />
[Tenant-level analytics for Power Automate](power-automate-analytics-reports.md) <br />

[!INCLUDE[footer-include](../includes/footer-banner.md)]
