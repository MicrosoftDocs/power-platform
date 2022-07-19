---
#FIXME: meta data
title: "Return a set of results"
description: ""
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

# Return a set of results

It's common to ask a bot to look for data in an external system and return a set of results to the user. To do that, Power Virtual Agents can call a Power Automate flow to:

- authenticate and connect to an external solution
- run a query based on the user's inputs
- format the results
- return results to Power Virtual Agents

In this article, we'll use the Dataverse connector in Power Automate to search for accounts. Then we'll return a list that includes the account name, city, and account number using Markdown to format the results as a table.

> [!IMPORTANT]
> Markdown may not render properly on all channels and clients. Additionally, if you have enabled [voice capabilities](configuration-hand-off-omnichannel.md), having the bot read the table may not be ideal for voice-based channels.

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]
- [Create and edit topics](authoring-create-edit-topics.md).
- [Create a flow](advanced-flow.md).
- [Add input and output variables](advanced-flow-input-output.md).
- [Learn Markdown syntax](https://www.markdownguide.org/).

## Create a new bot and topic

1. Create a new bot named `Account Search Bot`.

1. Create a new topic called `Account Search`.

1. Add the following trigger phrases:
   - `I'm looking for a customer`
   - `I'm looking for an account`
   - `search account`
   - `search customer`

1. Add a message node with the message `Sounds like you're looking for an account. I can look that up for you.`.

1. Add a question node that uses the **Organization** entity. Enter the message `What's the name of the customer you're looking for?`.

    :::image type="content" source="media/advanced-flow-set-of-results/bot-setup.png" alt-text="Screenshot of new topic with a message and question node on the canvas.":::

## Create a Power Automate flow

1. On the authoring canvas, select the plus (**+**) icon, **Call an action**, and **Create a flow**. The Power Automate portal will open in the new window.

1. In the Power Automate portal, name the flow `Search Account`.

1. Add a **Text** input named `Organization`.

    :::image type="content" source="media/advanced-flow-set-of-results/text-input.png" alt-text="Screenshot of the flow trigger with a text input added.":::

1. Select the plus (**+**) button below the trigger node to add a new node.

1. Under the **Microsoft Dataverse** connector, select the **Search rows** action.

    :::image type="content" source="media/advanced-flow-set-of-results/dataverse-connector.png" alt-text="Screenshot of the flow trigger with a text input added.":::

1. For **Search term**, select the **Organization** variable.

1. Select **Show advanced options** and configure as below:
    - **Table filter Item**: `account`
    - **Sort by Item - 1**: `@search.score desc`
    - **Sort by Item - 2**: `name asc`

    :::image type="content" source="media/advanced-flow-set-of-results/search-rows-action.png" alt-text="Graphical user interface, application Description automatically generated":::

## Format results using Markdown

At this point, the **Search rows** action returns the variable **List of rows** which contains an array in the JSON format. To make the data usable, it must be first converted using the **Parse JSON** action.

1. We provided a sample JSON output from a previous run of the "Search Rows" connector with the "Generate from sample" option.

<!-- FIXME: move snippet -->
```json
{
    "type": "array",
    "items": {
        "type": "object",
        "properties": {
            "@@search.score": {
                "type": "number"
            },
            "@@search.highlights": {
                "type": "object",
                "properties": {
                    "name": {
                        "type": "array",
                        "items": {
                            "type": "string"
                        }
                    }
                }
            },
            "@@search.entityname": {
                "type": "string"
            },
            "@@search.objectid": {
                "type": "string"
            },
            "@@search.objecttypecode": {
                "type": "integer"
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
            "@@search.highlights",
            "@@search.entityname",
            "@@search.objectid",
            "@@search.objecttypecode",
            "name",
            "address1_city",
            "accountnumber"
        ]
    }
}
```

:::image type="content" source="media/advanced-flow-set-of-results/image5.png" alt-text="Graphical user interface, text, application Description automatically generated":::

To return the results to Power Virtual Agents in a nicely formatted table, we use the Variable connector and this time choose the "Initialize variable" action. We name the variable "Accounts", set its type to String (at it only contains text), and initialize it with a default value containing our [table headers in Markdown format](https://www.markdownguide.org/extended-syntax/#tables). If you use Markdown, don't forget line breaks so that individually appended display correctly.

:::image type="content" source="media/advanced-flow-set-of-results/image6.png" alt-text="Graphical user interface, text, application, email Description automatically generated":::

We add another action of the Variable connector called "Append to string variable". It is used here to add each search result as a new line in the variable table we initialized.

As soon as we add an attribute from the "Parse JSON" step, Power Automate understands it must perform an "Apply to Each" and wraps the "Appen to string variable" step in it.

:::image type="content" source="media/advanced-flow-set-of-results/image7.png" alt-text="Graphical user interface, application Description automatically generated":::

We add the row columns we need to return to the user in PVA, and use Markdown formatting so that it adds a line to the table (again, don't forget to add a line break at the end).

In the last step, we use the Power Virtual Agents connector and the "Return value(s) to Power Virtual Agents" action. We add a text input called "Accounts" to return the Accounts variable containing the formatted table.

:::image type="content" source="media/advanced-flow-set-of-results/image8.png" alt-text="Graphical user interface, application Description automatically generated":::

## Calling the flow from Power Virtual Agents

In the Account Search topic, we add a "Call an action" node, and select the Power Automate cloud flows that has been created. Power Virtual Agents recognizes the inputs and outputs. We map the Organization variable to the Organization input.

As a next node in the topic, we show a message back to the user displaying the returned output of Power Automate.

:::image type="content" source="media/advanced-flow-set-of-results/image9.png" alt-text="Graphical user interface, application Description automatically generated":::

When, when a user asks "I'm looking for an account, fabrikam", the "Search Account" topic is automatically identified, and the Organization entity is [automatically recognized and filled](advanced-entities-slot-filling.md) without further questions.

:::image type="content" source="media/advanced-flow-set-of-results/image10.png" alt-text="Graphical user interface, text, application Description automatically generated":::

Power Automate tracks the history of executions and their success/failures.

:::image type="content" source="media/advanced-flow-set-of-results/image11.png" alt-text="Graphical user interface, application Description automatically generated":::

[!INCLUDE[footer-include](includes/footer-banner.md)]
