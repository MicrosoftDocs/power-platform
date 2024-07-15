---
title: Business Value Toolkit | Microsoft Docs
description: The CoE Starter Kit now contains useful components for measuring and communicating the value of Power Platform solutions.
author: stjeffer
ms.topic: conceptual
ms.date: 07/15/2024
ms.subservice: guidance
ms.author: stjeffer
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Capture and communicate value with the Business Value Toolkit

Measuring and communicating the value of solutions built in the Power Platform is a crucial step in ensuring success and return on investment. Power Platform provides a low-code/no-code platform for building applications, automating tasks, streamlining business processes, and infusing AI into your solutions. These capabilities can bring significant benefits and it's important to track and measure the value to the business that the platform is delivering.

## Value is complex, here are some common challenges

Capturing and communicating value can be a complicated process, presenting several challenges that organizations frequently encounter. These challenges include:

| **Challenge**                           | **Description**                                                                                                         |
|------------------------------------------|-------------------------------------------------------------------------------------------------------------------------|
| **Navigating complexity**                | Organizations often have hundreds, thousands, or even tens of thousands of apps and flows, lacking a clear starting point for value measurement.  |
| **Skills availability**                  | Measuring value is a complex task, requiring diverse expertise that organizations may not always possess.                |
| **Resource constraints**                 | Limited resources often mean that only a few success stories are documented each year, typically averaging between three and four.     |

## The Business value toolkit

The Business Value Toolkit is a collection of sample apps and processes designed to address these challenges head-on. It provides a comprehensive framework to capture and communicate the value of Power Platform solutions effectively. By guiding app owners through a structured storytelling process, enhanced by AI to both refine the narrative and analyze its impact on organizational strategic objectives, the toolkit helps transform raw insights into compelling success stories that highlight the true impact of their solutions.

### A structured approach to storytelling

At the heart of assessing broadly used apps is a five-stage storytelling framework. This framework captures the journey of each app, focusing on:

1. The problem or challenge
2. The solution
3. The obstacles
4. The value
5. The next steps

![Storytelling framework screenshot](media\storytelling-framework.png "Screenshot showing the storytelling framework interface")

By leveraging generative AI, the toolkit enhances these raw stories, refining them into polished narratives. Once approved, these stories are automatically created as SharePoint pages, ready for further refinement (such as adding images, screenshots, etc). This process enables organizations to move from a position of scarcity, where success stories are rare and require effort, to one of enrichment, with a backlog of well-documented stories.

![SharePoint Online integration screenshot](media\sharepoint-story-creation.png "Screenshot of SharePoint Online integration")

### Strategic alignment and value analysis

The toolkit goes beyond storytelling. It includes an analytical process that evaluates each story against the strategic objectives of the organization. This process assesses alignment and impact, offering a broader view of value that might have been previously hidden.  

![Strategic alignment screen](media\strategic-alignment-analysis.png "Screenshot of strategic alignment screen")

App owners review the analysis results and select the findings they agree with, utilizing a built-in value calculator to further assess impact, featuring the 'average cost of things' (such as the cost of processing an invoice), to quantify overall value. This data is stored in Microsoft Dataverse, facilitating the creation of insightful dashboards.

### Quantifying value with the value calculator

A key feature of the value assessment is the value calculator, empowering organizations to tangibly quantify the impact of their solution. Leveraging the concept of the 'average cost of things,' the calculator facilitates the input of specific metrics aligned with strategic objectives. For instance, it allows app owners to delineate key performance indicators, such as the number of invoices processed per hour, both before and after implementing the app. By capturing these metrics, the calculator paints an accurate and granular picture of value, deriving the tangible benefits from solution deployment.

![Value calculator screen](media\value-calculator.png "Screenshot of value calculator screen")

#### Communicate value with value cards

When completed, this data is presented as 'value cards', which are a clear, concise representation of the data collected. Value cards are designed to inspire organizations by illustrating various ways to showcase and communicate the impact of Power Platform solutions.

![Value card summary screen](media\value-card.png "Screenshot of value card summary screen")

Value cards can be added to SharePoint Online to increase the visual impact of your success stories:

![Value card canvas app in SharePoint Online](media\sharepoint-story-creation.png "Screenshot of value card canvas app in SharePoint Online")

### Tailoring approaches for different use cases

Recognizing that not all Power Platform solutions are the same, the toolkit employs different approaches to capture value based on the nature of the solution. For broadly used apps that have a significant impact across the organization, the storytelling process is invaluable. It provides a detailed narrative that captures the multifaceted benefits and strategic alignment of these solution.

However, for personal productivity helpers, such as individual flows that save users time on routine tasks, a more automated and light-touch process is necessary. To efficiently capture the value of these solutions, the toolkit utilizes adaptive cards. These cards are automatically sent to users, soliciting feedback on how many minutes or hours the flow saves them each week. This approach ensures that even the smaller, yet impactful productivity improvements are measured and recorded without requiring extensive manual effort.

![Personal productivity assessment](media\personal-productivity-helper.png "Screenshot of personal productivity assessment")

### Assessing Ideas and Proposals

Anticipating the potential impact of a solution before its actual construction is a proactive approach with many benefits, pivotal for any forward-thinking organization:

1. **Alignment with Strategic Objectives:** By evaluating a proposed solution's potential impact, we ensure it aligns with the overarching strategic goals of the department or organization. This alignment is critical for maximizing resources and driving meaningful progress.

2. **Clarity in Feature Definition:** Through assessment prior to development, we outline a clear and comprehensive list of features and use cases. This clarity not only guides development but also fosters a shared understanding among stakeholders, minimizing ambiguity and maximizing efficiency.

3. **Optimized Development Prioritization:** The insights into the potential impact of various solutions, IT departments can prioritize their development efforts. By focusing on proposals with the highest projected impact, resources are utilized efficiently, driving tangible results and value.

This capability in the Business Value Toolkit is further enhanced by a function comparing proposals to similar apps and ideas. This comparison is approached from two angles: audience similarity and feature resemblance.

![Proposal assessment screen](media\bv-proposal-assessment.png "Screenshot of proposal assessment screen")

This dual-pronged approach ensures that proposed solutions are not only aligned with organizational objectives but also distinct from existing offerings in the tenant. By identifying overlaps and gaps, this capability enables us to make informed decisions, minimize redundancy, and maximize the value of your development efforts.

Learn more about configuring the Business Value Toolkit [here](setup-business-value-toolkit.md).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
