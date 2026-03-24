---
title: "Tutorial: Set up a release pipeline for finance and operations apps using Azure DevOps"
description: This tutorial demonstrates how to create a multi-stage Azure DevOps release pipeline that deploys a Power Platform unified package through test, pre-production, and production environments with approval gates.
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 03/20/2026
ms.subservice: admin
ms.author: laswenka
search.audienceType:
  - admin
  - developer
---

# Tutorial: Set up a release pipeline for finance and operations apps using Azure DevOps

When a nightly build pipeline produces a Power Platform unified package, you need a structured release pipeline to promote that package through your environments. A well-designed release pipeline uses staged deployments with time gates and approval checks to ensure that code is validated before it reaches production.

In this tutorial, learn how to:

- Create a multi-stage release pipeline with test, pre-production, and production stages
- Automatically deploy to a test environment whenever a new build completes
- Gate pre-production environments behind a 24-hour delay and a single-person approval
- Schedule production deployments for a Saturday maintenance window with approval
- Use workload identity federation for service connections (no client secrets)

As an example of this scenario, a customer has a nightly build that compiles X++ code and produces a unified package. Each night, the latest package deploys to the test environment. After 24 hours of validation, a designated approver promotes the package to pre-production. The following Saturday at 3:00 AM UTC, after final approval, the package deploys to production.

> [!IMPORTANT]
> **Self-hosted Windows agents recommended.** The `PowerPlatformPackageDeploy` task requires a **Windows** agent, and deploying finance and operations updates typically takes over an hour to complete. Microsoft-hosted agents have a default job timeout that might not be sufficient for large deployments. Use [self-hosted Windows agents](/azure/devops/pipelines/agents/windows-agent) with an extended timeout to avoid pipeline failures during deployment. If you use Microsoft-hosted agents, set **timeoutInMinutes** to at least **180** on each deployment job and monitor for timeout problems.

> [!NOTE]
> **Audit and observability.** Dataverse audit logs record all package deployments to unified environments, providing a full history of what was deployed, when, and by whom. You can optionally forward these audit logs to Microsoft Purview for centralized compliance reporting, full traceability across environments, and integration with your organization's broader governance and observability tooling.

## Before you begin

- Complete the [Tutorial: Set up a nightly build pipeline for finance and operations apps using Azure DevOps](./tutorial-build-pipeline-azure-devops.md). This release pipeline consumes the **UnifiedPackage** artifact published by that build pipeline.
- You need three unified environments in the Power Platform admin center: **Test**, **Pre-Production**, and **Production**. To provision these environments, see [Tutorial: Provision a new environment with an ERP-based template](./tutorial-deploy-new-environment-with-ERP-template.md).
- Install the [Power Platform Build Tools](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.PowerPlatform-BuildTools) extension (version 2.0.69 or later) in your Azure DevOps organization.
- Set up a Microsoft Entra ID app registration and Power Platform service connections by using workload identity federation as described in [Tutorial: Schedule environment copy and automated data import using Azure DevOps](./tutorial-scheduled-copy-with-data-import.md#step-1-register-an-application-in-microsoft-entra-id). You need one service connection per environment or a single connection with permissions across all three environments.

### Service connections

Create a Power Platform service connection for each target environment by using workload identity federation. For each connection, add a corresponding federated credential on the same app registration in Microsoft Entra ID, with the subject identifier matching the connection name.

| Service connection name | Target environment URL | Purpose |
|:------------------------|:-----------------------|:--------|
| `PowerPlatform-Test` | `https://yourtest.crm.dynamics.com` | Test deployments |
| `PowerPlatform-PreProd` | `https://yourpreprod.crm.dynamics.com` | Pre-production deployments |
| `PowerPlatform-Prod` | `https://yourprod.crm.dynamics.com` | Production deployments |

In the Azure portal, each federated credential uses:
- **Issuer**: `https://vstoken.dev.azure.com/<AzureDevOpsOrganizationID>`
- **Subject identifier**: `sc://<OrgName>/<ProjectName>/<ServiceConnectionName>`

For detailed setup instructions, see the [service connection walkthrough](./tutorial-scheduled-copy-with-data-import.md#step-2-configure-a-service-connection-with-workload-identity-federation) in the environment copy tutorial.

## Step 1: Configure Azure DevOps environments and approvals

Azure DevOps environments provide approval gates and deployment history tracking. Create three environments that correspond to your Power Platform environments.

1. In your Azure DevOps project, go to **Pipelines** > **Environments**.
1. Select **New environment** and create the following environments:

   | Environment name | Approvals | Additional checks |
   |:-----------------|:----------|:------------------|
   | `Test` | None (automatic) | None |
   | `PreProduction` | 1 approver required | Minimum 24-hour delay via business hours gate |
   | `Production` | 1 approver required | None (scheduling handled in pipeline) |

### Configure the pre-production approval and delay

1. Select the **PreProduction** environment, and then select the **kebab menu (...)** > **Approvals and checks**.
1. Select **Approvals** and add the user or group that must approve pre-production deployments. Set **Minimum number of approvals** to **1**.
1. Select **Add check** > **Business Hours** (or **Invoke Azure Function** for a custom delay). Alternatively, you can use the **delayBeforeDeployment** option in the pipeline YAML (shown below) to enforce a 24-hour wait after the test environment completes.

### Configure the production approval

1. Select the **Production** environment, and then select the **kebab menu (...)** > **Approvals and checks**.
1. Select **Approvals** and add the user or group that must approve production deployments. Set **Minimum number of approvals** to **1**.

## Step 2: Create the release pipeline

Create a file named **release-pipeline.yml** in your repository. This pipeline consumes the unified package artifact from the nightly build and deploys it through three stages.

### Full pipeline YAML

```yaml
trigger: none

# Automatically trigger when the nightly build completes
resources:
  pipelines:
    - pipeline: NightlyBuild
      source: 'nightly-build'  # Name of your build pipeline
      trigger:
        branches:
          include:
            - main

pool:
  name: 'Self-Hosted-Windows'  # Use your self-hosted Windows agent pool
  # If using Microsoft-hosted agents instead, uncomment the line below:
  # vmImage: 'windows-latest'

variables:
  - name: TestServiceConnection
    value: 'PowerPlatform-Test'
  - name: PreProdServiceConnection
    value: 'PowerPlatform-PreProd'
  - name: ProdServiceConnection
    value: 'PowerPlatform-Prod'
  - name: TestEnvironmentUrl
    value: 'https://yourtest.crm.dynamics.com'
  - name: PreProdEnvironmentUrl
    value: 'https://yourpreprod.crm.dynamics.com'
  - name: ProdEnvironmentUrl
    value: 'https://yourprod.crm.dynamics.com'

# =====================================================================
# STAGE 1: TEST
# Runs automatically each night when a new build artifact is available.
# =====================================================================
stages:
  - stage: DeployToTest
    displayName: 'Deploy to Test'
    jobs:
      - deployment: DeployTest
        displayName: 'Deploy unified package to Test'
        environment: 'Test'
        timeoutInMinutes: 180
        strategy:
          runOnce:
            deploy:
              steps:
                - download: NightlyBuild
                  artifact: 'UnifiedPackage'
                  displayName: 'Download unified package artifact'

                - task: PowerPlatformToolInstaller@2
                  displayName: 'Install Power Platform Build Tools'

                - task: PowerPlatformWhoAmI@2
                  displayName: 'Verify Test service connection'
                  inputs:
                    authenticationType: 'PowerPlatformSPN'
                    PowerPlatformSPN: '$(TestServiceConnection)'

                - task: PowerPlatformDeployPackage@2
                  displayName: 'Deploy unified package to Test'
                  inputs:
                    authenticationType: 'PowerPlatformSPN'
                    PowerPlatformSPN: '$(TestServiceConnection)'
                    PackageFile: '$(Pipeline.Workspace)/NightlyBuild/UnifiedPackage/UnifiedPackage.zip'
                    Environment: '$(TestEnvironmentUrl)'

# =====================================================================
# STAGE 2: PRE-PRODUCTION
# Requires:
#   - Test stage to succeed
#   - 24-hour delay after Test deployment
#   - 1 approval from a designated approver
# =====================================================================
  - stage: DeployToPreProd
    displayName: 'Deploy to Pre-Production'
    dependsOn: DeployToTest
    condition: succeeded()
    jobs:
      - job: WaitForValidation
        displayName: 'Wait 24 hours for Test validation'
        pool: server  # Agentless job for the delay
        timeoutInMinutes: 2880  # 48 hours max wait
        steps:
          - task: Delay@1
            displayName: 'Wait 24 hours before Pre-Production'
            inputs:
              delayForMinutes: 1440  # 24 hours

      - deployment: DeployPreProd
        displayName: 'Deploy unified package to Pre-Production'
        dependsOn: WaitForValidation
        environment: 'PreProduction'  # Triggers the approval gate
        timeoutInMinutes: 180
        strategy:
          runOnce:
            deploy:
              steps:
                - download: NightlyBuild
                  artifact: 'UnifiedPackage'
                  displayName: 'Download unified package artifact'

                - task: PowerPlatformToolInstaller@2
                  displayName: 'Install Power Platform Build Tools'

                - task: PowerPlatformWhoAmI@2
                  displayName: 'Verify Pre-Production service connection'
                  inputs:
                    authenticationType: 'PowerPlatformSPN'
                    PowerPlatformSPN: '$(PreProdServiceConnection)'

                - task: PowerPlatformDeployPackage@2
                  displayName: 'Deploy unified package to Pre-Production'
                  inputs:
                    authenticationType: 'PowerPlatformSPN'
                    PowerPlatformSPN: '$(PreProdServiceConnection)'
                    PackageFile: '$(Pipeline.Workspace)/NightlyBuild/UnifiedPackage/UnifiedPackage.zip'
                    Environment: '$(PreProdEnvironmentUrl)'

# =====================================================================
# STAGE 3: PRODUCTION
# Requires:
#   - Pre-Production stage to succeed
#   - Scheduled for Saturday at 3:00 AM UTC
#   - 1 approval from a designated approver
# =====================================================================
  - stage: DeployToProduction
    displayName: 'Deploy to Production'
    dependsOn: DeployToPreProd
    condition: succeeded()
    jobs:
      - job: WaitForMaintenanceWindow
        displayName: 'Wait for Saturday 3:00 AM UTC maintenance window'
        pool: server  # Agentless job for the delay
        timeoutInMinutes: 11520  # Up to 8 days max wait
        steps:
          - task: ManualValidation@1
            displayName: 'Confirm Saturday maintenance window'
            inputs:
              notifyUsers: 'admin@immglobal.com'
              instructions: |
                Production deployment is ready.
                This deployment should proceed during the Saturday 3:00 AM UTC
                maintenance window. Please confirm:

                1. Pre-Production validation is complete.
                2. The current time falls within the approved maintenance window.
                3. All stakeholders have been notified.

                Approve to proceed with the Production deployment.
              onTimeout: 'reject'
            timeoutInMinutes: 11520

      - deployment: DeployProd
        displayName: 'Deploy unified package to Production'
        dependsOn: WaitForMaintenanceWindow
        environment: 'Production'  # Triggers the approval gate
        timeoutInMinutes: 180
        strategy:
          runOnce:
            deploy:
              steps:
                - download: NightlyBuild
                  artifact: 'UnifiedPackage'
                  displayName: 'Download unified package artifact'

                - task: PowerPlatformToolInstaller@2
                  displayName: 'Install Power Platform Build Tools'

                - task: PowerPlatformWhoAmI@2
                  displayName: 'Verify Production service connection'
                  inputs:
                    authenticationType: 'PowerPlatformSPN'
                    PowerPlatformSPN: '$(ProdServiceConnection)'

                - task: PowerPlatformDeployPackage@2
                  displayName: 'Deploy unified package to Production'
                  inputs:
                    authenticationType: 'PowerPlatformSPN'
                    PowerPlatformSPN: '$(ProdServiceConnection)'
                    PackageFile: '$(Pipeline.Workspace)/NightlyBuild/UnifiedPackage/UnifiedPackage.zip'
                    Environment: '$(ProdEnvironmentUrl)'
```

## Understanding the pipeline stages

The following diagram illustrates the flow through the three stages:

```
  Nightly Build completes
          |
          v
  +-----------------+
  | STAGE 1: TEST   |     Automatic - deploys every night
  +-----------------+
          |
     24-hour delay
          |
          v
  +----------------------+
  | STAGE 2: PRE-PROD    |     Requires 1 approval
  +----------------------+
          |
    Wait for Saturday
       3:00 AM UTC
          |
          v
  +----------------------+
  | STAGE 3: PRODUCTION  |     Requires 1 approval
  +----------------------+
```

### Stage 1: Test

- **Trigger**: Automatic, whenever the nightly build pipeline produces a new artifact.
- **Approvals**: None. The deployment runs immediately.
- **Purpose**: Validate the latest build in an environment that mirrors production configuration. Functional testers and automated test suites run against this environment daily.

### Stage 2: Pre-production

- **Trigger**: After the test environment succeeds, a 24-hour delay begins. This delay gives the team a full business day to validate the test environment deployment before the package moves forward.
- **Approvals**: One designated approver must approve before deployment begins. The approver receives a notification from Azure DevOps when the delay completes and can approve or reject directly from the notification.
- **Purpose**: Final validation in an environment that is as close to production as possible. This stage is where go/no-go decisions are made.

### Stage 3: Production

- **Trigger**: After the pre-production environment succeeds, a manual validation step holds the pipeline until the approver confirms.  The wait time for Saturday is configured on the Environment using the **Business Hours gate**.
- **Approvals**: One designated approver must approve the environment deployment gate. This approval is separate from the manual validation step, providing a two-layer confirmation before production changes.
- **Purpose**: Deploy to production during a low-traffic maintenance window with explicit human approval at each checkpoint.

## Step 3: Add federated credentials for each service connection

If you use a single app registration for all three service connections, you need three federated credentials&mdash;one for each connection. Each credential has a unique subject identifier.

1. In the Azure portal, go to your app registration > **Certificates & secrets** > **Federated credentials**.
1. Add three credentials:

   | Name | Subject identifier |
   |:-----|:-------------------|
   | `azdo-test` | `sc://<OrgName>/<ProjectName>/PowerPlatform-Test` |
   | `azdo-preprod` | `sc://<OrgName>/<ProjectName>/PowerPlatform-PreProd` |
   | `azdo-prod` | `sc://<OrgName>/<ProjectName>/PowerPlatform-Prod` |

   All three use the same issuer: `https://vstoken.dev.azure.com/<AzureDevOpsOrganizationID>`

1. Ensure the app registration is added as an application user with the System Administrator security role in each of the three Power Platform environments.

## Step 4: Register the app user in each environment

You must create the application user tied to your app registration in each target environment. The user needs sufficient permissions to deploy packages.

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select your environment.
1. In the command bar, select **Settings**.
1. Select **Users + permissions** > **Application users**.
1. Select **New app user**. The **Create a new app user** pane appears.
1. Select **+ Add an app** to choose the registered Microsoft Entra application that was created for the user, and then select **Add**. The selected Microsoft Entra app is displayed under **App**. 1. Under **Business Unit**, select a business unit from the dropdown list.  
1. Select the **Edit security roles** icon, to select the **System Administor** role. Select **Save**. Confirm the selection.
1. Select **Create**.
1. Repeat the procedure for all three environments (Test, Pre-Production, Production).

For more information, see [Create an application user](/power-platform/admin/manage-application-users#create-an-application-user).

## Step 5: Run and monitor the pipeline

1. After the nightly build completes, the release pipeline triggers automatically.
1. Monitor **Stage 1 (Test)** in Azure DevOps. The deployment job downloads the unified package artifact and deploys it by using `PowerPlatformPackageDeploy@2`.
1. After the test environment succeeds, the **24-hour delay** begins. The pipeline shows a "Waiting" status.
1. When the delay completes, the designated approver receives a notification. After approval, **Stage 2 (Pre-Production)** deploys the package.
1. After the pre-production environment succeeds, the **manual validation** step holds the pipeline until the Saturday maintenance window. The approver confirms the timing and approves.
1. The **Production environment approval gate** triggers. After the designated approver approves, **Stage 3 (Production)** deploys the package.

### Viewing deployment history

Track each deployment in two places:

- **Azure DevOps**: The **Environments** section shows a full deployment history for each environment, including who approved each deployment and when.
- **Dataverse audit logs**: In the Power Platform admin center, go to the environment and then select **Settings** > **Auditing** to view the package installation records. These logs capture the package name, version, deployment time, and the identity that performed the installation.

## Troubleshooting

| Issue | Resolution |
|:------|:-----------|
| Deployment times out on Microsoft-hosted agents | Switch to self-hosted Windows agents or increase **timeoutInMinutes** to **240** or higher. Finance and operations package deployments routinely exceed 60 minutes. |
| `PowerPlatformPackageDeploy` fails with "unsupported OS" | The deploy task requires a **Windows** agent. Ensure your agent pool uses Windows machines. |
| Service connection authentication fails | Verify each federated credential's **Subject identifier** matches the service connection name exactly. Check the pipeline logs for the expected issuer and subject values. |
| Approval notification not received | Ensure the approver is configured on the Azure DevOps environment, not just as a pipeline variable. Go to **Environments** > select the environment > **Approvals and checks**. |
| Package deploys to wrong environment | Verify the **Environment** input on each **PowerPlatformPackageDeploy@2** task matches the correct environment URL variable for that stage. |
| Delay job times out | The **WaitForValidation** job has a **timeoutInMinutes** of 2880 (48 hours). If the approval isn't granted within this window, the pipeline is canceled. Increase the timeout or set up notification reminders for approvers. |

## Next steps

- [Tutorial: Set up a nightly build pipeline for finance and operations apps using Azure DevOps](./tutorial-build-pipeline-azure-devops.md)
- [Tutorial: Schedule environment copy and automated data import using Azure DevOps](./tutorial-scheduled-copy-with-data-import.md)
- [Continuous integration and deployment for unified environments](/power-platform/developer/unified-experience/finance-operations-pipelines)
