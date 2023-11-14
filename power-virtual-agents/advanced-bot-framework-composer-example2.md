---
title: "Use Bot Framework Composer to display an options list in chatbots"
description: "Use Bot Framework Composer to add multi-select options to your Microsoft Copilot Studio chatbot."
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

# Example 2 - Display a multi-select options list in Microsoft Copilot Studio

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

[!INCLUDE [Composer integrated with PVA](includes/composer-integrated-with-pva.md)]

Enhance your bot by developing custom dialogs with [Bot Framework Composer](/composer/) and then adding them to your Microsoft Copilot Studio bot.

In this example, you'll learn how to display a multi-select list in Microsoft Copilot Studio by using Composer.

[!INCLUDE [Composer License](includes/composer-license.md)]

## Prerequisites

- [Example 1 - Show an Adaptive Card in Microsoft Copilot Studio](advanced-bot-framework-composer-example1.md).

## Create a new dialog

1. In Microsoft Copilot Studio, open the bot you created in Example 1. If you haven't completed Example 1 yet, see [Show an Adaptive Card in Microsoft Copilot Studio](advanced-bot-framework-composer-example1.md).

1. Open your bot in Composer. For instructions on how to do so, see [Getting started with Bot Framework Composer](advanced-bot-framework-composer-fundamentals.md#open-your-bot-in-composer).

1. In Composer, go to the **Create** page. In your bot, select **More options** (**...**) then select **+ Add a dialog**. For **Name** enter `DailySpecials`.

1. In your new **DailySpecials** dialog, select the **BeginDialog** trigger to open the authoring canvas.

1. On the authoring canvas, select **Add** (**+**), **Manage properties**, and **Set a property**.

1. In the properties pane:

    1. For **Property**, enter `conversation.days_array`.

    1. For **Value**, change the type to **\[] array**.

        :::image type="content" source="media/advanced-bot-framework-composer-example2/E2_DailySpecials_setArray.png" alt-text="Screenshot of how to change the type of the value property.":::

    1. For **Value**, copy and paste the following array

        ```JSON
        ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
        ```

:::image type="content" source="media/advanced-bot-framework-composer-example2/begin-dialog-complete.png" alt-text="Screenshot of the completed dialog.":::

## Configure bot responses

1. Go to the **Bot Responses** page, select **DailySpecials**, then select **Show code**.

1. Copy and paste the following template into the code view to create daily offers for all the days of the week.

    ```lu
    # DailySpecials(day)
    - SWITCH: ${day}
    - CASE: ${0}
        - All tofu meals are 10% off on Sundays!
        - Every Sunday, all tofu entrees are 10% off.
    - CASE: ${1}
        - All steak options are 10% off on Mondays!
        - Enjoy your Monday with a special offer of 10% off on all steak dishes!
    - CASE: ${2}
        - All the chicken meal options are 10% off on Tuesdays!
        - Tuesday special is 10% off on all the chicken dishes!
    - CASE: ${3}
        - All the chicken and tofu meal options are 10% off on Wednesdays!
        - Wednesday special is 10% off on all the chicken and tofu dishes!
    - CASE: ${4}
        - On Thursdays, get a free delivery in Seattle, Bellevue, and Redmond on all orders over $80!
        - Thursday special is a free delivery on orders over $80 in Seattle, Bellevue, and Redmond.
    - CASE: ${5} 
        - Friday special - get a 10% discount on all dishes and delivery is free on all orders over $80!
        - Every Friday, we offer 10% off on all meals and a free delivery on orders over $80!
    - CASE: ${6}
        - On Saturdays, we have a free delivery on all orders over $50.
        - Free delivery on all orders over $50 on Saturdays!
    - DEFAULT:
        - Holiday special - free delivery anywhere in Seattle, Bellevue and Redmond on orders over $70 today!
        - Holiday Delivery is on us if you are in Seattle, Bellevue and Redmond and your order is over $70 total!
    ```

    :::image type="content" source="media/advanced-bot-framework-composer-example2/E2_DailySpecials_BotResponse.png" alt-text="Screenshot of daily offers logic entered into the code view.":::

## Prompt for user input

1. Go to the **Create** page. In the bot explorer, under **DailySpecials**, select **BeginDialog**.

1. On the authoring canvas, select **Add** (**+**), **Ask a question**, and **Multi-choice**.

1. Select the **User Input (Choice)** action. In the properties pane, under **Responses**, enter `Please select a day:`

    :::image type="content" source="media/advanced-bot-framework-composer-example2/E2_DailySpecials_prompt.png" alt-text="Screenshot of the bot response set.":::

1. Select the **User Input** page in the properties pane, then do the following:

    1. For **Property**, enter `conversation.day_choice`.

    1. For **Output format**, choose **index** to return the index of the selected option instead of a value.

        :::image type="content" source="media/advanced-bot-framework-composer-example2/E2_DailySpecials_input_variable.png" alt-text="Screenshot of user input set.":::

    1. For **List style**, choose **heroCard** to display our options list vertically.

    1. For **Array of choices**, change the type to **Write an expression**.

        :::image type="content" source="media/advanced-bot-framework-composer-example2/array-of-choices.png" alt-text="Screenshot of changing the type of the array of choices property.":::

    1. For **Array of choices**, enter `=conversation.days_array`.

        :::image type="content" source="media/advanced-bot-framework-composer-example2/E2_DailySpecials_array_multi_option.png" alt-text="Screenshot of the expression entered into the array of choices property.":::

## Display daily special

1. On the authoring canvas, select **Add** (**+**) then **Send a response**.

1. In the properties pane, under **Bot responses**, and select **Show code**. Copy and paste the following expression:

    ```lg
    - ${DailySpecials(conversation.day_choice)}
    ```

    :::image type="content" source="media/advanced-bot-framework-composer-example2/E2_DailySpecials_addResponse.png" alt-text="Screenshot of the daily specials response set.":::

1. In the bot explorer, go to the main dialog. Select **More options** (**...**) then select **Add new trigger**.

    :::image type="content" source="media/advanced-bot-framework-composer-example2/E2_main_addNewTrigger.png" alt-text="Screenshot of the add a new trigger menu item.":::

1. In the **Create a trigger** window, do the following:

    1. For **What is the type of this trigger?**, select **Intent recognized**.
    1. For **What is the name of this trigger?**, enter `Specials`.
    1. For **Trigger phrases**, copy and paste the following:

        ```lu
        -what specials do you have
        -any special deals
        -do you have discounts
        ```

        :::image type="content" source="media/advanced-bot-framework-composer-example2/E2_main_nameNewTrigger.png" alt-text="Screenshot of trigger phrases added to a new trigger.":::

    1. Select **Submit**.

1. In the bot explorer, select the **Specials** trigger.

1. On the authoring canvas, select **Add** (**+**), **Dialog management**, then **Begin a new dialog or topic**.

1. In the properties pane, for **Dialog name**, select **DailySpecials**

    :::image type="content" source="media/advanced-bot-framework-composer-example2/E2_main_callDialog.png" alt-text="Screenshot of the begin a new dialog action.":::

## Test your bot

1. [Publish your Composer content](advanced-bot-framework-composer-fundamentals.md#test-composer-content-within-microsoft-copilot-studio) to make it available in your Microsoft Copilot Studio bot.

    [!INCLUDE [Publish Composer](includes/composer-publish-note.md)]

1. Go to the Microsoft Copilot Studio **Topics** page to see your new **Specials** and **DailySpecials** topics.

    :::image type="content" source="media/advanced-bot-framework-composer-example2/E2_DailySpecials_inPVA.png" alt-text="Screenshot of the topics added in Composer in the list of topics on Microsoft Copilot Studio.":::

1. Open the **Test bot pane** and make sure **Track between topics** is turned on. Enter the message `Do you have any specials?` to start your conversation.

    :::image type="content" source="media/advanced-bot-framework-composer-example2/Example2._cropped.png" alt-text="Screenshot of the Microsoft Copilot Studio test bot pane.":::

## Next Steps

[Example 3 - Use Bing Search as a fallback in Microsoft Copilot Studio](advanced-bot-framework-composer-example3.md).

[!INCLUDE[footer-include](includes/footer-banner.md)]
