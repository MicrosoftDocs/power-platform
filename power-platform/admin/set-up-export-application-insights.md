---
title: Export data to Application Insights 
description: Learn how to export data to Application Insights from the Power Platform admin center.
services: powerapps
ms.component: pa-admin
ms.topic: how-to
ms.date: 07/18/2025
author: isaacwinoto 
ms.subservice: admin
ms.custom: NewPPAC
ms.author: isaacwinoto
ms.reviewer: sericks
search.audienceType: 
  - admin
contributors:
- Zeffin
- srpoduri 
---

# Export data to Application Insights 

Learn how to set up data export from the Power Platform admin center to Application Insights for monitoring and analyzing your Power Platform applications. This guide walks you through the complete setup process, from prerequisites to configuration.

## Prerequisites

- Have an [Application Insights environment](/azure/azure-monitor/app/create-workspace-resource) set up for receiving the data, in addition to the [environment](environments-overview.md) that has a database.
  
   - For the Application Insights environment, you must have contributor, writer, or admin rights.
   - The Application Insights environment must be unique for an environment or tenant. Application Insights out-of-the-box reports won't function correctly if a single Application Insights environment contains data from multiple environments.

   > [!NOTE]
   > This feature is turned on and supported for Managed Environments only.

- To configure telemetry export, you need administrative privileges. This includes being assigned to the Power Platform administrator or Dynamics 365 administrator role at the tenant-level in Microsoft Entra ID, or by being assigned to the environment administrator or system administrator role within the Dataverse environment. Without these permissions, the integration doesn't work.
  
    > [!IMPORTANT] 
    > The Application Insights exporting functionality for Power Automate and Dynamics 365 Customer Service is in public preview in all public sovereign geos.  Power Automate and Dynamics 365 Customer Service functionality in public preview isn't available in Government Community Cloud (GCC) or Government Community Cloud - High (GCC High) sovereign clouds.
    >
    >
    > For GCC customers that need to configure integration to Application Insights in Azure Government environments, enter a [support request](support-overview.md).

    > [!NOTE]
    > The service level agreement (SLA) for the delivery of telemetry data streams from Power Platform products supported by this feature to Application Insights is 24 hours.

## Create an export package

### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Data export**.

1. On the **Data export** page, select the **App Insights** tab. Then select **New data export**.

1. Provide a friendly name of the export package to identify the Azure Application Insights instance. Then select the specific data type you would like to export, such as **Dataverse diagnostics and performance** or **Power Automate**.
   
   If you select **Power Automate**, select whether to export cloud flow runs, triggers, or actions.

1. Select one or more filters that allow you to view specific, filtered data.

1. Select the environment that you're exporting data _from_. You can choose to filter based on the environment type. Select **Next**.
  
1. Select the Azure subscription, resource group, and Application Insights environment that you're exporting data _to_. Select **Next**.

    > [!NOTE]
    > Confirm that you have **Contributor** or **Owner** access to the Azure Application Insights resource you intend to use. If you don’t, ask an Azure administrator to grant you access, or create a new Application Insights instance that you own. Typically, one production environment or tenant maps to one Application Insights environment.

1. Review the details that you entered for the new export package, and then select **Create** to set up the data export connection. 

   The data export connection should now be set up. Within the next 24 hours, data starts being exported to your Application Insights environment.

### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, expand **Analytics**. Then select **Data export**.
1. On the **Data export** page, select the **App Insights** tab. Then select **New data export**.

1. Provide a friendly name of the export package to identify the Azure Application Insights instance. Then select the specific data type you would like to export, such as **Dataverse diagnostics and performance** or **Power Automate**.
   
   If you select **Power Automate**, select whether to export cloud flow runs, triggers, or actions.

1. Select one or more filters that allow you to view specific, filtered data.

1. Select the environment that you're exporting data _from_. You can choose to filter based on the environment type. Select **Next**.

1. Select the Azure subscription, resource group, and Application Insights environment that you're exporting data _to_. Select **Next**.

    > [!NOTE]
    > Confirm that you have **Contributor** or **Owner** access to the Azure Application Insights resource you intend to use. If you don’t, ask an Azure administrator to grant you access, or create a new Application Insights instance that you own. Typically, one production environment or tenant maps to one Application Insights environment.

1. Review the details that you entered for the new export package, and then select **Create** to set up the data export connection. 

   The data export connection should now be set up. Within the next 24 hours, data starts being exported to your Application Insights environment.
---



### Troubleshooting for missing telemetry 
If no data appears in Application Insights within 24 hours of setup, verify the following:

- The integration was configured by a user with the required permissions. Learn more in the [Prerequisites](#prerequisites).
- The correct Application Insights instrumentation key was applied.

A common cause of missing telemetry is insufficient permissions during setup.

## Delete an export package

### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Manage**.
1. Then under that section, choose **Data export**.

1. On the **Data export** page, select the **App Insights** tab. 

1. Select the export package you want to delete and select **Delete export**.

   You can set up a new connection whenever you decide to restart the data export.

### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, expand **Analytics**. Then select **Data export**.
1. On the **Data export** page, select the **App Insights** tab. 
1. Select the export package you want to delete and select **Delete export**.

   You can set up a new connection whenever you decide to restart the data export.

---

[!INCLUDE[footer-include](../includes/footer-banner.md)]
