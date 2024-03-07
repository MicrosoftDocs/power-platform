---
title: Recommendations for interaction design best practices
description: Learn how to follow interaction design best practices to ensure consistent success with user experience optimization.
author: RobStand
ms.author: rstand
ms.reviewer: robstand
ms.date: 01/31/2024
ms.subservice: guidance
ms.topic: conceptual
---

# Recommendations for following interaction design best practices

**Applies to this Power Well-Architected Experience Optimization checklist recommendation:**

|[EO:01](checklist.md)| **Prioritize responsiveness and feedback. Make it easy to understand how to interact with the interface, incorporating interactions that align with users' mental models and expectations.** |
|---|---|

This guide describes the recommendations for interaction basics of user interface design. There are important considerations between how a user intakes information from the system, and how visual elements are initially arranged and respond to user inputs. Interaction design helps think through task flows, accomodate circumstances and fallbacks to help users reach the intended end state.

## Key design strategies

For a successful workload, the visual design needs to go hand in hand with user interactions that, together, make the user experience. Below are a few best practices that focus predominantly on user behavior.

### Affordance

An "affordance" is a perceived signal or clue that an object may be used to perform a particular action. Handle affords gripping. Using affordances helps users to build correct mental model of the consequences of their actions.

The modern controls available in Power Apps utilize the latest Fluent UI components, which integrate visual elements like shadows, gradients, and animations to signal their interactivity; for instance, raised buttons hint at their clickability, while highlighted text fields indicate readiness for input. Moreover, they follow established design patterns and conventions which ensures familiarity and intuitiveness for users accustomed to modern software interfaces.

![Affordance](./media/interaction-design/affordance.svg)

### Mental model

What users believe they know about a UI strongly impacts how they use it. Mismatched mental models (when users anticipate different outcomes from UI) are common. Since the user interacts with the system image, their mental model needs to match the designer’s mental model that has been fed into the system. Unfamiliar design patterns should be used carefully as they might lead to user confusion. 

The Fluent UI based modern controls are tested by a professional design team, which ensures the user's mental model is the same as the intention for the pattern. For composite visual elements or task flows, make sure to clearly communicate an accurate representation of the mental model.

One common example of displaying the mental model is to render status or states stored in table data that are important for the user to know. If a record is inactive or closed, the entire form should be disabled as read-only to follow the intended model.

![Mental model](./media/interaction-design/mental-model.svg)

### Cognitive biases

They are the shortcuts and rules of thumb by which we make judgments and predictions. There are over 150 cognitive biases. They can be divided into four groups:

1. _Information overload._ Research suggests that the human brain has a limited capacity for processing information consciously at any given moment. Moreover, nowadays there is just too much information, users filter almost all of it out. The brain uses tricks to pick out the bits of information that are most likely going to be useful.
1. _Ambiguity effect._ The world is very confusing, and users see only a tiny sliver of it, but they need to make sense of it in order to survive. Users connect the dots, fill in the gaps with stuff they already think they know, and update perceptions. 
1. _Urgency effect._ Users constrained by time and information. With every piece of new information, users need to assess an ability to affect the situation, apply it to decisions, simulate the future to predict what might happen next, and otherwise act on new insights.
1. _Memory and recall._ Users need to make constant bets and trade-offs around what they try to remember and what we forget. When there are lots of irreducible details, they pick out a few standout items to save and discard the rest.

Learning about cognitive biases enhances awareness of potential pitfalls in a user experience and fosters empathy towards users by understanding their cognitive limitations and tendencies. This awareness enables designers to recognize when biases may influence their own decisions or users' interactions with the interface, leading to more thoughtful and user-centered design solutions. Incorporating this knowledge leads to more intuitive and satisfying user experiences.

Understand your users' needs, goals, and behaviors through user research methods (such as surveys and interviews). This helps uncover cognitive biases that may affect how users perceive and interact with the interface. Continuously iterate on the design based on user feedback and usability testing results to identify and address cognitive biases or usability issues that may arise.

Leveraging standard design patterns and conventions that align with common or universal mental models helps users navigate the interface more intuitively and reduces the likelihood of cognitive biases influencing interactions.

![Cognative biases](./media/interaction-design/bias.svg)

### Fitts's Law

The time to acquire a target is a function of the distance to and size of the target. Large elements that are positioned close to users are easily selectable. For example, if the button is too small or far from the content it relates to, it will take longer for the user to click it.

Large, well-placed buttons allow users to navigate the interface with minimal effort, preventing frustration and ensuring a smooth user experience. Interactive elements, such as buttons or links, should be large enough and positioned close to users' natural cursor movement. This makes them easier to click or tap, reducing the time it takes for users to interact with them. For instance, place primary action buttons in prominent locations within reach of users' thumbs on mobile devices.

If interactive elements are too small or spaced too far apart, users may accidentally click the wrong element or miss the target altogether. This can lead to user errors and frustration. Designing with Fitt's Law in mind helps prevent these consequences by ensuring that interactive elements are easily distinguishable and accessible.

Consider the needs of users with limited dexterity or mobility impairments. By making interactive elements larger and easier to target (ensuring correct tab order), you can improve accessibility and ensure all users can interact with the interface comfortably.

![Fitt's law](./media/interaction-design/fitt.svg)

### Hick's Law

The time it takes to make a decision increases with the number and complexity of choices.

Instead of presenting users with a multitude of options all at once, break complex tasks into smaller, more manageable steps using progressive disclosure. This helps users focus on one decision at a time, reducing decision-making time and preventing overwhelm. For example, use a step-by-step wizard for complex processes like account setup or product customization.

Guide users towards recommended or commonly chosen options to streamline decision-making. By highlighting preferred choices, users can make decisions more quickly without being bogged down by too many alternatives. This prevents decision paralysis and helps users move through the interface efficiently.

Presenting too many choices or options on a single screen can overwhelm users and lead to decision fatigue. Keep the interface clean and uncluttered by prioritizing essential information and options, while hiding or minimizing less critical ones. This prevents confusion and ensures users can focus on the most relevant choices.

Frame questions and interactions in a way that leads to simpler answers, such as using binary "yes/no" questions or providing clear, straightforward options. This reduces cognitive load on users and makes decision-making more intuitive and efficient. Avoiding overly complex or ambiguous questions prevents users from getting stuck or making errors.

![Hick's law](./media/interaction-design/hick.svg)

### Serial Position Effect

First, last, as well as most different element is remembered the most by the users. Placing the least important items in the middle of lists can be helpful because these items tend to be stored less frequently in long-term and working memory. Positioning key actions on the far left and right within elements such as navigation can increase memorization.

![Serial position effect](./media/interaction-design/serial-position.svg)

### Pareto Principle

Also known as the 80–20 rule, the law of the vital few, and the principle of factor sparsity states that, for many events, roughly 80% of the effects come from 20% of the causes. It has been researched that testing (or bumping your ideas off) only 5 people will reveal 80% of problems. Be cautious of universal vs inclusive design!

![Pareto principle](./media/interaction-design/pareto.svg)

### Jakob's Law

Users spend most of their time on other sites. This means that users prefer your site to work the same way as all the other sites they already know. You can simplify the learning process for users by providing familiar design patterns. 

![Jacob's Law](./media/interaction-design/jakob.svg)

### Miller's Law

The average person can only keep 7 (plus or minus 2) items in their working memory. Chunking is an effective method of presenting groups of content in a manageable way. Organize content in groups of 5–9 items at a time.

![Miller's Law](./media/interaction-design/miller.svg)

### Peak-end rule

People judge an experience largely based on how they felt at its peak and at its end, rather than the total sum or average of every moment of the experience. It might be useful to identify moments when the product is most helpful, valuable, or entertaining and design to make those moments even better. The most intense points and the end of the user journey have particular importance. Also, people recall negative experiences more vividly than positive ones.

![Peak-end rule](./media/interaction-design/peak-end-rule.svg)

### Postel's Law

Be liberal in what you accept, and conservative in what you send. Be empathetic, flexible, and tolerant to any number of actions the user could possibly take. This means accepting variable input from users, translating input to meet the requirements, defining boundaries for input, and providing clear feedback to the user. At the same time be very specific in what you are asking the user to do.

![Postel's Law](./media/interaction-design/postel.svg)

## Power Platform facilitation

Although some interaction implementation has been encapsulated into the modern components themselves, these rules should also be considered on the scope of the screen layout or overall application flow.

## Related links

Related links here.

## Experience Optimization checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Experience Optimization checklist](checklist.md)
