---
title: "Responding to GDPR Data Subject Export Requests"
description: "Learn how to respond​ to GDPR Data Subject Export Requests for Power Virtual Agents."
ms.date: 01/18/2022
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: ceX
ms.collection: virtual-agent
---

# Export data to respond to requests for copies of personal data in Power Virtual Agents




Power Virtual Agents offers the following capabilities to find or export personal data for a specific user:

1. [Export customer data – Bot content (as tenant admin)](#bot-content-as-tenant-admin)
2. [Export customer data – Bot sessions (as bot author)](#bot-sessions-as-bot-author)
3. [Export system-generated logs (as tenant admin)](#export-system-generated-logs-as-tenant-admin)


## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]


## Export customer data 

### Bot content (as tenant admin)

1. Go to [https://make.powerapps.com](https://make.powerapps.com) and sign in with your credentials.

   :::image type="content" source="media/gdpr-export/export-1.png" alt-text="Sign in to powerapps.com." border="false":::

1. In the side navigation pane, select **Data** then select **Tables**.
   
   :::image type="content" source="media/gdpr-export/open-table.png" alt-text="Open Data table.":::

1. Select the **Data** dropdown, then select **Export data**.

   :::image type="content" source="media/gdpr-export/ExportDataMenu.png" alt-text="Export data.":::

1. Select **Chatbot** and **Chatbot subcomponent** from the entity list, then select **Export data**. Your data will take a couple of minutes to be compiled for export.

   :::image type="content" source="media/gdpr-export/ExportChatbotAndChatbotSubComponent.png" alt-text="Select entities for export.":::

   :::image type="content" source="media/gdpr-export/export-data-button.png" alt-text="Select export data button.":::

1. When your export is ready, select **Download exported data** to download the content.

   :::image type="content" source="media/gdpr-export/DownloadExportedData.png" alt-text="Download exported data.":::


### Bot sessions (as bot author)
 
You can download session data of last 28 days from the [sessions analytics page](analytics-sessions.md) in Power Virtual Agents. 

Alternately, you can [export data from the ConversationTranscripts table](analytics-sessions.md#export-conversation-transcripts).


## Export system-generated logs (as tenant admin)

1. Go to [https://www.microsoft.com/en-us/trust-center/privacy/gdpr-dsr](https://www.microsoft.com/en-us/trust-center/privacy/gdpr-dsr).

2. Select the **Learn more about the Data Log Export** link under the **Microsoft Data Log Export** section. This will open a new tab or window and go to the [User Privacy blade in the Azure Portal](https://portal.azure.com/#blade/Microsoft_Azure_Policy/UserPrivacyMenuBlade/Overview). Here you can request an export of data.



[!INCLUDE[footer-include](includes/footer-banner.md)]
