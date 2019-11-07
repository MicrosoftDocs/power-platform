---

title: "Add actions to your bot using Microsoft Flow"
description: "Learn how to add actions to your bot using Microsoft Flow."
keywords: "KEYWORDS"
ms.date: 09/04/2019
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "VA"
ms.collection: virtualagent
---




# Add actions to your bot using Microsoft Power Automate 

[!INCLUDE [cc-beta-prerelease-disclaimer](includes/cc-beta-prerelease-disclaimer.md)]


## To create a new flow from a Virtual Agent using a template
You can enable your bot to perform an action by calling a Microsoft Automate flow. The flow you want to use must share the same Common Data Service environment as your bot.  You can create a flow from with your Virtual Agent authpring experince by selecting an Action node in Dialog Authoring and using Create new flow button:

(Pic 1 placeholder)

This will open flow template in Microsoft Automate portal in a separate tab. The portal will automatically open in the same environment as the bot and will use the credentials used in Virtual Agent. Bots are only able to call flows that are equipped with HTTP triggers and HTTP responses, and this flow template presents an example of such flow:

(Pic 2 placeholder)

A Virtual Agent bot can only invoke flows that have HTTP Request and HHTP Reponse interfaces. This starter flow in this template takes 2 input parameters, a String and Number, as specified in HTTP Request interface in the flow. The input parameters (String and Number) are described in the JSON snippet in HTTP Code:


Text box 1 (to be used for copy and paste by the reader)
(Pic 3 placeholder)


An HTTP Response is required to return outputs to the bot. This flow example returns 2 output parameters to the bot a String and Number, as specified in HTTP Response:

Text box 2 (for copy and paste by the reader)
(Pic 4 placeholder)


## Modify the bot flow template for your scenarios
This template provides an example flow that would accept input parameters from a bot and also return outputs to the bot. You can modify this flow to suit your needs and create a variety of flows for your bot. For example, you could create a simple flow that takes an email address as an input parameter, sends an email message to that address, and returns a message that the email was successfully sent to a bot as output.

Press Save button to save your new flow:

By default, this new flow is created in My Flows tab on Microsoft Automate portal. Howveer, to use it with the bots, you must import your new flow from My Flows tab into a Solution. 



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

# H1 - Should be same as your title. There should only ever be one H1.

Why would anyone want to do this thing or use this feature?

## H2

Describe what this procedure will do and why someone would want to do it.


### Use H3 underneath H2.
  

For standards, go to the [OPS guide](https://review.docs.microsoft.com/en-us/help/contribute/contribute-how-to-write-use-markdown?branch=master)

Here are some quick references so you can copy and paste:

![IMAGE ALT TEXT](media/IMAGENAME.png)

[Link text](url/filename.md)

[Link text](https://microsoft.com/filename)

>[!NOTE]
>Use a > on a new line for each line break. Notes are purple

>[!WARNING]
>Use a > on a new line for each line break. These are red.

>[!TIP]
>Use a > on a new line for each line break. These are green.

>[!IMPORTANT]
>Use a > on a new line for each line break. These are blue

>[!CAUTION]
>I dont know if this still exists.

**Bold text**

*Italic text*
 
 <!-- comment -->


 Table head row | Second col | Third col
 ---|---|---
 Row text | Row text | Row text




