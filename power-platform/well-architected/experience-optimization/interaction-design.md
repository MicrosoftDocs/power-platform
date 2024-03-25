---
title: Recommendations for interaction design best practices
description: Learn key principles of interaction design to enhance user experiences and optimize application usability.
author: RobStand
ms.author: rstand
ms.reviewer: robstand
ms.date: 03/22/2024
ms.subservice: guidance
ms.topic: conceptual
---

# Recommendations for following interaction design best practices

**Applies to this Power Platform Well-Architected Experience Optimization checklist recommendation:**

|[XO:08](checklist.md)| **Prioritize responsiveness and feedback. Make it easy to understand how to interact with the interface, incorporating interactions that align with users' mental models and expectations.** |
|---|---|

This guide describes the recommendations for interactions in user interface design. Interaction design is crucial for understanding how users process information from the system and how visual elements are initially organized and respond to user inputs. It aids in planning task flows and accommodating various scenarios and contingencies, helping users achieve their goals.

## Key design strategies

For a successful workload, visual design and user interactions must work in harmony to create the user experience. Here are some best practices that primarily focus on user behavior.

### Affordance

An "affordance" is a perceived signal or clue that an object may be used to perform a particular action. Handle affords gripping. For example, a handle suggests that it can be gripped. Using affordances helps users to build correct mental model of the outcomes of their actions.

The modern controls available in Power Apps leverage the latest Fluent UI components, which integrate visual elements like shadows, gradients, and animations to signal their interactivity. For example, raised buttons suggest they can be clicked, while highlighted text fields indicate readiness for input. These controls follow established design patterns and conventions, providing a familiar and intuitive experience for users accustomed to modern software interfaces.

:::image type="content" source="media/interaction-design/affordance.svg" alt-text="Affordance example showing a flat button next to a raised button.":::

### Mental model

Users' perceptions of a UI significantly influence their interaction with it. Discrepancies often arise when users expect different outcomes from the UI, leading to mismatched mental models. It's crucial that the user's mental model aligns with the designer's mental model embedded in the system. Be cautious when using unfamiliar design patterns, as they may confuse users.

The Fluent UI based modern controls are tested by a professional design team, which ensures the user's mental model is the same as the intention for the pattern. For composite visual elements or task flows, be sure to clearly communicate an accurate representation of the mental model.

A common way to illustrate the mental model is by showing the status or states of table data that are important for the user to understand. For instance, if a record is inactive or closed, the entire form should be set to read-only to align with the expected behavior.

:::image type="content" source="media/interaction-design/mental-model.svg" alt-text="Graphic depiction of a user's mental model.":::

### Cognitive biases

Cognitive biases are the shortcuts and rules of thumb by which we make judgments and predictions. There are over 150 cognitive biases. They can be divided into four groups:

1. *Information overload*. Research suggests that the human brain has a limited capacity for processing information consciously at any given moment. In today's information-saturated world, users tend to filter out most of it. The brain employs strategies to identify and retain the most potentially useful pieces of information.
1. *Ambiguity effect*. The world is complex, and users only perceive a small fraction of it. However, they need to understand it to navigate effectively. Users link information, fill in missing pieces with their existing knowledge, and continuously update their perceptions.
1. *Urgency effect*. Users are constrained by time and information. Every new piece of information requires users to evaluate its potential impact, apply it to their decision-making process, anticipate future outcomes, and take action based on these insights.
1. *Memory and recall*. Users constantly weigh what information to retain and what to discard. When faced with a multitude of intricate details, they typically select a few notable items to remember and disregard the rest.

Learning about cognitive biases enhances awareness of potential pitfalls in a user experience and fosters empathy towards users by understanding their cognitive limitations and tendencies. This awareness enables designers to recognize when biases might influence their own decisions or users' interactions in the interface, leading to more thoughtful and user-centered design solutions. Incorporating this knowledge leads to more intuitive and satisfying user experiences.

Understand your users' needs, goals, and behaviors. Employ user research methods such as surveys and interviews to help uncover cognitive biases that might affect how users perceive and interact with the interface. Continuously iterate on the design based on user feedback and usability testing results to identify and address cognitive biases or usability issues that might arise.

Leveraging standard design patterns and conventions that align with common or universal mental models helps users navigate the interface more intuitively and reduces the likelihood of cognitive biases influencing interactions.

:::image type="content" source="media/interaction-design/bias.svg" alt-text="Cognitive bias depiction.":::

### Fitts's law

Fitts's law predicts that the time required to acquire a target is a function of the distance to and size of the target. Large elements that are positioned close to users are easily selectable. For example, if a button is too small or far from the content it relates to, it will take longer for the user to select it.

Large, well-placed buttons allow users to navigate the interface with minimal effort, preventing frustration and ensuring a smooth user experience. Interactive elements such as buttons or links should be large enough and positioned close to users' natural cursor movement; for example, placing primary action buttons on mobile devices in prominent locations within reach of users' thumbs. Making such elements easier to click or tap reduces the time it takes for users to interact with them.

If interactive elements are too small or spaced too far apart, users might accidentally select the wrong element or miss the target altogether, leading to user errors and frustration. Designing with Fitt's law in mind can help avoid these issues by ensuring that interactive elements are clearly identifiable and easy to access.

Consider the needs of users with limited dexterity or mobility impairments. By making interactive elements larger and easier to target, and ensuring correct tab order, you improve accessibility and ensure all users can interact with the interface comfortably.

:::image type="content" source="media/interaction-design/fitt.svg" alt-text="Fitts's law depiction.":::

### Hick's law

Hick's law asserts that the time it takes to make a decision increases with the number and complexity of choices.

Instead of presenting users with a multitude of options all at once, break complex tasks into smaller, more manageable steps using progressive disclosure. This approach helps users focus on making a single choice, reducing decision-making time and avoiding overwhelming the user. For example, use a step-by-step wizard for complex processes like account setup or product customization.

Guide users towards recommended or commonly chosen options to streamline decision-making. Highlight preferred choices so that users can make decisions more quickly without becoming overwhelmed by alternatives. This approach prevents decision paralysis and helps users move through the interface efficiently.

Presenting too many choices or options on a single screen can overwhelm users and lead to decision fatigue. Keep the interface clean and uncluttered by prioritizing essential information and options, while hiding or minimizing less critical ones. This method avoids confusion and allows users to concentrate on the most relevant options.

Ask questions and design interactions that lead to simple answers. Use "yes/no" questions or provide clear options. This approach reduces cognitive load on users and makes decision-making more intuitive and efficient. Avoid complex or ambiguous questions to prevent users from making errors or becoming confused.

:::image type="content" source="media/interaction-design/hick.svg" alt-text="Hick's law depiction.":::

### Serial-position effect

Serial-position effect is the tendency to recall the first and last items in a series best, along with the most different element. Use the following tips to enhance memorability, improve user engagement, and facilitate more efficient interactions:

- Position key actions, important information, or critical content at the beginning and end of lists, menus, or interfaces. Such placement ensures that users are more likely to remember and engage with these elements. For example, place primary navigation options at the beginning and end of a menu bar for easy access.

- Make important elements visually distinct from surrounding content to enhance memorability. Use contrasting colors, bold typography, or unique icons to draw attention to critical actions or information. This approach helps users differentiate important elements from the rest of the interface, improving recall and usability.

- Organize content and actions based on their importance and relevance to users' tasks or goals. Ensure that the most critical information is presented first and last, with less important details in between. This technique helps users focus on essential content while minimizing cognitive load and preventing information overload.

:::image type="content" source="media/interaction-design/serial-position.svg" alt-text="Serial-position effect depiction.":::

### Pareto principle

The Pareto principle (also known as the 80/20 rule, the law of the vital few, and the principle of factor sparsity) states that for many outcomes, roughly 80% of consequences come from 20% of causes.

Identify the most critical aspects of the UI that significantly impact user satisfaction and usability. For example, common user tasks, frequently accessed features, or critical content areas. By prioritizing these key elements, project teams can allocate resources more effectively and ensure that the most vital areas of the UI receive the most attention.

Conduct user testing with a small group of participants to uncover the majority of usability issues. Research suggests that testing with just a few users can reveal a significant portion of the problems. Use this strategy to find and address issues early in the design process.

Be cautious of universal vs inclusive design. Consider the balance between universal design principles, which aim to create interfaces that are usable by as many people as possible, and inclusive design, which focuses on addressing the specific needs of diverse user groups. While it's essential to design for the majority of users, it's also crucial to consider the needs of marginalized or underrepresented groups to ensure that the UI is accessible and inclusive for everyone.

:::image type="content" source="media/interaction-design/pareto.svg" alt-text="Pareto principle depiction.":::

### Jakob's law

Jakob's law states that users spend most of their time on other sites. In other words, users prefer interfaces that mirror experiences from other familiar interfaces. Provide familiar design patterns to simplify the learning process.

Incorporate commonly used design elements and interaction patterns that users encounter on other websites. For example, place the navigation menu at the top of the page, or use a shopping cart icon for e-commerce sites. This familiarity makes it easier for users to navigate and interact with your UI. Users expect clickable elements to look like buttons or links. By meeting these expectations, you streamline the learning process, reduce cognitive load, and ensure users don't become overwhelmed or frustrated by unfamiliar interfaces. This kind of experience increases the likelihood of users staying engaged and achieving their goals.

:::image type="content" source="media/interaction-design/jakob.svg" alt-text="Jacob's law depiction.":::

### Miller's law

Miller's law contends that the average person can only keep seven (plus or minus two) items in their working memory. Chunking is an effective method of presenting groups of content in a manageable way.

Organize content into meaningful chunks or groups containing five to nine items. Employing visual cues such as spacing, borders, or color clearly delineates different chunks of content, helping users to perceive the structure of the information and navigate the interface more effectively.

Within each chunk, place the most important information or actions at the forefront, making them easily accessible to users. Present users with a manageable number of options to prevent decision fatigue and reduce cognitive strain. Use headings, bullet points, or icons to help users quickly scan and navigate to relevant sections of the interface (including content within chunks).

:::image type="content" source="media/interaction-design/miller.svg" alt-text="Miller's law depiction.":::

### Peak-end rule

The peak-end rule states that people judge an experience largely based on how they felt at its peak and at its end, rather than based on the total sum or average of every moment of the experience. Enhance peak moments by identifying moments within the user journey where the product is most helpful, valuable, or entertaining. Focus on enhancing these peak moments by providing additional value, delight, or functionality to leave a lasting positive impression on the user. Also consider optimizing the end of the journey by paying special attention to how the user completes the workflow. Ensure that the final interactions or messages are clear, satisfying, and align with users' expectations, leaving them with a positive last impression.

Some ways to enhance positive experiences include:

- *Personalization*. Tailor the user experience to individual preferences and behaviors. Offer personalized recommendations, content suggestions, or customization options based on user data and preferences.

- *Microinteractions*. Incorporate small, delightful animations or interactions throughout the interface to make interactions more engaging and enjoyable. For example, subtle animations when hovering over buttons or playful loading screens can add a touch of personality to the user experience.

- *Surprise and delight*. Introduce unexpected elements or Easter eggs that surprise and delight users. For example, hidden features, humorous messages, or interactive elements that encourage exploration and discovery.

- *Efficiency improvements*. Streamline tasks and interactions to make them faster and more efficient for users. Introduce features such as keyboard shortcuts, autocomplete suggestions, or one-click actions to simplify common tasks and save users time.

- *Visual design*. Invest in high-quality visual design to create a visually appealing and cohesive interface. Use aesthetically pleasing typography, color schemes, and imagery to evoke positive emotions and enhance the overall user experience.

- *Feedback and acknowledgment*. Provide immediate and meaningful feedback to users' actions to reassure them that their interactions are registered and understood. Use visual cues, animations, or notifications to acknowledge user input and actions in real time.

- *Gamification*. Introduce game-like elements such as challenges, rewards, or progress tracking to make the user experience more engaging and enjoyable. Encourage users to achieve specific goals or milestones within the interface to create a sense of accomplishment and motivation.

Recognize that users recall negative experiences more vividly than positive ones. Take proactive measures to identify and address pain points or usability issues throughout the user journey to prevent negative experiences from overshadowing positive ones. The guidance in this pillar is intended to help improve negative experiences. Following usability heuristics, meeting accessibility compliance, employing clear error handling, using consistency in design, and optimizing for performance, all help address negative experiences.

Continuously gather feedback from users to identify peak moments, pain points, and areas for improvement. Use this feedback to iteratively enhance the user experience, focusing on optimizing peak moments and addressing any negative experiences.

:::image type="content" source="media/interaction-design/peak-end-rule.svg" alt-text="Peak-end rule depiction.":::

### Postel's law

Postel's law, or the robustness principles, is today paraphrased as: "Be liberal in what you accept, and conservative in what you send." In other words, be empathetic, flexible, and tolerant of the various actions a user might take. For example, when accepting variable input from users, translating input to meet requirements, defining boundaries for input, and providing clear feedback to the user. At the same time, be specific in what you ask the user to do.

Design the interface to accept a wide range of user inputs, accommodating different preferences, behaviors, and devices. This flexibility prevents users from feeling restricted or frustrated by rigid input requirements.

If necessary, translate user input to meet the system's requirements or standards. For example, convert different date formats or units of measurement to ensure consistency and accuracy in processing user input.

Clearly define boundaries for acceptable input, providing guidance and constraints to prevent errors or unintended actions. This approach helps users understand the scope of their interactions and reduces the likelihood of making mistakes.

Offer immediate and informative feedback to users in response to their actions, such in validation messages, error alerts, or confirmation dialogs. Such feedback guides users, and prevents confusion or uncertainty.

Clearly communicate expectations and instructions to users, specifying what actions are required and how they should be performed. Avoid ambiguity or vague language that might lead to misunderstandings or errors.

:::image type="content" source="media/interaction-design/postel.svg" alt-text="Postel's law depiction.":::

<!---
## Power Platform facilitation

Although some interaction implementation has been encapsulated into the modern components themselves, these rules should also be considered on the scope of the screen layout or overall application flow.

## See also

Related links here.

--->

## Experience Optimization checklist

> [!div class="nextstepaction"]
> [Experience Optimization checklist](checklist.md)
