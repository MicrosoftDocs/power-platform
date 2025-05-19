---
title: "Power Apps Test Engine YAML format (preview)"
description: Describes the YAML format for test following the same guidelines as Power Fx.
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/19/2025
ms.reviewer: jdaly
ms.topic: reference
contributors:
 - JimDaly
 - jt000
 - FrankDahl
---

# Power Apps Test Engine YAML format (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

Tests are defined in YAML following the same guidelines as Power Fx does. [Learn more about the Power Fx YAML formula grammar](../power-fx/yaml-formula-grammar.md).

View the [PowerApps-TestEngine/samples](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples) folder for detailed examples.

**YAML schema definitions**

| Property | Description |
|---|---|
| [testSuite](#testsuite) | Defines one test suite, the test cases in the test suite and configuration specific to the test suite |
| [testSettings](#testsettings) | Defines settings for the test suite that are reused across multiple test cases |
| [environmentVariables](#environmentvariables)| Defines variables that could potentially change as the app is ported across different environments |

## testSuite

Used to define one test.

| Property | Type | Description |
|---|---|---|
| `persona` | string |Required. The user that is logged in to perform the test. Must match a persona listed in the [Users](#users) section.|
| `testCases` | [TestCases](#testcases) |Required. Defines test cases in the test suite. Test cases contained in test suites are run sequentially. The app state is persisted across all test cases in a suite. |
| `testSuiteName` | string |Required. The name of the test suite. |
| `appLogicalName` | string |Optional. The logical name of the app that is to be launched. It can be obtained from the solution. For canvas apps, you need to add it to a solution to obtain it. See [How to identify your application in the test plan](#how-to-identify-your-application-in-the-test-plan) |
| `appId` | Guid |Optional. The ID of the app that is to be launched. Required and used only when `appLogicalName` isn't present. App ID should be used only for canvas apps that aren't in the solution. See [How to identify your application in the test plan](#how-to-identify-your-application-in-the-test-plan)  |
| `networkRequestMocks` | [NetworkRequestMocks](#networkrequestmocks) |Optional. Defines network request mocks needed for the test. |
| `onTestCaseComplete` | string |Optional. Defines the steps that need to be triggered for every test case in a suite after the case finishes executing. |
| `onTestCaseStart` | string |Optional. Defines the steps that need to be triggered for every test case in a suite before the case begins executing. |
| `onTestSuiteComplete` | string |Optional. Defines the steps that need to be triggered after the suite finishes executing. |
| `testSuiteDescription` | string |Optional. Additional information describes what the test suite does.|

### How to identify your application in the test plan

You need set either `appLogicalName` or `appId` to identify your application. Which you use depends on whether your app is defined within a solution.

#### Solution-based apps (recommended)

When you define your apps within solutions your tests remain portable across environments. Set the `appLogicalName` property to indicate that the app is solution based. 

To locate the app's logical name:

1. Open the solution containing your app in Power Apps
1. Use the **Name** (not **Display name**) in the list. The name value includes the customization prefix for the solution publisher.


#### Standalone apps

When your app isn't defined within a solution, you need to use the `appId` property.

To locate the ID of the app:

1. Locate the app in the Power Apps list
1. Open Details and note the App ID GUID



### NetworkRequestMocks

<!-- Add a description here -->

| Property | Type | Description |
|---|---|---|
| `requestURL` | string | Required. The request URL that gets mock response. Glob patterns are accepted |
| `responseDataFile` | string |Required. A text file with the mock response content. All text in this file is read as the response |
| `headers` | array |Optional. A list of header fields in the request in the format of [fieldName: fieldValue] |
| `method` | string |Optional. The request's method (GET, POST, etc.) |
| `requestBodyFile` | string |Optional. A text file with the request body. All text in this file is read as the request body |

For optional properties, if no value is specified, the routing applies to all. For example, if `method` is null, we send back the mock response whatever the method is as long as the other properties all match.

For Sharepoint/Dataverse/Connector apps, `requestURL` and `method` can be the same for all requests. `x-ms-request-method` and `x-ms-request-url` in headers could need to be configured in that case to identify different requests.

### TestCases

<!-- Add a description here -->

| Property | Type | Description |
|---|---|---|
| `testCaseName` | string |Required. The name of the test case that is used in reporting success and failure |
| `testSteps` | [TestSteps](#teststeps) |Required. A set of Power Fx functions describing the steps needed to perform the test case. See [TestSteps example](#teststeps-example)|
| `testCaseDescription` | No |Optional. Additional information describes what the test case does |

### TestSteps

- `TestSteps` can use any existing [Test Engine Power Fx functions](../power-fx/overview.md) functions or [specific test functions](powerfx.md) defined by this framework.
- The value should start with a pipe symbol (`|`) to allow for multiline YAML expressions followed by an equals (`=`) sign to indicate that it's a Power Fx expression
- Functions should be separated by a semicolon (`;`).
- Comments can be used and should start with double backslash characters (`//`).

#### TestSteps example

```yml
testCases:
   - testCaseName: Fill in a city name and do the search
   testSteps: |
      = Screenshot("connectorapp_loaded.png");
         SetProperty(TextInput1.Text, "Atlanta");
         Select(Button1);
         Assert(Label4.Text = "You are seeing the mock response", "Validate the output is from the mock");
         Screenshot("connectorapp_end.png");
```

## testSettings

Used to define settings for the tests in the test plan.

| Property | Type | Description |
|---|---|---|
| `browserConfigurations` | [BrowserConfiguration](#browserconfiguration)[] |Required. A list of browser configurations to be tested. At least one browser must be specified. |
| `filePath` | string |Optional. The file path to a separate yaml file with all the test settings. If provided, it will **override** all the test settings in the test plan. |
| `headless` | boolean |Optional. Default is true. If set to false, the browser shows up during test execution. |
| `locale` | string |Optional. The locale/culture syntax in which the test cases or test steps are written in. If unspecified, `CultureInfo.CurrentCulture` is used for the locale by default for parsing the test steps. See [Region and language considerations](#region-and-language-considerations) |
| `recordVideo` | boolean |Optional. Default is false. If set to true, a video recording of the test is captured. |
| `timeout` | integer |Optional. Timeout value in milliseconds. Default is 30,000 milliseconds (30s). If any operation takes longer than the timeout limit, it ends the test in a failure. |
|`powerFxTestTypes`|`name` `value` pair|Optional. A list of type name and Power Fx type definitions. See [powerFxTestTypes example](#powerfxtesttypes-example)|
| `testFunctions` | `description` `code` pair |Optional. A list of description and Power Fx function definitions. See [testFunctions example](#testfunctions-example)|

### Region and language considerations

Test Engine supports various language and regional settings such as decimal and list separators. The `testSettings.locale` property controls these behaviors. For more information, see [Global Support in Microsoft Power Fx](../power-fx/global.md).

Look at these sample configurations on the [PowerApps-TestEngine GitHub repository](https://github.com/microsoft/PowerApps-TestEngine):

- [For regions using semicolons as list separators](https://github.com/microsoft/PowerApps-TestEngine/blob/main/samples/basicgallery/testPlanForRegionUseSemicolonAsSeparator.fx.yaml)
- [For regions using commas as decimal separators](https://github.com/microsoft/PowerApps-TestEngine/blob/main/samples/calculator/testPlanWithCommaForDecimal.fx.yaml)

### powerFxTestTypes example

```yaml
powerFxTestTypes:
 - name: ControlName
   value: |
      {ControlName: Text} 
 - name: Options
   value: |
      [{Name: Text, Value: Number}]   
```

This example demonstrates how to define custom Power Fx types for use in your test cases. The `ControlName` type is defined as a record with a single `Text` field, while the `Options` type is defined as a table of records, each containing a `Name` field of type `Text` and a `Value` field of type `Number`. Custom types can be used to create more complex and specific test scenarios, enhancing the flexibility and power of your test definitions.

### testFunctions example

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

These test function examples demonstrate how to define custom Power Fx functions for use in your test cases. The `WaitUntilVisible` function uses a DOM selector to wait until a specified control is visible, using Playwright actions. The GetOptions function retrieves the options for a specified control from a [Model Driven App](./model-driven-application.md) (MDA), utilizing the Power Fx control. These custom functions enhance the flexibility and power of your test definitions, allowing for more complex and specific test scenarios.

#### BrowserConfiguration

Every [testSettings](#testsettings) requires at least one `BrowserConfiguration`.

| Property | Type | Description |
|---|---|---|
| `browser` | string |Required. The browser to be launched when testing. Should match the [browsers supported by Playwright](https://playwright.dev/dotnet/docs/browsers). |
| `device` | string |Optional. The device to emulate when launching the browser. Should match the [devices supported by Playwright](https://playwright.dev/dotnet/docs/api/class-playwright#playwright-devices) |
| `screenHeight` | integer |Optional. The height of the screen to use when launching the browser. If specified, `screenWidth` must also be specified. |
| `screenWidth` | integer |Optional. The width of the screen to use when launching the browser. If specified, `screenHeight` must also be specified. |

## environmentVariables

You can store different types of values as environmental values, but the most common case is storing credential information with a list of [users](#users).

### users

To ensure credentials are stored in secure manner, the test definition references users using a `personaName`. Storing credentials in test plan files isn't supported.

Example:

```yaml
environmentVariables:
    - users:
        - personaName: "User1"
          emailKey: "user1Email"
        - personaName: "User2"
          emailKey: "user2Email"
```

The `personaName` is used as part of the test definition to indicate what user to run the test as.

#### Supported credentials storage mechanisms

To store credentials as environment variables, you can set them as follows:

```powershell
# In PowerShell - replace variableName and variableValue with the correct values
$env:variableName = "variableValue"
```

In the YAML, two properties need to be defined to indicate that this user's credentials are stored in environment variables:

- `emailKey`: The environment variable used to store the user's email.

Example YAML:

```yaml
    - personaName: "User1"
      emailKey: "user1Email"
```

Example PowerShell to set user credentials based on YAML:

```powershell
$env:user1Email = "someone@example.com"
```

### See also

[Power Apps Test Engine overview (preview)](overview.md)  
[Power Apps Test Engine Power Fx functions (preview)](powerfx.md)  

[!INCLUDE [footer-banner](../includes/footer-banner.md)]

