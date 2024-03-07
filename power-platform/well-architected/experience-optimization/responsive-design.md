---
title: Recommendations for optimizing for different platforms and devices.
description: Learn how to optimize for different platforms and devices to ensure consistent success with user experience optimization.
author: RobStand
ms.author: rstand
ms.reviewer: robstand
ms.date: 01/31/2024
ms.subservice: guidance
ms.topic: conceptual
---

# Recommendations for optimizing for different platforms and devices

**Applies to this Power Well-Architected Experience Optimization checklist recommendation:**

|[EO:01](checklist.md)| **Ensure the interface remains usable and visually appealing across a wide range of screen sizes and resolutions. Utilize adaptive design techniques to dynamically render the interface for different screen sizes and orientations. ** |
|---|---|

This guide describes the recommendations for principles and techniques used to create applications that adapt and respond fluidly to different screen sizes, resolutions, and orientations across various devices, such as desktop computers, laptops, tablets, and smartphones. This approach ensures that users have a consistent and optimal viewing experience regardless of the device they are using.

**Definitions**

| Term | Definition |
|---|---|
| Device class | A categorization of devices based on their characteristics such as screen size, resolution, and capabilities. Common device classes include desktop computers, laptops, tablets, smartphones, and wearables. |
| Breakpoints | Breakpoints are the building blocks of responsive design. They determine how responsive layouts behave across device classes. Breakpoints also represent a subset of common device dimensions. |
| Grid | The grid provides the fundamental groundwork for placing visual elements. All grids are made up of three elements: columns, gutters, and margins. |
| Columns | Columns are the building blocks of a grid and mark where elements should be placed. |
| Gutters | Gutters are the negative space between columns and their width should be a multiple of the base unit. |
| Margins | Margins are the space outside of the grid columns and rows. |

## Key design strategies

Responsive layouts ensure an efficient, adaptable user experience across various window sizes, achieving equal information access through content scaling, rearrangement, and selective display of text and images, meeting people's needs irrespective of screen size.

**Advantages of responsive layout**
- Makes full use of the window and remove gaps in content and functionality.
- Eliminates friction by removing the need to scroll and zoom.
- Optimizes for compatibility by considering the window size and its orientation.
- More easily meets accessibility standards.
- Makes people happy by allowing them to easily find the info they need.
- Supports content prioritization and focus at smaller screen sizes.

### Define a consistent app frame

Utilize an app frame design to deliver the most common layouts found in an application. This removes the need for redundant specification rounds and building. Simple apps have the flexibility to use the header component while more sophisticated apps can leverage side nav to enable depth of navigation. Subcomponents are also customizable. For example, using global search in header, or nav group items in side nav are optional and can be tailored to the needs of your product. 

Users value consistency in UI design across multiple apps, as it helps them learn how to use the app without breaking their usage habit. Using a consistent app frame across applications in your organization can help create coherent experiences by providing a common set of components, interactions, and patterns that persist. This helps people who use those products to complete tasks easier and feel more satisfied with the experience.

<!--- GUIDANCE
App frame consists of the below elements. Each retains its individual configuration capabilities and can be customized according to app needs.
- Container or browser window
- App frame
- Header with hamburger menu
- Side nav
- Content region

Configurations:
- Header and content region. For single page apps or apps using lightweight nav components such as top nav containing less than five categories. This configuration provides the most space to display info in the content region.
- Header, side nav, and content region. For apps needing multiple levels of navigation containing more than five categories. This configuration provides less space to display info in the content region but includes a persistent and visible nav menu at larger window sizes. 
--->

### Use a consistent grid

The grid serves as an underlying, invisible structure that governs the positioning of all elements and content within a page. It plays a crucial role in maintaining coherence, enhancing visual hierarchy, and achieving balance in the design of an app. The grid's behavior is consistent across the entire application, ensuring a cohesive user experience. To create a responsive grid layout, it's essential to understand the different types of grids available and apply adaptive techniques as needed. All elements should adhere to the predefined grid to maintain consistency and cohesion in the design.

The stretch grid behavior is characterized by columns and margins that are percentage-based and relative to the viewport size. This allows content to reflow dynamically and maintain balance in the white space around it. Breakpoints can trigger significant layout restructures, with column width being fluid, gutters fixed, and margins fluid except for a fixed margin of 5% of content pixels on the nav's width. An example application of this grid is a dashboard page where dynamic content organization is crucial.

Conversely, the fixed grid behavior maintains column and gutter widths regardless of the viewport size, while margins stretch as necessary. This provides greater control over content rendering, allowing for centered or left-aligned layouts. In a fixed grid, column width is fixed at 60px, gutters are fixed, and margins are fluid, with adjustments to a hybrid approach often necessary for smaller screens. Although a fully fixed grid is rare due to limitations on smaller screens, it finds application in news pages or structured card layouts.

Stretch grid, also known as fluid grid or fluid layout, is optimized for responsive design patterns as it's easier to adjust. 

### Use established layouts and grouping patterns

Ensure layout adapts to window sizes for accessible scaling.
Content is efficiently laid out.
Organize information by hierarchy.

Employ commonly recognized structures and arrangements for organizing content and elements within a user interface. These layouts and patterns have been refined and proven effective over time, making them familiar and intuitive to users while making it easy to implement adaptive design patterns.

The following includes a non-exhaustive list of established lists, many of which can be combined (e.g., a hero banner layout could contain a grid of items below, with tabs in between the elements to sort).

- Header and Footer Layout: This layout typically consists of a header section at the top of the page, containing branding, navigation menus, and search bars, and a footer section at the bottom, often containing copyright information, links to additional resources, and contact details.
- Sidebar Layout: In this layout, a vertical sidebar is positioned on one side of the main content area, providing navigation menus, filters, or additional information that complements the main content displayed in the central area of the page.
- Grid Layout: Content is organized into a grid structure with rows and columns, allowing for efficient display of images, text, and other elements. Grid layouts are commonly used for product listings, image galleries, and portfolio showcases.
- Hero Banner Layout: This layout features a large, prominently displayed banner or image at the top of the page, often accompanied by a headline and call-to-action button. Hero banners are effective for showcasing key messages, promotions, or featured content.
- Card-Based Layout: Content is presented within individual cards or containers, each containing related information or functionality. Card-based layouts are versatile and can be used for displaying articles, products, user profiles, or navigation links.
- Full-Screen Layout: Content spans the entire width and height of the screen, creating a visually immersive experience. Full-screen layouts are often used for landing pages, splash screens, or multimedia presentations.
- Tabbed Layout: Content is organized into tabs or tabs, allowing users to switch between different sections or categories of information within the same page. Tabbed layouts are useful for conserving screen space and organizing content hierarchically.
- Modal Layout: Content is displayed in a modal window that overlays the main page, focusing the user's attention on a specific task or interaction while temporarily dimming the background. Modal layouts are commonly used for alerts, dialogs, and form submissions.

### Design for all device classes

### Use adaptive techniques

#### Reposition

#### Resize

#### Reflow

#### Show/hide

#### Re-architect

<!---
#### Prioritize mobile-first design

Responsive design makes web content adapt to different screen and window sizes. Increasing the availability of applications to both web and mobile can increase the overall usage and adoption of the app if it's more convenient to access. In the design considerations, optimize for mobile interactions by using larger touch targets, avoiding hover-dependent interactions, and providing alternative input methods for gestures commonly used on touchscreens.

### Implement fluid layouts

Fluid layouts use relative units, such as percentages or ratios, instead of fixed units like pixels. This allows the website to resize and reposition elements based on the screen size of the device being used, letting content reflow and balance the white space around.

To achieve a responsive layout, a fluid layout approach is generally recommended due to its inherent flexibility and adaptability across various screen sizes and devices.

While fixed layouts offer precise control over the layout and appearance of elements, they can present pitfalls for responsive design. Fixed layouts maintain a constant width, which may lead to horizontal scrolling or cropping on devices with different screen sizes or aspect ratios. This lack of flexibility can result in a suboptimal user experience, particularly on smaller screens such as smartphones or tablets.

Hybrid layouts combine elements of both fluid and fixed layouts to strike a balance between flexibility and control. However, they can be more complex to implement and may require careful consideration of which elements should be fluid and which should be fixed. Hybrid layouts may also introduce challenges in maintaining consistency and visual harmony across different screen sizes and resolutions. In contrast, fluid layouts provide a straightforward and adaptable solution for responsive design. 

### Reduce friction

An adaptive design automatically reconfigures the elements on the page. It is better to reduce friction by understanding and removing the unnecessary elements in the page. Organize content to ensure the most important information is displayed prominently and is accessible on smaller screens. This may involve reordering content, collapsing navigation menus into responsive menus, and using progressive disclosure techniques to present content in a user-friendly manner.

### Use adaptive techniques for complex layouts

Breakpoints are the most essential component to create a responsive design. Breakpoints are specific points or thresholds in the layout of a responsive website or application where the design adapts or "breaks" to accommodate different screen sizes, resolutions, or device orientations. They are key components of responsive design and are strategically placed based on the content, layout, and design requirements of the project.

### Optimize images and fonts

Reduce the file size of high-resolution images for smaller viewports or use portable image types that can easily be scaled, such as SVG. Optimizing your fonts for mobile devices is an absolute necessity if you want your content to be palatable across all screen sizes.

### Create a breakpoint matrix

A breakpoint matrix serves as a graphical depiction illustrating the responsive or adaptive behaviors of an application's design across different screen sizes and orientations. It typically presents a structured grid or layout detailing the design's response at various breakpoints. Each segment corresponds to a distinct screen width, offering insights into the design's structure, layout, and functionality. A breakpoint matrix encompasses considerations of screen width, viewport orientation, design elements, layout structure, content presentation, navigation, media, and interactive components to illustrate how a website or app's design responds across different screen sizes and orientations.

--->

## Power Platform facilitation

Power Platform details here...

## Related links

- Layout containers
- Breakpoints
- [Create responsive layouts in canvas apps](/power-apps/maker/canvas-apps/create-responsive-layout)
- [Building responsive canvas apps](/power-apps/maker/canvas-apps/build-responsive-apps)
- [Getting Started with Responsive Canvas Apps](/shows/the-low-code-revolution/getting-started-with-responsive-canvas-apps)

## Experience Optimization checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Experience Optimization checklist](checklist.md)
