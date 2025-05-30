---
title: "Test Dataverse extensions with Test Engine (preview)"
description: "Describes how to perform integration testing of Dataverse extensions with Test Engine."
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/27/2025
ms.reviewer: jdaly
ms.topic: article
---

# Test Dataverse extensions with Test Engine (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

This article explains how to create integration tests with Dataverse. This functionality applies the Power Fx capability to connect with Dataverse tables.



## Connecting to Dataverse

To enable Dataverse integration, add the `enableDataverseFunctions` parameter in your [testSettings](yaml.md#testsettings) [extensionModules](yaml.md#extensionmodules) :

```yaml
testSettings:
  extensionModules:
    enable: true
    parameters:
      enableDataverseFunctions: true
```

When you enable Dataverse integration, you're required to open Azure CLI with a user or service principal that has rights to the Dataverse environment. You can use the command: [az login](/cli/azure/reference-index#az-login) More information: [Sign in with Azure CLI](/cli/azure/authenticate-azure-cli).

The Dataverse API URL used for integration is obtained either from the host domain name of the [pac test run](../developer/cli/reference/test.md#pac-test-run) `--domain` parameter or by defining an [PowerShell environment variable](/powershell/module/microsoft.powershell.core/about/about_environment_variables) named `DATAVERSE_URL`.

## Enable preview

Currently, all Dataverse extension testing capabilities require using [Preview functions](powerfx-functions.md#preview-functions). To enable these, add `Preview` to the `allowPowerFxNamespaces` list in [extensionModules](yaml.md#extensionmodules).

```yaml
testSettings:
  extensionModules:
    enable: true
    allowPowerFxNamespaces:
    - Preview
    parameters:
      enableDataverseFunctions: true
```

## Resetting the current state

Define the `onTestCaseStart` event handler in your authored test yaml to perform common actions before each test case. For example:

```yaml
testSuite:
  testSuiteName: Dataverse tests
  testSuiteDescription: Validate Power Fx can be used to run Dataverse integration tests
  persona: User1
  appLogicalName: N/A
  onTestCaseStart: |
    = ForAll(Accounts, Remove(Accounts, ThisRecord))
```

In this example, the `ForAll` is used to iterate over a table and perform an action on each record. The `Remove` function is then used to delete each record from a table to ensure an empty table before each test is executed.

## Functions of interest

These functions are useful when working with Dataverse:

- [Collect](../power-fx/reference/function-clear-collect-clearcollect.md#collect): Adds records to a table.
- [CountRows](../power-fx/reference/function-table-counts.md): Returns the number of records in a table.
- [First](../power-fx/reference/function-first-last.md): Returns the first record in a table.
- [ForAll](../power-fx/reference/function-forall.md): Iterates over a table and performs an action on each record.
- [Patch](../power-fx/reference/function-patch.md): Update an existing record.
- [Remove](../power-fx/reference/function-remove-removeif.md): Deletes a specific record from a table.

## Considerations

Take these considerations into account as you write test steps:

- [Defaults](../power-fx/reference/function-defaults.md) isn't supported. As a result Power Fx examples like `Patch(Accounts, Defaults(Accounts), {name:"test"})` aren't supported.
- You can use `Collect` to an alternative to `Patch` with the `Defaults` function

## Running Dataverse tests

You can use the Power Fx provider (`powerfx`) to run tests that interact with Dataverse without the need for a canvas or model-driven app interface. This is useful for testing business logic, plugins, flows, and other backend services.

```powershell
pac test run `
   --provider powerfx `
   --test-plan-file your-testplan.te.yaml `
   --tenant your-tenantid-guid-value `
   --environment-id your-environmentid-guid-value `
   --domain "https://contoso.crm.dynamics.com"
```

## AI Integration

Using the open source [Power Apps Test Engine](https://github.com/microsoft/PowerApps-TestEngine) compiled in `Debug` mode together with the appropriate test settings will enable the [Preview.AIExecutePrompt](powerfx-functions.md#previewaiexecuteprompt) function in your tests.

Add the following to your test settings to enable AI integration:

```yaml
testSettings:
  extensionModules:
    enable: true
    parameters:
      enableDataverseFunctions: true
      enableAIFunctions: true
```

Example usage of the AI function:

```powerappsfl
Assert("Paris" = Preview.AIExecutePrompt("Country Capital", { Country: "France" }).Text)
```

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
