---
title: Identifying and mitigating the top canvas app performance issues 
description: Discussion of the top performance issues found in enterprise canvas apps, how to mitigate them, and when to be proactive about it
author: ghurlman
ms.author: grhurl
ms.date: '4/14/2025'
ms.topic: best-practice
ms.subservice: architecture-center
---
# Identifying and Mitigating Canvas App Performance Issues

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

## Select N+1 Data Queries

### How Select N+1 Data Queries are created

In canvas apps, Select N+1 queries typically occur when an app retrieves a list of items from a data source (the initial query), and then for each item in that list, it performs additional queries to fetch related details or data. For example, imagine an app that first retrieves a list of customer orders (the initial query), and then for each order, separately retrieves customer details or product information (the additional queries). This pattern results in one initial query plus "N" additional queries, where "N" is the number of items retrieved initially—hence the name "Select N+1."

This scenario often arises when developers use functions like `LookUp`, `Filter`, or `First` inside loops or galleries, causing the app to repeatedly query the data source for each item displayed.

### Why Select N+1 queries negatively impact performance

Select N+1 queries significantly degrade app performance because each additional query introduces extra network calls, processing overhead, and latency. Instead of retrieving all necessary data in a single efficient operation, the app repeatedly communicates with the data source, causing delays and slowing down the user experience. As the number of items grows, the performance impact becomes increasingly severe, leading to sluggish app responsiveness and frustration for users.

For example, consider an app displaying a gallery of 50 customer orders. If the app retrieves the initial list of orders with one query, that's one network call. However, if the app then uses a separate `LookUp` function within the gallery to fetch customer details for each order individually, it results in 50 additional network calls, one for each order. In total, this scenario generates 51 network requests (1 initial query + 50 additional queries), significantly increasing network traffic and latency compared to retrieving all necessary data in a single, optimized query.

### How to identify Select N+1 queries

To identify Select N+1 queries in your canvas app, you can:

- Review your app's formulas, especially within galleries, loops, or repeated controls, looking for functions like `LookUp`, `Filter`, or `First` that reference external data sources.
- Use the built-in App Checker tool in Power Apps Studio, which highlights potential performance issues, including inefficient data queries. These issues typically appear under the "Performance" section, flagged as inefficient data operations or excessive data calls.
- Monitor network requests using browser developer tools or Power Apps Monitor to observe repeated calls to the same data source when loading or interacting with your app.

### How to mitigate Select N+1 queries

To mitigate Select N+1 queries and improve performance, follow these best practices:

- **Batch data retrieval**: Retrieve all necessary data in a single query or as few queries as possible. For example, use a single `Collect` or `ClearCollect` operation to fetch related data upfront, then reference this local collection within your galleries or loops.
- **Use collections and variables**: Store frequently accessed or related data in collections or variables at the start of your app or screen load. This reduces repeated calls to the data source and improves responsiveness.
- **Leverage delegation**: Ensure your queries are delegable, meaning the data source handles filtering and sorting efficiently. Delegation reduces the amount of data transferred to your app and minimizes unnecessary processing.
- **Optimize the data structure**: If possible, adjust your data source structure to include related data within a single table or view, reducing the need for additional lookups or queries.

By proactively identifying and addressing Cross-screen References and Select N+1 query patterns, you can significantly enhance your canvas app's performance, responsiveness, and overall user experience.
