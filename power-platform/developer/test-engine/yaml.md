---
title: "Test Engine Yaml format"
description: "Describes the Yaml format for test following the same guidelines as Power Fx does."
author: jt000
ms.subservice: developer
ms.author: jasontre
ms.date: 08/02/2023
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
---
# Test Engine Yaml format

Tests are defined in YAML following the same guidelines as Power Fx does. To find out more about the Power Fx YAML formula grammar, [Power Fx YAML formula grammar](../../power-fx/yaml-formula-grammar.md).

View the [PowerApps-TestEngine/samples](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples) folder for detailed examples.

## YAML schema definition

| Property | Description |
| -- | -- |
| [test](#test) | Defines one test suite, the test cases in the test suite and configuration specific to the test suite |
| [testSettings](#testsettings) | Defines settings for the test suite that are reused across multiple test cases |
| [Environment variables](#environment-variables)| Defines variables that could potentially change as the app is ported across different environments |

## test

This is used to define one test.

### test YAML schema definition

| Property | Required | Description |
| -- | -- | -- |
| `testSuiteName` | Yes | This is the name of the test suite |
| `testSuiteDescription` | No | Additional information describe what the test suite does |
| `persona` | Yes | This is the user that will be logged in to perform the test. This must match a persona listed in the [Users](./Users.md) section | 
| `appLogicalName` | Yes | This is the logical name of the app that is to be launched. It can be obtained from the solution. For canvas apps, you need to add it to a solution to obtain it |
| `appId` | No | This is the id of the app that is to be launched. This is required and used only when app logical name is not present. App id should be used only for canvas apps that are not in the solution
| `networkRequestMocks` | No | Defines network request mocks needed for the test |
| `testCases` | Yes | Defines test cases in the test suite. Test cases contained in test suites are run sequentially. The app state is persisted across all test cases in a suite |
| `onTestCaseStart` | No | Defines the steps that need to be triggered for every test case in a suite before the case begins executing |
| `onTestCaseComplete` | No | Defines the steps that need to be triggered for every test case in a suite after the case finishes executing |
| `onTestSuiteComplete` | No | Defines the steps that need to be triggered after the suite finishes executing |

#### test NetworkRequestMocks

| Property | Required | Description |
| -- | -- | -- |
| `requestURL` | Yes | This is the request URL that will get mock response. Glob patterns are accepted |
| `responseDataFile` | Yes | This is a text file with the mock response content. All text in this file will be read as the response |
| `Method` | No | This is the request's method (GET, POST, etc.) |
| `Headers` | No | This is a list of header fields in the request in the format of [fieldName : fieldValue] |
| `requestBodyFile` | No | This is a text file with the request body. All text in this file will be read as the request body |

For optional properties, if no value is specified, the routing applies to all. For example, if Method is null, we send back the mock response whatever the method is as long as the other properties all match.

For Sharepoint/Dataverse/Connector apps, requestURL and Method can be the same for all requests. `x-ms-request-method` and `x-ms-request-url` in  headers may need to be configured in that case to identify different requests.

#### test TestCases

| Property | Required | Description |
| -- | -- | -- |
| `testCaseName` | Yes | This is the name of the test case, it will be used in reporting success and failure |
| `testCaseDescription` | No | Additional information describe what the test case does |
| `testSteps` | Yes | A set of Power FX functions describing the steps needed to perform the test case |

#### test TestSteps

- This can use any existing [Test Engine Power Fx functions](../../power-fx/overview.md) functions or [specific test functions](powerfx.md) defined by this framework.
- It should start with a `|` to allow for multiline YAML expressions followed by an `=` sign to indicate that it is a Power Fx expression
- Functions should be separated by a `;`
- Comments can be used and should start with `//`

## testSettings

This is used to define settings for the tests in the test plan

### testSettings YAML schema definition

| Property | Required | Description |
| -- | -- | -- |
| `locale` | Yes | The locale/culture syntax in which the test cases or test steps are written in. See [Global Support in Microsoft Power Fx(../../power-fx/global.md) for more info. If unspecified, `CultureInfo.CurrentCulture` will be used for the locale by default for parsing the test steps. |
| `browserConfigurations` | Yes | A list of browser configurations to be tested. At least one browser must be specified. |
| `recordVideo` | No | Default is false. If set to true, a video recording of the test is captured. |
| `headless` | No | Default is true. If set to false, the browser will show up during test execution. |
| `enablePowerFxOverlay` | No | Default is false. If set to true, an overlay with the currently running Power FX command is placed on the screen. |
| `timeout` | No | Default is 30000 milliseconds(30s). Timeout value in milliseconds. If any operation takes longer than the timeout limit, it will end the test in a failure. |
| `filePath` | No |  The file path to a separate yaml file with all the test settings. If provided, it will **override** all the test settings in the test plan. |

#### testSettings Browser configuration

| Property | Required | Description |
| -- | -- | -- |
| `browser` | Yes | The browser to be launched when testing. This should match the [browsers supported by Playwright](https://playwright.dev/dotnet/docs/browsers). |
| `device` | No | The device to emulate when launching the browser. This should match the [devices supported by Playwright](https://playwright.dev/dotnet/docs/api/class-playwright#playwright-devices)
| `screenHeight` | No | The height of the screen to use when launching the browser. If specified, screenWidth must also be specified. |
| `screenWidth` | No | The width of the screen to use when launching the browser. If specified, screenHeight must also be specified.|

## Users

To ensure credentials are stored in secure manner, users are referenced by a persona name in the test definition. Storing credentials in test plan files is not supported.

References to the user credentials are located under the `environmentVariables` section as a list of `users`

Example:

```yaml
environmentVariables:
    - users:
        - personaName: "User1"
          emailKey: "user1Email"
          passwordKey: "user1Password"
        - personaName: "User2"
          emailKey: "user2Email"
          passwordKey: "user2Password"
```

The `personaName` will be used as part of the test definition to indicate what user to run the test as.

### Supported credentials storage mechanisms

> [!NOTE]
> Multi-factor authentication is not supported.

#### Environment variables

To store credentials as environment variables, you can set it as follows:

```powershell
# In PowerShell - replace variableName and variableValue with the correct values
$env:variableName = "variableValue"
```

In the YAML, two properties need to be defined to indicate that this user's credentials are stored in environment variables:

- `emailKey`: The environment variable used to store the user's email.
- `passwordKey`: The environment variable used to store the user's password.

Example YAML:

```yaml
    - personaName: "User1"
      emailKey: "user1Email"
      passwordKey: "user1Password"
```

Example powershell to set user credentials based on YAML:

```powershell
$env:user1Email = "someone@example.com"
$env:user1Password = "fake password"
```
