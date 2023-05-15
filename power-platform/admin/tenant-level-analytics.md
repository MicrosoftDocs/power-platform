---
title: "Tenant-level analytics (preview)" 
description: View tenant-level analytics in a variety of reports
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/10/2022
author: tjvass
ms.subservice: admin
ms.author: tjvass
ms.reviewer: jimholtz
search.audienceType: 
  - admin
---

# Tenant-level analytics (preview)

Power Platform resources periodically emit telemetry data for various operations and user activities across environments and extensions. Tenant-level analytics allows admins to view and compare insights derived from the Platform telemetry data across environments they manage. Tenant admins can view reports containing analytics that apply to all environments within the tenant. 

Once enabled, this feature will aggregate data from environments across all regions in your tenant and copy it into the default environment region for tenant-level reporting. A tenant-level administrator role is required for one time operation of granting consent for tenant-level analytics. 

To access these reports, sign in to the Power Platform admin center and select **Analytics** > **Power Apps** or **Analytics** > **Power Automate**. Tenant level reports can be accessed in the **Overview** tab, and environment-level reports can be accessed in the **Environment View** tab. 

:::image type="content" source="media/select-tenant-level-analytics.png" alt-text="Select tenant level analytics.":::

## Who can view these reports?

Administrators with the following roles and a [license](pricing-billing-skus.md) can view the reports in Power Apps analytics:
- Environment Admin - can view reports for the environments where the admin is member of Contributor or Environment Admin role.
- Power Platform admin - can view reports for all environments.
- Dynamics 365 admin - can view reports for all environments. 
- Microsoft 365 Global admin - can view reports for all environments.

For more information on the different roles for managing your tenant across the platform, see [Use service admin roles to manage your tenant](use-service-admin-role-manage-tenant.md).

## How do I enable tenant-level analytics?

A member from one of the following admin roles is required to enable tenant-level analytics:

- Power Platform admin
- Microsoft 365 Global admin
- Delegated admin 

The admin doesn't need to be a licensed user.  Environment admins will gain access to the tenant-level analytics once the service admin enables the feature using the following steps. 

1. Select the **Gear** icon (![Gear icon.](media/selection-rule-gear-button.png)) in the upper-right corner of the Microsoft Power Platform site, and then select **Power Platform settings**. 

2. Turn on the option to **Enable tenant level analytics**.

   :::image type="content" source="media/enable-tenant-level-analytics.png" alt-text="Enable tenant-level analytics.":::

3. **Granting consent for tenant-level analytics:** The process of collecting information for tenant-level analytics includes copying service telemetry data from other GEO locations into a central location for reporting.  Customers must explicitly enable this Power Platform operation.  

   Select **Enable** to grant consent for the service to collocate service telemetry data in the location associated with the default environment. 

   :::image type="content" source="media/enable-collocate-service-telemetry-data.png" alt-text="Grant consent for the service to collocate service telemetry data.":::

4. Select **Save** and then close the form. 

5. Select **Environment level analytics**, and then select **Tenant level analytics** to switch viewing modes. 

## How do I disable tenant-level analytics?

Administrators with the following roles and a [license](pricing-billing-skus.md) can disable tenant-level analytics:

- Power Platform admin
- Microsoft 365 Global admin
- Delegated admin 

Environment admins are not able to disable tenant-level analytics.

> [!IMPORTANT]
> When you disable the tenant-level analytics preview feature, note the following:
> - All the tenant-level aggregation of data from different environments (aggregating metrics, user object IDs, and resource names like app and flow names) will be permanently deleted. 
> - Tenant-level analytics reports will be disabled. 

1. Select the **Gear** icon (![Gear icon.](media/selection-rule-gear-button.png)) in the upper-right corner of the Microsoft Power Platform site, and then select **Power Platform settings**. 

2. Turn off the option to **Enable tenant level analytics**.

   :::image type="content" source="media/enable-tenant-level-analytics.png" alt-text="Enable tenant-level analytics.":::

## Where is this feature available?

The Power Platform admin center tenant-level views are available in all supported regions in the public cloud. This feature is pending availability in Government & Sovereign Clouds.

### See also
[Tenant-level analytics for Power Apps](powerapps-analytics-reports.md) <br />
[Tenant-level analytics for Power Automate](power-automate-analytics-reports.md) <br />


[!INCLUDE[footer-include](../includes/footer-banner.md)]
