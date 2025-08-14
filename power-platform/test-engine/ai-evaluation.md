---
title: Testing nondeterministic AI in Power Apps (preview)
description: Learn how to test AI components and verify nondeterministic outputs in Power Platform applications
author: pvillads
ms.author: pvillads
ms.subservice: test-engine
ms.date: 05/19/2025
ms.reviewer: jdaly
ms.topic: how-to
contributors:
 - grant-archibald-ms
---

# Testing nondeterministic AI in Power Apps (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

Testing AI-powered applications introduces unique challenges because AI outputs can vary between runs, even with identical inputs. This nondeterministic behavior requires special testing approaches. This guide explains how to validate AI components in your Power Platform applications effectively.

## Understanding nondeterministic outputs

Traditional testing relies on deterministic inputs producing consistent outputs. However, AI systems often produce slightly different results each time due to:

- Model temperature settings and sampling methods
- Selecting different versions of models
- Minor variations in natural language processing
- Confidence scores that fluctuate within normal ranges
- Context-dependent reasoning that might take different paths

## Strategies for testing nondeterministic AI

Power Apps Test Engine provides several strategies for effectively testing AI-powered components:

### Use the Preview.AIExecutePrompt function

The [Preview.AIExecutePrompt function](powerfx-functions.md) enables controlled execution of AI prompts within your tests. The following example demonstrates how to use it:

```powerappsfl
Response: ParseJSON(
  Preview.AIExecutePrompt("CustomPrompt",
  {
    Context: "You are a helpful assistant.",
    Question: "What is the capital of France?"
  }).Text)
```

This approach allows you to:

- Execute prompts with controlled inputs
- Parse and validate structured responses
- Compare results against expected values

### Implement tolerance-based validation

Instead of expecting exact matches, verify that outputs meet criteria within acceptable thresholds. The following code is an example:

```powerappsfl
// Validate that the sentiment score is within appropriate range
Assert(Response.SentimentScore >= 0.7, "Sentiment score should be positive")
```

### Test core functionality rather than exact outputs

Focus tests on validating that the AI component fulfills its essential purpose as shown in the following example:

```powerappsfl
// Check that the classification happens (not the exact classification)
Assert(
  Response.Category = "Positive" || 
  Response.Category = "Neutral" || 
  Response.Category = "Negative", 
  "Response should include a valid sentiment category"
)
```

### Use structural validation for complex outputs

For complex AI responses, validate the response structure rather than specific content as shown in the following example:

```powerappsfl
// Verify all expected fields exist in the response
Assert(!IsBlank(Response.Rating), "Rating should be present")
Assert(!IsBlank(Response.Explanation), "Explanation should be present")
Assert(!IsBlank(Response.NextSteps), "Next steps should be present")
```

## Using Preview.AIExecutePrompt

Test Engine provides the [Preview.AIExecutePrompt function](powerfx-functions.md) specifically for testing AI interactions.

### Function signature

```powerappsfl
Preview.AIExecutePrompt(
  PromptName: Text, 
  PromptContext: Record
): Record
```

### Parameters

- **PromptName**: The name of the prompt template to use
- **PromptContext**: Context data for the prompt, typically containing:
  - Context or system message
  - Questions or user inputs
  - Any other parameters for the model

### Return value

A record containing:

- **Text**: The raw response text
- Other properties depending on the prompt template and model

### Enabling the function

To use this function, enable the AI functions module in your test settings:

```yaml
testSettings:
  extensionModules:
    enable: true
    parameters:
      enableAIFunctions: true
```

### Example: Testing a sentiment analysis component

The following example demonstrates testing an AI-powered sentiment analysis feature:

```powerappsfl
EvaluateSentimentPrompt(Input: Text): TestResult =
  With({
    Response: ParseJSON(
      Preview.AIExecutePrompt("SentimentAnalyzer",
      {
        Text: Input
      }).Text)
  },
  {
    Result: Response.Sentiment,
    Score: Response.ConfidenceScore,
    IsPositive: Response.Sentiment = "Positive" && Response.ConfidenceScore > 0.7,
    IsValid: !IsBlank(Response.Sentiment) && !IsBlank(Response.ConfidenceScore)
  })
```

### Example: Rating evaluation AI

The following example demonstrates using `Preview.AIExecutePrompt` to test an AI-powered rating system:

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
    {PassFail: 1, Summary: Prompt.Question & ", Expected " & Prompt.ExpectedRating & ", Actual " & Response.Rating}, 
    {PassFail: 0, Summary: "Pass " & Prompt.Question}
  ))
```

You can explore a complete implementation in the [AI Prompt sample](https://github.com/microsoft/PowerApps-TestEngine/blob/main/samples/dataverse/ai-prompt.fx.yaml).

## Best practices for AI component testing

To create effective tests for AI-powered components:

- **Define acceptable ranges** instead of exact values for numeric outputs
- **Create guard rails** to verify outputs meet structural requirements
- **Test with diverse inputs** including edge cases and boundary conditions
- **Include negative test cases** to ensure the AI handles invalid inputs appropriately
- **Segment your tests** by functionality rather than specific content
- **Use appropriate tolerances** based on the criticality of the component

## Common patterns for AI testing

The following examples illustrate common approaches for testing AI-powered features in Power Platform applications. These patterns help you validate content classification, boundary conditions, and other scenarios where AI outputs might vary.

### Content classification testing

```powerappsfl
// Test that a content classifier produces valid categories
ClassifyContent(Text: Text): Record = 
  With({
    Result: ParseJSON(Preview.AIExecutePrompt("Classifier", { Content: Text }).Text)
  },
  Assert(
    Result.Category In ["News", "Opinion", "Advertisement"], 
    "Content should be classified into valid category"
  ))
```

### Boundary testing

```powerappsfl
// Test AI Builder form processing with edge cases
TestFormProcessing(FormType: Text): TestResult =
  With({
    Result: ParseJSON(Preview.AIExecutePrompt("FormProcessor", { FormType: FormType }).Text)
  },
  Assert(
    !IsBlank(Result.Fields),
    "Form processing should extract fields even with poor quality input"
  ))
```

### Related articles

[Learn about Power Fx test functions](powerfx-functions.md)  
[Explore AI-assisted test authoring](ai-authoring.md)  
[Understand the Model Context Protocol](ai-mcp.md)  
[Browse the Test Engine samples catalog](samples.md)  

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
