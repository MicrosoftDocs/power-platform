---
title: "Tutorial: Schedule environment copy and automated data import using Azure DevOps"
description: This tutorial demonstrates how to schedule a production to sandbox environment copy using Azure DevOps pipelines with Power Platform Build Tools, and automatically import a finance and operations data package after the copy completes.
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 03/13/2026
ms.subservice: admin
ms.author: laswenka
search.audienceType:
  - admin
---

# Tutorial: Schedule environment copy and automated data import using Azure DevOps

Keeping sandbox environments current with production data is a common operational need for finance and operations apps customers. By automating this process with Azure DevOps, administrators can schedule regular production-to-sandbox copies and follow up with a data package import to apply environment-specific configurations automatically.

In this tutorial, learn how to:

- Set up an Azure DevOps service connection using workload identity federation
- Create a scheduled pipeline that copies a production environment to a sandbox
- Automatically import a finance and operations data package after the copy completes
- Understand the role of the **DBMovementAPI** user for post-copy automation

As an example of this scenario, a customer wants to refresh their sandbox environment from production every weekend. After the copy finishes, a data package containing environment-specific settings (such as email parameters, batch job configurations, or integration endpoints) is automatically imported so the sandbox is ready for use on Monday.

## Before you begin

- The **source** environment is your production environment (either a Lifecycle Services environment or a unified environment in the Power Platform admin center).
- The **target** environment is a unified sandbox environment hosted by Microsoft Dataverse. To learn how to deploy one, go to [Tutorial: Provision a new environment with an ERP-based template](./tutorial-deploy-new-environment-with-ERP-template.md).
- Both environments must be provisioned in the **same region**. For general information on copying environments, go to [Copy an environment](../copy-environment.md).
- You need an [Azure DevOps](https://dev.azure.com) organization and project with permissions to create pipelines and service connections.
- Install the **Power Platform Build Tools** extension from the [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.PowerPlatform-BuildTools) in your Azure DevOps organization. Ensure you have version **2.0.69 or later**, which supports workload identity federation.
- Prepare a **data package (.zip)** in the Data management workspace of your finance and operations apps. This package contains the data entities and configurations you want to import into the sandbox after each copy.

### About the DBMovementAPI user

The finance and operations apps include a built-in user account called **DBMovementAPI**. When you perform an environment copy, this account is automatically enabled in the target environment. This is significant because the DBMovementAPI user has the permissions required to call the Data management package APIs, which means your automated pipeline can authenticate and trigger a data import immediately after the copy completes without any manual intervention.

> [!IMPORTANT]
> Ensure the **DBMovementAPI** user is enabled in your source (production) environment before performing the copy. After the copy completes, this user is available in the target sandbox and can be used to execute the data import step. To enable this user, go to **System administration > Users** in your finance and operations apps and search for the **DBMovementAPI** user. Set the account to **Enabled** if it isn't already.

## Step 1: Register an application in Microsoft Entra ID

To allow Azure DevOps to interact with the Power Platform APIs and finance and operations data management APIs, you need a Microsoft Entra ID app registration.

1. Sign in to the [Azure portal](https://portal.azure.com) and go to **Microsoft Entra ID** > **App registrations**.
1. Select **New registration**.
1. Enter a name such as `AzDevOps-PowerPlatform-Pipeline` and select **Register**.
1. Note the **Application (client) ID** and **Directory (tenant) ID** for later use.

### Grant API permissions

1. In your app registration, go to **API permissions** > **Add a permission**.
1. Select **Dynamics CRM** (this covers Dataverse APIs) and grant **user_impersonation** as a delegated permission, or add the app as an **Application User** in Power Platform with the **System Administrator** security role.
1. For finance and operations data management APIs, the app needs access to your finance and operations environment. Register the app as an application user in your Dataverse environment and assign the appropriate security roles.

> [!NOTE]
> For detailed guidance on registering application users in Power Platform, see [Create an application user](/power-platform/admin/manage-application-users#create-an-application-user).

## Step 2: Configure a service connection with workload identity federation

Workload identity federation eliminates the need for client secrets by using OpenID Connect (OIDC) to establish trust between Azure DevOps and Microsoft Entra ID.

### Add a federated credential to your app registration

1. In the Azure portal, go to your app registration created in Step 1.
1. Select **Certificates & secrets** > **Federated credentials** > **Add credential**.
1. Choose the scenario **Other issuer**.
1. Set the following values:
   - **Issuer**: `https://vstoken.dev.azure.com/<AzureDevOpsOrganizationID>`
   - **Subject identifier**: `sc://<OrgName>/<ProjectName>/<ServiceConnectionName>`

   > [!TIP]
   > To find your Azure DevOps Organization ID, go to your Azure DevOps organization settings. For the **Subject identifier**, the values correspond to your Azure DevOps organization name, project name, and the name you give your service connection in the next section. Use the exact values displayed on the service connection page in Azure DevOps after creation to avoid misconfiguration.

1. Enter a **Name** for the credential (for example, `azdo-federation`) and select **Add**.

### Create the Power Platform service connection in Azure DevOps

1. In your Azure DevOps project, go to **Project settings** > **Service connections** > **New service connection**.
1. Search for and select **Power Platform**.
1. Choose **Workload Identity federation (preview)** as the authentication method.
1. Fill in the following fields:
   - **Server URL**: The URL of your Dataverse environment (for example, `https://yourorg.crm.dynamics.com`)
   - **Tenant ID**: Your Microsoft Entra tenant ID
   - **Application ID**: The client ID of the app registration from Step 1
1. Name the service connection (for example, `PowerPlatform-Prod`) and select **Save**.

> [!IMPORTANT]
> After saving, verify the **Issuer** and **Subject identifier** values displayed on the service connection page match exactly what you configured in the federated credential. If they don't match, update the federated credential in the Azure portal. Misconfigured values cause authentication failures, but the pipeline logs will output the expected values to help you troubleshoot.

For more information, see the [Power Platform Build Tools discussion on workload identity federation](https://github.com/microsoft/powerplatform-build-tools/discussions/884).

## Step 3: Create a scheduled Azure DevOps pipeline

Create a new YAML pipeline in your Azure DevOps project that runs on a schedule, copies the production environment to the sandbox, and then imports a data package.

### Pipeline YAML

Create a file named `scheduled-copy-and-import.yml` in your repository:

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

In your Azure DevOps pipeline, add the following variables (mark secrets as **secret**):

| Variable | Description | Secret |
|:---------|:------------|:-------|
| `TenantId` | Your Microsoft Entra tenant ID | No |
| `ClientId` | The Application (client) ID from your app registration | No |
| `ClientSecret` | A client secret for the app registration (used for F&O API calls) | Yes |

> [!NOTE]
> The Power Platform Build Tools tasks use the service connection with workload identity federation (no secret needed). However, direct API calls to the finance and operations data management endpoint currently require a client credential flow. Store the client secret securely as a pipeline secret variable or in Azure Key Vault.

## Step 4: Prepare the data package

1. In your **source** finance and operations environment, go to **Workspaces** > **Data management**.
1. Create a new **Export** project that includes the data entities you want to load into the sandbox after each copy (for example, sample transactions, test data, or environment-specific configurations).
1. Run the export and download the resulting **.zip** file.
1. Commit this .zip file to the **master** branch of your Azure DevOps repository at `DeveloperData/SampleTransactions.zip`, matching the `DataPackagePath` variable in the pipeline YAML.

> [!TIP]
> To define what gets imported after a copy, create a **Data project** in the Data management workspace with a name matching the `definitionGroupId` in the pipeline YAML (for example, `SampleTransactions`). This project must exist in the **target** environment. Since it gets overwritten during each copy, you may need to recreate it or include it as part of your data package.

## Step 5: Run and verify the pipeline

1. In Azure DevOps, navigate to **Pipelines** and select the pipeline you created.
1. Select **Run pipeline** to trigger a manual run, or wait for the scheduled run.
1. Monitor the **CopyEnvironment** stage to confirm the production-to-sandbox copy completes successfully.
1. After the copy finishes, the **ImportDataPackage** stage triggers automatically. Monitor it to confirm the data package imports successfully.
1. Sign in to your sandbox finance and operations environment and verify the imported data.

### Troubleshooting

| Issue | Resolution |
|:------|:-----------|
| Service connection authentication fails | Verify the **Issuer** and **Subject identifier** in your federated credential match the values shown on the Azure DevOps service connection page. Check the pipeline logs for the expected values. |
| Copy operation times out | Environment copies can take several hours for large databases. Increase the `timeoutInMinutes` value on the copy job. |
| Data import returns 401 Unauthorized | Ensure the **DBMovementAPI** user is enabled in the source environment and that your app registration has the required permissions on the target environment. |
| Data import status is "Failed" | Review the execution details in **Data management** > **Job history** in your finance and operations environment for specific entity errors. |

## Next steps

- [Copy a Lifecycle Services environment to a unified environment](./tutorial-copy-lifecycle-services-environment-unified-environment.md)
- [Perform a transaction-less copy between environments](./tutorial-perform-transactionless-copy.md)
- [Tutorial: Provision a new environment with an ERP-based template](./tutorial-deploy-new-environment-with-ERP-template.md)
