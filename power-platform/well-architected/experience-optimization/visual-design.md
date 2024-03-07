---
title: Recommendations for optimizing user perception and aesthetics
description: Learn how to optimize user perception and aesthetics to ensure consistent success with user experience optimization.
author: Denise-MSFT
ms.author: demora
ms.reviewer: robstand
ms.date: 03/29/2024
ms.subservice: guidance
ms.topic: conceptual
---

# Recommendations for optimizing user perception and aesthetics

**Applies to this Power Well-Architected Experience Optimization checklist recommendation:**

|[EO:01](checklist.md)| **Apply classic design principals to visual elements such as color schemes, typography, and layout. Strive for a focused, balanced, and intuitive visual hierarchy that guides users' attention to important elements and actions.** |
|---|---|

This guide describes the recommendations for universal visual design patterns that affect user perception, which can significantly influence satisfaction and adoption of an application. Visual elements serve as foundational building blocks used to create experiences. Applying visual principals that align with how humans naturally perceive and process information provides structured methods to choose and arrange visual elements for an effective and appealing application.

## Key design strategies

There has been a lot of research on human perception of visual design. Users don't look at the visual elements in silos. Instead, they perceive them as relations to other elements and the context in which they are viewed. These relationships affect the user's perception. They can attract attention to specific areas, evoke emotions, aid comprehension, enhance aesthetics, and reinforce brand identity. Thoughtful choices and arrangements of visual elements create engaging, memorable, and effective user experiences that resonate with their target audience.

**The Aesthetic-Usability Effect**

It takes about 50 milliseconds for users to form an opinion about an application. This first impression depends on many factors: structure, colors, spacing, symmetry, amount of text, fonts, and more. A positive first impression can increase overall satisfaction. Research has shown that users are more tolerant of minor usability issues when they find an interface visually appealing. Additionally, quality of design is an indicator of credibility.

### Balance and weight

A composition is balanced when all the elements are in optical equilibrium. Oftentimes, the mathematical placement needs to be optically adjusted. Some of the elements that affect the visual weight are size, color, density, white space.

- _Size_: Larger elements tend to carry more visual weight than smaller ones. To achieve balance, larger elements can be counterbalanced by grouping them with smaller elements or adjusting their placement within the layout.

- _Color_: Bright or intense colors can attract more attention and appear heavier than muted or neutral colors. Balancing colors involves distributing them evenly throughout the interface or using complementary colors to create visual harmony.

- _Density_: The density of elements refers to how tightly packed they are within a space. Balancing density involves ensuring that elements are distributed evenly across the interface to avoid overcrowding or sparse areas.

- _White space_: Also known as negative space, refers to the empty areas between elements. Space helps create visual breathing room and can be used to balance the composition by providing contrast and emphasis to the elements.

:::row:::
   :::column span="":::
      ![Alt text](./media/visual-design/balance-left.svg)
      **A balanced composition is ia sum of visual forces between the elements.**

   :::column-end:::
   :::column span="":::
      ![Alt text](./media/visual-design/balance-right.svg)
      **Balancing layout is one of the hardest tasks as it cannot be measured easily.**

   :::column-end:::
:::row-end:::

### Proximity

Items that are closer together appear to be more related. When spacing elements ensure that there is a noticeable distinction in spacing between elements that should be more related versus less so.

Group related elements that are functionally or belong to the same hierarchical category closely together. For example, buttons that perform similar actions or options within a dropdown menu should be placed closer together to indicate their association. In a navigation bar, closely spaced menu items indicate a related set of options, while greater spacing between menu categories separates them visually.

Enhance readability in text-heavy interfaces by adjusting spacing between paragraphs, sentences, and words. Closer spacing between paragraphs or sentences indicates a logical connection or continuation of thought, while greater spacing denotes a transition or break in content. This helps users navigate and comprehend textual information more effectively.

Ensure there's a noticeable distinction in spacing between related and unrelated elements are clear to the user to prevent visual clutter and confusion. Clear spacing helps users quickly identify groups of related elements and understand their functional relationships without ambiguity, while subtle spacing differences will not be recognized. A spacing ramp of a design system can help determine the appropriate spacing needed based on element size.

:::row:::
   :::column span="":::
      ![Alt text](./media/visual-design/proximity-left.svg)
      **The circle on the left is be more related to the triangle than to the other circle.**

   :::column-end:::
   :::column span="":::
      ![Alt text](./media/visual-design/proximity-right.svg)
      **Spacing between paragraphs is smaller than space between sections.**

   :::column-end:::
:::row-end:::

### Continuity

Elements that are arranged on a line or a curve are perceived to be more related than elements not on a line or a curve.

Arrange interface elements, such as navigation menus or steps in a process, along a line or curve to imply a sequence or progression. This layout helps users perceive the relationship between elements and understand the logical flow of information or actions.

Place related elements, such as checkbox or radio options, or items (e.g., bullet points) in a list, along a line to visually group them together. This arrangement suggests to users that these elements share a common purpose or belong to the same category, facilitating easier navigation and comprehension.

Use lines or curves to guide users' attention and create visual paths through the interface. For example, an arrow can direct the users' eyes from one section of content to another along a certain path, indicating a connection or progression. This technique helps users navigate the interface more intuitively and encourages exploration.

Arrange key interface elements, such as call-to-action buttons or important information, along a prominent lines to draw users' attention and create focal points. For example, the Fluent MessageBar pattern is often displayed as a prominent balanced message across the content area, with the message on the left, leading to the call to action buttons on the right. This layout strategy highlights these elements and emphasizes their significance, increasing the likelihood of interaction.

:::row:::
   :::column span="":::
      ![Alt text](./media/visual-design/continuity-left.svg)
      **The curves / lines are stronger than colour to our perception.**

   :::column-end:::
   :::column span="":::
      ![Alt text](./media/visual-design/continuity-right.svg)
      **Wizards use continuity to help the user understand that the steps are related without overwhelming with all the content.**

   :::column-end:::
:::row-end:::

### Closure

Human brain strives for simplicity and recognizes a single pattern rather than individual objects even if there is missing information.

Ensure visual consistency in design elements such as shapes, colors, and sizes. Consistent visual patterns help users quickly recognize and understand interface elements, even if they are presented in different contexts.

Use simple and familiar icons or symbols that allow users to fill in missing information based on their previous experiences. For example, a magnifying glass icon is commonly associated with search functionality, even without accompanying text.

Present information gradually to users (also known as progressive disclosure), allowing them to fill in missing details as they interact with the interface. This prevents overwhelming users with too much information at once and encourages exploration.

Leverage Gestalt principles such as similarity, proximity, and continuation to create cohesive visual patterns that encourage users to perceive objects as whole entities. For example, grouping related elements together can help users understand their relationship and purpose. Visually arrange elements consistently using Gestalt principles to indicate segmentations. Use space effectively to create a sense of closure around interface elements.

Utilize animation and transitions to guide users' attention and convey changes in interface states. Smooth transitions between different states or screens can help users understand the relationship between elements and fill in missing information. Multiple modern controls available in Power Apps inherently display animations.

:::row:::
   :::column span="":::
      ![Alt text](./media/visual-design/closure-left.svg)
      **A square is recognized first before 4 incomplete circles.**

   :::column-end:::
   :::column span="":::
      ![Alt text](./media/visual-design/closure-right.svg)
      **Animation from a card to a modal helps to close te gap between the two and relate them to one another.**

   :::column-end:::
:::row-end:::

### Focal point

It is an element that stands out and grabs the attention first. Ideally, design is made of consecutive focal points (ideally in the number of between one to three) from strongest to weakest that guide users throughout the content.

Design the interface with a clear hierarchy of information, where the most important content or actions are emphasized as focal points. Use visual cues such as size, color, contrast, and positioning to make these elements stand out. Present information gradually, starting with the most important focal points and then providing additional details as users interact with the interface.

Place primary call-to-action buttons prominently within the interface, making them the strongest focal points. These buttons should be visually distinct from other elements and strategically positioned to guide users towards desired actions, such as making a purchase or signing up. Fluent design language recommends using the brand theme color for these elements.

Utilize contrast effectively to create focal points. Elements that stand out due to differences in color, brightness, size, or typography will naturally attract users' attention. However, it's important to maintain balance and not overwhelm users with too many competing focal points.

Use whitespace and negative space to highlight focal points by creating visual separation from surrounding elements. This helps prevent distractions and allows users to focus on the most important content or actions. UI elements that have more spacing around them draw more focus and tend to be perceived as higher in importance than elements that have less space around them.

Maintain consistency in the use of focal points throughout the interface to provide a cohesive user experience. Establishing a pattern of focal points helps set expectations of the heirarchy users need to understand to navigate the interface and find important information or actions consistently across different screens or pages.

:::row:::
   :::column span="":::
      ![Alt text](./media/visual-design/focalpoint-left.svg)
      **User’s eye is drawn to the blue square first.**

   :::column-end:::
   :::column span="":::
      ![Alt text](./media/visual-design/focalpoint-right.svg)
      **Elements such as calls to action can be made focal points to ensure that users notice them.**

   :::column-end:::
:::row-end:::

### Similarity

Objects that look similar will be recognized as a pattern or a group. They will be expected to have the same functionality.

Ensure that interface elements with similar functions have consistent visual styles. For example, buttons that perform similar or equally-weighted actions should have the same color, shape, and size, signaling to users that they share common functionality. Inversely, ensure that elements that differ significantly in functionality are clearly distinguishable. This helps prevent confusion and frustration by establishing clear visual cues.

Use consistent iconography and symbols to represent similar actions or features throughout the interface. When users encounter familiar icons in different contexts, they can quickly infer their intended functionality based on their past experiences. Use universal icon metaphors to align with standard expectations. Use consistent icon styling by leveraging icons from the same suite (e.g., Fluent UI iconography library is available for use).

Employ color coding to signify similarities between elements or categories. For example, using the same color to highlight related items in a list or grouping similar data points on a chart enhances visual coherence and aids users in discerning patterns.

Maintain uniformity in typography and text styling for elements that serve analogous purposes. Consistent font styles, sizes, and formatting contribute to a cohesive visual language, facilitating users' recognition of related content or actions.

Provide consistent interactive feedback for similar actions across the interface. Whether it's hovering over a button or clicking on a link, users should expect uniform responses to reinforce the association between visual similarity and functional equivalence. Most of the interactivity behavior (such as hover and pressed state color values) are inherent in the platform, but keep this in mind when building component elements from scratch or if feedback states are manually implemented.

Ensure that visual similarities are complemented by other cues, such as text labels or audio feedback, to accommodate users with diverse needs and preferences. Effective communication of functionality through multiple sensory modalities enhances usability and inclusivity.

:::row:::
   :::column span="":::
      ![Alt text](./media/visual-design/similarity-left.svg)
      **The elements are grouped by shape and colour not arrangement (columns and rows).**

   :::column-end:::
   :::column span="":::
      ![Alt text](./media/visual-design/similarity-right.svg)
      **If one card on a dashboard opens as a side panel, users will expect all of them to opend that way.**

   :::column-end:::
:::row-end:::

### Figure and ground

People instinctively perceive elements to be either a “figure” (what stands out in the front) or a “ground” (what recedes into the back). Hence, context influences the perception and needs to ensure that there is enough delineation to distinguish between background and the elements that are important. White and negative space increases comprehension of content.

:::row:::
   :::column span="":::
      ![Alt text](./media/visual-design/figureground-left.svg)
      **Low contrast and minimal negative space contribute to perceiving the white rectangles as part of the background.**

   :::column-end:::
   :::column span="":::
      ![Alt text](./media/visual-design/figureground-right.svg)
      **A side image needs to recede into the background so the users can focus on the important content.**

   :::column-end:::
:::row-end:::

### Grouping

Elements tend to be perceived as groups if they are sharing an area with a clearly defined boundary.

:::row:::
   :::column span="":::
      ![Alt text](./media/visual-design/grouping-left.svg)
      **Adding borders around an element or a group of elements is a way to create separation from surrounding elements.**

   :::column-end:::
   :::column span="":::
      ![Alt text](./media/visual-design/grouping-right.svg)
      **Sectioning content helps users understand that the subject matter is switching.**

   :::column-end:::
:::row-end:::

### Signals vs. noise

Visual elements such as lines, contrast, spacing, etc. are used to inform users that something is important, in which case they are signals. However, too many signals, or signals highlighting information that is not important become noise.

:::row:::
   :::column span="":::
      ![Alt text](./media/visual-design/signal-noise-left.svg)
      **Signals help in guiding users through content and informing what is important.**

   :::column-end:::
   :::column span="":::
      ![Alt text](./media/visual-design/signal-noise-right.svg)
      **Visual noise introduces confusion and has the opposite effects from signals.**

   :::column-end:::
:::row-end:::

## Power Platform facilitation

These visual design recommendations are universal for overall design, and implicit in the Power Apps modern controls. Take these into consideration when determining overall design and arrangement of components available.

## Related links

Related links here.

## Experience Optimization checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Experience Optimization checklist](checklist.md)
