---
title: Hand off to Salesforce Einstein bot 
description: Step-by-step instructions on how to create and connect a Salesforce Einstein Bot to a Copilot Studio copilot. This integration allows you to leverage the capabilities of both platforms to enhance your chatbot experience.
ms.reviewer: pswimm
ms.date: 11/14/2023
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.collection: power-virtual-agents
ms.service: power-virtual-agents
---

# Hand off to Salesforce Einstein bot 

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

This document provides step-by-step instructions on how to create and connect an Einstein Bot to a Copilot Studio bot. This integration allows you to leverage the capabilities of both platforms to enhance your chatbot experience.

## Prerequisites

Before you begin, ensure that you have the following prerequisites in place:

- An active Salesforce account with Einstein Bots enabled.
- You'll need an account for Copilot Studio. 
- Admin or developer access to both Salesforce and Microsoft Power Platform.


### Step 1: Retrieve Direct Line secret for your bot

1. Retrieve your [Direct LinesSecret](/azure/bot-service/rest-api/bot-framework-rest-direct-line-3-0-authentication?view=azure-bot-service-4.0).


### Step 2: Configure Salesforce remote site settings

1. Log in to your Salesforce account.

1. In Salesforce, navigate to **Setup**.

1. In the **Quick Find** box, type *Remote Site Settings* and select **Remote Site Settings**.

1. Add a new remote site, fill in **Remote Site Name** as *Copilot Studio* and **Remote Site URL** as **https\://directline.botframework.com**

1. Click Save.

> [!NOTE]
> 
> For other regions use the appropriate URL for the DirectLine API URL

### Step 3: Create Apex Classes to connect to DirectLine API

1. Log in to your Salesforce account.

1. In Salesforce, navigate to **Setup**.

1. In the **Quick Find** box, type *Apex Classes*.

1. Create three new classes with the following details:

**DL_GetConversation**  
- Inputs: None
- Outputs: (String) conversationId, (Integer) responseCode, (String) errorMessage
- InvocableMethod getConversationID, use your DirectLine Secret to make an HTTP call to the DirectLine endpoint starting a conversation

**DL_PostActivity**  
- Inputs: (String) conversationId, (String) userMessage
- Outputs: (Integer) responseCode, (String) errorMessage, (String) watermark
- InvocableMethod postActivity: Execute an HTTP call to the post activity DirectLine API using the conversationId in the URL and userMessage

**DL_GetActivity**
- Inputs: (String) conversationId, (String) watermark
- Outputs: (String) message, (String) watermark, (Integer) responseCode, (String) errorMessage
- InvocableMethod getActivity: Execute an HTTP call to the get activity DirectLine API, using the conversationId and watermark to retrieve and parse the activity object for the message to send back to the user

### Step 4: Setup Einstein bot

1. Log in to your Salesforce account.

1. In Salesforce, navigate to **Setup**.

1. In the **Quick Find** box, type *Einstein* and select *Einstein Bots*.

1. Create a new Einstein bot following the steps within the [Salesforce Einstein Documentation](https://help.salesforce.com/s/articleView?language=en_US&id=sf.bots_service_enhanced.htm&type=5).

### Step 5: Connect Einstein Bot to PVA with Apex classes
In the Einstein Bot, to have the bot reach out on each utterance outside of Einstein topics you can add references to the previously created Apex classes:

1. In the Welcome topic, add an Apex class action referencing the DL_GetConversation class and assign the response variables appropriately.

1. In the Confused topic, add an Apex class action referencing the DL_PostActivity class, passing the conversationId and last user input. Be sure to set the response variables to additional variables.

1. Create a condition to check the Response Code from the DL_PostActivity Apex action, if the code is 200 or 204 you can continue, otherwise display the Error Message.

1. Add another Apex class action to DL_GetActivity, setting the conversationId from GetConversation and the watermark from the PostActivity, and assigning the response variables.

>[!NOTE]
>You may want to create GetActivity as a separate topic. You may need to loop on DL_GetActivity to get the actual response, if it takes longer to fetch.

1. Create a condition to check the response code and that the return message is set, if so, then go to a message node to output the response.

1. The last step in the flow should remain as "Wait for Customer Input".

### Step 6: Handle Agent Handoff

When accessing Copilot from Einstein, Copilot will only be used in a request/response model: based on the user's query,  Copilot will fetch the KB most appropriate and summarize the answer.  

Because you can continue to configure your Einstein bot, you can implement any additional topic triggers or escalation triggers in Einstein. This will allow your users to escalate to the appropriate Salesforce Live Agent queues.

For more information, see the Salesorce documentation [Route Conversations from an Enhanced Bot](https://help.salesforce.com/s/articleView?id=sf.bots_service_enhanced_route_from.htm&type=5).
