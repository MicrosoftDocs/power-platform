---
title: "Hand-off to any generic engagement hub"
description: "Guidance to handoff a bot conversation to any generic engagement hub"
keywords: "human handoff, generic handoff, generic engagement hub support"
ms.date: 3/9/2020
ms.service:
  - dynamics-365-ai
ms.topic: article
author: pawant
ms.author: iawilt
manager: shellyha
ms.custom: handoff
ms.collection: virtual-agent
---

# Configure hand-off to any generic engagement hub

Power Virtual Agents enables handing off bot conversations seamlessly and contextually. With some custom development, you can configure your bot to hand-off conversations to any engagement hub. This guide illustrates approaches you can take to trigger hand-off to any engagement hub.

## Pre-requisites
* Build a bot using Power Virtual Agents
* An engagement hub capable of interacting programmatically using APIs and/or SDK

>[!Note]
> Audience - This document is intended for IT admins and Developers looking to integrate 3rd party engagement hubs with Power Virtual Agents. 

## Overview

  ![ILLUSTRATION SHOWING GENERIC ADAPTER DATAFLOW](media/generic-adapter-illustration.png)

1. End-user interacts with engagement hub's chat canvas
1. Engagement hub routes the incoming chat via built-in chat routing capabilities to a bot
1. Custom adapter relays the incoming chat messages from Engagement Hub to Power Virtual Agent bot
1. Once end-users [triggers hand-off](https://github.com/MicrosoftDocs/power-platform-pr/blob/pawant-handoff/power-virtual-agents/advanced-hand-off.md#triggering-hand-off-to-a-live-agent), Power Virtual Agents initiates hand-off with full conversation context
1. Custom adapter intercepts hand-off message, parses full conversation context and seamlessly routes the escalated conversation to a skilled human agent based on availability
1. End user is seamlessly and contextually handed off to a human agent to can resume the conversation

## Build a custom hand-off adapter
An adapter bridges conversations to and from your agent engagement hub (see illustration above) by relaying and transforming messages between end-users, bots and human agents.  Most popular agent engagement hubs provide SDKs or document their APIs publically enabling you to build such adapters. 

While it is outside the scope of this document to cover all what a custom adapter would contain, we publish the standard hand-off message we generate and provide code snippets and samples to allow you to extract context from the prior bot conversation to seamlessly and contextually hand-off to any generic engagement hub.

### Sample hand-off message payload
Hand-off is currently only supported over DirectLine - [learn more about interacting with bot over DirectLine](https://docs.microsoft.com/en-us/power-virtual-agents/publication-connect-bot-to-azure-bot-service-channels#sample-code-example). Upon hand-off, an event activity called `handoff.initiate` is raised and sent to the adapter. 

Click here to see a [full sample hand-off message activity](https://github.com/microsoft/PowerVirtualAgentsSamples/blob/master/ConnectToEngagementHub/activities.json).

### Extract context from hand-off message
In order to use conversation context, you must parse the `handoff.initiate` event activity. The following snippet of code parses the above event activity and extract context. [Click here for the full code sample](https://github.com/microsoft/PowerVirtualAgentsSamples/tree/master/ConnectToEngagementHub).

```C#
        public void InitiateHandoff(string botresponseJson)
        {
            BotResponse response = JsonConvert.DeserializeObject<BotResponse>(botresponseJson);

            // Look for Handoff Initiate Activity. This indicates that conversation needs to be handed off to agent
            Activity handoffInitiateActivity = response.Activities.ToList().FirstOrDefault(
                item => string.Equals(item.Type, ActivityTypes.Event, System.StringComparison.Ordinal)
                && string.Equals(item.Name, HandoffInitiateActivityName, System.StringComparison.Ordinal));

            if (handoffInitiateActivity != null)
            {
                // Read transcript from attachment
                if (handoffInitiateActivity.Attachments?.Any() == true)
                {
                    Attachment transcriptAttachment = handoffInitiateActivity.Attachments.FirstOrDefault(a => string.Equals(a.Name.ToLowerInvariant(), TranscriptAttachmentName, System.StringComparison.Ordinal));
                    if (transcriptAttachment != null)
                    {
                        Transcript transcript = JsonConvert.DeserializeObject<Transcript>(transcriptAttachment.Content.ToString());
                    }
                }

                // Read handoff context
                HandoffContext context = JsonConvert.DeserializeObject<HandoffContext>(handoffInitiateActivity.Value.ToString());

                // Connect to Agent Hub
                // <YOUR CUSTOM ADAPTER CODE GOES HERE>
            }
        }
```
