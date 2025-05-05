---
title: Identifying and mitigating the top canvas app performance issues 
description: Discussion of the top performance issues found in enterprise canvas apps, how to mitigate them, and when to be proactive about it
author: ghurlman
ms.author: grhurl
ms.date: '4/14/2025'
ms.topic: overview
ms.subservice: architecture-center
---
# Identifying and Mitigating the Top Canvas App Performance Issues

Performance issues in canvas apps often emerge gradually as the app grows and evolves, making them difficult for app developers to notice immediately. These subtle inefficiencies can accumulate over time, often growing in scale with the amount of data the app is using, eventually impacting user experience and productivity. To effectively prevent these problems, it's crucial to proactively identify and address potential performance bottlenecks during the development process, rather than waiting until the app is complete. Early detection and mitigation help ensure smoother app performance, minimize costly revisions, and deliver a more reliable and user-friendly experience.

## Cross-screen references

### How cross-screen references are created

In canvas apps, cross-screen references occur when one screen directly accesses or depends on controls or data from another screen. For example, you might have a label on Screen A that directly references the value of a text input control located on Screen B. This typically happens when developers reuse controls or data across multiple screens without clearly separating or managing the data flow.

### Why cross-screen references negatively impact performance

Cross-screen references can significantly degrade app performance because they force Power Apps to load and evaluate multiple screens simultaneously, even if the user is only interacting with one screen at a time. This unnecessary loading and evaluation increases memory usage and processing overhead, slowing down the app's responsiveness and causing delays in user interactions.

Using the above example: in order for Power Apps to display Screen A, the formulas for all controls on Screen A are interpreted. In order to do that, because the label on screen A needs information from the text control on screen B, then screen B must be fully loaded and formulas interpreted to get the value needed. So, you have to wait for both Screen B and Screen A to load before Screen A can be shown.

Additionally, cross-screen references make the app harder to maintain and debug, as changes in one screen can unintentionally affect other screens, leading to unexpected behaviors and increased complexity.

### How to identify cross-screen references

To identify cross-screen references in your canvas app, you can:

- Review your app's formulas and look for references to controls or variables that belong to other screens.
- Use the built-in App Checker tool in Power Apps Studio, which highlights potential performance issues, including cross-screen references. These references show up in the performance section of the App Checker, under the "Insufficient Delay Loading" heading.

### How to mitigate cross-screen references

To mitigate cross-screen references and improve performance, follow these best practices:

- **Use variables or collections**: Instead of directly referencing controls on other screens, store shared data in variables or collections. This approach clearly separates data from UI elements and reduces unnecessary dependencies.
- **Pass data through navigation parameters**: When navigating between screens, pass necessary data as parameters. This ensures each screen is self-contained and only loads the data it needs.
- **Encapsulate logic**: Keep logic and data handling within the same screen or use reusable components to encapsulate functionality. This reduces complexity and prevents unintended cross-screen dependencies.

By proactively identifying and addressing cross-screen references, you can significantly enhance your canvas app's performance, maintainability, and user experience.

