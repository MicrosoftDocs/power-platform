---
title: "Power Apps Test Engine Power Fx Functions (preview)"
description: "Describes Power Fx functions you can use with Power Apps Test Engine."
author: grant-archibald-ms
ms.author: grarchib
ms.date: 08/11/2023
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - jt000
 - FrankDahl
 - grant-archibald-md
---

# Power Apps Test Engine Power Fx Functions (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

Test engine uses these existing PowerFx functions:

- [Assert](../power-fx/reference/function-assert.md)
- [Select function](../power-fx/reference/function-select.md)
- [SetProperty function](../power-fx/reference/function-setproperty.md)


These functions are available to use in Test engine only:

- [Screenshot](#screenshot)
- [Wait](#wait)


 Test engine provides these preview functions:

- [Preview.AIExecutePrompt](#previewaiexecuteprompt)
- [Preview.ConsentDialog](#previewconsentdialog)
- [Preview.Pause](#previewpause)
- [Preview.PlaywrightAction](#previewplaywrightaction)
- [Preview.PlaywrightActionValue](#previewplaywrightactionvalue)
- [Preview.PlaywrightScript](#previewplaywrightscript)
- [Preview.SelectControl](#previewselectcontrol)
- [Preview.SimulateConnector](#previewsimulateconnector)
- [Preview.SimulateDataverse](#previewsimulatedataverse)

## Test engine functions

These functions are only available to be used with Test engine

### Screenshot

`Screenshot(fileNameOfScreenshot)`

This function captures a screenshot of the app at the current point in time. The screenshot file is saved to the test output folder and with the name provided.

> **Note:** Only jpeg and png files are supported.

#### Screenshot Example

`Screenshot("buttonClicked.png")`


### Wait

`Wait(Control, Property, Value)`

This function waits for the property of the control to equal the specified value.

#### Wait example

` Wait(Label1, "Text", "0")`


## Preview Functions

The following functions can optionally be included in tests when the Power Fx Preview namespace by adding it to the allowlist in the testSettings section

> [!NOTE]
> - Preview functions are subject to change. As these functions become ready for wider usage, they're considered to move within the `TestEngine` namespace.
> - You can use User Defined Functions to wrap `Preview` functions to make migration to non preview versions of the function easier.
> - You could have the model only return a JSON object that you could parse using the `ParseJSON` function.

### Preview.AIExecutePrompt

`Preview.AIExecutePrompt(Name, {Property: Type})`

Call a [Custom AI Builder prompt](/ai-builder/create-a-custom-prompt) and obtain text results of the execution.

> [!NOTE]
> Review the [Dataverse AI Integration](./dataverse.md#ai-integration) section for information on availability and configuration of this function.

#### Preview.AIExecutePrompt Example

The following example calls the AI Prompt named **Country Capital** with a parameters value of **Country** and expects the model execution to return a single word **Paris**

```powerappsfl
Assert("Paris" = Preview.AIExecutePrompt("Country Capital", { Country: "France" }).Text)
```

### Preview.ConsentDialog

`Preview.ConsentDialog(Table({Text: Text}));`

Wait to confirm a consent dialog for a canvas application or Model Driven Application custom page

#### Preview.ConsentDialog Example

```powerappsfl
Preview.ConsentDialog(Table({Text: "Your Dialog Title"}));
```

### Preview.Pause

`Preview.Pause()`

Pause the test and display the [Playwright Inspector](https://playwright.dev/docs/debug#playwright-inspector) if running an interactive test

#### Preview.Pause Example

```powerappsfl
Preview.Pause()
```

### Preview.SelectControl

`Preview.SelectControl(Control: ControlName, Index: Number)`

Select a control using Document Object Model

#### Preview.SelectControl Example

Select first `Button3` match

```powerappsfl
Preview.SelectControl(Button3,1);
```

### Preview.PlaywrightAction

`Preview.PlaywrightAction(Text, Text)`

Execute an action on the current page using a Playwright [CSS or XPath Locator](https://playwright.dev/docs/locators#locate-by-css-or-xpath) 

#### Preview.PlaywrightAction Examples

```powerappsfl
Preview.PlaywrightAction("//button", "click");
Preview.PlaywrightAction("//button", "exists");
Preview.PlaywrightAction("//button", "wait");
```

### Preview.PlaywrightActionValue

`Preview.PlaywrightActionValue(Text, Text, Text)`

Execute an action on the current page using a Playwright [CSS or XPath Locator](https://playwright.dev/docs/locators#locate-by-css-or-xpath) with a value

#### Preview.PlaywrightActionValue Examples

```powerappsfl
Preview.PlaywrightAction("//input[@data-id='1']", "fill", "Hello");
```

### Preview.PlaywrightScript

`Preview.PlaywrightScript(Text)`

Execute the C# script on the current page

> [!NOTE] 
> This function is only implemented for the Debug build from open source version of Test Engine not in [pac test run](../developer/cli/reference/test.md#pac-test-run).

### Preview.PlaywrightScript Example

```powerappsfl
Preview.PlaywrightScript("sample.csx")
```

With the content of the `sample.csx` similar to this code:

```csharp
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#r "Microsoft.Playwright.dll"
#r "Microsoft.Extensions.Logging.dll"
using Microsoft.Playwright;
using Microsoft.Extensions.Logging;
using System.Linq;
using System.Threading.Tasks;

public class PlaywrightScript {
    public static void Run(IBrowserContext context, ILogger logger) {
        Execute(context, logger).Wait();
    }

    public static async Task Execute(IBrowserContext context, ILogger logger) {
        var page = context.Pages.First();

        if ( page.Url == "about:blank" ) {
            var nextPage = context.Pages.Skip(1).First();
            await page.CloseAsync();
            page = nextPage;
        }

        foreach ( var frame in page.Frames ) {
            if ( await frame.Locator("button:has-text('Button')").CountAsync() > 0 ) {
                await frame.ClickAsync("button:has-text('Button')");
            }
        }
    }
}
```

### Preview.SimulateConnector

`Preview.SimulateConnector({name: Text, then: Record})`

When a call is made from the Power Apps to a connector type found from [List of all Power Apps connectors](/connectors/connector-reference/connector-reference-powerapps-connectors)

#### Preview.SimulateConnector Example

```powerappsfl
Preview.SimulateConnector({
   name: "msnweather", 
   then: {responses: { 
      daily: { 
         day: { 
            summary: "You are seeing the mock response" }
            }
         }
      }
   })
```

### Preview.SimulateDataverse

`Preview.SimulateDataverse({Action: Text, Entity: Text, Then: Table})`

#### Preview.SimulateDataverse Example

This example when a call is made to query the Dataverse entity with logical name `sample_combotable` it returns the records using [Table](../power-fx/reference/function-table.md) function

```powerappsfl
Preview.SimulateDataverse({
    Action: "Query",
    Entity: "sample_combotable",
    Then: Table(
    {
        'sample_name': "Item 1",
        'sample_id': 3,
        'sample_combotableid': "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb",
        'createdon': "2024-12-02T17:52:45Z"
    },
    {
        'sample_name': "RR2",
        'sample_id': 4,
        'sample_combotableid': "bbbbbbbb-1111-2222-3333-cccccccccccc",
        'createdon': "2024-12-02T17:54:45Z"
    },
        {
        'sample_name': "RR3",
        'sample_id': 5,
        'sample_combotableid': "cccccccc-2222-3333-4444-dddddddddddd",
        'createdon': "2024-12-02T17:54:45Z"
    }
    )
});
```

### Related articles

[Dataverse and Connector Simulation with Test Engine (preview)](simulation.md)

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
