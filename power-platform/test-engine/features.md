---
title: Power Apps Test Engine features (preview)
description: Summary of Power Apps Test Engine features.
author: pvillads
ms.author: pvillads
ms.subservice: test-engine
ms.date: 05/19/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
- grant-archibald-ms
---

# Power Apps Test Engine features (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

Power Apps Test Engine provides a comprehensive set of features for effectively testing Power Platform solutions. This page details the capabilities available to help you build robust test suites for your Power Platform applications.

## Application testing capabilities

Test Engine capabilities start with testing applications.

### Canvas application testing

**What it enables:** Create comprehensive tests for your canvas apps that interact with controls, validate business logic, and verify end-user experiences.

**Key capabilities:**

- **Control-based testing:** Interact with app controls using their studio names, without needing DOM knowledge
- **UI validation:** Verify control properties, visibility, and state during test execution
- **Navigation testing:** Validate screen transitions and user flows within your app
- **Formula evaluation:** Test complex business logic using Power Fx expressions
- **Data binding validation:** Verify that data correctly flows between your app and data sources

**When to use it:**

- Validating critical user journeys in your canvas apps
- Ensuring app functionality after formula changes or control updates
- Building regression test suites for complex canvas applications

[Learn more about Canvas application testing](canvas-application.md)

### Model-driven application testing

**What it enables:** Automate testing for model-driven apps including forms, views, business process flows, and dashboards.

**Key capabilities:**

- **Form interaction:** Test form loading, data entry, and business rule validation
- **View navigation:** Validate grid views, filtering operations, and record selection
- **Command execution:** Test ribbon buttons and command bar interactions
- **Business process flows:** Validate stage transitions and required field validation
- **Dashboard verification:** Test dashboard components and interactive filters

**When to use it:**

- Ensuring consistent behavior across complex model-driven apps
- Validating form rules and business logic after customizations
- Testing end-to-end business processes that span multiple entities

[Learn more about Model-driven application testing](model-driven-application.md)

### Dataverse integration testing

**What it enables:** Test applications that interact with Dataverse, including data operations, business rules, and calculated fields.

**Key capabilities:**

- **CRUD operations:** Tests create, read, update, and delete operations on Dataverse records
- **Business rule validation:** Verify that business rules execute as expected
- **Security model testing:** Validate that security roles and permissions work correctly
- **Calculated and rollup field testing:** Ensure formulas and aggregations compute correctly
- **Relationship navigation:** Test lookup fields and related entity interactions

**When to use it:**

- Testing data-intensive applications with complex Dataverse interactions
- Validating business rules and calculated fields after schema changes
- Ensuring security role permissions work as intended

[Learn more about Dataverse integration testing](dataverse.md)

## Specialized testing features

The following specialized features enable you to test advanced scenarios such as AI-powered components, authentication and security, and data simulation. These capabilities help ensure your Power Platform solutions are robust, secure, and reliable even in complex or nondeterministic environments.

### AI and Copilot capabilities testing

**What it enables:** Test AI-powered components with specialized functions that account for nondeterministic behaviors.

**Key capabilities:**

- **[AI Builder Prompt testing](powerfx-functions.md#previewaiexecuteprompt):** Validate AI model responses and integrate them into your test flows
- **Similarity matching:** Use approximate comparison for AI-generated content instead of exact matching
- **Content validation:** Verify that AI-generated content meets expected criteria without requiring exact matches
- **Error handling:** Test AI model error conditions and fallback behaviors

**When to use it:**

- Testing applications that use AI Builder components
- Validating Copilot-generated content meets business requirements
- Building test suites for natural language processing features

### Authentication and security testing

**What it enables:** Test applications with various authentication methods and security configurations.

**Key capabilities:**

- **[Multiple authentication methods](authentication.md):** Support for interactive, service principal, and session persistence
- **[MFA handling](authentication-guide.md):** Test in environments that enforce multifactor authentication
- **Simulated user contexts:** Test with different security roles and permissions
- **Token management:** Automate the handling of authentication tokens across test steps

**When to use it:**

- Testing in secure enterprise environments with MFA requirements
- Validating app behavior for users with different security roles
- Automating tests in CI/CD pipelines with service principal authentication

[Learn more about authentication options](authentication.md)

### Data simulation and mocking

**What it enables:** Create reliable, isolated tests by simulating external dependencies.

**Key capabilities:**

- **[Connector response mocking](simulation.md):** Simulate responses from connectors without calling actual services
- **Deterministic testing:** Create predictable test conditions regardless of external systems
- **Error scenario testing:** Simulate error conditions from connectors to test exception handling
- **Performance testing:** Test app behavior under various simulated response times

**When to use it:**

- Testing apps that rely on paid API services without incurring costs
- Creating tests that run reliably without external dependencies
- Validating error handling for connector failure scenarios

[Learn more about connector mocking](simulation.md)

## Developer experience features

The following features are designed to enhance the experience of test authors and developers. They provide tools and integrations that streamline test creation, enable extensibility, and support automated testing workflows for Power Platform solutions.

### AI-assisted test authoring

**What it enables:** Accelerate test creation using GitHub Copilot's AI capabilities with your source-controlled Power Platform solutions.

**Key capabilities:**

- **Natural language test generation:** Create tests by describing scenarios in plain language
- **Source context awareness:** Use solution files to generate accurate control references and navigation flows
- **Sample-based learning:** Use existing samples as templates for more complex test scenarios
- **Guided test patterns:** Generate complete test suites including edge cases and exception handling

**When to use it:**

- Rapidly bootstrapping new test suites for existing applications
- Learning test authoring patterns through AI-generated examples
- Creating comprehensive test coverage with minimal manual coding

[Learn more about AI-assisted test authoring](ai-authoring.md)

### Power Fx test authoring

**What it enables:** Write tests using the familiar Power Fx formula language, making test creation accessible to both makers and developers.

**Key capabilities:**

- **Formula-based assertions:** Use Power Fx expressions to validate test conditions
- **Control property access:** Reference and verify properties of app controls directly
- **Collection manipulation:** Work with data collections using familiar functions
- **Complex condition testing:** Express sophisticated test logic using Power Fx operators and functions

**When to use it:**

- Using existing Power Fx knowledge for test creation
- Creating tests that app makers can understand and maintain
- Building complex validation logic for sophisticated app behaviors

[Learn more about Power Fx in testing](powerfx.md)

### Extensibility framework

**What it enables:** Customize and extend Test Engine capabilities to meet specialized testing needs.

**Key capabilities:**

- **[Custom providers](extensibility.md):** Create specialized providers for unique application types
- **[User-defined functions](powerfx-csharp.md):** Extend Power Fx with custom C# functions
- **Custom types:** Define specialized types for complex testing scenarios
- **Test framework integration:** Connect Test Engine with existing testing frameworks

**When to use it:**

- Testing custom controls or components not covered by standard providers
- Implementing specialized testing logic for unique business requirements
- Integrating with existing testing infrastructure

[Learn more about extensibility options](extensibility.md)

### ALM and CI/CD integration

**What it enables:** Incorporate automated testing into your development lifecycle and continuous integration pipelines.

**Key capabilities:**

- **Command-line execution:** Run tests from terminals or build agents
- **Pipeline integration:** Easily include tests in Azure DevOps or GitHub Actions workflows
- **Test reporting:** Generate structured test results for pipeline consumption
- **Environment switching:** Test across different environments in your deployment pipeline

**When to use it:**

- Implementing automated testing in CI/CD pipelines
- Creating quality gates for Power Platform solution deployments
- Establishing continuous testing practices for your development team

## Diagnostics and troubleshooting

The following diagnostics and troubleshooting features help you quickly identify, analyze, and resolve issues encountered during test execution. These tools provide visual artifacts and detailed logs to simplify debugging and improve test reliability.

### Visual test artifacts

**What it enables:** Capture visual evidence of test execution to simplify debugging and defect resolution.

**Key capabilities:**

- **Screenshot capture:** Automatically take screenshots at key test points
- **Video recording:** Record videos of test execution for complex scenarios
- **Error context capture:** Collect more context information when tests fail
- **Tracing and logs:** Generate detailed execution logs for debugging

**When to use it:**

- Debugging intermittent test failures
- Documenting complex test scenarios visually
- Sharing test results with team members who don't have access to the testing environment

## Upcoming capabilities

The following upcoming capabilities highlight planned enhancements for the Test Engine. These features expand support for conversational AI, Power Automate flows, and advanced AI testing scenarios to further strengthen your testing strategy.

### Microsoft Copilot Studio integration

Planned integration with Microsoft Copilot Studio enables testing of conversational experiences and AI-powered virtual agents, allowing you to validate bot responses, conversation flows, and integration with backend systems.

### Power Automate testing

Enhanced support for Power Automate testing is in development, which provides more comprehensive capabilities for testing automated flows, flow actions, and triggers. This work supports both integration testing and unit testing approaches for flow components.

### More AI testing capabilities

Future enhancements include an AI Evaluator for the AI Builder SDK and expanded support for custom evaluation scenarios, making it easier to validate AI-powered features with predictable, repeatable test results.

[Learn more about the feature lifecycle](feature-lifecycle.md)

