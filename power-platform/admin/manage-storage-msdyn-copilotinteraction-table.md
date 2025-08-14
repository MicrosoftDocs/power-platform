---
title: Overview of the msdyn_copilotinteraction table 
description: Learn about the management of msdyn_copilotinteraction table storage.
author: ceian
ms.component: pa-admin
ms.topic: concept-article
ms.date: 08/01/2024
ms.subservice: admin
ms.author: ceian
ms.reviewer: sericks
contributors:
- shilpr
- sarmathi
search.audienceType: 
  - admin
---

# Overview of the msdyn_copilotinteraction table 

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Agents who work with [Microsoft 365 Copilot for Service](https://www.microsoft.com/microsoft-copilot/microsoft-copilot-for-service) to support customers interact with a large set of data sources. These data sources include responses from plug-ins that call external systems for data.

As agents use Copilot, their interactions might include copying summaries, using suggested replies, providing feedback, and generating chat transcripts. In addition, when agents receive a response from Copilot, they can give a feedback signal to indicate whether that response was good or bad. These interactions with Copilot are stored in the [msdyn_copilotinteraction](/dynamics365/customer-service/develop/reference/entities/msdyn_copilotinteraction), [msdyn_copilotinteractiondata](/dynamics365/customer-service/develop/reference/entities/msdyn_copilotinteractiondata), [msdyn_copilottranscript](/dynamics365/customer-service/develop/reference/entities/msdyn_copilottranscript), and [msdyn_copilottranscriptdata](/dynamics365/customer-service/develop/reference/entities/msdyn_copilottranscriptdata) tables in Dataverse.

This article provides information about the `msdyn_copilotinteraction` table. The `msdyn_copilotinteraction` table contains *metadata* about all Copilot interactions, including the request response for Copilot in Customer Service responses (thumbs up/down). This information can be useful for audits or request/response analysis of thumbs-down interactions. The metadata also includes responses from the Compose an Email feature during multiturn responses.

## Causes of growth

[Microsoft 365 Copilot for Service](https://www.microsoft.com/microsoft-copilot/microsoft-copilot-for-service) provides real-time assistance that helps agents automate time-consuming tasks, so that they can handle cases efficiently and resolve issues faster. Therefore, they can deliver value to customers.

When you turn on the Copilot features, agents can perform the following actions in the Customer Service workspace app:

- [Respond to questions](/dynamics365/customer-service/administer/copilot-enable-help-pane#enable-ask-a-question)
- [Compose an email](/dynamics365/customer-service/administer/copilot-email-enable)
- [Draft a chat response](/dynamics365/customer-service/administer/copilot-enable-help-pane#enable-draft-a-response-preview)
- [Summarize a case and conversation](/dynamics365/customer-service/administer/copilot-enable-summary)

As agents interact with Copilot in Customer Service and provide feedback signals, the size of the `msdyn_copilotinteraction` table grows.

The chat transcripts in the `msdyn_interactiondata` table can be downloaded for offline analysis. Learn more in [Download Copilot transcripts and interaction data](/dynamics365/customer-service/develop/download-copilot-transcript-data).

## Table cleanup

Admins can [turn off historical analytics for Copilot](/dynamics365/customer-service/administer/configure-cs-historical-analytics-csh#enable-historical-analytics-for-copilot) in the Customer Service admin center. They can then turn off the interactions for each feature for [Copilot for questions and email and Copilot case and conversation summaries](/dynamics365/customer-service/administer/configure-copilot-features#opt-out-from-using-copilot-features).

In addition, admins can [set up custom bulk delete jobs](/microsoft-copilot-studio/analytics-sessions-transcripts#create-a-new-bulk-delete-job) to [control how long transcripts are retained as data](/microsoft-copilot-studio/analytics-sessions-transcripts#change-the-default-retention-period).

By using the [bulk delete job](/microsoft-copilot-studio/analytics-sessions-transcripts#create-a-new-bulk-delete-job) capabilities of the platform, admins can extend the `ConversationTranscript` schema with more columns. This type of extension allows for better selection about which transcript records are deleted or retained.

Admins can also set the data retention policy to purge the `msdyn_copilotinteraction` table through [Dataverse long term data retention](/power-apps/maker/data-platform/data-retention-overview).

## Related content

- [Opt out from using Copilot features](/dynamics365/customer-service/administer/configure-copilot-features#opt-out-from-using-copilot-features)
- [FAQ for Copilot in Customer Service](/dynamics365/customer-service/administer/faq-copilot-features)
- [Dataverse capacity-based storage details](capacity-storage.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
