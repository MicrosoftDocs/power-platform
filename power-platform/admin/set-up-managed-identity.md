---
title: Set up Managed Identity for Power Platform
description: Learn how to set up Power Platform Managed Identity.
author: ritesp
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/18/2024
ms.subservice: admin
ms.author: ritesp
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Set up Managed Identity for Power Platform
Power Platform Managed Identity allows Dataverse plug-ins to connect with Azure resources supporting Managed Identity without the need of credentials. This article helps you set up Managed Identity in your Power Platform environments.
> [!NOTE]
> To enable Virtual Network support for Power Platform, environments must be [Managed Environments](managed-environment-overview.md).

## Prerequisites

- An azure subscription with access to provision User Assigned Managed Identity (UAMI) or Application Registration
- Plug-ins tools
    - IDE like Visual Studio to build plug-in
    - [Plug-in registration tool](https://learn.microsoft.com/en-us/power-apps/developer/data-platform/download-tools-nuget)
    - [SignTool.exe (Sign Tool)](https://learn.microsoft.com/en-us/dotnet/framework/tools/signtool-exe) to sign the plug-in assembly.
    - [Power Platform CLI](https://learn.microsoft.com/en-us/power-platform/developer/cli/introduction?tabs=windows)
- A valid certificate to sign the Plug-in's assembly or package.

## Set up Managed Identity
To configure Power Platform Managed Identity for Dataverse plug-in's, you need to execute following steps
1. Create a new app registration or user assigned managed identity
2. Configure federated identity credentials
3. Create and register Dataverse Plug-ins or Dataverse plug-ins package
    - Dataverse Plug-ins
        - Build plug-in assembly
        - Register the plug-in
    - Create and register a Dataverse plug-ins package
4. Create managed identity record in Dataverse
5. Grant access to the azure resource(s) to application or user assigned managed identity (UAMI).
6. Validate the plug-in integration
## Create a new app registration or user assigned managed identity
You can create either User Assigned Managed Identity or Application in Microsoft Entra ID based on following scenarios.
1. If you want to have app Identity associated with plug-in connecting to the Azure resources  like Azure Key Vault, use [Application registration](https://learn.microsoft.com/en-us/entra/identity-platform/howto-create-service-principal-portal). With App Identity, you will be able to apply azure policies on the plug-in accessing azure resources.
2. If you want to just have service principle to access the Azure resources like Azure Key Vault, you can provision [user assigned managed identity](https://learn.microsoft.com/en-us/entra/identity/managed-identities-azure-resources/how-manage-user-assigned-managed-identities?pivots=identity-mi-methods-azp#create-a-user-assigned-managed-identity)

*Output from this step*: Capture following ID’s, it will be used in later steps.
  - Application ID
  - Tenant ID
## Configure federated identity credentials
To configure Managed Identity, you need to open the User Assigned Managed Identity/Microsoft Entra ID application on the Azure Portal that you have created in previous step.
- Browse to [Azure Portal](https://portal.azure.com/)
- Navigate to Microsoft Entra ID
- Click on App Registration
- Open the App you created in Step #1
- Navigate to Certificates & Secrets
- Click on “Federated credential” tab and click “Add credential”.
- Select issuer as “Other issuer”. 
- Fill up the following information:
    - **Issuer**: The URL of the token issuer. Format will be like
              `https://[env id prefix].[env id suffix].enviornment.api.powerplatform.com/sts`     
              [env id prefix] - Environment Id except for last two characters
              [env id suffix] - Last 2 characters of environment id
      
      Example: `https://92e1c10d0b34e28ba4a87e3630f46a.06.environment.api.powerplatform.com/sts`
    - **Subject identifier**: If a self-signed certificate is used for signing the assembly use, Only recommended for non-production use cases.
*component:pluginassembly,thumbprint:<<Thumbprint>>,environment:<<EnvironmentId>>*

![alt text](FIC.image)

## Create and register Dataverse Plug-ins or Dataverse plug-ins package
### For Dataverse Plug-ins
#### Build plug-in assembly
- [Create a plug-in](https://learn.microsoft.com/en-us/power-apps/developer/data-platform/write-plug-in?tabs=pluginbase) using Visual Studio. While building plug-in use Tenant ID from Step #1 and scopes as organization URL like https://{OrgName}.crm*.dymanics.com/.default or even more granular scopes.
- Use [IManagedIdentityService](https://learn.microsoft.com/en-us/dotnet/api/microsoft.xrm.sdk.imanagedidentityservice?view=dataverse-sdk-latest), acquire Token method to request for token with given scope.
- string AcquireToken(IEnumerable<string> scopes); The method accepts a collection of scopes and return the access token. 
- Sign the assembly with a certificate. Refer this article - https://learn.microsoft.com/en-us/dotnet/framework/tools/signtool-exe.
“Self-signed certificate should be used only for testing and is not supported option for use in Production scenarios.”
#### Register the plug-in
- Install the plug-in registration tool if you don’t have it on your machine by using the article - https://learn.microsoft.com/en-us/power-apps/developer/data-platform/download-tools-nuget
- Register the plug-in using the article - https://learn.microsoft.com/en-us/power-apps/developer/data-platform/tutorial-write-plug-in#register-plug-in
### For Dataverse Plug-in package
#### Create and register a plug-in package
- You can follow this article https://learn.microsoft.com/en-us/power-platform/developer/howto/cli-create-package  to create and register a plug-in package.
- Before registering the plug-in package using this step https://learn.microsoft.com/en-us/power-platform/developer/howto/cli-create-package, ensure that you sign the plug-in package by following below instructions
    - Create a new certificate or use an existing certificate.
    - Run the following command to sign the plug-in package with the certificate.
        nuget sign <local path-to-package> -CertificatePath <local path-to-certificate> -CertificatePassword <certificate-password> 
- Register the plug-in package using this article  https://learn.microsoft.com/en-us/power-platform/developer/howto/cli-create-package

## Create managed identity record in Dataverse
To provision managed identity record in Dataverse,
1. You need to make post call to following URL using [Insomia](https://insomnia.rest/download) or any other tool of your choice.
    `https://<<orgUrl>>https://aurorabapenv0bc9e.crmtest.dynamics.com/api/data/v9.0/managedidentities`

    Ensure that Credentialsource is set to **2** in the payload, SubjectScope is set to **1** for environment specific scenarios
 
     ``` Sample payload.
      {
      "applicationid":"<<appId>>",
       "managedidentityid":"<<anyGuid>>",
       "credentialsource":2,
      “subjectscope”:1,
       "tenantid":"<<tenantId>>"
      }
2. Make a patch call to bind plug-in assembly Id or plug-in package Id with the Managed Identity record that is created through post call in step **#1**.
  **Plug-in assembly**:
                   `PATCH https:// <<orgUrl>>/api/data/v9.0/pluginassemblies(<<PluginAssemblyId>>)`
                    *Replace: orgUrl and PluginAssemblyId*
      ```Sample Payload:
      {
       "managedidentityid@odata.bind": "/managedidentities(<<ManagedIdentityGuid>>)"
      }

  **Plug-in package**:  
                  `PATCH https://<<orgUrl>>/api/data/v9.0/pluginpackages(<<PluginPackageId>>) `
                  *Replace the orgUrl and PluginpackageId*
        Sample Payload:
        `{ 
          "managedidentityid@odata.bind": "/managedidentities(<<ManagedIdentityGuid>>)" 
        }`


## Grant access to the azure resource(s) to Application or user assigned managed Identity
If you need to give access to application ID to access azure resource such as Azure Key Vault, you need to grant access to application or user assigned managed identity to that resource.

## Validate the Plug-in integration
Your plug-in or package can securely request access to Azure resources that support Managed Identity, eliminating the need for separate credentials.












