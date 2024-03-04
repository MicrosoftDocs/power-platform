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

**Information ecology** describes how systems of information that go into an IA are all interdependent of each other.

| System | Summary | Consequence of disregarding |
| ------ | ---------- | --------------------------- |
| Content | What you have, what you should have, and what you need. | IA will not be flexible and futureproof. |
| Context | The business or personal goals for the project, stakeholders, and constraints. | IA will be ineffective, the project may fail to meet business goals, and problems will persist long-term. |
| Users | What end-users need to do, how they think, and what they already know. | The user experience will not be easy to use and adopt. | 


### Audit content you have
The first step to working with content is to understand what you already have, then determine which content should be used.

**What you have**
* Understand the subject (if you are new to it)
* Look at it with fresh eyes (if you already know it)
* Clean up out-of-date and inaccurate content

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

Keep the following tips in mind when going through this step:

* **List each content once, or document cross-links elsewhere if it's important.** This is crucial for ensuring clarity, consistency, and efficiency in organizing content. By avoiding duplication and maintaining a single representation of each content item, the IA remains streamlined and user-friendly, facilitating effective navigation and enhancing the overall user experience. This approach optimizes the presentation of content, reduces cognitive load for users, and promotes satisfaction and engagement with the website or application. Additionally, documenting cross-links elsewhere enables easier maintenance and updates to the IA, ensuring its continued relevance and usability over time.

* **List all pages, but not always all resources (ie: video, downloadable files, etc).**  Maintain focus on the primary structure and organization of the website's content without overwhelming the process with excessive detail. Pages represent the core navigational elements and primary content destinations for users, so they are crucial for establishing the overall hierarchy and flow of information. However, including every resource, such as images, videos, or downloadable files, can clutter the IA and make it harder to identify and prioritize the most important content.

* **Consider how you'd prepare content for migration and how to track this progress.** Migration of content can be a complex process involving various elements such as restructuring, reformatting, and ensuring data integrity. By considering this aspect early on, organizations can anticipate potential challenges, develop appropriate strategies, and implement effective tracking mechanisms to ensure a smooth and successful migration process. Additionally, tracking progress allows for monitoring milestones, identifying issues promptly, and making necessary adjustments to ensure the integrity and quality of the migrated content. 

### Step 2: Identify and plan for content in scope
Keep in mind the content you choose should meet your users' needs, and also achieve your project goals.

Observe the current behavior related to the project content to gain insights into user preferences, usage patterns, and areas of interest.
* Look at what's being used already, to easily help confirm what you should include or get ideas for content.
* Look at website statistics, both recent and long-term, does usage peak and never get used again?
* Consider what content is heavily used or popular, and why it's popular.
* If content is important but not getting enough use, consider how you can make it easier to find

User research and content brainstorming provides new ideas for content.
Leverage your initial research insights about users to prioritize and use the right content. Pay attention to:
* Gaps in content and uses
* Ways to improve UX functionality for easier completion of tasks
* Consider needs for functional items to improve pain points in UX flows such as templates, tools, et cetera

Evaluate application offerings in the market with similar utility to your project. This provides great inspiration and insight into a perspective other than your own.
* **Consider where popular offerings display information.** Experiences that are widely adopted (across the general population or within a domain) either reflect or influence user expectations. Following standards in the appropriate domain helps meet expectations, ergo influencing better adoption.
* **Identify which information is the common denominator.** The common denominators are core content elements that are essential to users, allowing for prioritization and optimization of the IA to ensure these key components are readily accessible and effectively communicated.
* **Is the website or application easy to navigate?** Just because an offering is well-adopted doesn't necessarily mean it's also easy to navigate. Certain experiences may be catering to specific audiences with a specialized knowledge or skill set, which may not be applicable to your project. For example, peer-reviewed research databases are widely accepted, but may not be a good pattern for business applications that have a different purpose.
* **What makes it good or bad?** Clearly understanding both positive and negative aspects of existing applications helps identify best practices to emulate and pitfalls to avoid, ultimately leading to a more user-friendly and successful product.

### Communicate your IA and content plans throught the project
Content shouldn't be treated as an afterthought, because content is the application. Ensure project content is clearly communicated and understood by all important stakeholders from the beginning of the planning throughout.

There are strategies to communicate content needs to colleagues while the IA is still being developed:
- **Show what content exists.** Keep the inventory clearly defined and easily accessible to all stakeholders involved in planning.
- **Discuss what should be deleted or rewritten.** Content should relevent and accurate, otherwise it won't be helpful to include. 
- **Identify priorities for updating and adding content.** Identifying priorities for updating and adding content enables strategic resource allocation to address critical areas first, ensuring relevance, accuracy, and alignment with user needs and business goals.
- **Consider content goals, format, length, audiences, accuracy, etc.** These factors guide the development and implementation of content strategy, ensuring that all stakeholders are aligned and aware of the criteria for creating effective content that meets project goals and user needs.
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
