---
title: "Test Engine Providers"
description: "Describes the different providers of Test Engine and features the offer"
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/09/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - pvillads
---

# Test Engine Providers

[!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

Initially, the Test Engine was limited to supporting only canvas applications. However, with the introduction of the new provider model, the capabilities is expanded significantly.

## The First Version: Canvas Applications Only

When the Test Engine was first introduced, it was designed to support [canvas applications](./canvas-application.md) exclusively. Canvas applications are a type of app within the Power Platform that allows users to design and build apps by dragging and dropping elements onto a canvas, much like creating a slide in PowerPoint. This approach is highly intuitive and enables rapid development of custom applications.

## The New Provider Model

The version 2.0 provider model expanded the scope of the Test Engine. It now supports not only canvas applications but also [model-driven applications](./model-driven-application.md). Model-driven applications are data-centric apps that are built on top of the Dataverse, which is the underlying data platform for the Power Platform. These applications are typically used for business processes or common data administration tasks and offer a more structured approach compared to canvas apps.

### Current Providers

1. **Canvas Applications**: As before, the Test Engine continues to support and extend the range of test scenarios for canvas applications.
2. **Model-Driven Applications**: Test Engine can interact with model-driven applications, including:
   - **Entity Lists**: Lists of records from a specific entity in Dataverse.
   - **Entity Records**: Individual records within an entity.
   - **Custom Pages**: Custom-designed pages within model-driven apps.
3. **Power Fx**: Allows Power Fx steps to be run independent of a specific application. For example, you could use this provider be used to perform integration tests with Dataverse.
4. **Power Apps Portal**: Allows preview support for a limited number of automation tasks of `https://make.powerapps.com` to perform and verify common operations.

### Provider Dataverse Integration

To enable Dataverse integration, you can provide a value of `true` for enableDataverseFunctions in the testSettings. For example

```yaml
testSettings:
  extensionModules:
    enable: true
    parameters:
      enableDataverseFunctions: true
```

When you enable Dataverse integration, you're required to open Azure CLI with a user or service principal that has rights to the Dataverse environment. You can use the command: `az login`  More information: [Sign in with Azure CLI](/cli/azure/authenticate-azure-cli).

The WebApi used for Dataverse integration is obtained either from the host domain name of the [pac test run](../developer/cli/reference/test.md#pac-test-run) domain argument or by defining an environment variable named `DATAVERSE_URL`.

#### AI Integration

Using the open source [Power Apps Test Engine](https://github.com/microsoft/PowerApps-TestEngine) to compiled in `Debug` mode to together with the testSettings will optionally enable [Preview.AIEvaluatePrompt()](./powerfx.md#previewaiexecuteprompt) function in your tests.

```yaml
testSettings:
  extensionModules:
    enable: true
    parameters:
      enableDataverseFunctions: true
      enableAIFunctions: true
```

### Example Commands

To run tests for each provider, you can use the following [pac test run](../developer/cli/reference/test.md#pac-test-run) commands

#### Canvas Applications

```cmd
pac test run -p "canvas" -i "testplan.te.yaml" -t aaaabbbb-0000-cccc-1111-dddd2222eeee -e 00aa00aa-bb11-cc22-dd33-44ee44ee44ee
```

#### Model Driven Applications

```cmd
pac test run -p "mda" -i "testplan.te.yaml" -t aaaabbbb-0000-cccc-1111-dddd2222eeee -e 00aa00aa-bb11-cc22-dd33-44ee44ee44ee -d "https://contoso.crm.dynamics.com/main.aspx?appid=00001111-aaaa-2222-bbbb-3333cccc4444&pagetype=custom&name=dev_home_c8017"
```

#### Power Fx

```cmd
pac test run -p "powerfx" -i "testplan.te.yaml" -t aaaabbbb-0000-cccc-1111-dddd2222eeee -e 00aa00aa-bb11-cc22-dd33-44ee44ee44ee -d "https://contoso.crm.dynamics.com"
```

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
