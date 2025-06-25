---
title: "Test Engine feature lifecycle (preview)"
description: "Describes how Test Engine features progress from open source to preview to general availability"
author: pvillads
ms.author: pvillads
ms.subservice: test-engine
ms.date: 05/19/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - grant-archibald-ms
---

# Test Engine feature lifecycle (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

Test Engine has a structured feature lifecycle model to manage the progression of features from experimental concepts to generally available capabilities. This approach allows users to access new functionality at different maturity levels while ensuring reliability and stability for production scenarios.

## Feature progression in Test Engine

Test Engine features follow a defined pathway from inception to general availability in three phases:

1. [Open source innovation (preview phase)](#1-open-source-innovation-preview-phase)
1. [Preview features (evaluation phase)](#2-preview-features-evaluation-phase)
1. [General availability (stable phase)](#3-general-availability-stable-phase)

### 1. Open source innovation (preview phase)

The journey of many Test Engine features begins in the [open source repository](https://github.com/microsoft/PowerApps-TestEngine), where:

- Community members and Microsoft engineers propose and contribute new features
- New providers and extensions are developed to support more scenarios
- Custom Power Fx actions are created and tested in real-world environments
- Experimental concepts are validated before formal product integration

This preview phase represents the most cutting-edge capabilities, available to developers who build the Test Engine from source.

### 2. Preview features (evaluation phase)

Features that demonstrate value in the open source environment might progress to the evaluation phase, where they become available in the official Power Platform CLI (`pac`) release with explicit opt-in:

- Features are accessible through the `Preview` function prefix in Power Fx
- Functionality must be explicitly enabled in test settings:

```yaml
testSettings:
  extensionModules:
    enable: true
    allowPowerFxNamespaces:
      - Preview
```

- Features in this phase receive more extensive testing but might still evolve based on feedback
- Documentation includes the Preview designation to indicate potential future changes

### 3. General availability (stable phase)

After thorough testing and refinement in the Preview phase, stable features progress to general availability:

- Features migrate from the `Preview` prefix to the `TestEngine` prefix
- Functionality becomes available by default without special configuration
- Features are considered production-ready with full support
- Documentation removes the Preview designation

## Enabling features through Power Fx function organization

Test Engine uses Power Fx function prefixes as the primary mechanism to control feature availability:

| Function Prefix | Description | Availability |
|-----------|-------------|-------------|
| `TestEngine` | Production-ready features available to all users | Enabled by default |
| `Preview` | Features under evaluation that might change | Requires explicit opt-in |
| (None) | Core Power Fx functions | Always available |

This organization provides several benefits:

- **Clear indication of feature maturity**: The prefix communicates the stability expectation
- **Controlled access**: Preview features must be explicitly enabled, protecting users from unintended changes
- **Version resilience**: As features mature, code can be updated gradually to use the new prefix

For more information on configuring and using these prefixes, see [Use Power Fx function organization in testing](./powerfx-namespaces.md).

## Contributing to Test Engine's evolution

The Test Engine product team actively collaborates with the community to evolve the product:

### Open source contributions

Community members can contribute to Test Engine in several ways:

- **Provider Extensions**: Create new providers to support more application types
- **Power Fx Actions**: Develop custom actions to enable new testing scenarios
- **Feature Enhancements**: Improve existing functionality to address common scenarios
- **Reporting issues**: Report any issues you discover using our GitHub repository issues. Find existing known issues here: [aka.ms/TestEngineOpenIssues](https://aka.ms/TestEngineOpenIssues)

### Pathway to product integration

Features that begin as open source contributions might be considered for inclusion in the official Power Platform CLI (`pac test run`) through the following process:

1. **Initial Development**: Feature is created and tested in the open source repository
2. **Community Validation**: Other users verify the feature's utility and stability
3. **Product Consideration**: The Test Engine product team reviews the feature
4. **Preview Integration**: If approved, the feature is integrated into the Preview prefix
5. **General Availability**: After sufficient validation, the feature graduates to the TestEngine prefix

### Collaboration with the product team

Developers interested in contributing features that might eventually be included in the official product should:

- **Discuss Before Developing**: Open an issue in the repository to discuss the concept
- **Follow Design Guidelines**: Ensure the implementation aligns with Test Engine's architecture
- **Provide Comprehensive Tests**: Include automated tests demonstrating reliability
- **Document the Feature**: Create clear documentation for users

## Benefits of the feature lifecycle model

For Test Engine users, this model offers several advantages:

- **Access to Innovation**: Use cutting-edge features before they're formally released
- **Controlled Risk**: Choose which preview features to enable based on needs
- **Clear Expectations**: Understand feature stability through consistent prefix conventions
- **Participation Opportunity**: Influence product direction through contributions and feedback


[!INCLUDE [footer-banner](../includes/footer-banner.md)]
