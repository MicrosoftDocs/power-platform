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

|[EO:01](checklist.md)| **TODO** Update with checklist details for this item |
|---|---|

This guide describes the recommendations for principles and techniques used to create applications that adapt and respond fluidly to different screen sizes, resolutions, and orientations across various devices, such as desktop computers, laptops, tablets, and smartphones. This approach ensures that users have a consistent and optimal viewing experience regardless of the device they are using.

## Key design strategies

Responsive design is easier for less experienced designers and developers to implement. Adaptive design is handy for updating an application designed for desktop viewports (aka screen sizes) to make it mobile-friendly.

### Prioritize mobile-first design

Responsive design makes web content adapt to different screen and window sizes. Increasing the availability of applications to both web and mobile can increase the overall usage and adoption of the app if it's more convenient to access. In the design considerations, optimize for mobile interactions by using larger touch targets, avoiding hover-dependent interactions, and providing alternative input methods for gestures commonly used on touchscreens.

### Use fluid layouts

Fluid layouts use relative units, such as percentages or ratios, instead of fixed units like pixels. This allows the website to resize and reposition elements based on the screen size of the device being used, letting content reflow and balance the white space around.

### Use a grid structure

The grid is an underlying invisible structure that controls the placement of all elements and content on the page. It makes an app look coherent, enhances visual hierarchy, and balances the design. A flexible grid system helps ensure that your website layout adjusts to different screen sizes.

### Reduce friction

An adaptive design automatically reconfigures the elements on the page. It is better to reduce friction by understanding and removing the unnecessary elements in the page. Organize content to ensure the most important information is displayed prominently and is accessible on smaller screens. This may involve reordering content, collapsing navigation menus into responsive menus, and using progressive disclosure techniques to present content in a user-friendly manner.

### Use adaptive design for complex layouts

Breakpoints are the most essential component to create a responsive design. Breakpoints are specific points or thresholds in the layout of a responsive website or application where the design adapts or "breaks" to accommodate different screen sizes, resolutions, or device orientations. They are key components of responsive design and are strategically placed based on the content, layout, and design requirements of the project.

### Optimize images and fonts

Reduce the file size of high-resolution images for smaller viewports or use portable image types that can easily be scaled, such as SVG. Optimizing your fonts for mobile devices is an absolute necessity if you want your content to be palatable across all screen sizes.

### Create a breakpoint matrix

A breakpoint matrix serves as a graphical depiction illustrating the responsive or adaptive behaviors of an application's design across different screen sizes and orientations. It typically presents a structured grid or layout detailing the design's response at various breakpoints. Each segment corresponds to a distinct screen width, offering insights into the design's structure, layout, and functionality. Consequently, designers can utilize the breakpoint matrix to visually demonstrate the variations in design across viewport sizes. A breakpoint matrix encompasses considerations of screen width, viewport orientation, design elements, layout structure, content presentation, navigation, media, and interactive components to illustrate how a website or app's design responds across different screen sizes and orientations.

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
