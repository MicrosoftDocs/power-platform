---
title: "Key concepts - Authoring Microsoft Copilot Studio copilots"
description: "Discover how to create copilots and topics easily in Microsoft Copilot Studio with no coding or long deployment times."
keywords: "PVA"
ms.date: 05/22/2023
ms.topic: article
author: KendalBond007
ms.author: iawilt
manager: leeclontz
ms.custom: "authoring, fundamentals, ce06092020"
ms.service: power-virtual-agents

---

# Key concepts - Authoring Microsoft Copilot Studio copilots

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

When you create copilots with Copilot Studio, you author and edit topics. Topics are specific conversation paths in a copilot that allow the user and copilot conversation to feel natural and flow appropriately.

Creating a copilot with Copilot Studio is easy to do with the [no-code authoring canvas](authoring-create-edit-topics.md). There are many ways you can [manage how topics interact](authoring-topic-management.md) and how you want the conversation to flow. You determine what a conversation should feel like.

You can [test the copilot](authoring-test-bot.md) without having to fully deploy it whenever you make a small change.

Use the [lesson topics](authoring-template-topics.md) to guide you through topic authoring—from simple to complex scenarios, including default [system topics](authoring-system-topics.md).

You can also [choose a language for your copilot](authoring-language-support.md) to best fit your needs.

## Prerequisites

[Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).

## Accessibility

The copilot authoring canvas is built for accessibility in accordance with [Microsoft Accessibility Guidelines](https://www.microsoft.com/accessibility/) and supports standard navigational patterns. For complex scenarios, users who author content with keyboard navigation can use routing anchors.

### Routing anchors

Press `Enter` or `Space` on a route anchor to go into editing mode for that route. Once in the editing mode, you can `Tab` to other node anchors.

With an anchor selected, you can:

- Press `Delete` to delete the route. The target node becomes an orphaned node if this route is the only route leading to that node.
- Press `Escape` to come out of `Tab` mode and resume normal tabbing.
- Press `Enter` or `Space` on another node to reconnect the route to the new node. This node has the same source node, but a new target node.
- Press `Tab` to go to the next available location to drop this route.

At any time, pressing these hotkeys on a route anchor reads out the properties of the route:

- `Alt + Shift + A` reads out the source node.
- `Alt + Shift + B` reads out the target node.

> [!NOTE]
> If you're using a screen reader, the **Settings** navigation menu might not get read as "Collapsed", but it's an expandable control which can be selected and expanded. This is a known issue with our menu control, which will be fixed at a future date.

## In this section

| Topic | Description |
| ----- | ----------- |
| [Create your first copilot](authoring-first-bot.md) | Create your first copilot in less than 30 minutes. |
| [Use lesson topics](authoring-template-topics.md) | Use a series of prebuilt topics that guide you through authoring topics—from simple to advanced. |
| [Create and edit topics](authoring-create-edit-topics.md) | Create and edit topics using the no-code authoring canvas. |
| [Use a system fallback topic](authoring-system-fallback-topic.md) | Use a system fallback topic when your copilot can't find an answer. |
| [Manage topics](authoring-topic-management.md) | Copy, edit, and manage which topics are available in your copilot. |
| [Test your copilot](authoring-test-bot.md) | Test your copilot directly within the Copilot Studio portal without needing to deploy or publish it. |
| [Supported languages](authoring-language-support.md) | Choose a language when you create your copilot. Languages affect the user interface, system, and template topic localization. |

[!INCLUDE[footer-include](includes/footer-banner.md)]
