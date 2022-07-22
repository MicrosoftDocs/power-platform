---
title: "Return a list of results"
description: "Return a list of results from a Power Automate flow to a Power Virtual Agents bot."
keywords: "PVA, flow, automate"
ms.date: 07/19/2022
ms.service: power-virtual-agents
ms.topic: article
author: v-alarioza
ms.author: v-alarioza
manager: shellyha
ms.reviewer: peterswimm
ms.custom: flow, ceX, advanced-authoring
ms.collection: virtual-agent
---

# Return a list of results

It's common to ask a bot to look for data in an external system and return a list of results to the user. To do that, Power Virtual Agents can call a Power Automate flow to:

- authenticate and connect to an external solution
- run a query based on the user's inputs
- format the results
- return results to Power Virtual Agents

In this article, we'll use the Dataverse connector in Power Automate to search for accounts. Then we'll return a list of results to Power Virtual Agents that includes the account name, city, and account number.

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]
- [Create a flow](advanced-flow-create.md).
- [Add input and output variables](advanced-flow-input-output.md).
- [Configure Dataverse search for your environment](/power-platform/admin/configure-relevance-search-organization)

## Setup Dataverse account table

The Account table is a [standard table](/power-apps/maker/data-platform/types-of-entities) automatically configured in Power Platform environments. However, it isn't prepopulated with account data. For your bot to be able to search for accounts, you must populate the Account table.

If you already have configured your Account table, skip this step and move on to [Create a new topic](#create-a-new-topic). However, you'll need to use different search terms when testing your bot in later steps.

1. Go to the [Power Apps portal](https://make.powerapps.com/).

1. In the side pane, under **Dataverse**, select **Tables**.

1. From the list select the **Account** table. Then on the table properties page, select **Edit**.

1. Add the following rows to the table:

    | Address 1: City | Account Name          | Account Number |
    | --------------- | --------------------- | -------------- |
    | Seattle         | Contoso Inc           | AC0125         |
    | San Francisco   | Contoso Residences    | AC0255         |
    | Olympia         | Contoso Meal Delivery | AC0035         |

## Create a new topic

1. Create a new topic called `Account Search`.

1. Add the following trigger phrases:
   - `I'm looking for a customer`
   - `I'm looking for an account`
   - `search account`
   - `search customer`

1. Add a **Message** node and enter the message `Sounds like you're looking for an account. I can look that up for you.`.

1. Add a **Question** node and enter the message `What's the name of the customer you're looking for?`. For **Identify**, choose **Organization**.

    You can also use the **User's entire response**, but choosing the **Organization** entity will leverage the bot's language understanding capabilities to extract the organization name.

    :::image type="content" source="media/advanced-flow-set-of-results/bot-setup.png" alt-text="Screenshot of new topic with a message and question node on the canvas.":::

## Create a Power Automate flow

1. On the authoring canvas, select the plus (**+**) icon. Choose **Call an action**, then select **Create a flow**. The Power Automate portal will open in the new window.

1. In the Power Automate portal, name the flow `Search Account`.

1. Add a **Text** input named `Organization`.

    :::image type="content" source="media/advanced-flow-set-of-results/text-input.png" alt-text="Screenshot of the flow trigger with a text input added.":::

1. Select **Insert a new step** (**+**) and choose **Add an action**. Then select the **Microsoft Dataverse** connector, then choose the **Search rows** action.

    This action will use fuzzy matching to find relevant accounts in your [Dataverse Account table](/power-apps/maker/data-platform/entity-overview).

    :::image type="content" source="media/advanced-flow-set-of-results/dataverse-connector.png" alt-text="Screenshot of the Dataverse connector's Search rows action.":::

1. For **Search term**, select the **Organization** variable.

1. Select **Show advanced options** and configure as below:
    - **Table filter Item**: `account`
    - **Sort by Item - 1**: `@search.score desc`
    - **Sort by Item - 2**: `name asc`

    :::image type="content" source="media/advanced-flow-set-of-results/search-rows-action.png" alt-text="Screenshot of Search rows actions with advanced options configured.":::

## Format results

The **Search rows** action returns the **List of rows**  variable which contains JSON data. To make the data usable, it must first be parsed using the **Parse JSON** action.

1. Select **Insert a new step** (**+**) and choose **Add an action**. Then select the **Data Operation** connector, then choose the **Parse JSON** action.

1. In the **Content** box, under **Search rows**, select the **List of rows** variable.

1. In the **Schema** box, copy and paste the following JSON schema:

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
                "@@search.score",
                "name",
                "address1_city",
                "accountnumber"
            ]
        }
    }
    ```

    :::image type="content" source="media/advanced-flow-set-of-results/json-schema.png" alt-text="Screenshot of JSON schema entered into the Parse JSON node.":::

1. Select **Insert a new step** (**+**) and choose **Add an action**. Then select the **Variable** connector, then choose the **Initialize Variable** action.

1. For **Name**, enter `ListOfAccounts`. For **Type**, select **String**.

    :::image type="content" source="media/advanced-flow-set-of-results/init-variable.png" alt-text="Screenshot of the Initialize variable action.":::

1. Select **Insert a new step** (**+**) and choose **Add an action**. Then select the **Control** connector, then choose the **Apply to each** action.

1. Select the **Select an output from previous steps** box to open the **Dynamic content** flyout menu. Search for `body`, then under **Parse JSON**, select the **Body** variable.

1. Select **Add an action**. Choose the **Variable** connector, then select the **Append to string variable** action.

1. For **Name**, select **ListOfAccounts**. For **Value**, copy and paste the following:

   ```powerappsfl
   - @{items('Apply_to_each')['accountnumber']}: @{items('Apply_to_each')['name']} - @{items('Apply_to_each')['address1_city']}
   ```

1. Add a line break after the snippet to make each result appear on its own line.

    :::image type="content" source="media/advanced-flow-set-of-results/apply-to-each.png" alt-text="Screenshot of the Apply to each action.":::

1. In the **Return value(s) to Power Virtual Agents** action, add a **Text** output. For **Name**, enter `FoundAccounts`. For **Value**, select **ListOfAccounts**.

    :::image type="content" source="media/advanced-flow-set-of-results/return-to-pva-action.png" alt-text="Screenshot of the Return values(s) to Power Virtual Agents action.":::

1. Select **Save** to save your flow.

## Call the flow from Power Virtual Agents

1. On the Power Virtual Agents authoring canvas, select the plus (**+**) icon then select **Call an action**. In the action picker, choose **Search Account**.

1. For **Organization gets value from**, select the **organization** variable.

1. Add a **Message** node and enter the message `Okay, this is what I found.`

1. Add a second **Message** node. Select **Insert variable** and choose **FoundAccounts**.

    :::image type="content" source="media/advanced-flow-set-of-results/show-found-accounts.png" alt-text="Screenshot of conversation with bot that has responded with a list of found accounts.":::

1. Select **Save** to save your topic.

1. Test your bot in the test bot pane.

    :::image type="content" source="media/advanced-flow-set-of-results/test-chat.png" alt-text="Screenshot of the bot conversation in the test bot pane.":::

[!INCLUDE[footer-include](includes/footer-banner.md)]
