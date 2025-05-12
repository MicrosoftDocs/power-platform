---
title: Recommendations for implementing an information architecture
description: Learn strategies for implementing an effective information architecture in your workload to ensure user experience optimization.
author: RobStand
ms.author: rstand
ms.reviewer: jhaskett-msft
ms.date: 05/10/2024
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for implementing an information architecture

**Applies to this Power Platform Well-Architected Experience Optimization checklist recommendation:**

|[XO:03](checklist.md)| **Implement a consistent information architecture. Make finding information and functionality easy. Provide contextual clues and visual indicators to guide users. Use consistent and user-friendly labels for categories, navigation, and other informational elements.** |
|---|---|

This guide describes the recommendations for designing an effective information architecture for your workload.

## Key design strategies

Information architecture refers to the organization and structure of a system's content and features. It affects how users perceive, understand, and navigate the system. A well-architected system should have an information architecture that prioritizes user needs and tasks over the system's internal logic or technical constraints. This approach ensures that users can easily and efficiently find and access the information and features they need.

### Be consistent with navigation structures

Consistent navigation enhances user orientation within the workload experience, facilitating smooth transitions between pages or screens. Navigation should be clear, intuitive, and predictable. Use the same navigation elements&mdash;menus, tabs, breadcrumbs, and buttons&mdash;across your workload, and place them in consistent locations. Make sure that the navigation reflects the hierarchy and relationships of your content and that users can easily perceive their current location and potential destinations.

### Use consistent and user-friendly labels

Labels are the terms used to identify and explain content and features like headings, titles, menus, buttons, and links. Clear and consistent labels help users understand and easily navigate the workload experience and perform their tasks effectively. Labels should be consistent in tone, language, and format, and use terms that users are familiar with and prefer. For example, if you use the term "account" to refer to the user's profile and settings, use it consistently throughout your workload's experience, and avoid using synonyms like "profile" or "settings."

Navigation elements should have clear and descriptive labels that communicate the purpose and destination of each element. Users should be able to understand what each element does and where it leads without having to click or tap on it. For example, a menu item labeled "Products" provides more information than one labeled "Menu 1."

### Provide contextual clues and visual indicators to guide users

Contextual clues and visual indicators are the elements that help users understand the meaning and function of your content and features. Examples include icons, labels, colors, fonts, and images. They should be consistent in style, size, and meaning, and match the user's expectations and conventions. For example, if you use an icon of a magnifying glass to represent a search function, use it consistently throughout your product, and make sure that it behaves the same way each time it's used.

### Use progressive disclosure

Progressive disclosure keeps users focused on primary tasks and goals by minimizing distractions from secondary or irrelevant information and functionality. Provide the right amount of information and functionality at the right time, using techniques such as hiding, collapsing, expanding, or revealing content and functionality as needed. Avoid overwhelming or distracting the user with too much or too little information and functionality. Allow users to control the level of detail and complexity they want to see or interact with.

A quintessential demonstration of progressive disclosure is the wizard pattern. A wizard is a step-by-step process that allows users to input or view information in a prescribed order and in which subsequent steps might depend on information entered in previous ones. Breaking down complex processes into smaller, sequential steps reduces cognitive load on the user, compared to revealing all fields and information at once. This approach delivers the same content in a more manageable and user-friendly format.

### Categorize information and functionality

Organizing information and functionality into meaningful and logical groups makes it easier for users to find and access the information and features of your workload. Group and label the content and functionality into meaningful and logical categories, based on the users' needs, tasks, and goals. Use categories that are mutually exclusive and collectively exhaustive, where each item belongs to one and only one category and all the items are covered by the categories. Be sure to use categories that are coherent and consistent and that items within each category share a common characteristic or criterion.

### Group information and functionality into hierarchies

Arrange and display the content and functionality in a hierarchical order, based on the importance, frequency, or sequence of use. Use a top-down or a bottom-up approach, depending on the users' preferences and behaviors. Use a shallow or a deep hierarchy, depending on the amount and complexity of the content and functionality. Use visual cues and indicators, such as size, color, shape, or position, to show the hierarchical relationships and levels.

## Power Platform facilitation

Model-driven app navigation allows you to [configure groupings of pages](/power-apps/maker/model-driven-apps/app-navigation) in various levels. The app designer provides you with the ability to manage the forms, views, and custom pages within the app.

Canvas apps consist of [screens](/power-apps/maker/canvas-apps/controls/control-screen), with [navigation](/power-apps/maker/canvas-apps/add-screen-context-variables) achieved using native components. For example, you can use a [gallery](/power-apps/maker/canvas-apps/controls/control-gallery) or [vertical layout container](/power-apps/maker/canvas-apps/controls/control-vertical-container) to create lists of elements as nodes, where each node contains a clickable element such as a [button](/power-apps/maker/canvas-apps/controls/modern-controls/modern-control-button) to [navigate](/power-platform/power-fx/reference/function-navigate) between screens. Consider using [custom components](/power-apps/maker/canvas-apps/create-component) to implement reusable global navigation components that appear on every screen.

The [Nav control](/power-platform/guidance/creator-kit/nav) in Creator Kit is a good option for primary navigation. A [tab list](/power-apps/maker/canvas-apps/controls/modern-controls/modern-control-tabs-or-tabs-list) is commonly used for secondary navigation to switch content within a screen. Use the [link modern control](/power-apps/maker/canvas-apps/controls/modern-controls/modern-control-link) to [launch a webpage or canvas app](/power-platform/power-fx/reference/function-param). Universal navigation to resources can be placed in a global [app header](/power-apps/maker/canvas-apps/controls/modern-controls/modern-controls-header) by overlaying clickable navigation [icons](/power-apps/maker/canvas-apps/controls/control-shapes-icons) (or [Fluent icons](/power-platform/guidance/creator-kit/icon)) over the header in a [container](/power-apps/maker/canvas-apps/controls/control-container).

To implement a wizard pattern, use the [SubwayNav component](/power-platform/guidance/creator-kit/subwaynav) of Creator Kit.

## Related information

[Navigation in a canvas app](/training/modules/navigation-canvas-app/)

## Experience Optimization checklist

> [!div class="nextstepaction"]
> [Experience Optimization checklist](checklist.md)
