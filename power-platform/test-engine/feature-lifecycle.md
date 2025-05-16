---
title: "Test Engine Feature Lifecycle (preview)"
description: "Describes how Test Engine features progress from open source to preview to general availability"
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/16/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - pvillads
---

# Test Engine Feature Lifecycle (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

## Overview

The Test Engine product employs a structured feature lifecycle model to manage the progression of features from experimental concepts to generally available capabilities. This approach allows users to access new functionality at different maturity levels while ensuring reliability and stability for production scenarios.

## Feature Progression in Test Engine

Test Engine features follow a defined pathway from inception to general availability.

### 1. Open Source Innovation (Preview Phase)

The journey of many Test Engine features begins in the [open source repository](https://github.com/microsoft/PowerApps-TestEngine), where:

- Community members and Microsoft engineers can propose and contribute new features
- New providers and extensions can be developed to support additional scenarios
- Custom Power Fx actions can be created and tested in real-world environments
- Experimental concepts can be validated before formal product integration

This preview phase represents the most cutting-edge capabilities, available to developers who build the Test Engine from source.

### 2. Preview Features (Evaluation Phase)

Features that demonstrate value in the open source environment may progress to the Preview phase, where they become available in the official Power Platform CLI (`pac`) release with explicit opt-in:

- Features are accessible through the `Preview` function prefix in Power Fx
- Functionality must be explicitly enabled in test settings:

```yaml
testSettings:
  extensionModules:
    enable: true
    allowNamespaces:
      - Preview
```

- Features in this phase receive more extensive testing but may still evolve based on feedback
- Documentation includes the Preview designation to indicate potential future changes

### 3. General Availability (Stable Phase)

After thorough testing and refinement in the Preview phase, stable features progress to general availability:

- Features migrate from the `Preview` prefix to the `TestEngine` prefix
- Functionality becomes available by default without special configuration
- Features are considered production-ready with full support
- Documentation removes the Preview designation

## Enabling Features Through Power Fx Function Organization

Test Engine uses Power Fx function prefixes as the primary mechanism to control feature availability:

| Function Prefix | Description | Availability |
|-----------|-------------|-------------|
| `TestEngine` | Production-ready features available to all users | Enabled by default |
| `Preview` | Features under evaluation that may change | Requires explicit opt-in |
| (None) | Core Power Fx functions | Always available |

This organization provides several benefits:

1. **Clear indication of feature maturity**: The prefix communicates the stability expectation
2. **Controlled access**: Preview features must be explicitly enabled, protecting users from unintended changes
3. **Version resilience**: As features mature, code can be updated gradually to use the new prefix

For more information on configuring and using these prefixes, see [Use Power Fx function organization in testing](./powerfx-namespaces.md).

## Contributing to Test Engine's Evolution

The Test Engine product team actively collaborates with the community to evolve the product:

### Open Source Contributions

Community members can contribute to Test Engine in several ways:

1. **Provider Extensions**: Create new providers to support additional application types
2. **Power Fx Actions**: Develop custom actions to enable new testing scenarios
3. **Feature Enhancements**: Improve existing functionality to address common scenarios

### Pathway to Product Integration

Features that begin as open source contributions may be considered for inclusion in the official Power Platform CLI (`pac test run`) through the following process:

1. **Initial Development**: Feature is created and tested in the open source repository
2. **Community Validation**: Other users verify the feature's utility and stability
3. **Product Consideration**: The Test Engine product team reviews the feature
4. **Preview Integration**: If approved, the feature is integrated into the Preview prefix
5. **General Availability**: After sufficient validation, the feature graduates to the TestEngine prefix

### Collaboration with the Product Team

Developers interested in contributing features that may eventually be included in the official product should:

1. **Discuss Before Developing**: Open an issue in the repository to discuss the concept
2. **Follow Design Guidelines**: Ensure the implementation aligns with Test Engine's architecture
3. **Provide Comprehensive Tests**: Include automated tests demonstrating reliability
4. **Document the Feature**: Create clear documentation for users

## Benefits of the Feature Lifecycle Model

For Test Engine users, this model offers several advantages:

- **Access to Innovation**: Use cutting-edge features before they're formally released
- **Controlled Risk**: Choose which preview features to enable based on needs
- **Clear Expectations**: Understand feature stability through consistent prefix conventions
- **Participation Opportunity**: Influence product direction through contributions and feedback

## Summary

The Test Engine Feature Lifecycle provides a structured approach to feature progression, from open source innovation to preview availability and ultimately to general availability. By leveraging Power Fx function organization and encouraging community contributions, Test Engine balances innovation with stability, allowing users to adopt new capabilities at their preferred pace.

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
