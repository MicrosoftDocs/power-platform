---
title: "Use Power Fx namespaces in testing (preview)"
description: "Describes the Power Fx namespaces used in Test Engine"
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/09/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - pvillads
---

# Use Power Fx namespaces in testing (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

Power Fx namespaces are a powerful feature that allows developers to organize and separate different sets of functions within the Power Fx language. By using namespaces, you can distinguish between the default functions provided by Power Fx, such as [CountRows()](../power-fx/reference/function-table-counts.md), and extensions added for specific purposes, like the Test Engine with functions such as Preview.Pause(). This separation helps in maintaining clarity and avoiding conflicts between different sets of features.

## Common Features vs. Specific Actions

Namespaces make it clear what are common features of the Power Fx language and what are specific actions unique to certain extensions. For example, functions like [CountRows()](../power-fx/reference/function-table-counts.md) are part of the core Power Fx language and are available universally. On the other hand, functions like [Preview.Pause()](powerfx-functions.md#previewpause) are specific to the Test Engine and are used exclusively within the context of testing Power Apps. This distinction helps developers understand the scope and applicability of each function, ensuring that they use the right tools for the right tasks.

## Separating Wider Usage Actions from Preview Features

Namespaces also allow developers to separate actions that have wider usage from functions that are experimental and subject to change. For instance, the Preview namespace can be used for early concepts and features that are still being tested and refined. By placing preview features in a separate namespace, developers can experiment with new ideas without affecting the stability of their main applications. This approach encourages innovation while maintaining a clear boundary between stable and experimental features.

## Progression from Preview to TestEngine Namespace

As features mature and become more stable, they can progress from the `Preview` namespace to more specialized namespaces like `TestEngine`. This progression indicates that the features are tested and refined, and are now ready for broader use in specific contexts. For example, a function that starts in the `Preview` namespace for testing purposes might eventually move to the `TestEngine` namespace once it has proven its reliability and usefulness in testing scenarios. This structured progression helps in managing the lifecycle of features and ensures that only well-tested functionalities are used in production environments.

## Managing Namespaces in Test Settings

Namespaces in Power Fx can be managed through the test settings in the YAML configuration. This ability allows you to specify the allow and blocklist values to control which namespaces are enabled. By default, the `TestEngine` namespace is allowed. 

YAML test settings allow and block of Power Fx namespaces:

```yaml
testSettings:
  headless: false
  locale: "en-US"
  recordVideo: true
  extensionModules:
    enable: true
    allowNamespaces:
      - Preview
```

## Conclusion

In summary, Power Fx namespaces provide a structured way to organize and separate different sets of functions within the language. They help in distinguishing between common features and specific actions, separating stable functionalities from experimental ones, and managing the progression of features from experimental to specialized contexts. By using namespaces effectively, developers can maintain clarity, avoid conflicts, and ensure the stability and reliability of their Power Apps.

[!INCLUDE [footer-banner](../includes/footer-banner.md)]