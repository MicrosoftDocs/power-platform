---
title: "Create a C# Power Fx test function (preview)"
description: "Describes the creating Power Fx functions using C# in Test Engine"
author: pvillads
ms.author: pvillads
ms.subservice: test-engine
ms.date: 05/19/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
- grant-archibald-ms
---

# Create a C# Power Fx test function (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

[Microsoft Power Fx](../power-fx/overview.md) is a powerful low-code language used in Power Apps, and it can be extended using C# to create custom test functions. This article explains how to create a C# Power Fx test function, providing a seamless experience for both makers and developers.

The ['no cliffs' extensibility model](/power-platform/guidance/adoption/application-modernization#power-platform-extensibility-options) of Power Apps Test Engine ensures that users can extend the capabilities of the Power Apps Test Engine without hitting any barriers. This model allows developers to create custom functions using C#, which can be integrated into Power Fx to handle complex scenarios.

## Test Engine modules

The [Test engine modules](./module-functions-reference.md) for Power Fx inside Test Engine are built using the extensibility model. You can use the product code as examples of how Test Engine can be extended.

## Consent dialog example

Here's an example of a Power Fx function that provides the outline of code to handle a conditional consent dialog in a [canvas application](./canvas-application.md).

A [consent dialog](/power-apps/maker/canvas-apps/connections-list#connection-consent-dialog) is a prompt that appears to users, asking for their permission to access certain resources or perform specific actions. This dialog is crucial for maintaining security and ensuring that users are aware of and agree to the actions being taken on their behalf.

![Example of the connection consent dialog for an app connecting to a SharePoint site.](/power-apps/maker/canvas-apps/media/connections-list/power_apps_consent_dialog.png)

The consent dialog is important because it helps prevent unauthorized access and actions. It ensures that users are informed and provide their explicit consent before any sensitive operations are performed. This is important in scenarios where the application needs to access user data or perform actions and this conditional behavior could affect automated tests.

### Challenges with consent dialogs in testing

One of the challenges with consent dialogs is that they can make tests nondeterministic. The prompt can conditionally appear based on various factors, such as user permissions or previous interactions. This conditional appearance can complicate the testing process, as the Test Engine needs to handle these dialogs appropriately.

## Abstracting complexity with Power Fx

Power Fx helps abstract the complexity of conditionally waiting for the consent dialog and creating connections if needed. Makers can use Power Fx to define the logic for handling consent dialogs in a more straightforward and intuitive manner.

### Example: Handling consent dialog with Power Fx

Here's an example of using Power Fx to handle a consent dialog in a custom page:

```powerappsfl
Preview.ConsentDialog(Table({Text: "Center of Excellence Setup Wizard"}))
```

In this example, the `ConsentDialog` function checks if the consent dialog is visible. If it is, the function can respond to the dialog confirming consent for the test account. Once the dialog is handled, the remaining test steps are executed.

The `Table` argument allows the consent dialog wait process to exit is a label with the provided text is visible.

## Extending Power Fx test functions using C#

The following example is a sample outline code that could be used as a starting point to complete this example:

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
    
        /// <summary>
        /// Constructor: Initializes the function with necessary dependencies, 
        /// including ITestInfraFunctions, ITestState, and ILogger.
        /// </summary>
        /// <param name="testInfraFunctions">The test infrastructure functions.</param>
        /// <param name="testState">The test state.</param>
        /// <param name="logger">The logger instance.</param>
        public ConsentDialogFunction(ITestInfraFunctions testInfraFunctions, 
           ITestState testState, 
           ILogger logger) : base(DPath.Root.Append(
               new DName("Preview")), 
               "ConsentDialog", 
               FormulaType.Blank, 
               SearchType)
               {
                  _testInfraFunctions = testInfraFunctions;
                  _testState = testState;
                  _logger = logger;
               }

        /// <summary>
        /// Execute Method: Logs the execution and calls the ExecuteAsync 
        /// method to handle the consent dialog.
        /// </summary>
        /// <param name="searchFor">The table value to search for.</param>
        /// <returns>A blank value.</returns>
        public BlankValue Execute(TableValue searchFor)
        {
            _logger.LogInformation("------------------------------\n\n" +
                "Executing ConsentDialog function.");

            ExecuteAsync(searchFor).Wait();

            return FormulaValue.NewBlank();
        }

        /// <summary>
        /// ExecuteAsync Method: Retrieves the page context and handles the consent dialog with a timeout.
        /// </summary>
        /// <param name="searchFor">The table value to search for.</param>
        /// <returns>A task representing the asynchronous operation.</returns>
        private async Task ExecuteAsync(TableValue searchFor)
        {
            var page = _testInfraFunctions
               .GetContext()
               .Pages
               .Where(p => p.Url.Contains("main.aspx"))
               .First();

            // ... IPage to handle consent dialog with timeout
        }
    }
}
```

### ConsentDialogFunction example explanation

- **Namespace and Imports**: Imports necessary namespaces and defining the `testengine.module` namespace.
- **Class Definition**: The `ConsentDialogFunction` class inherits from [ReflectionFunction](/dotnet/api/microsoft.powerfx.reflectionfunction) and defines the custom function `ConsentDialog`.
- **Constructor**: Initializes the function with necessary dependencies, including `ITestInfraFunctions`, `ITestState`, and [ILogger](/dotnet/api/microsoft.extensions.logging.ilogger).
- **Execute Method**: Logs the execution and calls the `ExecuteAsync` method to handle the consent dialog.
- **ExecuteAsync Method**: Retrieves the page context and handles the consent dialog with a timeout.


[!INCLUDE [footer-banner](../includes/footer-banner.md)]