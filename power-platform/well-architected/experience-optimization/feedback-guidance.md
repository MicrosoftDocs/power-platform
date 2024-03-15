---
title: Recommendations for providing meaningful feedback and guidance. 
description: Learn how to Provide meaningful feedback and guidance to ensure consistent success with user experience optimization.
author: RobStand
ms.author: rstand
ms.reviewer: robstand
ms.date: 03/13/2024
ms.subservice: guidance
ms.topic: conceptual
---

# Recommendations for feedback and guidance

**Applies to this Power Well-Architected Experience Optimization checklist recommendation:**

|[XO:05](checklist.md)| **Provide meaningful, useful, and simple guidance in notifications and messages. Notify users with relevant, important, and valuable information. Give users feedback on their actions. Let users know when something happens and what they need to do next.** |
|---|---|

This guide describes the recommendations for providng meaningful feedback and guidance to users of your workload. Feedback and guidance in a well-architected workload provide users with the information they need to perform actions and to effectively make decisions. Feedback and guidance that lack relevance, are hard to understand, or display at the wrong time for the user to properly react, will lead to a poor experience for users and will potentially result in lost productivity, higher support costs, and failed business processes.

## Key design strategies

When users perform an action, they should get prompt and understandable feedback from the system. Notifications and messages play a critical role in delivering important information to users promptly and contextually.

### Feedback notifications

**Minimize noise and distraction.** Use notifications only when necessary to minimize noise and distraction. Overload of system messages reduces efficiency and causes frustration. Notifications break workflow and, therefore, lower efficiency and hinder productivity. Interruptions can take time from which to recover from and can lead to errors. Notifications can annoy people in other ways, such as being irrelevant, too creepy, or delivered via an inappropriate mechanism.

**Use a central location for notifications.** Notification centers are useful aggregators of message content. They’re the best place to provide quick access to what’s important so people can find out what’s going on at any point of time.

**Help people act quicker.** Notifications that don’t provide an immediate way to act on them are frustrating. Enabling actions on notifications saves people time. Additionally, people want to access and act on notifications across devices.

**Provide reassurance when there's an error.** If a part of the process fails, let people know what’s happening and why, reassuring them they haven’t lost any work. Inform them of what they need to do so they’re confident of how to proceed.

**Avoid presenting the same notification more than once.** Dismissing notifications in multiple apps, multiple UI surfaces, on different devices more than once is not acceptable. Categorized notifications don’t deliver value when not synced. Competing notification systems are evolving from device centric to user centric.

**Put critical messages first.** Match urgency with the appropriate design pattern and put critical messages first. Consider the type of notification you’re sending and its impact on the experience. Choose the right pattern for communication (e.g., don’t block people’s action for non-critical messages) and make sure that the most urgent or important messages bubble to the top.

**Create succinct messages.** Provide easy-to-read notifications that can be read briefly and be less interruptive. Quick updates keep people informed and don't impact productivity.

**Provide inline validation.** Wherever possible, use inline validation so people get feedback on their mistakes immediately.

**Empower people with robust settings.** Detailed notification settings allow people to set their own preferences. Empowering them to choose what notifications they get as well as what features are used drives satisfaction and trust.

### In-app guidance

In-app guidance comprises the various ways of helping users learn and use your workload effectively. Some examples of in-app guidance include tooltips, walkthroughs, tutorials, help menus, and contextual hints.

**Establish the purpose and scope of the in-app guidance.** Define the specific problems or gaps that the guidance aims to address or fill. Define the desired outcomes and metrics that the guidance intends to achieve or improve.

**Design the guidance content and interaction.** Create the content and interaction of the in-app guidance based on the user needs and expectations and the guidance objectives and outcomes. Use clear and concise language, appropriate tone and style, and consistent terminology and formatting. Use visual and auditory elements, such as icons, images, animations, sounds, and colors, to enhance the content and interaction. Use feedback and reinforcement, such as progress indicators, completion messages, and rewards, to motivate and encourage the user.

**Choose the right guidance type and component.** Select the most suitable type and component of in-app guidance based on the user needs and expectations and the guidance objectives and outcomes. Consider the advantages and disadvantages of each type and component, such as the level of user control, the degree of user interruption, and the amount of user attention. Use a combination of different types and components to provide a comprehensive and flexible guidance experience.

**Iterate and improve the guidance design and implementation.** As part of user testing of your workload's experiences, identify the strengths and weaknesses of the in-app guidance. Make the necessary changes and improvements to the guidance content, interaction, type, component, and integration. Repeat the testing and evaluation process until the in-app guidance meets the user needs and expectations and the guidance objectives and outcomes.

## Power Platform facilitation

App message bar notifications that span the top of the screen can be triggered in canvas apps [using the Power Fx formula](/power-platform/power-fx/reference/function-showerror) and in model driven apps using [customized command bar actions](/power-apps/maker/model-driven-apps/commanding-use-powerfx).

In-app notifications can be pushed to a centralized user notifications hub [model driven apps](/power-apps/user/notifications) and [the Power Apps mobile app](/power-apps/mobile/mobile-notifications). These can be invoked by the [Dataverse Web API action](/power-apps/developer/data-platform/webapi/reference/sendappnotification?view=dataverse-latest), or more conveniently via [pro code plugins](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/send-in-app-notifications?tabs=clientapi) or [low code plugins](/power-apps/maker/data-platform/lowcode-plug-ins-examples#send-in-app-notifications-based-on-an-instant-action).

The Power Apps notification connector can [invoke push notifications](/power-apps/maker/canvas-apps/add-notifications) to devices with Power Apps mobile app installed.

Universal help panels can be implemented using a [side pane](/power-platform/guidance/creator-kit/panel) in canvas apps or as a [custom page side dialog](/power-apps/developer/model-driven-apps/clientapi/navigate-to-custom-page-examples#open-as-a-side-dialog) in model driven apps.

Use the modern [info button](/power-apps/maker/canvas-apps/controls/modern-controls/modern-control-info-button) to provide inline contextual information in canvas apps.

Dataverse offers [server-side business rules](/power-apps/maker/data-platform/data-platform-create-business-rule) for basic field-level input validation. Low code plugins can implement [advanced server-side input validation and customized errors defined in Power Fx](/power-apps/maker/data-platform/lowcode-plug-ins-examples#input-validation-and-custom-errors) during server operations.

Notifications to other services in the Power Platform ecosystem can be invoked from connectors, like [Outlook](/power-apps/teams/add-app-notifications) or [Microsoft Teams](/templates/details/52f77e0cde234231903129fce1327763/notify-a-user-in-teams/).

## Related links

- [Recommendations for writing content for user interfaces](user-interface-content.md)

## Experience Optimization checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Experience Optimization checklist](checklist.md)