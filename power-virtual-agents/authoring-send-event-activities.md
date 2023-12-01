---
title: "Sending event activities"
description: "Use nodes to send event activities."
keywords: "PVA"
ms.date: 04/05/2022
ms.service: power-virtual-agents
ms.topic: article
author: KendalBond007
ms.author: iawilt
ms.reviewer: clmori
ms.custom: authoring, ceX
ms.collection: virtual-agent
---

# Sending event activities

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Microsoft Copilot Studio provides two nodes that allow you to send non-message activities: Send an Event, and Send an Activity. These are discussed in the following sections.

:::image type="content" source="media/authoring-variables/authoring-send-activites-menu.png" alt-text="Screenshot of adding an Advanced node, including the Send an event and Send an activity options.":::

## Sending events

The Send an Event node is specifically designed for sending Event activities. Event activities are sent from the bot and can be intercepted and used by the channel, which decides if and how to use the activities. When you send an event, you give it a name and then you can set a value on the event. This value can be in any format: a primitive literal value, a variable reference or a Power Fx formula. The value gets serialized as JSON and added to the outgoing activity.

:::image type="content" source="media/authoring-variables/authoring-send-activites-settings.png" alt-text="Screenshot showing the settings menu for an Event activity node.":::

Uses of this node include:

- You can configure a custom web chat control to handles event sent from the bot. For example, you could look for an event coming back from the bot and take an action on the page. The `04.api/c.incoming-activity-event` sample in the [Microsoft Bot Framework Web Chat samples repository on GitHub](https://github.com/microsoft/BotFramework-WebChat/samples/04.api/c.incoming-activity-event) demonstrates how this could work.
- AudioCodes use event activities to let you control the service. For example, starting or stopping call recording. For additional information refer to [Recording calls](https://techdocs.audiocodes.com/voice-ai-connect/Content/VAIG_Combined/call-recording.htm).

## Sending other activity types

In addition to event activities, you can send activities of other types using the send activity node. Generally, the usage of this node is advanced – hence it being in the advanced subcategory. The types of activities you can send are a subset of the ones offered in the [Bot Framework Schema - ActivityTypes Class](/dotnet/api/microsoft.bot.schema.activitytypes). When using this node, you choose the type of the activity and then optionally set a name or value.

Common types are:

- **Typing** – this will send a typing activity, which the channel can choose to pick up and show a typing indicator on the client.
- **Delay** – this can be used to provide a delay between messages. For example: sending a message, then sending a delay activity, followed by another message. For the end user, they see the first message, followed by a pause, then the second message. In this case "Value" is set to the number of milliseconds delay. For details, see [ActivityTypes.Delay Field](/dotnet/api/microsoft.bot.schema.activitytypes).
- **Invoke/Invoke Response** – Generally these are used for Microsoft Teams. A user will create a topic with an Invoke tigger to intercept an incoming Invoke from Teams. The C1 will then use an Invoke Response activity to send an appropriate response back to Teams.
- **Handoff** – This allows a user to send a Handoff activity with explicit control over the value. This is used for some external channels, such as AudioCodes.

:::image type="content" source="media/authoring-variables/authoring-send-activites-invoke-activity.png" alt-text="Screenshot showing the Invoke activity node with the Type dropdown list.":::

## Related links

- [Reuse variables across topics](authoring-variables-bot.md)
- [Customize the look and feel of the bot](customize-default-canvas.md)
