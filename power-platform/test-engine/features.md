---
title: Power Apps Test Engine features (preview)
description: Summary of features for Test Engine
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/15/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - jt000
 - FrankDahl
 - grant-archibald-ms
---

# Test Engine Features

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

Power Apps Test Engine provides a comprehensive set of features that enable you to effectively test Power Platform components. This page outlines the key features currently available in Test Engine and provides insights into upcoming capabilities.

## Open Source Implementation

The [Power Apps Test Engine](https://github.com/microsoft/PowerApps-TestEngine/) is available as an open-source project with an MIT license. New features are typically first introduced in the GitHub repository before being integrated into the Power Platform CLI. This approach follows the [ring deployment model](ring-deployment-model.md), allowing for community feedback, contribution and validation before features reach general availability.

## Testing Capabilities

### Canvas Application Testing

Canvas application testing is a core capability of Test Engine, allowing you to create automated tests for your canvas apps. Using Power Fx and YAML, you can define test scenarios that interact with app controls, validate behaviors, and verify results without needing to understand the underlying DOM structure.

### Model-Driven Application Testing

The [Model-Driven Application](model-driven-application.md) testing feature enables you to automate tests for your model-driven apps. You can interact with entity lists, entity records, and custom pages. This capability is currently being enhanced to support additional components such as command bars and navigation elements.

### Multi-factor Authentication

Test Engine supports authentication with multi-factor authentication (MFA) through multiple [authentication methods](authentication.md). This allows for secure testing in environments that enforce MFA policies, making it suitable for enterprise-grade testing scenarios that maintain security standards.

### Dataverse Integration

[Dataverse integration](dataverse.md) provides the ability to test applications that interact with Dataverse. You can create tests that validate data operations, business rules, and other Dataverse-dependent functionality. Work is ongoing to support plugin execution testing within the Dataverse integration capabilities.

### Managed Extensibility Framework

Test Engine incorporates the .NET [Managed Extensibility Framework](extensibility.md), enabling customization and extension of the testing capabilities. This framework allows for adding new providers and Power Fx actions to accommodate specialized testing needs. Future enhancements will include support for customer-signed extensions.

### User-Defined Types and Functions

You can create custom types and functions to extend the Power Fx testing capabilities, allowing for more expressive and reusable test logic. This feature helps in organizing complex test scenarios and improving the maintainability of your test suites.

### C# Power Fx Functions

[Power Fx C# functions](powerfx-csharp.md) enable you to extend the testing capabilities with custom C# code. This provides additional flexibility for implementing complex test logic or interacting with system components not directly accessible through standard Power Fx functions.

## Emerging Capabilities

### AI Integration

Test Engine supports [AI Builder Prompt](powerfx-functions.md#previewaiexecuteprompt) integration, allowing tests to leverage AI capabilities. Planned enhancements include an AI Evaluator for the AI Builder SDK and custom evaluation scenarios.

### Microsoft Copilot Studio Integration

Integration with Microsoft Copilot Studio is under development, which will enable testing of conversational experiences and AI-powered virtual agents.

### Power Automate Testing

Test Engine supports integration testing with Power Automate, allowing you to validate end-to-end processes that include automated flows. Work is ongoing to support more comprehensive unit testing capabilities for Power Automate components.

