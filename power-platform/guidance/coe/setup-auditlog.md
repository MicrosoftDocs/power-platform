---
title: Collect audit logs using a custom connector (deprecated)
description: "The Audit Log Sync flow connects to the Audit Log using a custom connector to gather telemetry data, such as unique users and launches, for apps in Microsoft 365."
author: manuelap-msft

ms.component: pa-admin
ms.topic: how-to
ms.date: 09/26/2024
ms.subservice: guidance-toolkit
ms.author: mapichle
ms.reviewer: sericks
search.audienceType: 
  - admin
ms.custom: sfi-image-nochange
---

# Collect audit logs using a custom connector (deprecated)

> [!IMPORTANT]
> Using the dedicated **Center of Excellence - Audit Log** solution and the Office 365 Management custom connector to collect audit log events are deprecated. The solution and custom connector will be removed from the CoE Starter Kit in August 2023.
> We have a new flow that collects audit log events, which is part of the **Center of Excellence - Core Components** solution. This new flow uses an HTTP connector. Learn more in [Collect audit logs by using the Office 365 Management API](setup-auditlog-http.md)

The Audit Log Sync flow connects to the Microsoft 365 audit log to gather telemetry data (unique users, launches) for apps. The flow uses a custom connector to connect to the Audit Log. In the following instructions, you set up the custom connector and configure the flow.

The Center of Excellence (CoE) Starter Kit works without this flow, but the usage information (app launches, unique users) in the Power BI dashboard is then blank.

## Prerequisites

- Complete the [Before setting up the CoE Starter Kit](setup.md) and [Set up inventory components](setup-core-components.md) articles before continuing with the setup in this article.
- [Set up your environment](setup.md#create-your-environments).
- Sign in with the [correct identity](setup.md#which-identity-should-i-use-to-install-the-coe-starter-kit).
- (Optional) Set up the Audit Log solution only if you chose [cloud flows](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory) as the mechanism for inventory and telemetry.

  [Watch a walk-through](https://www.youtube.com/watch?v=Lsooi7xp6eA&list=PLi9EhCY4z99W5kzaPK1np6sv6AzMQDsXG&index=1&t=1360s) on how to set up the audit log connector.

## Before you use the audit log connector

1. Microsoft 365 audit log search must be turned on for the audit log connector to work. For more information, see [Turn auditing on or off](/purview/audit-log-enable-disable?preserve-view=true&view=o365-worldwide&tabs=microsoft-purview-portal)

1. The user identity running the flow must have permission to the audit logs. Minimum permissions are described in [Before you search the audit log](/purview/audit-search?preserve-view=true&view=o365-worldwide&tabs=microsoft-purview-portal#before-you-search-the-audit-log).

1. Your tenant must have a subscription that supports unified audit logging. For more information, see [Microsoft 365 guidance for security & compliance](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance).

1. Microsoft Entra permissions may be required to configure the Microsoft Entra app registration. Depending on your Entra configuration, this could be an **Application Developer** role or higher. Review the [Least privileged roles by task in Microsoft Entra ID](/entra/identity/role-based-access-control/delegate-by-task) fore more guidance.

The Office 365 Management APIs use Microsoft Entra ID to provide authentication services that you can use to grant rights for your application to access them.

### Create a Microsoft Entra app registration for the Office 365 Management API

Using these steps, you set up a Microsoft Entra app registration that is used in a custom connector and Power Automate flow to connect to the audit log. More information: [Get started with Office 365 Management APIs](/office/office-365-management-api/get-started-with-office-365-management-apis)

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Entra ID** > **App registrations**.

   :::image type="content" source="media/coe33.png" alt-text="Screenshot that shows the Microsoft Entra app registration." lightbox="media/coe33.png":::

1. Select **+ New Registration**.

1. Enter a name (for example, **Microsoft 365 Management**), don't change any other setting, and then select **Register**.

1. Select **API permissions** > **+ Add a permission**.

   :::image type="content" source="media/coe34.png" alt-text="Screenshot that shows API Permissions - Add a permission." lightbox="media/coe34.png":::

1. Select **Office 365 Management API**, and configure permissions as follows:

   1. Select **Delegated permissions**, and then select **ActivityFeed.Read**.

      :::image type="content" source="media/coe36.png" alt-text="Screenshot that shows delegated permissions." lightbox="media/coe36.png":::

   1. Select **Add permissions**.

1. Select **Grant Admin Consent for (your organization)**. Prerequisites: [Grant tenant-wide admin consent to an application](/azure/active-directory/manage-apps/grant-admin-consent#prerequisites)

   The API permissions now reflect delegated **ActivityFeed.Read** with a status of **Granted for _(your organization)_**.

1. Select **Certificates and secrets**.

1. Select **+ New client secret**.

1. Add a description and expiration (in line with your organization's policies), and then select **Add**.

1. Copy and paste the **Secret** to a text document in Notepad for the time being.

1. Select **Overview**, and copy and paste the application (client) ID and directory (tenant) ID values to the same text document; be sure to make a note of which GUID is for which value. You'll need these values in the next step as you configure the custom connector.

Leave the Azure portal open, because you'll need to make some configuration updates after you set up the custom connector.

### Set up the custom connector

Now you configure and set up a custom connector that uses the [Office 365 Management APIs](/office/office-365-management-api/get-started-with-office-365-management-apis).

1. Go to **[Power Apps](https://make.powerapps.com)** > **Dataverse** > **Custom Connectors**. The Office 365 Management API custom connector is listed here. The connector is imported with the core components solution.
1. Select **Edit**.

1. If your tenant is a commercial tenant, leave the **General** page as is.

   > [!IMPORTANT]
   >
   > - If your tenant is a GCC tenant, change the host to `manage-gcc.office.com`.
   > - If your tenant is a GCC High tenant, change the host to `manage.office365.us`.
   > - If your tenant is a DoD tenant, change the host to `manage.protection.apps.mil`.
   >
   > For more information, see [Activity API operations](/office/office-365-management-api/office-365-management-activity-api-reference?preserve-view=true&view=o365-worldwide#activity-api-operations).

1. Select **Security**.
1. Select **Edit** at the bottom of the **OAuth 2.0** area to edit the authentication parameters.

   :::image type="content" source="media/coe42.png" alt-text="Screenshot that shows how you can edit the OAuth 2.0 section of Security tab of Custom connectors." lightbox="media/coe42.png":::

1. Change the **Identity Provider** to Microsoft Entra ID.

   :::image type="content" source="media/auditlogcc.png" alt-text="Change the identity provider to Microsoft Entra ID." lightbox="media/auditlogcc.png":::

1. Paste the application (client) ID you copied from the app registration into **Client Id**.

1. Paste the client secret you copied from the app registration into **Client secret**.

1. Don't change the **Tenant ID**.

1. Leave the **Login URL** _as is_ for commercial and GCC tenants, but for a GCC High or DoD tenant change the URL to `https://login.microsoftonline.us/`.

1. Set the **Resource URL**:

   | Tenant type | URL |
   |--------------|-----|
   | Commercial | `https://manage.office.com` |
   | GCC | `https://manage-gcc.office.com` |
   | GCC High | `https://manage.office365.us` |
   | DoD | `https://manage.protection.apps.mil` |

1. Select **Update Connector**.

1. Copy the **Redirect URL** into a text document, such as Notepad.

> [!NOTE]
> If you have a [data loss prevention (DLP) policy](../../admin/wp-data-loss-prevention.md) configured for your CoE Starter Kit environment, add this connector to the business data-only group of this policy.

### Update Microsoft Entra app registration with the redirect URL

1. Go to the [Azure portal](https://portal.azure.com) and your app registrations.

1. Under **Overview**, select **Add a Redirect URI**.

1. Select **+ Add a platform** > **Web**.

1. Enter the URL you copied from the **Redirect URL** section of the custom connector.

1. Select **Configure**.

### Start a subscription and audit log content

Go back to the custom connector to set up a connection to the custom connector and [start a subscription to the audit log content](/office/office-365-management-api/office-365-management-activity-api-reference#start-a-subscription), as described in the following steps.

> [!IMPORTANT]
> You must complete these steps for subsequent steps to work. If you don't create a new connection and test the connector here, setting up the flow and child flow in later steps fails.

1. On the **Custom Connector** page, select **Test**.

1. Select **+ New connection**, and then sign in with your account.

1. Under **Operations**, select **StartSubscription**.

   :::image type="content" source="media/coe43.png" alt-text="Screenshot that shows the custom connector Start Subscription." lightbox="media/coe43.png":::

1. Paste the **directory (tenant) ID**—copied earlier from the **App Registration** overview page in Microsoft Entra ID—into the **Tenant** field.
1. Paste the **directory (tenant) ID** into **PublisherIdentifier**.

1. Select **Test Operation**.

You should see a (200) status returned, which means the query was successful.

:::image type="content" source="media/coe44.png" alt-text="Screenshot that shows a successful status returned from the StartSubscription activity." lightbox="media/coe44.png":::

> [!IMPORTANT]
> If you have previously enabled the subscription, you see a `(400) The subscription is already enabled` message. This means the subscription is successfully enabled already. Ignore this error and continue with the setup.
>
> If you don't see the above message or a (200) response, the request likely failed. There might be an error with your setup that's keeping the flow from working. Common issues to check are:
>
> - The identity provider on the **Security** tab should be set to Microsoft Entra ID.
> - Audit logs should be enabled and you have permission to view them. Check your access by searching the [Microsoft Compliance Manager](https://compliance.microsoft.com/auditlogsearch).
> - If you don't have permissions, see [Before you search the audit log](/purview/audit-search?preserve-view=true&view=o365-worldwide&tabs=microsoft-purview-portal#before-you-search-the-audit-log).
> - If you enabled the audit logs recently, try seaching again in a few minutes to give the audit log time to activate.
> - The tenant ID from your Microsoft Entra app registration should be correct.
> - Your resource URL should have no added spaces or characters at the end.
> - Review the steps in your [Microsoft Entra app registration](#create-a-microsoft-entra-app-registration-for-the-office-365-management-api) for correctness.
> - The security settings of the custom connector, as described in [step 6 of the custom connector setup](#set-up-the-custom-connector), should be updated correctly.
>
> If you are still seeing failures, your connection might be in a bad state. For more information, see [Step-by-step instructions to repair Audit Log connection](https://github.com/microsoft/coe-starter-kit/issues/4961).

### Set up the Power Automate flow

A Power Automate flow uses the custom connector, queries the audit log daily, and writes the Power Apps launch events to a Microsoft Dataverse table. This table is then used in the Power BI dashboard to report on sessions and unique users of an app.

1. Download the solution in [Set up core components](setup-core-components.md).
1. Go to [make.powerapps.com](https://make.powerapps.com).
1. Import the Center of Excellence audit logs solution using the `CenterofExcellenceAuditLogs_*x_x_x_xxx*_managed.zip` file.
1. Establish connections then activate your solution. If you create a new connection, you must select **Refresh**. You don't lose your import progress.

   :::image type="content" source="media/coe-custom2.png" alt-text="Screenshot that shows how to import the CoE audit log components solution." lightbox="media/coe-custom2.png":::

1. Open the **Center of Excellence – Audit Log solution**.
1. [Remove the unmanaged layer](after-setup.md) from the **[Child] Admin | Sync Logs**.
1. Select the **[Child] Admin | Sync Logs**.
1. Edit the **Run only users** settings.

   :::image type="content" source="media/coe49.png" alt-text="Child flow - run-only users." lightbox="media/coe49.png":::

1. For the  Office 365 Management API custom connector, change the value to **Use this connection (userPrincipalName\@company.com)**. If there's no connection for any of the connectors, go to **Dataverse** > **Connections**, and create one for the connector.

   :::image type="content" source="media/coe50.png" alt-text="Screenshot that shows where to find the Configure run-only users selection." lightbox="media/coe50.png":::

1. For the Microsoft Dataverse connector, leave the run-only permission value blank and confirm that the connection reference for the **CoE Audit Logs - Dataverse** connection is configured correctly. If the connection is showing an error, [update the connection reference](faq.md#update-connection-references) for the **CoE Audit Logs - Dataverse** connection reference.

   :::image type="content" source="media/auditlogdv.png" alt-text="Screenshot that shows where to check the CoE Audit Logs - Dataverse connection reference." lightbox="media/auditlogdv.png":::

1. Select **Save**, and then close the **Flow details** tab.

1. (Optional) Edit the `TimeInterval-Unit` and `TimeInterval-Interval` environment variables to gather smaller chunks of time. The default value is to chunk `1` day into `1` hour segments. You receive an alert from this solution if the Audit Log fails to collect all data with your configured time interval.

    | Name | Description |
    |------|---------------|
    | StartTime-Interval | Must be a whole number to represent the start time for how far back to fetch. Default value: `1` (for one day back) |
    | StartTime-Unit | Determines units for how far back in time to go to fetch data. Must be a value from accepted as an input parameter to [Add to Time](/power-automate/desktop-flows/actions-reference/datetime#add). Example legal values: `Minute`, `Hour`, `Day`. Default value is `Day`. |
    | TimeInterval-Unit | Determines units for chunking the time since start. Must be a value from accepted as an input parameter to [Add to Time](/power-automate/desktop-flows/actions-reference/datetime#add). Example legal values: `Minute`, `Hour`, `Day`. Default value is `Hour`. |
    | TimeInterval-Interval | Must be a whole number to represent the number of chunks of type unit. Default value is `1` (for 1-hour chunks). |
    | TimeSegment-CountLimit | Must be a whole number to represent the limit on the number of chunks that can be created. Default value is `60`. |

    > [!ITIP]
    > These default values work in a medium-sized tenant. You might have to adjust the values multiple times for this to work for your tenant size.

Learn more in [Update environment variables](faq.md#update-environment-variables).

1. Back in the solution, turn on both the [Child] Admin | Sync Logs flow and the Admin | Sync Audit Logs flow.

### Example configurations for environment variables

Here are example configurations for these values:

| StartTime-Interval | StartTime-Unit | TimeInterval-Interval | TimeInterval-Unit | TimeSegment-CountLimit | Expectation |
|--------------------|----------------|-----------------------|-------------------|------------------------|-------------|
| 1 | day | 1 | hour | 60 | Create 24 child flows, which is within the limit of 60. Each child flow pulls back 1 hour of logs from the past 24 hours. |
| 2 | day | 1 | hour | 60 | Create 48 child flows, which is within the limit of 60. Each child flow pulls back 1 hour of logs from the past 48 hours. |
| 1 | day | 5 | minute | 300 | Creates 288 child flows, which is within the limit of 300. Each child flow pulls back 5 minutes of logs from the past 24 hours. |
| 1 | day | 15 | minute | 100 | Create 96 child flows, which is within the limit of 100. Each child flow pulls back 15 minutes of logs from the past 24 hours. |

## How to get older data

Once configured, this solution collects app launches, though isn't set up to collect historic app launches. Depending on your [Microsoft 365 license](/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance#before-you-search-the-audit-log), historic data is available for up to one year using the audit log within Microsoft Purview.

You can load historic data into the CoE Starter Kit tables manually. For more information, see [How to import old Audit Logs](https://github.com/microsoft/coe-starter-kit/issues/3040).

[!INCLUDE[file-an-issue](../../includes/file-issue.md)]
