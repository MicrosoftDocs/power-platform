---
title: Control client app access to environment (Preview)
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

# Control client app access to environment (Preview)

You can protect against data exfiltration by managing and controlling what apps can run in your Dataverse environment. Data exfiltration safeguards prevent sensitive information from unauthorized removal or extraction from your environment. This safeguard allows a business to maintain business continuity, comply with regulatory requirements, and keep up with competitive advantage.

When this capability is enabled in an environment, you can configure which apps are allowed or blocked in your environment. Malicious users can’t create or use unapproved apps to export sensitive data out of the environment.

## How does app access control work?

App access control is performed at the Dataverse Authentication layer—[Authenticating to Power Platform services](security/authenticate-services.md). Dataverse authentication validates the client app ID in the user’s token against a list of allowed and blocked apps configured in the environment. The authentication either grants or denies the user’s app access to the environment.  

App access requests can be authenticated as follows:

1. **User context**  
   The user signs in to the system, such as Dynamics 365 Sales, with their credentials.
2. **Application context with user impersonation**  
   The user signs in to a first-party Microsoft app, and the app makes a call to Dataverse with its application token representing the user. [Impersonate another user using the Web API](/power-apps/developer/data-platform/webapi/impersonate-another-user-web-api) (Microsoft Dataverse).  
3. **First-party app with service-to-service call (application context)**  
   A first-party Microsoft app makes a call to Dataverse, using its application token. These first-party apps are registered and provide internal services, like email sync, which typically run in the background without any user interaction.
4. **Third-party apps registered in your Azure portal’s app registration**  
   Your custom app authenticates, using your Azure app registration’s certificate or user-token.  

Client app access control can be applied to the user and application context with user impersonation authentication:

1. **User context with user token**
   1. For all user token requests, we validate if the application ID used is part of allowed or blocked lists.
   1. To allow or block session authentication used by a Unified Interface (UCI), the user must configure the `00000007-0000-0000-c000-000000000000` (Dataverse) app.
   1. Features restrict access control for a public client for first party and [partner apps](/power-apps/developer/data-platform/walkthrough-register-app-azure-active-directory#public-client-app-registration).

      > [!TIP]
      > We don’t recommend allowing a public client unless you need it needed temporarily.
1. **Application context with [user impersonation](/power-apps/developer/data-platform/webapi/impersonate-another-user-web-api)**
1. **Impersonation using a first-party app**
   1. For scenarios like Power Automate where a service-to-service application token is used with a user impersonation, we validate if the corresponding application ID is allowed or blocked.
   1. For other scenarios where a user impersonation isn't used, no validations are currently being performed for service-to-service tokens.

Client app access control isn’t applied to:

- First-party apps with service-to-service calls (application context)
- Partner apps with service-to-service calls

  To block these apps, make them inactive in the Power Platform admin center—[Manage application users in the Power Platform admin center](manage-application-users.md).

## Prerequisites

- Environment must be a managed environment—[Managed environment overview](managed-environment-overview.md).
- Enable auditing in the environment with system admin permissions.
- Set organization settings with system admin permissions (requires system administrator security role).

## Enable auditing in the environment

In the Power Platform Admin Center:

1. Go to **Environments** -> **YourEnvironment** -> **Settings** -> **Audit settings**.
1. Check the box for **Start Auditing** in the **Auditing** section.

## Enable audit mode

We recommend that you enable the audit mode first for at least one week to get the list of apps that your users are running in an environment.

Using this audit log list, you can determine which apps you want to allow or block. Be sure to enable your environment as a managed environment.

1. On the **Security** page, locate the **Client application access control** card and select **Manage client application access**.
1. Select the environment where you want to manage app access.
1. Select the **Enable client application access** button.
1. Select the **AuditMode** option under the **Access control** dropdown.
1. Select a Dataverse application, then select **Allow**.
1. Select **Save**.

> [!NOTE]
> Audit mode might take up to an hour to take effect, after you update the configuration settings.

> [!TIP]
> In audit mode, you must select at least one environment to allow access. However, app access control isn’t enforced in audit mode. You get a list of apps accessing the environment whether or not they’re allowed or denied access.

## Enable app access enforcement mode

Enabling this mode starts blocking apps not allowed or apps that only allow approved apps. You can select apps to enable allowed or blocked access. To make changes to access, you must have your environment enabled as a managed environment.

1. On the **Security** page, locate the **Client application access control** card and select **Manage client application access**.
1. Select the environment where you want to manage app access.
1. Select **Enable client application access**.
1. Select **Enabled** under the **Access control** dropdown.
1. Select a Dataverse application, then select one of these options:
   - **Allow**—to allow access
   - **Block**—to deny access
1. Select **Save**.

   > [!NOTE]
   > Enforcement mode might take up to an hour to take effect, after you update the configuration settings.

## Enable app access with security role enforcement mode

Enabling this mode starts blocking apps that aren't allowed or only allows approved apps. For apps that are allowed access, you can assign security roles to restrict who can run those apps in the environment. Only users assigned with a selected security role can run the apps. To make changes to access, you must have your environment enabled as a managed environment.

1. On the Security page, locate the **Client application access control** card and select **Manage client application access**.
1. Select the environment where you want to manage app access.
1. Select **Enable client application access**.
1. Select **Enabled for roles** in the **Access control** dropdown.
1. Select an application, then select **Allow**.
1. Once your app is selected, select **Manage security roles**.
1. Select one or more desired security roles.
1. Select Save.

   You return to the **Enable client application access** page.

> [!NOTE]
> This mode might take up to an hour to take effect, after you update the configuration settings.

## Disable app access control

You can remove app access control by disabling the feature. With this setting, there are no restrictions on apps that run in an environment. To make changes to access, you must have your environment enabled as a managed environment.

1. On the **Security** page, locate the **Client application access control** card and select **Manage client application access**.
1. Select the environment where you want to manage app access.
1. Select **Enable client application access**.
1. Select **Disabled** in the **Access control** dropdown.
1. Select Save.

> [!TIP]
> If you set some apps to **Allowed** or **Blocked**, you don’t need to remove the setting when the access control is set to **Disabled**. There are no app restrictions in this environment.

## App denied user error

Users see the following error message if they try to run an app not allowed:  

*Access to the Dataverse API is restricted for this application ID.*

## Audit only mode (identify apps that allow or block)

If you choose **Audit only** mode, only telemetry is logged for failures and requests aren’t rejected.

The audit settings for an environment must be enabled, including the **Log access** option.

## Retrieve app access audit log

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

### Recommended steps

1. Enable audit mode in your nonproduction environment.
1. Review the audit log for the apps that are running in the environment to get the list of apps whose access control you want to manage.
1. Repeat these steps in your UAT/Production environment.
1. Confirm the list of apps that you want to allow to run in the environment.
1. Set the feature setting to **Enabled for roles**.

## See also

Application IDs of commonly used Microsoft applications:

[Verify first-party Microsoft applications in sign-in reports](/troubleshoot/azure/entra-id/governance/verify-first-party-apps-sign-in#application-ids-of-commonly-used-microsoft-applications)
