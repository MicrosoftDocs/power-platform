---
title: Recommendations for following design standards
description: Learn how to follow design standards to ensure consistent success with user experience optimization.
author: RobStand
ms.author: rstand
ms.reviewer: robstand
ms.date: 01/31/2024
ms.subservice: guidance
ms.topic: conceptual
---

# Recommendations for following design standards, conventions, and guidelines

**Applies to this Power Well-Architected Experience Optimization checklist recommendation:**

|[EO:01](checklist.md)| **TODO** Update with checklist details for this item |
|---|---|

This guide shows how to apply established design standards, conventions, and best practices to develop user interfaces that are effective and professional, enhancing the user experience and the application’s overall success. Deviating from standards may be needed in certain circumstances but should be carefully thought through to avoid negatively affecting the user's experience and ensure optimal outcomes.

## Key design strategies

Following design standards helps reduce decision-making effort in the design process by identifying the important aspects of design that should be considered. Understanding the standards itemize and streamline a team's ability to achieve well-designed user interfaces. This results in faster development cycles, improved usability, and enhanced user satisfaction, ultimately leading to increased productivity and effectiveness for internal software systems.

### Understand design principles

Certain truths about human cognition have been heavily researched and help make informed decisions about visual design and how people interact with digital products. This knowledge supports many of the specific best practices and standards, which may only provide solutions for about 80% of the final product. Design principles can help bridge the remaining 20% creative gap that doesn’t have a clear-cut answer available from standards. Getting familiar with this knowledge helps development teams understand design considerations when planning and can reduce dependency on, or improve collaboration with, design resources.

### Follow common patterns and metaphors

Universal patterns and metaphors have been established that the general population of digital products have become accustomed to and expect. Ensuring your design includes these patterns where applicable will make your application easier for users to onboard and use long term, reduce training (or support) costs, and even potentially reduce effort that might be required to update the design.

### Establish a design system

A design system is a collection of reusable functional building blocks used to build a user interface. They are designed specifically for an organization so that every element aligns with the brand's established standards. The four key components of a design system are design tokens, components, pattern libraries, and guidelines.

_Design tokens_ are fundamental visual elements of a user interface, including aspects like color, typography, and spacing. They are expressed as variables in a standard format, facilitating the creation and maintenance of an app using the design system. Regardless of the specific design, design tokens streamline the translation of design into code. For instance, by defining a token named "primary-color" with a designated value, developers can integrate the design seamlessly. Instead of embedding specific values directly into the code, they utilize these tokens. The design tokens can be aligned with an organization's style guide and centrally managed to produce easy to use tokens.

A _component_ represents a discrete, modular unit of a user interface. It serves as a visual element to assemble app interfaces. Well-designed components exhibit two key characteristics—reusability and modularity. They should be engineered to ensure they maintain visual consistency across multiple applications within a brand's ecosystem, thereby reducing the need to recreate the design each time. A single component should seamlessly serve in various contexts. 

Power Apps provides a comprehensive set of basic universal components, like button, dropdown, and several composite components, like the modern table. Use these controls as much as possible for basic needs, then consider building composite components where gaps exist for repeatable user interface patterns.

Composite components should be able to be used exactly as-is or with minimal variation (using parameters) in different app contexts and should not need to be modified. Some examples of custom components could include the following: 
- A company-branded header or footer. 
- A screen-sized resource page component for users to provide feedback and get IT help
- Universal content like copyright notices or links

_Pattern library_. Offer a set of predefined design patterns for makers to utilize that help as a starting point to construct user interfaces. These patterns serve as standardized solutions to common design challenges. The primary objective of a pattern library is to offer a centralized collection of well-crafted patterns, enabling the creation of consistent and effective user interfaces. It empowers developers to use a specific pattern and follow established guidelines for their usage, thereby ensuring coherence and efficiency across user interface designs.

_Guidelines_ provide rules and best practices for project teams regarding the utilization of components and visual styles. Unlike style guidelines, which focus on aesthetics, design system guidelines define the functional behavior of components and user interaction expectations. For example, if a design system provides a design token set for referencing colors, the guidelines should provide insight into when the colors should be used, and how the developer can access the corresponding color in Power Apps. For components, there should be documentation on correct usage, input and output parameters, and state variations that can be expected of the component.

Centralized teams can also host universal media assets such as company logos and other design assets in a repository to enable more widespread rapid development.

Microsoft's Fluent UI is an example of a widely-adopted open-source design system. It can be an effective reference for many design decisions made in Power Apps because all modern controls utilize the components in the Fluent (2) design system.

**Conduct design reviews**

To ensure that an app meets established UI/UX standards, having resources available to guide the design of user experiences is crucial. Centralized teams should aim to familiarize themselves with basic design standards and best practices. While designers are typically knowledgeable about user experience, project managers can also benefit from learning these skills to contribute effectively to the team.

**Validate usage of design-related app metadata**

While the most effective method to validate an experience is to physically walk through and validate it, there's also the option to programmatically read Power Apps app metadata. While there isn't a set method, some approaches include checking that the correct theme is applied to the app, or verifying whether theme token values are being referenced in legacy controls.

For example, if certain text elements must use certain design tokens, the text component naming could map to a certain value, and the properties of the component should also match to a certain design token mapping.

Scan for the number of elements that are a specific component type that match criteria vs number of those elements that do not (e.g., text components that are not named correctly, or named correctly but not following property value guidelines). For responsive layout enforcement, certain layout containers could map to certain naming conventions and property values (e.g., LayoutWrap)

### Follow component design guidelines

Design systems such as Fluent UI invest a significant amount of research and development effort into creating components to ensure they meet the needs of end users. They are also designed in a way that can be ubiquitous and easily utilized across various digital products and platforms. Each component has specific guidelines to ensure usage is in line with the intension, to take advantage of the consistent nature components offer.

### Design accessibility 


## Power Platform facilitation

- Refer to the Fluent UI design system for higher level guidance on design principles that apply to the modern controls in Power Apps.
- Refer to the Power Apps design standards documentation for lower level guidance

## Experience Optimization checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Experience Optimization checklist](checklist.md)
