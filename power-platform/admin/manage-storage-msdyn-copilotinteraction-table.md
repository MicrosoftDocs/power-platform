---
title: Overview of the msdyn_copilotinteraction table 
description: Learn about managing msdyn_copilotinteraction table storage.
author: ceian
ms.component: pa-admin
ms.topic: conceptual
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

#  Overview of the msdyn_copilotinteraction table 

As users interact with [Microsoft Copilot for Service](https://www.microsoft.com/microsoft-copilot/microsoft-copilot-for-service) while supporting a customer, they interact with a large set of data sources, including responses from plug-ins calling external systems for data.

When a user gets a response from Copilot, the user can give a feedback signal of whether the response was good or bad.

The **msdyn_copilotinteraction** table contains metadata on all Copilot interactions, including the request response for Copilot in Customer Service responses (thumbs up/down) and can be useful for audit or request/response analysis for thumbs down interactions. It additionally contains responses from the Compose an Email feature during multiturn responses.  

When agents use Copilot, agent interactions with Copilot such as copying summaries, using a suggested reply, feedback, and chat transcripts are stored in the [msdyn_copilotinteraction](/dynamics365/customer-service/develop/reference/entities/msdyn_copilotinteraction), [msdyn_copilotinteractiondata](/dynamics365/customer-service/develop/reference/entities/msdyn_copilotinteractiondata), [msdyn_copilottranscript](/dynamics365/customer-service/develop/reference/entities/msdyn_copilottranscript), and [msdyn_copilottranscriptdata](/dynamics365/customer-service/develop/reference/entities/msdyn_copilottranscriptdata) tables in Dataverse.

## Causes of growth

 [Microsoft Copilot for Service](https://www.microsoft.com/en-us/microsoft-copilot/microsoft-copilot-for-service) provides real-time assistance that helps agents automate time-consuming tasks to handle cases efficiently and resolve issues faster so that they can deliver value to customers.

When you turn on the Copilot features, agents can perform the following actions in the Customer Service workspace app:

- [Respond to questions](/dynamics365/customer-service/administer/copilot-enable-help-pane#enable-ask-a-question)
- [Compose an email](/dynamics365/customer-service/administer/copilot-email-enable)
- [Draft a chat response](/dynamics365/customer-service/administer/copilot-enable-help-pane#enable-draft-a-response-preview)
- [Summarize a case and conversation](/dynamics365/customer-service/administer/copilot-enable-summary)

The **msdyn_copilotinteraction** table grows in size as more agents interact with Copilot in Customer Service and provide feedback signals.

The chat transcripts in **msdyn_interactiondata** can be downloaded for offline analysis. Learn more: [Download Copilot transcripts and interaction data](/dynamics365/customer-service/develop/download-copilot-transcript-data) 

## Table clean-up

Admins can turn off historical analytics for Copilot in Customer Service Admin Center through disabling [historical analytics for Copilot](/dynamics365/customer-service/administer/configure-cs-historical-analytics-csh#enable-historical-analytics-for-copilot). 

Once admins turn off historical analytics for Copilot, then an admin can turn off the interactions for each feature for [Copilot for questions, email, and summaries](/dynamics365/customer-service/administer/configure-copilot-features#opt-out-from-using-copilot-features). 

Admins can set up custom [bulk delete jobs](/microsoft-copilot-studio/analytics-sessions-transcripts#create-a-new-bulk-delete-job) to control how long transcripts are [retained as data](/microsoft-copilot-studio/analytics-sessions-transcripts#change-the-default-retention-period). 

Using the [bulk delete job](/microsoft-copilot-studio/analytics-sessions-transcripts#create-a-new-bulk-delete-job) capabilities of the platform, admins can extend the ConversationTranscript schema with more columns allowing for better selection around which transcript records are deleted, or retained. 

Admins can also set the data retention policy to purge the **msdyn_copilotinteraction** table through [Dataverse long term data retention](/power-apps/maker/data-platform/data-retention-overview).

### Related information

- [Opt out from using Copilot features](/dynamics365/customer-service/administer/configure-copilot-features#opt-out-from-using-copilot-features)
- [FAQ for Copilot in Customer Service](/dynamics365/customer-service/administer/faq-copilot-features)
- [Dataverse storage capacity](capacity-storage.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
