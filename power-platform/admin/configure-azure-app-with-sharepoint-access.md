---
title: Configure Azure App with SharePoint access
description: Learn how to configure an Azure App for SharePoint access to enable API integration with Dynamics 365. Follow our step-by-step guide.
author: adrianorth
ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/14/2025
ms.subservice: admin
ms.author: aorth
search.audienceType:
  - admin
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:01/14/2025
---
# Configure Azure app for SharePoint access

Using the SharePoint Documents table in a Dynamics 365 environment outside of the documents grid in a model driven app requires an Azure application to grant access. Examples of this access include use within Power Automate or with Dataverse API calls. The setup uses the Power Platform Managed Identities with Azure to grant access.

Starting in March 2025, the current access is removed to enhance system protection. To ensure continued access, follow these steps to create an Azure application with the necessary SharePoint permissions, set up managed identities in Dataverse, and configure federated credentials.

## Create an Azure application with SharePoint permissions

Create an App registration with API permission to SharePoint. Learn more about registering an app and SharePoint access in [Azure Quickstart Register App](/entra/identity-platform/quickstart-register-app?tabs=certificate) and [SharePoint access via Azure AD App-Only](/sharepoint/dev/solution-guidance/security-apponly-azuread).

1. Open the [Azure portal](https://portal.azure.com/).

1. Under **Azure services**, select **App registrations**.

1. Select **New registration**.

1. Enter a **Name** for the application.

1. Under **Supported account types**, select **Accounts in this organizational directory only**.

    > [!NOTE]
    > Other types aren't supported at this time.

1. Select **Register** to create the **App registration**.

1. Note the **Application (client) ID** and **Directory (tenant) ID**:

   1. In the navigation list, select **Overview**.

   1. Under **Essentials**, copy the **Application (client) ID** and **Directory (tenant) ID** values for use in the next section.

1. In the navigation list, select **Manage** > **API permissions**.

1. Under **Configured permissions**, select **Add a permission** to open the **Request API permissions** panel.

   1. Select **SharePoint**.

   1. Under **What type of permissions does your application require?**, select **Application permissions**.

   1. Under **Select permissions**, select **Sites.FullControl.All**.

   1. Select **Add permissions** to create the SharePoint permission.

   1. Select **Grant admin consent for `<tenant name>`**.

## Create managed identities in Dataverse

Create managed identity records in Dataverse. Learn more about managed identities in [Setup Dataverse Managed Identities](/power-platform/admin/set-up-managed-identity).

### Add record in Managed Identities table

Insert a row into the [`managedidentities`](/power-apps/developer/data-platform/reference/entities/managedidentity) table using values from the following table.

| Table field | Value |
| --- | --- |
| `applicationid` | Use the **Application (client) ID** value from first section |
| `tenantid` | Use the **Directory (tenant) ID** value from first section |
| `managedidentityid` | Create new GUID |
| `credentialsource` | 2 |
| `subjectscope` | 1 |

An example using POST:

- Request:
`https://contoso.crm.dynamics.com/api/data/v9.0/managedidentities`
- Body:

  ```json
  {
  "applicationid": "<appId>",
  "managedidentityid": "<newGuid>",
  "credentialsource": 2,
  "subjectscope": 1,
  "tenantid": "<tenantId>"
  }
  ```

### Add record in SharePoint Managed Identities table

Insert a row into the `sharepointmanagedidentity` table using values from the following table.

| Table field | Value |
| --- | --- |
| `sharepointmanagedidentityid` | Create new GUID |
| `uniquename` | "msft_ppmiforsharepointauth" |
| `name` | "Managed Identity For SharePoint Auth" |
| `ManagedIdentity@odata.bind` | `/managedidentities(<managedidentityid>)` replacing `<managedidentityid>` with the value from the previous section  |

An example using POST:

- Request:
`https://contoso.crm.dynamics.com/api/data/v9.0/sharepointmanagedidentities`
- Body:

  ```json
  {
  "sharepointmanagedidentityid": "<newGuid>",
  "uniquename": "msft_ppmiforsharepointauth",
  "name": "Managed Identity For SharePoint Auth",
  "ManagedIdentity@odata.bind": "/managedidentities(<managedIdentityId>)"
  }
  ```

## Create federated credential

Create a federated credential for the app registration. Learn more about federated identity credentials in [Configure an application for federated identity credential](/entra/workload-id/workload-identity-federation-config-app-trust-managed-identity?tabs=microsoft-entra-admin-center).

1. Open the [Azure portal](https://portal.azure.com/).

1. Select **Microsoft Entra ID**.

1. In the navigation list, select **Manage** > **App registrations**.

1. In the applications list, select the app registration name created in the previous section.

1. In the navigation list, select **Manage** > **Certificates & secrets**.

1. Select the **Federated credentials** tab.

1. Select **Add credential**.

1. In the **Federated credential scenario** field, select **Other issuer**.

1. In the **Issuer** field, enter the Issuer URL:

   - Value format: `https://login.microsoftonline.com/<tenantId>/v2.0`
   - Replace `<tenantId>` with the **Directory (tenant) ID** GUID value from the previous section.

1. In the **Value** field, enter the Subject Identifier:

    - Value format: `/eid1/c/pub/t/v4j5cvGGr0GRqy180BHbRw/a/CQSGf3JJtEi27nY2ePL7UQ/Env/<orgid>/sharepointmanagedidentity/<sharepointmanagedidentityid>`
    - Replace `<orgid>` with the organization ID.
    - Replace `<sharepointmanagedidentityid>` with the GUID created earlier with the sharepointmanagedidentities record.

1. Select **Add** to create the credential.

By following these steps, you configure an Azure application with the necessary SharePoint permissions, set up managed identities in Dataverse, and configure federated credentials.
