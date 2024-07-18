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

As users interact with Copilot in Customer Service while supporting a customer, they will interact with corpus of data sources ingested plus responses from plugins calling external systems for data.

As a user gets a response from Copilot the user can give a feedback signal of whether the response was good or bad.

The **msdyn_copilotinteraction** table contains metadata on all copilot interactions, including the request response for various Copilot in Customer Service responses (thumbs up/down) and can be useful for audit or request/response analysis for thumbs down interactions. It additionally contains responses from the Compose an Email feature during multi turn responses.  

## Causes of growth

Copilot in Customer Service provides real-time AI assistance that helps agents automate time-consuming tasks to handle cases efficiently and resolve issues faster so that they can deliver value to customers.

When you enable the Copilot features, agents can do the following actions in the Customer Service workspace app:

- [Respond to questions](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/copilot-enable-help-pane#enable-ask-a-question)
- [Compose an email](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/copilot-email-enable)
- [Draft a chat response](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/copilot-enable-help-pane#enable-draft-a-response-preview)
- [Summarize a case and conversation](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/copilot-enable-summary)

As more agents interact with Copilot in Customer Service and provide feedback signals the larger the **msdyn_copilotinteraction** table will grow in size. 

The chat transcripts and msdyn_interactiondata can be downloaded for offline analysis [Download Copilot transcripts and interaction data](https://learn.microsoft.com/en-us/dynamics365/customer-service/develop/download-copilot-transcript-data) 

## Table cleanup

Admins can disable copilot interaction captured by first disabling historical analytics for Copilot in Customer Service Admin Center [Enable historical analytics for Copilot](https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-cs-historical-analytics-csh#enable-historical-analytics-for-copilot). 

After disabling historical analytics for Copilot then the capture can individually be disabled for each feature for [Copilot for questions and email]((https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-copilot-features#record-agent-interactions-with-copilot) and summaries(https://learn.microsoft.com/en-us/dynamics365/customer-service/administer/configure-copilot-features#record-agent-interactions-with-copilot). 

 Admin's can set data retention policy to purge the **msdyn_copilotinteraction** table via [Dataverse long term data retention](/power-apps/maker/data-platform/data-retention-overview).

## Appendix

To learn more about [Manage Copilot features in Customer Service](/dynamics365/customer-service/administer/configure-copilot-features)

[FAQ for Copilot in Customer Service](/dynamics365/customer-service/administer/faq-copilot-features)

### See also


- [Dataverse storage capacity](capacity-storage.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
