---
title: "Tutorial: Schedule environment copy and automated data import using Azure DevOps"
description: This tutorial demonstrates how to schedule a production-to-sandbox environment copy using Azure DevOps pipelines with Power Platform Build Tools, and automatically import a finance and operations data package after the copy completes.
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 03/19/2026
ms.subservice: admin
ms.author: laswenka
search.audienceType:
  - admin
---

# Tutorial: Schedule environment copy and automated data import by using Azure DevOps

Keeping sandbox environments current with production data is a common operational need for finance and operations apps customers. By automating this process by using Azure DevOps, administrators can schedule regular production-to-sandbox copies and follow up with a data package import to apply environment-specific configurations automatically.

In this tutorial, learn how to:

- Set up an Azure DevOps service connection by using workload identity federation
- Create a scheduled pipeline that copies a production environment to a sandbox
- Automatically import a finance and operations data package after the copy completes
- Understand the role of the **DBMovementAPI** user for post-copy automation
- (Optional) Perform a transactionless copy by using the Power Platform API for reduced storage consumption

As an example of this scenario, a customer wants to refresh their sandbox environment from production every weekend. After the copy finishes, a data package containing environment-specific settings (such as email parameters, batch job configurations, or integration endpoints) is automatically imported so the sandbox is ready for use on Monday.

## Before you begin

- The source environment is your production environment (either a Lifecycle Services environment or a unified environment in the Power Platform admin center).
- The target environment is a unified sandbox environment hosted by Microsoft Dataverse. To learn how to deploy one, see [Tutorial: Provision a new environment with an ERP-based template](./tutorial-deploy-new-environment-with-ERP-template.md).
- You must provision both environments in the same region. For general information on copying environments, see [Copy an environment](../copy-environment.md).
- You need an [Azure DevOps](https://dev.azure.com) organization and project with permissions to create pipelines and service connections.
- Install the **Power Platform Build Tools** extension from the [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.PowerPlatform-BuildTools) in your Azure DevOps organization. Ensure you have version 2.0.69 or later, which supports workload identity federation.
- Prepare a data package (.zip) in the data management workspace of your finance and operations apps. This package contains the data entities and configurations you want to import into the sandbox after each copy.

### About the DBMovementAPI user

The finance and operations apps include an optional user account you can create called **DBMovementAPI**. When you perform an environment copy, this account is automatically enabled in the target environment if it was present in the source environment. This is significant because the DBMovementAPI user can be given permissions necessary to call the data management package APIs, which means your automated pipeline can authenticate and trigger a data import immediately after the copy completes without any manual intervention and without any other users enabled to access the system besides the administrator account.

> [!IMPORTANT]
> Ensure the DBMovementAPI user is created in your source (production) environment before performing the copy. You may leave it disabled in the source environment, but give it appropriate security roles and associate this user to a Microsoft Entra ID application to have programmatic access to it. After the copy completes, this user is automatically enabled in the target sandbox and can be used to execute the data import step.

## Step 1: Register an application in Microsoft Entra ID

To allow Azure DevOps to interact with the Power Platform APIs and finance and operations data management APIs, you need a Microsoft Entra ID app registration.

1. Sign in to the [Azure portal](https://portal.azure.com) and go to **Microsoft Entra ID** > **App registrations**.
1. Select **New registration**.
1. Enter a name such as **AzDevOps-PowerPlatform-Pipeline** and select **Register**.
1. Note the **Application (client) ID** and **Directory (tenant) ID** for later use.

### Grant API permissions

1. In your app registration, go to **API permissions** > **Add a permission**.
1. Choose the **APIs my organization uses** tab, search for **Microsoft Dynamics ERP** (00000015-0000-0000-c000-000000000000), and grant all of the delegated permissions. 
1. Add the app as an **Application User** in Power Platform with the **System Administrator** security role in both the source and target environments.  The system administrator role gives the ability to perform environment copy, backup, and restore.

> [!NOTE]
> For detailed guidance on registering application users in Power Platform, see [Create an application user](/power-platform/admin/manage-application-users#create-an-application-user).

## Step 2: Configure a service connection with workload identity federation

Workload identity federation eliminates the need for client secrets by using OpenID Connect (OIDC) to establish trust between Azure DevOps and Microsoft Entra ID.  

### Create the Power Platform service connection in Azure DevOps

1. In your Azure DevOps project, go to **Project settings** > **Service connections** > **New service connection**.
1. Search for and select **Power Platform**.
1. Choose **Workload Identity federation (preview)** as the authentication method.
1. Fill in the following fields:
   - **Server URL**: Enter the URL of your target Power Platform environment (for example, `https://yourorg.crm.dynamics.com`).
   - **Tenant ID**: Enter your Microsoft Entra tenant ID.
   - **Application ID**: Enter the client ID of the app registration from Step 1.
1. Name the service connection (for example, **PowerPlatform-Prod**) and select **Save**.

> [!IMPORTANT]
> After saving, capture the **Issuer** and **Subject identifier** values displayed on the service connection page.

### Add a federated credential to your app registration

1. In the Azure portal, go to your app registration created in Step 1.
1. Select **Certificates & secrets** > **Federated credentials** > **Add credential**.
1. Choose the scenario **Other issuer**.
1. Set the following values:
   - **Issuer**: Enter the value from prior step.
   - **Subject identifier**: Enter the value from prior step.

1. Enter a **Name** for the credential (for example, **azdo-federation**) and select **Add**.

## Step 3: Create a scheduled Azure DevOps pipeline

Create a new YAML pipeline in your Azure DevOps project that runs on a schedule, copies the production environment to the sandbox, and then imports a data package.

### Pipeline YAML

Create a file named **scheduled-copy-and-import.yml** in your repository.

```yaml
trigger: none

schedules:
  - cron: '0 2 * * 6'  # Runs at 2:00 AM UTC every Saturday
    displayName: 'Weekly Prod to Sandbox Copy'
    branches:
      include:
        - master
    always: true

pool:
  vmImage: 'windows-latest'

variables:
  - name: ServiceConnection
    value: 'PowerPlatform-Prod'
  - name: SourceEnvironmentUrl
    value: 'https://yourprod.crm.dynamics.com'
  - name: TargetEnvironmentUrl
    value: 'https://yoursandbox.crm.dynamics.com'
  - name: FinOpsEnvironmentUrl
    value: 'https://yoursandbox.operations.dynamics.com'
  - name: DataPackagePath
    value: '$(Build.SourcesDirectory)/DeveloperData/SampleTransactions.zip'

stages:
  - stage: CopyEnvironment
    displayName: 'Copy Production to Sandbox'
    jobs:
      - job: CopyProdToSandbox
        displayName: 'Copy environment'
        timeoutInMinutes: 360
        steps:
          - task: PowerPlatformToolInstaller@2
            displayName: 'Install Power Platform Build Tools'

          - task: PowerPlatformCopyEnvironment@2
            displayName: 'Copy Production to Sandbox'
            inputs:
              authenticationType: 'PowerPlatformSPN'
              PowerPlatformSPN: '$(ServiceConnection)'
              SourceEnvironmentUrl: '$(SourceEnvironmentUrl)'
              TargetEnvironmentUrl: '$(TargetEnvironmentUrl)'
              CopyType: 'FullCopy'
              OverrideFriendlyName: false
              SkipAuditData: true
              MaxAsyncWaitTime: 360  # Wait up to 6 hours for the copy to complete

  - stage: ImportDataPackage
    displayName: 'Import Data Package to Sandbox'
    dependsOn: CopyEnvironment
    condition: succeeded()
    jobs:
      - job: ImportData
        displayName: 'Import data package via D365 F&O API'
        steps:
          - task: PowerShell@2
            displayName: 'Import data package into finance and operations'
            inputs:
              targetType: 'inline'
              script: |
                # Variables
                $finOpsUrl = "$(FinOpsEnvironmentUrl)"
                $tenantId = "$(TenantId)"
                $clientId = "$(ClientId)"
                $dataPackagePath = "$(DataPackagePath)"
                $entityName = "SampleTransactions"

                # Authenticate using federated token
                # The pipeline's service connection handles auth for Power Platform tasks,
                # but for direct F&O API calls we use MSAL with the app registration.
                # If using client credentials, obtain a token:
                $resource = "$finOpsUrl"
                $tokenUrl = "https://login.microsoftonline.com/$tenantId/oauth2/v2.0/token"
                $scope = "$finOpsUrl/.default"

                $body = @{
                    client_id     = $clientId
                    scope         = $scope
                    grant_type    = "client_credentials"
                    client_secret = "$(ClientSecret)"
                }

                Write-Host "Acquiring access token for finance and operations environment..."
                $tokenResponse = Invoke-RestMethod -Method Post -Uri $tokenUrl -Body $body -ContentType "application/x-www-form-urlencoded"
                $accessToken = $tokenResponse.access_token

                $headers = @{
                    "Authorization" = "Bearer $accessToken"
                    "Content-Type"  = "application/octet-stream"
                }

                # Step 1: Get the blob URL to upload the package
                Write-Host "Requesting writable blob URL from the data management API..."
                $getBlobUrl = "$finOpsUrl/data/DataManagementDefinitionGroups/Microsoft.Dynamics.DataEntities.GetAzureWriteUrl"
                $getBlobBody = @{
                    "uniqueFileName" = "SampleTransactions.zip"
                } | ConvertTo-Json

                $blobResponse = Invoke-RestMethod -Method Post -Uri $getBlobUrl -Headers @{
                    "Authorization" = "Bearer $accessToken"
                    "Content-Type"  = "application/json"
                } -Body $getBlobBody

                $blobUrl = $blobResponse.value

                # Step 2: Upload the data package to the blob URL
                Write-Host "Uploading data package to blob storage..."
                $packageBytes = [System.IO.File]::ReadAllBytes($dataPackagePath)
                Invoke-RestMethod -Method Put -Uri $blobUrl -Headers @{
                    "x-ms-blob-type" = "BlockBlob"
                    "Content-Type"   = "application/octet-stream"
                } -Body $packageBytes

                # Step 3: Initiate the import
                Write-Host "Initiating data package import..."
                $importUrl = "$finOpsUrl/data/DataManagementDefinitionGroups/Microsoft.Dynamics.DataEntities.ImportFromPackage"
                $importBody = @{
                    "packageUrl"             = $blobUrl
                    "definitionGroupId"      = $entityName
                    "executionId"            = ""
                    "execute"                = $true
                    "overwrite"              = $true
                    "legalEntityId"          = "USMF"
                } | ConvertTo-Json

                $importResponse = Invoke-RestMethod -Method Post -Uri $importUrl -Headers @{
                    "Authorization" = "Bearer $accessToken"
                    "Content-Type"  = "application/json"
                } -Body $importBody

                $executionId = $importResponse.value
                Write-Host "Data import initiated. Execution ID: $executionId"

                # Step 4: Poll for completion
                Write-Host "Polling for import completion..."
                $statusUrl = "$finOpsUrl/data/DataManagementDefinitionGroups/Microsoft.Dynamics.DataEntities.GetExecutionSummaryStatus"
                $complete = $false
                $maxRetries = 60
                $retryCount = 0

                while (-not $complete -and $retryCount -lt $maxRetries) {
                    Start-Sleep -Seconds 30
                    $retryCount++

                    $statusBody = @{
                        "executionId" = $executionId
                    } | ConvertTo-Json

                    $statusResponse = Invoke-RestMethod -Method Post -Uri $statusUrl -Headers @{
                        "Authorization" = "Bearer $accessToken"
                        "Content-Type"  = "application/json"
                    } -Body $statusBody

                    $status = $statusResponse.value
                    Write-Host "Attempt $retryCount - Import status: $status"

                    if ($status -eq "Succeeded") {
                        Write-Host "Data package import completed successfully."
                        $complete = $true
                    }
                    elseif ($status -eq "Failed" -or $status -eq "Canceled") {
                        Write-Error "Data package import failed with status: $status"
                        exit 1
                    }
                }

                if (-not $complete) {
                    Write-Error "Data package import timed out after $maxRetries attempts."
                    exit 1
                }
            env:
              TenantId: $(TenantId)
              ClientId: $(ClientId)
              ClientSecret: $(ClientSecret)
```

### Configure pipeline variables

In your Azure DevOps pipeline, add the following variables (mark secrets as **secret**).

| Variable | Description | Secret |
|:---------|:------------|:-------|
| `TenantId` | Your Microsoft Entra tenant ID. | No |
| `ClientId` | The application (client) ID from your app registration. | No |
| `ClientSecret` | A client secret for the app registration (used for finance and operations API calls). | Yes |

> [!NOTE]
> The Power Platform Build Tools tasks use the service connection with workload identity federation (no secret needed). However, direct API calls to the finance and operations data management endpoint currently require a client credential flow. Store the client secret securely as a pipeline secret variable or in Azure Key Vault.

## Optional: Transactionless copy using the Power Platform API

The **PowerPlatformCopyEnvironment@2** task used in the pipeline above performs a full copy of both configuration and transactional data. If you want to perform a transactionless copy&mdash;which copies code, configuration, master data, and reference data but truncates transaction tables&mdash;you need to call the [Power Platform Environment Copy API](/rest/api/power-platform/environmentmanagement/environment-copy/copy-environment) directly. This API exposes the **executeAdvancedCopyForFinanceAndOperations** option that isn't available in the Build Tools task today.

Transactionless copy significantly reduces storage consumption on sandbox environments. To learn more about how it works and which tables are truncated, see [Tutorial: Perform a transaction-less copy between environments](./tutorial-perform-transactionless-copy.md). To perform a transactionless copy through the Power Platform admin center UI instead of a pipeline, follow that tutorial.

### Additional prerequisites for transactionless copy

The Power Platform Environment Copy API uses a different endpoint (`https://api.powerplatform.com`) than the Dataverse APIs used by the Build Tools tasks. This difference requires two extra authorization steps for your app registration.

1. **Power Platform RBAC role assignment (tenant scope):** You must assign your service principal the **Power Platform Contributor** role at the tenant scope. This role grants permission to call the environment management APIs. For a step-by-step walkthrough, see [Tutorial: Assign role-based access control roles to service principals](/power-platform/admin/programmability-tutorial-rbac-role-assignment). For background on the RBAC model, see [Role-based access control for Power Platform admin center](/power-platform/admin/security/role-based-access-control).

2. **Dataverse application user (environment scope):** You must also register your service principal as an **Application User** with the **System Administrator** security role in both the source and target Dataverse environments. This registration is needed because the copy operation accesses environment-level resources. For guidance, see [Create an application user](/power-platform/admin/manage-application-users#create-an-application-user).

> [!NOTE]
> The RBAC role assignment at tenant scope is only required if you're performing a transactionless copy through the API. The standard full copy using the **PowerPlatformCopyEnvironment@2** task (shown in Step 3) only requires the Dataverse application user and the Build Tools service connection.

### Additional pipeline variables for transactionless copy

Add these variables to your pipeline alongside the existing ones (mark secrets as **secret**).

| Variable | Description | Secret |
|:---------|:------------|:-------|
| `SourceEnvironmentId` | The environment ID (GUID) of your source production environment | No |
| `TargetEnvironmentId` | The environment ID (GUID) of your target sandbox environment | No |

> [!TIP]
> You can find the environment ID in the Power Platform admin center by navigating to **Environments**, selecting the environment, and copying the ID from the **Environment details** page URL or the **Details** pane.

### Replace the copy stage

To use transactionless copy, replace the **CopyEnvironment** stage in the pipeline YAML with the following code. This stage acquires a token for the Power Platform API, initiates the copy with the transactionless option, and polls until completion.

```yaml
  - stage: CopyEnvironment
    displayName: 'Transactionless Copy Production to Sandbox'
    jobs:
      - job: CopyProdToSandbox
        displayName: 'Transactionless copy via Power Platform API'
        timeoutInMinutes: 360
        steps:
          - task: PowerShell@2
            displayName: 'Copy environment (transactionless)'
            inputs:
              targetType: 'inline'
              script: |
                # --- Configuration ---
                $tenantId = "$(TenantId)"
                $clientId = "$(ClientId)"
                $clientSecret = "$(ClientSecret)"
                $sourceEnvId = "$(SourceEnvironmentId)"
                $targetEnvId = "$(TargetEnvironmentId)"
                $apiVersion = "2022-03-01-preview"

                # --- Step 1: Acquire access token for Power Platform API ---
                Write-Host "Acquiring access token for api.powerplatform.com..."
                $tokenUrl = "https://login.microsoftonline.com/$tenantId/oauth2/v2.0/token"
                $tokenBody = @{
                    client_id     = $clientId
                    scope         = "https://api.powerplatform.com/.default"
                    grant_type    = "client_credentials"
                    client_secret = $clientSecret
                }

                $tokenResponse = Invoke-RestMethod -Method Post -Uri $tokenUrl `
                    -Body $tokenBody -ContentType "application/x-www-form-urlencoded"
                $accessToken = $tokenResponse.access_token

                $headers = @{
                    "Authorization" = "Bearer $accessToken"
                    "Content-Type"  = "application/json"
                }

                # --- Step 2: Initiate transactionless copy ---
                Write-Host "Initiating transactionless copy..."
                Write-Host "  Source: $sourceEnvId"
                Write-Host "  Target: $targetEnvId"

                $copyUrl = "https://api.powerplatform.com/environmentmanagement/environments/$targetEnvId/copy?api-version=$apiVersion"
                $copyBody = @{
                    sourceEnvironmentId = $sourceEnvId
                    copyType = "Full"
                    copyOptions = @{
                        skipAuditData = $true
                        executeAdvancedCopyForFinanceAndOperations = $true
                    }
                } | ConvertTo-Json -Depth 3

                $copyResponse = Invoke-WebRequest -Method Post -Uri $copyUrl `
                    -Headers $headers -Body $copyBody -UseBasicParsing

                if ($copyResponse.StatusCode -ne 202) {
                    Write-Error "Copy request failed with status $($copyResponse.StatusCode): $($copyResponse.Content)"
                    exit 1
                }

                # The 202 response includes a Location header with the operation URL
                $operationUrl = $copyResponse.Headers["Location"]
                if (-not $operationUrl) {
                    # Some responses return the operation URL in the body
                    $responseBody = $copyResponse.Content | ConvertFrom-Json
                    $operationUrl = $responseBody.operationUrl
                }

                Write-Host "Copy initiated. Polling operation status..."
                Write-Host "  Operation URL: $operationUrl"

                # --- Step 3: Poll for completion ---
                $complete = $false
                $maxRetries = 720   # 6 hours at 30-second intervals
                $retryCount = 0

                while (-not $complete -and $retryCount -lt $maxRetries) {
                    Start-Sleep -Seconds 30
                    $retryCount++

                    try {
                        $statusResponse = Invoke-RestMethod -Method Get `
                            -Uri $operationUrl -Headers $headers
                    }
                    catch {
                        Write-Warning "Status check attempt $retryCount failed: $_"
                        continue
                    }

                    $state = $statusResponse.state
                    if ($retryCount % 10 -eq 0) {
                        Write-Host "Attempt $retryCount - Operation state: $state"
                    }

                    if ($state -eq "Succeeded") {
                        Write-Host "Transactionless copy completed successfully."
                        $complete = $true
                    }
                    elseif ($state -eq "Failed") {
                        Write-Error "Copy operation failed. Details: $($statusResponse | ConvertTo-Json -Depth 5)"
                        exit 1
                    }
                }

                if (-not $complete) {
                    Write-Error "Copy operation timed out after $retryCount attempts."
                    exit 1
                }
            env:
              TenantId: $(TenantId)
              ClientId: $(ClientId)
              ClientSecret: $(ClientSecret)
```

The rest of the pipeline (the **ImportDataPackage** stage) remains unchanged. It runs after the transactionless copy completes, just as it does with the standard full copy.

### Transactionless copy troubleshooting

| Issue | Resolution |
|:------|:-----------|
| 403 Forbidden when calling the Copy API | The service principal is missing the **Power Platform Contributor** RBAC role at tenant scope. Follow the [RBAC role assignment tutorial](/power-platform/admin/programmability-tutorial-rbac-role-assignment) to assign it. |
| 401 Unauthorized when calling the Copy API | The token was acquired for the wrong audience. Ensure the scope is `**https://api.powerplatform.com/.default**`, not a Dataverse URL. |
| Copy succeeds but transactions are still present | Verify that **executeAdvancedCopyForFinanceAndOperations** is set to **$true** in the request body. Also confirm the source environment has the latest platform update&mdash;transactionless copy requires a minimum platform version. |
| Application user not found error | Ensure the app registration is registered as an Application User with **System Administrator** role in both the source and target Dataverse environments. |

## Step 4: Prepare the data package

1. In your source finance and operations environment, go to **Workspaces** > **Data management**.
1. Create a new export project that includes the data entities you want to load into the sandbox after each copy. For example, sample transactions, test data, or environment-specific configurations.
1. Run the export and download the resulting .zip file.
1. Commit this .zip file to the **main** branch of your Azure DevOps repository at **DeveloperData/SampleTransactions.zip**, matching the **DataPackagePath** variable in the pipeline YAML.

> [!TIP]
> To define what gets imported after a copy, create a data project in the data management workspace with a name matching the **definitionGroupId** in the pipeline YAML (for example, **SampleTransactions**). This project must exist in the target environment. Since it gets overwritten during each copy, you might need to recreate it or include it as part of your data package.

## Step 5: Run and verify the pipeline

1. In Azure DevOps, go to **Pipelines** and select the pipeline you created.
1. Select **Run pipeline** to trigger a manual run, or wait for the scheduled run.
1. Monitor the **CopyEnvironment** stage to confirm the production-to-sandbox copy finishes successfully.
1. After the copy finishes, the **ImportDataPackage** stage triggers automatically. Monitor it to confirm the data package imports successfully.
1. Sign in to your sandbox finance and operations environment and verify the imported data.

### Troubleshooting

| Issue | Resolution |
|:------|:-----------|
| Service connection authentication fails | Verify the **Issuer** and **Subject identifier** in your federated credential match the values shown on the Azure DevOps service connection page. Check the pipeline logs for the expected values. |
| Copy operation times out | Environment copies can take several hours for large databases. Increase the `timeoutInMinutes` value on the copy job. |
| Data import returns 401 Unauthorized | Ensure the **DBMovementAPI** user is enabled in the source environment and that your app registration has the required permissions on the target environment. |
| Data import status is **Failed** | Review the execution details in **Data management** > **Job history** in your finance and operations environment for specific entity errors. |

## Next steps

- [Copy a Lifecycle Services environment to a unified environment](./tutorial-copy-lifecycle-services-environment-unified-environment.md)
- [Perform a transaction-less copy between environments](./tutorial-perform-transactionless-copy.md)
- [Tutorial: Provision a new environment with an ERP-based template](./tutorial-deploy-new-environment-with-ERP-template.md)
- [Role-based access control for Power Platform admin center](/power-platform/admin/security/role-based-access-control)
- [Tutorial: Assign RBAC roles to service principals](/power-platform/admin/programmability-tutorial-rbac-role-assignment)
