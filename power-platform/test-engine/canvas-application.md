---
title: "Test Canvas Application with Test Engine (preview)"
description: "Learn about testing Power Apps Canvas applications using Test Engine"
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/09/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - pvillads
---

# Test Canvas Application with Test Engine (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

Testing your canvas app with [Test Engine](./overview.md) requires the following steps:

1. [Create a Test Plan](#create-a-test-plan)
1. [Set up your user](#set-up-your-user)
1. [Run the test](#run-the-test)
1. [View the results](#view-the-results)

### Create a Test Plan

Test plans are defined using [YAML](https://yaml.org/spec/1.2.2/) format. You can [author your own test plan](#author-your-own-test-plan) or [download recorded tests from Test Studio](#download-recorded-tests-from-test-studio).

Downloading recorded tests from Test Studio allows quick capture and replay of user interactions with your application. This method is useful for creating basic test cases without writing any code. However, it has limitations in terms of flexibility and the ability to handle complex scenarios.

When choosing authoring your own test plan, you can take advantage of the following features:
- **Additional Power Fx Functions**: Use the extra registered Power Fx actions to interact with Power Apps component framework (PCF) Controls and Galleries, enhancing the capabilities of your test plans.
- **Define Custom Data Structures and Functions**: Make use of User Defined Types (UDTs) and User Defined Functions (UDFs) to create reusable and maintainable test steps. 

#### Author your own test plan

Create a yaml file using the test plan schema explained in [Power Apps Test Engine YAML format (preview)](yaml.md).

#### Download recorded tests from Test Studio

If you have tests that you recorded in [Test Studio](/power-apps/maker/canvas-apps/test-studio), you can download them from Test Studio to reuse in Test Engine.

- Use the **Download suite** button in Test Studio to download the test plan. Choose the test suite to download if you have multiple test suites.

    ![Screenshot of Test Studio download test suite button](media/download-test-suite.png)

- Alternatively, use the **Download** button available under each test suite.

    ![Screenshot of Test Studio download test suite individual button](media/download-test-suite-individual.png)

- Make sure you update the config file and user configurations if you're using a different tenant or environment for this app.

### Set up your user

Test Engine currently has these authentication methods:

| Method | Description |
|--------|-------------|
| Storage State | Store authenticated user state locally in the user profile using Microsoft Windows [Data Protection API](/dotnet/standard/security/how-to-use-data-protection)
| Dataverse | Store authenticated user state inside dataverse using your own customer managed key encrypted with an X.509 certificate using [ASP.NET Core Data Protection](/aspnet/core/security/data-protection/introduction)

You can't store test credentials in test plan files you must select `storagestate` or `dataverse` as the secure location to store credentials. The test plan file contains references to which environment variables are used for user persona. For example, the following YAML snippet indicates that the `user1Email` environment variables are used:

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
> The user password is no longer required in an environment variable. Review [authenication](./authentication.md) for supported options.

### Run the test

Use the PAC CLI [pac test run](../developer/cli/reference/tests.md#pac-test-run) command to run your test plan.

- Path to your test plan file
- TenantId (For example aaaabbbb-0000-cccc-1111-dddd2222eeee)
- EnvironmentId (For example 00aa00aa-bb11-cc22-dd33-44ee44ee44ee)

For example this could be

```powershell
pac test run `
   -p "canvas" `
   -test "testplan.te.yaml" `
   -t aaaabbbb-0000-cccc-1111-dddd2222eeee `
   -env 00aa00aa-bb11-cc22-dd33-44ee44ee44ee
```

### View the results

When the tests complete, you can view the results of your test in the `.trx` file located in the output directory. This folder contains any screenshots or videos captured by your tests when `recordVideo` is set to `true` in the test plan yaml.
