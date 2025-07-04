---
title: Recommendations for prioritizing ease of use
description: Learn how to prioritize ease of use or usability during the design process to optimize the user experience.
author: RobStand
ms.author: rstand
ms.reviewer: jhaskett-msft
ms.date: 09/11/2024
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for prioritizing ease of use

**Applies to this Power Platform Well-Architected Experience Optimization checklist recommendation:**

|[XO:04](checklist.md)| **Prioritize ease of use during the design process. Minimize user effort and maximize task efficiency. Streamline complex processes. Align design decisions with user needs.** |
|---|---|

This guide describes the recommendations for improving usability in user interface design. Usability refers to the ease of use and effectiveness of a product for its intended users. Usability directly affects user satisfaction, errors, and overall interactions with the digital interface, ultimately affecting the overall success of an application.

## Key design strategies

Usability is a quality attribute that assesses how easy user interfaces are to use. The word "usability" also refers to methods for improving ease of use during the design process.

Usability is defined by five quality components:

| Component | Description |
| --------- | ----------- |
| Learnability | How easily can tasks be accomplished the first time and how quickly do users learn from their previous experience? |
| Efficiency | After users have learned the design, how quickly can they perform tasks? |
| Memorability | When users return to the design after a period of not using it, how easily can they reestablish proficiency? |
| Errors | How many errors do users make, how severe are these errors, and how easily can they recover from the errors? |
| Satisfaction | How pleasant is it to use the design? |

### Visibility of system status

The system should always keep users informed about what is going on, through appropriate feedback within a reasonable time.

Display important details about the current status of the system in clear and intuitive locations. For example, if items are selected from a list, the number of selected items should be displayed.

:::image type="content" source="media/usability/h1.svg" alt-text="Screenshot showing the number of items selected.":::

Use progress indicators or loading animations to reassure users that their request is being processed. These visual indicators prevent frustration from uncertainty and help manage expectations. Without them, users might perceive the system as slow or unresponsive and abandon the task.

Real-time updates keep users engaged and informed about the outcome of their actions. Use status messages or notifications to clearly communicate successful actions or errors. It's common to send notifications when asynchronous jobs complete, and users should know when they need to look out for a notification.

Incorporate color-coded indicators on different states for quick recognition and understanding of system status. Color is processed faster than text, making it easier for the user to comprehend information quickly.

### Reflect the real world

The system should speak the users' language, using words, phrases, and concepts they understand, rather than system-oriented terms. Follow real-world conventions and present information in a natural and logical order.

Use terminology and concepts that are familiar to users and avoid jargon that might alienate them. People tend to quickly grasp the purpose and functionality of a system when it speaks their language.

Structure system information in a manner that mirrors scenarios and conventions users understand. Present information in a natural and logical sequence that resonates with familiar or real-world processes to facilitate easier adoption of the technology into the user's life.

:::image type="content" source="media/usability/h2.svg" alt-text="Screenshot of a required email address form field, with an incorrectly typed email, displaying an error indicating an incorrect email address format.":::

### User control and freedom

Users might inadvertently select system functions and will need a clearly marked "emergency exit" to leave the undesired state without navigating through an extended dialogue. Support undo and redo.

:::image type="content" source="media/usability/h3.svg" alt-text="Screenshot of a neutral button that says 'Back' next to a primary button that says 'Next'.":::

When reasonable, support various input methods to accommodate users with different preferences and accessibility needs. Keyboard shortcuts, touch gestures, voice commands, or mouse clicks ensure that users can interact with the interface using their preferred method.

Granular control over data and privacy settings is crucial for respecting user autonomy and building trust. Adjusting privacy settings, deleting or exporting data, and controlling access permissions for third-party applications ensures that users can maintain control over their information. Offering clear explanations and transparent disclosures about data collection practices, security measures, and user rights enables informed decision-making and promotes transparency and accountability.

### Consistency and standards

Maintain consistency in design to ensure that users can easily recognize and understand status indicators, reducing cognitive load and improving usability. Users shouldn't have to wonder whether different words, situations, or actions mean the same thing.

If repeatable experience patterns appear different, users will struggle to interpret the meaning of the variation introduced, leading to inefficiencies in understanding and task completion. Using a matching suite of controls helps ensure that visual elements are consistent across screens and experiences.

:::image type="content" source="media/usability/h4.svg" alt-text="Screenshot showing two different UI patterns, one to open the next screen with a button control, and another to open the screen with a link control.":::

### Error prevention

Even better than good error messages is a careful design that prevents a problem from occurring in the first place. Either eliminate error-prone conditions or check for them and present users with a confirmation option before they commit to the action. Proactively address potential issues in the interface to maintain workflow continuity.

:::image type="content" source="media/usability/h5.svg" alt-text="Screenshot of a sample form validation check before submission.":::

### Recognition rather than recall

Minimize the user's memory load by making objects, actions, and options visible. The user shouldn't have to remember information from one part of the app to another. Instructions should be visible or easily retrievable whenever appropriate.

When designing forms, consider whether to provide predefined options for users to choose from or allow free text input. This choice might be determined by the data type, but should be thought through at the UI layer as well. Opt for predefined options when speed and convenience are paramount, and choose free text input for scenarios requiring richer detail or personalized responses.

Provide guidance and resources to avoid the need to recall important information from memory. Common UI patterns include contextual help icons, inline documentation, tooltips, embedded tutorials, on-demand help menus, searchable knowledge bases, and interactive help widgets like AI-enabled resources.

:::image type="content" source="media/usability/h6.svg" alt-text="Screenshot of a comparison between a checklist with a set of options and a set of text input fields for free text response.":::

### Flexibility and efficiency of use

Accommodate users of varying levels of expertise by incorporating features such as accelerators and customization options. This approach allows the interface to adapt to the needs and preferences of both novice and expert users effectively.

Accelerators, often unnoticed by novice users, can speed up the interaction for expert users, allowing the system to cater effectively to both the inexperienced and experienced.

Customization options allow users to tailor the interface to their preferences, personalizing the overall experience. Providing options to rearrange interface elements (for example, dashboard cards) or create personalized shortcuts for frequently used features enhances user efficiency and comfort in navigating the system. Catering to diverse user skills and preferences fosters a sense of ownership and personal investment in an experience.

:::image type="content" source="media/usability/h7.svg" alt-text="Screenshot showing a filter pane with a link to saved filters followed by the main filtering experience.":::

### Aesthetic and minimalist design

Prioritize clear, focused status updates for users to more easily comprehend information at a glance. This approach reduces cognitive effort and minimizes risk of misinterpretation, frustration, or disengagement.

Dialogues shouldn't contain irrelevant or rarely needed information. Every extra unit of information in a dialogue competes with the relevant units of information and diminishes their relative visibility.

:::image type="content" source="media/usability/h8.svg" alt-text="Screenshot of a dialog with a succinct actionable question, with a primary button that says 'yes' and a secondary button that says 'no.'":::

### Help users recognize, diagnose, and recover from errors

Error messages should be expressed in plain language without code, precisely indicate the problem, and constructively suggest a solution.

Provide contextual help or guidance to assist users in resolving issues or understanding delays. This approach helps users determine the appropriate next steps, especially when facing obstacles or complex tasks. Instead of merely presenting a problem, offer a clear solution and incorporate built-in functionality to expedite resolution.

:::image type="content" source="media/usability/h9.svg" alt-text="Screenshot of an error message with a clear explanation of the message and suggestions to retry.":::

### Help and documentation

While the system should be intuitive enough to use without documentation, there may be instances where help and documentation are necessary. In such cases, ensure that the information is easy to find, task-oriented, concise, and provides clear step-by-step instructions.

:::image type="content" source="media/usability/h10.svg" alt-text="Screenshot of a help pane interface accessed from the top command bar.":::

## Power Platform facilitation

Copilot-powered experiences in Power Apps can help users discover valuable insights during conversations:

- [Add a Copilot control to a canvas app](/power-apps/maker/canvas-apps/add-ai-copilot)
- [Add a custom Copilot to a canvas app](/power-apps/maker/canvas-apps/add-custom-copilot)
- [Add Copilot for app users in model-driven apps](/power-apps/maker/model-driven-apps/add-ai-copilot)
- [Filter, sort, and search galleries with Copilot](/power-apps/user/smartgrid)

For canvas apps, you can indicate progress and loading states with the [progress bar](/power-apps/maker/canvas-apps/controls/modern-controls/modern-control-progress-bar) and [spinner](/power-apps/maker/canvas-apps/controls/modern-controls/modern-control-spinner) modern controls. Use the [badge control](/power-apps/maker/canvas-apps/controls/modern-controls/modern-controls-badge) to display status information.

Implement robust error handling in canvas apps on the client [using Power Fx expressions related to errors](/power-platform/power-fx/reference/function-iferror). Define custom server-side errors with Power Fx using [low-code plugins](/power-apps/maker/data-platform/lowcode-plug-ins-examples#input-validation-and-custom-errors), which include pre-operation validation.

In model-driven apps, where usability is built into the interface, focus on configuring aspects of the experience that enhance usability. An example of a built-in accelerator is the [personal views](/power-apps/maker/model-driven-apps/create-edit-views#personal-views) feature, which lets users save filtering and column preferences for a table in an app. Additionally, configure [custom help pages](/power-apps/maker/data-platform/create-custom-help-pages) to offer a detailed help resource within the app.

## Experience Optimization checklist

> [!div class="nextstepaction"]
> [Experience Optimization checklist](checklist.md)
