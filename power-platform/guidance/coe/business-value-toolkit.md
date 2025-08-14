---
title: Business value toolkit
description: The CoE Starter Kit contains useful components for measuring and communicating the value of Power Platform solutions.
author: stjeffer
ms.topic: how-to
ms.date: 08/07/2024
ms.subservice: guidance-toolkit
ms.author: stjeffer
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Capture and communicate value with the Business value toolkit

Measuring and communicating the value of solutions built in the Power Platform is a crucial step in ensuring success and return on investment. Power Platform provides a low-code/no-code platform for building applications, automating tasks, streamlining business processes, and infusing AI into your solutions. These capabilities can bring significant benefits and it's important to track and measure the value to the business that the platform is delivering.

## Common challenges

Capturing and communicating value can be a complicated process, presenting several challenges that organizations frequently encounter. These challenges include:

| **Challenge**                           | **Description**                                                                                                         |
|------------------------------------------|-------------------------------------------------------------------------------------------------------------------------|
| **Navigating complexity**                | Organizations often have hundreds, thousands, or even tens of thousands of apps and flows, lacking a clear starting point for value measurement.  |
| **Skills availability**                  | Measuring value is a complex task, requiring diverse expertise that organizations might not always possess.                |
| **Resource constraints**                 | Limited resources often mean that only a few success stories are documented each year, typically averaging between three and four.     |

## The Business value toolkit

The Business value toolkit is a collection of sample apps and processes designed to address these challenges. It provides a comprehensive framework to capture and communicate the value of Power Platform solutions effectively. By guiding app owners through a structured storytelling process, enhanced by AI to both refine the narrative and analyze its effect on organizational strategic objectives, the toolkit helps transform raw insights into compelling success stories.

### A structured approach to storytelling

At the heart of assessing broadly used apps is a five-stage storytelling framework. This framework captures the journey of each app, focusing on:

1. The problem or challenge
2. The solution
3. The obstacles
4. The value
5. The next steps

By using generative AI, the toolkit enhances these raw stories, refining them into polished narratives. Once approved, these stories are automatically created as SharePoint pages, and ready for further refinement, such as adding images or screenshots. This process allows organizations to move from a position of scarcity, where success stories are rare and require effort, to one of enrichment, with a backlog of well-documented stories.

### Strategic alignment and value analysis

The toolkit goes beyond storytelling. It includes an analytical process that evaluates each story against the strategic objectives of the organization. This process assesses alignment and impact, offering a broader view of value previously hidden.  

:::image type="content" source="media/strategic-alignment-analysis.png" alt-text="Screenshot of strategic alignment screen.":::

App owners review the analysis results and select the findings they agree with, utilizing a built-in value calculator to further assess impact, featuring the _average cost of things_ such as the cost of processing an invoice, to quantify overall value. This data is stored in Microsoft Dataverse, facilitating the creation of insightful dashboards.

### Quantifying value with the value calculator

A key feature of the value assessment is the value calculator, empowering organizations to tangibly quantify the impact of their solution. The calculator, using the concept of the _average cost of things_, facilitates the input of specific metrics aligned with strategic objectives. For instance, it allows app owners to delineate key performance indicators, such as the number of invoices processed per hour, both before and after implementing the app. By capturing these metrics, the calculator paints an accurate and granular picture of value, deriving the tangible benefits from solution deployment.

:::image type="content" source="media/value-calculator.png" alt-text="Screenshot of value calculator screen.":::

#### Communicate value with value cards

When completed, this data is presented as _value cards_, which are a clear, concise representation of the data collected. Value cards are designed to inspire organizations by illustrating various ways to showcase and communicate the impact of Power Platform solutions.

:::image type="content" source="media/value-card.png" alt-text="Screenshot of value card summary screen.":::

Value cards can be added to SharePoint to increase the visual impact of your success stories.

:::image type="content" source="media/sharepoint-story-creation.png" alt-text="Screenshot of value card canvas app in SharePoint.":::

### Tailoring approaches for different use cases

Recognizing that not all Power Platform solutions are the same, the toolkit employs different approaches to capture value based on the nature of the solution. For broadly used apps that have a significant impact across the organization, the storytelling process is invaluable. It provides a detailed narrative that captures the multifaceted benefits and strategic alignment of these solutions.

However, for personal productivity helpers, such as individual flows that save users time on routine tasks, a more automated and light-touch process is necessary. To efficiently capture the value of these solutions, the toolkit utilizes adaptive cards. These cards are automatically sent to users, soliciting feedback on how many minutes or hours the flow saves them each week. This approach ensures that even the smaller, yet impactful productivity improvements are measured and recorded without requiring extensive manual effort.

:::image type="content" source="media/personal-productivity-helper.png" alt-text="Screenshot of personal productivity assessment.":::

### Assessing ideas and proposals

Anticipating the potential impact of a solution before its actual construction is a proactive approach with many benefits, pivotal for any forward-thinking organization.

- **Alignment with strategic objectives**: By evaluating a proposed solution's potential impact, we ensure it aligns with the overarching strategic goals of the department or organization. This alignment is critical for maximizing resources and driving meaningful progress.

- **Clarity in feature definition**: Through assessment, we outline a clear and comprehensive list of features and use cases. This clarity not only guides development but also fosters a shared understanding among stakeholders, minimizing ambiguity, and maximizing efficiency.

- **Optimized development prioritization**: The insights into the potential impact of various solutions, IT departments can prioritize their development efforts. By focusing on proposals with the highest projected impact, resources are utilized efficiently, driving tangible results and value.

This capability in the Business value toolkit is further enhanced with a function comparing proposals to similar apps and ideas. This comparison is approached from two angles: audience similarity and feature resemblance.

:::image type="content" source="media/bv-proposal-assessment.png" alt-text="Screenshot of proposal assessment screen":::

This dual-pronged approach ensures that proposed solutions aren't only aligned with organizational objectives, but also distinct from existing offerings in the tenant. By identifying overlaps and gaps, this capability enables us to make informed decisions, minimize redundancy, and maximize the value of your development efforts.

Learn more about configuring the Business value toolkit in [Set up the Microsoft Power Platform business value toolkit component](setup-business-value-toolkit.md).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
