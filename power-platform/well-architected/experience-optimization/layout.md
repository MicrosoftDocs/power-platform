---
title: Recommendations for optimizing layout.
description: Learn how to optimize app layout for different platforms and devices to enhance the user experience across various viewing contexts.
author: RobStand
ms.author: rstand
ms.reviewer: robstand
ms.date: 03/28/2024
ms.subservice: guidance
ms.topic: conceptual
---

# Recommendations for optimizing layout

**Applies to this Power Platform Well-Architected Experience Optimization checklist recommendation:**

|[XO:06](checklist.md)| **Maintain usable and visually appealing layouts across screen sizes and resolutions. Use adaptive techniques to dynamically render content in various ways.** |
|---|---|

This guide describes the recommendations for designing screen layouts that are easy to navigate and adapt fluidly across various devices. This approach ensures that users have a consistent and optimal viewing experience regardless of the device they're using.

**Definitions**

| Term | Definition |
|---|---|
| Viewport | Visible portion of a digital interface, such as a web browser or mobile app, where content is displayed. Viewport ranges are often associated with device classes (mobile, tablet, and desktop) based on screen dimensions and resolutions. |
| Breakpoints | Specific pixel values that define viewport ranges used to determine adaptive layout behavior. |

## Key design strategies

Responsive layouts provide a flexible and efficient user experience across different window sizes. They adapt by scaling content, rearranging elements, and selectively displaying text and images. Responsible layouts meet users' needs regardless of their screen size.

### Determine a consistent app frame

The application frame consists of a set of controls consistently available on every screen. It comprises three main subcomponents: a header, navigation, and a content region. Simple apps have the flexibility to use the header component, while more sophisticated apps often leverage side navigation to enable multiple pages. Subcomponents are customizable. For example, you can incorporate a global search in the header or group items in the side navigation to suit your app's requirements.

:::image type="content" source="media/layout/appframe.svg" alt-text="App frame is made up of three main subcomponents.":::

The three main subcomponents of the app frame are described as follows:

1. The *header* is a core component designed to be a part of every internal application. It consists of sub-components that give users access to system-wide functions, helps orient them to the UI, and provides consistency across experiences. It appears across the top of the app frame and should persist across all pages of the app. It can optionally host global commands, like search, settings, notifications, feedback, profile, or help. The name of the app should always be displayed, which should ideally also serve as a clickable link to the home or landing page. The header should be responsive, with commands moving into the overflow control in viewports that are 600 pixels and below. The search input width is also responsive at 1023 pixels and below.

2. *Navigation* is a system of controls that work together to help users find information and complete tasks. It helps users jump from section to section of an application. Hierarchically, it's not attached to any page or section, but exists above all other content. It's always present, and may be minimized to a collapsed state (also called a rail state) to free up additional space for page content. At smaller window sizes, it can be minimized into a flyout menu. The most common forms of navigation include top navigation and side navigation (both should not be used simultaneously).

3. The *content region* contains the focus of the screen. The size of the browser window influences the content frame and the space available in the main content region. This frame adapts based on the breakpoint and the corresponding responsive behavior of each component. For more information, see [Create a breakpoint matrix](#create-a-breakpoint-matrix).

    The content region can optionally contain several sub-regions that are available for consistent element placement, such as a page header, inline side panes, or panels that overlay the content.

Adhering to a consistent design language (color schemes, typography, and layout structure) helps users quickly identify and interact with various elements without confusion. The more consistently an app frame pattern is used across all internal business applications, the stronger the user's recall or mental model becomes. Aligning with industry standards or common platform patterns further enhances this effect.

Once the app frame is determined, each screen's layout resides within the content area of the app frame.

### Thoughtfully use the content region

Users crave seamless experiences where information is readily accessible, text is easy to read, and aesthetics enhance rather than hinder usability. Prioritize initial visibility of key information, ensure readability across columns, and harmonize design elements for aesthetic appeal.

Ensure essential information is immediately visible upon opening the screen without the need for scrolling. Prioritize the display of essential information such as navigation options, crucial content, and actionable items near the top of the screen. Striking the balance between displaying sufficient items and providing detailed information for each item is a constant challenge. Conversely, while it can be tempting to provide all possible information in the initial view, too much information risks overwhelming users and diluting the significance of key elements. Consider employing concise summaries or previews that offer a glimpse into more detailed content, enticing users to delve deeper. Dashboards are optimized to serve this purpose for visualizing large amounts of data.

Incorporate multiple columns, sections, or groupings to logically organize content and maximize space. Pay meticulous attention to column width, ensuring text remains legible without excessive strain. Avoid overly narrow columns that force users to constantly scroll horizontally, disrupting the flow of interaction. Conversely, excessively wide columns can impede readability, requiring users to track lines across extended distances. Strive for a balance that accommodates comfortable reading while making efficient use of the available space.

Size and position visual elements appropriately to create a visually pleasing and balanced interface. Align captions with corresponding visuals or titles, maintain consistent spacing between elements, and adhere to a hierarchy based on user needs. Trim unnecessary embellishments and allocate pixels judiciously to elements that matter most. Prioritize and emphasize content and navigation elements, particularly on navigation-intensive apps or homepages, and avoid superfluous ornamentation that detracts from usability.

An underlying grid can be useful for arranging elements consistently. The chosen grid behavior should be consistent across every screen's content region in the app and can also be applied at the component level (such as cards or side panes). The most common type of grid layout used in web applications is the column grid. Fluid (or stretch) grid behavior is recommended for implementing responsive screens.

### Use established layouts and grouping patterns

Use commonly recognized structures and arrangements for organizing content and elements within a user interface. These layouts and patterns have been refined and proven effective over time, making them familiar and intuitive to users while also making it easy to implement adaptive patterns. Once core scenarios and elements are identified, map each to an established layout that provides the best interaction. Prioritize content and features important for task completion. Decide which elements should always be visible and accessible on the screen and which can be hidden or accessed through other menus or actions.

The following list, while not exhaustive, describes established layouts commonly used for business or productivity applications. All can take place within the main content region.

#### Landing/Home screen

:::image type="content" source="media/layout/landing.svg" alt-text="App screen layout for desktop and phone displaying a landing page.":::

Serves as the entry point to an application, providing users with an overview of the app's offerings or features. Typically aims to capture the attention of visitors and encourages taking a specific action, such as completing a first-time task or exploring further content. It often contains hero images and clean navigation options.

It's ideal for welcoming users, offering quick access to key functionalities, navigation options, or calls to action, and setting the tone for the app's experience. Prioritize clarity, simplicity, and intuitive navigation to guide users effectively.

#### Dashboard

:::image type="content" source="media/layout/dashboard.svg" alt-text="App screen layout for desktop and phone displaying a dashboard.":::

A centralized hub within an application that presents users with a comprehensive overview of relevant data or information. It often consists of customizable widgets or modules, allowing users to monitor specific metrics or perform actions.

Dashboards are suited for applications with complex datasets or multifaceted functionalities, enabling users to track progress, analyze trends, and make informed decisions at a glance. They are particularly useful in analytics platforms, project management tools, and financial management apps.

#### Form

:::image type="content" source="media/layout/form.svg" alt-text="App screen layout for desktop and phone displaying a form.":::

A structured layout that facilitates data input from users, typically comprised of fields for entering various types of information such as text, numbers, dates, and selections. Forms are essential for collecting user input, processing transactions, and facilitating interactions within applications.

They are commonly employed in registration flows, checkout processes, data entry tasks, and any scenario requiring user input or feedback.

#### Entity/Profile view

:::image type="content" source="media/layout/entity.svg" alt-text="App screen layout for desktop and phone displaying a profile view.":::

Presents detailed information about a specific entity, such as a user profile, product listing, or content item. It typically includes descriptive text, multimedia elements, and relevant actions or interactions.

They're well-suited for showcasing detailed information about items within an application. They provide users with in-depth insights, facilitate decision-making, and support engagement with specific entities such as user profiles in social networking apps or product listings in e-commerce platforms.

#### List page

:::image type="content" source="media/layout/list.svg" alt-text="App screen layout for desktop and phone displaying a table.":::

Displays a collection of items or entities in a structured format, often presented in a linear or grid layout. It typically includes brief summaries or previews of each item, along with navigation controls for browsing or filtering.

List pages are effective for presenting large sets of content or data in a digestible format, enabling users to scan, search, and navigate efficiently. For example, if actions on specific rows are enabled, the process should be clear. List pages are commonly used in content management systems, directory listings, search results, and news feeds.

#### Mini review (split screen)

:::image type="content" source="media/layout/mini-review.svg" alt-text="App screen layout for desktop and phone displaying a mini review.":::

Divides the interface into two distinct sections, with a list displayed on the left side and an item view on the right side. The list typically contains a collection of items, while the item view provides detailed information about the selected item from the list.

This layout is particularly effective in scenarios where users need to browse through a list of items quickly and view detailed information about each item simultaneously, such as when performing bulk operations. Product catalogs, document management systems, email or communication clients, and task management tools (for example, Azure Dev Ops query viewer) are scenarios that typically fit this pattern.

#### Wizard

:::image type="content" source="media/layout/wizard.svg" alt-text="App screen layout for desktop and phone displaying a wizard.":::

Guides users through a series of sequential steps or tasks, typically in a linear fashion, to complete a complex process or achieve a specific goal. It often includes progress indicators, prompts, and validation checks. Wizards are beneficial for simplifying complex processes, reducing cognitive overload, and guiding users through unfamiliar tasks or workflows. They are commonly used in onboarding flows, setup processes, multi-step forms, and task-based interactions such as configuring complex settings or transactions.

Proceed to customize and build upon the standard layout to suit specific requirements. This process might include adding or removing elements, adjusting the size and positioning of elements, and applying styling to match the brand identity or visual design guidelines. Experiment with different configurations and variations of the standard layout to find the most effective arrangement for content and overall user experience.

### Design layouts for all devices

Layouts are a culmination of defined rules and intentional organization of content. Bringing your content into thoughtful structures is key, but making it all flow together with a clear hierarchy across platforms and screen sizes requires scaling logic. Individually, adaptive and responsive design can each address this challenge. In some cases, a mix of adaptive and responsive design is the right choice.

*Responsive design* uses just one layout where the content is fluid and can adapt to changing format size. This design technique uses media queries to inspect a given device's characteristics and renders content accordingly. Responsive design enables you to build a feature once and have it function effectively across all screen sizes.

An *adaptive layout* changes entirely based on the format it's presented in. Adaptive design has multiple fixed layout sizes and triggers the browser to load a given layout based on the available space. Websites built with adaptive design use media queries to detect breakpoints, similar to responsive design. They also use additional markup based on the device's capabilities. This process is known as "progressive enhancement."

#### Reposition

Alter the position of page elements.

:::image type="content" source="media/layout/reposition.svg" alt-text="Elements stacked vertically in smaller viewports are repositioned as horizontal elements in larger viewports.":::

Keep your content organized, readable, and balanced by optimizing the composition as window size increases. For example, vertically stacked elements on a mobile viewport can be repositioned horizontally on larger viewports. This change follows a natural left-to-right reading order, creates balance in the design, and maintains visual focus on key elements on the page.

#### Resize

Adjust the size and margins of page elements.

:::image type="content" source="media/layout/resize.svg" alt-text="Margins decrease in smaller viewports and increase in larger viewports.":::

Resize page elements to optimize for a rich user experience by displaying more content at the top of the window, reducing the need for vertical scrolling. Adjust page margins to add white space and balance to the layout, which allows the content to breathe and enhances the visual appeal of the design. For example, a hero component might stretch to the full width of the window to show more of the background image. Content beneath the image photo might be expanded but use different margins to add variety in the layout and helps to define visual hierarchy.

#### Reflow

Optimize the flow of page elements.

:::image type="content" source="media/layout/reflow.svg" alt-text="Elements are usually stacked in small viewports, but can be selectively horizontal in larger viewports.":::

Reflow adjusts page elements to ensure they are fully displayed, taking into account the window size and orientation by rearranging the content. For example, a single column of content in a smaller window can be reflowed on a larger window to display two columns of text. This technique allows more content to be displayed "above the fold."

#### Show/hide

Optimize content for the window size and its orientation.

:::image type="content" source="media/layout/show-hide.svg" alt-text="Smaller viewports focus on including critical details while larger viewports can include optional information that adds to aesthetics for the layout.":::

Show or hide page elements to optimize content for the window size and its orientation. This responsive technique tailors the amount of information to the viewing context. For example, categories appearing on a small screen might display limited metadata, like an image, title, and link, so that other information is made visible to help the user focus. On a larger screen, categories can display additional metadata like a persona, date, and short description, while still fitting within the viewport.

#### Rearchitect

Fork or collapse page elements and content to retain focus on important information and actions.

:::image type="content" source="media/layout/rearchitect.svg" alt-text="Certain elements can change form or location to optimize the viewport size.":::

This approach is similar to following the practice of "progressive disclosure" in your design but for different window sizes and orientations. For example, expanding the window allows a list of items to be displayed next to the details. This visual link between the content allows users to easily select another item. On a smaller screen, the focus remains on displaying key information.

### Create a breakpoint matrix

A breakpoint matrix serves as a graphical depiction illustrating the responsive or adaptive behaviors of an application's design across different screen sizes and orientations. It typically presents a structured grid or layout detailing the design's response at various breakpoints. Each segment corresponds to a distinct screen width, offering insights into the design's structure, layout, and functionality. A breakpoint matrix encompasses considerations of screen width, viewport orientation, design elements, layout structure, content presentation, navigation, media, and interactive components, to illustrate how a website or app's design responds across different screen sizes and orientations. This approach not only helps finalize the design of each screen, but also makes implementation easier when key component property changes are explicitly tracked and well-communicated.

## Power Platform facilitation

Model-driven app form layouts are configured using Power Apps Studio. The [form designer](/power-apps/maker/model-driven-apps/form-designer-overview) permits makers to add elements into a grid structure, which allows form pages to be inherently responsive. Embedded custom components like [custom pages](/power-apps/maker/model-driven-apps/model-app-page-overview), [embedded canvas components](/power-apps/maker/model-driven-apps/embedded-canvas-app-add-classic-designer), and [Power Apps Component Framework (PCF) code components](/power-apps/developer/component-framework/overview) need to incorporate responsive behavior in their respective implementations. For example, custom pages must implement responsive behavior in the same way as a pure canvas app to function correctly.

Canvas apps require explicit configuration for each component to [implement responsive behavior](/power-apps/maker/canvas-apps/create-responsive-layout), allowing more control over the experience. Screen sizes are determined on the app definition, which can be referenced to determine position, behavior, visibility, and other relevant properties.

## See also

[Fluent layout](https://fluent2.microsoft.design/layout)

## Experience Optimization checklist

> [!div class="nextstepaction"]
> [Experience Optimization checklist](checklist.md)
