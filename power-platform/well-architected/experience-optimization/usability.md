---
title: Recommendations for prioritizing ease of use
description: Learn how to prioritize ease of use to ensure consistent success with user experience optimization.
author: RobStand
ms.author: rstand
ms.reviewer: robstand
ms.date: 01/31/2024
ms.subservice: guidance
ms.topic: conceptual
---

# Recommendations for prioritizing ease of use

**Applies to this Power Well-Architected Experience Optimization checklist recommendation:**

|[EO:01](checklist.md)| **Assess the ease of use and engagement of the experiences. Optimize for learnability, efficiency, memorability, error encounters and recovery, and satisfaction.** |
|---|---|

This guide describes the recommendations for improving usability in user interface design. Usability refers to the ease of use and effectiveness of a product for its intended users. It's crucial because it directly impacts user satisfaction, errors, and overall interactions with the digital interface, ultimately affecting the success of an application.

## Key design strategies

Usability is a quality attribute that assesses how easy user interfaces are to use. The word "usability" also refers to methods for improving ease-of-use during the design process.

Usability is defined by 5 quality components:
1. _Learnability:_ How easy tasks can be attained during the first usage and how quickly users learn from the previous experience?
1. _Efficiency:_ Once users have learned the design, how quickly can they perform tasks?
1. _Memorability:_ When users return to the design after a period of not using it, how easily can they reestablish proficiency?
1. _Errors:_ How many errors do users make, how severe are these errors, and how easily can they recover from the errors?
1. _Satisfaction:_ How pleasant is it to use the design?

Consider these strategies for ensuring usability for your workload:

### Visibility of system status
The system should always keep users informed about what is going on, through appropriate feedback within a reasonable time.

![Alt](./media/usability/h1.svg)

### Match between system and the real world
The system should speak the users' language, with words, phrases and concepts familiar to the user, rather than system-oriented terms. Follow real-world conventions, making information appear in a natural and logical order.

![Alt](./media/usability/h2.svg)

### User control and freedom
Users often choose system functions by mistake and will need a clearly marked "emergency exit" to leave the unwanted state without having to go through an extended dialogue. Support undo and redo.

![Alt](./media/usability/h3.svg)

### Consistency and standards
Users should not have to wonder whether different words, situations, or actions mean the same thing.

![Alt](./media/usability/h4.svg)

### Error prevention
Even better than good error messages is a careful design which prevents a problem from occurring in the first place. Either eliminate error-prone conditions or check for them and present users with a confirmation option before they commit to the action.

![Alt](./media/usability/h5.svg)

### Recognition rather than recall
Minimize the user's memory load by making objects, actions, and options visible. The user should not have to remember information from one part of the dialogue to another. Instructions for use of the system should be visible or easily retrievable whenever appropriate.

![Alt](./media/usability/h6.svg)

### Flexibility and efficiency of use
Accelerators — unseen by the novice user — may often speed up the interaction for the expert user such that the system can cater to both inexperienced and experienced users. Allow users to tailor frequent actions.

![Alt](./media/usability/h7.svg)

### Aesthetic and minimalist design
Dialogues should not contain information which is irrelevant or rarely needed. Every extra unit of information in a dialogue competes with the relevant units of information and diminishes their relative visibility.

![Alt](./media/usability/h8.svg)

### Help users recognize, diagnose, and recover from errors 
Error messages should be expressed in plain language (no code), precisely indicate the problem, and constructively suggest a solution.

![Alt](./media/usability/h9.svg)

### Help and documentation
Even though it is better if the system can be used without documentation, it may be necessary to provide help and documentation. Any such information should be easy to search for, focused on the user's task, list concrete steps to be carried out, and not be too large.

![Alt](./media/usability/h10.svg)

## Power Platform facilitation

Although some interaction implementation has been encapsulated into the modern components themselves, these rules should also be considered on the scope of the screen layout or overall application flow.

## Related links

Related links here.

## Experience Optimization checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Experience Optimization checklist](checklist.md)
