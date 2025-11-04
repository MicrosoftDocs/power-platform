---
title: Choose the best methods and tools to measure business value
description: Explore key methodologies for measuring the business value of Power Platform solutions to ensure success.
#customer intent: As a business leader, I want to learn how to measure the business value of Power Platform solutions so that I can ensure success and optimize resources.
author: stjeffer
contributors:
  - manuelap-msft
  - robertsmith-bvm
  - jean-romero
ms.author: mapichle
ms.contributors:
  - manuelap-msft
  - robertsmith-bvm
  - jean-romero
ms.component: pa-admin
ms.topic: concept-article
ms.date: 05/14/2025
ms.subservice: guidance
ms.reviewer: jhaskett-msft
search.audienceType:
  - admin
ms.custom:
  - bap-template
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:03/07/2025
---

# Choose the best methods and tools to measure business value

[Measuring the business value](business-value.md) of Power Platform solutions is essential to ensure success and return on investment. By evaluating the impact of Power Platform solutions, organizations can identify areas for improvement, optimize resources, and demonstrate the value of their investments to stakeholders. 

This article provides guidance on how to measure the business value of Power Platform solutions, including how to choose the best methods and tools, and walks you through an example scenario to help demonstrate the process.

## Methodologies

Measuring the business value of Power Platform solutions involves qualitative and quantitative methods to ensure a comprehensive evaluation. Here are some key methodologies to consider:

- **Stakeholder interviews**: Interviews are invaluable for qualitative insights. Engage with individuals involved in or impacted by the solution. Ask about their experiences, challenges, and perceived improvements. Consider using structured interview guides to ensure consistency and depth in responses.
- **Surveys and feedback forms**: Surveys are excellent for quantitative data. They let you collect structured feedback from a larger audience, including end-users and team members. Use a mix of closed and open-ended questions to capture both measurable data and detailed feedback.
- **Key performance indicators (KPIs)**: KPIs provide quantifiable data about the solution’s performance. Monitor metrics like response times, resolution times, error rates, user adoption rates, and cost savings. Ensure KPIs align with business objectives.
- **User analytics**: User analytics tools help understand user behavior and interaction with the solution. Track adoption rates, feature usage, and user engagement. Tools like Power BI visualize this data for better insights.
- **Return on investment (ROI) calculators**: Calculating ROI involves comparing implementation costs against the benefits obtained. Consider both tangible and intangible benefits, such as efficiency gains, user satisfaction, and reduced operational costs. Use standardized ROI calculation methods to ensure accuracy.
- **360-degree feedback**: Gather feedback from all angles, from end-users and customers to support agents and IT teams. This holistic approach ensures a comprehensive view of the solution's impact. Use Microsoft Forms to facilitate this process.
- **Data integration and automation**: Automating data collection and integration with Power Platform tools ensures accurate and real-time data for measurement, reducing manual entry. Use connectors and APIs to streamline data flow between systems.
- **Periodic reviews**: Periodic reviews and assessments help you track progress over time and make informed adjustments based on evolving needs. Schedule regular review meetings and use dashboards to present key metrics and insights.
- **Benchmarking**: Compare the performance of your Power Platform solutions against industry standards or similar implementations within your organization. Benchmarking helps identify areas for improvement and set realistic performance targets.

## Choose the best value measurement method and tool

Choosing the best value measurement method and tool involves considering several key factors. Here are some steps to guide you:

- **Define your objectives**: Clearly outline what you aim to achieve with the measurement. Include improving efficiency, tracking progress, or demonstrating value to stakeholders.
- **Identify key metrics**: Determine specific metrics to help you measure value, such as financial metrics, performance indicators, or customer satisfaction scores.
- **Evaluate automation capabilities**: Look for tools that offer robust automation features. Automation can save significant time by reducing manual data entry and ensuring consistent data collection.
- **Assess reporting features**: Choose tools that provide comprehensive reporting capabilities like customizable reports, real-time data visualization, and the ability to export data in various formats.
- **Consider integration**: Ensure the tool can integrate with your existing systems so that you can streamline data flow and reduce the need for duplicate data entry. For example, consider integrating a feedback mechanism directly within the app to streamline the process for users. This approach eliminates the need for users to leave the app and navigate to an external form or system. By embedding feedback options within the app interface, you capture real-time insights and improve user engagement.
- **Scalability**: Stakeholder interviews and 360-degree feedback are valuable but can be time-intensive for participants. To maximize their effectiveness, use these methods purposefully for high-impact scenarios. Focus on situations where comprehensive insights are important.

## Value measurement at scale

Here are the recommended methods for measuring business value at scale based on the use case:

| Use case | Characteristics | Identification | Methodology |
| --- | --- | --- | --- |
| Everybody | Large number of users, smallest number of solutions | Metadata and telemetry | [Business value toolkit](#business-value-toolkit) |
| Broad use | Used by team, project, or department.<br>May be critical to business operations.<br>May use premium features. | Metadata and telemetry (for example, between 10-100 users) | [Business value toolkit](#business-value-toolkit)<br>Automation / adaptive cards / surveys |
| Personal use | Smallest number of users, largest number of solutions | Metadata and telemetry (for example, fewer than five users) | Automation / adaptive cards / surveys |

## Scenario: How to measure business value

In the following scenario, you've been asked to measure the business value of digitizing an existing paper-based process. Consider factors such as cost savings, increased productivity, improved compliance, reduction of risk, and better data management.

### Existing process

Your organization's field engineering team must perform a safety inspection of their vehicles daily before beginning their work. The inspection involves identifying any faults or damage, recording the mileage, and noting other relevant details. The team documents inspections on paper forms, which are stored in filing cabinets at each depot. The field engineering fleet consists of 1,000 vehicles. The inspection process takes 2-3 minutes per vehicle and poses challenges for tracking and analyzing the data collected and remaining compliant.

### Measure tangible value

Digitizing the process has the potential to streamline submitting and processing vehicle safety checks. However, the tangible value of digitizing the process is difficult to quantify. Here are some suggestions:

- **Employee productivity and efficiency improvement**: Engineers need to put in some effort to submit vehicle checks. For example, they might need to follow new guidelines to ensure requests are completed accurately. The tangible value of digitizing the process as measured by employee productivity and efficiency is low or difficult to calculate at this point.

- **Cost savings**: Based on the hourly rate of $50 for a field engineer, and assuming each engineer spends 12 hours per year on the process, the total cost to the organization is $600 per engineer, per year.

Based on an analysis of time savings, the potential cost saving of digitizing the process might not be as large as expected. However, there may be intangible benefits of a digitized process&mdash;such as improved data accuracy and faster access to information&mdash;that are difficult to quantify, yet add value to the organization.

### Measure intangible value

Forms are stored in filing cabinets at each depot, which means there's no central visibility or assurance that checks are being performed in a compliant manner. Digitizing the process and establishing a central view on compliance has the following benefits:

- **Reduction of risk**: Reduces the number of unsafe vehicles in operation and increases the number of vehicle checks being carried out.
- **Reduction of cost**: Reduces vehicle maintenance by identifying issues earlier.
- **Improved employee experience**: Improves experience with a simplified process for employees to fill out the form.
- **Improved customer experience**: Improves customer experience with less disruption as vehicles checks are monitored better.

### Business value assessment outcome

By consulting subject matter experts and analyzing the current process, you've established the value of digitizing the process through these measures:

| Measure | Business value | Value type | Value level |
|---------|----------------|------------|-------------|
| Employee productivity | Digitizing the process is unlikely to reduce the amount of time field engineers spend completing paper-based forms. | Tangible | Low |
| Efficiency improvement | Digitizing the process improves early detection of faults. | Intangible | High |
| Reduction of risk | Digitizing the process increases daily safety check compliance and leads to a reduction in unsafe vehicles. | Intangible | High |
| Reduction of cost | There may be earlier detection of vehicle faults creating a reduction in fleet maintenance costs. | Intangible | High |
| Employee experience | Simplifying the process may lead to improved employee satisfaction and engagement as employees can complete their tasks with greater ease and efficiency. | Intangible | Medium |
| Customer experience | Digitizing the process results in less disruption from faulty vehicles. | Intangible | High |

## Business value toolkit

The [Business value toolkit](../coe/business-value-toolkit.md) is a feature of the [Center of Excellence starter kit](../coe/overview.md) that provides a comprehensive framework to capture and communicate the value of Power Platform solutions. It guides app owners through a structured storytelling process, enhanced by AI, to refine the narrative and analyze its impact on organizational strategic objectives. The toolkit helps transform raw insights into compelling success stories that highlight the true impact of their solutions.

Learn more:

- [Set up the Business value toolkit](../coe/setup-business-value-toolkit.md)
- [Use the Business value toolkit](../coe/business-value-toolkit.md)

## Next step

Next, step back and consider the bigger picture of your adoption journey with strategic initiatives or *value plays,* strategies designed to help you identify high-impact opportunities and execute them effectively.

> [!div class="nextstepaction"]
> [Use business value plays](value-plays.md)

[!INCLUDE [footer-include](../../includes/footer-banner.md)]
