---
title: "Responding to GDPR Data Subject Export Requests"
description: "Learn how to respond to GDPR Data Subject Export Requests for Power Virtual Agents."
ms.date: 01/25/2022

ms.topic: article
author: iaanw
ms.author: iawilt
ms.custom: ceX
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Export data to respond to requests for copies of personal data in Power Virtual Agents

Power Virtual Agents offers the following capabilities to find or export personal data for a specific user:

1. [Export customer data: Bot content (as tenant admin)](#bot-content-as-tenant-admin)
1. [Export customer data: Bot sessions (as bot author)](#bot-sessions-as-bot-author)
1. [Export system-generated logs (as tenant admin)](#export-system-generated-logs-as-tenant-admin)

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).

## Export customer data

### Bot content (as tenant admin)

1. Go to [https://make.powerapps.com](https://make.powerapps.com) and sign in with your credentials.

   :::image type="content" source="media/gdpr-export/export-1.png" alt-text="Sign in to powerapps.com." border="false":::

1. In the side pane, select **Data** > **Tables**.

   :::image type="content" source="media/gdpr-export/open-table.png" alt-text="Open Data table.":::

1. Select the **Data** dropdown, then select **Export data**.

   :::image type="content" source="media/gdpr-export/ExportDataMenu.png" alt-text="Export data.":::

1. Select **Chatbot** and **Chatbot subcomponent** from the entity list, then select **Export data**. Your data will take a couple of minutes to be compiled for export.

   :::image type="content" source="media/gdpr-export/ExportChatbotAndChatbotSubComponent.png" alt-text="Select entities for export.":::

   :::image type="content" source="media/gdpr-export/export-data-button.png" alt-text="Select export data button.":::

1. When your export is ready, select **Download exported data** to download the content.

   :::image type="content" source="media/gdpr-export/DownloadExportedData.png" alt-text="Download exported data.":::

### Bot sessions (as bot author)

You can download session data for the last 30 days from the [sessions analytics page](analytics-sessions.md#download-session-transcript-information-from-the-power-virtual-agents-portal) in Power Virtual Agents.

You can also [export data from the ConversationTranscripts table](analytics-sessions.md#export-conversation-transcripts).

## Export system-generated logs (as tenant admin)

Microsoft provides the ability to access, delete, and export certain customer data through Azure Portal so that tenant admins can execute [Data Subject Requests](/compliance/regulatory/gdpr-dsr-azure#introduction-to-data-subject-requests-dsrs).

1. Go to the [User Privacy Overview in Azure Portal](https://portal.azure.com/#blade/Microsoft_Azure_Policy/UserPrivacyMenuBlade/Overview).

1. Select **Add export request**.

   :::image type="content" source="media/gdpr-export/export-azure-portal.png" alt-text="Export system generated logs.":::

[!INCLUDE[footer-include](includes/footer-banner.md)]
