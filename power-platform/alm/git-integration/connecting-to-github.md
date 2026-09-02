---
title: "Connect Dataverse Git integration to GitHub"
description: "Learn how to configure Dataverse Git integration with GitHub by creating a GitHub App, storing the private key in Azure Key Vault, and connecting from the source control experience."
author: caburk
ms.subservice: alm
ms.author: caburk
ms.date: 09/01/2026
ms.custom:
ms.topic: how-to
ms.reviewer: matp
ms.collection:
---
# Connect to GitHub (preview)

[!INCLUDE [cc-preview-features-top-note](../../includes/cc-preview-features-top-note.md)]

To connect a Dataverse environment or solution to GitHub, create a GitHub app, store the app private key in Azure Key Vault, create a Power Platform GitHub connection, and then connect from the source control experience in your solution.

You can connect to GitHub integration preview from the solutions experience at https://make.preview.powerapps.com, https://make.preview.powerautomate.com, https://copilotstudio.preview.microsoft.com, or https://make.preview.powerpages.microsoft.com.

> [!IMPORTANT]
>
> - This is a preview feature.
> - [!INCLUDE [cc-preview-features-definition](../../includes/cc-preview-features-definition.md)]

## Prerequisites

- Dataverse Git integration is a feature of [managed environments](/power-platform/admin/managed-environment-overview). Development and target environments must be enabled as managed environments.
- A GitHub account with organization admin access.
- An Azure subscription with permission to create Key Vault resources. The Key Vault must be in the same Microsoft Entra tenant as the Dataverse environment.
- You need a Dataverse environment where you have the System Administrator security role.
- A custom unmanaged solution that you want to connect to source control. Create one if you don't have one yet.

## Create a GitHub app

1. Open GitHub in your browser. Select your profile picture in the upper-right corner, and then go to **Settings** > **Developer settings**.
1. Select **New GitHub App**.

   You can also go directly to the [GitHub app registration page](https://github.com/settings/apps/new) to create a new GitHub App.

1. On the **Create GitHub App** page, enter a unique name for your GitHub app in the **GitHub App name** field. For example, enter `MyOrgGitHubIntegrationApp`.
1. Fill in the **Homepage URL** field. You can use your organization's website or the GitHub repository URL.
1. If you don't need webhook notifications, clear the **Active** checkbox in the **Webhook** section.

   :::image type="content" source="media/github-create-app.png" alt-text="Screenshot of the GitHub create app page with the GitHub app name field." lightbox="media/github-create-app.png":::

## Configure repository permissions

1. Scroll down to the **Permissions** section.
1. Expand **Repository permissions**, and then set **Contents** to **Read and write**. This permission allows the app to read and write repository content for source control integration.

   :::image type="content" source="media/github-repository-permissions.png" alt-text="Screenshot of repository permissions for a GitHub app." lightbox="media/github-repository-permissions.png":::

1. Scroll down and select **Create GitHub App**.
1. On the **GitHub App settings** page, copy the **Client ID**. You need this value when you register the app configuration in Dataverse. The **Client ID** uses a format such as `Iv23liBWoH6sf7xGrRe9`.
1. Generate and download a private key from the GitHub app settings page. Store the private key in Azure Key Vault in a later step.

   :::image type="content" source="media/github-generate-private-key.png" alt-text="Screenshot of the GitHub app settings page with the generate private key option." lightbox="media/github-generate-private-key.png":::

## Install the GitHub App on the target repository

1. From the GitHub app settings page, select **Install App** in the left pane.
1. Select **Install** next to the account or organization that owns the target repository.

   If the target repository belongs to a GitHub organization, the organization administrator might need to approve the app installation. The admin receives a notification to review and approve the request.

   :::image type="content" source="media/github-install-app.png" alt-text="Screenshot of the GitHub app installation page." lightbox="media/github-install-app.png":::

1. Choose whether to give the app access to **All repositories** or **Only select repositories**. For security best practices, select only the specific repositories needed for source control integration.
1. Select **Install** to complete the installation.

   :::image type="content" source="media/github-select-repositories.png" alt-text="Screenshot of selecting repositories for GitHub app access." lightbox="media/github-select-repositories.png":::

## Configure Azure Key Vault

1. Open the Azure portal and go to your key vault resource. If you don't have one, create a new key vault first.
1. In the **Key Vault** pane, select **Keys** in the left navigation.

   :::image type="content" source="media/azure-key-vault-keys.png" alt-text="Screenshot of the Azure Key Vault keys navigation item." lightbox="media/azure-key-vault-keys.png":::

1. Select **Generate/Import**.
1. In the **Options** dropdown, select **Import**.
1. Enter a name for the key, such as `demoGitHubKey`, and then upload the `.pem` file you downloaded from GitHub.
1. Select **Create** to import the key.

   :::image type="content" source="media/azure-key-vault-import-key.png" alt-text="Screenshot of importing a key into Azure Key Vault." lightbox="media/azure-key-vault-import-key.png":::

> [!NOTE]
> When you connect subsequent Dataverse environments to GitHub, you don't need to repeat the preceding GitHub app and Azure Key Vault setup steps. You can reuse the same GitHub app across multiple repositories and the same Azure Key Vault configuration across multiple environments.

## Create a GitHub connection

Create an OAuth connection by using your personal GitHub account. This connection verifies that you have admin access to the target repository during setup. At runtime, the GitHub app handles communication with GitHub, so individual users don't need to create GitHub connections.

> [!NOTE]
> Alternatively, you can use a GitHub personal access token (PAT) instead of a GitHub connection. Use a PAT when virtual network (VNET) support is enabled for the Dataverse environment or when GitHub connections can't be created.

1. Go to [Power Apps preview](https://make.preview.powerapps.com/), and then select **Connections**.
1. Select **New connection**.
1. Search for and select the **GitHub** standard connector.

   :::image type="content" source="media/power-apps-new-github-connection.png" alt-text="Screenshot of creating a new GitHub connection in Power Apps." lightbox="media/power-apps-new-github-connection.png":::

1. Sign in by using your GitHub account and grant the requested access.

   :::image type="content" source="media/power-apps-github-sign-in.png" alt-text="Screenshot of the GitHub sign-in prompt for a Power Apps connection." lightbox="media/power-apps-github-sign-in.png":::

The GitHub account you sign in with must have admin access to the target repository. The OAuth connection verifies your permissions.

After you create the connection, open it. Note the connection ID from the URL in your browser address bar. You need this value when you configure the Git connection.

The connection ID appears in the URL when you view the connection details, as shown in the following example:

```text
https://make.preview.powerapps.com/.../connections/shared_github/{connectionId}/details
```

:::image type="content" source="media/power-apps-github-connection-id.png" alt-text="Screenshot of a Power Apps GitHub connection details page showing the connection ID in the URL." lightbox="media/power-apps-github-connection-id.png":::

### Approve OAuth app access for your organization

If your GitHub organization has non-Microsoft application access restrictions enabled, an organization administrator must approve the OAuth app used by the Power Apps GitHub connector. Check your organization's settings at **Organization Settings** > **Third-party access**.

:::image type="content" source="media/github-oauth-app-access.png" alt-text="Screenshot of GitHub organization third-party application access settings." lightbox="media/github-oauth-app-access.png":::

For more information, see [Enabling OAuth app access restrictions](https://docs.github.com/en/organizations/managing-oauth-access-to-your-organizations-data/enabling-oauth-app-access-restrictions-for-your-organization) and [Approving OAuth apps for your organization](https://docs.github.com/en/organizations/managing-oauth-access-to-your-organizations-data/approving-oauth-apps-for-your-organization).

## Connect to GitHub from a solution

1. Go to [Power Apps preview](https://make.preview.powerapps.com/), then create a new unmanaged solution or select an existing custom unmanaged solution.
1. On the **Source control** page, select **Connect**.
1. In the **Connect to Git** pane, select **GitHub**.

   :::image type="content" source="media/power-apps-select-git-provider.png" alt-text="Screenshot of the Connect to Git pane with Azure DevOps and GitHub provider options." lightbox="media/power-apps-select-git-provider.png":::

1. Enter the GitHub organization, repository, branch, Git folder, and connection information from the previous setup steps.

   :::image type="content" source="media/power-apps-github-connection-details.png" alt-text="Screenshot of GitHub connection details in the Connect to Git pane." lightbox="media/power-apps-github-connection-details.png":::

1. Create a GitHub app configuration and enter the GitHub app client ID, Key Vault URI, and key name from the previous setup steps.

   :::image type="content" source="media/power-apps-github-app-configuration.png" alt-text="Screenshot of GitHub App configuration details in the Connect to Git pane." lightbox="media/power-apps-github-app-configuration.png":::

## Configure Key Vault role-based access control (RBAC)

1. In the Azure portal, go to your Key Vault resource.
1. Select **Access control (IAM)**, select **Add**, and then select **Add role assignment**.
1. Search for and select the **Key Vault Crypto User** role.

   :::image type="content" source="media/key-vault-add-role-assignment.png" alt-text="Screenshot of selecting the Key Vault Crypto User role in Azure role assignment." lightbox="media/key-vault-add-role-assignment.png":::

1. Select **Select members**, and then search for the Dataverse managed identity associated with your GitHub app configuration. The managed identity name uses the following format:

   ```text
   PPMI-githubappconfigmanagedidentity-{GUID}
   ```

1. Select the managed identity, and then select **Review + assign**.

   :::image type="content" source="media/key-vault-select-managed-identity.png" alt-text="Screenshot of selecting the Dataverse managed identity for a Key Vault role assignment." lightbox="media/key-vault-select-managed-identity.png":::

If the managed identity doesn't appear, go to the Dataverse environment **Settings** > **System Jobs** and check for errors related to GitHub app configuration creation. The registration is created asynchronously and might take a moment to appear.

After the role assignment is complete, the Dataverse managed identity has permission to use the GitHub key in this Key Vault.

## Verify the connection and test a commit

Open an unmanaged solution from the **Solutions** area. If you don't have one yet, create a new solution first. Source control integration only works with unmanaged solutions.

Go to the **Source control** page and select **Git connection**. Verify that the connection shows **GitHub** as the provider and that the organization, repository, branch, and folder details are correct.

To verify the end-to-end flow, select **Commit** to push your solution to the connected GitHub repository.

If the commit succeeds, the integration is operational.

## Connect by using code

You can use the Dataverse Web API or PowerShell to connect to GitHub programmatically instead of using the user interface. For more information, see [Connect to a GitHub repository](git-api.md#connect-to-a-github-repository).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
