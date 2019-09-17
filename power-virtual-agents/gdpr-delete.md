---
title: "Responding to GDPR Data Subject Delete Requests for Dynamics 365 Virtual Agent for Customer Service"
description: "Learn how to respond​ to GDPR Data Subject Delete Requests for Dynamics 365 Virtual Agent for Customer Service."
ms.date: 05/29/2019
ms.service:
  - "dynamics-365-ai"
ms.topic: article
author: m-hartmann
ms.author: mhart
manager: shellyha
---

# Responding to requests to delete data from Virtual Agent for Customer Service

[!INCLUDE [cc-beta-prerelease-disclaimer](includes/cc-beta-prerelease-disclaimer.md)]

Dynamics 365 Virtual Agent for Customer Service offers the following experiences to delete personal data for a specific user:

* [Bot chat logs](#bot-chat-logs)
* [Virtual Agent bot content](#virtual-agent-bot-content)
* [Virtual Agent telemetry](#virtual-agent-telemetry)
* [Metrics](#metrics)
* [System telemetry](#system-telemetry)

### Bot chat logs

Bot chat logs are deleted when the bot is deleted.

### Virtual Agent bot content

Follow these steps to delete a bot:

1. Open Virtual Agent in your browser.
2. On the **Settings** menu, select **General settings** to display the **General** tab of the **Settings** screen.

   ![General settings](media/general-settings.png)

3. In the **Delete bot** section, select **Delete bot**.

All bot content is immediately deleted.

### Bot chat logs

All bot chat logs are deleted when the bot is deleted. See [steps to delete bot](#virtual-agent-bot-content) for more information.

### Virtual agent telemetry

All virtual agent telemetry data is automatically deleted within 29 days. No action from the user is needed.

### Metrics

To delete metrics data, you must delete your bot. See [steps to delete your bot](#virtual-agent-bot-content) for more information.

### System telemetry

All bot system telemetry is automatically deleted within 29 days. No action from the user is needed.

> [!NOTE]
> Removing personal data includes removing all personal data and system-generated logs except audit log information.
