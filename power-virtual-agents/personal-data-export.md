---
title: "Export data to respond to requests for copies of personal data"
description: "Export data to respond to requests for copies of personal data in Power Virtual Agents."
ms.date: 07/28/2023
ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: ceX
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Export data to respond to requests for copies of personal data in Power Virtual Agents

This topic discusses the Power Virtual Agents capabilities to find or export personal data for a specific user.

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).

## Export customer data

### Bot content (as tenant admin)

1. Go to [https://make.powerapps.com](https://make.powerapps.com) and sign in with your credentials.

   :::image type="content" source="media/personal-data-export/export-1.png" alt-text="Sign in to powerapps.com." border="false":::

1. In the side pane, select **Tables**.

   :::image type="content" source="media/personal-data-export/open-table-2023.png" alt-text="Open Data table.":::

1. Search for chatbot tables.

   :::image type="content" source="media/personal-data-export/SearchChatbotTables-2023.png" alt-text="Search chatbot tables.":::

1. Select **Chatbot** or **Chatbot subcomponent** from the table list, then select **Export data**. Your data will take a couple of minutes to be compiled for export. 

   :::image type="content" source="media/personal-data-export/exportchatbotandchatbotsubcomponent-2023.png" alt-text="Select entities for export.":::

1. When your export is ready, select **Download exported data** to download the content.

   :::image type="content" source="media/personal-data-export/downloadexporteddata-2023.png" alt-text="Download exported data.":::

### Bot sessions (as bot author)

You can download session data for the last 30 days from the [sessions analytics page](analytics-sessions.md) in Power Virtual Agents.

You can also [export data from the ConversationTranscripts table](analytics-sessions-transcripts.md#export-conversation-transcripts).

## Export system-generated logs (as tenant admin)

Microsoft provides the ability to access, delete, and export certain customer data through Azure Portal so that tenant admins can execute [Data Subject Requests](/compliance/regulatory/gdpr-dsr-azure#introduction-to-data-subject-requests-dsrs).

1. Go to the [User Privacy Overview in Azure Portal](https://portal.azure.com/#blade/Microsoft_Azure_Policy/UserPrivacyMenuBlade/Overview).

1. Select **Add export request**.

   :::image type="content" source="media/personal-data-export/export-azure-portal.png" alt-text="Export system generated logs.":::

[!INCLUDE[footer-include](includes/footer-banner.md)]
