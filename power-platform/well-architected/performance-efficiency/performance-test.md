---
title: Performance testing recommendation for Power Platform workloads
description: Learn how to test performance and establish best practices for performance testing of a Power Platform workload. 
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 08/15/2025
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for performance testing

**Applies to this Power Platform Well-Architected Performance Efficiency checklist recommendation:**

|[PE:05](checklist.md)|**Test performance. Perform regular testing in an environment that matches the production environment. Compare results against the performance targets and the performance benchmark.**|
|---|---|

This guide describes the recommendations for testing. Performance testing helps you evaluate the functionality of a workload in various scenarios. It involves testing the workload's response time, throughput, resource utilization, and stability to help ensure that the workload meets its performance requirements.

Testing helps to prevent performance issues. It also helps ensure that your workload meets its service-level agreements. Without performance testing, a workload can experience performance degradations that are often preventable. Workload performance can drift from performance targets and established baselines.

**Definitions**

| Term | Definition |
|---|---|
| Chaos testing | A performance test that aims to test the resilience and stability of a system by deliberately introducing random and unpredictable failures or disruptions. |
| Load test | A performance test that measures system performance under typical and heavy load. |
| Performance baseline | A set of metrics that represent the behavior of a workload under normal conditions as validated by testing. |
| Stress test | A performance test that overloads a system until it breaks. |
| Synthetic test | A performance test that simulates user requests in an application. |

## Key design strategies

Performance testing helps you gather measurable data on a workload. Running tests early helps you build workloads to the right specifications. Therefore, conduct performance tests as early as possible in the development lifecycle. Early testing allows you to catch and fix performance issues before you go to production. You can use a proof of concept (POC) if production code isn't ready.

If migrating data from a prior system and migration must be completed in a specific time window, your performance testing should include measuring performance of the data migration.

### Prepare the test

Preparing performance tests refers to setting up and arranging the resources, configurations, and test scenarios that you need to conduct performance testing effectively. A good performance test should simulate how users will use your solution in real life. It should also help you validate whether your solution meets your performance goals.

#### Define acceptance criteria

Acceptance criteria specify the performance requirements that a workload needs to meet to be considered acceptable or successful. Define criteria that align with the performance targets.

_Review performance targets._ Performance targets define your desired level of performance for your workload. Review the performance targets that are established for the workload. Performance targets are metrics that can involve response time, throughput, resource utilization, or any other relevant performance indicators. For example, you might have a target for your response time to be under a certain threshold, such as less than 2 seconds.

_Define acceptance criteria._ Translate the performance targets into specific acceptance criteria that you can use to evaluate the performance of your workload. For example, suppose your performance target for response time is 2 seconds or less. Your acceptance criterion could be _The average response time of the workload should be less than 2 seconds_. Use these acceptance criteria to determine whether the workload meets the desired level of performance.

When you define acceptance criteria, it's important to focus on users and their expectations. Acceptance criteria help ensure that the delivered work meets user needs and requirements. Keep in mind the following considerations for incorporating the user perspective into acceptance criteria:

- User personas: Understand the number and types of users who will use your solution at the same time. Define user personas that represent different roles, locations, security configurations, data sets, and activities.

- User requirements: Understand the user needs and goals for the workload. Consider how the workload should perform to satisfy these requirements. Define day-in-the-life scenarios that reflect the actions users perform on a typical day. Include peak load and normal load scenarios.

- User experience: Define acceptance criteria that capture the desired user experience. Include factors such as response time, usability, accessibility, and overall satisfaction.

- Functional requirements: Address the specific functionality that the user expects to see in the workload. Define acceptance criteria around these functional requirements to help ensure that they're met. Use realistic data volumes for each scenario. Don't use more or less data than users need.

- Infrastructure requirements: Define realistic infrastructure requirements for each scenario. For example, if your users will access your solution from mobile devices with poor connectivity, test your solution under those conditions.

- Use cases: Consider different scenarios or use cases that the user might encounter. Define acceptance criteria based on these use cases to validate the workload's performance in real-world situations.

_Set acceptance thresholds._ Determine the thresholds within the acceptance criteria that indicate whether the workload meets the performance targets. These thresholds define the acceptable range of performance for each metric. For example, suppose the acceptance criterion for response time is less than 2 seconds. You can set the threshold at 2.5 seconds. This level indicates that any response time over 2.5 seconds is considered a performance issue.

_Define passing criteria._ Establish the criteria for determining whether the workload passed or failed the performance test. You might define passing as meeting all the acceptance criteria or achieving a certain percentage of them.

#### Select the test type

To select the right type of performance test, it's important to align the test with your acceptance criteria. The acceptance criteria define the conditions that need to be met for a requirement or bug fix to be considered done. Performance tests should aim to verify whether a workload meets these acceptance criteria and performs as expected under specified conditions. Aligning the performance test type with the acceptance criteria helps ensure that the test focuses on meeting the performance expectations that the criteria define.

- _Understand acceptance criteria_. Review the acceptance criteria for the requirement or bug fix. The criteria outline the specific conditions and functionalities to be met.

- _Identify relevant performance metrics_. Based on the acceptance criteria, determine the performance metrics that are critical to achieving the desired outcomes. For example, if the acceptance criteria focus on response time, prioritizing load testing might be appropriate.

- _Select an appropriate test type_. Evaluate the available test types and choose the one that best aligns with the identified performance metrics and acceptance criteria.

The following table provides a sample of test types and their use cases.

| Test type | Description | Use case |
|---|---|---|
| Load testing | Simulate realistic user loads to measure how your workload performs under expected peak workloads. | Determines load tolerance. |
| Stress testing | Push your workload beyond its normal limits to identify its breaking points and measure its ability to recover. | Determines resilience and robustness. |
| Soak testing (endurance testing) | Run your workload under sustained high loads for an extended period to identify performance degradation, memory leaks, or resource issues. | Evaluates stability and reliability over time. |
| Spike testing | Simulate sudden increases in user load to assess how your workload handles abrupt changes in demand. | Measures the ability to scale and maintain performance during peak periods. |
| Compatibility testing | Test your workload's performance across various platforms, browsers, or devices. | Helps ensure consistent performance across various environments. |

Prioritize your selected test types based on the characteristics and requirements of your workload. Consider factors such as the criticality of performance metrics, user expectations, business priorities, and known issues or vulnerabilities.

#### Select testing tools

Choose appropriate tools based on the type of performance testing that you want to run. Evaluate the testing environment's infrastructure, resources, and constraints. Choose testing tools that support the desired test types and provide the necessary features for monitoring, measurement, analysis, and reporting.

An application performance monitoring (APM) tool provides deep insights into applications and is an essential testing tool. It helps you trace individual transactions and map their paths through various workload services. After testing, you should use the APM tool to analyze and compare testing data against your performance baseline.

Use profiling tools to identify performance bottlenecks in your code. Profiling helps identify areas of the code that consume the most resources and need optimization. It provides insights into the execution time and memory usage of different parts of the code.

The following steps can help you select the appropriate testing tools:

- _Identify testing requirements_. Begin by understanding the specific requirements of your performance testing. Consider various factors:
  - The type of workload
  - Performance metrics to measure, such as response time and throughput
  - The complexity of the workload architecture
  - The testing environment, such as cloud-based, on-premises, or hybrid

- _Research testing tools_. Conduct research to identify performance testing tools that align with your requirements. Consider commercial and open-source tools that are available in the market. Look for tools that support your desired types of performance testing, such as load testing or stress testing, and that provide features for measuring performance metrics.

- _Evaluate tool features_. Assess the features that each testing tool provides. Look for capabilities such as simulation of realistic user behavior and scalability to handle large user loads. Consider support for various protocols and technologies, integration with other testing tools or frameworks, and reporting and analysis capabilities.

- _Consider compatibility and integration_. Determine the compatibility of the testing tools with your existing infrastructure and technologies. Ensure that the tools can be easily integrated into your testing environment and can communicate with the necessary workload for monitoring and analysis.

- _Evaluate cost and licensing_. Assess the cost structure and licensing terms that are associated with the testing tools. Consider factors such as the initial investment, maintenance costs, and support costs. Also consider other licensing requirements that depend on the number of users or virtual users.

- _Conduct a POC_. Select a few tools that appear to be the most suitable based on your evaluation. Conduct a small-scale POC to validate the usability, features, and effectiveness of the tools in your specific testing scenario.

- _Consider support and training_. Evaluate the level of support and training that the tool's vendor or community provides. Determine the availability of documentation, tutorials, and technical support channels to assist with any challenges or issues that might arise during the testing process.

#### Create test scenarios

Creating test scenarios refers to the process of designing specific situations or conditions that are suitable for testing the performance of a workload. Test scenarios are created to emulate realistic user behavior and workload patterns. These scenarios provide a way for performance testers to evaluate how the workload performs under various conditions.

Test scenarios make it possible to replicate various workload patterns, such as concurrent user access, peak load periods, or specific transaction sequences. By testing the workload under different workload patterns, you can identify performance bottlenecks and optimize resource allocation.

- _Define user behavior_. Emulate realistic user behavior and workload patterns by identifying the steps and actions that users perform when they interact with the workload. Consider activities such as signing in, performing searches, submitting forms, or accessing specific features. Break down each scenario into specific steps and actions that represent the user's interaction with the workload. You can include navigating through pages, performing transactions, or interacting with various elements of the workload.

- _Determine data involvement_. Identify the test data required to run the test scenarios. You might include creating or generating realistic data sets that represent various scenarios, user profiles, or data volumes. Ensure that the test data is diverse and covers different use cases to provide a comprehensive performance evaluation.

- _Design test scripts_. Create test scripts that automate the execution of the defined test scenarios. Test scripts typically consist of a sequence of actions, HTTP requests, or interactions with workload APIs or user interfaces. Use performance testing tools or programming languages to write the scripts, considering factors such as parameterization, correlation, and dynamic data handling. Validate the test scripts for correctness and functionality. Debug any issues, such as script errors, missing or incorrect actions, or data-related problems. Test script validation is crucial to help ensure accurate and reliable performance test execution.

- _Configure test variables and parameters_. Configure variables and parameters within test scripts to introduce variability and simulate real-world scenarios. Include parameters such as user credentials, input data, or randomization to mimic different user behaviors and workload responses.

- _Iteratively_ _refine scripts_. Continuously refine and enhance test scripts based on feedback, test results, or changing requirements. Consider optimizing script logic, parameterization, and error handling, or adding extra validation and checkpoints.

#### Configure the test environment

Configuring a test environment refers to the process of setting up the infrastructure, software, and network configurations that you need to create an environment that closely resembles your production environment.

To set up your testing environment in a way that boosts performance efficiency, include the following steps in your configuration process:

- _Mirror your production environment_. Set up your test environment to closely resemble your production environment. Consider factors such as environment settings and region, network settings, security settings, data sources, and integrations. The goal is to ensure that the performance test results are representative of real-world conditions.

- _Provision sufficient resources_. Allocate adequate resources such as storage capacity to the test environment. Ensure that the available resources can handle the expected workload and provide accurate performance measurements.

- _Replicate network conditions_. Configure the network settings in the test environment to replicate the expected network conditions during the actual workload deployment. You need to include bandwidth, latency, and network protocols.

- _Install and configure dependencies_. Install any apps from AppSource, and other dependencies that are required for the workload to run correctly. This includes configuring third-party services with the expected production configurations.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: There are costs associated with maintaining separate test environments, storing data, using tooling, and running tests. Know the cost of performance testing, and find a way to optimize spending.

> :::image type="icon" source="../_images/risk.svg"::: **Risk**: Production data can contain sensitive information. Without a robust scrubbing and masking strategy, you risk leaking sensitive data when you use production data for testing.

### Perform the tests

Run the performance tests by using the chosen testing tool. Testing involves measuring and recording performance metrics, monitoring health, and capturing any performance issues that arise.

Monitor and collect performance metrics such as response time, throughput, and other relevant indicators.

Use the defined test scenarios to put the workload under expected loads. Conduct tests under these varying load conditions. For example, use levels, such as normal, peak, and stress levels, to analyze the behavior of the workload in various scenarios.

When planning and running performance tests it's important to remember that, in many cases, the Microsoft Cloud uses shared infrastructure to host your assets and the assets belonging to other customers. Limit tests to avoid unintended consequences.

### Document the results

Document your performance test results clearly and consistently. Your documentation should show:

- Whether your solution meets your performance goals for each scenario
- When and how you ran each test
- What version of your solution you tested
- Any errors or issues that occurred during the test
- Any changes or optimizations that you made after the test

### Analyze the results

Analyzing the test results involves examining the collected data and metrics from the performance tests to gain insights into the performance of the workload. The goal is to identify performance issues and use the feedback to adjust priorities in application development. 

The following actions are key steps for analyzing test results.

_Review performance metrics._ Look at the performance metrics that you collect during performance testing, such as response times, throughput, error rates, and network latency. Analyze these metrics to understand the overall performance of the workload.

- _Identify bottlenecks_. Evaluate the performance metrics to identify any bottlenecks or areas of inefficient performance. The evaluation can include high response times, resource constraints, database issues, network latency, and scalability limitations. Pinpointing the root causes of these bottlenecks helps you prioritize performance improvements.

- _Correlate metrics_. Assess the relationships and correlations between various performance metrics. For example, analyze how increased load or resource utilization affects response times. Understanding these correlations can provide valuable insights into workload behavior under different conditions. Look for patterns and trends in the performance data over time. Analyze performance under different load levels or during specific periods. Detecting trends can help identify seasonal variations, peak usage times, or recurring performance issues.

_Evaluate acceptance criteria._ Compare the retest results against the predefined acceptance criteria and performance goals. Assess whether the workload meets the desired performance standards. If the workload doesn't meet the acceptance criteria, further investigate and refine the optimizations.

_Iterate and refine the analysis._ Make other adjustments and improvements as needed. Use the collected data and metrics to diagnose specific performance issues. The diagnosis might involve tracing through the workload components, examining log files, monitoring resource usage, or analyzing error messages. Dig deeper into the data to understand the underlying causes of performance problems.

Based on the analysis of the test results, prioritize identified performance issues, and implement necessary improvements. The improvements can involve optimizing logic, tuning queries, improving caching mechanisms, and optimizing network configurations.

### Establish baselines

Baselines provide a reference point for comparing performance results over time. Baselines should be meaningful snapshots of workload performance—you don't need to use every test as a baseline.

Consider the workload objectives, and document performance snapshots that allow you to learn over time and optimize. Use these baseline measurements as a benchmark for future performance tests, and use them to identify any degradation or improvement.

To establish baselines for performance testing and use them as a benchmark for future performance tests, follow these steps:

- _Identify performance metrics_. Determine the specific performance metrics that you want to measure and track. Examples include:
  - Response time, or how quickly the workload responds to requests.
  - Throughput, or the number of requests that are processed per unit of time.
  - Resource utilization, such as storage capacity usage.

- _Record meaningful measurements_. Record the performance metrics that you obtain during the test as the baseline measurements. These measurements represent the starting point against which you compare future performance tests.

- _Compare future tests_. In subsequent performance tests, compare the performance metrics against the established baselines and thresholds. The comparison allows you to identify any improvements or degradation in performance.

### Test continuously

Continuous testing involves the ongoing monitoring and refinement of your tests. Continuous testing helps you maintain consistent and acceptable levels of performance. A workload should provide a consistent and acceptable level of performance relative to the baseline. You should tune the workload over time to produce consistent performance that's within the acceptable limits of performance. 

Here are some key practices:

- _Set degradation limits_. Define numeric thresholds that specify the level of performance degradation that's acceptable over time. By setting these limits, you can monitor performance fluctuations and receive alerts when the performance falls below the defined threshold.

- _Include quality assurance_. Incorporate performance requirements, such as maximum requests per second, into the quality assurance process. Treat performance requirements with the same level of importance as functional requirements. This process helps ensure that the workload meets the defined performance requirements before you deploy it to production.

- _Automate alerting_. In live environments, rapid detection and response are crucial. Set up automated alerting systems that use the performance baseline as their reference. If there's a significant deviation in performance, the necessary teams are alerted immediately to act.

- _Test changes_. Some performance issues might only manifest in a live setting. Apply thorough testing practices for proposed changes. Use code instrumentation to gain insights into the application's performance characteristics, such as hot paths. This testing ensures that any change introduced doesn't degrade performance beyond the acceptable limits.

## Power Platform facilitation

**Perform the tests**: [Azure Pipelines](/azure/devops/pipelines/get-started/what-is-azure-pipelines) makes it possible for you to integrate performance testing into your CI/CD (continuous integration/continuous delivery) pipeline. You can incorporate load testing as a step in your pipeline to validate the performance and scalability of your applications.

[Power Apps Test Engine](/power-apps/developer/test-engine/overview) is a component within the Power Platform CLI that you can use to test standalone canvas apps in Power Apps.

[Azure Test Plans](/azure/devops/test/overview) is an easy-to-use, browser-based test management solution that provides all the capabilities required for planned manual testing, user acceptance testing, exploratory testing, and gathering feedback from stakeholders.

If your workload includes Azure resources, you can use [Azure Chaos Studio](https://azure.microsoft.com/services/chaos-studio) and [Azure Load Testing](/azure/load-testing/overview-what-is-azure-load-testing) to perform tests. 

During development, developers can also use [Power Apps Monitor](/power-apps/maker/monitor-overview) to diagnose and troubleshoot problems faster and build more reliable apps. It provides a deep view of your app by logging all the key activities that occur in the app as it runs. Power Apps Monitor also provides a better understanding of how the events and formulas contained in your app work, so you can improve performance and identify any errors or problems.

If your workload includes a Microsoft Copilot Studio agent, you can use the [Power CAT Copilot Studio Kit](https://github.com/microsoft/Power-CAT-Copilot-Studio-Kit) to configure agents and tests. By running individual tests against the Copilot Studio APIs (Direct Line), the agent responses are evaluated against expected results.

**Analyze the results**: [Azure Monitor](/azure/azure-monitor/overview) is a comprehensive monitoring solution for collecting, analyzing, and responding to telemetry from your cloud and on-premises environments. [Application Insights](/azure/azure-monitor/app/app-insights-overview) is an extension of Azure Monitor that provides APM features. You can use Application Insights to monitor applications during development and testing and also in production.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: Testing takes time and skill to perform and can affect operational efficiency.

## Related information

- [Manage solution performance](/power-platform/architecture/key-concepts/performance/)
- [Recommendations for security testing](../security/testing.md)
- [Recommendations for designing a reliability testing strategy](../reliability/testing-strategy.md)

## Performance Efficiency checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Performance Efficiency checklist](checklist.md)
