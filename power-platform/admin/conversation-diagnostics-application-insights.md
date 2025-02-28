---
title: Conversation diagnostics in Azure Application Insights (preview)
description: Learn about how to...
services: powerapps
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/28/2025
author: sericks007
ms.subservice: admin
ms.author: sericks
ms.reviewer: sericks
search.audienceType: 
  - admin
ms.contributors:
- avkatiyar
- Zeffin
---

# Conversation diagnostics in Azure Application Insights (preview)

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

Conversation diagnostics logs each of the conversation lifecycle events, giving you a greater visibility into conversations-based operational telemetry of your organization.  This helps your support team to proactively monitor the system and allows developers to easily identify, diagnose, and fix problematic conversations, or seek swift support.

Connect your Dynamics 365 Customer Service environment to an Azure Application Insights instance to collect and store conversation logs. For more information about Application Insights features and how they can be used to monitor your telemetry and diagnose failures, see [Application Insights Overview dashboard](/azure/azure-monitor/app/overview-dashboard) and [Diagnose failures using the Azure portal](/azure/azure-monitor/app/asp-net-exceptions#diagnose-failures-using-the-azure-portal).

You can then use the conversation lifecycle events data from Dynamics 365 Customer Service in Application Insights to monitor system health, export, and combine it with additional data sets to build custom dashboards per your business needs.

[!INCLUDE [preview-note](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

> [!NOTE]
> Export of Power Automate and Dynamics 365 Customer Service data is not available in sovereign clouds, such as Government Community Cloud (GCC), Government Community Cloud - High (GCC High), and Department of Defense (DoD), at this time.

> [!IMPORTANT]
> When this feature transitions to General Availability (GA), the feature will be available for Managed Environments only.  Users will need a Power Apps, Power Automate, or Dynamics 365 license with premium use rights. For this public preview only, the premium use rights requirement and the Managed Environments restriction are relaxed.

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
   
## Access and use the conversation information in Application Insights

After you've configured the data export setup, conversation lifecycle information for live chat, digital messaging, voice, and custom channel conversations is available in the Application Insights **Traces** table.

### Conversation diagnostics scenarios

Learn about conversation diagnostics scenarios and subscenarios in [Understand conversation diagnotics](/dynamics365/customer-service/administer/conversation-diagnostics-subscenarios).

## Access conversation logs from Application Insights

To view the logs for a conversation, complete the following steps.

1.  Log in to [Azure portal](https://portal.azure.com/#home) and access your Application Insights instance. Ensure this is the same instance that you've used to setup the data export.

2.  Select **Logs** in **Monitoring**.

3.  Run a query on the **Traces** table, filtering by the conversation ID of your conversation. A sample query is as follows:

    ``` SQL
    *let lwiId = "269079bb-f39d-4281-bf87-d13bae6d0ed2";*
    
    *let operationIds = (traces*
    
    *\| where operation\_ParentId == lwiId // LWI to be checked*
    
    *\| distinct operation\_Id);*
    
    *traces*
    
    *\| where operation\_Id in (operationIds) or operation\_ParentId == lwiId*
    
    *\| project timestamp, message, customDimensions, operation\_Name, operation\_Id, operation\_ParentId, session\_Id, user\_Id, severityLevel, itemType*
    
    *\| sort by timestamp asc*
    ```

    Where **lwid** is the conversation ID you've retrieved from your Dynamics 365 Customer Service application.

4.  The application displays the trace for the conversation.

## Conversation lifecycle scenario: Success

A customer initializes a chat conversation on your portal. The application identifies the customer and routes the chat request to a queue. A chat notification appears, and the agent picks up the request from the Agent Dashboard. The agent chats with the customer, and the customer ends the conversation.

When you run a query for the specific conversation ID, here's the trace log that's displayed:

![Example trace log that's displayed when you run a query for a specific conversation ID.](media/conversation-lifecyle-scenario.png)

## Export conversation data

You can use the **Export** option to export the logs and combine this data with data sets from other tables to create your own custom monitoring dashboards. More information: [Create custom KPI dashboards using Application Insights](/azure/azure-monitor/app/tutorial-app-dashboards).
