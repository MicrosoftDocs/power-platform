---
title: "Test Engine and Playwright"
description: "Describes the relationship between Playwright and Test Engine"
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/09/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - pvillads
---

# Test Engine and Playwright

[!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

For many code-first developers, the initial inclination is to use familiar code-first testing tools like [Playwright](https://playwright.dev/) when working with low-code solutions. While this approach might seem logical, it can present several challenges, particularly in terms of scalability and efficiency.

## Scale Issues and Resource Constraints

Code-first testing tools often require specialized skills and knowledge, which can be in relatively short supply. This scarcity of resources can create bottlenecks in the testing process, in cases where there isn't enough access skilled testers available to meet the demands of large-scale projects. This limitation can slow down the development cycle and delay the release of new features and updates. 

## Level of Abstraction

Generative AI can help with generation of Playwright code generally it's still create code at a Document Object Model (DOM) level. Where possible, Test Engine takes advantage of the JavaScript object model of [canvas apps](./canvas-application.md) and [model driven application](./model-driven-application.md) to provide a longer term sustainability of the authored tests.

## Bottleneck in the Testing Process

Relying solely on code-first testing tools can create a bottleneck in the testing process. As low-code solutions are designed to accelerate development, the testing phase should ideally keep pace with this rapid development cycle. However, code-first testing tools can be time-consuming to set up and maintain, leading to delays and inefficiencies.

## Examples from Customers

Examples from customers demonstrate that the time required to build tests using code-first tools can exceed the time taken to create the low-code application itself. This discrepancy undermines the promise of rapid results that low-code solutions are designed to deliver. In such cases, the benefits of low-code development are negated with slow and cumbersome testing process.

## The Need for Low-Code Testing Tools

To address these challenges, it's essential to use low-code testing tools that align with the principles of low-code development. These tools are designed to be user-friendly, require minimal coding skills, and can be quickly integrated into the development workflow. By using low-code testing tools, organizations can:

- Accelerate Testing: Low-code testing tools enable faster test creation and execution, keeping pace with the rapid development cycles of low-code solutions.
- Reduce Bottlenecks: By minimizing the reliance on specialized code-first testers, low-code testing tools help eliminate bottlenecks in the testing process.
- Enhance Collaboration: Low-code testing tools facilitate collaboration between developers, testers, and business users, ensuring that all stakeholders are involved in the testing process.
- Maintain Quality: Despite the speed of development, low-code testing tools ensure that applications are thoroughly tested and meet high standards of quality and reliability.

## Power Apps Test Engine and Playwright

The Power Apps Test Engine for web-based tests is based on Playwright. It provides levels of abstraction that allow a greater range of people to create tests. This approach not only simplifies the testing process but also ensures that skills and approaches are transferable across multiple components. Additionally, the Power Apps Test Engine allows for easy integration with [Dataverse](./dataverse.md) using [Power Fx](./powerfx.md), further enhancing its versatility and usability.

## Keep It Simple Principle

The "Keep it simple" principle is important in automated testing. Approaches like [user defined functions](./powerfx.md#user-defined-functions) and prebuilt assets like [C# functions](./powerfx-csharp.md) provide the ability customers and build on components provided by Power Platform Engineering team so that developers can avoid reinventing the wheel. These levels of abstraction for common patterns simplify the testing process and ensure consistency across applications. This approach not only saves time but also uses the expertise of the engineering team to create robust and reliable tests.

## No Cliffs Extensibility Model

The no cliffs extensibility model with examples like using [C# and Power Fx](./powerfx-csharp.md) further enhances the testing process by allowing seamless integration of code-first contributions and extensions. This model ensures that there are no abrupt transitions or "cliffs" when moving between low-code and code-first approaches. It creates a win-win situation where code-first developers can contribute their expertise to low-code solutions, and low-code developers can benefit from the advanced capabilities of code-first tools.

## Conclusion

While code-first testing tools have their place, it's important to consider the best fit for low-code solutions. The scale issues, resource constraints, and potential bottlenecks they introduce can limit the effectiveness of low-code development. By adopting comon principles and extensibility patterns enhance this approach, allowing for seamless integration of code-first contributions and creating a collaborative and productive development environment.

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
