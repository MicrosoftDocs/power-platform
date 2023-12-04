---
title: "Use Bot Framework Composer to display a form in chatbots"
description: "Use Bot Framework Composer to add a form with a Submit button to your Microsoft Copilot Studio chatbot."
keywords: "composer, adaptive card"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.reviewer: makolomi
ms.custom: "cex"
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Example 4 - Display a form with a Submit button in Microsoft Copilot Studio

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

[!INCLUDE [Composer integrated with PVA](includes/composer-integrated-with-pva.md)]

Enhance your bot by developing custom dialogs with [Bot Framework Composer](/composer/) and then adding them to your Microsoft Copilot Studio bot.

In this example, you'll learn how to display a form with a Submit button in Microsoft Copilot Studio by using Composer.

[!INCLUDE [Composer License](includes/composer-license.md)]

## Prerequisites

- [Example 1 - Show an Adaptive Card in Microsoft Copilot Studio](advanced-bot-framework-composer-example1.md).
- [Example 2 - Display a multi-select options list in Microsoft Copilot Studio](advanced-bot-framework-composer-example2.md).
- [Example 3 - Use Bing Search as a fallback in Microsoft Copilot Studio](advanced-bot-framework-composer-example3.md).

## Create a new trigger

1. In Microsoft Copilot Studio, open the bot from Example 3. If you haven't completed Example 3 yet, see [Use Bing Search as a fallback in Microsoft Copilot Studio](advanced-bot-framework-composer-example3.md).

1. Open your bot in Composer. For instructions on how to do so, see [Getting started with Bot Framework Composer](advanced-bot-framework-composer-fundamentals.md#open-your-bot-in-composer).

1. In the bot explorer, go to the main dialog. Select **More options** (**...**) then select **Add new trigger**.

1. In the **Create a trigger** window:

    1. For **What is the type of this trigger?**, select **Intent recognized**.
    1. For **What is the name of this trigger?**, enter `StartTrial`.
    1. For **Trigger phrases**, copy and paste the following:

        ```lu
        - start trial
        - sign up to try
        - register to try service
        ```

    1. Select **Submit**.

    :::image type="content" source="media/advanced-bot-framework-composer-example4/E4_createStartTrial_trigger.png" alt-text="Screenshot of the Create a trigger window.":::

1. Go to the **Bot Responses** page, select **Contoso Meal Delivery Service**, then select **Show code**.

1. Copy and paste the following into the code view:

    ````lg
    # adaptivecardjson_StartTrialForm()
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

    Every input field in this Adaptive card has a unique ID: **Name**, **Address**, and **Weeks**.

    :::image type="content" source="media/advanced-bot-framework-composer-example4/e4_createsubmitform.png" alt-text="Screenshot of the Adaptive Card JSON added to the bot responses.":::

1. Copy and paste the following code into the same code view:

    ````lg
    # AdaptiveCard_StartTrialForm()
    [Activity
        Attachments = ${json(adaptivecardjson_StartTrialForm())}
    ]
    ````

    :::image type="content" source="media/advanced-bot-framework-composer-example4/E4_createSubmitFormActivity.png" alt-text="Screenshot of the activity added to the bot responses.":::

## Add conversation logic

1. Go to the **Create** page and select the **StartTrial** trigger.

1. On the authoring canvas, select **Add** (**+**), **Ask a question**, then **Text**.

1. In the properties pane, under **Bot responses**, and select **Show code**.

    > [!WARNING]
    > Adding the expression in the next step to the _response_ editor instead of the _code_ editor will result in the bot responding with raw JSON instead of an Adaptive Card.

1. Copy and paste the following expression:

    ```lg
    - ${AdaptiveCard_StartTrialForm()}
    ```

    :::image type="content" source="media/advanced-bot-framework-composer-example4/e4_call_starttrialform_activity.png" alt-text="Screenshot of the prompt for text response.":::

1. Select the **User Input** tab in the properties pane, then do the following:

    1. For **Property**, enter `user.name`.
    1. For **Value**, enter `=turn.activity.value.Name`.

    :::image type="content" source="media/advanced-bot-framework-composer-example4/E4_saveUserInput.png" alt-text="Screenshot of the user input action.":::

1. On the authoring canvas, select **Add** (**+**), **Manage properties**, then **Set properties**.

1. In the properties pane, do the following:

    1. Under **Assignments**, select **Add new** to add a **Property** box and a **Value** box.
    1. For **Property**, enter `user.address`
    1. For **Value**, enter `=turn.activity.value.Address`.
    1. Select **Add new** a second time to add another **Property** and **Value**.
    1. For **Property**, enter `user.weeks`.
    1. For **Value**, enter `=turn.activity.value.Weeks`.

    :::image type="content" source="media/advanced-bot-framework-composer-example4/E4_setProperties.png" alt-text="Screenshot of the Set properties action.":::

1. On the authoring canvas, select **Add** (**+**) then **Send a response**.

1. In the response editor, copy and paste the following:

    ```lg
    ${user.name} - thanks for starting a ${user.weeks} week trial with us! Your meals will be delivered to this address: ${user.address}.
    ```

    :::image type="content" source="media/advanced-bot-framework-composer-example4/E4_formSubmit_confirm.png" alt-text="Screenshot of the confirmation response.":::

1. On the authoring canvas, select **Add** (**+**) then **Begin a Microsoft Copilot Studio Topic**.

1. In the properties pane, for **Dialog name**, select **End of conversation**.

    :::image type="content" source="media/advanced-bot-framework-composer-example4/e4_call_pva_end_of_conversation.png" alt-text="Screenshot of the Begin a Microsoft Copilot Studio topic action.":::

## Test your bot

1. [Publish your Composer content](advanced-bot-framework-composer-fundamentals.md#test-composer-content-within-microsoft-copilot-studio) to make it available in your Microsoft Copilot Studio bot.

    [!INCLUDE [Publish Composer](includes/composer-publish-note.md)]

1. Go to the Microsoft Copilot Studio **Topics** page to see your new **StartTrial** topic.

    :::image type="content" source="media/advanced-bot-framework-composer-example4/E4_StartTrial_inTopicsList.png" alt-text="Screenshot of the new topic visible in Microsoft Copilot Studio.":::

1. Open the **Test bot pane** and make sure **Track between topics** is turned on. Enter the message `How do I sign up for a trial?` to start your conversation.

    :::image type="content" source="media/advanced-bot-framework-composer-example4/Example4_cropped.png" alt-text="Screenshot of the Microsoft Copilot Studio test bot pane.":::

[!INCLUDE[footer-include](includes/footer-banner.md)]
