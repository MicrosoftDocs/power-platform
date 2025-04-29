---
title: "Power Apps Test Engine Power Fx functions (preview)"
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

# Power Apps Test Engine Power Fx 

[!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

> NOTE:
> You can make use of [Learning Playground](https://microsoft.github.io/PowerApps-TestEngine/learning/playground/) to get hands on and try the functions documented in this guide.

## What is Power Fx?

[Microsoft Power Fx](../power-fx/overview.md) is a low-code general-purpose programming language based on spreadsheet-like formulas. It's a typed, declarative, and functional language, with imperative logic and state management available as needed. Its history from Excel makes it accessible to a wide range of users, from beginners to experienced developers.

### Advanced Power Fx Scenarios

If you're already familiar with Power Fx, diving into advanced scenarios can significantly enhance the capabilities and efficiency of your applications. Here are some advanced scenarios and why they might be of interest:

- **Creating Custom Functions** Creating custom functions allows developers to encapsulate complex logic into reusable components. This approach not only simplifies the development process but also ensures consistency and reduces the likelihood of errors. Custom functions can be tailored to specific business needs, making your test more powerful and flexible.

- **Integrating with External Data Sources** Integrating Power Fx with external data sources enables your tests to interact with a wide range of data, from databases to web services. This integration can enhance the functionality of your applications by providing real-time data access and updates. It also allows for more dynamic and responsive tests that can adapt to changing data.

- **Optimizing Performance for Large-Scale Tests** As your tests grow in complexity and scale, performance optimization becomes important. These optimizations could include performance, such as efficient data handling and using Power Fx's built-in functions for better performance. These optimizations ensure that your tests remain responsive and efficient, even with large datasets and complex logic.

## Extensibility Model

Test Engines Power Fx's [extensibility model](./extensibility.md) is one of its many compelling features. It allows you to extend the language with custom functions and actions, making it highly adaptable to various scenarios. Here are some key aspects of the extensibility model:

- **Reuse the Skills You Already Have**: Power Fx's extensibility model allows you to use your existing skills in Power Fx and other programming languages, such as C#. Using this approach means you can bring your knowledge and experience into the Power Fx based tests, making it easier to create powerful and customized solutions.

- **Allow Reuse of Existing Libraries and Features**: The extensibility model enables the integration of existing libraries and features into Power Fx. Reuse allows developers to reuse tried-and-tested code and reducing development time to increase reliability. By incorporating existing libraries, you can enhance the functionality of your Power Fx applications without reinventing the wheel.

- **Provide a Model to Encapsulate Complexity for Users of the Functions**: One of the significant advantages of the extensibility model is its ability to encapsulate complexity. Makers and Developers can create custom functions that hide the intricate details of the underlying logic, providing a simple and user-friendly interface for end-users. Abstraction makes it easier for everyone to use and benefit from advanced functionality without needing to understand the complexities behind it.

- **Enhance Collaboration and Consistency**: Teams can create a consistent set of custom functions and actions that can be shared and reused across different projects. Using common `testSettings.yaml` file can promote collaboration and ensures that best practices are followed, leading to more robust and maintainable applications.

- **Facilitate Integration with External Systems**: The extensibility model allows for seamless integration with external systems and services. This means you can connect your Power Fx applications to a wide range of data sources and APIs, enhancing their capabilities and providing real-time data access.

- **Support for Advanced Scenarios**: The extensibility model is designed to support advanced scenarios, such as creating domain-specific languages and custom workflows. This flexibility ensures that Power Fx can be adapted to meet the unique needs of different industries and use cases.

As developer or advanced maker understanding and using the extensibility model, developers can create more powerful, flexible, and user-friendly applications with Power Fx. This model not only enhances the capabilities of the language but also makes it more accessible and valuable to a broader range of users.

## User Defined Types

User Defined Types (UDTs) in Power Apps Test Engine allow you to define custom data structures that can be used within your test plans. This feature enhances the flexibility and reusability of your test cases by enabling you to create complex data types tailored to your specific testing needs.

### Example: testSettings.yaml

This example shows how to define and use User Defined Types in a `testSettings.yaml` file:

```yaml
powerFxTestTypes:
 - name: ControlName
   value: |
      {ControlName: Text} 
 - name: Options
   value: |
      [{Name: Text, Value: Number}]   
```

### Explanation

Defining the Type: The `powerFxTestTypes` section defines two new types: ControlName and Options.

ControlName is a simple type with a single property ControlName of type Text.
Options are a more complex type, representing a list of objects, each with Name (of type Text) and Value (of type Number).

Using the Type: These types can be used within your test cases to define variables and validate their properties. For example, you can set a variable of type Options and validate that it contains the expected Name and Value pairs.

## User Defined Functions

User Defined Functions (UDFs) in Power Apps Test Engine allow you to define custom functions that can be used within your test plans. This feature enhances the flexibility and reusability of your test cases by enabling you to create complex functions tailored to your specific testing needs.

### Example: testSettings.yaml

This example shows how to define and use User Defined Functions in a `testSettings.yaml` file:

```yaml
testFunctions:
 - description: Wait until control is visible using Document Object Model (DOM) selector
   code: |
    WaitUntilVisible(control: Text): Void = 
      Preview.PlaywrightAction(Concatenate("//div[@data-id='", control, "']"), "wait");
 - description: Get the options for a control using Power Fx control from Model Driven App (MDA)
   code: |
    GetOptions(control: ControlName): Options =
      Preview.GetOptions(control);
```

### Explanation

1. **Defining the Functions**: The `testFunctions` section defines two new functions:
   - `WaitUntilVisible`: This function takes a `control` parameter of type `Text` and waits until the specified control is visible using a DOM selector.
   - `GetOptions`: This function takes a `control` parameter of type `ControlName` and returns the options for the specified control using Power Fx from a Model Driven App (MDA).

2. **Using the Functions**: These functions can be used within your test cases to perform specific actions or retrieve data. For example, you can use `WaitUntilVisible` to ensure a control is visible before interacting with it, and `GetOptions` to retrieve and validate the options available for a control.

### Benefits

- **Reusability**: UDFs allow you to define complex functions once and reuse them across multiple test cases. This reduces redundancy and ensures consistency in your test plans.
- **Readability**: Using UDFs makes your test plans more readable and easier to maintain. By defining custom functions, you can encapsulate complex logic and make your test cases more understandable.
- **Flexibility**: UDFs provide the flexibility to create custom functions that fit your specific testing requirements. Use this approach to allow you to tailor your test cases to better fit your application's needs.
- **Maintainability**: With UDFs, changes to functions can be made in one place, reducing the effort required to update multiple test cases. This improves the maintainability of your test plans.

## Functions (preview)

There are several functions defined for the test framework.

- [Assert](#assert)
- [Screenshot](#screenshot)
- [Select](#select)
- [SetProperty](#setproperty)
- [Wait](#wait)

## Assert

`Assert(BooleanExpression)`

`Assert(BooleanExpression, Message)`

The `Assert` function takes in a Power Fx expression that should evaluate to a boolean value. If the value returned is false, the test fails.

### Assert example

`Assert(Label1.Text = "1");`

`Assert(Label1.Text = "1", "Checking that the Label1 text is set to 1");`

## Screenshot

`Screenshot(fileNameOfScreenshot)`

This function captures a screenshot of the app at the current point in time. The screenshot file is saved to the test output folder and with the name provided.

> **Note:** Only jpeg and png files are supported.

### Screenshot Example

`Screenshot("buttonClicked.png")`

## Select

`Select(control)`

`Select(control, row or column)`

`Select(control, row or column, child control)`

`Select(Index(gallerycontrol.AllItems, row or column).child control)`

This function has the same functionality as the Power Apps  [Select function](../power-fx/reference/function-select.md).

When working with a nested gallery, use [Index()](../power-fx/reference/function-first-last.md) within the select function.

### Select example

`Select(Button1)`

`Select(Gallery1,1)`

`Select(Gallery1,1,Button1)`

`Select(Index(Gallery1.AllItems, 2).Icon2)`

`Select(Index(Index(Gallery1.AllItems, 1).Gallery2.AllItems, 4).Icon3);`

## SetProperty

`SetProperty(control.propertyName, propertyValue)`

This function has the same functionality as the Power Apps [SetProperty function](../power-fx/reference/function-setproperty.md).

When working with a nested gallery, use [Index()](../power-fx/reference/function-first-last.md) within the `SetProperty` function.

### SetProperty example

`SetProperty(TextInput.Text, "Say Something")`

`SetProperty(Dropdown1.Selected, {Value:"2"})`

`SetProperty(ComboBox1.SelectedItems, Table({Value:"1"},{Value:"2"}))`

`SetProperty(Index(Gallery1.AllItems, 1).TextInput1.Text, "Change the text input")`

`Select(Index(Index(Gallery1.AllItems, 1).Gallery2.AllItems, 1).TextInput1.Text, "Change the text input")`

## Wait

`Wait(Control, Property, Value)`

This function waits for the property of the control to equal the specified value.

### Wait example

` Wait(Label1, "Text", "0")`

### See also

- [Power Apps Test Engine overview (preview)](overview.md)
- [Power Apps Test Engine YAML format (preview)](yaml.md)

## Preview Functions

The following functions can optionally be included in tests when the Power Fx Preview namespace by adding it to the allowlist in the testSettings section

> [!NOTE]
> - Preview functions are subject to change. As these functions become ready for wider usage they may move to the `TestEngine` namespace.
> - You can use User Defined Functions to wrap `Preview` functions to make migration to non preview versions of the function easier.
> - You could have the model only return a JSON object that you could pars using the `ParseJSON()` function.

### Preview.AIExecutePrompt

`Preview.AIExecutePrompt(Name, {Property: Type})`

Call a [Custom AI Builder prompt](/ai-builder/create-a-custom-prompt) and obtain text results of the execution.

> NOTE: Review the provider [Dataverse AI Integration](./providers.md#ai-integration) for information on availablity and configuration of this function.

#### Preview.AIExecutePrompt Example

The following example calls the AI Prompt named **Country Capital** with a parameters value of **Country** and expects the model execution to return a single word **Paris**

```
Assert("Paris" = Preview.AIExecutePrompt("Country Capital", { Country: "France" }).Text)
```

### Preview.ConsentDialog

`Preview.ConsentDialog(Table({Text: Text}));`

Wait to confirm a consent dialog for a canvas application or Model Driven Application custom page

#### Preview.ConsentDialog Example

```
Preview.ConsentDialog(Table({Text: "Your Dialog Title"}));
```

### Preview.Pause

`Preview.Pause()`

Pause the test and display the [Playwright Inspector](https://playwright.dev/docs/debug#playwright-inspector) if running an interactive test

#### Preview.Pause Example

```
Preview.Pause()
```

### Preview.SelectControl

`Preview.SelectControl(Control: ControlName, Index: Number)`

Select a control using Document Object Model

#### Preview.SelectControl Example

Select first Button3 match

```
Preview.SelectControl(Button3,1);
```

### Preview.PlaywrightAction

`Preview.PlaywrightAction(Text, Text)`

Execute an action on the current page using a Playwright [CSS or XPath Locator](https://playwright.dev/docs/locators#locate-by-css-or-xpath) 

#### Preview.PlaywrightAction Examples

```
Preview.PlaywrightAction("//button", "click");
Preview.PlaywrightAction("//button", "exists");
Preview.PlaywrightAction("//button", "wait");
```

### Preview.PlaywrightActionValue

`Preview.PlaywrightActionValue(Text, Text, Text)`

Execute an action on the current page using a Playwright [CSS or XPath Locator](https://playwright.dev/docs/locators#locate-by-css-or-xpath) with a value

#### Preview.PlaywrightActionValue Examples

```
Preview.PlaywrightAction("//input[@data-id='1']", "fill", "Hello");
```

### Preview.PlaywrightScript

`Preview.PlaywrghtScript(Text)`

Execute the C# script on the current page

### Preview.PlaywrightScript Example

```
Preview.PlaywrightScript("sample.csx")
```

With the content of the sample.csx similar to

```sample.csx
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

```
Preview.SimulateConnector({name: "msnweather", then: {responses: { daily: { day: { summary: "You are seeing the mock response" }}}}})
```

### Preview.SimulateDataverse

`Preview.SimulateDataverse({Action: Text, Entity: Text, Then: Table})`

#### Preview.SimuateDataverse Example

This example when a call is made to query the Dataverse entity with logical name **cr693_combotable** it returns the records using [**Table()**](../power-fx/reference/function-table.md) function

```
Preview.SimulateDataverse({
    Action: "Query",
    Entity: "cr693_combotable",
    Then: Table(
    {
        'cr693_name': "Item 1",
        'cr693_id': 3,
        'cr693_combotableid': "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb",
        'createdon': "2024-12-02T17:52:45Z"
    },
    {
        'cr693_name': "RR2",
        'cr693_id': 4,
        'cr693_combotableid': "bbbbbbbb-1111-2222-3333-cccccccccccc",
        'createdon': "2024-12-02T17:54:45Z"
    },
        {
        'cr693_name': "RR3",
        'cr693_id': 5,
        'cr693_combotableid': "cccccccc-2222-3333-4444-dddddddddddd",
        'createdon': "2024-12-02T17:54:45Z"
    }
    )
});
```

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
