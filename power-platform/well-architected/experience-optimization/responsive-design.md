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
| Viewport | Visible portion of a digital interface, such as a web browser or mobile app, where content is displayed. Viewport ranges are often associated with device classes (mobile, tablet, and desktop) based on screen dimensions and resolutions. |
| Breakpoints | Specific pixel values that define viewport ranges used to determine adaptive layout behavior. |

## Key design strategies

Responsive layouts ensure an efficient, adaptable user experience across various window sizes, achieving equal information access through content scaling, rearrangement, and selective display of text and images, meeting people's needs irrespective of screen size.

### Determine a consistent app frame

The app frame is made from a set of controls that are available on every screen in a consistent manner. It's composed of three main subcomponents; a header, navigation, and a content region. Simple apps have the flexibility to use the header component while more sophisticated apps commonly leverage side navigation to enable many pages. Subcomponents are also customizable, meaning, for example, using global search in header, or grouping items in the side navigation can optionally be tailored to the needs of your app.

The _header_ is a core component designed to be a part of every internal application. It consists of a variety of sub-components that give people access to system-wide functions, helps orient them to the UI, and provides consistency across experiences. It appears across the top of the app frame and should persists across all pages of the app. It can optionally host global commands, like search, settings, notifications, feedback, profile, or help. The name of the app should always be displayed, which should ideally also serve as a clickable link to the home or landing page. The header should be responsive - commands in viewports 600 pixels and below should move into the overflow control. The search input width is also responsive at 1023 pixels and below.

Providing a clear way to navigate throught the app helps users become familiar with the layout and functionality. It helps people jump from section to section of an app. The most common forms of navigation include top navigation and side navigation. The app should not use both top and side navigation simultaneously.
- _Top navigation_ provides links to the main areas of an application or a site. The top nav is always on-screen and can perform as a light version of a side (left) navigation. Top navigation is ideal for apps with screens with 5 pages or less. Common standards include having the default active page as the first menu item, navigation has two to five items (can include groups), and does not use both breadcrumb and top navigation simultaneously.
- The primary navigation for larger business applications is often a _side_ or _left navigation_. Hierarchically, it exists above all other content. It's always present, and may be minimized to a collapsed state (also called a rail state) to free up additional space for page content. At smaller window sizes, it minimizes into a flyout menu. Common standards for side navigation include having the default page as the app's landing page, and using icons for all navigation items (except nested items).

The _content region_ contains the focus of the screen. Changing the size of the browser window affects the content frame and area available in the main content region. The frame adjusts according to breakpoint and the associated responsive story for each component. This is discussed further in the breakpoint matrix section below.

Adhering to a consistent design language (color schemes, typography, and layout structure), helps users quickly identify and interact with various elements without confusion. This recall becomes increasingly powerful the more a consistent app frame pattern is established and used throughout all internal business applications, and aligning to industry standards or patterns in common platforms further enhances that effect.

Once the app frame is determined, each screen's layout will reside within the content area of the app frame.

### Thoughtfully utilize the content region

Users crave seamless experiences where information is readily accessible, text is easy to read, and aesthetics enhance rather than hinder usability. Prioritize initial visibility of key information, ensure readability across columns, and harmonize design elements for aesthetic appeal. 

Ensure essential information is immediately visible upon opening the screen without the need for scrolling. Prioritize displaying essential information such as navigation options, crucial content, and actionable items near the top of the screen. Striking the balance between displaying sufficient items and providing detailed information for each poses a perennial challenge. Conversely, while it can be tempting to provide all possible information in the initial view, too much information risks overwhelming users and diluting the significance of key elements. Consider employing concise summaries or previews that offer a glimpse into more detailed content, enticing users to delve deeper. Dashboards are specifically optimized to serve this purpose for visualizing large amounts of data.

Incorporate multiple columns, sections, or groupings to logically organize content and maximize space. Pay meticulous attention to column width, ensuring text remains legible without excessive strain. Avoid overly narrow columns that force users to constantly scroll horizontally, disrupting the flow of interaction. Conversely, excessively wide columns can impede readability, requiring users to track lines across extended distances. Strive for a balance that accommodates comfortable reading while efficiently utilizing available space.

Size and position visual elements appropriately to create a visually pleasing and balanced interface. Align captions with corresponding visuals or titles, maintain consistent spacing between elements, and adhere to a hierarchy based on user importance. Trim unnecessary embellishments and allocate pixels judiciously to elements that matter most. Prioritize and emphasize content and navigation elements, particularly on navigation-intensive apps or homepages, while avoiding superfluous ornamentation that detracts from usability. 

An underlying grid can be useful for arranging elements consistently. The chosen grid behavior should be universal to every screen's content region in the app, and can also be applied at the component level (e.g., cards).

- The _stretch grid_ behavior is characterized by columns and margins that are percentage-based and relative to the viewport size. This allows content to reflow dynamically and maintain balance in the white space around it. Breakpoints can trigger significant layout restructures, with column width being fluid, gutters fixed, and margins fluid except for a fixed margin of 5% of content pixels on the nav's width. An example application of this grid is a dashboard page where dynamic content organization is crucial.
- Conversely, the _fixed grid_ behavior maintains column and gutter widths regardless of the viewport size, while margins stretch as necessary. This provides greater control over content rendering, allowing for centered or left-aligned layouts. In a fixed grid, column width is fixed at 60px, gutters are fixed, and margins are fluid, with adjustments to a hybrid approach often necessary for smaller screens. Although a fully fixed grid is rare due to limitations on smaller screens, it finds application in news pages or structured card layouts.
- _Hybrid grids_. A more complex layout may require a combination of stretch and fixed grid behavior using both techniques. For example, a supplementary information pane (e.g., a filtering experience) on the right side of the screen might have fixed grid behavior, while the main content region uses stretch grid. Further swapping of grid behavior can be determined for each screen region using breakpoints (e.g., smaller viewports for mobile determine stretch grid behavior for all screen segments).

### Use established layouts and grouping patterns

Utilize commonly recognized structures and arrangements for organizing content and elements within a user interface. These layouts and patterns have been refined and proven effective over time, making them familiar and intuitive to users while also making it easy to implement adaptive patterns. Once core scenarios and elements are identified, map each to an established layout that provides the best interaction. Prioritize content and features important for task completion. Determine which elements should be visible and accessible on the screen at all times and which can be hidden or accessed through secondary menus or interactions.

The following includes a non-exhaustive list of established layouts commonly used for business or productivity applications. These can all occur in the main content region.

- _Landing / Home screen._ Serves as the entry point to an application, providing users with an overview of its offerings or features. It's ideal for welcoming users, offering quick access to key functionalities, navigation options, or calls to action, and setting the tone for the app's experience. Prioritize clarity, simplicity, and intuitive navigation to guide users effectively.
- _Dashboard._ A centralized hub within an application that presents users with a comprehensive overview of relevant data or information. It often consists of customizable widgets or modules, allowing users to monitor specific metrics or perform actions. Dashboards are suited for applications with complex datasets or multifaceted functionalities, enabling users to track progress, analyze trends, and make informed decisions at a glance. They are particularly useful in analytics platforms, project management tools, and financial management apps.
- _Form._ A structured layout that facilitates data input from users. Typically comprised of fields for entering various types of information, such as text, numbers, dates, and selections. Forms are essential for collecting user input, processing transactions, and facilitating interactions within applications. They are commonly employed in registration flows, checkout processes, data entry tasks, and any scenario requiring user input or feedback.
- _Entity / profile view._ Presents detailed information about a specific entity, such as a user profile, product listing, or content item. It typically includes descriptive text, multimedia elements, and relevant actions or interactions. They're well-suited for showcasing detailed information about items within an application. They provide users with in-depth insights, facilitate decision-making, and support engagement with specific entities, such as user profiles in social networking apps or product listings in e-commerce platforms.
- _List page._ Displays a collection of items or entities in a structured format, often presented in a linear or grid layout. It typically includes brief summaries or previews of each item, along with navigation controls for browsing or filtering. List pages are effective for presenting large sets of content or data in a digestible format, enabling users to scan, search, and navigate efficiently. It should be clear how to take action on specific rows if enabled. They are commonly used in content management systems, directory listings, search results, and news feeds.
- _Mini review._ (Slit-screen) Divides the interface into two distinct sections, with a list displayed on the left side and an item view on the right side. The list typically contains a collection of items, while the item view provides detailed information about the selected item from the list. This layout is particularly effective in scenarios where users need to browse through a list of items quickly and view detailed information about each item simultaneously, such as performing bulk operations. Product catalogs, document management systems, email or communication clients, and task management tools (e.g., Azure Dev Ops query viewer) are scenarios that typically fit this pattern.
- _Wizard._ Guides users through a series of sequential steps or tasks, typically in a linear fashion, to complete a complex process or achieve a specific goal. It often includes progress indicators, prompts, and validation checks. Wizards are beneficial for simplifying complex processes, reducing cognitive overload, and guiding users through unfamiliar tasks or workflows. They are commonly utilized in onboarding flows, setup processes, multi-step forms, and task-based interactions, such as configuring complex settings or transactions.

The content region can optionally contain several sub-regions that are available for consistent element placement:
- Page header
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

### Design layouts for all devices

Layouts are a culmination of defined rules and intentional organization of content. Bringing your content into thoughtful structures is key, but making it all flow together with a clear hierarchy across platforms and screen sizes requires scaling logic. Individually, adaptive and responsive design can each address this challenge. In some cases, a mix of adaptive and responsive design is the right choice.

_Responsive design_ uses just one layout where the content is fluid and can adapt to changing format size. This design technique uses media queries to inspect a given device’s characteristics and renders content accordingly. Responsive design allows you to build a feature one time and expect it to work across all screen sizes.

An _adaptive layout_ is one that changes entirely based on the format it’s presented in. Adaptive design has multiple fixed layout sizes and triggers the browser to load a given layout created based on the available space. Sites built with adaptive design use media queries to read breakpoints similar to responsive design, and additional markup based on the device’s capabilities. This process is known as “progressive enhancement.”

#### Reposition

Alter the position of page elements. 

Keep your content organized, readable, and balanced by optimizing the composition as window size increases. For example, vertically stacked elements on a mobile viewport can be repositioned horizontally on larger viewports to follow a natural left to right reading order, create balance in the design, and retain visual focus on important page elements.

#### Resize

Adjust the size and margins of page elements

Resize page elements to optimize for a rich user experience by displaying more content at the top of the window and reduce vertical scrolling. Adjust page margins to add white space and balance to the composition. This allows the content to breathe resulting in a more visually appealing design. For example, a hero component can stretch to the full width of the window to show more of the background image. Content underneath the photo can also stretch to show more but uses different margins to add variety in the composition and helps to define visual hierarchy.

#### Reflow

Optimize the flow of page elements.

Reflow optimizes page elements so they can be fully rendered considering the window size and its orientation by rearranging the content. For example, a single column of content in a smaller window can be reflowed on a larger window to display two columns of text. This allows more content to be displayed "above the fold".

#### Show/hide

Optimize content for the window size and its orientation.

Show or hide page elements to optimize content for the window size and its orientation. This responsive technique gives users the right amount of information and optimal user experience based on how they are viewing it. For example, categories appearing on a small screen show limited meta data like an image, title, and link so more of them can be seen and help the user focus. On a larger screen, categories can show additional meta data like a persona, date, and short description and can still be seen in the view port.

#### Re-architect

Fork or collapse page elements and content to retain focus on important info and actions.

This is similar to following the practice of “progressive disclosure” in your design but for different window sizes and orientation. In this example, expanding the window allows a list of items to be displayed next to the details which helps to visually link the content and let the user easily choose another item. On the smaller screen, focus remains on displaying key info.

#### Create a breakpoint matrix

A breakpoint matrix serves as a graphical depiction illustrating the responsive or adaptive behaviors of an application's design across different screen sizes and orientations. It typically presents a structured grid or layout detailing the design's response at various breakpoints. Each segment corresponds to a distinct screen width, offering insights into the design's structure, layout, and functionality. A breakpoint matrix encompasses considerations of screen width, viewport orientation, design elements, layout structure, content presentation, navigation, media, and interactive components to illustrate how a website or app's design responds across different screen sizes and orientations.

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
