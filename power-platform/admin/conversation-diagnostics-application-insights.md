---
title: Conversation diagnostics in Azure Application Insights (preview)
description: Learn about how to proactively monitor the system and allow developers to easily identify, diagnose, and fix problematic conversations, or seek swift support.
services: powerapps
ms.component: pa-admin
ms.topic: concept-article
ms.date: 03/03/2025
author: sericks007
ms.subservice: admin
ms.author: sericks
ms.reviewer: sericks
search.audienceType: 
  - admin
ms.contributors:
ms.custom: sfi-image-nochange
- nenellim
- avkatiyar
- Zeffin
---

# Conversation diagnostics in Azure Application Insights (preview)

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

Conversation diagnostics logs each of the conversation lifecycle events, giving you a greater visibility into conversations-based operational telemetry of your organization.  This helps your support team to proactively monitor the system and allows developers to easily identify, diagnose, and fix problematic conversations, or seek swift support.

Connect your Dynamics 365 Customer Service environment to an Azure Application Insights instance to collect and store conversation logs. For more information about Application Insights features and how they can be used to monitor your telemetry and diagnose failures, go to [Application Insights Overview dashboard](/azure/azure-monitor/app/overview-dashboard) and [Diagnose failures using the Azure portal](/azure/azure-monitor/app/asp-net-exceptions#diagnose-failures-using-the-azure-portal).

You can then use the conversation lifecycle events data from Dynamics 365 Customer Service in Application Insights to monitor system health, export, and combine it with additional data sets to build custom dashboards per your business needs.

[!INCLUDE [preview-note](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

> [!NOTE]
> Export of Power Automate and Dynamics 365 Customer Service data is not available in sovereign clouds, such as Government Community Cloud (GCC), Government Community Cloud - High (GCC High), and Department of Defense (DoD), at this time.

## Prerequisites

- Your environment must be a Managed Environment.
- You must have a Power Apps, Power Automate, or a Dynamics 365 license with premium use rights.

## Pricing

Azure Application Insights is an extension of Azure Monitor and charges for data ingested. There are two log ingestion plans – Basic and Analytic logs. To know the pricing for your business requirements, see [Azure Monitor pricing](https://azure.microsoft.com/pricing/details/monitor/#pricing).

## Set up a connection with Azure Application Insights

Before you perform a data export, create a connection between your Dynamics 365 Customer Service tenant and Azure Application Insights in Power Platform admin center. You can create only one data export configuration from Dynamics 365 Customer Service to Application Insights per environment. To enable the data export, complete the following steps.

1.  In the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select **Data Export** in the navigation pane.

1.  On the **Data export** page, select the **App Insights** tab. Then select **New data export**.

1.  On the **New data exports to Azure Application Insights** page, complete the following actions, and then select **Next**.

    - Enter a name in the **Name of the export package** field.
    - Select **Dynamics Customer Service**.
    - Select **Next**.

1.  Select the environment from which you'd like to export the data, and then select **Next**. You can export data from a [Managed Environment](managed-environment-enable.md) only.

1. Specify the **Subscription**, **Resource group**, and the **Application Insights** instance. Then select **Next**.

1. Review the setup configuration, and then select **Create.** The data export from Dynamics 365 Customer Service to Application Insights is created and displayed on the **Data export** page.
   
## Conversation diagnostics scenarios

Learn about conversation diagnostics scenarios and subscenarios in [Understand conversation diagnotics](/dynamics365/customer-service/administer/conversation-diagnostics-subscenarios).

## Export conversation data

You can use the **Export** option to export the logs and combine this data with data sets from other tables to create your own custom monitoring dashboards. More information: [Create custom KPI dashboards using Application Insights](/azure/azure-monitor/app/tutorial-app-dashboards).

### Related content

[Configure conversation diagnostics](/dynamics365/customer-service/administer/configure-conversation-diagnostics)  
