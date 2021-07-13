---
title: "Available GitHub Actions for Microsoft Power Platform administration | Microsoft Docs"
description: "Learn about the available GitHub actions for Microsoft Power Platform administration to support continuous integration and delivery with Microsoft Power Platform."
keywords: 
author: kkanakas
ms.subservice: alm
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

This article provides information about GitHub Actions that are available to administer Microsoft Power Platform.

## Configure credentials to use within your GitHub workflows

Many of the actions require you to connect to a Microsoft Dataverse environment. You can add service principal or user credentials as secrets in your GitHub repository and then use them in the workflow.

- For details about how to set up secrets in GitHub, go to [Using encrypted secrets in a workflow](https://docs.github.com/en/actions/reference/encrypted-secrets#using-encrypted-secrets-in-a-workflow).

- For details about how to set up service principal authentication for Microsoft Power Platform, go to [Configure service connections using a service principal](devops-build-tools.md#configure-service-connections-using-a-service-principal). After it's configured properly, you can call the service principal from within your action scripts.

Define the following parameters within your GitHub Actions script as [environment variables](https://docs.github.com/en/actions/reference/environment-variables):

- Application ID: `WF_APPLICATION_ID:<your application id>`
- Tenant ID: `WF_TENANT_ID:<your tenant id>`

The client secret will be stored as a GitHub secret, as described in [Encrypted secrets](https://docs.github.com/en/actions/reference/encrypted-secrets), and will be referenced from within the action script by using a parameter like
`client secret: ${{secrets.CLIENT_SECRET_GITHUB_ACTIONS}}`.

## Administrative tasks

The available administrative tasks are explained below.
<!--note from editor: I don't think the introductory sentences are necessary, I think they look like mistakes. What do you think of making the headings into the link text?-->
### [Create an environment](../admin/create-environment.md)

| Parameter    | Description   |
|---------------|---------------|
| user-name | The username of the account you're using to connect with. |
| password-secret | The password for *user-name*. GitHub passwords are defined in **Settings** under **Secrets**. You can't retrieve a secret after it has been defined and saved. |
|app-id| The application ID to authenticate with. This parameter is *required* when authenticating with service principal credentials.|
|client-secret| The client secret used to authenticate the GitHub pipeline. This parameter is *required* when authenticating with service principal credentials.|
|tenant-id| The tenant ID when authenticating with `app-id` and `client-secret`.|
|name| The name of the environment that you're going to create.| 
|region| The name of the region where your environment will be created. <br/>The default value is `unitedstates`.|
|type| The type of environment (Trial, Sandbox, Production, SubscriptionBasedTrial). <br/> More information: [Trial environments](../admin/trial-environments.md)|
|currency| The currency to use for the environment. <br/>The default value is `USD`.|
|language| The language to use for the environment. <br/>The default value is `English`.|
|templates| The templates that need to be deployed to the environment. <br/>These are passed as comma-separated values.|
|domain| The domain name of the environment URL.<br/>For example, `https://{contoso}0.crm.dynamics.com`|


The output will be the URL of the new environment.

### [Copy an environment](../admin/copy-environment.md) 

| Parameter           | Description        |
|----------------------|--------------------------|
|source-url| The source URL of the environment to copy. <br/> For example, `https://source-env.crm.dynamics.com`|
|target-url| The target URL of the environment to copy. <br/> For example, `https://target-copy-env.crm.dynamics.com`|
|user-name | The username of the account you're using to connect with. |
|password-secret | The password for *user-name*. GitHub passwords are defined in **Settings** under **Secrets**. You can't retrieve a secret after it has been defined and saved. |
|app-id| The application ID to authenticate with. This parameter is *required* when authenticating with service principal credentials.|
|client-secret| The client secret used to authenticate the GitHub pipeline. This parameter is *required* when authenticating with service principal credentials.|
|tenant-id| The tenant ID when authenticating with `app-id` and `client-secret`.|

### [Back up an environment](../admin/backup-restore-environments.md)

| Parameter           | Description        |
|----------------------|--------------------------|
|environment-url| The URL of the environment that needs to be backed up. <br/> For example, `https://env-to-backup.crm.dynamics.com`|
|backup-label| A meaningful name to use as a label for the backup of the environment.|
|user-name | The username of the account you're using to connect with. |
|password-secret | The password for *user-name*. GitHub passwords are defined in **Settings** under **Secrets**. You can't retrieve a secret after it has been defined and saved. |
|app-id| The application ID to authenticate with. This parameter is *required* when authenticating with service principal credentials.|
|client-secret| The client secret used to authenticate the GitHub pipeline. This parameter is *required* when authenticating with service principal credentials.|
|tenant-id| The tenant ID when authenticating with `app-id` and `client-secret`.|

### [Restore an environment from a backup](../admin/backup-restore-environments.md)

| Parameter           | Description        |
|----------------------|--------------------------|
|source-url| The source URL of the environment to restore. <br/> For example, `https://env-backup-source.crm.dynamics.com`|
|target-url| The target URL of the environment to be restored to. <br/> For example, `https://env-target-restore.crm.dynamics.com`|
|user-name | The username of the account you're using to connect with. |
|password-secret | The password for *user-name*. GitHub passwords are defined in **Settings** under **Secrets**. You can't retrieve a secret after it has been defined and saved. |
|app-id| The application ID to authenticate with. This parameter is *required* when authenticating with service principal credentials.|
|client-secret| The client secret used to authenticate the GitHub pipeline. This parameter is *required* when authenticating with service principal credentials.|
|tenant-id| The tenant ID when authenticating with `app-id` and `client-secret`.|


### [Reset an environment](../admin/reset-environment.md) 

| Parameter           | Description        |
|----------------------|--------------------------|
|environment-url| The URL of the environment that needs to be reset. <br/> For Example, `https://env-to-reset.crm.dynamics.com`|
|user-name | The username of the account you're using to connect with. |
|password-secret | The password for *user-name*. GitHub passwords are defined in **Settings** under **Secrets**. You can't retrieve a secret after it has been defined and saved. |
|app-id| The application ID to authenticate with. This parameter is *required* when authenticating with service principal credentials.|
|client-secret| The client secret used to authenticate the GitHub pipeline. This parameter is *required* when authenticating with service principal credentials.|
|tenant-id| The tenant ID when authenticating with `app-id` and `client-secret`.|

### [Delete an environment](../admin/delete-environment.md)

| Parameter           | Description        |
|----------------------|--------------------------|
|environment-url| The URL of the environment that needs to be deleted. <br/> For example, `https://env-to-delete.crm.dynamics.com`|
|user-name | The username of the account you're using to connect with. |
|password-secret | The password for *user-name*. GitHub passwords are defined in **Settings** under **Secrets**. You can't retrieve a secret after it has been defined and saved. |
|app-id| The application ID to authenticate with. This parameter is *required* when authenticating with service principal credentials.|
|client-secret| The client secret used to authenticate the GitHub pipeline. This parameter is *required* when authenticating with service principal credentials.|
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
|app-id| The application ID to authenticate with. This parameter is *required* when authenticating with service principal credentials.|
|client-secret| The client secret used to authenticate the GitHub pipeline. This parameter is *required* when authenticating with service principal credentials.|
|tenant-id| The tenant ID when authenticating with `app-id` and `client-secret`.|

## Build and release pipeline authoring

To learn about creating multiple-action workflows and pipelines through hands-on authoring by using GitHub Actions for Microsoft Power Platform, complete the [GitHub Actions for Microsoft Power Platform labs](https://aka.ms/poweractionslab).

More information: [About GitHub Actions](https://help.github.com/actions/getting-started-with-github-actions/about-github-actions)

### See also

[GitHub Actions for Microsoft Power Platform](devops-github-actions.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
