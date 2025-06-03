---
title: Identify and mitigate canvas apps performance issues
description: Discover best practices to spot and resolve slowdowns in canvas apps. Improve speed and user experience with proven tips.
#customer intent: As a Power Platform user, I want to identify performance issues in my canvas app so that I can improve speed and user experience.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.subservice: architecture-center
ms.topic: overview
ms.date: 06/03/2025
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/02/2025
---

# Identify and mitigate canvas apps performance issues

Performance issues in canvas apps often appear gradually as the app grows and changes, so they're hard for app developers to notice right away. Small inefficiencies can add up over time, especially as the app uses more data, and can affect user experience and productivity. To prevent these problems, identify and fix potential performance bottlenecks during development instead of waiting until the app is finished. Early detection and fixes keep app performance smooth, reduce costly revisions, and give users a more reliable, friendly experience.

## Cross-screen references

Cross-screen references happen when an app uses controls or variables from one screen on another screen. They can affect performance and make maintenance harder.

### How cross-screen references are created

In canvas apps, cross-screen references happen when one screen directly uses controls or data from another screen. For example, a label on Screen A might reference the value of a text input control on Screen B. This issue usually happens when developers reuse controls or data across multiple screens without clearly separating or managing the data flow.

### Why cross-screen references negatively impact performance

Cross-screen references can slow down app performance because they force Power Apps to load and evaluate multiple screens at the same time, even if the user is only using one screen. This extra loading and evaluation increases memory use and processing overhead, which slows the app's responsiveness and causes delays in user interactions.

For example, to show Screen A, Power Apps interprets the formulas for all controls on Screen A. Because the label on Screen A needs information from the text control on Screen B, Power Apps must also fully load Screen B and interpret its formulas to get the needed value. You need to wait for both Screen B and Screen A to load before Screen A appears.

Cross-screen references also make the app harder to maintain and debug. Changes in one screen can unintentionally affect other screens, which leads to unexpected behavior and increased complexity.

### How to identify cross-screen references

To find cross-screen references in your canvas apps:

- Review your app's formulas and look for references to controls or variables from other screens.
- Use the built-in App Checker tool in Power Apps Studio. It highlights potential performance issues, including cross-screen references. These references appear in the performance section of the Apps Checker, under the "Insufficient Delay Loading" heading.

### How to mitigate cross-screen references

To avoid cross-screen references and improve performance, follow these best practices:

- **Use variables or collections**: Instead of referencing controls on other screens, store shared data in variables or collections. This approach separates data from UI elements and reduces unnecessary dependencies.
- **Pass data through navigation parameters**: When you go between screens, pass needed data as parameters. This method keeps each screen self-contained and loads only the data it needs.
- **Encapsulate logic**: Keep logic and data handling within the same screen, or use reusable components to handle functionality. This practice reduces complexity and prevents unintended cross-screen dependencies.

## Select N+1 data queries

Select N+1 data queries happen when an app makes one query to get a list of records, then makes more queries for each record. This pattern causes performance issues and longer load times.

### How Select N+1 data queries are created

In canvas apps, Select N+1 queries usually happen when an app gets a list of items from a data source (the initial query), then runs more queries for each item to get related details or data. For example, an app might first get a list of customer orders (the initial query), then for each order, separately gets customer details or product information (the more queries). This pattern means one initial query plus "N" more queries, where "N" is the number of items from the first query—so it's called "Select N+1."

This scenario often happens when developers use functions like `LookUp`, `Filter`, or `First` inside loops or galleries. The app keeps querying the data source for each item shown.

### Why Select N+1 queries negatively impact performance

Select N+1 queries can slow down app performance because each extra query adds more network calls, processing, and delay. Instead of getting all the needed data in one step, the app keeps talking to the data source. This causes delays and makes the app feel slow. As the number of items grows, the performance impact gets worse, and users might get frustrated.

For example, an app might show a gallery of 50 customer orders. If the app gets the initial list of orders with one query, that's one network call. If the app uses a separate `LookUp` function in the gallery to get customer details for each order, it makes 50 more network calls—one for each order. This means 51 network requests in total (one initial query plus 50 more), which increases network traffic and delay compared to getting all the data in one step.

### How to identify Select N+1 queries

To find Select N+1 queries in your canvas app:

- Check your app's formulas, especially in galleries, loops, or repeated controls, for functions like `LookUp`, `Filter`, or `First` that use external data sources.
- Use the built-in App Checker tool in Power Apps Studio. It highlights possible performance issues, like inefficient data queries. These issues usually show up under the `Performance` section as inefficient data operations or too many data calls.
- Check network requests with browser developer tools or Power Apps Monitor to see if there are repeated calls to the same data source when loading or using your app.

### How to mitigate Select N+1 queries

To fix Select N+1 queries and make your app faster, try these tips:

- **Batch data retrieval**: Get all the needed data in one query or as few queries as possible. For example, use a single `Collect` or `ClearCollect` operation to get related data up front, then use this local collection in your galleries or loops.
- **Use collections and variables**: Store data you use often in collections or variables at the start of your app or when a screen loads. This approach cuts down on repeated calls to the data source and makes your app respond faster.
- **Leverage delegation**: Make sure your queries are delegable, so the data source handles filtering and sorting. Delegation cuts the amount of data sent to your app and avoids extra processing.
- **Optimize the data structure**: If you can, change your data source to include related data in one table or view. This reduces the need for more lookups or queries.

By finding and fixing Cross-screen References and Select N+1 query patterns early, you make your canvas app faster, more responsive, and easier to use.

## Further reading

You might run into issues, depending on your app and usage patterns.


Clear coding standards and a strong community that shares those standards and their benefits help you build apps at scale.



## Related information
- [Nurturing a Power Platform community within your organization](/power-platform/guidance/adoption/nurture-best-practices)
- [Power Apps coding guidelines](/power-apps/guidance/coding-guidelines/overview)
- [Troubleshooting canvas app performance issues](/troubleshoot/power-platform/power-apps/canvas-app-performance/troubleshoot-perf-table)