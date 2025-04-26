---
title: Configure Azure app for SharePoint access
description: Learn how to configure an Azure app for SharePoint access to allow API integration with Dynamics 365. Follow our step-by-step guide.
author: adrianorth
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/25/2025
ms.subservice: admin
ms.author: aorth
ms.reviewer: sericks
search.audienceType:
  - admin
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:01/14/2025
contributors:
 - JimDaly
---
# Configure Azure app for SharePoint access

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

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

Create managed identity records in Dataverse. The instructions below use the Dataverse Web API. You may want to use [Insomnia to create these records](/power-apps/developer/data-platform/webapi/insomnia).  Learn more about managed identities in [Setup Dataverse Managed Identities](/power-platform/admin/set-up-managed-identity).

### Add record in Managed Identities table

Insert a row into the [`managedidentity`](/power-apps/developer/data-platform/reference/entities/managedidentity) table using values from the following table.

| Table field | Value | Description |
| --- | --- |--- |
| `applicationid` | A guid value |Use the **Application (client) ID** value from the [Create an Azure application with SharePoint permissions](#create-an-azure-application-with-sharepoint-permissions) section. |
| `tenantid` | A guid value | Use the **Directory (tenant) ID** value from the [Create an Azure application with SharePoint permissions](#create-an-azure-application-with-sharepoint-permissions) section. |
| `credentialsource` | 2 |This is an **IsManaged** source. |
| `subjectscope` | 1 | This is an **EnvironmentScope** scope.|


This example shows how to create a `managedidentity` record using the Dataverse Web API. More information: [Create a record using the Dataverse Web API](/power-apps/developer/data-platform/webapi/create-entity-web-api).

 **Request:**

```http
POST [Organization URI]/api/data/v9.2/managedidentities
Content-Type: application/json; charset=utf-8
OData-MaxVersion: 4.0
OData-Version: 4.0
Accept: application/json

{
   "applicationid": "<appId>",
   "credentialsource": 2,
   "subjectscope": 1,
   "tenantid": "<tenantId>"
}
```

 **Response:**

```http
HTTP/1.1 204 No Content
OData-Version: 4.0
OData-EntityId: [Organization URI]/api/data/v9.2/managedidentities(aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb)
```

`aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb` is the `managedidentityid` of the `managedidentity` record created in this example. You will need this in the following step.


### Add record in SharePoint Managed Identities table

Insert a row into the [`sharepointmanagedidentity`](/power-apps/developer/data-platform/reference/entities/sharepointmanagedidentity) table using values from the following table. 

| Table field | Value |
| --- | --- |
| `uniquename` | "msft_ppmiforsharepointauth" |
| `name` | "Managed Identity For SharePoint Auth" |
| `ManagedIdentity@odata.bind` | `/managedidentities(<managedidentityid>)` replacing `<managedidentityid>` with the value from the previous section  |


This example shows how to create a `sharepointmanagedidentity` record using the Dataverse Web API. More information: [Create a record using the Dataverse Web API](/power-apps/developer/data-platform/webapi/create-entity-web-api).

 **Request:**

```http
POST [Organization URI]/api/data/v9.2/sharepointmanagedidentities
Content-Type: application/json; charset=utf-8
OData-MaxVersion: 4.0
OData-Version: 4.0
Accept: application/json

{
   "uniquename": "msft_ppmiforsharepointauth",
   "name": "Managed Identity For SharePoint Auth",
   "ManagedIdentityId@odata.bind": "/managedidentities(<managedidentityid>)"
}
```

 **Response:**

```http
HTTP/1.1 204 No Content
OData-Version: 4.0
OData-EntityId: [Organization URI]/api/data/v9.2/sharepointmanagedidentities(bbbbbbbb-1111-2222-3333-cccccccccccc)
```

`bbbbbbbb-1111-2222-3333-cccccccccccc` is the `sharepointmanagedidentityid` of the `sharepointmanagedidentity` record created in this example.

## Create federated credential

Create a federated credential for the app registration. Learn more about federated identity credentials in [Configure an application for federated identity credential](/entra/workload-id/workload-identity-federation-config-app-trust-managed-identity?tabs=microsoft-entra-admin-center).

> [!NOTE]
> Federated identity credentials through Power Platform managed identity is generally available and fully supported for the SharePoint document integration. The Power Platform managed identity is used for many scenarios, but not all are generally available. However, this case is fully supported.

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

    - Value format: `/eid1/c/pub/t/<base64-encoded-tenantId>/a/<base64-encoded-appid>/Env/<orgid>/sharepointmanagedidentity/<sharepointmanagedidentityid>`
    - Replace `<base64-encoded-tenantId>` with the based64 encoded tenant ID.
    - Replace `<base64-encoded-appid>` with the base64 encoded app client ID.
    - Replace `<orgid>` with the organization ID.
    - Replace `<sharepointmanagedidentityid>` with the GUID created earlier with the sharepointmanagedidentities record.

   > [NOTE!]
   > Use the script in [Generate the subject identifer](#generate-the-subject-identifer) to generate the subject identifier value with the base64 encoded values.

1. Select **Add** to create the credential.

By following these steps, you configure an Azure application with the necessary SharePoint permissions, set up managed identities in Dataverse, and configure federated credentials.

## Generate the subject identifer

This script generates the subject identifier value based on values provided in JavaScript.

1. Open the Dynamics 365 application in a browser.

1. Open the browser tools to the console.

1. Copy the following JavaScript and set the value for the variable **sharePointManagedIdentityId**.
      
    ```JavaScript
    // Replace with the id for SharePoint Managed Identity that was created attribute name: sharepointmanagedidentityid.
    // Refer to the following documentation for configuring an aad app for SharePoint access:
    //     https://learn.microsoft.com/en-us/power-platform/admin/configure-azure-app-with-sharepoint-access
    // For the SharePoint Managed Identity creation, refer to the following documentation:
    //     https://learn.microsoft.com/en-us/power-platform/admin/configure-azure-app-with-sharepoint-access#add-record-in-sharepoint-managed-identities-table
    const sharePointManagedIdentityId = "";
 
    const prefixForFICIssuer = "https://login.microsoftonline.com/";
    const suffixForFICIssuer = "/v2.0";
    const prefixForFICSubject = "/eid1/c/pub";
    const tenantIdentifierForFICSubject = "/t/";
    const appIdentifierForFICSubject = "/a/";
    const environmentIdentifierForFICSubject = "/Env/";
    const sharePointManagedIdentityIdentifierForFICSubject = "/sharepointmanagedidentity/";
     
    // This is the AAD App Id to be used for Power Platform Managed Identity: 58e835ab-2e39-46a9-b797-accce6633447
    const powerPlatformManagedIdentityAppId = "58e835ab-2e39-46a9-b797-accce6633447";
     
    /**
     * Represents a request for retrieving the current organization.
     * @param {number} accessType - The access type (0 for Default, 1 for Internet, 2 for Intranet).
     */
    var RetrieveCurrentOrganizationRequest = function (accessType) {
        this.AccessType = accessType;
    };
 
    /**
     * Gets metadata for the request.
     * @returns {Object} The metadata for the request.
     */
    RetrieveCurrentOrganizationRequest.prototype.getMetadata = function() {
        return {
            boundParameter: null,
            parameterTypes: {
                "AccessType": {
                    "typeName": "Microsoft.Dynamics.CRM.EndpointAccessType",
                    "structuralProperty": 3,  // Enum Type
                    "enumProperties": [
                        { "name": "Default", "value": 0 },
                        { "name": "Internet", "value": 1 },
                        { "name": "Intranet", "value": 2 }
                    ]
                }
            },
            operationType: 1, // This is a function
            operationName: "RetrieveCurrentOrganization"
        };
    };
     
    /**
     * Encodes a GUID to a Base64 URL-safe string.
     *
     * @param {string} guid - The GUID to encode.
     * @returns {string} The Base64 URL-safe encoded string.
     * @see {@link https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/btoa}
     */
    function encodeToBase64Url(guid) {
        const buffer = [];
        const regex = /.{1,2}/g;
     
        guid.split('-').forEach((number, index) => {
            const bytesInChar = number.match(regex);
            if (index < 3) bytesInChar.reverse();
            bytesInChar.forEach(byte => buffer.push(parseInt(byte, 16)));
        });
     
        const base64String = btoa(String.fromCharCode.apply(null, new Uint8Array(buffer)));
     
        // Make the Base64 string URL-safe by replacing '+' with '-' and '/' with '_'
        // Remove any trailing '=' characters
        return base64String.slice(0, 22).replace(/=+$/, '').replace(/\+/g, '-').replace(/\//g, '_');
    }
     
    /**
     * Construct the issuer URL using the tenant ID.
     * This is needed for the issuer url in FIC configuration.
     * @param {string} tenantId - The tenant ID.
     * @returns {string} The constructed issuer URL.
     * @example
     * // Example for output
     * // https://login.microsoftonline.com/your-tenant-id/v2.0
     */
    function constructIssuerUrlForFIC(tenantId) {
        return `${prefixForFICIssuer}${tenantId}${suffixForFICIssuer}`;
    }
     
    /**
     * Constructs the subject url using the encoded tenant ID, encoded app ID, environment ID, and SharePoint managed identity ID.
     * This is needed for the subject url in FIC configuration.
     * @param {string} encodedTenantId - The encoded tenant ID.
     * @param {string} encodedAppId - The encoded app ID.
     * @param {string} environmentId - The environment ID.
     * @param {string} sharePointManagedIdentityId - The SharePoint managed identity ID.
     * @returns {string} The constructed subject string.
     * @example
     * // Example output: /eid1/c/pub/t/<EncodedTenantId>/a/<EncodedDV1PAppId>/Env/<EnvironmentId>/sharepointmanagedidentity/<sharePointManagedIdentityId>
     */
    function constructSubjectUrlForFIC(encodedTenantId, encodedAppId, environmentId, sharePointManagedIdentityId) {
        return `${prefixForFICSubject}${tenantIdentifierForFICSubject}${encodedTenantId}${appIdentifierForFICSubject}${encodedAppId}${environmentIdentifierForFICSubject}${environmentId}${sharePointManagedIdentityIdentifierForFICSubject}${sharePointManagedIdentityId}`;
    }
     
    (async () => {
        try {
            // Check if sharePointManagedIdentityId is null or undefined
            if (!sharePointManagedIdentityId) {
                console.error("SharePoint Managed Identity ID is null or undefined. Please ensure that the SharePoint Managed Identity ID is set.");
                return;
            }
     
            const accessType = 0;
            const retrieveCurrentOrganizationRequest = new RetrieveCurrentOrganizationRequest(accessType);
           
            // Execute the request to retrieve the current organization details
            // https://docs.microsoft.com/en-us/powerapps/developer/model-driven-apps/clientapi/reference/xrm-webapi/online/execute
            // https://learn.microsoft.com/en-us/power-apps/developer/data-platform/webapi/web-api-functions-actions-sample#section-4-unbound-function-retrievecurrentorganization
            const response = await Xrm.WebApi.online.execute(retrieveCurrentOrganizationRequest);
            const result = await response.json();
     
            if (result.Detail) {
                const { EnvironmentId: environmentId, TenantId: tenantId } = result.Detail;
     
                const encodedTenantId = encodeToBase64Url(tenantId);
                const encodedPowerPlatformManagedIdentityAppId = encodeToBase64Url(powerPlatformManagedIdentityAppId);
                const issuerUrlForFederatedCredentialConfig = constructIssuerUrlForFIC(tenantId);
                const subjectUrlForFederatedCredentialConfig = constructSubjectUrlForFIC(encodedTenantId, encodedPowerPlatformManagedIdentityAppId,
                     environmentId, sharePointManagedIdentityId);
     
                console.log(`SharePoint Managed Identity ID: ${sharePointManagedIdentityId},
                    Tenant ID: ${tenantId},
                    Encoded Tenant ID: ${encodedTenantId},
                    Power Platform Managed Identity App ID: ${powerPlatformManagedIdentityAppId},
                    Encoded App ID: ${encodedPowerPlatformManagedIdentityAppId},
                    Issuer URL for Federated Credential Configuration: ${issuerUrlForFederatedCredentialConfig},
                    Subject URL for Federated Credential Configuration: ${subjectUrlForFederatedCredentialConfig}`);
            } else {
                console.error("RetrieveCurrentOrganization response is missing detail.");
            }
        } catch (error) {
            console.error(`Error executing request: ${error.message}`);
        }
    })();
    ```

1. Paste into the console to execute.

1. Copy the **subject identifier** and paste into the **Value** field of the **Add credential**.
