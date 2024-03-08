---
title: Recommendations for providing meaningful feedback and guidance. 
description: Learn how to Provide meaningful feedback and guidance to ensure consistent success with user experience optimization.
author: RobStand
ms.author: rstand
ms.reviewer: robstand
ms.date: 03/29/2024
ms.subservice: guidance
ms.topic: conceptual
---

# Recommendations for feedback and guidance

**Applies to this Power Well-Architected Experience Optimization checklist recommendation:**

|[EO:07](checklist.md)| **Provide meaningful, useful, and simple guidance in notifications and messages.** Notify users with relevant, important, and valuable information. Give users feedback on their actions. Let users know when something happens and what they need to do next. |
|---|---|

This guide describes the recommendations for providng meaningful feedback and guidance to users of your workload. Feedback and guidance in a well-architected workload provide users with the information they need to perform actions and to effectively make decisions. Feedback and guidance that lack relevance, are hard to understand, or display at the wrong time for the user to properly react, will lead to a poor experience for users and will potentially result in lost productivity, higher support costs, and failed business processes.

## Key design strategies

When users perform an action, they should get prompt and understandable feedback from the system. Notifications and messages play a critical role in delivering important information to users promptly and contextually.

**Minimize noise and distraction.** Use notifications only when necessary to minimize noise and distraction. Overload of system messages reduces efficiency and causes frustration. Notifications break workflow and, therefore, lower efficiency and hinder productivity. Interruptions can take time from which to recover from and can lead to errors. Notifications can annoy people in other ways, such as being irrelevant, too creepy, or delivered via an inappropriate mechanism.

**Use a central location for notifications.** Notification centers are useful aggregators of message content. They’re the best place to provide quick access to what’s important so people can find out what’s going on at any point of time.

**Help people act quicker.** Notifications that don’t provide an immediate way to act on them are frustrating. Enabling actions on notifications saves people time. Additionally, people want to access and act on notifications across devices.

**Provide reassurance when there's an error.** If a part of the process fails, let people know what’s happening and why, reassuring them they haven’t lost any work. Inform them of what they need to do so they’re confident of how to proceed.

**Avoid presenting the same notification more than once.** Dismissing notifications in multiple apps, multiple UI surfaces, on different devices more than once is not acceptable. Categorized notifications don’t deliver value when not synced. Competing notification systems are evolving from device centric to user centric.

**Put critical messages first.** Match urgency with the appropriate design pattern and put critical messages first. Consider the type of notification you’re sending and its impact on the experience. Choose the right pattern for communication (e.g., don’t block people’s action for non-critical messages) and make sure that the most urgent or important messages bubble to the top.

**Create succinct messages.** Provide easy-to-read notifications that can be read briefly and be less interruptive. Quick updates keep people informed and don't impact productivity.

**Provide inline validation.** Wherever possible, use inline validation so people get feedback on their mistakes immediately.

**Empower people with robust settings.** Detailed notification settings allow people to set their own preferences. Empowering them to choose what notifications they get as well as what features are used drives satisfaction and trust.

## Power Platform facilitation

Power Platform details here...

## Related links

Related links here.

## Experience Optimization checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Experience Optimization checklist](checklist.md)