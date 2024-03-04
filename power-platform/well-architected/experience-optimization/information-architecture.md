---
title: Recommendations for implementing an information architecture
description: Learn how to implement an information architecture to ensure consistent success with user experience optimization.
author: RobStand
ms.author: rstand
ms.reviewer: robstand
ms.date: 01/31/2024
ms.subservice: guidance
ms.topic: conceptual
---

# Recommendations for implementing an information architecture

**Applies to this Power Well-Architected Experience Optimization checklist recommendation:**

|[EO:01](checklist.md)| **TODO** Update with checklist details for this item |
|---|---|

This guide describes the recommendations for designing an effective information architecture (IA) for your project. Any high-quality user experience starts with the foundation of a well-planned information architecture. Information architecture is how you organize your content to be consumable and sustainable. Well-planned information architectures greatly benefit both users and product-makers by reducing overhead and ensuring effective user experience.

**Product-makers**
- Balances project requirements and user needs.
- Helps with where and how to place new content without disrupting existing content and site structure.
- Minimizes impact of bias and politics that may surface during development.
- Leverages IAs to generate wireframes and a sitemap of the project

**Users**
- Helps create effective and optimal experiences.
- Allows them to effortlessly understand content, especially when using for the first time

## Key design strategies

A successful IA is made up of four systems that are ultimately applied to the user interface:
1. **Labeling systems**. How information is represented.
1. **Organization systems**. How information is structured.
1. **Search systems**. How users look for information.
1. **Navigation systems**.  How users browse or move through information.

<!---  TODO: DELETE IF TABLE IS ACCEPTABLE

- **Content**. What you have, what you should have, and what you need.
- **Context**. The business or personal goals for the project, stakeholders, and constraints.
- **Users**. What they need to do, how they think, what do they already know.

Without a good understanding of these three things, you can’t create an effective IA.
If you don’t know enough about users, you won’t be able to make your experience easy to use.
If you don’t know about context, you won’t be able to create something that works for people, the business, and problems will plague your project.
--->

Information ecology describes how systems of information that go into an IA are all interdependent of each other.
| System | Summary | Consequence of disregarding |
| ------ | ---------- | --------------------------- |
| Content | What you have, what you should have, and what you need. | IA will not be flexible and futureproof. |
| Context | The business or personal goals for the project, stakeholders, and constraints. | IA will be ineffective, the project may fail to meet business goals, and problems will persist long-term. |
| Users | What end-users need to do, how they think, and what they already know. | The user experience will not be easy to use and adopt. | 


### Define and plan the content in scope
Ensure thorough understanding of existing content, align content with user needs and project goals through research and analysis, and facilitate clear communication to effectively manage and optimize website content for improved functionality and user experience.

#### Step 1: Audit content you have
The first step to working with content is to understand what you already have, then determine which content should be used.

:::row:::
   :::column span="":::
      **What you have**
      * Understand the subject (if you are new to it)
      * Look at it with fresh eyes (if you already know it)
      * Clean up out-of-date and inaccurate content
   :::column-end:::
   :::column span="":::
      **What to collect**
      * Collect only what you’ll need, and nothing more
      * Each link's name (the label that will be used in navigation)
      * Page names (main heading on a page, which should be the same as link name)
      * Page url (if applicable)
      * Content type (article, FAQ, report, or something else?)
      * Resources (PDFs, images, videos, etc)
      * Status / date last updated
      * Content owners
      * Comments (anything you want to note)
   :::column-end:::
:::row-end:::

Keep the following tips in mind when going through this step:

* **List each content once, or document cross-links elsewhere if it's important.** This is crucial for ensuring clarity, consistency, and efficiency in organizing content. By avoiding duplication and maintaining a single representation of each content item, the IA remains streamlined and user-friendly, facilitating effective navigation and enhancing the overall user experience. This approach optimizes the presentation of content, reduces cognitive load for users, and promotes satisfaction and engagement with the website or application. Additionally, documenting cross-links elsewhere enables easier maintenance and updates to the IA, ensuring its continued relevance and usability over time.

* **List all pages, but not always all resources (ie: video, downloadable files, etc).**  Maintain focus on the primary structure and organization of the website's content without overwhelming the process with excessive detail. Pages represent the core navigational elements and primary content destinations for users, so they are crucial for establishing the overall hierarchy and flow of information. However, including every resource, such as images, videos, or downloadable files, can clutter the IA and make it harder to identify and prioritize the most important content.

* **Consider how you'd prepare content for migration and how to track this progress.** Migration of content can be a complex process involving various elements such as restructuring, reformatting, and ensuring data integrity. By considering this aspect early on, organizations can anticipate potential challenges, develop appropriate strategies, and implement effective tracking mechanisms to ensure a smooth and successful migration process. Additionally, tracking progress allows for monitoring milestones, identifying issues promptly, and making necessary adjustments to ensure the integrity and quality of the migrated content. 

#### Step 2: Identify content needed
Keep in mind the content you choose should meet your users' needs, and also achieve your project goals.

:::row:::
   :::column span="":::
      **Current behavior**
      * Look at what’s being used already, to easily help confirm what you should include or get ideas for content
      * Look at website statistics, both recent and long-term, does usage peak and never get used again?
      * Consider what content is heavily used or popular, and why it's popular
      * If content is important but not getting enough use, consider how you can make it easier to find
   :::column-end:::
   :::column span="":::
      **User research & content brainstorm**
      Leverage your initial research insights about users to prioritize and use the right content. Pay attention to:
      * Gaps in content and uses
      * Ways to improve UX functionality for easier completion of tasks
      * Consider needs for functional items to improve pain points in UX flows such as templates, tools, et cetera
   :::column-end:::
   :::column span="":::
   **Market analysis**
   You can learn a lot by looking at application offerings in the market with similar utility to your project. This provides insight into a perspective other than your own. Consider:
   * Where do they display information?
   * Which information is the common denominator?
   * Is the website or application easy to navigate?
   * What makes it good or bad?
   :::column-end:::
:::row-end:::

### Step 3: Communicating your content
Content shouldn't be treated as an afterthought, because content is the website. Ensure project content is clearly communicated and understood by all important stakeholders from the beginning of the planning throughout.

There are several ways you can communicate your content needs to colleagues without an IA already in place:
- Show what content exists
- Discuss what should be deleted or rewritten
- Identify priorities for updating and adding content
- Consider content goals, format, length, audiences, accuracy, etc.
- Record all content ideas in one place
- Manage project activities such as content updates and migration

Leverage your initial user research insights about your users to prioritize and use the right content. Pay attention to:
- Gaps in content and uses
- ways to improve UX functionality for easier completion of tasks
- consider needs for functional items to improve painpoints in UX flows such as templates, tools, and such

* **Collaborate closely with content authors (such as designers or writers) if available.** Content authors possess valuable insights into the content itself, including its purpose, audience, and intended messaging. Their input ensures that the IA accurately reflects the content's goals and effectively serves its intended audience. Additionally, content authors can provide valuable feedback on the organization and presentation of content, helping to optimize the IA for usability and engagement. Collaborating with designers ensures that the IA is visually appealing and aligns with the overall design aesthetic of the website or application. By involving content authors early in the planning process, potential conflicts or inconsistencies can be identified and addressed proactively, leading to a more cohesive and user-centric information architecture.

* **Involve your entire team from start to finish.** Inclusion throught IA planning ensures a holistic understanding of project objectives, promotes cross-functional collaboration, and harnesses diverse perspectives and expertise. You can leverage everyone's unique insights and skills to address complex challenges, identify opportunities for improvement, and develop a comprehensive IA that aligns with organizational goals and user needs. Involving the entire team also fosters a sense of ownership and commitment, leading to better buy-in and support for the IA implementation and maintenance phases, ultimately resulting in a more successful and sustainable outcome.

* **Reference user research to target content and key decisions.** Use research helps validate whether the IA is aligned with the needs and behaviors of the target audience. Insights from research help make informed decisions about content organization, navigation structure, and user interactions, which ultimately create an IA that resonates with users and supports their goals. This practice promotes user-centricity and leads to more effective IAs that enhances the overall experience.

### Design strategy 2

Details

## Power Platform facilitation

Power Platform details here...

## Related links

Related links here.

## Experience Optimization checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Experience Optimization checklist](checklist.md)
