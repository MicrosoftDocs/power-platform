---
title: msdyn_copilotinteraction table storage 
description: Learn about managing msdyn_copilotinteraction table storage.
author: ceian
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/19/2024
ms.subservice: admin
ms.author: ceian
ms.reviewer: sericks
contributors:
- shilpr
- sarmathi
search.audienceType: 
  - admin
---

# msdyn_copilotinteraction table

:::image type="content" source="media/manage-storage-msdyn-copilotinteraction-table.png" alt-text="Microsoft Copilot for Service" lightbox="media/manage-storage-msdyn-copilotinteraction-table.png" :::

As users interact with [Microsoft Copilot for Service](https://www.microsoft.com/en-us/microsoft-copilot/microsoft-copilot-for-service) while supporting a customer, they will interact with corpus of data sources ingested plus responses from plugins calling external systems for data.

As a user gets a response from Copilot the user can give a feedback signal of whether the response was good or bad.

The **msdyn_copilotinteraction** table contains metadata on all copilot interactions, including the request response for various Copilot in Customer Service responses (thumbs up/down) and can be useful for audit or request/response analysis for thumbs down interactions. It additionally contains responses from the Compose an Email feature during multi turn responses.  

When agents use Copilot, agent interactions with Copilot such as copying summaries, using a suggested reply, feedback, and chat transcripts are stored in the [msdyn_copilotinteraction](/dynamics365/customer-service/develop/reference/entities/msdyn_copilotinteraction), [msdyn_copilotinteractiondata](/dynamics365/customer-service/develop/reference/entities/msdyn_copilotinteractiondata), [msdyn_copilottranscript](/dynamics365/customer-service/develop/reference/entities/msdyn_copilottranscript), and [msdyn_copilottranscriptdata](/dynamics365/customer-service/develop/reference/entities/msdyn_copilottranscriptdata) tables in Dataverse.

## Causes of growth

Copilot in Customer Service provides real-time AI assistance that helps agents automate time-consuming tasks to handle cases efficiently and resolve issues faster so that they can deliver value to customers.

When you enable the Copilot features, agents can do the following actions in the Customer Service workspace app:

- [Respond to questions](/dynamics365/customer-service/administer/copilot-enable-help-pane#enable-ask-a-question)
- [Compose an email](/dynamics365/customer-service/administer/copilot-email-enable)
- [Draft a chat response](/dynamics365/customer-service/administer/copilot-enable-help-pane#enable-draft-a-response-preview)
- [Summarize a case and conversation](/dynamics365/customer-service/administer/copilot-enable-summary)

As more agents interact with Copilot in Customer Service and provide feedback signals the larger the **msdyn_copilotinteraction** table will grow in size. 

The chat transcripts and msdyn_interactiondata can be downloaded for offline analysis [Download Copilot transcripts and interaction data](/dynamics365/customer-service/develop/download-copilot-transcript-data) 

## Table cleanup

Admins can disable copilot interaction captured by first disabling historical analytics for Copilot in Customer Service Admin Center [Enable historical analytics for Copilot](/dynamics365/customer-service/administer/configure-cs-historical-analytics-csh#enable-historical-analytics-for-copilot). 

After disabling historical analytics for Copilot then the capture can individually be disabled for each feature for [Copilot for questions and email]((/dynamics365/customer-service/administer/configure-copilot-features#record-agent-interactions-with-copilot) and summaries(/dynamics365/customer-service/administer/configure-copilot-features#record-agent-interactions-with-copilot). 

 Admin's can set data retention policy to purge the **msdyn_copilotinteraction** table via [Dataverse long term data retention](/power-apps/maker/data-platform/data-retention-overview).

## Appendix

To learn more about [Manage Copilot features in Customer Service](/dynamics365/customer-service/administer/configure-copilot-features)

[FAQ for Copilot in Customer Service](/dynamics365/customer-service/administer/faq-copilot-features)

### See also


- [Dataverse storage capacity](capacity-storage.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
