---
title: "Add actions to your bot using Microsoft Flow"
description: "Learn how to add actions to your bot using Microsoft Automate flows."
keywords: "KEYWORDS"
ms.date: 10/29/2019
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "PVA"
ms.collection: powervirtualagents
---



# Add actions to your bot using Microsoft Power Automate 

[!INCLUDE [cc-beta-prerelease-disclaimer](includes/cc-beta-prerelease-disclaimer.md)]


## To create a new flow from Power Virtual Agents 
You can enable your bot to perform an action by calling a Microsoft Automate. The flow that can be called from a Dialog must be in the same Common Data Service environment as your bot. To create a flow for the bot, select Call an action node and use Create a flow option:

(Pic 1 placeholder)

Using Create a flow option will open a starter flow template in Microsoft Automate portal in a separate tab. The Microsoft Automate portal will automatically open in the same environment as the bot using the same user credentials.

This template is an example of a flow that can be used by bots. To be suitable for bots, a Microsoft Automate flow requires a special kind of trigger and response actions: 
•	Trigger: HHTP Request
•	Response: HTTP Response


(Pic 2 placeholder)

Bots can use the following types of inputs and outputs with Microsoft Automate flows:
•	Number
•	String
•	Boolean

This example shows how to setup a flow to accept 2 input parameters from a bot, a String and a Number, as specified in HTTP Request Body JSON Schema by this JSON snippet:


(Pic 3 placeholder)

Request Body JSON Schema:

{
    "type": "object",
    "properties": {
        "flow_input_string": {
            "type": "string"
        },
        "flow_input_number": {
            "type": "number"
        }
    }
}



An HTTP Response action must be used to return outputs to the bot. This template provides an example on how to returns 2 output parameters to the bot, a String and Number:

Text box 2 (for copy and paste by the reader)
(Pic 4 placeholder)

Note that both Body and Response Body JSON Schema sections must be filled out in HTTP Response action:

Pic1 

HTTP Response Body JSON Schema (under advanced options)
Pic 2

{
    "type": "object",
    "properties": {
        "flow_output_string": {
            "type": "string"
        },
        "flow_output_number": {
            "type": "number"
        }
    }
}

This template provides a fully functional flow that would work with bots. Press Save button to save your new flow:

Pic 3 (Save Flow)

Your flow will be saved to My flows tab on Microsoft Automate portal:

Pic 4 (My Flows tab)


## Add your flow to a Solution
Go to Solutions tab on Microsoft Automate portal to see what Solutions are available to you:

Pic 5 (Solutions Tab)

You can use any of existing Solutions for your flow, or you can create a new Solution. To create a new Solution, click on New button. Give you solution a name, select CDS as Publisher, and give it a version. 

Pic 6 (Create a new solution)

Use “Import button to import your new flow into a solution. Select Option Outside of Solutions and select you new flow. Once it is in a Solution, it can be used by a bot.

Pic 7 (import a flow into a solution)

This flow is now ready to be used in a bot. 


## Use your flow in a bot

You can use you new flow in any Topic in a bot; you can pass variables to this as inputs flow and receive outputs that can be used in the dialog. Select Topics in the left pane to open the Topics page, and then select New topic.

Picture 8 (Create a new Topic)

Specify a name, description, and trigger phrases for the topic. A trigger phrase is a phrase that a customer enters in the chat window to start a conversation with the bot. You can include punctuation in a trigger phrase, but it is best to use short phrases rather than long sentences.
For example, for a Daily Deals topic, you could specify the following trigger phrases:
daily deals
deal of the day
current deals
today’s deals
current offers
today’s specials

Once you have created the topic, you can create a conversation path that uses your flow. Select Edit to open the conversation editor.

In the conversation editor, enter a bot response in the Bot Says node, and then select User Says to display the User Responses node.

Picture 9 (Create bot converstaion that calls a flow)

## To test the flow
1. In the **Test bot** pane, select **Start over with latest conversation**. Then specify a trigger phrase for the topic that contains the flow.

2. Enter your email address at the prompt.

    The bot displays the email address to the customer to confirm that it will send a message to that address and stores the message specified in the flow in the **(x) message** variable.

    The flow then sends the message to the customer.
    
 Picture 10 (Test bot converstaion that calls a flow)

