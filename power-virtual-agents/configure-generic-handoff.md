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
> Audience - Developer, no 

## Overview

[Illustration goes here]

1. Customer triggers explicit or implicit hand-off while interacting with bot
1. Power Virtual Agents bot triggers hand-off with full conversation context
1. A custom built adapter intercepts hand-off message and resumes conversation with a human agent

## Build a custom hand-off adapter
An adapter bridges conversations to and from your agent engagement hub by relaying and transforming messages between bots and agents.  Most popular agent engagement hubs provide SDKs or document their APIs to build custom adapters for integrations with 3rd party systems, like bots. 

While it is outside the scope of this document to cover all what a custom adapter would contain, we publish our standard hand-off message and provide code snippets to allow you to extract context from the prior bot conversation to seamlessly and contextually hand-off to any generic engagement hub.

### Sample hand-off message payload
Hand-off is currently only supported over DirectLine - [learn more about interacting with bot over DirectLine](https://docs.microsoft.com/en-us/power-virtual-agents/publication-connect-bot-to-azure-bot-service-channels#sample-code-example). Upon hand-off, an event activity called `handoff.initiate` is raised and sent to the adapter.

```json
{
  "activities": [
    {
      "type": "event",
      "id": "91hcXEd0ZYCBPoRwBDPHZ6-o|0000005",
      "timestamp": "2020-02-10T21:51:37.4997264Z",
      "channelId": "directline",
      "from": {
        "id": "f074b91b-2f8c-4543-bbcc-7226e9662c01",
        "name": "Test501",
        "role": "bot"
      },
      "conversation": {
        "id": "91hcXEd0ZYCBPoRwBDPHZ6-o"
      },
      "attachments": [
        {
          "contentType": "application/json",
          "content": {
            "activities": [
              {
                "type": "message",
                "id": "91hcXEd0ZYCBPoRwBDPHZ6-o|0000000",
                "timestamp": "2020-02-10T21:51:21.491453+00:00",
                "serviceUrl": "https://directline.botframework.com/",
                "channelId": "directline",
                "from": {
                  "id": "pva_H1YHD_be80720b-bdb0-4561-aae2-5f891f2f02e0",
                  "name": "C2 User",
                  "role": "user"
                },
                "conversation": {
                  "id": "91hcXEd0ZYCBPoRwBDPHZ6-o"
                },
                "recipient": {
                  "id": "<REDACTED>",
                  "name": "Contoso Bot",
                  "role": "bot"
                },
                "textFormat": "plain",
                "locale": "en-US",
                "text": "store hours",
                "entities": [
                  {
                    "type": "ClientCapabilities",
                    "requiresBotState": true,
                    "supportsListening": true,
                    "supportsTts": true
                  }
                ],
                "channelData": {
                  "clientActivityID": "15813714814300.gevfmx9xoxc",
                  "cci_bot_id": "<REDACTED>",
                  "cci_tenant_id": "<REDACTED>",
                  "cci_content_version": "e8aa9c88-4249-ea11-a812-000d3a1531ec",
                  "cci_trace_id": "1xc8K",
                  "traceHistory": null,
                  "enableDiagnostics": true
                },
                "cci_bot_id": "<REDACTED>",
                "cci_tenant_id": "<REDACTED>",
                "cci_content_version": "e8aa9c88-4249-ea11-a812-000d3a1531ec"
              },
              {
                "type": "message",
                "id": "91hcXEd0ZYCBPoRwBDPHZ6-o|0000001",
                "timestamp": "2020-02-10T21:51:30.6362632+00:00",
                "serviceUrl": "https://directline.botframework.com/",
                "channelId": "directline",
                "from": {
                  "id": "<REDACTED>",
                  "name": "Contoso Bot",
                  "role": "bot"
                },
                "conversation": {
                  "id": "91hcXEd0ZYCBPoRwBDPHZ6-o"
                },
                "recipient": {
                  "id": "pva_H1YHD_be80720b-bdb0-4561-aae2-5f891f2f02e0",
                  "name": "C2 User",
                  "role": "user"
                },
                "textFormat": "markdown",
                "text": "I'm happy to help with store hours.",
                "inputHint": "acceptingInput",
                "attachments": [],
                "entities": [],
                "channelData": {
                  "DialogTraceDetail": {
                    "DialogTraces": [
                      {
                        "DialogId": "caf0a29a-bad7-40e0-9941-11925e17614b",
                        "NodeId": "e901982c-a22d-4074-b8c7-f7842977a047"
                      }
                    ]
                  },
                  "ConversationUnderstandingDetail": {
                    "NormalizedQuery": "store hour",
                    "RawQuery": "store hours",
                    "ClarificationDetail": {
                      "ConfirmQuestion": false
                    },
                    "RankedIntents": [
                      {
                        "IntentId": "33d51237-70ba-4dae-afae-51b361ddc80a",
                        "Score": 1.0,
                        "MatchedTriggerQuery": "Store hours"
                      }
                    ]
                  },
                  "VariableDetail": {
                    "Variables": {}
                  },
                  "CurrentMessageDetail": {
                    "TraceId": "1xc8K",
                    "ConversationId": "91hcXEd0ZYCBPoRwBDPHZ6-o",
                    "CurrentProblemId": "3858486c-f1d7-415a-8678-979f725c601b",
                    "CurrentIntentId": "33d51237-70ba-4dae-afae-51b361ddc80a",
                    "ContentVersion": "e8aa9c88-4249-ea11-a812-000d3a1531ec",
                    "SentTime": "2020-02-10T21:51:30.6092929+00:00"
                  }
                },
                "replyToId": "91hcXEd0ZYCBPoRwBDPHZ6-o|0000000"
              },
              {
                "type": "message",
                "id": "91hcXEd0ZYCBPoRwBDPHZ6-o|0000002",
                "timestamp": "2020-02-10T21:51:30.680319+00:00",
                "serviceUrl": "https://directline.botframework.com/",
                "channelId": "directline",
                "from": {
                  "id": "<REDACTED>",
                  "name": "Contoso Bot",
                  "role": "bot"
                },
                "conversation": {
                  "id": "91hcXEd0ZYCBPoRwBDPHZ6-o"
                },
                "recipient": {
                  "id": "pva_H1YHD_be80720b-bdb0-4561-aae2-5f891f2f02e0",
                  "name": "C2 User",
                  "role": "user"
                },
                "textFormat": "markdown",
                "text": "The Redmond hours are:\n\n*   Mon-Fri: 9am to 6pm\n*   Sat: 10am to 4pm\n*   Sun: Closed\n\nThe Seattle hours are:\n\n*   Mon-Fri: 9am to 6pm\n*   Sat-Sun: 10am to 4pm",
                "inputHint": "acceptingInput",
                "attachments": [],
                "entities": [],
                "channelData": {
                  "DialogTraceDetail": {
                    "DialogTraces": [
                      {
                        "DialogId": "caf0a29a-bad7-40e0-9941-11925e17614b",
                        "NodeId": "e901982c-a22d-4074-b8c7-f7842977a047",
                        "Route": "##DEFAULT"
                      },
                      {
                        "DialogId": "caf0a29a-bad7-40e0-9941-11925e17614b",
                        "NodeId": "1f6c0946-4d56-4714-96f5-15e2247e953b"
                      }
                    ]
                  },
                  "VariableDetail": {
                    "Variables": {}
                  },
                  "CurrentMessageDetail": {
                    "TraceId": "1xc8K",
                    "ConversationId": "91hcXEd0ZYCBPoRwBDPHZ6-o",
                    "CurrentProblemId": "3858486c-f1d7-415a-8678-979f725c601b",
                    "CurrentIntentId": "33d51237-70ba-4dae-afae-51b361ddc80a",
                    "ContentVersion": "e8aa9c88-4249-ea11-a812-000d3a1531ec",
                    "SentTime": "2020-02-10T21:51:30.680319+00:00"
                  }
                },
                "replyToId": "91hcXEd0ZYCBPoRwBDPHZ6-o|0000000"
              }
            ]
          },
          "name": "Transcript"
        }
      ],
      "entities": [],
      "replyToId": "91hcXEd0ZYCBPoRwBDPHZ6-o|0000000",
      "value": {
        "va_Scope": "bot",
        "va_LastTopic": "Lesson 1 - A simple topic",
        "va_Topics": [
          "Lesson 1 - A simple topic"
        ],
        "va_LastPhrase": "store hours",
        "va_Phrases": [
          "store hours"
        ],
        "va_ConversationId": "91hcXEd0ZYCBPoRwBDPHZ6-o",
        "va_AgentMessage": "Transferred",
        "va_BotId": "<REDACTED>",
        "va_BotName": "Test501",
        "va_Language": "En-US"
      },
      "name": "handoff.initiate",
      "relatesTo": {
        "activityId": "91hcXEd0ZYCBPoRwBDPHZ6-o|0000000",
       "user": {
          "id": "pva_H1YHD_be80720b-bdb0-4561-aae2-5f891f2f02e0",
          "name": "C2 User",
          "role": "user"
        },
        "bot": {
          "id": "<REDACTED>",
          "name": "Contoso Bot",
          "role": "bot"
        },
        "conversation": {
          "id": "91hcXEd0ZYCBPoRwBDPHZ6-o"
        },
        "channelId": "directline",
        "serviceUrl": "https://directline.botframework.com/"
      }
    }
  ],
  "watermark": "5"
}
```

### Extract context from hand-off message
In order to leverage context, you must parse the `handoff.initiate` event activity. The following snippet of code parses the above event activity and extract context. [Click here for the full code sample](https://link to sample).

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
