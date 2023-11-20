---
title: Return a list of results
description: Return a list of results from a Power Automate flow to a Microsoft Copilot Studio bot.
keywords: "PVA, flow, automate"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.reviewer: peterswimm
ms.custom: flow, ceX, advanced-authoring
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Return a list of results

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

It's common to ask a bot to look for data in an external system and return a list of results. To do that, Microsoft Copilot Studio can call a Power Automate flow to:

- authenticate and connect to an external solution
- run a query based on the user's inputs
- format the results
- return the results to the bot

In this example, you'll use the Dataverse connector in Power Automate to search for accounts. Then you'll return a list of results that includes the account name, city, and account number to Microsoft Copilot Studio.

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).
- Understand how to [create a flow](advanced-flow-create.md) from the Microsoft Copilot Studio authoring canvas.
- [Add input and output variables](advanced-flow-input-output.md).
- [Configure Dataverse search for your environment](/power-platform/admin/configure-relevance-search-organization).

## Set up a Dataverse Account table

The Account table is a [standard table](/power-apps/maker/data-platform/types-of-entities) that's included automatically in Power Platform environments. However, it doesn't come with account data. Before your bot can search for accounts, you'll need to populate the Account table.

If you already have an Account table with data, skip this step and move on to [Create a topic](#create-a-topic). However, you'll need to use different search terms when you test your bot in later steps.

1. Go to the [Power Apps portal](https://make.powerapps.com/).

1. In the side pane, under **Dataverse**, select **Tables**.

1. Select the **Account** table, and then on the table properties page, select **Edit**.

1. Add the following rows to the table:

    | Address 1: City | Account Name          | Account Number |
    | --------------- | --------------------- | -------------- |
    | Seattle         | Contoso Inc           | AC0125         |
    | San Francisco   | Contoso Residences    | AC0255         |
    | Olympia         | Contoso Meal Delivery | AC0035         |

## Create a topic

1. Go to the [**Topics page**](authoring-create-edit-topics.md) for your bot.

1. Create a topic called **Account Search**.

1. Add the following trigger phrases:
   - I'm looking for a customer
   - I'm looking for an account
   - search account
   - search customer

1. Add a **Message** node and enter the message **Sounds like you're looking for an account. I can look that up for you.**.

1. Add a **Question** node and enter the message **What's the name of the customer you're looking for?**.

1. For **Identify**, select **Organization**.

    **User's entire response** will also work. However, selecting the **Organization** entity takes advantage of the bot's language understanding capabilities to extract the organization name from the response.

    :::image type="content" source="media/advanced-flow-set-of-results/bot-setup.png" alt-text="Screenshot of a new topic with a message and question node.":::

1. For **Save response as**, rename the variable to **organization**.

## Create a flow

1. On the authoring canvas, select **Add node** (**+**). Select **Call an action**, and then select **Create a flow**.

1. In the Power Automate portal, name the flow **Search Account**.

1. Add a **Text** input named **Organization**.

    :::image type="content" source="media/advanced-flow-set-of-results/text-input.png" alt-text="Screenshot of the flow trigger with a text input added.":::

1. Select **Insert a new step** (**+**) and select **Add an action**.

1. Select the **Microsoft Dataverse** connector, and then select the **Search rows** action.

    This action uses fuzzy matching to find relevant accounts in your [Dataverse Account table](/power-apps/maker/data-platform/entity-overview).

    :::image type="content" source="media/advanced-flow-set-of-results/dataverse-connector.png" alt-text="Screenshot of the Dataverse connector Search rows action.":::

1. For **Search term**, select the **Organization** variable.

1. Select **Show advanced options** and set the following items as given:
    - **Table filter Item**: `account`
    - **Sort by Item - 1**: `@search.score desc`
    - **Sort by Item - 2**: `name asc`

    :::image type="content" source="media/advanced-flow-set-of-results/search-rows-action.png" alt-text="Screenshot of Search rows actions with advanced options configured.":::

## Format results

The **Search rows** action returns the **List of rows** variable, which contains JSON data. Before you can use the data, you'll need to analyze it with the **Parse JSON** action.

1. Select **Insert a new step** (**+**) and select **Add an action**.

1. Select the **Data Operation** connector, and then select the **Parse JSON** action.

1. In the **Content** box, under **Search rows**, select the **List of rows** variable.

1. Copy the following JSON schema and paste it in the **Schema** box:

    ```json
    {
        "type": "array",
        "items": {
            "type": "object",
            "properties": {
                "@@search.score": {
                    "type": "number"
                },
                "name": {
                    "type": "string"
                },
                "address1_city": {
                    "type": "string"
                },
                "accountnumber": {
                    "type": "string"
                }
            },
            "required": [
                "name"
            ]
        }
    }
    ```

    :::image type="content" source="media/advanced-flow-set-of-results/json-schema.png" alt-text="Screenshot of JSON schema entered in the Parse JSON node.":::

1. Select **Insert a new step** (**+**) and select **Add an action**. Select the **Variable** connector, and then select the **Initialize Variable** action.

1. For **Name**, enter **ListOfAccounts**. For **Type**, select **String**.

    :::image type="content" source="media/advanced-flow-set-of-results/init-variable.png" alt-text="Screenshot of the Initialize variable action.":::

1. Select **Insert a new step** (**+**) and select **Add an action**. Select the **Control** connector, and then select the **Apply to each** action.

1. Select the **Select an output from previous steps** box to open the **Dynamic content** menu. Search for **body**, and then under **Parse JSON**, select the **Body** variable.

1. Select **Insert a new step** (**+**) and select **Add an action**. Select the **Variable** connector, and then select the **Append to string variable** action.

1. For **Name**, select **ListOfAccounts**. Copy the following text and paste it in the **Value** box:

   ```powerappsfl
   - @{items('Apply_to_each')['accountnumber']}: @{items('Apply_to_each')['name']} - @{items('Apply_to_each')['address1_city']}
   ```

1. Add a line break after the snippet to make each result appear on its own line.

    :::image type="content" source="media/advanced-flow-set-of-results/apply-to-each.png" alt-text="Screenshot of the Apply to each action.":::

1. In the **Return value(s) to Microsoft Copilot Studio** action, add a **Text** output. For **Name**, enter **FoundAccounts**. For **Value**, select **ListOfAccounts**.

    :::image type="content" source="media/advanced-flow-set-of-results/return-to-pva-action.png" alt-text="Screenshot of the Return values(s) to Microsoft Copilot Studio action.":::

1. Select **Save**.

## Call the flow from Microsoft Copilot Studio

1. On the Microsoft Copilot Studio authoring canvas, select **Add node** (**+**), and then select **Call an action**.

1. Select the flow you created earlier, **Search Account**.

1. For **Organization gets value from**, select the **organization** variable.

1. Add a **Message** node and enter the message **Okay, this is what I found.**

1. Add a second **Message** node. Select **Insert variable**, and then select **FoundAccounts**.

    :::image type="content" source="media/advanced-flow-set-of-results/show-found-accounts.png" alt-text="Screenshot of a conversation with a bot that has responded with a list of found accounts.":::

1. Select **Save**.

1. Test your bot in the **Test bot** pane.

    :::image type="content" source="media/advanced-flow-set-of-results/test-chat.png" alt-text="Screenshot of the bot conversation in the Test bot pane.":::

[!INCLUDE[footer-include](includes/footer-banner.md)]
