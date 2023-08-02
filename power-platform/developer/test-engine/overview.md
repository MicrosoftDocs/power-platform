---
title: "Power Apps Test Engine (preview)"
description: "Power Apps Test Engine is an open source project with the aim of providing makers with a single automated testing platform for all Power Apps apps. "
author: jt000
ms.subservice: developer
ms.author: jasontre
ms.date: 08/02/2023
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
---

# Power Apps Test Engine (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

Power Apps Test Engine is an open source project with the aim of providing makers with a single automated testing platform for all Power Apps apps. The project is on GitHub at [github.com/microsoft/PowerApps-TestEngine](https://github.com/microsoft/PowerApps-TestEngine)

Test Engine has the following benefits:

- Power Fx test authoring - Makers can author tests in YAML format using the familiar Power Fx language.
- DOM abstraction - Tests are authored using references to control names that are defined at design-time. Test authors do not need to write JavaScript, and do not need to be familiar with the browser DOM of the app's rendered output.
- Connector mocking - Test authors can optionally create mocks of network calls, typically used when Power Apps make calls to connectors. This allows the app to be tested without modification to the app itself while avoiding any unwanted side-effects of the external APIs.
- Screenshot and video recording support - Test Engine can take screenshots at any point during your test execution, and records videos of the test run. This can be very helpful to diagnose failed tests and to understand what the actual experience of the failed test case was.

Build this project using the instructions below. This will create a local executable that can be used to run tests from your machine.

Test Engine uses [Playwright](https://playwright.dev) to orchestrate the tests.

Test Engine currently supports Power Apps canvas apps.

## Supported Browsers

- Chromium
- Firefox
- WebKit
- For more details check the link https://playwright.dev/dotnet/docs/browsers

## Getting Started

To get started, you will need to clone the Test Engine code from GitHub, locally build the project, and install the browser(s) you wish to use to execute the tests. Once you have the Test Engine executable built, the repo contains a library of sample test plans and apps you can use to exercise the tool.

### Prerequisites for building Test Engine

1. Install [.NET Core 6.0.x SDK](https://dotnet.microsoft.com/download/dotnet/6.0)
1. Ensure that your `MSBuildSDKsPath` environment variable is pointing to [.NET Core 6.0.x SDK](https://dotnet.microsoft.com/download/dotnet/6.0).
1. Make sure [PowerShell](https://docs.microsoft.com/powershell/scripting/install/installing-powershell?view=powershell-7.2) is installed.

### Build locally

Run the commands below in PowerShell. These commands will clone the repo to your desktop, will build the executable, and will install browser prerequisites needed for the tests to execute.

```bash
# Clone GitHub repo
git clone https://github.com/microsoft/PowerApps-TestEngine.git

# Change to the PowerAppsTestEngine folder
cd PowerApps-TestEngine\src\PowerAppsTestEngine

# Build
dotnet build

# Install browsers required by Playwright - replace <net-version> with actual output folder name, eg. net6.0.
.\bin\Debug\<net-version>\playwright.ps1 install
```

If you face trouble running dotnet build try [Clean locally](#clean-locally) first.

### Clean locally

Run the command below in PowerShell to clean untracked files. Please make sure to run this in the root folder.

```bash
# Clean
.\clean.cmd
```

Once done, continue following [Build locally](#build-locally)

### Using the provided samples

Test Engine includes a library of samples you can use to get started. Each sample consists of solution that you can directly import into your Power Apps environment, and a test plan file that corresponds to the Power Apps canvas app that is in the solution.

To use the samples, import the solution into your environment and then execute the corresponding test plan file with Test Engine.

See [Test Engine Samples](samples.md) for more sample solutions.

#### 1. Import a sample solution

Choose one of the packaged solutions within the Samples folder (e.g., `PowerApps-TestEngine\samples\basicgallery\BasicGallery_1_0_0_2.zip`). You can import solutions [using the Dataverse portal](/power-apps/maker/data-platform/import-update-export-solutions), or by using the [PAC CLI command line tool](/power-platform/developer/cli/reference/solution#pac-solution-import). Remember the environment that you imported the solution to.

#### 2. Set up the config file

You can use a config file to specify values needed to run the tests, or you can provide these same values on the command line when executing the app. This example shows using the config file.

Create a `config.dev.json` file inside the `PowerAppsTestEngine` folder.

Here is an example of its contents (a file `config.json` is provided in the repo as an example):

```
{
  "environmentId": "",
  "tenantId": "",
  "testPlanFile": "",
  "outputDirectory": ""
}
```

Fill in the required properties:


|Property|Description|
|---------|---------|
|environmentId|The ID of the Environment into which you imported the solution|
|tenantId|The ID of your tenant|
|testPlanFile|Path to the test plan YAML file that you wish to run. For example: `../../samples/basicgallery/testPlan.fx.yaml`|
|outputDirectory|Path to folder where test output/results will be placed.|

> [!NOTE]
> Both `environmentId` and `tenantId` can be found in the session details. More information: [Get session and app ID details](/power-apps/maker/canvas-apps/get-sessionid).

See [PowerAppsTestEngine.exe Inputs](command-input.md) more information about the config and the inputs to the command.

### Set up user authentication

This refers to the account that Test Engine will use to execute the test.

Test Engine does not support multi-factor authentication. Use an account that requires only a username and password to sign in for your tests.

Test credentials cannot be stored in test plan files. Rather, they are stored in PowerShell environment variables. The test plan file contains references to which environment variables are used for credentials. For example, the following snippet indicates that the `user1Email` and `user1Password` environment variables will be used:

```yaml
environmentVariables:
  users:
    - personaName: User1
      emailKey: user1Email
      passwordKey: user1Password
```

Please view the [Users](yaml.md#users) for more information.

### Run test

Once the `config.dev.json` and credentials are configured, you are ready to run the test. Use the following command:

```bash
# Run test
dotnet run
```

When the run is complete, check the folder specified in the `outputDirectory` configuration setting for test run results.

Check [Test Engine Samples](samples.md) for more sample solutions.

#### Languages and regions that use period as the decimal separator

The syntax of Power Fx can differ based on your system's language settings. Use the `locale` property in the `testSettings` section of the test plan file to specify the locale in which your Power Fx is written. (See `locale` in [testSettings](yaml.md#testsettings)). This is useful if you are working across regions that use different decimal or thousands separators. For example, `,` instead of `.` for decimals and `;` instead of `,`.

See the following samples that have the `locale` property specified as examples of its usage:

1. `;` instead of `,` for separator - [testPlanForRegionUsePeriodAsDecimalSeparator.fx.yaml](https://github.com/microsoft/PowerApps-TestEngine/blob/main/samples/basicgallery/testPlanForRegionUseSemicolonAsSeparator.fx.yaml)
2. `,` instead of `.` for separator - [testPlanWithCommaForDecimal.fx.yaml.fx.yaml](https://github.com/microsoft/PowerApps-TestEngine/blob/main/samples/calculator/testPlanWithCommaForDecimal.fx.yaml)

> [!NOTE]
> Since the integration tests that use these samples run in an `en-US` locale, the `testPlanWithCommaForDecimal` sample represents absolute numbers with decimals as `,` but their string representations of the decimals are still `.` to match the locale these tests are running in. Additionally, this is also because the corresponding sample app is also hosted in an `en-US` locale. But for real-world applications make sure the syntax of the tests represent the locale for the app and environment as well.

## What to do next

**Option 1** - Author your own test plan: Modify the `testPlan.fx.yaml` of a provided sample to run tests created on your own. You can also modify the sample Power App apps and create new tests for your updated app. Check [Test Engine Power Fx functions](powerfx.md) for writing functions. The sample test plan is at [github.com/microsoft/PowerApps-TestEngine/blob/main/samples/template/TestPlanTemplate.fx.yaml](https://github.com/microsoft/PowerApps-TestEngine/blob/main/samples/template/TestPlanTemplate.fx.yaml).

**Option 2** - Download recorded tests from Test Studio: If you have tests that you have recorded in [Test Studio](power-apps/maker/canvas-apps/test-studio), you can download them from Test Studio to reuse in Test Engine.

- Make use of the **Download suite** button available in Test Studio to download the test plan. Choose the test suite to download if you have multiple test suites.

   :::image type="content" source="media/download-test-suite.png" alt-text="Screenshot of Test Studio download test suite button":::

- Alternatively you can make use of the **Download** button available under each test suite.

   :::image type="content" source="media/download-test-suite-individual.png" alt-text="Screenshot of Test Studio download test suite individual button":::

- Make sure you update the config file and user configurations if you are using a different tenant or environment for this app.
- Now you should be ready to run the test with `dotnet run`

## More about the test plan

[Test Engine Yaml format](yaml.md)

[Test Engine Power Fx functions](powerfx.md)

## How apps are referenced in test plan files

The way that the test plan files refer to the target app differs depending on whether or not the app is in a solution or not. We recommend using solutions whenever possible because they provide greater portability.

- **Working with apps within Solutions** - Test plan files for apps that are part of [solutions](/power-apps/maker/data-platform/solutions-overview) are portable across environments. For solution-based apps, the test plan refers to the target app with a logical name (the app LogicalName property) which does not change if the app moves to a different environment.

  1. Locate the App Logical name for the app
     1. In the **Solutions** tab, open the solution that contains the app
     1. Select **Apps**
     1. Note the **Name** column. It is the app logical name (Not the **Display name**)
  2. Update your test plan file
     1. Open the test plan YAML file for the app
     1. Fill in the **appLogicalName** value with the new App logical name

- **Working with apps outside of Solutions** - If you move an app that is _not_ part of a solution to a new environment, you will need to manually update the test plan file to refer to the app. How to update a test plan file for a non-solution based app:

  1. Locate the App ID for the app in its new location
     1. In the **Apps** list, locate the app and open the context menu
     1. Select **Details**
     1. Note the **App ID** GUID on the Details pane
  1. Update your test plan file
     1. Open the test plan YAML file for the app
     1. Fill in the **appId** with the new App ID

## Known limitations

The following are known limitations for working with test engine.

### Unsupported controls

While work to provide full control coverage is in progress, support for the following controls are currently unavailable:

- Charts
- Media
- Timer
- Mixed Reality
- Child controls within components

### Authentication

Multi-factor authentication is not supported. Use an account that requires only a username and password to run your tests.

## Frequently asked questions

### 1. The test execution failed. What should I do?

We suggest checking the logs and recording in the test result folder to see what caused the error. Common issues are listed below:

- Entering incorrect authentication information
- Requiring authorization to certain controls or features (you will need to manually open the app and grant the access before using test engine to run tests on the app)
- Having a bad network connection (which causes Test Engine to not load the app)

Occasionally, you might get a timeout error due to the app taking longer to load than the default 30 second timeout. Most of the time, re-running the program will solve this problem. If this error still happens, you will probably want to check the recording as mentioned. If your app takes a while to load, you can also modify the timeout limit in [testSettings](yaml.md#testsettings) to give it more time.

If these steps don't help, you can run

```bash
# Run test with trace logs
dotnet run -l trace
```

and ask for support by adhering to [the support guidance on the GitHub project](https://github.com/microsoft/PowerApps-TestEngine/blob/main/SUPPORT.md).

### 2. What is the difference between the settings passed in via command line/config.json vs settings located inside the YAML?

The settings passed in via command line or config.dev.json are settings that either start off the test (link to the test plan) or they are settings that are likely to change due to the environment the app being test in is located.

Settings located in the YAML should be able to be "imported" with the solution, so another person could take the solution and corresponding test plan and use the two of them without any modifications.

Example: environmentId changes if the app is imported to a another tenant/environment, and so it is located as a command line or config.json setting.

## How to report issues

You are invited to contribute corrections to both code and documentation. See the below section entitled "Contributing to Test Engine code and documentation" for further info. You may also [file GitHub issues for Test Engine](https://github.com/microsoft/PowerApps-TestEngine/issues) to make Microsoft and the community aware of issues.

## Contributing to Test Engine code and documentation

This project welcomes contributions and suggestions to both code and documentation. Most contributions require you to agree to a Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

> **Note:** We are not accepting contributions for content within the [JS folder](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/Microsoft.PowerApps.TestEngine/JS).

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

