---
title: Recommendations for feedback and guidance
description: Learn effective strategies for providing meaningful feedback and guidance to users, enhancing user experience and optimizing workload performance.
author: RobStand
ms.author: rstand
ms.reviewer: jhaskett-msft
ms.date: 08/05/2025
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for feedback and guidance

**Applies to this Power Platform Well-Architected Experience Optimization checklist recommendation:**

|[XO:05](checklist.md)| **Provide meaningful, useful, and simple guidance in notifications and messages. Notify users with relevant, important, and valuable information. Give users feedback on their actions. Let users know when something happens and what they need to do next.** |
|---|---|

This guide describes the recommendations for providing meaningful feedback and guidance to users of your workload. Feedback and guidance in a well-architected workload provide users with the information they need to perform actions and to effectively make decisions. Feedback and guidance that lack relevance, are hard to understand, or display at the wrong time for the user to properly react lead to a poor user experience, potentially resulting in lost productivity, higher support costs, and failed business processes.

## Key design strategies

When users perform an action, they should get prompt and understandable feedback from the system. Notifications and messages play a critical role in delivering important information to users promptly and contextually.

### Feedback notifications

**Minimize noise and distraction**. Use notifications only when necessary to minimize noise and distraction. Overload of system messages reduces efficiency and causes frustration. Notifications break workflow, lowering efficiency and hindering productivity. Interruptions can take time from which to recover and can lead to errors. Notifications can also frustrate users if they're irrelevant, overly intrusive, or delivered through an unsuitable method.

**Use a central location for notifications**. Notification centers are useful aggregators of message content. They're the best place to provide quick access to important information, allowing users to stay informed at all times.

**Help people act more quickly**. Notifications that lack immediate actionable options can be frustrating. Providing actions within notifications saves users time. Users appreciate the ability to access and act on notifications across devices.

**Provide reassurance when there's an error.** If a part of the process fails, inform users about the issue and its cause and reassure them that they haven't lost any work. Provide clear instructions on the next steps so that users are confident on how to proceed.

**Avoid presenting the same notification more than once**. Having to dismiss notifications across multiple apps, UI surfaces, and devices more than once isn't user-friendly. Categorized notifications lose their value when they aren't synchronized. As a result, notification systems are shifting from being device-centric to user-centric.

**Put critical messages first**. Match urgency with the appropriate design pattern and put critical messages first. Consider the type of notification you're sending and its impact on the experience. Choose the right pattern for communication; for example, avoid blocking the user's action for noncritical messages. Make sure that the most urgent or important messages are prioritized.

**Create succinct messages**. Ensure notifications are easy to read and minimally disruptive. Quick updates keep users informed without affecting productivity.

**Provide inline validation**. Whenever possible, use inline validation to provide users with instant feedback on errors.

**Empower people with robust settings**. Detailed notification settings allow users to set their own preferences. Allowing users to select the notifications they receive and the features they use enhances satisfaction and trust.

### In-app guidance

In-app guidance is one of the ways of helping users learn and use your workload effectively. Some examples of in-app guidance include tooltips, walkthroughs, tutorials, help menus, and contextual hints.

**Establish the purpose and scope of the in-app guidance**. Define the specific problems or gaps that the guidance aims to address. Define the desired outcomes and metrics that the guidance intends to achieve or improve.

**Design the guidance content and interaction**. Create the content and interaction of the in-app guidance based on user needs and expectations and the guidance objectives and outcomes. Use clear and concise language, appropriate tone and style, and consistent terminology and formatting. Use visual and auditory elements to enhance the content and interaction, such as icons, images, animations, sounds, and colors. Use feedback and reinforcement, such as progress indicators, completion messages, and rewards, to motivate and encourage the user.

**Choose the right guidance type and component**. Select the most suitable type and component of in-app guidance based on user needs and expectations and the guidance objectives and outcomes. Consider the advantages and disadvantages of each type and component, such as the level of user control, degree of user interruption, and amount of user attention. Use a combination of different types and components to provide a comprehensive and flexible guidance experience.

**Iterate and improve the guidance design and implementation**. As part of user testing of your workload's experiences, identify the strengths and weaknesses of the in-app guidance. Make the necessary changes and improvements to the guidance content, interaction, type, component, and integration. Repeat the testing and evaluation process until the in-app guidance meets user needs and expectations and the guidance objectives and outcomes.

## Power Platform facilitation

App message bar notifications that span the top of the screen can be triggered in canvas apps [using the Power Fx formula](/power-platform/power-fx/reference/function-showerror) and in model-driven apps using [customized command bar actions](/power-apps/maker/model-driven-apps/commanding-use-powerfx).

In-app notifications can be pushed to a centralized user notifications hub for [model-driven apps](/power-apps/user/notifications) and [the Power Apps mobile app](/power-apps/mobile/mobile-notifications), invoked by the [Dataverse Web API action](/power-apps/developer/data-platform/webapi/reference/sendappnotification), or more conveniently in [pro-code plugins](/power-apps/developer/model-driven-apps/clientapi/send-in-app-notifications?tabs=clientapi) or [low-code plugins](/power-apps/maker/data-platform/lowcode-plug-ins-examples#send-in-app-notifications-based-on-an-instant-action).

Consider using the Power Apps notification connector to [send push notifications](/power-apps/maker/canvas-apps/add-notifications) to devices with the Power Apps mobile app installed.

Implement universal help panels using a [side pane](/power-platform/guidance/creator-kit/panel) in canvas apps or as a [custom page side dialog](/power-apps/developer/model-driven-apps/clientapi/navigate-to-custom-page-examples#open-as-a-side-dialog) in model-driven apps.

Use the [info button modern control](/power-apps/maker/canvas-apps/controls/modern-controls/modern-control-info-button) to provide inline contextual information in canvas apps.

For basic field-level input validation, Dataverse offers [server-side business rules](/power-apps/maker/data-platform/data-platform-create-business-rule). Implement [advanced server-side input validation and customized errors defined in Power Fx](/power-apps/maker/data-platform/lowcode-plug-ins-examples#input-validation-and-custom-errors) during server operations with low-code plugins.

Use connectors to send notifications to other services in the Power Platform ecosystem, such as for services like [Outlook](/power-apps/teams/add-app-notifications).

## Related information

[Recommendations for writing content for user interfaces](user-interface-content.md)

## Experience Optimization checklist

> [!div class="nextstepaction"]
> [Experience Optimization checklist](checklist.md)
