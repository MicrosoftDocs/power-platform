---
title: "Enable cross-tenant isolation for Power Platform environments | MicrosoftDocs"
description: ""
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/10/2020
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Set up sharing alerts and mitigation

Alerting can be used to inform admins and stakeholders about specific events, or provide a summary of activity.

Much like makers use Power Automate to automate their business processes, admins can use the tools for the same level of automation. An example of alerting that can be implemented is subscribing to [Office 365 Security and Compliance Audit Logs](https://docs.microsoft.com/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance?view=o365-worldwide) events.

> [!IMPORTANT]
> You (or another admin) must turn on audit logging before you can start searching the audit log. When audit log search in the Security & Compliance Center is turned on, user and admin activity from your organization is recorded in the audit log and retained for 90 days, and up to one year depending on the license assigned to users. More information: **[Turn audit log search on or off](https://docs.microsoft.com/microsoft-365/compliance/turn-audit-log-search-on-or-off?view=o365-worldwide)**

You can either use [alert policies](https://docs.microsoft.com/microsoft-365/compliance/alert-policies?view=o365-worldwide) available as part of the Office 365 Security and Compliance center to receive alerts or set up a flow in Power Automate. By using flow to consume these alerts, admins can receive much more than email alerts - by leveraging the management connectors and other built-in connectors of Power Automate like Approvals, additional actions can be implemented which allows administrators to remain productive as they protect their environment.

As an administrator you should monitor and set up alerts to identify widely shared resources.

- Apps shared with the entire tenant or many individual users might be business import or critical, and therefore might need a stronger support model or might need a review of the number of people they're shared with.
- Often apps are shared with the entire organization because it's an easy option. If the app is for a single department, job role, or group of people, you can help the maker by setting up an Azure Active Directory (Azure AD) group to share their app. Otherwise, (a) your entire org will see the app in the Power Apps mobile player or on make.powerapps.com (even if it's not relevant to them), and (b) if a user doesn't have access to the underlying data source, they'll receive an error message when they try to launch the app, which can cause an increase in support tickets and confusion.
- Apps shared with a large number of individual users pose a different risk: if the app is for a specific job role or department, when a user moves departments or job roles they will still see the app and be able to access the information. Therefore, we recommend sharing role-specific apps with an Azure AD group instead.
- Flows can be shared and have multiple owners, which creates a [team flow](https://docs.microsoft.com/power-automate/create-team-flows). All owners of a flow can edit the definition of the flow (for example, add or remove an action or condition). Connections of a team flow are shared in the flow in which they were created. Often flows are shared not because ownership is required, but because a maker would like to share how something was done, which can be achieved by [sending a flow as a copy](https://flow.microsoft.com/blog/send-a-flow-as-a-copy/). For business important flows, you can support a maker by moving the flow from using personal connections to a Service Account.

## Set up alerts using alert policies in the Office 365 Security and Compliance center

1. Navigate to **[protection.office.com](https://protection.office.com)**
1. Select **Search > Audit log search**
1. Select **+ New Alert Policy**
1. Specify a name and description, select

    - Edited App Permission
    - Edited Flow Permission

    under *Send this alert when* and select your (or your Power Platform Admin Group or Distribution List) for *Send this alert to*

    ![Set up Alert policy in Office 365 Security and Compliance center](media/auditlog1.png "Set up Alert policy in Office 365 Security and Compliance center")
1. You will now start receiving alerts when flow or app permissions are changed.

## Set up alerts using Power Automate

By using Power Automate to consume these alerts, admins can receive much more than email alerts - by leveraging the management connectors and other built-in connectors of Power Automate like Approvals, additional information can be provided and additional actions can be implemented which allows administrators to remain productive as they protect their environment.

### Solution overview

A scenario that we will walk through in this post is the ability to detect when apps or flows have been shared and provide pro-active governance against it.

In order to detect sharing events, we will depend upon the Office 365 Security and Compliance logs which captures events related to sharing apps and flows. We will take advantage of the [Office 365 Management API](https://docs.microsoft.com/office/office-365-management-api/get-started-with-office-365-management-apis) to achieve this.

TODO add architecture diagram.

We will be interacting with the Office 365 Management API and the Power Automate Management connector. As a result, there are specific requirements for accessing these capabilities:

| Connector | Permission |
|--------|--------|
| Office 365 Management API | Global Admin Access, Azure AD Application, Office 365 Tenant Admin Consent
| Power Automate Management Connector | Global Admin, Power Platform Admin or  Dynamics 365 Service Admin, Premium License |

### Set up Azure AD Application to connect to the Office 365 Management API

The first thing we need to do is create an Azure AD Application that we will use when calling the Office 365 Management API. More information: [Get started with Office 365 Management APIs](https://docs.microsoft.com/office/office-365-management-api/get-started-with-office-365-management-apis)

1. Sign in to [portal.azure.com](https://portal.azure.com).

1. Go to **Azure Active Directory / App registrations**.

   ![Azure Active Directory - App registration](media/coe33.png "Azure Active Directory - App registration")

1. Select **+ New Registration**.

1. Provide a name (for example, **Office 365 Management**), don't change any of the other settings, and then select **Register**.

1. Select **API Permissions** > **+ Add a permission**.

   ![API Permissions - Add a permission](media/coe34.png "Add a permission")

1. Select **Office 365 Management API**, and configure permissions:

   1. Select **Delegated permissions**, and then select **ActivityFeed.Read**.

      ![Delegated permissions](media/coe36.png "Delegated permissions")

   1. Select **Application permissions**, and then select **ActivityFeed.Read** and **ServiceHealth.Read**.

      ![Application permissions](media/coe37.png "Application permissions")

   1. Select **Add permissions**.

1. Select **Grant Admin Consent for (your organization)**.

   The API permissions should now reflect delegated **ActivityFeed.Read** and application **ActivityFeed.Read / ServiceHealth.Read** permissions, with a status of **Granted for _(your organization)_**.

   ![API permissions](media/coe38.png "API permissions")

1. Select **Certificates and secrets**.

1. Select **+ New client secret**.

   ![New client secret](media/coe39.png "New client secret")

1. Add a description and expiration (in line with your company policies), and then select **Add**.

1. Copy and paste the **Secret** to a text document in Notepad for the time being.

1. Select **Overview**, and copy and paste the *application (client) ID* and *directory (tenant) ID* values to the same text document; be sure to make a note of which GUID is for which value. You'll need these values in the next step as you configure the custom connector.

1. Leave the Azure portal open, because you'll need to make some configuration updates after you set up the custom connector.

### Set up the custom connector to connect to the Office 365 Management API

Now you'll configure and set up a custom connector that uses the [Office 365 Management APIs](https://docs.microsoft.com/office/office-365-management-api/get-started-with-office-365-management-apis).

1. Download the Office 365 Management API Swagger file (TODO need to upload to GitHub)

1. Go to [make.powerapps.com](https://make.powerapps.com).

1. Select Data > Custom Connectors

   ![CoE – Audit Logs solution](media/cc1.png "CoE - Audit Logs solution")

1. Select + New Custom Connector > Import an OpenAPI file

   ![CoE – Audit Logs solution](media/cc2.png "CoE - Audit Logs solution")

1. Set *"Office 365 Management API* as name. Select *Import* and choose the swagger file you have downloaded.Select *Continue*

   ![CoE – Audit Logs solution](media/cc3.png "CoE - Audit Logs solution")

1. Leave the **1. General** page as-is, and then select **2. Security**.

1. Select **Edit** at the bottom of the **OAuth 2.0** area to edit the authentication parameters.

   ![Edit OAuth configuration](media/coe42.png "Edit OAuth configuration")

1. Paste the application (client) ID you copied from the app registration into **Client Id**.

1. Paste the client secret you copied from the app registration into **Client secret**.

1. Don't change the **Tenant ID**.

1. Set the **Resource URL** to https://manage.office.com

1. Copy the **Redirect URL** into your text document in Notepad.

1. Select **Update Connector**.

### Update Azure AD app registration with the redirect URL

1. Go back to the Azure portal and your app registrations.

1. Under Overview, select **Add a Redirect URI**.

1. Select **+ Add a platform** > **Web**.

1. Enter the URL you copied from the **Redirect URL** section of the custom connector.

1. Select **Configure**.

### Start a subscription to the Audit Log Content

Go back to the custom connector to set up a connection to the custom connector and [start a subscription to the audit log content](https://docs.microsoft.com/office/office-365-management-api/office-365-management-activity-api-reference#start-a-subscription), as described in the following steps.

> [!IMPORTANT]
> It's important to complete these steps for the flow to work.

1. On the **Custom Connector** page, select **4. Test**.

1. Select **+ New connection**, and then sign in with your account.

1. Under **Operations**, select **StartSubscription**.

   ![Custom connector Start Subscription](media/coe43.png "Custom connector Start Subscription")

1. Paste the directory (tenant) ID under **Tenant**, and paste the application (client) ID under **PublisherIdentifier**.

1. Select **Test Operation**.

You should see a (200) status returned, which means the query was successful.

![Successful status being returned from the StartSubscription activity](media/coe44.png "Successful status being returned from the StartSubscription activity")

> [!IMPORTANT]
> If you don't see a (200) response, the request has failed and there is an error with your setup. Therefore, the flow won't work.

### Set up a daily sharing digest flow

With the Azure AD App created and consent granted to use the Office 365 Management API, you can now create a flow to receive sharing information.

> [!NOTE]
> The below is a basic sample implementation of how you can interact with the Office 365 Management API. Based on the size of your Audit Log, you might have to list the audit log content more frequently to ensure all information is captured. Find out how this can be achieved using the **[Audit Log Template of the CoE Starter Kit](../coe/setup-auditlog)**.

1. Navigate to **[flow.microsoft.com](https://flow.microsoft.com)**.
1. Select **+ Create** > **Scheduled Flow**, name your flow and select the run schedule (e.g. every hour, every day).

    ![Create a new scheduled flow](media/cc4.png "Create a new scheduled flow")

1. 