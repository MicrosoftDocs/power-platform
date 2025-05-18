---
title: Model Context Protocol in Test Engine (preview)
description: Learn how to use the Model Context Protocol (MCP) server implementation in Power Apps Test Engine
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/19/2025
ms.reviewer: jdaly
ms.topic: conceptual
contributors:
 - JimDaly
 - jt000
 - FrankDahl
 - grant-archibald-ms
---

# Using the Model Context Protocol server with Test Engine

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

Power Apps Test Engine includes a Model Context Protocol (MCP) server implementation that enhances test creation through deterministic analysis of your applications. This guide explains how to use this capability to generate more accurate, contextually relevant tests.

## What is the Model Context Protocol?

The [Model Context Protocol (MCP)](https://aka.ms/TestEngineMCP) is a standard for communication between AI tools and development environments. It enables:

- **Deterministic analysis**: Scanning and analyzing application structure
- **Contextual awareness**: Understanding code relationships and dependencies
- **Code generation**: Creating code snippets based on context
- **Interactive assistance**: Responding to user queries with relevant suggestions
- **Plan integration**: Working with Plan Designer for structured test planning

The Test Engine MCP server provides a standard input/output (stdio) implementation that you can use with MCP clients like Visual Studio, GitHub Copilot, or other compatible tools.

## How the Test Engine MCP server works

The Test Engine MCP server combines deterministic application scanning with generative recommendations:

1. **Scanning phase**: Analyzes your application structure to identify:
   - Control types and hierarchies
   - Navigation paths
   - Data sources and schemas
   - Common interaction patterns
   - Solution component relationships
   - Entity definitions and relationships
   - Form layouts and business rules
   - Custom code components

2. **Analysis phase**: Processes the scan results to determine:
   - Testable components and properties
   - Potential test scenarios
   - Coverage opportunities
   - Risk areas
   - Data dependencies
   - Required test data setup

3. **Plan integration phase**: Works with Plan Designer to:
   - Organize tests by business requirements
   - Prioritize critical test scenarios
   - Create structured test plans
   - Track test coverage against plan items
   - Generate reports on test coverage

4. **Recommendation phase**: Generates contextually relevant:
   - Test templates and structures
   - Power Fx assertions
   - Navigation sequences
   - Data validation patterns
   - Mock data definitions
   - Error handling scenarios

5. **Integration phase**: Communicates with MCP clients through stdio to:
   - Respond to user prompts
   - Provide context-aware suggestions
   - Generate complete test cases
   - Deliver structured test plans

## Benefits of using the MCP approach

The Model Context Protocol server offers several advantages over pure generative approaches:

| Benefit | Description |
|---------|-------------|
| **Accuracy** | Deterministic analysis ensures generated tests reference actual controls and properties |
| **Reliability** | Tests are based on the actual structure of your application rather than assumed patterns |
| **Context awareness** | The MCP server understands your application's structure and can generate more relevant tests |
| **Integration with Plan Designer** | Allows tests to be organized according to business requirements and plan items |
| **Solution metadata utilization** | Uses your solution's entity definitions, relationships, and business rules |
| **Test data generation** | Creates appropriate test data based on your solution's data model |
| **Complementary to LLMs** | Works with large language models to enhance their generation capabilities |
| **Standardized approach** | Follows the MCP specification for consistent interaction with various clients |

## Setting up the MCP server

To use the Test Engine MCP server:

1. Install the latest version of Power Apps Test Engine CLI
2. Set up your application source files in a workspace
3. Configure the MCP server to analyze your workspace
4. Connect an MCP client to the server

### Prerequisites

- Power Apps Test Engine CLI (latest version)
- Source-controlled Power Platform solution
- An MCP-compatible client such as Visual Studio or GitHub Copilot

## Using Plan Designer with MCP

Plan Designer provides a structured approach to organizing and prioritizing your test efforts. When used with the Test Engine MCP server, it enhances the test generation process:

### Plan Designer integration

1. **Test plan creation**: Define test plans with specific objectives and success criteria
2. **Requirement mapping**: Link tests to business requirements and solution components
3. **Test prioritization**: Identify critical paths and high-risk areas for focused testing
4. **Coverage analysis**: Track test coverage against plan items and solution components
5. **Test data definition**: Specify test data requirements for each test scenario

### How Plan Designer information enhances the MCP server

The MCP server uses Plan Designer information to:

- Focus test generation on high-priority areas
- Create test data that covers plan-defined requirements
- Structure tests to validate specific plan items
- Generate comprehensive test coverage aligned with business priorities
- Provide traceability between tests and business requirements

### Getting Started

Review the [Test Engine MCP](https://aks.ms/TestEngineMCP) on information the MCP Server and getting started

## Combining deterministic analysis with generative AI

The real power of the Test Engine MCP server lies in combining deterministic analysis with generative capabilities:

1. The deterministic analysis ensures accuracy by identifying actual components
2. Generative AI provides natural language understanding and creative test scenarios
3. Together, they produce tests that are both reliable and comprehensive

This hybrid approach helps overcome the limitations of both:
- Pure deterministic approaches can lack coverage of creative test scenarios
- Pure generative approaches may reference nonexistent controls or incorrect properties
- Review process to refine and improve the generated results

## Best practices

When working with the Test Engine MCP server:

1. **Provide complete source context**: Ensure your solution folder contains all relevant files
2. **Be specific in prompts**: Include specific control names and expected behaviors
3. **Iterate incrementally**: Start with basic tests and progressively add complexity
4. **Verify generated tests**: Review and adjust tests before execution
5. **Combine with manual expertise**: Use the MCP server as a productivity tool, not a replacement for testing knowledge

## Troubleshooting

If you encounter issues with the MCP server:

| Issue | Resolution |
|-------|------------|
| Server fails to start | Verify installation and PATH environment variables |
| Client can't connect | Check stdio configuration and file permissions |
| Generated tests reference incorrect controls | Ensure your solution files are complete and up-to-date |
| Analysis seems incomplete | Use verbose logging to see what the server is scanning |

## Next steps

- [Learn about AI-assisted test authoring](ai-authoring.md)
- [Understand nondeterministic AI testing](ai-evaluation.md)
- [Explore Test Engine samples](samples.md)

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
