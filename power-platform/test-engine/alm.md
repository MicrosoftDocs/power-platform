---
title: ALM in Power Platform with Test Engine (preview)
description: Learn how to integrate automated testing into your Application Lifecycle Management (ALM) with Test Engine
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/15/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - pvillads
---

# ALM in Power Platform with Test Engine (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

Application Lifecycle Management (ALM) is a comprehensive approach to managing the lifecycle of applications from initial concept through development, testing, deployment, and ongoing maintenance. In the context of Power Platform, incorporating automated testing with Test Engine into your ALM process ensures that applications are thoroughly tested at each stage of development, resulting in higher quality releases.

## Understanding Test Automation in ALM

Test automation plays a critical role in the ALM process by:

- **Ensuring Quality** - Verifying that applications function as expected before deployment
- **Reducing Risk** - Catching issues early before they reach production environments
- **Enabling Continuous Integration** - Supporting automated build verification testing
- **Facilitating Controlled Deployments** - Adding quality gates to release pipelines

With Power Apps Test Engine, you can integrate automated testing into your existing Power Platform ALM workflows, regardless of which CI/CD tooling you use.

## Test Automation Lifecycle

The Test Engine supports a complete testing lifecycle that integrates with your ALM processes:

1. **Development** - Create and run tests locally during app development
2. **Build Validation** - Execute tests as part of automated build verification
3. **Release Gates** - Use test results as quality gates for controlled deployments
4. **Production Verification** - Validate critical functionality in production environments

## Integration Options

Test Engine integrates seamlessly with various ALM tools and processes:

### Power Platform Pipelines

You can easily integrate Test Engine with Power Platform's built-in pipeline capabilities for a fully native experience:

- **Solution Pipelines** - Add automated testing to your [solution pipelines](../alm/pipelines.md) to ensure quality at each stage
- **Environment Strategy** - Test in [development and test environments](../alm/environment-strategy-alm.md) before promoting to production
- **Pipeline Templates** - Use [pipeline templates](../alm/pipeline-templates.md) to standardize testing across your organization

### Custom CI/CD Integration with Power Automate

For organizations with existing CI/CD tooling, Test Engine integrates with custom pipelines through Power Automate using the [Power Platform Custom Host](../alm/custom-host-pipelines.md) feature:

![Example Power Automate integration with CI/CD pipelines](./media/gated-approval-process.png)

With the Custom Host approach, you can:

- Define a [custom pipeline host](../alm/custom-host-pipelines.md#configure-a-custom-pipeline-host) that executes your automated tests
- Create Power Automate cloud flows that trigger automatically from deployment events
- Execute `pac test run` commands directly from cloud flows to run tests stored in source control
- Connect to your preferred CI/CD system (Azure DevOps, GitHub Actions, etc.)
- Implement approval workflows based on test results
- Update deployment status based on the test results

This integration enables you to maintain your existing CI/CD investments while adding Test Engine's capabilities to your ALM process. The Custom Host acts as a bridge between Power Platform's native ALM features and your external testing infrastructure.

## Common ALM Testing Patterns

Here are several effective patterns for incorporating Test Engine into your ALM processes:

### Quality Gate Pattern

Use automated tests as a quality gate that must be passed before a solution can progress to the next environment:

1. Deploy solution to a test environment
2. Execute Test Engine test suite automatically
3. Generate test report and approval notification
4. Approve or reject deployment based on test results

### Continuous Integration Pattern

Run tests on each build to catch issues early:

1. Developer commits code to repository
2. CI system builds the solution
3. Test Engine runs automated tests against the build
4. Build is marked as passed/failed based on test results

### Regression Testing Pattern

Run comprehensive test suites before major releases:

1. Prepare release candidate solution
2. Deploy to staging environment
3. Execute full regression test suite with Test Engine
4. Analyze results and identify any regressions
5. Fix issues before proceeding to production

## Getting Started with Test Automation in ALM

To get started with incorporating Test Engine into your ALM processes:

1. **Create your test plan** - Design [YAML test plans](./yaml.md) for your Power Platform solutions
2. **Run tests locally** - Verify tests work in your development environment
3. **Set up authentication** - Configure [appropriate authentication](./authentication.md) for your pipeline environments
4. **Integrate with your pipeline** - Connect Test Engine to your existing ALM pipeline
5. **Implement quality gates** - Use test results to control the promotion of solutions

> [!TIP]
> Start with critical user journeys and gradually expand your automated test coverage as you become more familiar with Test Engine.

## Technical Reference Guide

The following sections provide detailed technical implementation guidance for different environments and scenarios.

### Local Development Environment Setup

For local test development and execution, install these essential tools:

<details>
<summary>Click to expand local development setup details</summary>

You can use a local editor like [Visual Studio Code](https://code.visualstudio.com/) to edit the [YAML](./yaml.md) files to author the Test Engine tests. To run the tests locally, install these command line tools:

#### Azure CLI

The [Azure CLI](/cli/azure/install-azure-cli) is essential for obtaining access tokens to connect to Dataverse. Locally, you can use:

```powershell
az login --allow-no-subscriptions
```

#### Power Platform CLI

The [Microsoft Power Platform CLI](../developer/cli/introduction.md) is required to execute test suite files using the [pac test run](../developer/cli/reference/test.md#pac-test-run) command. Install it following the [Power Platform CLI Installation Instructions](../developer/cli/introduction.md#install-microsoft-power-platform-cli).

#### Source Code (Optional)

If you are using the source code version of Test Engine, you will also need:

- [.Net 8.0 SDK](/dotnet/core/install/) - If you plan to build Test Engine from source
- [Git](/devops/develop/git/install-and-set-up-git) - If you need to pull changes from [Power Apps Test Engine repository](https://github.com/microsoft/PowerApps-TestEngine)
</details>

### Power Platform Pipelines Integration

<details>
<summary>Click to expand Power Platform Pipelines integration details</summary>

You can trigger execution of automated tests when using a [Custom pipelines host](/power-platform/alm/custom-host-pipelines):

1. Create a Power Automate cloud flow that triggers based on pipeline events
2. Connect to your CI/CD system to run the tests
3. Process test results and update the pipeline status

The following diagram shows an example of this integration pattern:

![Example Power Automate cloud flow to trigger Azure DevOps connector action to trigger build](./media/gated-approval-process.png)

This flow uses:
- [Dataverse Triggers](../alm/extend-pipelines.md#triggers) to start a pipeline when conditions are met
- [Trigger conditions](../alm/extend-pipelines.md#trigger-conditions) to determine which deployment stage applies
- [Azure DevOps Connector](/connectors/visualstudioteamservices/) to start a build with [parameters](/connectors/visualstudioteamservices/#other-fields-parameter)
- [Approval actions](/connectors/approvals/) to manage the approval process
- [Dataverse Actions](/power-platform/alm/extend-pipelines#actions) to update the pipeline based on results

#### Example: Running Tests with a Custom Host

Here's how to use a Custom Host with Test Engine:

1. **Configure the Custom Host**:
   ```powershell
   pac pipeline create-host --name "TestAutomationHost"
   ```

2. **Create a Power Automate Cloud Flow** that triggers on pipeline events:
   - Trigger: When a deployment stage is ready
   - Filter: Based on environment or solution name
   - Action: Execute tests with `pac test run`

3. **Set up the flow to run tests**:
   ```
   HTTP with Azure AD
     Method: POST
     URI: https://your-agent-host/api/run-tests
     Body: {
       "tenant": "@{triggerOutputs()?['body/tenant']}",
       "environmentId": "@{triggerOutputs()?['body/targetEnvironmentId']}",
       "testPlanPath": "path/to/testplan.te.yaml"
     }
   ```

4. **Update deployment status** based on test results:
   ```
   Power Platform for Admins - Update deployment stage status
     Environment: @{triggerOutputs()?['body/targetEnvironmentId']}
     Deployment Id: @{triggerOutputs()?['body/deploymentId']}
     Stage Id: @{triggerOutputs()?['body/stageId']}
     Status: @{if(equals(outputs('Run_Tests')?['statusCode'], 200), 'Succeed', 'Failed')}
   ```

This approach gives you complete flexibility to run Test Engine tests as part of your Power Platform ALM process while maintaining control over test execution.
</details>

### Azure DevOps Implementation

<details>
<summary>Click to expand Azure DevOps implementation details</summary>

If you're implementing Test Engine within Azure DevOps pipelines, you can use these resources to build an effective implementation:

| Component | Resource | Purpose |
|-----------|----------|---------|
| Pipeline Creation | [Create Azure DevOps pipeline](/azure/devops/pipelines/create-first-pipeline) | Set up your CI/CD pipeline |
| Source Control | [Dataverse Git integration](/power-platform/alm/git-integration/connecting-to-git) | Connect to solution source code |
| Authentication | [Service principals & managed identities](/azure/devops/integrate/get-started/authentication/service-principal-managed-identity) | Secure connection to Dataverse |
| .NET Setup | [Use dotnet v2 task](/azure/devops/pipelines/tasks/reference/use-dotnet-v2) | Install .NET SDK if needed |
| Test Execution | [PowerShell v2 task](/azure/devops/pipelines/tasks/reference/powershell-v2) | Execute `pac test run` commands |
| Secret Management | [Variable groups](/azure/devops/pipelines/library/variable-groups) | Store secure test configuration values |
| Config Files | [Secure files](/azure/devops/pipelines/library/secure-files) | Store test configuration files |
| File Access | [Download secure file v1 task](/azure/devops/pipelines/tasks/reference/download-secure-file-v1) | Access configuration files during pipeline run |
| Results Publishing | [Publish test results v2 task](/azure/devops/pipelines/tasks/reference/publish-test-results-v2) | Publish test results (*.trx) to Azure DevOps |

#### Sample Pipeline YAML

```yaml
trigger:
- main

pool:
  vmImage: 'windows-latest'

steps:
- task: PowerShell@2
  displayName: 'Install Power Platform CLI'
  inputs:
    targetType: 'inline'
    script: |
      Install-Module -Name Microsoft.PowerApps.Administration.PowerShell -Force
      Install-Module -Name Microsoft.PowerApps.PowerShell -AllowClobber -Force
      
- task: DownloadSecureFile@1
  name: testPlanConfig
  displayName: 'Download Test Plan'
  inputs:
    secureFile: 'testplan.te.yaml'

- task: PowerShell@2
  displayName: 'Run Test Engine Tests'
  inputs:
    targetType: 'inline'
    script: |
      pac test run `
        --provider canvas `
        --test-plan-file "$(testPlanConfig.secureFilePath)" `
        --tenant "$(TenantId)" `
        --environment-id "$(EnvironmentId)" `
        --user-auth Dataverse `
        --auth Certenv `

- task: PublishTestResults@2
  displayName: 'Publish Test Results'
  inputs:
    testResultsFormat: 'VSTest'
    testResultsFiles: '**/*.trx'
    mergeTestResults: true
    testRunTitle: 'Power Platform Test Engine Results'
```
</details>

## Next Steps

- [Learn about Test Engine YAML syntax](./yaml.md)
- [Set up authentication for your tests](./authentication.md)
- [Explore supported test providers](./providers.md)
- [Understand Power Platform ALM](../alm/alm-overview.md)

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
