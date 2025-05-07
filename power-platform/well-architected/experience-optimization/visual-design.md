---
title: Recommendations for optimizing user perception and aesthetics
description: Learn how to optimize user perception and aesthetics to guides users' attention to important elements and optimize the user experience.
author: Denise-MSFT
ms.author: demora
ms.reviewer: jhaskett-msft
ms.date: 05/10/2024
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for optimizing user perception and aesthetics

**Applies to this Power Platform Well-Architected Experience Optimization checklist recommendation:**

|[XO:07](checklist.md)| **Apply classic design principles to visual elements such as color schemes, typography, and layout. Strive for a focused, balanced, and intuitive visual hierarchy that guides users' attention to important elements and actions.** |
|---|---|

This guide describes the recommendations for universal visual design patterns that affect user perception, which can significantly influence satisfaction and adoption of an application. Visual elements serve as the foundational building blocks used to create experiences. Applying visual principles that align with how humans naturally perceive and process information provides structured methods to help select and arrange visual elements to create an effective and appealing application.

## Key design strategies

Extensive research on human perception of visual design reveals that users don't view visual elements in isolation. Instead, they perceive them in relation to other elements and the context in which they appear. These relationships influence user perception, drawing attention to specific areas, eliciting emotions, aiding understanding, enhancing aesthetics, and strengthening brand identity. Careful selection and arrangement of visual elements can create engaging, memorable, and effective user experiences that resonate with the target audience.

### Aesthetic-usability effect

The *aesthetic-usability effect* refers to the tendency to consider attractive products as more usable. Users form an initial opinion about an application within approximately 50 milliseconds. This first impression is influenced by various factors, including structure, colors, spacing, symmetry, text quantity, and fonts. A positive first impression can enhance overall user satisfaction. Research shows that users are more forgiving of minor usability issues when they find an interface visually appealing. Additionally, the design quality can serve as an indicator of credibility.

### Balance and weight

Visual balance represents a sense of equilibrium and harmony in visual perception. It helps users process and organize visual information more efficiently by reducing cognitive strain. Balanced compositions are generally perceived as more pleasing and easier to comprehend, allowing users to focus attention effectively and navigate visual stimuli with greater ease. This cognitive aspect of visual balance underscores its importance in facilitating clear communication and enhancing the overall user experience.

A composition is balanced when all the elements are in optical equilibrium. Often, the mathematical placement requires adjustment. Some of the elements that affect the visual weight are size, color, density, and white space.

- *Size*: Larger elements tend to carry more visual weight than smaller ones. To achieve balance, larger elements can be counterbalanced by grouping them with smaller elements or adjusting their placement within the layout.

- *Color*: Bright or intense colors can attract more attention and appear heavier than muted or neutral colors. Balancing colors involves distributing them evenly throughout the interface or using complementary colors to create visual harmony.

- *Density*: The density of elements refers to how tightly packed they are within a given space. Balancing density involves ensuring that elements are distributed evenly in the interface to avoid overcrowding or sparse areas.

- *White space*: Also known as negative space, white space refers to the empty areas between elements. Space helps create visual breathing room and can balance the composition by highlighting and emphasizing certain elements.

:::row:::
   :::column span="":::
      ![Example of a balanced composition.](./media/visual-design/balance-left.svg)
      **A balanced composition is a sum of visual forces between the elements.**

   :::column-end:::
   :::column span="":::
      ![Example of a balanced layout.](./media/visual-design/balance-right.svg)
      **Balancing layout is one of the hardest tasks, because it can't be easily measured.**

   :::column-end:::
:::row-end:::

### Color

Hues, tints, shades, and tones can convey meaning, evoke emotions, and create aesthetic appeal. Color plays a crucial role in guiding user attention, establishing hierarchy, conveying information, and enhancing usability. Several reasons explain why thoughtful color design in a UI can affect users the way you want:

1. *Attention and perception*. Certain colors are more eye-catching than others, allowing designers to direct viewers' focus to specific elements. Color contrast can enhance readability and distinguish between different components, facilitating rapid processing of information.

2. *Emotional response*. Colors have psychological associations that evoke emotions and moods. Warm colors like red and orange can create a sense of energy and excitement, while cool colors like blue and green can evoke calmness and tranquility. You can elicit desired responses to influence users towards the intended experience.

3. *Brand identity*. Consistent use of color across branding materials helps establish a strong visual identity and fosters brand recognition. Users often associate specific colors with particular brands and associate their experience with brand loyalty and trust.

4. *Visual hierarchy*. Color can be used to establish visual hierarchy and organize information. Assign different colors to elements based on their importance or category to create a clear hierarchy and facilitate easier navigation and comprehension.

### Proximity

Items that are placed closer together seem more related. When arranging elements, ensure that there's a noticeable difference in spacing between elements that are closely related and those that aren't.

This Gestalt principle suggests that the spatial distance between visual elements influences how they're perceived and organized mentally, and underscores its importance in facilitating efficient processing and understanding of visual stimuli.

Group related elements together that are functionally similar or belong to the same hierarchical category. For example, buttons that perform similar actions or options within a dropdown menu should be grouped closely together to indicate their association. In a navigation bar, menu items that are closely spaced suggest a related set of options, while a larger gap between menu categories visually distinguishes them. Form items that are related should be grouped together, like address fields in a section called "address."

Enhance readability in text-heavy interfaces by adjusting spacing between paragraphs, sentences, and words. Closer paragraph spacing indicates a logical connection or continuation of thought, while greater spacing denotes a transition or a break in content. This technique promotes efficient comprehension of textual information.

Ensure that there's a noticeable distinction in spacing between related and unrelated elements to prevent confusion. A spacing ramp can help consistently determine the appropriate spacing needed based on the element size.

:::row:::
   :::column span="":::
      ![A light colored circle and dark colored triangle on the left, and one lone light colored circle on the right.](./media/visual-design/proximity-left.svg)
      **The circle on the left is more related to the triangle than to the other circle.**

   :::column-end:::
   :::column span="":::
      ![Three groups of horizontal lines arranged vertically, where the top two groups are closer together than the last group.](./media/visual-design/proximity-right.svg)
      **Spacing between paragraphs is smaller than space between sections.**

   :::column-end:::
:::row-end:::

### Continuity

Elements that are arranged on a line or a curve are perceived to be more related than elements that aren't on a line or a curve.

Arrange interface elements, such as navigation menus or steps in a process, along a line or curve to imply a sequence or progression. This layout helps users perceive the relationship between elements and understand the logical flow of information or actions.

Place related elements, such as check box or radio options or items in a bulleted list, along a line to visually group them together. This arrangement suggests to users that these elements share a common purpose or belong to the same category, facilitating easier navigation and comprehension. If similar-looking items are further indented inwards, the item's position is correlated with a lower placement in the visual hierarchy.

Use lines or curves to guide users' attention and create visual paths through the interface. For example, an arrow can direct the user's eye from one section of content to another along a certain path, indicating a connection or progression. This technique helps users navigate the interface more intuitively and encourages exploration.

Arrange key interface elements, such as call to action buttons or important information, along prominent lines to draw users' attention and create focal points. For example, the Fluent MessageBar pattern is often displayed as a prominent balanced message across the content area, with the message on the left, leading to the call to action buttons on the right. This layout strategy highlights these elements and emphasizes their significance, increasing the likelihood of interaction.

:::row:::
   :::column span="":::
      ![Example demonstrating curves and lines versus color.](./media/visual-design/continuity-left.svg)
      **The curves/lines are stronger than color to our perception.**

   :::column-end:::
   :::column span="":::
      ![Visual representation of a wizard or work flow.](./media/visual-design/continuity-right.svg)
      **Wizards use continuity to show users that the steps are connected, without overwhelming them with too much information.**

   :::column-end:::
:::row-end:::

### Closure

The human brain tends to see complete forms, recognizing a single familiar pattern over individual objects, even when some information is missing.

Ensure visual consistency in design elements such as shapes, colors, and sizes to help users learn patterns they should expect, even if they're presented in different contexts.

Use simple and familiar icons or symbols that allow users to fill in missing information based on their previous experiences. For example, a magnifying glass icon is commonly associated with search functionality, even without accompanying text.

Present information gradually to users, also known as progressive disclosure. Allow users to fill in missing details as they interact with the interface, avoiding overwhelming them with too much information and encouraging exploration.

Create cohesive visual patterns that encourage users to perceive objects as whole entities. For example, grouping related elements together can help users understand their relationship and purpose. Visually arrange elements consistently using Gestalt principles to indicate segmentation. Use space effectively to create a sense of closure around interface elements.

Use animation and transitions to guide users' attention and convey changes in interface states. Smooth transitions between different states or screens can help users understand the relationship between elements and fill in missing information. Multiple modern controls available in Power Apps inherently display animations.

:::row:::
   :::column span="":::
      ![Example demonstrating perception of closure involving a square and four incomplete circles](./media/visual-design/closure-left.svg)
      **A square is recognized before four incomplete circles are.**

   :::column-end:::
   :::column span="":::
      ![Example demonstrating attempt to close a gap between two related items.](./media/visual-design/closure-right.svg)
      **Animation from a card to a modal helps close the gap between the two and relate them to one another.**

   :::column-end:::
:::row-end:::

### Focal point

A focal point is a design element that immediately draws the viewer's attention. Ideally, a design should have a sequence of focal points, typically between one and three, arranged to guide the user through the content in a deliberate manner.

Design the interface with a clear hierarchy of information, where the most important content or actions are emphasized as focal points. Use visual cues such as size, color, contrast, and positioning to make these elements stand out. Present information gradually, starting with the most important focal points. This technique helps users quickly identify the most relevant content or actions and guides them through the interface in a logical sequence.

Place primary call to action buttons prominently within the interface, making them the strongest focal points. These buttons should be visually distinct from other elements and strategically positioned to guide users towards desired actions, such as making a purchase or signing up. Fluent design language recommends using the brand theme color for these elements.

Use contrast effectively to create focal points. Elements that stand out due to differences in color, brightness, size, or typography naturally attract the user's attention. Contrasting brighter surfaces with darker text or branded elements creates a more prominent focal point.

Use white space to highlight focal points by creating visual separation from surrounding elements. This technique helps prevent distractions and allows users to focus on the most important content or actions. UI elements with more spacing around them draw more focus and tend to be perceived as higher in importance than elements with less space.

Maintain consistency in the use of focal points throughout the interface to provide a cohesive user experience. By setting a pattern of focal points, you guide users' expectations about the hierarchy they need to understand to navigate the interface and help them find important information or actions across various screens or pages.

Keep in mind that it's important to maintain balance and not overwhelm users with too many competing focal points.

:::row:::
   :::column span="":::
      ![Example using color to demonstrate focus.](./media/visual-design/focalpoint-left.svg)
      **The eye is drawn to the blue square first.**

   :::column-end:::
   :::column span="":::
      ![Example call to action using blocks.](./media/visual-design/focalpoint-right.svg)
      **Elements such as calls to action can be made focal points to ensure that users notice them.**

   :::column-end:::
:::row-end:::

### Similarity

Objects that appear similar are often perceived as a group or pattern, leading users to expect them to have the same functionality.

Ensure that interface elements with similar functions have consistent visual styles. For example, buttons that perform similar or equally weighted actions should have the same color, shape, and size, signaling to users their shared functionality. Inversely, ensure that elements that differ significantly in functionality are clearly distinguishable. Both techniques prevent confusion and frustration by establishing clear visual cues.

Use consistent iconography and symbols to represent similar actions or features throughout the interface. Users tend to associate familiar icons with specific functions based on their past experiences. To meet these expectations, use universally recognized icon metaphors. Ensure consistency in icon styling by using icons from the same set, such as the Fluent UI iconography library.

Employ color coding to signify similarities between elements or categories. For example, using the same color to highlight related items in a list, or grouping similar data points on a chart, enhances visual coherence and aids users in discerning patterns.

Maintain uniformity in typography and text styling for elements that serve analogous purposes. Consistent font styles, sizes, and formatting contribute to a cohesive visual language, facilitating users' recognition of related content or actions.

Provide consistent interactive feedback for similar actions across the interface. Whether it's hovering over a button or clicking a link, users should expect uniform responses to reinforce the association between visual similarity and functional equivalence. While the platform inherently provides most interactivity behaviors like hover and pressed state color values, keep this design principle in mind when creating component elements from scratch or manually implementing feedback states.

Ensure that visual similarities are complemented by other cues, such as text labels or audio feedback, to accommodate users with diverse needs and preferences. Effective communication of functionality through multiple sensory modalities enhances usability and inclusivity.

:::row:::
   :::column span="":::
      ![Example of similarity using shapes and color.](./media/visual-design/similarity-left.svg)
      **The elements are grouped by shape and color, not arrangement (columns and rows).**

   :::column-end:::
   :::column span="":::
      ![Example of similarity in layout.](./media/visual-design/similarity-right.svg)
      **If one card on a dashboard opens as a side panel, users expect all of them to open that way.**

   :::column-end:::
:::row-end:::

### Figure and ground

People instinctively perceive elements to be either a "figure" (what stands out in the front) or a "ground" (what recedes into the background). Therefore, context influences perception, and it's crucial to ensure sufficient delineation to distinguish important elements from the background. White space (negative space) increases comprehension of content.

Use contrast in color, size, or visual style to establish a clear relationship between figure and ground. Important elements should stand out prominently against the background, making them easily distinguishable and guiding users' attention effectively. Surfaces with lighter colors and more contrasting visual elements against the background have more prominence. This approach reduces visual clutter and helps users identify key information. Provide sufficient contrast between foreground and background elements to improve readability for users with visual impairments, improving their ability to access and comprehend content.

Maintaining consistency in the placement and styling of interface elements reinforces the figure-ground relationship and aids users in understanding the interface structure. Consistent use of design patterns and visual cues ensures that users can quickly discern between foreground and background elements across different screens and contexts. Inconsistencies in design can disrupt users' mental models and hinder their ability to navigate the interface efficiently.

:::row:::
   :::column span="":::
      ![Two rows of uniformly stacked white containers with dark elements, divided by low contrast borders.](./media/visual-design/figureground-left.svg)
      **Low contrast and minimal negative space contribute to perceiving the white rectangles as part of the background.**

   :::column-end:::
   :::column span="":::
      ![Example screen layout with illustrations in a colored background, and a prominent white box of content on the left.](./media/visual-design/figureground-right.svg)
      **A side image needs to recede into the background so that users can focus on important content.**

   :::column-end:::
:::row-end:::

### Grouping

Elements tend to be perceived as groups if they share an area with a clearly defined boundary.

Grouping related elements within visual containers, such as boxes, cards, or borders, helps users perceive them as cohesive units. This approach visually organizes content and functionality, making it easier to identify and process information. Clear groupings help avoid a cluttered interface and reduce confusion or inefficiency. Grouping is also effective when proximity isn't an option; for example, a message bar that spans several controls across a screen is perceived as a related unit due to its borders and background color.

Maintaining a consistent visual style for grouped elements strengthens their connection and improves usability. Using similar colors, fonts, or icons for these elements emphasizes that they belong to the same category or function. Inconsistencies in visual presentation can weaken the perceived grouping and cause users to overlook relationships between elements or misinterpret their meaning or purpose.

:::row:::
   :::column span="":::
      ![Example of using borders to create separation.](./media/visual-design/grouping-left.svg)
      **Adding borders around an element or a group of elements creates separation from surrounding elements.**

   :::column-end:::
   :::column span="":::
      ![Example illustrating benefit of sectioning content.](./media/visual-design/grouping-right.svg)
      **Sectioning content helps users understand that the subject matter is switching.**

   :::column-end:::
:::row-end:::

### Signals vs. noise

Visual cues such as lines, contrast, and spacing are used to signify to users that something is important. However, too many signals, or signals highlighting information that's not important, quickly become noise.

Employ focal point principles like bold text, contrasting colors, or icons to signal important information or actions to users. For example, use a bright color for important buttons or headings to make them stand out.

Be selective about what you highlight to avoid overwhelming users with too much information. Only signal elements that are truly important for the user's task or goal. Too many signals can create confusion and make it difficult for users to prioritize. Identify the information that's most important to the user and emphasize it appropriately. Typically, it's recommended to have only one call to action button per page. In forms, highlight required fields to guide the user's attention. This prevents users from getting lost in unnecessary details and helps them focus on what's essential.

Ensure that signals follow a consistent visual language throughout the interface to serve as a guideline that helps users recognize patterns and understand the meaning of different signals intuitively.

Tailor signals to the specific context and user's needs. For example, if users are scanning an interface that presents certain tasks, signal critical status and actionable items clearly to attract their attention. Contextual signals help users quickly find relevant information without being distracted by unrelated details.

:::row:::
   :::column span="":::
      ![Example illustrating use of signals to guide users.](./media/visual-design/signal-noise-left.svg)
      **Signals help guide users through content and convey what's important.**

   :::column-end:::
   :::column span="":::
      ![Example illustrating visual noise with blocks.](./media/visual-design/signal-noise-right.svg)
      **Visual noise introduces confusion and has the opposite effect of signals.**

   :::column-end:::
:::row-end:::

## Power Platform facilitation

In canvas apps, use [layout containers](/power-apps/maker/canvas-apps/controls/control-horizontal-container) to group related elements. Ideally you should organize all page elements in containers, and layout containers can also efficiently separate child containers by adjusting the gap property.

In model-driven app forms, [sections](/power-apps/maker/model-driven-apps/add-move-or-delete-sections-on-form) can be used to group related fields or elements.

Implement consistency in common visual elements with reusable [custom components](/power-apps/maker/canvas-apps/create-component).

In canvas apps, [modern controls](/power-apps/maker/canvas-apps/controls/modern-controls/overview-modern-controls) feature integrated signaling within their design. Specifically, the [button](/power-apps/maker/canvas-apps/controls/modern-controls/modern-control-button) and [badge](/power-apps/maker/canvas-apps/controls/modern-controls/modern-controls-badge) controls offer options in their style properties, making them effective signals. Adhere to best practices for each component and apply signaling selectively to ensure optimal communication.

## Related information

- [Principles of grouping](https://en.wikipedia.org/wiki/Principles_of_grouping)
- [Gestalt psychology](https://en.wikipedia.org/wiki/Gestalt_psychology)
- [Aesthetic usability effect](https://en.wikipedia.org/wiki/Aesthetic%E2%80%93usability_effect)
- [Fluent UI Design System spacing ramp](https://fluent2.microsoft.design/layout#:~:text=Fluent's%20global%20spacing%20ramp%20is,a%20scale%20of%20supported%20sizes.)

## Experience Optimization checklist

> [!div class="nextstepaction"]
> [Experience Optimization checklist](checklist.md)
