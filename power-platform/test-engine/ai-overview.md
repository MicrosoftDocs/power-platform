---
title: Generative AI capabilities in Power Apps Test Engine (preview)
description: Overview of Generative AI features in Power Apps Test Engine, including authoring assistance, Model Context Protocol, and nondeterministic AI testing
author: pvillads
ms.author: pvillads
ms.subservice: test-engine
ms.date: 05/19/2025
ms.reviewer: jdaly
ms.topic: overview
contributors:
 - grant-archibald-ms
---

# Generative AI capabilities in Power Apps Test Engine (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

Power Apps Test Engine offers comprehensive generative AI capabilities that span the entire testing lifecycle. This page provides an overview of how generative AI can enhance your testing experience, from test creation to execution and validation.

Test Engine's generative AI features address three key areas of the testing process:

| Generative AI Capability | Description |
|---------------|-------------|
| **[Generative AI-assisted test authoring](#generative-ai-assisted-test-authoring)** | Create tests quickly using GitHub Copilot and other Large Language Models (LLMs) or Small Language Models (SLMs) | 
| **[Model Context Protocol server](#model-context-protocol-server-implementation)** | Deterministic analysis and code generation with MCP |
| **[Non-deterministic AI testing](#testing-nondeterministic-ai-capabilities)** | Test AI-powered apps with special validation techniques |

## Generative AI-assisted test authoring

Creating comprehensive test plans can be time-consuming, especially for complex applications. Test Engine supports generative AI-assisted authoring through:

- **GitHub Copilot integration**: Generate test templates, test steps, and assertions based on your application code
- **Natural language test creation**: Describe test scenarios in plain English and translate them into executable tests
- **Sample-based test generation**: Reference existing samples to create contextually relevant tests

This approach helps test authors focus on business logic and validation rules rather than test syntax and boilerplate code.

> [!div class="nextstepaction"]
> [Learn more about generative AI-assisted test authoring](ai-authoring.md)

## Model Context Protocol server implementation

Power Apps Test Engine includes a Model Context Protocol (MCP) server implementation that provides deterministic analysis of your applications and generates test recommendations.

The MCP server:

- Analyzes application structure to identify testable components
- Generates test patterns based on control types and relationships
- Provides contextual code recommendations 
- Integrates with MCP clients like Visual Studio and GitHub Copilot
- Uses [Plan Designer](/power-apps/maker/plan-designer/plan-designer) to organize and prioritize testing efforts
- Incorporates solution definition elements and data schemas for comprehensive testing
- Uses metadata from your solution to generate contextually relevant tests

When you combine deterministic analysis with generative AI capabilities, this approach offers more you a more reliable and accurate test generation compared to pure generative approaches alone.

> [!div class="nextstepaction"]
> [Learn more about the Model Context Protocol implementation](https://aka.ms/TestEngineMCP)

## Testing nondeterministic AI capabilities 

When testing applications that use AI capabilities like AI Builder components or Generative Pretrained Transformer (GPT) models, special consideration is needed for handling nondeterministic outputs.

Test Engine provides:

- **The [`Preview.AIExecutePrompt` function](powerfx-functions.md)**: Execute AI prompts with controlled inputs and validate outputs
- **Tolerance-based validation**: Verify that AI outputs meet expectations within acceptable thresholds
- **Structured response validation**: Parse and validate complex AI-generated content
- **Plan-based validation**: Use Plan Designer definitions to validate AI outputs against expected criteria

These capabilities ensure you can create reliable, repeatable tests even when working with inherently variable AI systems.

> [!div class="nextstepaction"]
> [Learn more about testing nondeterministic AI capabilities](ai-evaluation.md)

## Choosing the right generative AI approach

For optimal results, consider these guidelines:

| If you want to... | Consider using... |
|-------------------|-------------------|
| Quickly generate tests for a new application | Generative AI-assisted authoring with GitHub Copilot |
| Get precise, deterministic analysis of testable components | Model Context Protocol server |
| Combine deterministic analysis with generative capabilities | MCP with a compatible LLM client |
| Test AI-powered applications with variable outputs | Nondeterministic AI testing with [`Preview.AIExecutePrompt`](powerfx-functions.md) |
| Structure your testing efforts based on business requirements | Plan Designer with MCP server integration |
| Generate tests using solution metadata and data schemas | MCP server with solution definition scanning |

### Related articles

[AI-assisted test authoring with GitHub Copilot](ai-authoring.md)  
[Using the Model Context Protocol server with Test Engine](ai-mcp.md)  
[Testing nondeterministic AI components](ai-evaluation.md)  
[Browse the Test Engine samples catalog](samples.md)  
[Try the Test Engine power-fx-functions](powerfx-functions.md)  
[Use Plan Designer](/power-apps/maker/plan-designer/plan-designer)  

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
