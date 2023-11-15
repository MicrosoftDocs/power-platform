---
title: Overview of IVR copilot
description: Overview of IVR copilot
ms.reviewer: clmori
ms.date: 10/24/2023

ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.collection: power-virtual-agents
ms.service: virtual-agent
---


# Overview of IVR copilot

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

An IVR Copilot is a copilot that is intended be connected to your IVR. It will provide customers calling into your IVR with generative AI-based self-help support content, which can be based on content from your company website, uploaded files, or your knowledge base sources. This copilot can be embedded in your existing Customer Engagement Hub so your agents don't have to lear a new tool in order to use the generative answers capabilities from copilot.

Leveraging your existing content from external and internal data sources, your customer support agents can quickly get the answers your customers need.

## Phone number acquisition
To take calls from your customers, you must first acquite a phone number to connect your customers to the IVR copilot. See [Phone number acquisition](ivr-copilot-phone-acquisition.md) for more information.

## Fallback hand-off to existing IVR
Once you have your inbound phone number configured, you can confire the phone number to where your customers will be handed off in case copilot cannot find a content suitable to answer their question. You can configure that in " Copilot details" -> "Fallback".

## Call transfer scenarios
You can configure additional call transfer scenarios that you rather have your existing IVR take care of instead of copilot. To do that, add a new call trasnfer scenario to the copilot by going to "Copilot details" -> "Call transfer scenarios"  and adding a new entry. You can add trigger phrases which will send your callers directly to the phone number configured instead of trying to find an answer from your data sources.

## Configuring Websites as data source
To configure websites as data source, please see [manage websites](data-management-websites.md).

## Configuring Offline files as data source
To configure offline files as data source, please see [offline files](data-management-offline-files.md).

## Configuring knowledge bases as data source
To configure a knowledge base (KB) as a data source for your customer copilot, please refer to one of the providers below:
- Dynamics 365
- [ServiceNow](servicenow/sc-servicenow-kb.md)
- [Salesforce](salesforce/sc-salesforce-kb.md)
- [Zen Desk](zendesk/sc-zendesk-mb.md)

## Configuring Copilot behavior
[!INCLUDE[customization-include](include-copilot-base-customization.md)]

### Fallback number
The call center or IVR number that the copilot transfers to when unable to respond to the user.

### Transfer message
What the copilot says when passing the conversation to this specific number.
