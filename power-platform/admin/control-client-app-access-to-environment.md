---
title: Control which apps are allowed in your enviornment (preview)
description: You can protect against data exfiltration by managing and controlling what apps can run in your Dataverse environment.
author: paulliew
ms.author: paulliew
ms.reviewer: sericks
ms.component: pa-admin
ms.subservice: admin
ms.topic: how-to
ms.date: 9/23/2024
search.audienceType: 
  - admin
---

# Control which apps are allowed in your enviornment (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]

You can protect against data exfiltration by managing and controlling what apps can run in your Dataverse environment. Data exfiltration safeguards help prevent sensitive information from unauthorized removal or extraction from your environment. This allows a business to maintain business continuity and comply with regulatory requirements.

You can configure which apps are allowed or blocked in your environment. Malicious users can’t create or use unapproved apps to export sensitive data out of the environment.

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## How does app access control work?

App access control is performed at the Dataverse authentication layer. Learn more in [Authenticating to Power Platform services](security/authenticate-services.md). Dataverse authentication validates the client app ID in the user’s token against a list of allowed and blocked apps configured for the environment. The authentication either grants or denies the user’s app access to the environment.  

There are four different ways that a user can authenticate.

- **User context**  
    The user signs in to the system, such as Dynamics 365 Sales, with their credentials.
   
- **Application context with user impersonation** <br>
    The user signs in to a first-party, Microsoft app. The app makes a call to Dataverse with its application token representing the user. Learn more in [Impersonate another user using the Web API](/power-apps/developer/data-platform/webapi/impersonate-another-user-web-api).
   
- **First-party app with service-to-service call (application context)**  
    A first-party, Microsoft app makes a call to Dataverse, using its application token. These first-party apps are registered and provide internal services, like email sync, which typically run in the background without any user interaction.
   
- **Third-party apps registered in your Azure portal’s app registration**  
    Your custom app authenticates, using your Azure app registration’s certificate or user-token.  

Here are examples of how client app access control works in the _user_ and _application_ context authentication.

- **User context with user token**

  - For all user token requests, we validate if the application ID used is part of allowed or blocked lists.
  - To allow or block session authentication used by a Unified Interface (UCI), the user must configure the **00000007-0000-0000-c000-000000000000** Dataverse app.
  - Features restrict access control for a public client for first-party and [partner apps](/power-apps/developer/data-platform/walkthrough-register-app-azure-active-directory#public-client-app-registration).

      > [!TIP]
      > We don’t recommend allowing a public client unless you need it needed temporarily.
      
- **Application context with [user impersonation](/power-apps/developer/data-platform/webapi/impersonate-another-user-web-api)**
  
- **Impersonation using a first-party app**
  
  - For scenarios like Power Automate where a service-to-service application token is used with a user impersonation, we validate if the corresponding application ID is allowed or blocked.
  - For other scenarios where a user impersonation isn't used, no validations are currently being performed for service-to-service tokens.

Client app access control isn’t applied to the following apps:
- First-party apps with service-to-service calls (application context).
- Partner apps with service-to-service calls.

    To block these apps, make them inactive in the Power Platform admin center. Learn more in [Manage application users in the Power Platform admin center](manage-application-users.md).

## Prerequisites

Complete the following prerequisites.

### Verify your role
There are two Power Platform related service admin roles you can assign to provide a high level of admin management:
- Power Platform admin
- Dynamics 365 admin

### Verify that your enviroment is a Managed Environment
Your environment must be a Managed Environment. Learn more in [Managed Environment overview](managed-environment-overview.md).

### Turn on auditing in the environment
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a system administrator. 
1. In the navigatio pane, select **Environments**. Then select your specific environment.
1. Select **Settings** in the command bar.
1. Select **Audit and logs** > **Audit settings**.
1. In the **Auditing** section, select the **Start auditing**, **Log access**, and **Read logs** options.
1. Select **Save**.

### Create an application list in the environment
There’s a set of applications that are preregistered to run in a Dataverse environment. This list of applications can be different between different environments. To manage app access control, you must first build the list of applications that can be managed.

There are two ways to build the list of applications to manage:

- [Get the list](#get-the-list-of-pre-authorized-applications) with the function **createOperationUsingWebAPI()**.
- [Turn on audit mode](#turn-on-audit-mode) to see the list of applications running in the environment.

> [!NOTE]
> The following list of apps are pre-authorized to run in a Dataverse environment.
>
> - All Microsoft apps that are pre-authorized to acquire On-Behalf-Of tokens. Learn more in [Microsoft identity platform and OAuth2.0 On-Behalf-Of flow](/entra/identity-platform/v2-oauth2-on-behalf-of-flow).
> - Application users app - Learn more in [Special system users and application users](/power-platform/admin/system-application-users).
> - All legacy apps that can dynamically acquire On-Behalf-Of tokens.
> - All apps with the **prvActOnBehalfOfAnotherUser** privilege and those using headers to impersonate users. Learn more in [Impersonate another user](/dynamics365/customerengagement/on-premises/developer/org-service/impersonate-another-user?view=op-9-1).

#### Get the list of pre-authorized applications

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select the Dataverse environment with your desired list of applications.
1. Open the web client.
1. Select **F12** on your keyboard to open the developer tools.
1. Select the **Console** tab.
1. At the prompt, paste the following code snippet:

   ```javascript
   function createOperationUsingWebAPI() {
     var clientUrl = Xrm.Page.context.getClientUrl();
     var req = new XMLHttpRequest()
     req.open("POST", encodeURI(clientUrl +   "/api/data/v9.0/RetrieveAppsWithDelegatedAccessPermissions"), true);
     req.setRequestHeader("Accept", "application/json");
     req.setRequestHeader("Content-Type", "application/json; charset=utf-8");
     req.setRequestHeader("OData-MaxVersion", "4.0");
     req.setRequestHeader("OData-Version", "4.0");
     req.setRequestHeader("CallerId", "YOUR_CALLER_ID_GUID"); // Replace with actual GUID
     req.onreadystatechange = function () {
       if (this.readyState == 4 && this.status == 200) {
         // Typical action to be performed when the document is ready:
         console.log(req.responseText);
       }
     };
     var body = JSON.stringify({ "cloud":0 });
     req.send(body);
   }

   createOperationUsingWebAPI()
   ```

1. Press the **Enter** key.
1. Select the **Network** tab.
1. Locate and select the **RetrieveAppsWithDelegatedAccessPermissions** row.
1. Select the **Response** tab.

   A list of all the pre-authorized applications in the environment is listed. You might see a list similar to this list.

   :::image type="content" source="media/control-client-app-access-to-environment/pre-authorized-apps.png" alt-text="Screenshot that shows a list of pre-authorized apps." lightbox="media/control-client-app-access-to-environment/pre-authorized-apps.png":::

1. Copy the list of applications and paste it into a text editor such as Notepad.

#### Build the list of applications to manage their access

If you didn't use the function to get a list of apps, you can build a list manually. If you already started a list, you can add more applications to the environment.

1. From the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select an environment and open the web client. Copy your environment URL, for example `myname.crm.dynamics.com`.
1. Open a new tab in the same browser (to stay signed in) and add the following URL to the address bar. Replace 'OrgURL' with your own environment URL, then press **Enter**.

   ```http  
   https:/<OrgURL>/main.aspx?forceUCI=1&pagetype=entitylist&etn=application&viewid=76302387-6f41-48e5-8eaf-4e74c1971020&viewType=1039
   ```

1. Select **+ New**.

   :::image type="content" source="media/control-client-app-access-to-environment/new-application.png" alt-text="Screenshot that shows the location of the New button at the URL destination.":::
   
1. On the new screen, enter an **ApplicationId**.
1. Enter a **Name**.
1. Select **Save**.

   :::image type="content" source="media/control-client-app-access-to-environment/new-application-form.png" alt-text="Screenshot showing the location of the ApplicationId and Name fields. The image also shows where the Save button is located.":::

Using this **New Application** page, you can add apps from the [commonly used apps list](#commonly-used-apps-you-might-want-to-allow). For example, to add Dataverse, enter **00000007-0000-0000-c000-000000000000** as the **ApplicationId**.

#### Allow or block apps

##### Commonly used apps you might want to allow

Here are some commonly used apps that are safe to allow.

| Application ID | Application name |
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

##### Apps you might want to block

These apps are powerful exporters of data. Blocking them prevents possible data exfiltration of sensitive information.

| Application ID | Application name |
|----------------|------------------|
| a672d62c-fc7b-4e81-a576-e60dc46e951d | Excel client |
| d3590ed6-52b3-4102-aeff-aad2292ab01c | Microsoft Access client |
| 51f81489-12ee-4a9e-aaae-a2591f45987d | xRm Tool kit |
| 2ad88395-b77d-4561-9441-d0e40824f9bc | PowerShell |
| a672d62c-fc7b-4e81-a576-e60dc46e951d | Power BI |

## Turn on the app access control feature
1.	Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2.	Add a tab in the browser and paste this URL: **https://admin.powerplatform.microsoft.com/security?ppac.enableFeatureFlagsPanel=true** 
3.	Select the airplane icon on the title bar to show the **PPAC ECS Feature Flags** pane.

    :::image type="content" source="media/airplane-icon.png" alt-text="The airplane icon in the title bar of the Power Platform admin center.":::
 
4.	Turn the **EnableClientApplicationAccessControl** feature on.

    :::image type="content" source="media/app-access-control-feature.png" alt-text="Turn on the EnableClientApplicationAccessControl feature.":::

5.	You now see a **Client application access control** card added to your **Security** page in the Power Platform admin center.

    :::image type="content" source="media/client-application-access-control-card.png" alt-text="The **Client application access control** card in the **Security** page.":::
 
## Modes of app access control
After you turn on the app access control feature, there are four different modes:
- [Turn on audit mode](#turn-on-audit-mode)
- [Turn on enabled mode](#turn-on-enabled-mode)
- [Turn on enabled for roles mode](#turn-on-enabled-for-roles-mode)
- [Turn off app access](#turn-off-app-access-control)

## Recommended steps 

1. Turn on audit mode in your nonproduction environment.
1. Review the audit log for the apps that are running in the environment to get the list of apps whose access control you want to manage.
1. Repeat these steps in your production environment.
1. Confirm the list of apps that you want to allow to run in the environment.
1. Set the feature setting to **Enabled for roles**.

### Turn on audit mode

We recommend that you turn on audit mode, for at least one week, to get the list of apps that your users are running in an environment.

Using this *audit log* list, you can determine which apps you want to allow or block.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Security**.
1. Locate the **Client application access control** card and select **Manage client application access**.
1. Select the environment where you want to manage app access.
1. Select the **Enable client application access** button.
1. Select the **AuditMode** option under the **Access control** dropdown.
1. Select a Dataverse application, then select **Allow**.
1. Select **Save**.

> [!NOTE]
> Audit mode might take up to an hour to take effect, after you update the configuration settings.

> [!TIP]
> In audit mode, you must select at least one environment to allow access. However, app access control isn’t enforced in audit mode. You get a list of apps accessing the environment whether or not they’re allowed or denied access.  To Do: Put the link to the audit mode example blelow.

## Turn on enabled mode

The enabled mode starts blocking apps that aren't allowed or apps that only allow approved apps. You can select apps to either have **Allowed** or **Blocked** access.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Security**.
1. locate the **Client application access control** card and select **Manage client application access**.
1. Select the environment where you want to manage app access.
1. Select **Enable client application access**.
1. Select **Enabled** under the **Access control** dropdown.
1. Select a Dataverse application, then select one of these options:
   - **Allow** to allow access
   - **Block** to deny access
1. Select **Save**.

   > [!NOTE]
   > Enabled mode might take up to an hour to take effect, after you update the configuration settings.

## Turn on enabled for roles mode
Enabling this mode starts blocking apps that aren't allowed or only allows approved apps. For apps that are allowed access, you can assign security roles to restrict who can run those apps in the environment. Only users assigned with a selected security role can run the apps. To make changes to access, you must have your environment enabled as a managed environment.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Security**.
1. Locate the **Client application access control** card and select **Manage client application access**.
1. Select the environment where you want to manage app access.
1. Select **Enable client application access**.
1. Select **Enabled for roles** in the **Access control** dropdown.
1. Select an application, then select **Allow**.
1. Once your app is selected, select **Manage security roles**.
1. Select one or more desired security roles.
1. Select **Save**.

   You return to the **Enable client application access** page.

> [!NOTE]
> The enabled for roles mode might take up to an hour to take effect, after you update the configuration settings.

## Turn off app access control

You can remove app access control by turning off the feature. With this setting, there are no restrictions on apps that run in an environment. 

To make changes to access, your environment must be a Managed Environment.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Security**.
2. Locate the **Client application access control** card and select **Manage client application access**.
1. Select the environment where you want to manage app access.
1. Select **Enable client application access**.
1. Select **Disabled** in the **Access control** dropdown.
1. Select **Save**.

> [!TIP]
> If you set some apps to **Allowed** or **Blocked**, you don’t need to remove the setting when the access control is set to **Disabled**. There are no app restrictions in this environment.

## App denied user error

Users see the following error message if they try to run an app not allowed:  

*Access to the Dataverse API is restricted for this application ID.*

## Audit only mode (identify apps that allow or block)

If you choose **Audit only** mode, only telemetry is logged for failures and requests aren’t rejected.

The audit settings for an environment must be enabled, including the **Log access** option.

### Retrieve app access audit log

1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com/home) as a system administrator.
1. Select **Environments**, and then select the environment with the enabled feature.
1. Select **Settings**.

   :::image type="content" source="media/control-client-app-access-to-environment/settings-button.png" alt-text="Screenshot that shows the location of the settings button once you select an environment.":::
1. Select **Audit and logs** and choose **Audit summary view**.
1. Select **Enable/Disable Filters** to review list heading dropdown capabilities.
1. Select the dropdown arrow near the **Event** heading, then find and check **ApplicationBasedAccessDenied** and **ApplicationBasedAccessAllowed**.

   :::image type="content" source="media/control-client-app-access-to-environment/enable-disable-filters.png" alt-text="Screenshot that shows where the Enable/Disable Filters button and ApplicationBasedAccessDenied and ApplicationBasedAccessAllowed checkboxes are located on the Audit summary view page." lightbox="media/control-client-app-access-to-environment/enable-disable-filters.png":::
1. Select **OK**.

   Your filtered audits appear.


## Related information

[Verify first-party Microsoft applications in sign-in reports](/troubleshoot/azure/entra-id/governance/verify-first-party-apps-sign-in#application-ids-of-commonly-used-microsoft-applications)
