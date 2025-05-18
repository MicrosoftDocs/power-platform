---
title: AI-assisted test authoring with GitHub Copilot (preview)
description: Learn how to use GitHub Copilot and AI tools to author tests for Power Platform applications
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/19/2025
ms.reviewer: jdaly
ms.topic: article
---

# AI-assisted test authoring with GitHub Copilot

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

Creating comprehensive test plans for Power Platform applications can be time-consuming, especially for complex scenarios. AI-assisted authoring tools like GitHub Copilot can significantly accelerate this process by generating test templates, suggesting test cases, and automating boilerplate code creation.

This guide explains how to leverage GitHub Copilot with Power Platform source control solutions to efficiently create Test Engine test plans.

## Prerequisites

Before you begin, ensure you have:

- [Visual Studio Code](https://code.visualstudio.com/) installed
- [GitHub Copilot](https://github.com/features/copilot) subscription
- [GitHub Copilot Chat extension](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot-chat) for VS Code
- [Power Platform CLI](../developer/cli/introduction.md#install-microsoft-power-platform-cli) installed
- A [source-controlled Power Platform solution](../alm/devops-build-tool-tasks.md)

## Setting up your test authoring environment

To maximize the effectiveness of AI-assisted test authoring, combine these tools in a structured workflow:

1. Get your source files
   - Clone your Power Platform environment or solution from [source control](../alm/git-integration/connecting-to-git.md) 
   - Export and unpack your solution from Power Platform with files using [pac solution export](../developer/cli/reference/solution.md#pac-solution-export) and [pac solution unpack](../developer/cli/reference/solution.md#pac-solution-unpack)
1. Initialize a git repository for version control (if not already done)
1. Create a dedicated test folder in your solution repository
1. Open the solution folder in Visual Studio Code

## Using GitHub Copilot for test creation

GitHub Copilot can help you generate various test components based on your source-controlled solution. Here's how to leverage its capabilities effectively:

### Using sample documentation as context

The [Test Engine samples catalog](samples.md) provides a rich source of reference material for GitHub Copilot. You can help Copilot generate higher-quality tests by:

1. Including the samples.md file in your workspace
1. Referencing specific samples in your prompts
1. Providing links to sample GitHub repositories

For example, you could:

- Open both your application code and the samples.md file in VS Code
- Ask Copilot to create tests "similar to the ButtonClicker sample" or "using patterns from the Dataverse sample"
- Reference specific capabilities from samples that match your testing needs

This approach helps Copilot understand Power Platform Test Engine patterns and generate more accurate tests.

### Working with GitHub Copilot in Agent Mode

Visual Studio Code's GitHub Copilot Chat offers an [Agent Mode](/training/modules/github-copilot-agent-mode/) that can help generate tests based on your solution files. This mode allows Copilot to access and understand your project context more deeply.

To use Agent Mode for test generation:

1. In VS Code, open GitHub Copilot Chat (Ctrl+Shift+I)
1. Select **Agent** from the Copilot mode selector
1. Craft a detailed prompt about the test you want to create

#### Example prompts for test generation

Try using prompts like these for test generation:

:::row:::
   :::column:::
This prompt generates a comprehensive test suite for a Canvas app using the PowerApps Test Engine, modeled after the [ButtonClicker sample](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/buttonclicker):
   :::column-end:::
   :::column:::
> **Prompt:**
> *Generate a test for ./SolutionPackage/src/CanvasApps/src/MyApp/Src/App.fx.yaml using the sample at https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/ButtonClicker as reference. Create expected cases, edge cases, and exception cases. The test should create a test YAML file and Power Fx test steps, config.json, and RunTest.ps1 based on the sample to enable me to run the test.*
   :::column-end:::
:::row-end:::
:::row:::
   :::column:::
This prompt builds a detailed test plan for a Model-driven app to ensure core functionality and business logic are working as expected.
   :::column-end:::
   :::column:::
> **Prompt:**
> *Create a comprehensive test plan for my Model-driven app located at ./SolutionPackage/src/Other/Solution.xml. The test should validate form load, record creation, and business rule execution. Generate the test YAML, Power Fx steps, and a PowerShell script to run the test.*
   :::column-end:::
:::row-end:::
:::row:::
   :::column:::
This prompt constructs a test plan for Dataverse entities to verify CRUD operations through Power Fx actions.
   :::column-end:::
   :::column:::
> **Prompt:**
> *Create a comprehensive test plan for my Dataverse entites. The test should perform create, update, delete Power Fx actions. Generate the test YAML, Power Fx steps, and a PowerShell script to run the test.*
   :::column-end:::
:::row-end:::


### Understanding the generated test components

When GitHub Copilot generates a test, it typically creates the following components:

- **YAML test plan**: Defines the test structure, app URL, and test steps
- **Power Fx test steps**: Contains the test logic using Power Fx expressions
- **config.json**: Configuration for test execution parameters
- **RunTest.ps1**: PowerShell script to execute the test

#### Example: Generated test structure

```
MyAppTests/
├── MyAppTest.fx.yaml     # Power Fx test steps
├── MyAppTest.yml         # Test plan definition
├── config.json           # Test configuration
└── RunTest.ps1           # Test execution script
```

## Best practices for AI-assisted test authoring

To get the most out of GitHub Copilot for Test Engine test creation:

### Provide clear context in your prompts

Be specific about what you want to test and include references to:

- The exact file(s) to test
- Sample tests to use as templates
- Specific test scenarios you want to cover
- Any authentication or environment requirements

#### Leveraging Test Engine samples for context

The [samples.md](samples.md) documentation catalogs all available samples from the Test Engine repository, which can be an excellent reference when crafting prompts for GitHub Copilot. For example, when testing a canvas app with buttons, you might reference the [Button Clicker sample](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/buttonclicker):

> **Prompt:**
> *Generate a test for my Canvas app at ./SolutionPackage/src/CanvasApps/src/MyApp/Src/App.fx.yaml using the ButtonClicker sample from https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/buttonclicker. The test should:*
> *1. Verify that my counter button increments a value on the screen*
> *2. Test boundary conditions (e.g., max value)*
> *3. Include OnTestCaseStart and OnTestCaseComplete lifecycle hooks*
> *4. Generate the config.json with appropriate environment variables*


This approach helps Copilot understand the test structure and generates more accurate, contextually relevant tests based on proven examples.

### Use source-controlled solutions as context

Copilot performs best when it can analyze your solution structure. Use  [source control for Power Platform solutions](../alm/use-source-control-solution-files.md) to provide this context. This allows Copilot to:

- Understand your app's structure
- Identify control names and properties
- Generate more accurate test steps
- Reference the correct file paths

### Review and refine generated tests

While AI-generated tests provide an excellent starting point, always:

- Verify control references match your application
- Add assertions for business-critical functionality
- Ensure edge cases are properly handled
- Validate authentication configuration

### Combine with manual expertise

For complex test scenarios, use GitHub Copilot to:

- Generate the test framework and structure
- Create standard validation patterns
- Suggest edge cases to consider

Then augment with your domain expertise for:

- Business-specific validation rules
- Environmental considerations
- Specialized test data

## Common test generation patterns

This section contains some common test generation patterns:

### Testing Canvas Apps

For canvas apps, use prompts that reference the `App.fx.yaml` file in your source-controlled solution:


> **Prompt:**
> *Generate a test for my Canvas app at ./SolutionPackage/src/CanvasApps/src/MyExpenseApp/Src/App.fx.yaml that validates the expense submission process. The test should populate expense fields, submit the form, and verify the confirmation message appears.*

[Learn more about Canvas app testing](canvas-application.md)

### Testing Model-Driven Apps

For model-driven apps, focus on entity navigation, form interactions, and business rules:

> **Prompt:**
> *Create a test for my Model-driven app that tests the Account entity form. The test should create a new account record, validate required fields, and verify that business rules for credit limit calculation are working correctly.*

[Learn more about Model-driven app testing](model-driven-application.md)

### Testing Dataverse Extensions

For Dataverse tests, emphasize data operations and business logic validation:

> **Prompt:**
> *Generate a Dataverse test that validates the custom plugins in my solution. The test should create test records, trigger the plugin execution, and verify the expected data transformations occurred.*

[Learn more about Dataverse testing](dataverse.md)

## Sample-specific test prompts

To get the most accurate test generation, reference specific samples from the [Test Engine samples catalog](samples.md) that match your testing needs. Here are tailored prompts for common testing scenarios:

### ButtonClicker sample prompts

The [ButtonClicker sample](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/buttonclicker) demonstrates basic counter functionality testing. Use these prompts:

> **Prompt:**
> *Generate a test for my counter app with a similar structure to the ButtonClicker sample. My app has buttons named "IncrementBtn" and "ResetBtn" with a "CounterLabel" that displays the current count. Create a test that verifies both buttons work correctly and that the maximum count is 10.*

> **Prompt:**
> *Create a test for my button interaction app using the ButtonClicker sample as a reference. My app has a "SubmitButton" that should be enabled only when the "NameInput" and "EmailInput" fields are completed. Generate a test plan with Power Fx steps to validate this behavior.*

### Gallery testing prompts

The [BasicGallery](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/basicgallery) and [NestedGallery](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/nestedgallery) samples show how to test gallery interactions:

> **Prompt:**
> *Generate a test for my gallery app where I have a "Products" gallery with product items containing "TitleLabel", "PriceLabel", and "SelectButton" controls. Use the BasicGallery sample structure to verify I can select items and that the correct details appear in a "DetailPanel".*

### Data operations prompts

The [Dataverse sample](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/dataverse) demonstrates data operations testing:

> **Prompt:**
> *Create a test for my CRM app using the Dataverse sample pattern. Test that I can create a new Contact record, update it, then verify the changes persist. Include both UI tests and direct Dataverse operations.*

### AI testing prompts

For testing AI-powered functionality, reference the [AI Prompt sample](https://github.com/microsoft/PowerApps-TestEngine/blob/main/samples/dataverse/ai-prompt.fx.yaml):

> **Prompt:**
>*Generate a test for my sentiment analysis app based on the AI Prompt sample. My app has a "FeedbackInput" textbox and uses AI Builder to classify it as positive, negative, or neutral. Create a test that validates different inputs produce expected outputs within acceptable thresholds.*

## Advanced techniques

This section provides advanced prompts.

### Creating multi-environment test suites

You can prompt Copilot to generate tests that work across multiple environments:

> **Prompt:**
> *Generate a test suite for my app that can run in DEV, TEST, and PROD environments with appropriate configuration variables for each environment.*

### Generating data mocking scenarios

For isolated testing with [connector mocking](simulation.md):

> **Prompt:**
> *Create a test with mocked connector responses for my app that uses the Office 365 Outlook connector. The test should simulate receiving emails and validate the app's processing logic.*

## Testing AI capabilities and handling non-deterministic results

When working with AI-powered applications, testing introduces unique challenges since AI outputs may vary slightly between runs, even with identical inputs. This non-deterministic behavior requires special testing approaches.

### Understanding non-deterministic testing

Non-deterministic testing involves validating outputs that may legitimately vary across test runs:

- **AI Model Outputs**: Responses from AI models like GPT or custom AI Builder components
- **Confidence Scores**: Numerical evaluations that might fluctuate within acceptable ranges
- **Generated Content**: Text or recommendations produced by AI systems

### Using Preview.AIExecutePrompt for deterministic testing of AI capabilities

The Test Engine provides the [Preview.AIExecutePrompt](powerfx-functions.md#previewaiexecuteprompt) that enables deterministic validation of AI responses. This approach allows you to:

- Execute AI prompts within test scenarios
- Parse and validate the structured responses
- Verify that critical outputs meet expectations despite potential variations

#### Example: Rating evaluation with AI Builder

The following example demonstrates using the `Preview.AIExecutePrompt` function to test an AI-powered rating system:

```powerappsfl
EvaluateTestQuestionPrompt(Prompt: TestQuestion): TestResult =
  With({
    Response: ParseJSON(
      Preview.AIExecutePrompt("PromptEvaluator",
      {
        Context: "You are a helpful agent asking about external customer service questions.",
        Question: Prompt.Question
      }).Text)
  },If(
    IsError(AssertNotError(Prompt.ExpectedRating=Response.Rating, Prompt.Question & ", Expected " & Prompt.ExpectedRating & ", Actual " & Response.Rating)),
    {PassFail: 1, Summary: Prompt.Question & ", Expected " & Prompt.ExpectedRating & ", Actual " & Response.Rating}, {PassFail: 0, Summary: "Pass " & Prompt.Question}
  ))
```

In this example:

- The test executes an AI prompt against the "PromptEvaluator" model
- It passes a context and a question for evaluation
- It validates that the returned rating matches the expected value
- It provides clear feedback on test success or failure

You can explore the complete implementation in the [AI Prompt sample](https://github.com/microsoft/PowerApps-TestEngine/blob/main/samples/dataverse/ai-prompt.fx.yaml) from the [PowerApps-TestEngine](https://github.com/microsoft/PowerApps-TestEngine) repository.

### Incorporating AI-aware testing

When using GitHub Copilot to generate tests for AI-powered applications:

> **Prompt:**
> *Generate a test for my AI-powered app that uses AI Builder form processing. Include test steps that validate the AI results with appropriate tolerance for non-deterministic outputs.*

## Troubleshooting and refinement

If GitHub Copilot generates tests that don't meet your needs:

- **Refine your prompt**: Be more specific about what you want to test
- **Provide examples**: Link to specific test samples that match your desired style
- **Break down complex tests**: Request generation of smaller, focused test components
- **Iterate**: Use Copilot's responses to refine your next prompt

### Related articles

[Explore Test Engine features](features.md)  
[Browse the Test Engine samples catalog](samples.md)  
[Learn about Power Fx test functions](powerfx-functions.md)  
[Understand the YAML test format](yaml.md)  
[Explore authentication options](authentication.md)  

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
