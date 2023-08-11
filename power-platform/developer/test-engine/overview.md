---
title: "Overview of Power Apps Test Engine (preview)"
description: "Power Apps Test Engine is a component within the Power Platform CLI used for automating standalone canvas apps in Power Apps"
author: jt000
ms.subservice: developer
ms.author: jasontre
ms.date: 08/02/2023
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
---

# Overview of Power Apps Test Engine (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

Power Apps Test Engine is a component within the Power Platform CLI used for testing standalone canvas apps in Power Apps. See ["What is Microsoft Power Platform CLI?"](/power-platform/developer/cli/introduction) for more information on installing Power Apps Test Engine within this component.

## Benefits

Power Apps Test Engine has the following benefits:

- Power Fx test authoring - Makers can author tests in YAML format using the familiar Power Fx language.
- DOM abstraction - Tests are authored using references to control names that are defined within Power Apps Studio. JavaScript is not needed for writing tests and don't need to be familiar with the browser DOM of the app's rendered output.
- Connector mocking - Test authors can optionally create mocks of network calls, typically used when Power Apps makes calls to connectors. Connector mocking allows the app to be tested without modification to the app itself while avoiding any unwanted side-effects of the external APIs.
- Screenshot and video recording support - Test Engine can take screenshots at any point during your test execution, and records videos of the test run. This can be helpful to diagnose failed tests and to understand what the actual experience of the failed test case was.

## Running Power Apps Test Engine

### Creating a Test Plan YAML

Creating a test plan yaml can be achieved in 2 ways, either by downloading from an existing Power Apps Test Studio test plan or creating a test plan YAML from scratch.

#### Option 1: Author your own test plan

Create a yaml file using the test plan schema explained in [Power Apps Test Engine Yaml Explained](yaml)

#### Option 2: Download recorded tests from Test Studio

If you have tests that you have recorded in [Test Studio](/power-apps/maker/canvas-apps/test-studio), you can download them from Test Studio to reuse in Test Engine.

- Make use of the **Download suite** button available in Test Studio to download the test plan. Choose the test suite to download if you have multiple test suites.

    ![Screenshot of Test Studio download test suite button](media/download-test-suite.png)

- Alternatively you can make use of the **Download** button available under each test suite.

    ![Screenshot of Test Studio download test suite individual button](media/download-test-suite-individual.png)

- Make sure you update the config file and user configurations if you're using a different tenant or environment for this app.

### Setting up your user

Test Engine doesn't support multi-factor authentication. Use an account that requires only a username and password to sign in for your tests.

Test credentials can't be stored in test plan files. Rather, they're stored in environment variables. The test plan file contains references to which environment variables are used for credentials. For example, the following snippet indicates that the `user1Email` and `user1Password` environment variables are used:

```yaml
environmentVariables:
  users:
    - personaName: User1
      emailKey: user1Email
      passwordKey: user1Password
```

View the [Users](yaml#users) for more information.

Store the username and password for the user in your environment variables which can be done in powershell using the below script.

```powershell
$env:user1Email = "someone@example.com"
$env:user1Password = "fake password"
```

### Running `pac tests run`

To run your test plan, execute the Power Apps Test Engine by running `pac tests run` providing at a minimum your test plan file path, environment id, and tenant.

### Viewing the results

Once the tests have completed, you will be able to view the results of your test in the .trx file located in the output directory. Additionally, this folder will contain any screenshots taken by your tests as well as the video if `recordVideo` is set to `true` in the test plan yaml.

## Limitations

The following are known limitations when working with Power Apps Test Engine.

- Multi-factor authentication isn't supported. Use an account that requires only a username and password to run your tests.
- Some controls are currently unsupported in Power Apps Test Engine. See [Power Apps Test Engine (preview) Control Support Matrix](controlsupport) for a full list.
- Browser locale will follow your browser's default settings

### Supported Browsers

Test engine currently supports the following browsers.

- Chromium
- Firefox
- WebKit

## Additional Considerations

### Languages and regions that use period as the decimal separator

The syntax of Power Fx can differ based on your system's language settings. Use the `locale` property in the `testSettings` section of the test plan file to specify the locale in which your Power Fx is written. (See `locale` in [testSettings](yaml.md#testsettings)). This is useful if you're working across regions that use different decimal or thousands separators. For example, `,` instead of `.` for decimals and `;` instead of `,`.

See the following samples that have the `locale` property specified as examples of its usage:

1. `;` instead of `,` for separator - [testPlanForRegionUsePeriodAsDecimalSeparator.fx.yaml](https://github.com/microsoft/PowerApps-TestEngine/blob/main/samples/basicgallery/testPlanForRegionUseSemicolonAsSeparator.fx.yaml)
2. `,` instead of `.` for separator - [testPlanWithCommaForDecimal.fx.yaml.fx.yaml](https://github.com/microsoft/PowerApps-TestEngine/blob/main/samples/calculator/testPlanWithCommaForDecimal.fx.yaml)

### How apps are referenced in test plan files

The way that the test plan files refer to the target app differs depending on whether or not the app is in a solution or not. We recommend using solutions whenever possible because they provide greater portability.

- **Working with apps within Solutions** - Test plan files for apps that are part of [solutions](/power-apps/maker/data-platform/solutions-overview) are portable across environments. For solution-based apps, the test plan refers to the target app with a logical name (the app LogicalName property) which doesn't change if the app moves to a different environment.

  1. Locate the App Logical name for the app
     1. In the **Solutions** tab, open the solution that contains the app
     1. Select **Apps**
     1. Note the **Name** column. It's the app logical name (Not the **Display name**)
  2. Update your test plan file
     1. Open the test plan YAML file for the app
     1. Fill in the **appLogicalName** value with the new App logical name

- **Working with apps outside of Solutions** - If you move an app that is _not_ part of a solution to a new environment, you'll need to manually update the test plan file to refer to the app. How to update a test plan file for a non-solution based app:

  1. Locate the App ID for the app in its new location
     1. In the **Apps** list, locate the app and open the context menu
     1. Select **Details**
     1. Note the **App ID** GUID on the Details pane
  1. Update your test plan file
     1. Open the test plan YAML file for the app
     1. Fill in the **appId** with the new App ID


