---
title: Control which apps are allowed in your environment
description: You can protect against data exfiltration by managing and controlling what apps can run in your Dataverse environment.
author: paulliew
ms.author: paulliew
ms.reviewer: sericks
ms.component: pa-admin
ms.custom: NewPPAC
ms.subservice: admin
ms.topic: how-to
ms.date: 07/21/2025
search.audienceType: 
  - admin
---

# Control which apps are allowed in your environment

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Protect against data exfiltration by controlling which apps can run in your Dataverse environment. These safeguards prevent unauthorized removal of sensitive information, helping your business maintain continuity and comply with regulations.

Configure which apps are allowed or blocked in your environment. This prevents malicious users from using unapproved apps to export sensitive data.

## How does app access control work?

App access control is performed at the Dataverse authentication layer. Learn more in [Authenticating to Power Platform services](security/authenticate-services.md). Dataverse authentication validates the client app ID in the user’s token against a list of allowed and blocked apps configured for the environment. The authentication either grants or denies the user’s app access to the environment.  

Users can authenticate in four ways:

- **User context**

    The user signs in to the system, such as Dynamics 365 Sales, with their credentials.

- **Application context with user impersonation**

    The user signs in to a first-party Microsoft app. The app makes a call to Dataverse with its application token representing the user. Learn more in [Impersonate another user using the Web API](/power-apps/developer/data-platform/webapi/impersonate-another-user-web-api).

- **First-party app with service-to-service call (application context)**  

    A first-party Microsoft app makes a call to Dataverse using its application token. These first-party apps are registered and provide internal services, like email sync, which typically run in the background without any user interaction.

- **Third-party apps registered in your Azure portal’s app registration**  

    Your custom app authenticates using your Azure app registration’s certificate or user-token.  

Examples of how client app access control works in the _user_ and _application_ context authentication:

- **User context with user token**

  - For all user token requests, we validate if the application ID used is part of allowed or blocked lists.
  - A user token can also be obtained for a public client for first-party and [partner apps](/power-apps/developer/data-platform/walkthrough-register-app-azure-active-directory#public-client-app-registration).

   > [!NOTE]
   > - We don’t recommend allowing a public client unless it's needed temporarily.
   > - The **00000007-0000-0000-c000-000000000000** Dataverse app is automatically allowed in all the environments. User access to the Dataverse environment can be managed with either assigning the appropriate user license and/or assigning a Dataverse security role to the user.

- **Application context with [user impersonation](/power-apps/developer/data-platform/webapi/impersonate-another-user-web-api)**

- **Impersonation using a first-party app**
  
  - In scenarios like Power Automate, where a service-to-service application token is used with user impersonation, we check if the application ID is allowed or blocked.
  - For other scenarios where user impersonation isn't used, no validations are currently performed for service-to-service tokens.

Client app access control isn’t applied to the following apps:

- **First-party apps with service-to-service calls (application context)**

    Learn more in [Commonly used Microsoft first-party services and portal apps](apps-to-allow.md).
- **Partner apps with service-to-service calls**

    To block these apps, make them inactive or delete them from the environment in the Power Platform admin center. Learn more in [Manage application users in the Power Platform admin center](manage-application-users.md).

## Prerequisites

Complete the following prerequisites:

### Verify your role

There are two Power Platform related service admin roles you can assign to provide a high level of admin management:

- Power Platform admin
- Dynamics 365 admin

### Verify that your environment is a Managed Environment

Your environment must be a Managed Environment. Learn more in [Managed Environment overview](managed-environment-overview.md).

### Turn on auditing in the environment

# [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a system administrator.
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**. Then select your specific environment.
1. Select **Settings** in the command bar.
1. Select **Audit and logs** > **Audit settings**.
1. In the **Auditing** section, select the **Start auditing**, **Log access**, and **Read logs** options.
1. Select **Save**.

# [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a system administrator.
1. In the navigation pane, select **Environments**. Then select your specific environment.
1. Select **Settings** in the command bar.
1. Select **Audit and logs** > **Audit settings**.
1. In the **Auditing** section, select the **Start auditing**, **Log access**, and **Read logs** options.
1. Select **Save**.

---

### Review the application list in the environment

There’s a set of applications that are preregistered to run in a Dataverse environment. This list of applications might be different between different environments. These apps are automatically loaded into your environment.

> [!NOTE]
> The following apps are preauthorized to run in a Dataverse environment:

- All Microsoft apps that are preauthorized to acquire On-Behalf-Of tokens. Learn more in [Microsoft identity platform and OAuth2.0 On-Behalf-Of flow](/entra/identity-platform/v2-oauth2-on-behalf-of-flow).
- Application users apps. Learn more in [Special system users and application users](/power-platform/admin/system-application-users).
- All legacy apps that can dynamically acquire On-Behalf-Of tokens.
- All apps with the **prvActOnBehalfOfAnotherUser** privilege and those using headers to impersonate users. Learn more in [Impersonate another user](/dynamics365/customerengagement/on-premises/developer/org-service/impersonate-another-user).

#### Add applications to the list

To add an application to the list by completing the following steps.

# [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. In the **Environments** page, select the name of an environment.
1. Copy the **Environment URL** such as `contoso.crm.dynamics.com`.
1. Open a new tab in the same browser (to stay signed in) and add the following URL to the address bar. Replace `<EnvironmentURL>` with your environment URL and then press **Enter**.

   ```http  
   https:/<EnvironmentURL>/main.aspx?forceUCI=1&pagetype=entitylist&etn=application&viewid=76302387-6f41-48e5-8eaf-4e74c1971020&viewType=1039
   ```

    The form shows the list of applications that are loaded in your environment.

1. Select **+ New**.
1. On the new screen, enter an **ApplicationId**.
1. Enter a **Name**.
1. Select **Save**.


# [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Environments**.
1. In the **Environments** page, select the name of an environment
1. Copy the **Environment URL** such as `contoso.crm.dynamics.com`.
1. Open a new tab in the same browser (to stay signed in) and add the following URL to the address bar. Replace `<EnvironmentURL>` with your environment URL and then press **Enter**.

   ```http  
   https:/<EnvironmentURL>/main.aspx?forceUCI=1&pagetype=entitylist&etn=application&viewid=76302387-6f41-48e5-8eaf-4e74c1971020&viewType=1039
   ```

    The form shows the list of applications that are loaded in your environment.

1. Select **+ New**.
1. On the new screen, enter an **ApplicationId**.
1. Enter a **Name**.
1. Select **Save**.

---

#### Remove applications from the list
To remove an application from the list:

1. Select an app.
1. Select **Delete**.
1. Repeat this procedure for each app you want to remove.

    > [!NOTE]
    > If you removed a system app that was preloaded in the environment, the app can automatically be restored by the system. You might want to delete only the apps that you have added.

#### Allow or block apps

##### Commonly used apps you might want to allow

Here are some commonly used apps that are safe to allow.

| Application ID | Application name |
|----------------|------------------|
| 07ce06e6-4ae9-4466-bca4-2984fa04d057 | Microsoft Dynamics File Storage |
| 1884bdbf-452a-4a11-9c76-afdbdb1b3768	| RelevanceSearch |
| 3570e63c-5acf-4f3f-9f15-a49faa5120d3| PowerAppsCustomerManagementPlaneBackend |
| 44a02aaa-7145-4925-9dcd-79e6e1b94eff |MicrosoftDynamics365OfficeAppsIntegration |
| 4ade18ba-d41e-45d6-a563-97c67fc0be15 | Microsoft Dynamics NRD Service |
| 546068c3-99b1-4890-8e93-c8aeadcfe56a | Common Data Service - Azure Data Lake Storage |
| 5bdbebb2-509f-458e-b56e-d0b934dfdafa | DynamicsInstaller |
| 60216f25-dbae-452b-83ae-6224158ce95e | Microsoft Dynamics CRM App for Outlook |
| 61d02d70-ab6c-4569-be48-787ea2cda65d | Dynamics 365 Analytics |
| 6eb29b24-9d89-4f26-bf2f-9a84ed2499b8 | Common Data Service Global Discovery Service |
| 730d33da-0894-409f-a907-c577151719c5 | Flow-RP |
| 7df0a125-d3be-4c96-aa54-591f83ff541c | Microsoft Flow Service |
| 7f15f9d9-cad0-44f1-bbba-d36650e07765 | Azure Synapse Link for Dataverse |
| 84e37c07-7362-4d9f-b4b1-09be02be0195 | DAMS PROD CL |
| 8d605dfc-1a04-4da6-9be2-8426724af3f3 | Power Platform Authorization Service PROD |
| 978b42f5-e03a-4695-b8df-454959d032c8 | BAP |
| 99ff962b-6252-4b98-8478-0c65a3ea1925 | InsightsAppsPlatform |
| a94f9c62-97fe-4d19-b06d-472bed8d2bcf | Azure SQL Database and Data Warehouse |
| aeb01831-b358-4750-92ce-722e4f3ea7e8 | BizQA for CDS |
| b5faaec4-04c9-45e6-990a-093ed6d02c94 | Dynamic 365 Sales Insights Connector for Power Automate |
| b6fb6bd6-f0fb-4a60-beb1-4e50afd0eaa9 | PowerAppsDataPlaneBackend |
| be5f0473-6b57-40f8-b0a9-b3054b41b99e | IBuilder_StructuredML_Prod_CDS |
| c6a9976b-9beb-43b8-9aea-52a55ba8e39b | Flow-CDSNativeConnectorGermany |
| c92229fa-e4e7-47fc-81a8-01386459c021 | CDSUserManagement |
| e548fb5c-c385-41a6-a31d-6dbc2f0ca8a3 | JobsServiceProd |
| ef32e2a3-262a-44e5-a270-4dfb7b6d0bb2 | AiBuilder PAIO-CDS Prod |
| 99335b6b-7d9d-4216-8dee-883b26e0ccf7 | Power Platform Dataflows Common Data Service Client |
| 0c906d81-7073-46b5-a95c-3726fca3e3a3 | Power Platform Insights and Recommendations Data Plane Prod |

##### Apps you might want to block

These apps are powerful exporters of data. Blocking them prevents possible data exfiltration of sensitive information.

| Application ID | Application name |
|----------------|------------------|
| a672d62c-fc7b-4e81-a576-e60dc46e951d | Microsoft Power Query for Excel (desktop client) |
| d3590ed6-52b3-4102-aeff-aad2292ab01c | Microsoft Access client |
| 51f81489-12ee-4a9e-aaae-a2591f45987d | [XrmToolBox](https://www.xrmtoolbox.com) |
| 2ad88395-b77d-4561-9441-d0e40824f9bc | PowerShell |
| a672d62c-fc7b-4e81-a576-e60dc46e951d | Power BI |

## Recommended steps

1. [Turn on audit mode](#turn-on-audit-mode) in your nonproduction environment.
1. Review the audit log for the apps that are running in the environment to get the list of apps whose access control you want to manage.
1. Repeat steps 1-2 in your production environment.
1. Confirm the list of apps that you want to allow to run in the environment.

## Modes of app access control

There are four different modes:

- [Turn on audit mode](#turn-on-audit-mode)
- [Turn on enabled mode](#turn-on-enabled-mode)
- [Turn on enabled for roles mode](#turn-on-enabled-for-roles-mode)
- [Turn off app access](#turn-off-the-app-access-control-feature)

### Turn on audit mode

We recommend that you turn on audit mode, for at least one week, to get the list of apps that your users are running in an environment.

Using this *audit log* list, you can determine which apps you want to allow or block.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Security**.
1. In the **Security** pane, select **Identity and access**.
1. in the **Identity and access management** page, select **App access control**
1. Select the environment where you want to turn on the app access control feature.
1. Select the **Set up app access control** button.
1. Select the **AuditMode** option in the **Access control** dropdown list.
1. Select a Dataverse application, then select the **Allow** option located above the grid.
1. Select **Save**.
1. The environment list is displayed again. Repeat the procedure for each environment where you want to turn on auditing. Close the panel when you're done turning on audit mode for your environments.

> [!NOTE]
> Audit mode might take up to an hour to take effect, after you update the configuration settings.
>
> In audit mode, you must select at least one application to allow access. However, app access control isn’t enforced in audit mode. You get a list of apps accessing the environment whether or not they’re allowed or denied access.

The audit settings for an environment must be allowed, including the **Log access** option.

#### Retrieve your audit log list

# [New admin center](#tab/new)
1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com/home) as a system administrator.
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**. Then select an environment where you turned on auditing.
1. Select **Settings**.  
1. Select **Audit and logs** > **Audit summary view**.
1. Select **Enable/Disable Filters** to review a list of heading dropdown capabilities.
1. Select the dropdown arrow near the **Event** heading, then find and select **ApplicationBasedAccessDenied** and **ApplicationBasedAccessAllowed**.

   :::image type="content" source="media/control-client-app-access-to-environment/enable-disable-filters.png" alt-text="Screenshot that shows where the Enable/Disable Filters button and ApplicationBasedAccessDenied and ApplicationBasedAccessAllowed checkboxes are located on the Audit summary view page." lightbox="media/control-client-app-access-to-environment/enable-disable-filters.png":::

1. Select **OK**.

   Your filtered audits appear.

# [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com/home) as a system administrator.
1. In the navigation pane, select **Environments**. Then select an environment where you turned on auditing.
1. Select **Settings**.  
1. Select **Audit and logs** > **Audit summary view**.
1. Select **Enable/Disable Filters** to review a list of heading dropdown capabilities.
1. Select the dropdown arrow near the **Event** heading, then find and select **ApplicationBasedAccessDenied** and **ApplicationBasedAccessAllowed**.

   :::image type="content" source="media/control-client-app-access-to-environment/enable-disable-filters.png" alt-text="Screenshot that shows where the Enable/Disable Filters button and ApplicationBasedAccessDenied and ApplicationBasedAccessAllowed checkboxes are located on the Audit summary view page." lightbox="media/control-client-app-access-to-environment/enable-disable-filters.png":::

1. Select **OK**.

   Your filtered audits appear.

---

### Turn on enabled mode

Start blocking apps that are blocked and allow only approved apps. You can select apps to either have **Allowed** or **Blocked** access.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Security**.
1. In the **Security** pane, select **Identity and access**.
1. In the **Identity and access management** page, select **App access control**.
1. Select the environment where you want to turn on the app access control feature.
1. Select the **Set up app access control** button.
1. Select **Enabled** in the **Access control** dropdown list.
1. Select a Dataverse application, then select one of these options, located above the grid:
   - **Allow** to allow access to the app.
   - **Block** to deny access to the app.
1. Select **Save**.
1. The environment list is displayed again. Repeat the procedure for each environment where you want to start blocking apps that are blocked and allow approved apps. Close the panel when you're done.

   > [!NOTE]
   > Enabled mode might take up to an hour to take effect, after you update the configuration settings.

### Turn on enabled for roles mode

Start blocking apps that are blocked and allow only approved apps. For apps that are allowed access, you can assign security roles to restrict who can run those apps in the environment. Only users assigned with a selected security role can run the apps.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Security**.
1. In the **Security** pane, select **Identity and access**.
1. In the **Identity and access management** page, select **App access control**.
1. Select the environment where you want to turn on the app access control feature.
1. Select the **Set up app access control** button.
1. Select **Enabled for roles** in the **Access control** dropdown list.
1. Once your app is selected, select the **Manage security roles** option located above the grid.
1. Select one or more desired security roles.
1. Select **Save**.
1. A window appears, asking you to confirm the roles that you selected. Select **Save**.
1. The list of apps is displayed again. Select **Save**.
1. The environment list is displayed again. Repeat the procedure for each environment where you want to assign security roles. Close the panel when you're done.

> [!NOTE]
> The enabled for roles mode might take up to an hour to take effect, after you update the configuration settings.

### Turn off the app access control feature

Turn off the app access control feature to remove restrictions on apps running in an environment.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Security**.
1. In the **Security** pane, select **Identity and access**.
1. In the **Identity and access management** page, select **App access control**.
1. Select the environment where you want to turn on the app access control feature.
1. Select the **Set up app access control** button.
1. Select **Disabled** in the **Access control** dropdown list.
1. Select **Save**.
1. The environment list is displayed again. Repeat the procedure for each environment where you want to turn off the feature. Close the panel when you're done.

> [!NOTE]
> If you set some apps to **Allowed** or **Blocked**, you don’t need to remove the setting when the app access control feature is turned off to **Disabled**. There are no app restrictions in this environment.

## Error message: App denied user error

Users receive the following error message if they try to run an app not allowed:  

*Access to the Dataverse API is restricted for this application ID.*

## Commonly used Microsoft first-party services and portal apps

The following apps are Microsoft first-party services. This list of apps can be different depending on what types of environment you have and what solutions are installed. These apps are automatically allowed in all the environments where they exist. To block your users from using these apps, you can either remove the required user license or remove their Dataverse security role assignment. For example, to use the [Power Apps maker portal](https://make.powerapps.com/environments), your maker must be assigned either an Environment Maker, System Customizer, or System Administrator security role.  

| Application ID | Application name |
|----------------|------------------|
| 00000007-0000-0000-c000-000000000000 | Dataverse |
| 75eb2b80-011a-4693-9a47-7971c853603c | make.powerpages.microsoft.com |
| 945d3a88-db20-40bd-a9e3-8f2383a17c88 | make.powerpages.microsoft.com |
| 929cb005-cba1-40c4-a962-ef441029cb6c | make.powerpages.microsoft.us |
| f9a5ac11-cab3-45f0-9d0f-83463ba2e34c | make.test.powerpages.microsoft.com |
| a6d2002e-7db6-4da0-94e8-73765fdbc7fb | Microsoft Flow Portal DoD |
| 9856e8dd-37b6-4749-a54b-8f6503ea93b7 | Microsoft Flow Portal GCC High |
| fac5b0fe-9b16-4ae3-b20b-324ec3f033d3 | make.apps.appsplatform.us |
| 5d21c8e8-6d68-4b62-a3a5-bc1900513fad | make.high.powerapps.us |
| feb2c8aa-4f70-4881-abec-521141627b04 | make.gov.powerapps.us |
| a522f059-bb65-47c0-8934-7db6e5286414 | Power Virtual Agents - Test |
| a8f7a65c-f5ba-4859-b2d6-df772c264e9d | make.powerapps.com |
| 719640cd-0337-4b0c-8e6a-431271371fab | make.test.powerapps.com |
| 60f38cf4-a0bf-4fdf-b0b5-14d3131bc031 | make.test.powerapps.com |
| c84a0f23-a0f8-4e8e-918b-57db620d110a | PowerPlatformAdminCenter client |
| 065d9450-1e87-434e-ac2f-69af271549ed | PowerPlatformAdminCenter |
| 61ccfc51-60d1-470a-9dca-f78fcf640d23 | MicrosoftServiceCopilot-Prod |
| 8c1a9936-578e-4d13-9bd9-9afe53ef7de8 | Finance Copilot |
| a59cef1e-2e32-4703-8dab-810d9807efeb | ccibots |
| 96ff4394-9197-43aa-b393-6a41652e21f8 | ccibotsprod |

## Related content

- [Commonly used Microsoft first-party services and portal apps](apps-to-allow.md)
- [Application IDs of commonly used Microsoft applications](/troubleshoot/azure/entra-id/governance/verify-first-party-apps-sign-in#application-ids-of-commonly-used-microsoft-applications)
