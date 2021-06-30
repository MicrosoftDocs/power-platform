---
title: "Available GitHub Actions for Microsoft Power Platform administration | Microsoft Docs"
description: "Learn about the available GitHub Actions for Microsoft Power Platform adminsitration to support continuous integration and delivery with Microsoft Power Platform."
keywords: 
author: kkanakas
ms.author: kartikka
manager: kvivek
ms.custom: ""
ms.date: 06/30/2021
ms.reviewer: "pehecke"
ms.service: power-platform
ms.topic: "article"
search.audienceType: 
  - developer
search.app: 
  - PowerApps
  - D365CE
---

# Available GitHub Actions for Microsoft Power Platform administration 

This article provides information about GitHub Actions available to administer Microsoft Power Platform.

## Configure deployment credentials

Many of the actions require you to connect to a Microsoft Dataverse environment. You can add service principal or user credentials as secrets in your GitHub repository and then use them in the workflow.

- For details on how to set up secrets in GitHub, see [Encrypted secrets](https://docs.github.com/en/actions/reference/encrypted-secrets#using-encrypted-secrets-in-a-workflow)

- For details on how to set up service principal authentication for Microsoft Power Platform, see [DevOps Build tools](devops-build-tools.md#configure-service-connections-using-a-service-principal)

Once configured properly you can call the Service Principal from with in your Action scripts.

Parameters to define within your GitHub Action Script as [Environment Variables](https://docs.github.com/en/actions/reference/environment-variables):

- Application ID: `WF_APPLICATION_ID:<your application id>`
- Tenant ID: `WF_TENANT_ID:<your tenant id>`

The client secret will be stored as a GitHub secret, as described earlier and will be referenced from within the action script using a parameter like:
`client secret: ${{secrets.CLIENT_SECRET_GITHUB_ACTIONS}}`

## Administrative tasks

The available administrative tasks are explained below.

### Microsoft Power Platform create environment

[Creates an environment in the Power Platform tenant](../admin/create-environment.md)

| Parameter    | Description   |
|---------------|---------------|
| user-name | The username of the account you're using to connect with. |
| password-secret | The password for *user-name*. GitHub passwords are defined in **Settings** under **Secrets**. You can't retrieve a secret after it has been defined and saved. |
|app-id| The application ID to authenticate with. This parameter is **required** when authenticating with Service Principal credentials.|
|client-secret| The client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal credentials.|
|tenant-id| The tenant ID when authenticating with `app-id` and `client-secret`.|
|name| Name of the environment that you are going to create.| 
|region| Name of the region of where your environment will be created. <br/> default is `unitedstates`|
|type| The type of environment (Trial, Sandbox, Production, SubscriptionBasedTrial). <br/> More information: [Trial environments](../admin/trial-environments.md)|
|currency| The currency to use for the environment. <br/> default is `USD`|
|language| The language to use for the environment. <br/> default is `English`|
|templates| The templates that need to be deployed to the environment. <br/> Passed as comma separated values.|
|domain| The domain name of the environment URL. <br/> for example, `https://{contoso}0.crm.dynamics.com`|


The output will be the URL of the new environment.

### Copy environment

[Creates a copy of a given environment](../admin/copy-environment.md) 

| Parameter           | Description        |
|----------------------|--------------------------|
|source-url| Source URL of the environment to copy. <br/> For example, `https://source-env.crm.dynamics.com`|
|target-url| Target URL of the environment to copy. <br/> For example, `https://target-copy-env.crm.dynamics.com`|
|user-name | The username of the account you're using to connect with. |
|password-secret | The password for *user-name*. GitHub passwords are defined in **Settings** under **Secrets**. You can't retrieve a secret after it has been defined and saved. |
|app-id| The application ID to authenticate with. This parameter is **required** when authenticating with Service Principal credentials.|
|client-secret| The client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal credentials.|
|tenant-id| The tenant ID when authenticating with `app-id` and `client-secret`.|

### Backup environment 

[Creates a backup of a given environment](../admin/backup-restore-environments.md)

| Parameter           | Description        |
|----------------------|--------------------------|
|environment-url| URL of the environment that needs to be backed up. <br/> For example, `https://env-to-backup.crm.dynamics.com`|
|backup-label| Useful name to label the backup of the environment.|
|user-name | The username of the account you're using to connect with. |
|password-secret | The password for *user-name*. GitHub passwords are defined in **Settings** under **Secrets**. You can't retrieve a secret after it has been defined and saved. |
|app-id| The application ID to authenticate with. This parameter is **required** when authenticating with Service Principal credentials.|
|client-secret| The client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal credentials.|
|tenant-id| The tenant ID when authenticating with `app-id` and `client-secret`|

### Restore environment

[Action to restore an environment from backup](../admin/backup-restore-environments.md)

| Parameter           | Description        |
|----------------------|--------------------------|
|source-url| Source URL of the environment to restore. <br/> For example, `https://env-backup-source.crm.dynamics.com`|
|target-url| Target URL of the environment to be restored to. <br/> For example, `https://env-target-restore.crm.dynamics.com`|
|user-name | The username of the account you're using to connect with. |
|password-secret | The password for *user-name*. GitHub passwords are defined in **Settings** under **Secrets**. You can't retrieve a secret after it has been defined and saved. |
|app-id| The application ID to authenticate with. This parameter is **required** when authenticating with Service Principal credentials.|
|client-secret| The client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal credentials.|
|tenant-id| The tenant ID when authenticating with `app-id` and `client-secret`.|



### Reset environment 

[Action to reset environment to delete and reprovision the environment](../admin/reset-environment.md) 

| Parameter           | Description        |
|----------------------|--------------------------|
|environment-url| URL of the environment that needs to be reset. <br/> For Example, `https://env-to-reset.crm.dynamics.com`|
|user-name | The username of the account you're using to connect with. |
|password-secret | The password for *user-name*. GitHub passwords are defined in **Settings** under **Secrets**. You can't retrieve a secret after it has been defined and saved. |
|app-id| The application ID to authenticate with. This parameter is **required** when authenticating with Service Principal credentials.|
|client-secret| The client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal credentials.|
|tenant-id| The tenant ID when authenticating with `app-id` and `client-secret`.|

### Delete environment

[Action to delete environment to recover storage space](../admin/delete-environment.md)

| Parameter           | Description        |
|----------------------|--------------------------|
|environment-url| URL of the environment that needs to be delete. <br/> For example, `https://env-to-delete.crm.dynamics.com`|
|user-name | The username of the account you're using to connect with. |
|password-secret | The password for *user-name*. GitHub passwords are defined in **Settings** under **Secrets**. You can't retrieve a secret after it has been defined and saved. |
|app-id| The application ID to authenticate with. This parameter is **required** when authenticating with Service Principal credentials.|
|client-secret| The client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal credentials.|
|tenant-id| The tenant ID when authenticating with `app-id` and `client-secret`.|



## Helper tasks

The available helper tasks are described below.

### WhoAmI

Verifies the service connection by connecting to the service and sending a `WhoAmI` [[SDK](/dotnet/api/microsoft.crm.sdk.messages.whoamirequest)/[Web API](/dynamics365/customer-engagement/web-api/whoami)] request. This task can be useful to include early in your DevOps pipeline, to verify connectivity before processing begins.

| Parameter    | Description   |
|---------------|---------------|
| environment-url | The URL for the environment you're connecting to.|
| user-name | The username of the account you're using to connect with. |
| password-secret | The password for *user-name*. GitHub passwords are defined in **Settings** under **Secrets**. You can't retrieve a secret after it has been defined and saved. |
|app-id| The application ID to authenticate with. This parameter is **required** when authenticating with Service Principal credentials.|
|client-secret| The client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal credentials.|
|tenant-id| The tenant ID when authenticating with `app-id` and `client-secret`.|

## Build and release pipeline authoring

To learn about creating multiple-action workflows and pipelines through hands-on authoring by using GitHub Actions for Microsoft Power Platform, complete the [GitHub Actions for Microsoft Power Platform labs](https://aka.ms/poweractionslab).

More information: [About GitHub Actions](https://help.github.com/actions/getting-started-with-github-actions/about-github-actions)

### See Also

[GitHub Actions for Microsoft Power Platform](devops-github-actions.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
