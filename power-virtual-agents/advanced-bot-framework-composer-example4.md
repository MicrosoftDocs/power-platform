---
title: "Use Bot Framework Composer to display a form in chatbots"
description: "Use Bot Framework Composer to add a form with a Submit button to your Power Virtual Agents chatbot."
keywords: "composer, adaptive card"
ms.date: 5/24/2021
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: makolomi
ms.custom: "cex"
ms.collection: virtualagent
---

# Example 4 - Display a form with a Submit button in Power Virtual Agents 

You can enhance your bot by developing custom dialogs with [Bot Framework Composer](/composer/) and then adding them to your Power Virtual Agents bot. 

In this example, you'll learn how to display a form with a Submit button in Power Virtual Agents by using Composer.

Before you begin, ensure you read [Extend your bot with Bot Framework Composer](advanced-bot-framework-composer.md) to understand how Composer integrates with Power Virtual Agents.



>[!IMPORTANT]
>Bot Framework Composer integration is not available to users who only have the [Teams Power Virtual Agents license](requirements-licensing-subscriptions.md). You must have a [trial](sign-up-individual.md) or full Power Virtual Agents license.


## Prerequisites

- See how to [Extend your bot with Bot Framework Composer](advanced-bot-framework-composer.md)
- Follow the instructions described in: 
  - [Example 1 - Show an Adaptive Card in Power Virtual Agents](advanced-bot-framework-composer-example1.md)
  - [Example 2 - Display a multi-select options list in Power Virtual Agents](advanced-bot-framework-composer-example2.md)
  - [Example 3 - Use Bing Search as a fallback in Power Virtual Agents](advanced-bot-framework-composer-example3.md)
- [Introduction to Bot Framework Composer](/composer/introduction)
- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]



## Display a form with a Submit button

Open the Power Virtual Agents bot used in the previous examples.

Go to the **Topics** page and select **Open in Bot Framework Composer** under the **+ New topic** dropdown menu to open Composer. 

Select **+ Add new trigger** to add another Bot Framework trigger of type **Intent recognized** to the **Contoso Meal Delivery Service** dialog and call it **StartTrial**. 

Add the following trigger phrases and select **Submit**.
- **start trial**
- **sign up to try**
- **register to try service**

:::image type="content" source="media/Composer_Example4/E4_createStartTrial_trigger.png" alt-text="Composer - create a new trigger.":::

After the **StartTrial** trigger is added, go to the **Bot Responses** tab for this **Contoso Meal Delivery Service** dialog. Switch to **Show code** view, and insert the following Adaptive Card JSON:


````JSON

# StartTrialForm
- ```
{
    "type": "AdaptiveCard",
    "body": [
        {
            "type": "TextBlock",
            "size": "Medium",
            "weight": "Bolder",
            "text": "Register for a meal plan trial:"
        },
        {
            "type": "Input.Text",
            "placeholder": "Please enter your Name",
            "id": "Name"
        },
        {
            "type": "Input.Text",
            "placeholder": "Please enter your Address",
            "id": "Address",
            "isMultiline": true
        },
        {
            "type": "Input.Number",
            "placeholder": "How many weeks",
            "id": "Weeks"
        },
        {
            "type": "ActionSet",
            "actions": [
                {
                    "type": "Action.Submit",
                    "title": "Submit",
                    "style": "positive"
                }
            ]
        }
    ],
    "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
    "version": "1.2"
}
```
````

Note that every data field in this Adaptive card was given an ID: **Name**, **Address**, and **Weeks**.

:::image type="content" source="media/Composer_Example4/E4_createSubmitForm.png" alt-text="Composer - create StartTrialForm.":::

Go to the **Create** tab in Composer and select the **StartTrial** trigger. Add the **Ask a question** action and select type **Text**.

:::image type="content" source="media/Composer_Example4/E4_ask_question.png" alt-text="Composer - ask a question.":::

Select the **Attachments** option in **Prompt for text**:

:::image type="content" source="media/Composer_Example4/E4_selectAttachment_option.png" alt-text="Composer - select Attachment option.":::

Select **Add custom** option and add the following to the **Attachments** window:

```JSON
-${StartTrialForm()}
```

:::image type="content" source="media/Composer_Example4/E4_addAttachment_StartTrialForm.png" alt-text="Composer - add StartTrialForm attachment.":::

Select the **User Input** node and save user input data. Set **Property** to **user.name** and set **Value** to **=turn.activity.value.Name** to extract and save the value of the from field **Name** from our Adaptive card **StartTrialForm** into **user.name**.

:::image type="content" source="media/Composer_Example4/E4_saveUserInput.png" alt-text="Composer - save user input.":::

Your Adaptive card **StartTrialForm** has two more fields, **Address** and **Weeks**. Use the **Set properties** action to extract them from **turn.activity.value** and save them to **user.address** and **user.weeks**:

:::image type="content" source="media/Composer_Example4/E4_setProperties.png" alt-text="Composer - set properties.":::

Add a **Send a Response** action to provide a form submission confirmation:

```JSON
${user.name} - thanks for starting a ${user.weeks} week trial with us! Your meals will be delivered to this address: ${user.address}.
```

:::image type="content" source="media/Composer_Example4/E4_formSubmit_confirm.png" alt-text="Composer - add form submission confirmation.":::

Use the **Begin a PVA Topic** action to call the Power Virtual Agents bot's **End of Conversation** topic to ask the user to rate their experience with the bot:

:::image type="content" source="media/Composer_Example4/E4_call_PVA_End_of_Conversation.png" alt-text="Composer - call Power Virtual Agents topic.":::

You are now ready to add your Composer content to your Power Virtual Agents bot. Go to the **Publish** tab in Composer and publish it to your Power Virtual Agents bot.

Once your new Composer content is successfully published, you can now see that **StartTrial** was added to the **Topics** page in Power Virtual Agents.

>[!NOTE]
>You might need to refresh your **Topics** page to see the new bot content that has been added from Composer.


:::image type="content" source="media/Composer_Example4/E4_StartTrial_inTopicsList.png" alt-text="Power Virtual Agents Topics page.":::

Make sure **Track between topics** is turned on, and test your new bot content by entering the following text in the **Test bot** pane in Power Virtual Agents to start a bot conversation:
- **How do I sign up for a trial?**

:::image type="content" source="media/Composer_Example4/Example4_cropped.png" alt-text="Power Virtual Agents test.":::

>[!Note]
>Using Publish button in Composer does not automativally publish a Virtual Agents bot to your channels. Use [Publish](publication-fundamentals-publish-channels.md) feature in Power Virtual agents to publish your bot changes to the channels.
>
[!INCLUDE[footer-include](includes/footer-banner.md)]
