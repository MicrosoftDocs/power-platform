---
title: CI/CD integration for Power Platform Playwright Samples
description: Configure GitHub Actions and Azure Pipelines to run Power Platform Playwright tests in a continuous integration pipeline with authentication, artifact upload, and reporting.
author: microsoft
ms.author: deepak.kamboj
ms.topic: how-to
ms.date: 04/07/2025
ms.subservice: power-platform-playwright-samples
---

# CI/CD integration

This article shows how to run Power Platform Playwright tests automatically in GitHub Actions and Azure Pipelines. Authentication runs in `globalSetup` before the test suite starts, and test results are published as pipeline artifacts and test reports.

## Prerequisites

Before configuring your pipeline, make sure you have:

- An Azure Key Vault with a certificate for your test user
- The service principal for your pipeline granted the **Key Vault Certificate User** role on the vault
- Your app URLs, tenant ID, and email stored as pipeline secrets/variables

For local certificate setup, see [Authentication guide](authentication-guide.md).

## GitHub Actions

### Store secrets

In your repository, go to **Settings → Secrets and variables → Actions** and add:

| Secret | Description |
|---|---|
| `MS_AUTH_EMAIL` | Email of the test user account |
| `AZURE_KEYVAULT_URL` | Key Vault URL (`https://<vault>.vault.azure.net/`) |
| `AZURE_CERTIFICATE_NAME` | Name of the certificate in Key Vault |
| `AZURE_TENANT_ID` | Microsoft Entra tenant ID |
| `CANVAS_APP_URL` | Full play-mode URL of your canvas app |
| `MODEL_DRIVEN_APP_URL` | Full URL of your model-driven app |

### Workflow file

Create `.github/workflows/e2e.yml`:

```yaml
name: Power Platform E2E Tests

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]
  schedule:
    - cron: '0 6 * * 1-5'  # Weekdays at 6 AM UTC

jobs:
  e2e:
    runs-on: ubuntu-latest
    timeout-minutes: 60

    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Set up Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'

      - name: Install Rush dependencies
        run: node common/scripts/install-run-rush.js install

      - name: Build toolkit
        run: node common/scripts/install-run-rush.js build --to power-platform-playwright-toolkit

      - name: Install Playwright browsers
        working-directory: packages/e2e-tests
        run: npx playwright install chromium --with-deps

      - name: Authenticate to Power Platform (Canvas)
        working-directory: packages/e2e-tests
        env:
          MS_AUTH_EMAIL: ${{ secrets.MS_AUTH_EMAIL }}
          MS_AUTH_CREDENTIAL_TYPE: certificate
          MS_AUTH_CREDENTIAL_PROVIDER: azure-keyvault
          AZURE_KEYVAULT_URL: ${{ secrets.AZURE_KEYVAULT_URL }}
          AZURE_CERTIFICATE_NAME: ${{ secrets.AZURE_CERTIFICATE_NAME }}
          AZURE_TENANT_ID: ${{ secrets.AZURE_TENANT_ID }}
          CANVAS_APP_URL: ${{ secrets.CANVAS_APP_URL }}
          MODEL_DRIVEN_APP_URL: ${{ secrets.MODEL_DRIVEN_APP_URL }}
        run: npm run auth

      - name: Authenticate to Power Platform (MDA)
        working-directory: packages/e2e-tests
        env:
          MS_AUTH_EMAIL: ${{ secrets.MS_AUTH_EMAIL }}
          MS_AUTH_CREDENTIAL_TYPE: certificate
          MS_AUTH_CREDENTIAL_PROVIDER: azure-keyvault
          AZURE_KEYVAULT_URL: ${{ secrets.AZURE_KEYVAULT_URL }}
          AZURE_CERTIFICATE_NAME: ${{ secrets.AZURE_CERTIFICATE_NAME }}
          AZURE_TENANT_ID: ${{ secrets.AZURE_TENANT_ID }}
          MODEL_DRIVEN_APP_URL: ${{ secrets.MODEL_DRIVEN_APP_URL }}
        run: npm run auth:mda

      - name: Run Playwright tests
        working-directory: packages/e2e-tests
        env:
          MS_AUTH_EMAIL: ${{ secrets.MS_AUTH_EMAIL }}
          CANVAS_APP_URL: ${{ secrets.CANVAS_APP_URL }}
          MODEL_DRIVEN_APP_URL: ${{ secrets.MODEL_DRIVEN_APP_URL }}
          CUSTOM_PAGE_NAME: AccountsCustomPage
          CI: true
        run: npx playwright test

      - name: Upload test results
        if: always()
        uses: actions/upload-artifact@v4
        with:
          name: playwright-report
          path: packages/e2e-tests/playwright-report/
          retention-days: 30

      - name: Upload JUnit results
        if: always()
        uses: actions/upload-artifact@v4
        with:
          name: test-results
          path: packages/e2e-tests/test-results/
          retention-days: 30
```

### Publish test results in GitHub Actions

To display test results in the PR check view, add the JUnit reporter step after tests run:

```yaml
      - name: Publish test results
        if: always()
        uses: dorny/test-reporter@v1
        with:
          name: Playwright Tests
          path: packages/e2e-tests/test-results/results.xml
          reporter: java-junit
```

## Azure Pipelines

### Variable group

Create a variable group named `power-platform-e2e-secrets` in **Pipelines → Library** and add the same variables as the GitHub Actions secrets table above.

### Pipeline definition

Create `.azure-pipelines/e2e-tests.yml`:

```yaml
trigger:
  branches:
    include:
      - main

pr:
  branches:
    include:
      - main

schedules:
  - cron: '0 6 * * 1-5'
    displayName: Weekday morning run
    branches:
      include:
        - main

pool:
  vmImage: ubuntu-latest

variables:
  - group: power-platform-e2e-secrets
  - name: NODE_VERSION
    value: '20'

stages:
  - stage: E2E
    displayName: End-to-End Tests
    jobs:
      - job: PlaywrightTests
        displayName: Power Platform Playwright Tests
        timeoutInMinutes: 60
        steps:
          - template: steps/e2e-setup.yml

          - task: Bash@3
            displayName: Authenticate (Canvas)
            env:
              MS_AUTH_EMAIL: $(MS_AUTH_EMAIL)
              MS_AUTH_CREDENTIAL_TYPE: certificate
              MS_AUTH_CREDENTIAL_PROVIDER: azure-keyvault
              AZURE_KEYVAULT_URL: $(AZURE_KEYVAULT_URL)
              AZURE_CERTIFICATE_NAME: $(AZURE_CERTIFICATE_NAME)
              AZURE_TENANT_ID: $(AZURE_TENANT_ID)
              CANVAS_APP_URL: $(CANVAS_APP_URL)
              MODEL_DRIVEN_APP_URL: $(MODEL_DRIVEN_APP_URL)
            script: |
              cd packages/e2e-tests
              npm run auth

          - task: Bash@3
            displayName: Authenticate (MDA)
            env:
              MS_AUTH_EMAIL: $(MS_AUTH_EMAIL)
              MS_AUTH_CREDENTIAL_TYPE: certificate
              MS_AUTH_CREDENTIAL_PROVIDER: azure-keyvault
              AZURE_KEYVAULT_URL: $(AZURE_KEYVAULT_URL)
              AZURE_CERTIFICATE_NAME: $(AZURE_CERTIFICATE_NAME)
              AZURE_TENANT_ID: $(AZURE_TENANT_ID)
              MODEL_DRIVEN_APP_URL: $(MODEL_DRIVEN_APP_URL)
            script: |
              cd packages/e2e-tests
              npm run auth:mda

          - task: Bash@3
            displayName: Run Playwright Tests
            env:
              MS_AUTH_EMAIL: $(MS_AUTH_EMAIL)
              CANVAS_APP_URL: $(CANVAS_APP_URL)
              MODEL_DRIVEN_APP_URL: $(MODEL_DRIVEN_APP_URL)
              CUSTOM_PAGE_NAME: AccountsCustomPage
              CI: 'true'
            script: |
              cd packages/e2e-tests
              npx playwright test

          - template: steps/e2e-publish-results.yml
```

### Reusable setup step template

Create `.azure-pipelines/steps/e2e-setup.yml`:

```yaml
steps:
  - task: NodeTool@0
    displayName: Install Node.js
    inputs:
      versionSpec: $(NODE_VERSION)

  - task: Bash@3
    displayName: Install Rush dependencies
    script: node common/scripts/install-run-rush.js install

  - task: Bash@3
    displayName: Build toolkit
    script: node common/scripts/install-run-rush.js build --to power-platform-playwright-toolkit

  - task: Bash@3
    displayName: Install Playwright browsers
    script: |
      cd packages/e2e-tests
      npx playwright install chromium --with-deps
```

### Reusable publish results template

Create `.azure-pipelines/steps/e2e-publish-results.yml`:

```yaml
steps:
  - task: PublishTestResults@2
    displayName: Publish JUnit test results
    condition: always()
    inputs:
      testResultsFormat: JUnit
      testResultsFiles: packages/e2e-tests/test-results/results.xml
      testRunTitle: Power Platform Playwright Tests

  - task: PublishPipelineArtifact@1
    displayName: Publish Playwright report
    condition: always()
    inputs:
      targetPath: packages/e2e-tests/playwright-report
      artifact: playwright-report
      publishLocation: pipeline
```

## Troubleshoot CI failures

| Symptom | Resolution |
|---|---|
| Auth step fails with certificate error | Verify Key Vault URL, certificate name, and pipeline SP role |
| Tests fail on first run in CI | Increase `retries` to 1 and check for flaky selectors |
| Artifact not published | Ensure `if: always()` / `condition: always()` is set |
| Pipeline times out | Reduce test count or increase `timeoutInMinutes` |
| `Cannot find module` error | Run the build step for the toolkit before running tests |

## Next steps

- [Environment variables](environment-variables.md)
- [Configuration reference](configuration.md)
- [Authentication guide](authentication-guide.md)

## See also

- [GitHub Actions documentation](https://docs.github.com/actions)
- [Azure Pipelines documentation](https://learn.microsoft.com/azure/devops/pipelines)
- [Playwright CI configuration](https://playwright.dev/docs/ci)
