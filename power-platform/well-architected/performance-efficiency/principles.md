---
title: Performance Efficiency design principles
description: Understand the design principles of the Performance Efficiency pillar.
author: robstand
ms.author: rstand
ms.reviewer: jhaskett-msft
ms.subservice: well-architected
ms.topic: conceptual
ms.date: 05/10/2024
---

# Performance Efficiency design principles

Performance efficiency is the ability of your workload to adjust to changes in demands. A workload must be able to **handle an increase in load without compromising user experience**. Conversely, **when there's a decrease in load, the workload must conserve its resources**. Capacity, which indicates resource availability (CPU and memory), is a significant factor.

The workload design shouldn't just rely on pre-provisioned capacity, which guarantees performance up to a certain limit. If that limit is exceeded, the workload might have performance issues or even experience outages. When load is under that limit, resources continue to run unnecessarily, incurring costs.

You need a comprehensive strategy to sustain performance targets over time. Performance considerations shouldn't be an afterthought in the design process, only to be addressed when issues arise in production. Instead, **adopt a mindset where performance is a key consideration from the early stages of design**. Initially, build the system without any specific performance targets. But from there, test and measure performance at each stage of development to ensure progress and effectiveness. Continual optimization of these targets throughout the process and incorporating lessons learned from production can significantly mitigate potential issues in advance.

These design principles can help **build your strategy for managing capacity** of resources to sufficiently meet your business requirements for expected usage. Also, reduce waste during off-peak hours. After you've decided on a strategy, solidify your design by using the [Performance Efficiency checklist](checklist.md).

Performance efficiency is about effective use of workload resources. Without a good strategy, you might not be able to anticipate and meet user demands. You might have to resort to an approach of long-term forecasting and pre-provisioned capacity, which doesn't let you take full advantage of your cloud platform.

## Negotiate realistic performance targets

|![Goal icon](../_images/goal.svg) The intended user experience is defined, and there's a strategy to develop a benchmark and measure targets against the pre-established business requirements.|
|--|

From a performance perspective, it's ideal to have well-defined performance targets to start your design process. To set those targets, you need to have a good understanding of the business requirements and the anticipated quality of service that the workload is expected to deliver. Define the expectations in collaboration with the business stakeholders. Instead of only focusing on technical metrics, determine the acceptable effects on the user experience for the key flows.  

There's a circular dependency. You can't measure what you haven't defined, and you can't define without measurement. So, it's also important to **measure the workload performance until you achieve a satisfactory definition of acceptable threshold** with collective agreement.

There's a strong correlation between performance and reliability targets, which help determine the quality of service in terms of performance, availability, and resilience. Without a clear definition, it's challenging to measure, alert for, and test performance. After you establish the targets and identify actual numbers through testing over time, you can implement automation for continuous testing against these targets.

Adhere to best practices in defining targets at the macro level, even if they're approximate or within a range.

|Approach|Benefits|
|-|-|
| **Prepare for effective negotiation** by understanding technical concepts, exploring design possibilities with the available infrastructure, and using results from concrete experimentation, if available.<br><br>**Use historical data** to get visibility into usage patterns and bottlenecks.<br><br>Bring insight from external factors, such as **input from market analysis, experts, and industry standards**. | You can make **informed decisions** based on practical insights.<br><br>The performance targets are focused on user experience that's based on what's feasible, industry best practices, and current market trends. |
| **Collaborate with the business owners** to understand user promises, in terms of quality and regulatory compliance, if applicable.<br><br>**Maintain a broad perspective** and avoid diving into granular details at this stage.<br><br>Be explicit about **what represents acceptable performance**, based on the investments.<br><br>Understand the business context and **anticipated growth**. | You'll **avoid making assumptions** that might not align with the business goals. It also drives clarity and motivation within the workload team.<br><br>Having a business context on functional and nonfunctional requirements might uncover design changes in other Azure Well-Architected pillars and **help you make informed tradeoffs**.<br><br>Defining parameters early on helps avoid costs associated with potential solution redesigns later.<br><br>It enables you to ensure that **performance targets cover future projections**, so you can align current efforts with long-term goals. |
| **Identify the workload flows** and prioritize the flows in the architectural diagram.<br><br>**Define each flow's performance tolerance** as a range from aspirational to unacceptable performance.<br><br>**Evaluate the entry and exit points for each flow**, considering the path's criticality, usage frequency, and architectural intensity. | By prioritizing flows, you can **focus your resources on critical areas** that have the most effect on user and business outcomes.<br><br>By breaking down the system into its parts and dependencies, you understand each component's function and influence on performance. You also become aware of potential issues.<br><br>It helps establish a performance baseline and drive optimization. |
| **Start building a performance model** Consider whether usage patterns show seasonal or daily variations. Factor in the cost, operations, and criticality to the business.<br><br>**Use industry standards to quantify metrics** and aggregation methods, such as using percentiles.<br><br>**Evaluate the demand and supply expectations** and limitations that business constraints impose. <br><br> Incorporate growth prospects. | A performance model provides **insight into optimal use of resources** and helps with strategic planning.<br><br>Industry standards help with benchmarking.<br><br>Future proofing ensures that the performance goals remain relevant and can adapt to changes. |

## Design to meet capacity requirements

|![Goal icon](../_images/goal.svg) Provide enough supply to address anticipated demand.|
|--| 

It's important to proactively measure performance. Measuring performance involves **measuring baselines** and having a preliminary understanding of which components of the system are likely to pose challenges. You can achieve it without conducting a full performance test or through granular optimization. By taking these initial steps, you establish a foundation for effective performance management early in the development lifecycle.

Examine the system as a whole, rather than focusing on individual components. Avoid fine-tuning at this stage. Making granular performance improvements results in tradeoffs in other areas. As you progress through the lifecycle and begin user acceptance testing or move toward production, you can quickly identify which areas require further optimization.

|Approach|Benefit|
|-|-|
| **Evaluate the elasticity demands** for the identified flows.<br><br>**Explore design patterns** that can be implemented across the technology stack, considering the application and the underlying compute and data layers. | You're able to **define scalability requirements** on existing components that need more capacity and the areas where you need extra components to distribute load.<br><br>You're aware of potential bottlenecks in the system and **design compensating controls**, such as adding caching capabilities to decrease latency and system load. |
| **Choose the right resources** across the technology stack, which enables you to meet performance goals and integrate with the system. <br><br>**Consider features** that can fulfill the scalability requirements. <br><br>**Find the right balance between resource allocation and system requirements**, to handle unexpected surges efficiently. | By analyzing the varying capabilities of the resources, you ensure that each component contributes to the **overall functionality and performance of the system**.<br><br>You can **take advantage of the built-in capabilities** that automatically trigger scaling operations.<br><br>Right-sizing resources can meet changes in demand without overprovisioning, which leads to cost savings. |
| **Do capacity planning** based on demand and the capability of selected resources to enrich your performance model. <br> <br>**Use predictive modeling techniques** to forecast anticipated changes in capacity that can occur with predictable and unexpected changes.<br><br>**Define performance targets** that can be translated into technical requirements. | You can **efficiently use resources** and meet the demand without overprovisioning, thereby avoiding unnecessary costs. <br><br>You understand how the design choices affect performance. |
| **Implement a proof of concept** that validates the technical requirements and design choices. | A proof of concept is instrumental in **validating the design** to determine if the system can meet the performance targets and if those targets are realistic. Based on the anticipated load, you can validate whether anticipated capacity can meet the performance targets.<br><br>Also, verify the cost implications of the design choices. |
| **Document your performance testing strategy**.<br><br>Include use cases, different methodologies, and cadence of your test plans. <br><br>Define a process for operation outlined by the performance test plan.<br><br>Triage and prioritize the test cases in the plan. Focus on cases that offer valuable insights into performance targets and align capacity planning. | You ensure that the **right aspects of the system are tested**.<br><br>You can allocate resources effectively and conduct tests in a manner that aligns with the business priorities and requirements. |
| **Document your performance monitoring strategy**.<br><br>Assess metrics at different abstraction levels for each identified flow. |You can **track progress towards attainment** of performance targets throughout the development cycle. |

## Achieve and sustain performance

|![Goal icon](../_images/goal.svg) Protect against performance degradation while the system is in use and as it evolves.|
|--| 

Development isn't a one-time effort. It's an ongoing process. Expect changes in performance as features change. There's variance in user patterns and profiles, even changes from optimizations in other Azure Well-Architected pillars. Any change can strain workload resources.

**Safeguard the system from changes** so that it doesn't slide back on performance targets. **Integrate testing and monitoring in the development process**. Test the system's performance in production with real load and simulate that load with automated testing prior to production. In both cases, you should have monitoring practices in place for verification purposes.

Throughout the development lifecycle, **conduct various types of tests at different stages**. In the initial stages, test the proof of concept to make sure performance results aren't entirely unexpected. As development progresses, conduct **manual, low-effort tests** to establish benchmarks. In the build stage, start developing **automated routine performance tests** that evaluate latency, stress levels, load capacity, and other characteristics defined in the test plans.

Monitoring must be an integral part of that effort, rather than being an isolated exercise. You can **see how the system and its resources perform over time. You can then fine-tune them to maximize their value**, and ensure they continue to meet performance standards.

Keep in mind that performance targets vary over time, in response to changes. Update the performance model based on tested and monitored metrics. Clearly indicate increased, reduced, or no effect on the performance of the flows.

Always be ready to renegotiate and reset expectations with business stakeholders.

|Approach|Benefit|
|-|-|
| **Integrate routine performance tests** in Azure Pipelines.<br><br>Choose pipelines that can integrate tests. Conversely, choose test tools that can be integrated into the pipelines. | Automated tests save time and provide consistency that makes it **easier to detect regressions or improvements**.<br><br>These artifacts allow for continuous monitoring of any deviations or drift over time, so you can maintain consistent performance and quality. |
| **Formalize performance tests as quality gates** that can approve or deny release promotion and the final deployment to production. | These checkpoints ensure that **each stage of deployment meets the required performance standards** before you proceed to the next. The checkpoints help prevent unintended performance regression. <br><br>For instance, if the performance is significantly below expectations, you might block a release until improvements are made. |
| **Set up a repeatable process for monitoring** real transactions in production and deviations against your performance targets. <br><br>Use synthetic transactions in production.<br><br>Set up monitoring alerts on performance regressions. | You want insight into the **actual performance of your system under real-world load** that couldn't be simulated through tests.<br><br>Then you can proactively identify issues and areas of improvement such as potential bottlenecks, underutilized resources, and other concerns. |
| **Review performance test results and monitoring data** meticulously and optimize until you meet the performance targets.<br><br>Prioritize actions derived from those reviews and add them to the backlog for planned execution. | Based on test results, **you can capture and compare data** and start analyzing trends.<br><br>Your optimization efforts are data driven. |
| **Build coding skills that focus on performance**. <br><br>Have coding standards that exemplify performance-driven coding patterns. | Code that doesn't have performance issues can make **testing cycles more efficient** because tests can be focused on more significant issues.<br><br>Coding patterns helps avoid rework and keeps your coding style consistent. |
| **Address performance erosion** as usage increases, features change, and data accumulates over time to sustain performance.<br><br>Reset expectations and establish new targets, if fine-tuning brings only short-term benefits. | You can **preserve the performance state** before degradation develops into problems that negatively affect user experience beyond the acceptable range.<br><br>Changing targets resets the performance model, and you don't waste time in optimizing the system that has already reached its capacity. |

## Improve efficiency through optimization

|![Goal icon](../_images/goal.svg) Improve system efficiency within the defined performance targets to increase workload value.|
|--|

The targets set during the initial phase are based on a reasonable level of user experience, considering various constraints. You should **reassess and adjust targets to further enhance the experience**. To further enhance the experience, it requires a clear understanding of how the system is used, how it has evolved, and how the platform or technology has changed over time. The cycle of monitoring, optimizing, testing, and deploying is a continuous process.

Efficiency optimization efforts allow a workload to work with lower resource consumption. They can cause the workload to be in an overprovisioned state with spare capacity. Use that capacity to improve reliability of the system. Eliminate capacity to improve the cost of the system. Or repurpose the capacity to support new product features on existing resources.

When the system gains efficiencies, take the opportunity to set and maintain new performance targets.

|Approach|Benefit|
|-|-|
| **Allocate dedicated cycles for performance optimization** to address nonfunctional requirements and optimizations in functional areas. Targets for this optimization are resources, code, data retention, database queries, and others. | You can **build a culture of performance-driven optimization**. You keep the team accountable for proactively monitoring performance patterns and also fine-tune the application. |
| **Enhance the architecture with new design patterns and components**, which can boost performance, in ways that you previously didn't consider because of limited time or budget. | New design and components can optimize the system, **leading to better user experience**. For example, you can use caching or adding a content delivery network component.<br><br> It can also lead to long-term cost benefits. |
| **Use monitoring tools to analyze historical trends** and to identify the flows and code implementation paths that would benefit the most from a performance optimization effort. We recommend application performance monitoring (APM) tools and profilers for this purpose.<br><br> Identify operation hot paths and other potential bottlenecks in the system. | When you identify the recurring problematic areas, the team can **focus where gains are the highest**. |
| **Get current and stay current with technology innovations** that can improve performance. <br><br>Take advantage of the new versions released for the dependent frameworks and libraries.<br><br>Similarly, use the new features for platform resources as they're updated and patched. | Adopting new technology can often be the motivating factor to **look for opportunities to improve**. <br><br>Code that might have been slow in the past can become faster with these updates. You also want to be aware of how certain updates negatively affect performance. |

## Next steps

> [!div class="nextstepaction"]
> [Performance Efficiency checklist](checklist.md)