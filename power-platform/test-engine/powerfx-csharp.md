---
title: "Test Engine Power Fx C# Functions"
description: "Describes the creating Power Fx functions using C# in Test Engine"
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/09/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - pvillads
---

# Creating a C# Power Fx Test Function

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

Power Fx is a powerful low-code language used in Power Apps, and it can be extended using C# to create custom test functions. This article explains how to create a C# Power Fx test function, providing a seamless experience for both makers and developers.

## Extending Power Fx Test Functions Using C#

The "no cliffs" extensibility model of Power Apps Test Engine ensures that users can extend the capabilities of the Power Apps Test Engine without hitting any barriers. This model allows developers to create custom functions using C#, which can be integrated into Power Fx to handle complex scenarios.

## Example

Here's an example of a Power Fx function that provides the outline of code to handle a conditional consent dialog in a [canvas application](./canvas-application.md)

## What is a Consent Dialog?

A [consent dialog](/power-apps/maker/canvas-apps/connections-list#connection-consent-dialog) is a prompt that appears to users, asking for their permission to access certain resources or perform specific actions. This dialog is crucial for maintaining security and ensuring that users are aware of and agree to the actions being taken on their behalf.

![Example of the connection consent dialog for an app connecting to a SharePoint site.](/power-apps/maker/canvas-apps/media/connections-list/power_apps_consent_dialog.png)

## Importance of the Consent Dialog

The consent dialog is important because it helps prevent unauthorized access and actions. It ensures that users are informed and provide their explicit consent before any sensitive operations are performed. This is important in scenarios where the application needs to access user data or perform actions and this conditional behavior could affect automated tests.

## Challenges with Consent Dialogs in Testing

One of the challenges with consent dialogs is that they can make tests nondeterministic. The prompt can conditionally appear based on various factors, such as user permissions or previous interactions. This conditional appearance can complicate the testing process, as the test engine needs to handle these dialogs appropriately.

## Abstracting Complexity with Power Fx

Power Fx, a low-code language used in Power Apps, helps abstract the complexity of conditionally waiting for the consent dialog and creating connections if needed. By using Power Fx, makers can define the logic for handling consent dialogs in a more straightforward and intuitive manner.

### Example: Handling Consent Dialog with Power Fx

Here's an example of how Power Fx can be used to handle a consent dialog in a custom page:

```powerfx
Preview.ConsentDialog(Table({Text: "Center of Excellence Setup Wizard"}))
```

In this example, the `ConsentDialog()` function checks if the consent dialog is visible. If it is, the function can respond to the dialog confirming consent for the test account. Once the dialog is handled the remaining test steps will be executed.

The Table argument allows the consent dialog wait process to exit is a label with the provided text is visible.

## Extending Power Fx Test functions using C#

Sample outline code that could be used as a starting point to complete this example

```csharp
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT license.

using Microsoft.Extensions.Logging;
using Microsoft.Playwright;
using Microsoft.PowerApps.TestEngine.Config;
using Microsoft.PowerApps.TestEngine.TestInfra;
using Microsoft.PowerFx;
using Microsoft.PowerFx.Core.Utils;
using Microsoft.PowerFx.Types;

namespace testengine.module
{
    /// <summary>
    /// This will check the custom pages of a model driven app looking for a consent dialog
    /// </summary>
    public class ConsentDialogFunction : ReflectionFunction
    {
        private readonly ITestInfraFunctions _testInfraFunctions;
        private readonly ITestState _testState;
        private readonly ILogger _logger;
        private static TableType SearchType = TableType.Empty()
              .Add(new NamedFormulaType("Text", FormulaType.String, displayName: "Text"));
    
        public ConsentDialogFunction(ITestInfraFunctions testInfraFunctions, ITestState testState, ILogger logger)
            : base(DPath.Root.Append(new DName("Preview")), "ConsentDialog", FormulaType.Blank, SearchType)
        {
            _testInfraFunctions = testInfraFunctions;
            _testState = testState;
            _logger = logger;
        }

        public BlankValue Execute(TableValue searchFor)
        {
            _logger.LogInformation("------------------------------\n\n" +
                "Executing ConsentDialog function.");

            ExecuteAsync(searchFor).Wait();

            return FormulaValue.NewBlank();
        }

        private async Task ExecuteAsync(TableValue searchFor)
        {
            var page = _testInfraFunctions.GetContext().Pages.Where(p => p.Url.Contains("main.aspx")).First();

            // ... IPage to handle consent dialog with timeout
        }
    }
}
```

### Explanation

- Namespace and Imports: The code begins by importing necessary namespaces and defining the testengine.module namespace.
- Class Definition: The `ConsentDialogFunction` class inherits from `ReflectionFunction` and defines the custom function ConsentDialog.
- Constructor: The constructor initializes the function with necessary dependencies, including ITestInfraFunctions, ITestState, and ILogger.
- Execute Method: The Execute method logs the execution and calls the ExecuteAsync method to handle the consent dialog.
- ExecuteAsync Method: The ExecuteAsync method retrieves the page context and handles the consent dialog with a timeout.

## Conclusion

By extending Power Fx with C#, developers can create custom test functions that handle complex scenarios like consent dialogs. This approach uses the "no cliffs" extensibility model of Power Apps Test Engine, providing a robust and flexible solution for testing Power Apps.

[!INCLUDE [footer-banner](../includes/footer-banner.md)]