---
title: "Test canvas applications with Test Engine (preview)"
description: "Learn how to test Power Apps Canvas applications using Test Engine"
author: pvillads
ms.author: pvillads
ms.subservice: test-engine
ms.date: 05/19/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - grant-archibald-ms
---

# Test canvas applications with Test Engine (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

Testing canvas apps with [Test Engine](./overview.md) requires the following steps:

1. [Create a test plan](#create-a-test-plan)
1. [Set up your user](#set-up-your-user)
1. [Run the test](#run-the-test)
1. [View the results](#view-the-results)

## Create a test plan

Test plans are defined using [YAML](https://yaml.org/spec/1.2.2/) format. You can [author your own test plan](#author-your-own-test-plan) or [download recorded tests from Test Studio](#download-recorded-tests-from-test-studio).

### Author your own test plan

Create a yaml file using the test plan schema explained in [Power Apps Test Engine YAML format (preview)](yaml.md).

When choosing authoring your own test plan, you can take advantage of the following features:

- **Additional Power Fx Functions**: Use the [extra registered Power Fx actions](powerfx-functions.md) to interact with Power Apps component framework (PCF) components, enhancing the capabilities of your test plans.
- **Define Custom Data Structures and Functions**: Make use of User Defined Types (UDTs) and User Defined Functions (UDFs) to create reusable and maintainable test steps.

> [!TIP]
> Review [available sample](samples.md#available-samples) plans in the GitHub repository.

### Download recorded tests from Test Studio

Downloading recorded tests from Test Studio allows quick capture and replay of user interactions with your application. This method is useful for creating basic test cases without writing any code. However, it has limitations in terms of flexibility and the ability to handle complex scenarios.

If you have tests that you recorded in [Test Studio](/power-apps/maker/canvas-apps/test-studio), you can download them from Test Studio to reuse in Test Engine.

- Use the **Download suite** button in Test Studio to download the test plan. Choose the test suite to download if you have multiple test suites.

    ![Screenshot of Test Studio download test suite button](media/download-test-suite.png)

- Alternatively, use the **Download** button available under each test suite.

    ![Screenshot of Test Studio download test suite individual button](media/download-test-suite-individual.png)

- Make sure you update the config file and user configurations if you're using a different tenant or environment for this app.

## Set up your user

Test Engine currently has these authentication methods:

| Method | Description |
|--------|-------------|
| [Storage State](authentication.md#storagestate-authentication-quick-start) | Store authenticated user state locally in the user profile using Microsoft Windows [Data Protection API](/dotnet/standard/security/how-to-use-data-protection)
| [Dataverse](authentication.md#dataverse-authentication-team-ready) | Store authenticated user state inside Dataverse using your own customer managed key encrypted with an X.509 certificate using [ASP.NET Core Data Protection](/aspnet/core/security/data-protection/introduction)

You can't store test credentials in test plan files. You must select `Storagestate` or `Dataverse` as the secure location to store credentials. The test plan file contains references to which [environment variables](/power-apps/maker/data-platform/environmentvariables) are used for user persona. For example, the following YAML snippet indicates that the `user1Email` environment variables are used:

```yaml
environmentVariables:
  users:
    - personaName: User1
      emailKey: user1Email
```

View [Users](yaml.md#users) for more information.

Use the following PowerShell script to store the username in your environment variables.

```powershell
$env:user1Email = "someone@example.com"
```

> [!NOTE]
> The user password is no longer required in an environment variable. Review [authentication](./authentication.md) for supported options.

## Run the test

Use the PAC CLI [pac test run](../developer/cli/reference/tests.md#pac-test-run) command to run your test plan.

### Required parameters

You need to provide the following information:

- `--test-plan-file`: Path to your test plan file
- `--tenant`: Your tenant ID
- `--environment-id`: Your environment ID

### Example command

Here's an example of running a test for a canvas application:

```powershell
pac test run `
   --provider canvas `
   --test-plan-file your-testplan.te.yaml `
   --tenant your-tenantid-guid-value `
   --environment-id your-environmentid-guid-value
```

You can also use the shorter parameter aliases:

```powershell
pac test run `
   -p canvas `
   -test your-testplan.te.yaml `
   -t your-tenantid-guid-value `
   -env your-environmentid-guid-value
```
<!-- The following section is duplicated in two other articles -->
### Dataverse integration

To enable Dataverse integration with your canvas app tests, you can add the `enableDataverseFunctions` parameter in your test settings:

```yaml
testSettings:
  extensionModules:
    enable: true
    parameters:
      enableDataverseFunctions: true
```

When you enable Dataverse integration, you're required to open Azure CLI with a user or service principal that has rights to the Dataverse environment. You can use the [az login](/cli/azure/reference-index#az-login) command. More information: [Sign in with Azure CLI](/cli/azure/authenticate-azure-cli).

The Dataverse API URL used for integration is obtained either from the host domain name of the [pac test run](../developer/cli/reference/test.md#pac-test-run) `--domain` parameter or by defining an [PowerShell environment variable](/powershell/module/microsoft.powershell.core/about/about_environment_variables) named `DATAVERSE_URL`.

## View the results

When the tests complete, you can view the results of your test in the `.trx` file located in the output directory. This folder contains any screenshots or videos captured by your tests when `recordVideo` is set to `true` in the test plan yaml.

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
