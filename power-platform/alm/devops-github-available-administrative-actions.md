---
title: "Available GitHub Administration Actions for Microsoft Power Platform | Microsoft Docs"
description: "Learn about the available GitHub Administration Actions supporting continuous integration and delivery with Microsoft Power Platform."
keywords: 
author: kkanakas
ms.author: kartikka
manager: kvivek
ms.custom: ""
ms.date: 09/21/2020
ms.reviewer: "pehecke"
ms.service: power-platform
ms.topic: "article"
search.audienceType: 
  - developer
search.app: 
  - PowerApps
  - D365CE
---

# Available GitHub Adminstrative Actions for Microsoft Power Platform 

[Available GitHub Actions for administrative functions for Microsoft Power Platform](https://github.com/marketplace/actions/powerplatform-actions) are described in the following sections. 

## Configure deployment credentials

Many of the actions require you to connect to a Microsoft Dataverse environment. You can add service principal or user credentials as secrets in your the GitHub repository and then use them in the workflow.<br/>
For details on how to setup secrets in GitHub please refer to [the following article on GitHub](https://docs.github.com/en/actions/reference/encrypted-secrets#using-encrypted-secrets-in-a-workflow) <br/>
To learn how to setup service principal authentication for Power Platform please refer to [following document](https://docs.microsoft.com/en-us/power-platform/alm/devops-build-tools#configure-service-connections-using-a-service-principal)<br/>

Once configured properly you can call the Service Principal from with in your Action scripts <br/>
Parameters to define within your GitHub Action Script as [Environment Variables](https://docs.github.com/en/actions/reference/environment-variables): <br/>
Application Id such as: `WF_APPLICATION_ID:<your application id>` <br/>
Tenant Id such as: `WF_TENANT_ID:<your tenant id>` <br/>

The Client Secret will be stored as a GitHub Secret, as described earlier and will be referenced from within the action script using a parameter like: <br/>
`client secret: ${{secrets.CLIENT_SECRET_GITHUB_ACTIONS}}` <br/>
## Administrative tasks

The available administrative tasks are explained below

### Microsoft Power Platform create environment

[Creates an environment in the Power Platform tenant](https://docs.microsoft.com/en-us/power-platform/admin/create-environment)

| Parameter    | Description   |
|---------------|---------------|
| user-name | The username of the account you're using to connect with. |
| password-secret | The password for *user-name*. GitHub passwords are defined in **Settings** under **Secrets**. Note that you can't retrieve a secret after it has been defined and saved. |
|app-id| The application id to authenticate with. This parameter is **required** when authenticating with Service Principal credentials|
|client-secret| The Client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal Credentials|
|tenant-id| The tenant-id when authenticating with app-id and client-secret|
|name| name of the environment that you are going to create| 
|region| name of the region of where your environment will be created <br/> default is `unitedstates`|
|type| the type of environment (Trial,Sandbox,Production,SubscriptionBasedTrial) <br/> details about trial environments can be found at this [link](https://docs.microsoft.com/en-us/power-platform/admin/trial-environments)|
|currency| The currency to use for the environment <br/> default is `USD`|
|language| The language to use for the environment <br/> default is `English`|
|templates| The Dynamics365 templates that needs to be deployed to the environment <br/> Passed as comma separated values|
|domain| The domain name of the environment URL <br/> e.g.: `https://{contoso}0.crm.dynamics.com`|



the output will be the URL of the new environment



### Copy environment

[Creates a copy of a given environment](https://docs.microsoft.com/en-us/power-platform/admin/copy-environment) 

| Parameter           | Description        |
|----------------------|--------------------------|
|source-url| Source URL of the Power Platform environment to copy <br/> e.g. `https://source-env.crm.dynamics.com`|
|target-url| Target URL of the Power Platofmr environment to copy <br/> e.g. `https://target-copy-env.crm.dynamics.com`|
|user-name | The username of the account you're using to connect with. |
|password-secret | The password for *user-name*. GitHub passwords are defined in **Settings** under **Secrets**. Note that you can't retrieve a secret after it has been defined and saved. |
|app-id| The application id to authenticate with. This parameter is **required** when authenticating with Service Principal credentials|
|client-secret| The Client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal Credentials|
|tenant-id| The tenant-id when authenticating with app-id and client-secret|


### Backup environment 

[Creates a backup of a given environment](https://docs.microsoft.com/en-us/power-platform/admin/backup-restore-environments)

| Parameter           | Description        |
|----------------------|--------------------------|
|environment-url| URL of the environment that needs to be backed up <br/> e.g. `https://env-to-backup.crm.dynamics.com`|
|backup-label| Useful name to Label the backup of the environment|
|user-name | The username of the account you're using to connect with. |
|password-secret | The password for *user-name*. GitHub passwords are defined in **Settings** under **Secrets**. Note that you can't retrieve a secret after it has been defined and saved. |
|app-id| The application id to authenticate with. This parameter is **required** when authenticating with Service Principal credentials|
|client-secret| The Client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal Credentials|
|tenant-id| The tenant-id when authenticating with app-id and client-secret|



### Restore environment

[Action to restore an environment from backup](https://docs.microsoft.com/en-us/power-platform/admin/backup-restore-environments)

| Parameter           | Description        |
|----------------------|--------------------------|
|source-url| Source URL of the Power Platform environment to restore <br/> e.g. `https://env-backup-source.crm.dynamics.com`|
|target-url| Target URL of the Power Platofmr environment to be restored to <br/> e.g. `https://env-target-restore.crm.dynamics.com`|
|user-name | The username of the account you're using to connect with. |
|password-secret | The password for *user-name*. GitHub passwords are defined in **Settings** under **Secrets**. Note that you can't retrieve a secret after it has been defined and saved. |
|app-id| The application id to authenticate with. This parameter is **required** when authenticating with Service Principal credentials|
|client-secret| The Client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal Credentials|
|tenant-id| The tenant-id when authenticating with app-id and client-secret|



### Reset environment 

[Action to reset environment to delete and reprovision the environment](https://docs.microsoft.com/en-us/power-platform/admin/reset-environment) 

| Parameter           | Description        |
|----------------------|--------------------------|
|environment-url| URL of the environment that needs to be reset <br/> e.g. `https://env-to-reset.crm.dynamics.com`|
|user-name | The username of the account you're using to connect with. |
|password-secret | The password for *user-name*. GitHub passwords are defined in **Settings** under **Secrets**. Note that you can't retrieve a secret after it has been defined and saved. |
|app-id| The application id to authenticate with. This parameter is **required** when authenticating with Service Principal credentials|
|client-secret| The Client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal Credentials|
|tenant-id| The tenant-id when authenticating with app-id and client-secret|



### Delete environment

[Action to delete environment to recover storage space](https://docs.microsoft.com/en-us/power-platform/admin/delete-environment)

| Parameter           | Description        |
|----------------------|--------------------------|
|environment-url| URL of the environment that needs to be delete <br/> e.g. `https://env-to-delete.crm.dynamics.com`|
|user-name | The username of the account you're using to connect with. |
|password-secret | The password for *user-name*. GitHub passwords are defined in **Settings** under **Secrets**. Note that you can't retrieve a secret after it has been defined and saved. |
|app-id| The application id to authenticate with. This parameter is **required** when authenticating with Service Principal credentials|
|client-secret| The Client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal Credentials|
|tenant-id| The tenant-id when authenticating with app-id and client-secret|



## Helper tasks

The available helper tasks are described below.

###  WhoAmI

Verifies the service connection by connecting to the service and sending a `WhoAmI` [[SDK](/dotnet/api/microsoft.crm.sdk.messages.whoamirequest)/[Web API](/dynamics365/customer-engagement/web-api/whoami)] request. This task can be useful to include early in your DevOps pipeline, to verify connectivity before processing begins.

| Parameter    | Description   |
|---------------|---------------|
| environment-url | The URL for the environment you're connecting to.|
| user-name | The username of the account you're using to connect with. |
| password-secret | The password for *user-name*. GitHub passwords are defined in **Settings** under **Secrets**. Note that you can't retrieve a secret after it has been defined and saved. |
|app-id| The application id to authenticate with. This parameter is **required** when authenticating with Service Principal credentials|
|client-secret| The Client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal Credentials|
|tenant-id| The tenant-id when authenticating with app-id and client-secret|

## Build and release pipeline authoring

To learn about creating multiple-action workflows and pipelines through hands-on authoring by using GitHub Actions for Microsoft Power Platform, complete the [GitHub Actions for Microsoft Power Platform labs](https://aka.ms/poweractionslab).

More information: [About GitHub Actions](https://help.github.com/actions/getting-started-with-github-actions/about-github-actions)

### See Also

[GitHub Actions for Microsoft Power Platform](devops-github-actions.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]