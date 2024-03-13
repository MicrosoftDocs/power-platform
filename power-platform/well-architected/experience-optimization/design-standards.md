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

Universal patterns and metaphors have been established that the general population of digital products have become accustomed to and expect. Ensuring your design includes these patterns where applicable will make your application easier for users to onboard and use long term, reduce training and support costs, and even potentially mitigate effort required to update or redesign. These practices encompass various aspects of design, including layout composition, navigation structure, information hierarchy, and interaction design. 

Adhering to standard icon metaphors and semantic colors is crucial. Icons should leverage established visual associations to convey functionality quickly and effectively to users. Similarly, semantic colors, such as red for error or green for success, provide immediate visual feedback that aligns with users' expectations and mental models. Following these conventions help reduce cognitive load and enhance usability by fostering a sense of familiarity and comfort.

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

Centralized design system efforts can also host universal media assets such as company logos and other design assets in a repository to enable more widespread rapid development.

Microsoft's Fluent UI is an example of a widely-adopted open-source design system. It can be an effective reference for many design decisions made in Power Apps because all modern controls utilize the components in the Fluent (2) design system. Design systems such as Fluent UI invest a significant amount of research and development effort into creating components to ensure they meet the needs of end users. They are also designed in a way that can be ubiquitous and easily utilized across various digital products and platforms. Each component has specific guidelines to ensure the application aligns with the intended experience. Take advantage of the research-backed knowledge by reviewing the [Fluent 2 guidance](https://fluent2.microsoft.design/).

Avoiding duplicate implementations by sharing increases production efficiency, but more importantly it means that experiences will start coherent, and not drift apart over time. Contributing to shared elements will help keep experiences fresh and reflect expertise from across the organization.  Today, coherence is challenged because components, systems, process, and culture are often not shared, do not reinforce coherence, and make contribution hard. 

#### Conduct design reviews

To ensure that an app meets established UI/UX standards, having resources available to guide the design of user experiences is crucial. Centralized teams should aim to familiarize themselves with basic design standards and best practices. While designers are typically knowledgeable about user experience, project managers can also benefit from learning these skills to contribute effectively to the team.

#### Validate usage of design-related app metadata

While the most effective method to validate an experience is to physically walk through and validate it, there's also the option to programmatically read Power Apps app metadata. While there isn't a set method, some approaches include checking that the correct theme is applied to the app, or verifying whether theme token values are being referenced in legacy controls.

For example, if certain text elements must use certain design tokens, the text component naming could map to a certain value, and the properties of the component should also match to a certain design token mapping.

Scan for the number of elements that are a specific component type that match criteria vs number of those elements that do not (e.g., text components that are not named correctly, or named correctly but not following property value guidelines). For responsive layout enforcement, certain layout containers could map to certain naming conventions and property values (e.g., LayoutWrap)

### Meet accessibility standards to increase user base

Designing with inclusive principles ensures that products are built for a broader audience of users that includes people of all abilities. Inclusive design practice aims to recognize the barriers users with any functional abilities might encounter and create products that facilitate those functions prior to final implementation. Understanding and discussing the aspects of function that can lead to barriers in interaction is necessary to overcome them.

**Types of function**

| Function | Purpose |
| -------- | ------- |
| Cognition |	Our ability to receive, interpret, and process information. This includes attention, awareness, focus, memory, judgment, comprehension, problem solving, and reasoning. A person’s cognition can affect the way they learn - whether it's learning how to use a new device or learning new information in a classroom. Many aspects of cognition affect one another. |
| Mobility |	Our anatomy and muscles give us mobility, and they rely on brain signals which control the muscles. Mobility involves grasps, fine motor skills, coordination, control (voluntary vs. involuntary movement), speed, muscle tone, endurance, posture, and temporary injuries. Mobility can be influenced by situational, temporary, progressive, or permanent conditions. |
| Vision | Our ability to see and understand visual information from our environment to guide thought and movement. Vision is influenced by both physical and neurological factors. Vision limitations include blindness, low vision (partially sighted), decreased acuity, visual field loss, color blindness, photophobia (light sensitivity), bright sunlight impacting readability of text on a screen. |
| Hearing |	Our ability to receive and understand audio from our environment to guide thought and movement. Degrees of hearing loss vary across a wide spectrum, causing different types of barriers to everyday technology use. The temporary and situational examples could be a loud environment or a quiet zone where playing sound is not possible. |
| Voice, speech, and communication | Our ability to communicate (verbally or non-verbally) is essential in expressing wants and needs, forming relationships, conveying information to others, and interacting with our environment. |
| Sensation and perception | Sensation is our ability to detect senses like touch or the positioning of our body. Perception is how the brain processes and communicates these senses. Sensation limitations include vestibular, chronic pain, skin integrity, sensation (hypersensitive and hyposensitive), proprioception.	|

#### Methods of accessing content

There are many ways for a user to access digital content. Besides using mouse and pointer input, users can also access content through use of a keyboard and various assistive technologies. Other environmental settings include functionality such as screen and braille readers, magnifiers, captions, voice-recognition, and high-contrast settings which adapt the experience to the user’s needs.

#### Assistive tools

- _Keyboard._	People who are blind or have a significant visual impairment interact with websites and apps using screen reader software, which reads content and controls aloud using text-to-speech technology. Since people who are blind can’t see the pointer on the screen, they can’t use a standard mouse.
The keyboard works as an alternative input to point-and-click interaction. In addition to supporting the basic set of keyboard commands, screen readers also provide a complex set of keyboard commands. These commands give users a powerful additional set of tools to interact with user interfaces more efficiently.
- _Screen reader._ Screen readers convert digital text into synthesized speech and braille output. They empower users to hear content and navigate with the keyboard. The technology enables people who are blind or who have low vision to use information technology with the same level of independence and privacy as anyone else.
Screen readers are also used by people with certain cognitive or learning disabilities, or users who simply prefer audio content over text. Beyond the web, screen readers also work with documents, spreadsheets, and the user’s operating system.
- _Touch._	Touch targets are largely targeted at people with motor delays, who may have problems tapping the screen. More specifically, touch is designed to help people limit the amount of spurious input from unintended (or unregistered) touches.
- _Dynamic content._ One of the easiest features to implement, and one that provides significant immediate benefits to screen reader users, is landmark roles (ARIA labels). There are eight of these roles, each representing a block of content that occurs commonly on web pages. To use them, simply add a relevant role attribute to an appropriate container within your HTML. Then, screen reader users can quickly jump to that section of the page.

#### Visual styles

To ensure inclusivity for users with varying vision functions, it's crucial to address visual styles such as color, contrast, and text size in product design. This involves ensuring adequate contrast between text and its background, including text on images, icons, and buttons, to improve readability for users with low contrast sensitivity and color blindness. Well-contrasting content enhances readability in various lighting conditions, benefiting all users. 

Standard text should have a contrast ratio of at least 4.5:1 with the background. Larger text, interactive components, and data visualizations, colors must pass a minimum 3:1 contrast ratio with the background color. Status indicators should effectively utilize semantic colors, type, and imagery to convey information, ensuring content can be perceived by all users. Consider supporting high contrast color palette, which normalizes the color palette for displaying content with a contrast ratio of at least 7:1, ensuring visibility and clarity. Providing dark mode is significantly helpful for readability and reducing eye strain.

#### Typography

Typography plays a crucial role in ensuring readability for users with diverse needs. Text must be large enough and adequately spaced to accommodate different users' requirements. Users should have the option to adjust settings such as orientation and zoom levels, with applications seamlessly adapting their content layout accordingly. Well-set typography not only aids in readability but also facilitates page orientation and navigation, benefiting individuals with low vision, cognitive disabilities, colorblindness, or those relying on screen readers.

Headings should feature large or bold text to enable quick scanning and comprehension, particularly for visual users. Properly applied heading elements ensure efficient navigation for all users. Line width and spacing significantly impact readability; excessively wide lines strain the eyes and overly short lines disrupt rhythm and comprehension. Aim for 50 to 70 characters per line and an optimal line height of 120% to 145% of the font size to enhance readability.

On mobile devices, text should be resizable up to 200% without compromising content or functionality. This flexibility ensures that users can adjust text size according to their preferences or needs, enhancing overall accessibility. Furthermore, users should have the ability to zoom in on the interface, with page layouts designed to reflow content seamlessly without horizontal scrolling for zoom levels up to 400%. This ensures that content remains accessible and readable, regardless of the device screen size, and contributes to a more user-friendly experience for all users.

#### Images, graphs, and motion

Images and graphics make content more pleasant and easier to understand for many people, and in particular for those with cognitive and learning disabilities.
They serve as cues that are used by people with visual impairments to orient themselves in the content. However, when images are used extensively on websites and are not accessible can create major barriers for users. 

Accessible practices around media content benefit braille and screen reader users, people who browse with images turned off to save bandwidth, and search engine crawlers. They can also aid people with hearing loss or cognitive disabilities. 

Use Alt text to make visual content accessible. Alt attributes describe visual content. This is the text that is displayed while images are downloading. Adapt alt text to the context of the image. Be concise and informative (up to 150–250 characters). Images that duplicate text content should be marked as decorative.

#### Interaction

Interaction is where accessibility matters the most. If a user is unable to seamlessly move around a product and complete tasks, we are not building an accessible product. Efficient keyboard and touch interaction helps people using screen readers, people using braille readers, and people who navigate using a keyboard. Common interactions include:

- _Navigation._ Assistive technology users get around a web page mostly by tabbing, search, and, in the case of screen readers, using lists of headings and links. Ensure efficient keyboard navigation with landmarks, headings and shortcuts (like skip to main).
- _Hyperlinks._ Usability and accessibility of hyperlinks can be improved by making them clear, concise, and meaningful out of context. Apply sufficient color contrast and differentiate visually from other content.
- _Tables._ Relying on visual cues alone is not sufficient to create an accessible table. With structural markup, headers and data cells can be recognized by the assistive technology.
- _Forms._ Input fields are used for many types of interactions on the web. Accessibility of forms usually concern people who use screen readers or keyboards.
- _Focus._ Focus visibility helps anyone who relies on the keyboard to operate the page, by letting them visually determine what will they interact with. Sometimes focus needs to be moved programatically or trapped inside a surface to provide an optimal experience.
- _State changes._ Specify text for any state change and announcements. Communicating error states and guiding users through error recovery (such as missing information or system issue) is particularly important.

## Power Platform facilitation

- [Building accessible apps in Power Apps](/power-apps/maker/canvas-apps/accessible-apps)
- [Power Apps Accessibility Checker feature](/power-apps/maker/canvas-apps/accessibility-checker)

## Related links

- [WCAG](https://www.w3.org/WAI/standards-guidelines/wcag/)
- [US ADA](https://www.access-board.gov/ada/)
- [EU Accessibility Act](https://ec.europa.eu/social/main.jsp?catId=1202)
- [Accessibility Insights tool](https://accessibilityinsights.io/)

## Experience Optimization checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Experience Optimization checklist](checklist.md)
