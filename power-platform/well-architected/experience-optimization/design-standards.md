---
title: Recommendations for following design standards
description: Learn the importance of adhering to design standards, conventions, and guidelines to enhance user experience and application success.
author: Denise-MSFT
ms.author: demora
ms.reviewer: jhaskett-msft
ms.date: 08/05/2025
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for following design standards

**Applies to this Power Platform Well-Architected Experience Optimization checklist recommendation:**

|[XO:02](checklist.md)| **Follow established standards, conventions, and guidelines. Use common design patterns. Maintain consistency in design elements, terminology, and interactions across the interface. Use consistent patterns and standards to guide users through the interface and create a cohesive user experience.** |
|---|---|

This guide describes the recommendations for establishing design standards, conventions, and best practices to develop user interfaces that enhance the user experience and the application's overall success. Deviation from standards should be carefully considered to avoid negatively affecting the user's experience and application usability.

## Key design strategies

Following design standards helps reduce decision-making effort in the design process by identifying the important aspects of design. Understanding the standards itemizes and streamlines a team's ability to achieve well-designed user interfaces. This approach results in faster development cycles, improved usability, and enhanced user satisfaction, ultimately leading to increased productivity and effectiveness for internal software systems.

### Understand design principles

Extensive research into human cognition informs our understanding of visual design and interaction with digital products. This knowledge underpins many best practices and standards, accounting for approximately 80% of the final product. Design principles can bridge the remaining 20% creative gap not covered by standards. Familiarity with this knowledge enhances the development team's understanding of design considerations during planning, reducing dependency on, or improving collaboration with, design resources.

### Follow common patterns and metaphors

Universal patterns and metaphors are widely recognized and expected in digital products. Incorporating these patterns where appropriate can simplify user onboarding and long-term use, reducing training and support costs, and potentially lessening the need for updates or redesigns. These practices span various aspects of design, including layout composition, navigation structure, information hierarchy, and interaction design.

Adhering to standard icon metaphors and semantic colors is crucial. Icons should use established visual associations to convey functionality quickly and effectively to users. Similarly, semantic colors, such as red for error or green for success, provide immediate visual feedback that aligns with users' expectations and mental models. Following these conventions helps reduce cognitive load and enhances usability by fostering a sense of familiarity and comfort.

### Establish a design system

A design system is a collection of reusable functional building blocks used to build a user interface. They are designed specifically for an organization so that every element aligns with the brand's established standards. The four key components of a design system are design tokens, components, pattern libraries, and guidelines.

*Design tokens* are fundamental visual elements of a user interface, including aspects like color, typography, and spacing. They're expressed as variables in a standard format, facilitating the creation and maintenance of an application using the design system. Regardless of the specific design, design tokens streamline the translation of design into code. For instance, by defining a token named "primary-color" with a designated value, developers can integrate the design seamlessly using the token instead of embedding a specific value directly into the code. The design tokens can be aligned with an organization's style guide and centrally managed to produce easy-to-use tokens.

A *component* represents a discrete, modular unit of a user interface. It serves as a visual element to assemble app interfaces. Well-designed components exhibit two key characteristics: reusability and modularity. They should be engineered to ensure that they maintain visual consistency across multiple applications within a brand's ecosystem, reducing the need to recreate the design each time. A single component should seamlessly serve in multiple contexts.

Power Apps provides a comprehensive set of basic universal components, like buttons and dropdown lists, and composite components, like the modern table. Use these controls as much as possible for basic needs, then consider building composite components where gaps exist for repeatable user interface patterns.

Composite components should be versatile enough to be used as-is or with slight variations (through parameters) across different app contexts, without the need for modifications. Some examples of custom components include:

- A company-branded header or footer
- A screen-sized resource page component for users to provide feedback and get IT help
- Universal content like copyright notices or links

A *pattern library* offers a set of predefined design patterns for makers to use as a starting point to construct user interfaces. These patterns serve as standardized solutions to common design challenges. The primary objective of a pattern library is to offer a centralized collection of well-crafted patterns, enabling the creation of consistent and effective user interfaces. Pattern libraries empower developers to use a specific pattern and follow established guidelines for usage, ensuring coherence and efficiency across user interface designs.

*Guidelines* offer rules and best practices for project teams on how to use components and visual styles effectively. Unlike style guidelines, which focus on aesthetics, design system guidelines define the functional behavior of components and user interaction expectations. For example, if a design system provides a design token set for referencing colors, the guidelines should clarify when to use these colors and how developers can access the corresponding color in Power Apps. For components, there should be documentation on correct usage, input and output parameters, and state variations that can be expected of the component.

Centralized design system efforts can also host universal media assets such as company logos and other design assets in a repository to enable widespread rapid development.

Microsoft's Fluent UI is an example of a widely adopted open-source design system. It can be an effective reference for many design decisions made in Power Apps because all modern controls use the components in the Fluent (2) design system. Design systems such as Fluent UI are the result of a significant amount of research and development effort into creating components to ensure that they meet users' needs. They're also designed in a way that can be ubiquitous and easily used across various digital products and platforms. Each component has specific guidelines to ensure that the application aligns with the intended experience. Take advantage of the research-backed knowledge by reviewing the [Fluent 2 guidance](https://fluent2.microsoft.design/).

Sharing to avoid duplicate implementations not only boosts production efficiency but also ensures that experiences remain coherent over time. Contributions to shared elements help keep experiences fresh and reflect expertise from across the organization. Currently, coherence is a challenge because components, systems, processes, and culture are often not shared, don't promote coherence, and make contributions difficult.

#### Conduct design reviews

Access to resources meant to guide user experience design is crucial to ensure that an app meets established UI/UX standards. Centralized teams should aim to familiarize themselves with basic design standards and best practices. While designers are typically knowledgeable about user experience, project managers can also benefit from learning these skills to contribute effectively to the team.

#### Validate use of design-related app metadata

The most effective way to validate an experience is to physically walk through it. However, you can also programmatically read Power Apps app metadata. Methods to accomplish this might include checking that the correct theme is applied to the app, or verifying that theme token values are referenced in legacy controls. For example, if specific text elements must use certain design tokens, the text component's name could correspond to a particular value, and the component's properties should then match a specific design token mapping.

Evaluate the number of elements that are a specific component type and meet certain criteria versus those that don't. For example, consider text components that are either incorrectly named or correctly named but don't follow property value guidelines. For enforcing responsive layout, certain layout containers could map to specific naming conventions and property values (such as LayoutWrap).

### Meet accessibility standards to increase the user base

Incorporating inclusive design principles ensures that products cater to a diverse audience, including individuals of all abilities. Inclusive design seeks to identify potential barriers for users of all abilities to create products that address challenges before final implementation. It's essential to understand and discuss the functional aspects that could lead to interaction barriers to effectively overcome them.

| Function | Purpose |
| -------- | ------- |
| Cognition | Our ability to receive, interpret, and process information is influenced by many factors. These factors include attention, awareness, focus, memory, judgment, comprehension, problem solving, and reasoning. A person's cognition can affect the way they learn, whether learning how to use a new device or learning new information in a classroom. Many aspects of cognition affect one another. |
| Mobility | Our anatomy and muscles give us mobility, and they rely on brain signals, which control muscles. Mobility involves grasp, fine motor skills, coordination, control (voluntary vs. involuntary movement), speed, muscle tone, endurance, posture, and temporary injuries. Mobility can be influenced by situational, temporary, progressive, or permanent conditions. |
| Vision | Our ability to see and understand visual information from our environment guides thought and movement. Vision is influenced by both physical and neurological factors. Vision limitations include blindness, low vision (partially sighted), decreased acuity, visual field loss, color blindness, photophobia (light sensitivity), and even bright sunlight impacting readability of text on a screen. |
| Hearing | Our ability to receive and understand audio from our environment also guides thought and movement. Degrees of hearing loss vary across a wide spectrum, leading to barriers to everyday technology use. Temporary or situational examples include loud environments or quiet zones where sound playback isn't possible. |
| Voice, speech, and communication | Our ability to communicate (verbally or non-verbally) is essential to expressing our wants and needs, forming relationships, conveying information to others, and interacting with our environment. |
| Sensation and perception | Sensation is our ability to detect senses like touch or the positioning of our body. Perception is how the brain processes and communicates these senses. Sensation limitations include vestibular disorders, chronic pain, skin integrity, sensation (hypersensitive and hyposensitive), and proprioception. |

#### Methods of accessing content

Users access digital content in various ways. In addition to mouse and pointer input, they might also use keyboard and assistive technologies like screen and braille readers, magnifiers, captions, voice recognition, and high-contrast settings, all of which adapt the experience to meet the user's needs.

#### Assistive tools

Common assistive tools include:

- *Keyboard*: People with visual impairments interact with websites and apps using screen reader software, which reads content and controls aloud using text-to-speech technology and uses the keyboard as an alternative input to point-and-click interaction with a standard mouse. In addition to supporting the basic set of keyboard commands, screen readers also provide a complex set of keyboard commands. These commands give users a powerful additional set of tools to interact with user interfaces more efficiently.

- *Screen reader*: Screen readers convert digital text into synthesized speech and braille output. They empower users to hear content and navigate with the keyboard. This technology enables individuals with blindness or low vision to use information technology with the same level of independence and privacy as any other user. Screen readers are also used by individuals with cognitive or learning disabilities, and by users who simply prefer audio content over text. These tools extend beyond web use, aiding in the navigation of documents, spreadsheets, and operating systems.

- *Touch*: Touch targets are largely targeted at people with motor delays, who might have problems tapping the screen. More specifically, touch is designed to help people limit the amount of spurious input from unintended (or unregistered) touches.

- *Dynamic content*: Landmark roles, or ARIA labels, offer immediate benefits to screen reader users. There are eight roles, each representing a block of content that occurs commonly on web pages. To use them, add the relevant role attribute to a suitable container in your HTML, enabling screen reader users to quickly navigate to that section of the page.

#### Visual styles

To create inclusive products for users with different vision capabilities, it's essential to consider visual styles like color, contrast, and text size. This involves ensuring adequate contrast between text and its background, including text on images, icons, and buttons, to improve readability for users with low contrast sensitivity or color blindness. Well-contrasting content enhances readability in various lighting conditions, benefiting all users.

Standard text should maintain a contrast ratio of at least 4.5:1 with the background. For larger text, interactive components, and data visualizations, a minimum contrast ratio of 3:1 with the background color is required. Status indicators should use semantic colors, type, and imagery effectively to convey information, ensuring that content can be perceived by all users. Consider supporting a high-contrast color palette, which normalizes the color palette for displaying content with a contrast ratio of at least 7:1, ensuring visibility and clarity. Offering a dark mode can significantly improve readability and reduce eye strain.

#### Typography

Typography plays a crucial role in ensuring readability for users with diverse needs. Text must be large enough and adequately spaced to accommodate differing user requirements. Users should be able to adjust settings such as orientation and zoom levels, with applications seamlessly adapting their content layout accordingly. Well-set typography not only aids in readability but also facilitates page orientation and navigation, benefiting individuals with low vision, cognitive disabilities, and color blindness, and those relying on screen readers.

Headings should feature large or bold text to enable quick scanning and comprehension, particularly for visually oriented users. Properly applied heading elements ensure efficient navigation for all users. Line width and spacing significantly impact readability; for example, excessively wide lines strain the eyes while overly short lines disrupt rhythm and comprehension. Aim for a line length of 50 to 70 characters and a line height that is 120% to 145% of the font size to enhance readability.

On mobile devices, text should be resizable up to 200% without compromising content or functionality. This flexibility ensures that users can adjust text size according to their preferences or needs, enhancing overall accessibility. Furthermore, users should have the ability to zoom in on the interface, with page layouts designed to reflow content seamlessly without horizontal scrolling for zoom levels up to 400%. Ensuring that content remains accessible and readable, regardless of the device screen size, contributes to a more user-friendly experience for all users.

#### Images, graphics, and motion

Images and graphics make content more pleasant and easier to understand for many people, and in particular for those with cognitive and learning disabilities. While images can serve as cues for people with visual impairments, helping orient them within the content, extensive use on websites can create major barriers for users.

Accessible practices around media content benefit braille and screen reader users, users who browse with images turned off to save bandwidth, and search engine crawlers. They can also aid people with hearing loss or cognitive disabilities.

Use alt text to make visual content accessible. Alt attributes describe visual content, for example, text that is displayed while images are downloading. Adapt alt text to the context of the image. Be concise and informative (use from 150 to 250 characters). Remember to mark images that duplicate text content as decorative.

#### Interaction

Interaction is where accessibility matters the most. If a user can't navigate a product smoothly and complete tasks, the product isn't truly accessible. Efficient keyboard and touch interactions assist users of screen readers, braille readers, and those who navigate using a keyboard. Typical interactions include:

- *Navigation*: Assistive technology users navigate a web page by tabbing, search, and, in the case of screen readers, using lists of headings and links. Ensure efficient keyboard navigation with landmarks, headings, and shortcuts like "skip to main content".

- *Hyperlinks*: Usability and accessibility of hyperlinks can be improved by making them clear, concise, and meaningful out of context. Apply sufficient color contrast and visually differentiate from other content.

- *Tables*: Relying on visual cues alone isn't sufficient to create an accessible table. Structural markup allows assistive technology to recognize headers and data cells.

- *Forms*: Input fields, used for various web interactions, often raise accessibility concerns for individuals who use screen readers or keyboards.

- *Focus*: Focus visibility helps users who rely on the keyboard to navigate the page, by visually indicating the element they interact with next. Sometimes focus needs to be moved programmatically or limited to a specific area to optimize the experience.

- *State changes*: Specify text for any state change and announcements. Communicating error states and guiding users through error recovery, such as missing information or a system issue, is critical.

## Power Platform facilitation

Modern controls are available both for [canvas apps](/power-apps/maker/canvas-apps/controls/modern-controls/overview-modern-controls) and [model-driven apps](/power-apps/user/modern-fluent-design).

Canvas apps support [modern theming](/power-apps/maker/canvas-apps/controls/modern-controls/modern-theming), allowing you to implement a consistent brand palette across all controls in the app. Model-driven apps support [themes](/power-apps/maker/model-driven-apps/create-themes-organization-branding) to modify basic branding elements like app header colors, links, and some form icons.

Reusable, solution-aware components are available in multiple forms for various app types. [Custom canvas components](/power-apps/maker/canvas-apps/create-component) can be used in canvas apps or custom pages and are built using low code. The [Power Apps component framework](/power-apps/developer/component-framework/overview) can be used to implement code components for canvas apps, model-driven apps, and [Power Pages](/power-pages/configure/component-framework-tutorial).

Canvas apps support [accessible properties](/power-apps/maker/canvas-apps/controls/properties-accessibility) that map to specific assistive technology functions. Use [in-studio tooling](/power-apps/maker/canvas-apps/accessibility-checker) to validate accessibility compliance.

While model-driven apps are accessible without configuration, ensure that all [web resources added to the app are accessible](/power-apps/developer/model-driven-apps/create-accessible-web-resources). Embedded canvas experiences, including [custom pages](/power-apps/maker/model-driven-apps/model-app-page-overview), must be manually configured to meet accessibility standards.

Model-driven apps provide built-in [standard keyboard shortcuts for navigating forms and views](/power-apps/user/screen-reader).

Canvas apps require code components to enable keyboard shortcuts, which can be configured using Creator Kit's [keyboard shortcuts](/power-platform/guidance/creator-kit/keyboardshortcuts).

## Related information

- [Designing and building accessible canvas apps in Power Apps](/power-apps/maker/canvas-apps/accessible-apps)
- [Accessibility limitations in canvas apps](/power-apps/maker/canvas-apps/accessible-apps-limitations)
- [Power Apps Canvas App Accessibility Guidelines whitepaper](https://powerapps.microsoft.com/en-us/blog/powerapps-canvas-app-accessibility-guidelines/)
- [Use a screen reader in model-driven apps](/power-apps/user/screen-reader)
- [Web Content Accessibility Guidelines (WCAG) standard)](https://www.w3.org/WAI/standards-guidelines/wcag/)
- [Microsoft Inclusive Design](https://inclusive.microsoft.design/)
- [Fluent UI accessibility guidance](https://fluent2.microsoft.design/accessibility)

## Experience Optimization checklist

> [!div class="nextstepaction"]
> [Experience Optimization checklist](checklist.md)
