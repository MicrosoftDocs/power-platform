---
title: "Responding to GDPR Data Subject Export Requests"
description: "Learn how to respond​ to GDPR Data Subject Export Requests for Power Virtual Agents."
ms.date: 9/22/2020
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

1. Export customer data – Bot content (tenant admin)
2. Export customer data – Bot sessions (bot author)
3. Export system-generated logs (tenant admin) 


## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]



## Export the bot content

**Export customer data – Bot content (tenant admin):**
1. Go to [https://www.powerapps.com](https://www.powerapps.com) and sign in with your credentials.

   :::image type="content" source="media/export-1.png" alt-text="Sign in to powerapps.com." border="false":::

2. After signing in, you are redirected to the Microsoft Power Platform admin center.

   :::image type="content" source="media/export-2.png" alt-text="Power Platform admin center." border="false":::

3. In the side navigation pane, expand the **Data** node. Select **Entities** and select **Export data**.

   :::image type="content" source="media/export-3.png" alt-text="Export data.":::

4. On the Export data screen, select **BotContent** and **Note** from the entity list. Select **Export data** at the top. Your data will take a couple of minutes to be compiled for export.

   :::image type="content" source="media/export-4.png" alt-text="Select entities for export." border="false":::

5. Select **Download exported data** to download the content.

   :::image type="content" source="media/export-6.png" alt-text="Download exported data." border="false":::


**Export customer data – Bot sessions (bot author):**
 
You can download session data from the [sessions analytics page](analytics-sessions.md) in Power Virtual Agents.

**Export system-generated logs (tenant admin)**


1. Go to [https://www.microsoft.com/en-us/trust-center/privacy/gdpr-dsr](https://www.microsoft.com/en-us/trust-center/privacy/gdpr-dsr).

2. Select the **Learn more about the Data Log Export** link under the **Microsoft Data Log Export** section. This will open a new tab or window and go to the [User Privacy blade in the Azure Portal](https://portal.azure.com/#blade/Microsoft_Azure_Policy/UserPrivacyMenuBlade/Overview). Here you can request an export of data.



[!INCLUDE[footer-include](includes/footer-banner.md)]