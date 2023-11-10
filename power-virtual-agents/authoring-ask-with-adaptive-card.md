---
title: Interactive Adaptive Cards (preview)
description: Use the interactive Adaptive Cards node to collect information from a user and store the response in one or more variables in Microsoft Copilot Studio preview.
keywords: "PVA"
ms.date: 04/11/2023

ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.reviewer: gapretty
manager: leeclontz
ms.custom: authoring, topics, message, question, bap-template
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Ask with Adaptive Cards (preview)

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

[Adaptive Cards](https://adaptivecards.io) enable you to add snippets of content to Microsoft Copilot Studio bots that can also be openly exchanged with other cloud apps and services. Formatted using JSON code, bot builders can include text, graphics, and buttons to provide rich conversation capability for your bot. Because they are platform-agnostic, you can easily tailor Adaptive Cards to your needs. 

You design Adaptive Cards using the [Adaptive Cards Designer](https://adaptivecards.io/designer/) or author directly using JSON code. The **Adaptive Card** node allows you send an Adaptive Card that contains one or more submit buttons, and optionally one or more form input fields. Microsoft Copilot Studio then stores user responses in variables for use later in the conversation.

The node allows you to provide the JSON for the card you want to send to the user or provide a [Power Fx formula](advanced-power-fx.md) to represent the card, allowing you to include dynamic information on the card. [Additional properties](#additional-properties) on the node allow you to control behavior, such as what to do when the user enters an invalid response and if the node is able to be interrupted.

The **Adaptive Card** node is used for interactive cards, where the user is expected to submit a response. **Message** and **Question** nodes can be used to present the user with a non-interactive card to display information to the user.

## Prerequisites

- [Create and edit topics](authoring-create-edit-topics.md)

## Add an Adaptive Card node

1. Select **Add node** (**+**), then select **Ask with Adaptive Card**.

1. Select the card icon, which expands the properties pane for the node. Or, select the _Node Menu_ (**&vellip;**), then select **Properties**. 

     :::image type="content" source="media/authoring-interactive-adaptive-cards/node.png" alt-text="Screenshot of a new Adaptive Card node":::

1. In the **Edit JSON** section, enter the JSON for your card.

    To open a larger view of the JSON editor, select the **Expand** icon.

    :::image type="content" source="media/authoring-interactive-adaptive-cards/edit-json.png" alt-text="Screenshot of the JSON editor for the Adaptive Card node, with the Expand icon highlighted.":::

> [!TIP]
> Your card must contain at least one submit button, as it must be an interactive card that allows a user to submit information back to the bot. If it does not and is only intended to show information to the bot user, you should add your card as an attachment to a **Message** node.

1. Once you have added the JSON code for your card to the editor, click outside of the editor and the node is updated with a preview of your card, as shown below. Microsoft Copilot Studio automatically creates output variables based on the inputs detected within the card.

    :::image type="content" source="media/authoring-interactive-adaptive-cards/card-preview.png" alt-text="Screenshot of the Adaptive Card node, with a preview of a card.":::

    > [!TIP]
    > In the event that the output variables generated for your card are incorrect, you can manually update the list of variables and their types by selecting the **Edit Schema** button underneath the JSON editor in the property pane. The example below defines four string (Text) variables.

    :::image type="content" source="media/authoring-interactive-adaptive-cards/schema-editor.png" alt-text="Screenshot of the Adaptive Card node schema editor.":::

1. Your interactive Adaptive Card is now ready. When a user of your bot submits the card using one of the buttons, the output variables are populated with their responses. 

## Additional properties

Additional properties allow you to control the behavior of the **Adaptive Card** node, such as how the bot responds to an invalid response or if it can be interrupted.

If the bot is currently awaiting a submission from an Adaptive Card and the user sends a text message, instead of submitting the card this is considered to be an invalid response, providing the message does not trigger an interruption. In this case, the following properties determine the behavior.

- **How many reprompts**: The number of times your bot tries to get a valid submission from the card. **Repeat up to 2 times** is the default. You can also select **Repeat once** or **Don't repeat**. For each retry the card is resent to the user.

- **Retry prompt**: Use this property to define a message to be sent when a retry occurs, along with a repeat of the card. To define a retry message, select **Customize**, then enter the new prompt.

- **Allow switching to another topic**: If checked (default), an incoming message from a user when the bot is awaiting a card submission triggers an interruption and switch to another topic. If this occurs, once the interrupting topic has completed, the card is then resent to the user.

## Use Power Fx to make your card dynamic

You can use Power Fx to include dynamic information on your card by referencing one or more variables from your topic or bot within the card.

1. Select the card icon, which expands the properties pane for the node. Or, select the _Node Menu_ (**&vellip;**), and then select **Properties**. 

1. Select the **Edit JSON** button, then choose **Formula**. This automatically converts any card that JSON has already presented into Power Fx.

  :::image type="content" source="media/authoring-interactive-adaptive-cards/switch-to-formula.png" alt-text="Screenshot of the option to switch to formula instead of JSON on the Adaptive Card node JSON editor.":::

## JSON example 

Below is a JSON example of a card and the resulting Power Fx, where two variables **Topic.Title** and **Topic.Subtitle** are used instead of a hard-coded text.

  ```json
    {
      "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
      "type": "AdaptiveCard",
      "version": "1.5",
      "body": [
          {
              "type": "ColumnSet",
              "columns": [
                  {
                      "type": "Column",
                      "width": 2,
                      "items": [
                          {
                              "type": "TextBlock",
                              "text": "Tell us about yourself",
                              "weight": "Bolder",
                              "size": "Medium",
                              "wrap": true,
                              "style": "heading"
                          },
                          {
                              "type": "TextBlock",
                              "text": "We just need a few more details to get you booked for the trip of a lifetime!",
                              "isSubtle": true,
                              "wrap": true
                          },
                          {
                              "type": "Input.Text",
                              "id": "myName",
                              "label": "Your name (Last, First)",
                              "isRequired": true,
                              "regex": "^[A-Z][a-z]+, [A-Z][a-z]+$",
                              "errorMessage": "Please enter your name in the specified format"
                          }
                      ]
                  }
              ]
          }
      ],
      "actions": [
          {
              "type": "Action.Submit",
              "title": "Submit"
          }
      ]
  }  
  ```

  **Power Fx**

  ```
    {
    '$schema': "http://adaptivecards.io/schemas/adaptive-card.json",
    type: "AdaptiveCard",
    version: "1.5",
    body: [
      {
        type: "ColumnSet",
        columns: [
          {
            type: "Column",
            width: "2",
            items: [
              {
                type: "TextBlock",
                text: Topic.Title
                weight: "Bolder",
                size: "Medium",
                wrap: true,
                style: "heading"
              },
              {
                type: "TextBlock",
                text: Topic.Subtitle,
                isSubtle: true,
                wrap: true
              },
              {
                type: "Input.Text",
                id: "myName",
                label: "Your name (Last, First)",
                isRequired: true,
                regex: "^[A-Z][a-z]+, [A-Z][a-z]+$",
                errorMessage: "Please enter your name in the specified format"
              }
            ]
          }
        ]
      }
    ],
    actions: [
      {
        type: "Action.Submit",
        title: "Submit"
      }
    ]
  }  
  ```
