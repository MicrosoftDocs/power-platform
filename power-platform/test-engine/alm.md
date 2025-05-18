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

## Getting Started with Test Automation in ALM

To get started with incorporating Test Engine into your ALM processes:

1. **Create your test plan** - Design [YAML test plans](./yaml.md) for your Power Platform solutions
2. **Run tests locally** - Verify tests work in your development environment
3. **Set up authentication** - Configure [appropriate authentication](./authentication.md) for your local execute and pipeline environments
4. **Integrate with your pipeline** - Connect Test Engine to your existing ALM pipeline
5. **Implement quality gates** - Use test results to control the promotion of solutions

> [!TIP]
> Start with critical user journeys and gradually expand your automated test coverage as you become more familiar with Test Engine.

## Source Code Version of Test Engine (Optional)

If you're using the source code version of Test Engine, you'll also need:

- [.NET 8.0 SDK](/dotnet/core/install/) - If you plan to build Test Engine from source
- [Git](/devops/develop/git/install-and-set-up-git) - To pull changes from [Power Apps Test Engine repository](https://github.com/microsoft/PowerApps-TestEngine)
- Complete the source code [Setup Steps](https://github.com/microsoft/PowerApps-TestEngine/blob/main/README.md) to run tests using the local compiled version of Test Engine

</details>

## Integration Options

Test Engine integrates seamlessly with various ALM tools and processes

## [Local Execution](#tab/local)

You can use a local editor like [Visual Studio Code](https://code.visualstudio.com/) to edit the [YAML](./yaml.md) files to author the Test Engine tests. To run the tests locally:

1. Ensure you have [Microsoft Power Platform CLI](../developer/cli/introduction.md) installed

1. If you're using [source control integration](../alm/git-integration/source-control-operations.md) clone your project to your local machine

1. Use the [pac test run](../developer/cli/reference/test.md#pac-test-run) to execute your test

1. Review the pass / fail results of the test

## Azure CLI

The [Azure CLI](/cli/azure/install-azure-cli) is essential for obtaining access tokens to connect to Dataverse. Locally, you can use:

```powershell
az login --allow-no-subscriptions
```

## [Power Platform Pipelines](#tab/pipelines)

You can easily integrate Test Engine with Power Platform's built-in pipelines for a native integrated experience:

- **Solution Pipelines** - Add automated testing to your [solution pipelines](../alm/pipelines.md) to ensure quality at each stage
- **Environment Strategy** - Test in [development and test environments](../alm/environment-strategy-alm.md) before promoting to production
- **Pipeline Templates** - Use [pipeline templates](../guidance/alm-accelerator/customize-deployment-pipelines.md) to standardize testing across your organization

You can trigger execution of automated tests when using a [Custom pipelines host](/power-platform/alm/custom-host-pipelines):

1. Create a Power Automate cloud flow that triggers based on pipeline events

1. Connect to your CI/CD system to run the tests

1. Process test results and update the pipeline status

The following diagram shows an example of this integration pattern:

![Example Power Automate cloud flow to trigger Azure DevOps connector action to trigger build](./media/gated-approval-process.png)

This flow uses:
- [Dataverse Triggers](../alm/extend-pipelines.md#triggers) to start a pipeline when conditions are met
- [Trigger conditions](../alm/extend-pipelines.md#trigger-conditions) to determine which deployment stage applies
- [Azure DevOps Connector](/connectors/visualstudioteamservices/) to start a build with [parameters](/connectors/visualstudioteamservices/#other-fields-parameter)
- [Approval actions](/connectors/approvals/) to manage the approval process
- [Dataverse Actions](/power-platform/alm/extend-pipelines#actions) to update the pipeline based on results

### Custom CI/CD Integration with Power Automate

For organizations with existing CI/CD tooling, Test Engine integrates with custom pipelines through Power Automate using the [Power Platform Custom Host](../alm/custom-host-pipelines.md) feature. With the Custom Host approach, you can:

- Define a [custom pipeline host](../alm/custom-host-pipelines.md) that executes your automated tests
- Create Power Automate cloud flows that trigger automatically from deployment events
- Execute `pac test run` commands directly from cloud flows to run tests stored in source control
- Connect to your preferred CI/CD system (Azure DevOps, GitHub Actions, etc.)
- Implement approval workflows based on test results
- Update deployment status based on the test results

This integration enables you to maintain your existing CI/CD investments while adding Test Engine's capabilities to your ALM process. The Custom Host acts as a bridge between Power Platform's native ALM features and your external testing infrastructure.

## [DevOps Pipeline](#tab/devops)

You can extend your Power Platform Pipeline using [custom host](../alm/custom-host-pipelines.md) or directly integrate the [pac test run](../developer/cli/reference/test.md#pac-test-run) command into to execute your build scripts.

### Example Script

#### Azure DevOps Pipeline

Here's an example of an Azure DevOps pipeline YAML file that demonstrates how to set up and run Power Apps Test Engine tests:

```yaml
trigger:
- main

pool:
  vmImage: 'windows-latest'

variables:
  - group: PowerPlatformTestVariables # Create a variable group with these variables
  # Required variables in the variable group:
  # ClientId - Service Principal App ID
  # ClientSecret - Service Principal Secret (mark as secret)
  # TenantId - Microsoft Entra Tenant ID
  # EnvironmentUrl - Power Platform Environment URL
  # EnvironmentId - Power Platform Environment ID

steps:
# Download the test plan file from secure files
- task: DownloadSecureFile@1
  name: testPlan
  displayName: 'Download Test Plan File'
  inputs:
    secureFile: 'testplan.te.yaml' # Upload your test plan to Secure Files in Azure DevOps

# Install Power Platform CLI
- task: PowerShell@2
  displayName: 'Install Power Platform CLI'
  inputs:
    targetType: 'inline'
    script: |
      Write-Host "Installing Power Platform CLI..."
      $pacUrl = "https://aka.ms/PowerAppsCLI"
      $pacZip = "$env:TEMP\pac.zip"
      $pacDestination = "$env:TEMP\pac"
      
      # Create the destination folder if it doesn't exist
      if (-not (Test-Path $pacDestination)) {
          New-Item -ItemType Directory -Path $pacDestination -Force | Out-Null
      }
      
      # Download PAC CLI
      Invoke-WebRequest -Uri $pacUrl -OutFile $pacZip
      
      # Extract PAC CLI
      Expand-Archive -Path $pacZip -DestinationPath $pacDestination -Force
      
      # Add PAC CLI to PATH
      $env:PATH = "$pacDestination;$env:PATH"
      
      # Verify installation
      pac help

# Install Azure CLI and authenticate with service principal
- task: PowerShell@2
  displayName: 'Install Azure CLI and Authenticate'
  inputs:
    targetType: 'inline'
    script: |
      Write-Host "Installing Azure CLI..."
      $azureCliUrl = "https://aka.ms/installazurecliwindows"
      $azureCliInstaller = "$env:TEMP\AzureCLI.msi"
      
      # Download Azure CLI installer
      Invoke-WebRequest -Uri $azureCliUrl -OutFile $azureCliInstaller
      
      # Install Azure CLI silently
      Start-Process -FilePath msiexec.exe -Args "/i $azureCliInstaller /quiet /norestart" -Wait
      
      # Reload PATH to include Azure CLI
      $env:PATH = [System.Environment]::GetEnvironmentVariable("PATH", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("PATH", "User")
      
      # Authenticate with service principal
      Write-Host "Authenticating with Azure CLI..."
      az login --service-principal -u "$(ClientId)" -p "$(ClientSecret)" --tenant "$(TenantId)" --allow-no-subscriptions

# Authenticate PAC CLI with service principal
- task: PowerShell@2
  displayName: 'Authenticate PAC CLI'
  inputs:
    targetType: 'inline'
    script: |
      Write-Host "Authenticating PAC CLI..."
      
      # Create authentication profile
      pac auth create --name TestEngineAuth --url "$(EnvironmentUrl)" --applicationId "$(ClientId)" --clientSecret "$(ClientSecret)" --tenant "$(TenantId)"
      
      # Select the authentication profile
      pac auth select --name TestEngineAuth

# Run the tests
- task: PowerShell@2
  displayName: 'Execute Test Engine Tests'
  inputs:
    targetType: 'inline'
    script: |
      Write-Host "Running Test Engine tests..."
      
      # Create output directory
      $outputDir = "$(Build.ArtifactStagingDirectory)\TestResults"
      New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
      
      # Run the tests
      pac test run `
        --test-plan-file "$(testPlan.secureFilePath)" `
        --environment-id "$(EnvironmentId)" `
        --tenant "$(TenantId)" `
        --logConsole info `
        --trx `
        --outputDirectory $outputDir
      
      if ($LASTEXITCODE -ne 0) {
          Write-Error "Test execution failed with exit code $LASTEXITCODE"
          exit $LASTEXITCODE
      }

# Publish test results
- task: PublishTestResults@2
  displayName: 'Publish Test Results'
  inputs:
    testResultsFormat: 'VSTest'
    testResultsFiles: '$(Build.ArtifactStagingDirectory)\TestResults\*.trx'
    mergeTestResults: true
    testRunTitle: 'Power Apps Test Engine Results'
  condition: always() # Ensure results are published even if tests fail

# Publish test artifacts
- task: PublishBuildArtifacts@1
  displayName: 'Publish Test Artifacts'
  inputs:
    PathtoPublish: '$(Build.ArtifactStagingDirectory)\TestResults'
    ArtifactName: 'TestArtifacts'
    publishLocation: 'Container'
  condition: always()
```

## [GitHub Runner](#tab/github)

Here's an example of a GitHub Actions workflow that performs the same test execution process:

```yaml
name: Test Engine Execution

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]
  workflow_dispatch:  # Allow manual triggering

jobs:
  test:
    runs-on: windows-latest
    
    env:
      TENANT_ID: ${{ secrets.TENANT_ID }}
      CLIENT_ID: ${{ secrets.CLIENT_ID }}
      CLIENT_SECRET: ${{ secrets.CLIENT_SECRET }}
      ENVIRONMENT_URL: ${{ secrets.ENVIRONMENT_URL }}
      ENVIRONMENT_ID: ${{ secrets.ENVIRONMENT_ID }}
    
    steps:
    - name: Checkout repository
      uses: actions/checkout@v3
      
    - name: Install Power Platform CLI
      run: |
        Write-Host "Installing Power Platform CLI..."
        $pacUrl = "https://aka.ms/PowerAppsCLI"
        $pacZip = "$env:TEMP\pac.zip"
        $pacDestination = "$env:TEMP\pac"
        
        # Create the destination folder if it doesn't exist
        if (-not (Test-Path $pacDestination)) {
            New-Item -ItemType Directory -Path $pacDestination -Force | Out-Null
        }
        
        # Download PAC CLI
        Invoke-WebRequest -Uri $pacUrl -OutFile $pacZip
        
        # Extract PAC CLI
        Expand-Archive -Path $pacZip -DestinationPath $pacDestination -Force
        
        # Add PAC CLI to PATH
        $env:PATH = "$pacDestination;$env:PATH"
        echo "$pacDestination" >> $env:GITHUB_PATH
        
        # Verify installation
        pac help

    - name: Install Azure CLI
      run: |
        Write-Host "Installing Azure CLI..."
        $ProgressPreference = 'SilentlyContinue'
        Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi
        Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'
        rm .\AzureCLI.msi
        
    - name: Azure CLI Authentication
      run: |
        Write-Host "Authenticating with Azure CLI..."
        az login --service-principal -u "$env:CLIENT_ID" -p "$env:CLIENT_SECRET" --tenant "$env:TENANT_ID" --allow-no-subscriptions
        
    - name: PAC CLI Authentication
      run: |
        Write-Host "Authenticating PAC CLI..."
        # Create authentication profile
        pac auth create --name TestEngineAuth --url "$env:ENVIRONMENT_URL" --applicationId "$env:CLIENT_ID" --clientSecret "$env:CLIENT_SECRET" --tenant "$env:TENANT_ID"
        
        # Select the authentication profile
        pac auth select --name TestEngineAuth
      
    - name: Run Test Engine tests
      run: |
        Write-Host "Running Test Engine tests..."
        
        # Create output directory
        $outputDir = "./TestResults"
        New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
        
        # Run the tests
        pac test run `
          --test-plan-file "./TestPlan/testplan.te.yaml" `
          --environment-id "$env:ENVIRONMENT_ID" `
          --tenant "$env:TENANT_ID" `
          --logConsole info `
          --trx `
          --outputDirectory $outputDir
        
        if ($LASTEXITCODE -ne 0) {
            Write-Error "Test execution failed with exit code $LASTEXITCODE"
            exit $LASTEXITCODE
        }
    
    - name: Upload test results
      uses: actions/upload-artifact@v3
      if: always()
      with:
        name: test-results
        path: ./TestResults
        
    - name: Publish Test Results
      uses: EnricoMi/publish-unit-test-result-action@v2
      if: always()
      with:
        files: ./TestResults/**/*.trx
```

### Reference Components

The following reference components may be useful as you build your automation test pipeline.

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

---

### Related articles

[Learn about Test Engine YAML syntax](./yaml.md)  
[Set up authentication for your tests](./authentication.md)  
[Test canvas applications](./canvas-application.md), [model-driven applications](./model-driven-application.md), or [Dataverse extensions](./dataverse.md)  
[Understand Power Platform ALM](../alm/overview-alm.md)  

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
