---
title: Control client app access to environment
description: You can protect against data exfiltration by managing and controlling what apps can run in their Dataverse environment.
author: paulliew
ms.author: paulliew
ms.reviewer: sericks
ms.component: pa-admin
ms.subservice: admin
ms.topic: how-to
ms.date: 4/1/2024
search.audienceType: 
  - admin
---

# Control client app access to environment

You can protect against data exfiltration by managing and controlling what apps can run in their Dataverse environment. Data exfiltration safeguards prevent sensitive information from unauthorized removal or extraction from your environment. This safeguard allows a business to maintain business continuity, comply with regulatory requirements, and keep up with competitive advantage.

When this capability is enabled, you can configure which apps are allowed or blocked in your environment. Malicious users can’t create or use unapproved apps to export sensitive data out of the environment.

## How does app access control work?

App access control is performed at the Dataverse Authentication layer—[Authenticating to Power Platform services](/security/authenticate-services.md). The Dataverse authentication validates the client app ID in the user’s token against a list of allowed and blocked apps as configured in the environment.

The authentication either grants or denies the user’s app access to the environment.  

App access requests can be authenticated as follows:

1. **User context**  
   The user logs into the system, such as Dynamics 365 Sales, with their credentials.
2. **Application context with user impersonation**  
   The user logs into a first-party Microsoft app, and the app makes a call to Dataverse with its application token on-behalf-of the user. [Impersonate another user using the Web API](/power-apps/developer/data-platform/webapi/impersonate-another-user-web-api) (Microsoft Dataverse).  
3. **First-party app with service-to-service call (application context)**  
   A first-party Microsoft app makes a call to Dataverse, using its application token. These first-party apps are registered apps that provide internal services, like email sync, which typically run in the background without any user interactions.
4. **Third-party apps registered in your Azure portal’s app registration**  
   Your custom app authenticates, using your Azure app registration’s certificate or user-token.  

Client app access control can be applied to the user and application context with user impersonation authentication:

1. **User context with user token**
   1. For all user token requests, we validate if the application ID used is part of allowed or blocked lists.
   1. To allow or block session authentication used by a Unified Interface (UCI), the user must configure the `00000007-0000-0000-c000-000000000000` (Dataverse) app.
   1. Features restrict access control for public client for first party and [partner apps](/power-apps/developer/data-platform/walkthrough-register-app-azure-active-directory#public-client-app-registration). We don’t recommend allowing a public client unless you need it needed temporarily.
1. **Application context with [user impersonation](/power-apps/developer/data-platform/webapi/impersonate-another-user-web-api)**
1. **Impersonation using a first-party app**
   1. For scenarios like Power Automate where a service-to-service application token is used with a user impersonation, we validate if the corresponding application ID is allowed or blocked.
   1. For other scenarios where a user impersonation isn't used, no validations are currently being performed for service-to-service tokens.

Client app access control isn’t applied to:

- First-party apps service-to-service calls (application context)
- Partner apps service-to-service calls

  To block these apps, make them inactive in the Power Platform admin center—Manage application users in the Power Platform admin center.

## Prerequisites

- Environment must be a managed environment—[Managed environment overview](managed-environment-overview.md).
- Enable auditing in the environment with system admin permissions.
- Set organization settings with system admin permissions (requires system administrator security role).

## Enable auditing in the environment

In the Power Platform Admin Center:

1. Go to **Environments** -> **YourEnvironment** -> **Settings** -> **Audit settings**.
1. Check the box for **Start Auditing** in the **Auditing** section.

## Enable app access control (preview only)

A feature flag in the organization settings can enable access control.

There are three settings:

1. `Applicationbasedaccesscontrolmode = 0`  
   Disables the client app access control (default).

1. `Applicationbasedaccesscontrolmode = 1`  
   Enables the client app access control (app access deny is enforced).

1. `Applicationbasedaccesscontrolmode = 2`  
   Enables the client app access control in audit mode (app access deny isn’t enforced).

During preview, you can use the Insomnia tool to update feature settings—[Use Insomnia with Dataverse Web API](/power-apps/developer/data-platform/webapi/insomnia).

1. [Install Insomnia](/power-apps/developer/data-platform/webapi/insomnia.md#install-insomnia)
1. [Configure the base environment](/power-apps/developer/data-platform/webapi/insomnia.md#configure-the-base-environment).
   > [!NOTE]
   > This environment uses the Dataverse provided **ClientID** `51f81489-12ee-4a9e-aaae-a2591f45987d` to authenticate and obtain the user token.
1. [Configure requests](/power-apps/developer/data-platform/webapi/insomnia.md#configure-requests)

   **Retrieve the feature settings (see query parameters)**:

   ```http
   GET: https://<your-org-url> /api/data/v9.2/organizations(<orgid>)?%24select=applicationbasedaccesscontrolmode,%20allowedapplicationsfordvaccess,%20blockedapplicationsfordvaccess 
   {$select: applicationbasedaccesscontrolmode, allowedapplicationsfordvaccess, blockedapplicationsfordvaccess}
   ```

   **Use Patch with parameters to set the feature settings**:

   ```http
   POST: https://<your-org-url> /api/data/v9.2/organizations(<orgid>)
   {"applicationbasedaccesscontrolmode": 2, "allowedapplicationsfordvaccess": "00000007-0000-0000-c000-000000000000", "blockedapplicationsfordvaccess": null}
   ```

   **Get the list of PowerPlatform apps that can make user impersonation calls**.

   These apps are preauthorized to run in a Dataverse environment:

   1. All first-party apps preauthorized to acquire on-behalf-of tokens—[Microsoft identity platform and OAuth2.0 On-Behalf-Of flow](/entra/identity-platform/v2-oauth2-on-behalf-of-flow)
   1. Lists for [special system and application users](system-application-users.md)
   1. All legacy apps that can dynamically acquire on-behalf-of tokens
   1. All apps with `prvActOnBehalfOfAnotherUser` privilege, using a header to impersonate users: [Impersonate another user](/dynamics365/customerengagement/on-premises/developer/org-service/impersonate-another-user)

      ```http
      POST: {{YourOrgURL}}api/data/v9.0/RetrieveAppsWithDelegatedAcessPermissions *  
      Body: { "cloud":0 }
      ```

      Value of `cloud` variable:  
      0 - Prod  
      1 - Gallatin  
      2 - Arlington  
      3 - PPE

Use the `RetrieveAppsWithDelegatedAccessPermissions` API after April 26, 2024.

## Enable audit mode

We recommend that you enable the audit mode first for at least a week to get the list of apps that your users are running in the environment.

Using this audit log list, you can determine which apps you want to allow or block.

Make a **Patch** request with parameters.

```http
POST: https://<orgurl> /api/data/v9.2/organizations(<orgid>) 
{"applicationbasedaccesscontrolmode": 2, "allowedapplicationsfordvaccess": "<appId1>,<appId2>,<appId3>", "blockedapplicationsfordvaccess": null} 
```

> [!IMPORTANT]
> You’re required to use at least one: `allowedapplicationsfordvaccess` or `blockedapplicationsfordvaccess`.
>
> For example: `allowedapplicationsfordcaccess: "00000007-0000-0000-c000-000000000000”`
>
> The example ID is a Dataverse app ID.

> [!NOTE]
> It takes about 15 minutes after updating the configuration settings for them to take effect.

## Enable app access enforcement mode

Enabling this mode starts blocking apps that aren’t allowed or allows approved apps only. If you use both options `allowedapplicationsfordvaccess` and `blockedapplicationfordvaccess`, the authentication process ignores the `blockedapplicationfordvaccess` list.

Make a **Patch** request with parameters.

```http
POST: https://<your-org-url> /api/data/v9.2/organizations(<orgid>) 
{"applicationbasedaccesscontrolmode": 1, "allowedapplicationsfordvaccess": "<appId1>,<appId2>,<appId3>", "blockedapplicationsfordvaccess": null}
```

Use `applicationbasedaccesscontrolmode = '1'` for enabled mode.

> [!IMPORTANT]
> You’re required to use at least one: `allowedapplicationsfordvaccess` or `blockedapplicationsfordvaccess`.
>
> For example: `allowedapplicationsfordcaccess: "00000007-0000-0000-c000-000000000000”`
>
> The example ID is a Dataverse app ID.

> [!NOTE]
> It takes about 15 minutes after updating the configuration settings for them to take effect.

1. `ApplicationBasedAccessControlMode`
   You have three options: disabled: 0, enabled: 1, audit only: 2.
   This attribute controls if the feature is disabled, enabled, or enabled in audit only mode.

1. `AllowedApplicationsForDVAccess`
   - nvarchar
   - maximum character length = 20000  
     You can have about 500 comma-separated and hyphenated application IDs.

1. `BlockedApplicationsForDVAccess`  
   - nvarchar
   - maximum character length = 4000  
     You can have about 108 comma-separated and hyphenated application IDs.

1. Use either `AllowedApplicationsForDVAccess` or `BlockedApplicationsForDVAccess`.

1. If `AllowedApplicationsForDVAcces`s is configured, only the user token requests from configured applications are allowed and all others are blocked.  
   This flag overrides `blockedlist`.

1. If `BlockedApplicationsforDVAccess` is configured, requests from configured applications are blocked and all others are allowed.

## Commonly used apps you might want to follow

| Application ID | Application Name |
|----------------|------------------|
| 00000007-0000-0000-c000-000000000000 | Dataverse |
| 065d9450-1e87-434e-ac2f-69af271549ed | PowerPlatformAdminCenter |
| 07ce06e6-4ae9-4466-bca4-2984fa04d057 | Microsoft Dynamics File Storage |
| 1884bdbf-452a-4a11-9c76-afdbdb1b3768 | RelevanceSearch |
| 3570e63c-5acf-4f3f-9f15-a49faa5120d3| PowerAppsCustomerManagementPlaneBackend |
| 3e62f81e-590b-425b-9531-cad6683656cf | PowerApps - apps.powerapps.com |
| 44a02aaa-7145-4925-9dcd-79e6e1b94eff |MicrosoftDynamics365OfficeAppsIntegration |
| 4ade18ba-d41e-45d6-a563-97c67fc0be15 | Microsoft Dynamics NRD Service |
| 4e291c71-d680-4d0e-9640-0a3358e31177 | PowerApps |
| 546068c3-99b1-4890-8e93-c8aeadcfe56a | Common Data Service - Azure Data Lake Storage |
| 5bdbebb2-509f-458e-b56e-d0b934dfdafa | DynamicsInstaller |
| 60216f25-dbae-452b-83ae-6224158ce95e | Microsoft Dynamics CRM App for Outlook |
| 61d02d70-ab6c-4569-be48-787ea2cda65d | Dynamics 365 Analytics |
| 6204c1d1-4712-4c46-a7d9-3ed63d992682 | Microsoft Flow Portal |
| 637fcc9f-4a9b-4aaa-8713-a2a3cfda1505 | Dynamics CRM Online Administration |
| 6eb29b24-9d89-4f26-bf2f-9a84ed2499b8 | Common Data Service Global Discovery Service |
| 730d33da-0894-409f-a907-c577151719c5 | Flow-RP |
| 7df0a125-d3be-4c96-aa54-591f83ff541c | Microsoft Flow Service |
| 7f15f9d9-cad0-44f1-bbba-d36650e07765 | Azure Synapse Link for Dataverse |
| 84e37c07-7362-4d9f-b4b1-09be02be0195 | DAMS PROD CL |
| 8d605dfc-1a04-4da6-9be2-8426724af3f3 | Power Platform Authorization Service PROD |
| 978b42f5-e03a-4695-b8df-454959d032c8 | BAP |
| 99ff962b-6252-4b98-8478-0c65a3ea1925 | InsightsAppsPlatform |
| a8f7a65c-f5ba-4859-b2d6-df772c264e9d | make.powerapps.com |
| a94f9c62-97fe-4d19-b06d-472bed8d2bcf | Azure SQL Database and Data Warehouse |
| aeb01831-b358-4750-92ce-722e4f3ea7e8 | BizQA for CDS |
| b5faaec4-04c9-45e6-990a-093ed6d02c94 | Dynamic 365 Sales Insights Connector for Power Automate |
| b6fb6bd6-f0fb-4a60-beb1-4e50afd0eaa9 | PowerAppsDataPlaneBackend |
| be5f0473-6b57-40f8-b0a9-b3054b41b99e | IBuilder_StructuredML_Prod_CDS |
| c6a9976b-9beb-43b8-9aea-52a55ba8e39b | Flow-CDSNativeConnectorGermany |
| c92229fa-e4e7-47fc-81a8-01386459c021 | CDSUserManagement |
| e548fb5c-c385-41a6-a31d-6dbc2f0ca8a3 | JobsServiceProd |
| ef32e2a3-262a-44e5-a270-4dfb7b6d0bb2 | AiBuilder PAIO-CDS Prod |

## Apps you might want to block

| Application ID | Application Name |
|----------------|------------------|
| a672d62c-fc7b-4e81-a576-e60dc46e951d | Excel client |
| d3590ed6-52b3-4102-aeff-aad2292ab01c | Microsoft Access client |
| 51f81489-12ee-4a9e-aaae-a2591f45987d | xRm Tool kit |
| 2ad88395-b77d-4561-9441-d0e40824f9bc | PowerShell |
| a672d62c-fc7b-4e81-a576-e60dc46e951d | Power BI |

## App denied user error

When users try to run an app that isn't allowed, they see an error message.

```error
Access to Dataverse API is restricted for this application Id: `xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`. Please contact your administator for more information.
```

## Audit only mode

- This mode allows you to identify apps to allow or block.
- Only telemetry is logged for failures and requests aren’t rejected.
- The **Audit settings** for the environment must be enabled, including the **Log access** option.

## Retrieve app access audit log

1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com/home) as a System Administrator.
1. Select **Environments**, and then select the environment with the enabled Auditing feature.
1. Select **Settings**.
1. Select **Audit and logs** and choose **Audit summary view**.
1. Select **Enable/Disable Filters** and check **ApplicationBasedAccessDenied** and **ApplicationBasedAccessAllowed**.

   :::image type="content" source="media/control-client-app-access-to-environment/enable-disable-filters.png" alt-text="Screenshot that shows where the ApplicationBasedAccessDenied and ApplicationBasedAccessAllowed checkboxes are located.":::

### Recommended steps

1. Enable auditing in the environment and set the feature setting to **Audit** mode. Try this setting first in a nonproduction environment.
1. Review the audit log for the apps that are running in the environment.
1. Repeat these steps in your UAT/Production environment.
1. Confirm the list of apps that you want to allow to run in the environment.
1. Enable the feature setting to **enforce**.
1. Add the **XRMToolKit** client app temporarily to the allowed list of the **Insomnia** tool to update the application list. Remove **XRMToolKit** from the list when you're done.  

## See also

Application IDs of commonly used Microsoft applications:

[Verify first-party Microsoft applications in sign-in reports](/entra-id/governance/verify-first-party-apps-sign-in.md#application-ids-of-commonly-used-microsoft-applications)
