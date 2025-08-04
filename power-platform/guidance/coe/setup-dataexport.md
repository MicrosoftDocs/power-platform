---
title: "Data Export inventory setup"
description: "Instructions for how to set up the inventory components solution of the Microsoft CoE Starter Kit using Data Export."
author: jenefer-monroe
ms.topic: install-set-up-deploy
ms.date: 09/05/2023
ms.subservice: guidance-toolkit
ms.author: mapichle
ms.reviewer: sericks
ms.custom: sfi-image-nochange
---

# Data Export inventory setup

## Dataflow Setup

You can set up dataflows to retrieve your inventory from Data Export.

If your inventory is coming from [Data Export](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory), you can configure dataflows as part of the setup.

> [!IMPORTANT]
>
> - Only complete the steps in this artcle if you configured [Data Export](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory) as the mechanism for inventory and telemetry.
> - When you see data in your storage account set up to receive data from Data Export, then use the Data Export configuration steps in this article. This configuration might show up to five days from the initial setup of Data Export in the Power Platform admin center.

### Copy Azure Storage account URL

1. Navigate to the [Azure portal](https://portal.azure.com).
1. Search for or select the storage account configured to receive [Data Export data](/power-platform/admin/self-service-analytics#set-up-the-data-export-process-for-your-tenant).
1. Select **Endpoints**.
1. Copy the Data Lake Storage URL to a text editor such as Notepad.
1. Append `/powerplatform` to the URL.

### Confirm Storage Account permission

1. Navigate to the [Azure portal](https://portal.azure.com).
1. Search for and select the storage account configured to receive [Data Export data](/power-platform/admin/self-service-analytics#set-up-the-data-export-process-for-your-tenant).
1. Select **Access Control (IAM)**.
1. Select **View my access**.
1. Confirm you have the Storage Blob Data Reader role assigned.
   :::image type="content" source="media/byodl-2.png" alt-text="Screenshot that shows the Current role assignments page in the Access Control (IAM) menu." lightbox="media/byodl-2.png":::

### Copy Environment Web API endpoint

1. Navigate to [make.powerapps.com](https://make.powerapps.com).
1. Select the environment with the CoE Starter Kit.
1. Select the **Settings** icon, then select **Developer resources**.
1. Copy the Web API endpoint.

### Configure connections to data sources

1. Navigate to [make.powerapps.com](https://make.powerapps.com).
1. Select the environment with the CoE Starter Kit.
1. Select **Dataflows**.
1. Edit the **CoE BYODL Makers** dataflow.
   :::image type="content" source="media/byodl-7.png" alt-text="Screenshot that shows where to edit the CoE BYODL Makers dataflow in Power Apps." lightbox="media/byodl-7.png":::
1. Update the `DatalakeURL` parameter with the link to your Data Lake Storage URL and the `EnvironmentAPI` parameter with the link to your Environment Web API endpoint.
   :::image type="content" source="media/byodl-8.png" alt-text="Screenshot that shows where you can update the DatalakeURL and EnvironmentAPI parameters." lightbox="media/byodl-8.png":::
   1. Select each table shown in the Queries section and configure the connection.
      :::image type="content" source="media/byodl-9.png" alt-text="Screenshot that shows where the Configure connection button is located." lightbox="media/byodl-9.png":::
   1. For each connection, select **Organizational account** and sign in.
   :::image type="content" source="media/byodl-10.png" alt-text="Screenshot that shows the location of Account authentication and sign in button." lightbox="media/byodl-10.png":::
   1. Once all connections are configured and there are no more warnings, select **Next**.
   1. Select the **Makers** table and confirm that this table is configured to load data to the existing **admin_Maker** table.
      :::image type="content" source="media/byodl-20.png" alt-text="Screenshot that shows the location of the Makers table and the load data connection." lightbox="media/byodl-20.png":::
      > [!NOTE]
      > If the table is configured to map to a new table or you don't see a mapping configured between source and destination columns, select **Cancel** and start again.
   1. Select **Publish**. Don't change any data mapping configuration.
      :::image type="content" source="media/byodl-11.png" alt-text="Screenshot that shows the location of the Publish button." lightbox="media/byodl-11.png":::
   1. The **CoE BYODL Makers** start refreshing. Wait for the refresh to finish.
      :::image type="content" source="media/byodl-12.png" alt-text="Screenshot that shows the Last refresh date and time of CoE BYODL Makers." lightbox="media/byodl-12.png":::
1. Edit the **CoE BYODL Environments** dataflow. Complete the same steps to update the **DatalakeURL** and **EnvironmentAPI** parameters and configure the connections to the data sources used by this dataflow.
1. Select **Next**.
1. Select the **Environments** table and confirm this table is configured to load data to the existing **admin_Environment** table.
1. Publish the **CoE BYODL Environments** dataflow and wait for the refresh to finish.
:::image type="content" source="media/byodl-13.png" alt-text="Screenshot that shows the Last refresh date and time of CoE BYODL Environments." lightbox="media/byodl-13.png":::
1. Edit the **CoE BYODL Apps**, **CoE BYODL Model Driven Apps**, and **CoE BYODL Flows** dataflows. Complete the same steps to update the **DatalakeURL** and **EnvironmentAPI** parameters and configure the connections to the data sources used by this dataflow.
1. Confirm that the **CoE BYODL Apps** and **CoE BYODL Model Driven Apps** dataflows are configured to load data to the existing **admin_App** table. The **CoE BYODL Flows** dataflow should be configured to load data to the existing **admin_Flow** table.
1. Publish the **CoE BYODL Apps**, **CoE BYODL Model Driven Apps**, and **CoE BYODL Flows** dataflows and wait for the refresh to finish.
   :::image type="content" source="media/byodl-17.png" alt-text="Screenshot that highlights the CoE BYODL Apps and CoE BYODL Flows dataflows." lightbox="media/byodl-17.png":::
1. Edit the **CoE BYODL Apps Connection**, **CoE BYODL Apps Last Launched Date**, **CoE BYODL Flows Connection**, and **CoE BYODL Flows Last Run Date** dataflows. Complete the same steps to update the **DatalakeURL** and **EnvironmentAPI** parameters and configure the connections to the data sources used by this dataflow.
1. Confirm the **CoE BYODL Apps Connection** and **CoE BYODL Apps Last Launched Date** dataflows are configured to load data to the existing **admin_App** table. The **CoE BYODL Flows Connection** and **CoE BYODL Flows Last Run Date** dataflows should be configured to load data to the existing **admin_Flow** table.
1. Publish the **CoE BYODL Apps Connection**, **CoE BYODL Apps Last Launched Date**, **CoE BYODL Flows Connection**, and **CoE BYODL Flows Last Run Date** dataflows and wait for the refresh to finish.
   :::image type="content" source="media/byodl-19.png" alt-text="Screenshot that highlights the four dataflows." lightbox="media/byodl-19.png":::

### Troubleshooting

#### The specified path doesn't exist

This dataSource error means not all required folders and files are available yet in the storage account, since you recently configured the Data Export. After the initial setup, seeing updated data can take up to five days for folders to populate.
:::image type="content" source="media/byodl-21.png" alt-text="Screenshot that shows the data source error if the required folders aren't yet available in the storage account." lightbox="media/byodl-21.png":::

#### A DataFormat.Error after updating the `DatalakeURL` and `EnvironmentAPI` parameters

This error might mean you entered the incorrect URLs. Verify that the `DatalakeURL` parameter points to your Azure Storage account URL. The URL should contain `dfs.core` and end with `/powerplatform`. Verify that the `EnvironmentAPI` points to your Environment Web API. The URL should contain `api.crm` and end with `/api/data/v9.2`.
:::image type="content" source="media/byodl-18.png" alt-text="Screenshot that shows the DataFormat.Error." lightbox="media/byodl-18.png":::

#### The publish or refresh failed

Select the error to review the status alert in the **Last refresh** column.
:::image type="content" source="media/byodl-15.png" alt-text="Screenshot that shows where you can select the error to reveal the alert." lightbox="media/byodl-15.png":::

The refresh might fail if you didn't configure connections to all data sources used by the dataflow. Edit the dataflow again and verify you configured the connections to all data sources. Select all the queries individually to check for warnings.
:::image type="content" source="media/byodl-14.png" alt-text="Screenshot that shows the refresh history window with a summary of the error." lightbox="media/byodl-14.png":::

#### The publish button is disabled

If you configured connections in the dataflow, but the **Publish** button remains disabled (with a warning message), some configured connections might be missing. Select **Back** and review all queries for connection warnings.
:::image type="content" source="media/byodl-16.png" alt-text="Screenshot showing one possible warning." lightbox="media/byodl-16.png":::

### Configure scheduled refresh

1. Navigate to [make.powerapps.com](https://make.powerapps.com).
1. Select the environment installed with the CoE Starter Kit.
1. Select **Dataflows**.
1. Select **Edit refresh settings** for the **CoE BYODL Makers** dataflow.
   :::image type="content" source="media/byodl-5.png" alt-text="Screenshot that shows the Edit refresh settings option from the overflow menu of a dataflow." lightbox="media/byodl-5.png":::
1. Select **Refresh automatically** and configure a daily refresh. Check when files write to your storage account by the Data Export feature and set the daily refresh of the dataflow *after* that time. The dataflow now runs after data is exported to your storage account.
:::image type="content" source="media/byodl-6.png" alt-text="Screenshot that shows the refresh settings." lightbox="media/byodl-6.png":::

## Environment variables

This section includes the full list of environment variables that affect the Data Export methodology to inventory the tenant. These values are all filled for you by the Setup Wizard.

| Name | Description | Default value |
|------|-------------|---------------|
| App Connections Dataflow ID | Dataflow ID of the CoE BYODL App Connections dataflow. Only used when mechanism for inventory is [Data Export](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory). | Not applicable |
| App Dataflow ID | Dataflow ID of the CoE BYODL Apps dataflow. Only used when mechanism for inventory is [Data Export](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory). | Not applicable |
| App Usage Dataflow ID | Dataflow ID of the CoE BYODL App USage dataflow. Only used when mechanism for inventory is [Data Export](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory). | Not applicable |
| Current Environment | Current Dataflow Environment ID used by cloud flows to refresh dataflows. Only used when mechanism for inventory is [Data Export](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory). | Not applicable |
| Environment Dataflow ID | Dataflow ID of the CoE BYODL Environments dataflow. Only used when mechanism for inventory is [Data Export](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory). | Not applicable |
| Flow Connections Dataflow ID | Dataflow ID of the CoE BYODL Flow Connections dataflow. Only used when mechanism for inventory is [Data Export](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory). | Not applicable |
| Flow Usage Dataflow ID | Dataflow ID of the CoE BYODL Flow Usage dataflow. Only used when mechanism for inventory is [Data Export](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory). | Not applicable |
| Flow Dataflow ID | Dataflow ID of the CoE BYODL Flows dataflow. Only used when mechanism for inventory is [Data Export](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory). | Not applicable |
| Maker Dataflow ID | Dataflow ID of the CoE BYODL Makers dataflow. Only used when mechanism for inventory is [Data Export](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory). | Not applicable |
| Model App Dataflow ID | Dataflow ID of the CoE BYODL Model Driven Apps dataflow. Only used when mechanism for inventory is [Data Export](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory). | Not applicable |

[!INCLUDE[file-an-issue](../../includes/file-an-issue.md)]
