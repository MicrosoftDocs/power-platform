---
title: Recommendations for optimizing layout.
description: Learn how to optimize app layout for different platforms and devices to ensure consistent success with user experience optimization.
author: RobStand
ms.author: rstand
ms.reviewer: robstand
ms.date: 01/31/2024
ms.subservice: guidance
ms.topic: conceptual
---

# Recommendations for optimizing layout

**Applies to this Power Well-Architected Experience Optimization checklist recommendation:**

|[EO:01](checklist.md)| **Maintain usable and visually appealing layouts across screen sizes and resolutions. Utilize adaptive techniques to dynamically render content in various ways.** |
|---|---|

This guide describes the recommendations for principles and techniques used to design app screen layouts that easy to navigate and adapt fluidly across various devices. This approach ensures that users have a consistent and optimal viewing experience regardless of the device they are using.

**Definitions**

| Term | Definition |
|---|---|
| Viewports |  Visible portion of a user interface within a digital interface, such as a web browser or mobile app, where content is displayed, and can vary in size depending on device screen dimensions and resolution. |
| Breakpoints | Specific pixel values that define viewport ranges and associated app layout behavior, used to implement adaptive and responsive interfaces. |

## Key design strategies

Responsive layouts ensure an efficient, adaptable user experience across various window sizes, achieving equal information access through content scaling, rearrangement, and selective display of text and images, meeting people's needs irrespective of screen size.

### Determine a consistent app frame

The app frame is made from a set of controls that are available on every screen in a consistent manner. It's composed of three main subcomponents; a header, navigation, and a content region. Simple apps have the flexibility to use the header component while more sophisticated apps commonly leverage side navigation to enable many pages. Subcomponents are also customizable, meaning, for example, using global search in header, or grouping items in the side navigation can optionally be tailored to the needs of your app.

The _header_ is a core component designed to be a part of every internal application. It consists of a variety of sub-components that give people access to system-wide functions, helps orient them to the UI, and provides consistency across experiences. It appears across the top of the app frame and should persists across all pages of the app. It can optionally host global commands, like search, settings, notifications, feedback, profile, or help. The name of the app should always be displayed, which should ideally also serve as a clickable link to the home or landing page. The header should be responsive - commands in viewports 600 pixels and below should move into the overflow control. The search input width is also responsive at 1023 pixels and below.

Providing a clear way to navigate throught the app helps users become familiar with the layout and functionality. It helps people jump from section to section of an app. The most common forms of navigation include top navigation and side navigation. The app should not use both top and side navigation simultaneously.
- _Top navigation_ provides links to the main areas of an application or a site. The top nav is always on-screen and can perform as a light version of a side (left) navigation. Top navigation is ideal for apps with screens with 5 pages or less. Common standards include having the default active page as the first menu item, navigation has two to five items (can include groups), and does not use both breadcrumb and top navigation simultaneously.
- The primary navigation for larger business applications is often a _side_ or _left navigation_. Hierarchically, it exists above all other content. It's always present, and may be minimized to a collapsed state (also called a rail state) to free up additional space for page content. At smaller window sizes, it minimizes into a flyout menu. Common standards for side navigation include having the default page as the app's landing page, and using icons for all navigation items (except nested items).

The _content region_ contains the focus of the screen. Changing the size of the browser window affects the content frame and area available in the main content region. The frame adjusts according to the snap point or window size and the responsive story for each component.

Adhering to a consistent design language (color schemes, typography, and layout structure), helps users quickly identify and interact with various elements without confusion. This recall becomes increasingly powerful the more a consistent app frame pattern is established and used throughout all internal business applications, and aligning to industry standards or patterns in common platforms further enhances that effect.

Once the app frame is determined, each screen's layout will reside within the content area of the app frame.

### Thoughtfully utilize the content region

Users crave seamless experiences where information is readily accessible, text is easy to read, and aesthetics enhance rather than hinder usability. Prioritize initial visibility of key information, ensure readability across columns, and harmonize design elements for aesthetic appeal. 

Ensure essential information is immediately visible upon opening the screen without the need for scrolling. Prioritize displaying essential information such as navigation options, crucial content, and actionable items near the top of the screen. Striking the balance between displaying sufficient items and providing detailed information for each poses a perennial challenge. Conversely, while it can be tempting to provide all possible information in the initial view, too much information risks overwhelming users and diluting the significance of key elements. Consider employing concise summaries or previews that offer a glimpse into more detailed content, enticing users to delve deeper. Dashboards are specifically optimized to serve this purpose for visualizing large amounts of data.

Incorporate multiple columns, sections, or groupings to logically organize content and maximize space. Pay meticulous attention to column width, ensuring text remains legible without excessive strain. Avoid overly narrow columns that force users to constantly scroll horizontally, disrupting the flow of interaction. Conversely, excessively wide columns can impede readability, requiring users to track lines across extended distances. Strive for a balance that accommodates comfortable reading while efficiently utilizing available space.

Appropriately size and position visual elements because they contribute to a visually pleasing and cohesive interface. Align captions with corresponding visuals or titles, maintain consistent spacing between elements, and adhere to a hierarchy based on user importance. Trim unnecessary embellishments and allocate pixels judiciously to elements that matter most. Prioritize and emphasize content and navigation elements, particularly on navigation-intensive apps or homepages, while avoiding superfluous ornamentation that detracts from usability. 

Always be mindful of how to effectively maintain readability across varying viewports. Design layouts with flexibility to adapt seamlessly across various screen sizes, catering to both widescreen monitors and smaller devices. Implement the content region with inspiration from established layouts and adaptive techniques to help guide descisions on placing and rearranging elements.

An underlying grid can be useful for arranging elements consistently. The chosen grid behavior should be universal to every screen's content region in the app, and can also be applied at the component level (e.g., cards).

- The _stretch grid_ behavior is characterized by columns and margins that are percentage-based and relative to the viewport size. This allows content to reflow dynamically and maintain balance in the white space around it. Breakpoints can trigger significant layout restructures, with column width being fluid, gutters fixed, and margins fluid except for a fixed margin of 5% of content pixels on the nav's width. An example application of this grid is a dashboard page where dynamic content organization is crucial.
- Conversely, the _fixed grid_ behavior maintains column and gutter widths regardless of the viewport size, while margins stretch as necessary. This provides greater control over content rendering, allowing for centered or left-aligned layouts. In a fixed grid, column width is fixed at 60px, gutters are fixed, and margins are fluid, with adjustments to a hybrid approach often necessary for smaller screens. Although a fully fixed grid is rare due to limitations on smaller screens, it finds application in news pages or structured card layouts. To make fixed grids responsive, elements must be designed in a way that matches
- _Hybrid grids_ are combinations of stretch and fixed grid. Hybrids are often utilized for different segments of the content region. For example, a thinner pane for supplementary information or a filtering experience on the right side of the screen might have fixed grid behavior, while the main content region uses stretch grid.

### Use established layouts and grouping patterns

Utilize commonly recognized structures and arrangements for organizing content and elements within a user interface. These layouts and patterns have been refined and proven effective over time, making them familiar and intuitive to users while also making it easy to implement adaptive patterns. Once core scenarios and elements are identified, map each to an established layout that provides the best interaction. Prioritize content and features important for task completion. Determine which elements should be visible and accessible on the screen at all times and which can be hidden or accessed through secondary menus or interactions.

The following includes a non-exhaustive list of established layouts commonly used for business applications.

- Landing / home screen
- Dashboard
- Form
- Entity / profile view
- List page
- Mini review
- Wizard
- Side pane / panel overlay

<!--- 
Header and Footer Layout: This layout typically consists of a header section at the top of the page, containing branding, navigation menus, and search bars, and a footer section at the bottom, often containing copyright information, links to additional resources, and contact details.

Sidebar Layout: In this layout, a vertical sidebar is positioned on one side of the main content area, providing navigation menus, filters, or additional information that complements the main content displayed in the central area of the page.

Grid Layout: Content is organized into a grid structure with rows and columns, allowing for efficient display of images, text, and other elements. Grid layouts are commonly used for product listings, image galleries, and portfolio showcases.

Hero Banner Layout: This layout features a large, prominently displayed banner or image at the top of the page, often accompanied by a headline and call-to-action button. Hero banners are effective for showcasing key messages, promotions, or featured content.

Card-Based Layout: Content is presented within individual cards or containers, each containing related information or functionality. Card-based layouts are versatile and can be used for displaying articles, products, user profiles, or navigation links.

Full-Screen Layout: Content spans the entire width and height of the screen, creating a visually immersive experience. Full-screen layouts are often used for landing pages, splash screens, or multimedia presentations.

Tabbed Layout: Content is organized into tabs or tabs, allowing users to switch between different sections or categories of information within the same page. Tabbed layouts are useful for conserving screen space and organizing content hierarchically.

Modal Layout: Content is displayed in a modal window that overlays the main page, focusing the user's attention on a specific task or interaction while temporarily dimming the background. Modal layouts are commonly used for alerts, dialogs, and form submissions.
--->

From there, customize and build upon the standard layout to suit specific requirements. This may involve adding or removing elements, adjusting the size and positioning of elements, and applying styling to match the brand identity or visual design guidelines. Experiment with different configurations and variations of the standard layout to find the most effective arrangement for content and overall user experience.

Utilize commonly recognized structures and arrangements for organizing content and elements within a user interface. These layouts and patterns have been refined and proven effective over time, making them familiar and intuitive to users while also making it easy to implement adaptive patterns.

### Use an underlying grid

Once screen layouts are chosen, determine the appropriate grid behavior, which should be universal to every screen in the app.

- The _stretch grid_ behavior is characterized by columns and margins that are percentage-based and relative to the viewport size. This allows content to reflow dynamically and maintain balance in the white space around it. Breakpoints can trigger significant layout restructures, with column width being fluid, gutters fixed, and margins fluid except for a fixed margin of 5% of content pixels on the nav's width. An example application of this grid is a dashboard page where dynamic content organization is crucial.
- Conversely, the _fixed grid_ behavior maintains column and gutter widths regardless of the viewport size, while margins stretch as necessary. This provides greater control over content rendering, allowing for centered or left-aligned layouts. In a fixed grid, column width is fixed at 60px, gutters are fixed, and margins are fluid, with adjustments to a hybrid approach often necessary for smaller screens. Although a fully fixed grid is rare due to limitations on smaller screens, it finds application in news pages or structured card layouts. To make fixed grids responsive, elements must be designed in a way that matches 

### Design for all device classes

In the design considerations, optimize for mobile interactions by using larger touch targets, avoiding hover-dependent interactions, and providing alternative input methods for gestures commonly used on touchscreens.

#### Create a breakpoint matrix

A breakpoint matrix serves as a graphical depiction illustrating the responsive or adaptive behaviors of an application's design across different screen sizes and orientations. It typically presents a structured grid or layout detailing the design's response at various breakpoints. Each segment corresponds to a distinct screen width, offering insights into the design's structure, layout, and functionality. A breakpoint matrix encompasses considerations of screen width, viewport orientation, design elements, layout structure, content presentation, navigation, media, and interactive components to illustrate how a website or app's design responds across different screen sizes and orientations.

### Use adaptive techniques

#### Reposition

#### Resize

#### Reflow

#### Show/hide

#### Re-architect

<!---
#### Prioritize mobile-first design


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
