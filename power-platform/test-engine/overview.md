---
title: Power Apps Test Engine overview (preview)
description: Learn about how you can automate tests of standalone canvas apps using the Power Apps Test Engine within Power Platform CLI.
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/09/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - jt000
 - FrankDahl
 - grant-archibald-ms
---

# Power Apps Test Engine overview (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

Power Apps Test Engine is a component within the Power Platform CLI (PAC CLI) that can be used to test the following Power Platform components:

- [Canvas Apps](/power-apps/maker/canvas-apps/index)
- [Model Driven Application](/power-apps/maker/model-driven-apps/index)
- [Dataverse extensions](/power-apps/maker/data-platform/index)

You must [Install Microsoft Power Platform CLI](../developer/cli/introduction.md#install-microsoft-power-platform-cli) to use the Test Engine.

## Benefits

Power Apps Test Engine has the following benefits:

- **Authentication Abstraction**: Make use of different [authentication](authentication.md) methods to interact with different provider as User or Service Account or a Service Principal for Dataverse integration testing.
- **Power Fx test authoring**: Author tests in YAML format using the familiar Power Fx language.
- **Dataverse Integration**: The ability to optionally include Dataverse Power Fx support in your test.
- **DOM abstraction**: Use references to control names that are defined within Power Apps Studio when you author tests. You don't need to use JavaScript, or be familiar with the browser Document Object Model (DOM) rendered output of the app.
- **Extensibility Model**: Test Engine is built using [Managed Extensibility Framework](/dotnet/framework/mef/) to allow new [providers](./providers.md) and Power Fx actions to be added.
- **Connector mocking**: You can create mocks of network calls the app makes using connectors. You can test the app without modifying it and avoid unwanted side-effects of the external APIs.
- **Screenshot and video recording support**: You can use Test Engine to take screenshots and record videos of the test run. These images and recordings help diagnose failed tests and understand the actual experience of the failed test cases.

## Limitations

The following are known limitations when working with Power Apps Test Engine.

- Browser locale follows your browser's default settings
- Not all controls are fully represented in the Power Fx. In these cases where full support isn't yet available the [Preview.PlaywrightAction()](./powerfx.md#previewplaywrightaction) function could be considered to interact with these controls via the Document Object Model (DOM)  

### Supported Browsers

Test engine currently supports the following browsers.

- Chromium
- Firefox
- WebKit

## Additional considerations

The following are some additional things to consider for your test plans.

### Languages and regions that use period as the decimal separator

The syntax of Power Fx can differ based on your system's language settings. Use the `locale` property in the `testSettings` section of the test plan file to specify the locale in which your Power Fx is written. (See `locale` in [testSettings](yaml.md#testsettings)). This is useful if you're working across regions that use different decimal or thousands separators. For example, `,` instead of `.` for decimals and `;` instead of `,`.

See the following samples that have the `locale` property specified as examples of its usage:

1. `;` instead of `,` for separator - [testPlanForRegionUsePeriodAsDecimalSeparator.fx.yaml](https://github.com/microsoft/PowerApps-TestEngine/blob/main/samples/basicgallery/testPlanForRegionUseSemicolonAsSeparator.fx.yaml)
2. `,` instead of `.` for separator - [testPlanWithCommaForDecimal.fx.yaml.fx.yaml](https://github.com/microsoft/PowerApps-TestEngine/blob/main/samples/calculator/testPlanWithCommaForDecimal.fx.yaml)

### How apps are referenced in test plan files

The way that test plan files refer to the target app depends on whether or not the app is in a solution or not. We recommend using solutions whenever possible because they provide greater portability.

#### Working with apps within solutions

Test plan files for apps that are part of [Solutions overview](/power-apps/maker/data-platform/solutions-overview) are portable across environments. For solution-based apps, the test plan refers to the target app with a logical name (the app `LogicalName` property) which doesn't change if the app moves to a different environment.

1. Locate the Logical name for the app
   1. In the **Solutions** tab, open the solution that contains the app
   1. Select **Apps**
   1. Note the **Name** column. It's the app logical name (Not the **Display name**)
1. Update your test plan file
   1. Open the test plan YAML file for the app
   1. Fill in the **appLogicalName** value with the new App logical name

#### Working with apps outside of solutions

If you move an app that isn't_ part of a solution to a new environment, you'll need to manually update the test plan file to refer to the app. How to update a test plan file for a non-solution based app:

1. Locate the App ID for the app in its new location
   1. In the **Apps** list, locate the app and open the context menu
   1. Select **Details**
   1. Note the **App ID** GUID on the Details pane
1. Update your test plan file
   1. Open the test plan YAML file for the app
   1. Fill in the **appId** with the new App ID

### See also

[Power Apps Test Engine release notes](https://github.com/microsoft/PowerApps-TestEngine/releases)  
[Power Apps Test Engine YAML format (preview)](yaml.md)  
[Power Apps Test Engine Power Fx functions (preview)](powerfx.md)

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
