---
title: Exchange Online cross-tenant authentication 
description: Learn about Exchange Online cross-tenant authentication.
ms.component: pa-admin
ms.topic: how-to
ms.date: 08/13/2026
author: gattimassimo 
ms.author: magatti
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
ms.custom: sfi-image-nochange
contributors: krishnapallavi
---

# Exchange Online cross-tenant authentication

Use server-side synchronization to synchronize Exchange Online mailboxes that reside on different Exchange Online tenants. Follow the steps in this article to complete the prerequisites before you set up an Exchange Online server profile that uses OAuth cross-tenant authentication. For more information, see [Create an email server profile for Exchange Online](connect-exchange-online.md#create-an-email-server-profile-for-exchange-online).

> [!NOTE]
> The following limitations apply to connecting cross-tenant: 
> - Dynamics 365 App for Outlook isn't supported. 
> - A global tenant admin or an Exchange admin of the primary tenant must approve Dynamics 365 mailbox records. 

## Configuration

Sign in to the [Azure portal](https://portal.azure.com/), create the app registration, and then configure the email server profile.

## Register your app

Register your app on the Azure portal on the tenant where Exchange Online resides. To create the app registration, follow the steps in [Register an application](/azure/active-directory/develop/quickstart-register-app#register-an-application).

> [!NOTE]
> You don't need to enter anything for **Redirect URI** because it's not needed.

When you register your app, note the **Application (client) ID** and **Directory (tenant) ID**; you need this information later to configure the email server profile.

## Add a client Secret

A client secret is a string value your app uses to identify itself. Dynamics 365 uses it to authenticate to your app.

To create a client secret, follow the steps in [Add a client secret](/azure/active-directory/develop/quickstart-register-app#add-a-client-secret). Remember to note the **Secret Value**, because you need this information later to configure the email server profile.

## Add API permissions 

To give your app access to Exchange Online, grant the **Office 365 Exchange Online** API permission. 

1. Select **API permissions** > **Add a permission**.

2. Select the **APIs my organization uses** tab, and then select **Office 365 Exchange Online**.
   
   :::image type="content" source="media/office365-exchange-online.png" alt-text="Screenshot of the Office 365 Exchange Online API.":::

3. For the type of permissions, select **Application permissions**, and then select the checkbox for **full\_access\_to\_app**. When you're done, select **Add permissions**.

   :::image type="content" source="media/type-of-permission.png" alt-text="Screenshot of Request API permissions.":::

   > [!NOTE]
   > If it doesn't align with your business requirements to have an app with full access on all mailboxes, the Exchange Online admin can scope the mailboxes that the app can access by using an Application Access Policy. Learn more in [Scoping application permissions to specific Exchange Online mailboxes](/graph/auth-limit-mailbox-access).

4. On the **Configured permissions** screen, select **Grant admin consent for *tenant name***.

    :::image type="content" source="media/grant-admin-consent.png" alt-text="Screenshot of selecting Grant admin consent.":::

5. In the confirmation dialog, select **Yes**.

6. Allow list the application with Exchange Web Services and configure Graph permissions.

   [Exchange Online is retiring EWS service](https://techcommunity.microsoft.com/blog/exchange/exchange-online-ews-your-time-is-almost-up/4492361) in phases. Starting October 2026, only traffic from [allowlisted tenants](https://techcommunity.microsoft.com/blog/exchange/introducing-ewsallowedappids-preparing-for-the-final-phase-of-ews-retirement/4529471) is allowed. EWS service is completely retired by April 2027. Power Platform is transitioning support for cross-tenant email sync functionality from EWS to Graph by April 2027. Customers need to configure the following settings to ensure service continuity and a smooth transition during this phase.

   - **Allow list the tenant with EWS**. Follow the [instructions](https://techcommunity.microsoft.com/blog/exchange/introducing-ewsallowedappids-preparing-for-the-final-phase-of-ews-retirement/4529471).

   - **Configure permissions for Graph API** for all applications created for cross-tenant email sync. Some customers have multiple applications configured.

     - To configure the permissions by using PowerShell, use the [Grant-SssGraphApplicationPermissions script](https://github.com/microsoft/PowerApps-Samples/blob/master/powershell/ServerSideSync/Grant-SssGraphApplicationPermissions.ps1). A Global Administrator must run the script.

     - Or, to configure permissions manually in the Azure portal, do the following:

       1. Select **API permissions** > **Add a permission**.

       1. Select **Microsoft Graph**.

       1. Select **Application permissions**.

       1. Search for and add the following permissions:

          | Permission |
          | --- |
          | `Mail.ReadWrite` |
          | `Mail.Send` |
          | `MailboxSettings.ReadWrite` |
          | `Calendars.ReadWrite` |
          | `Contacts.ReadWrite` |
          | `Tasks.ReadWrite.All` |
          | `MailboxConfigItem.ReadWrite` |
          | `Chat.Read.All` |
          | `OnlineMeetings.ReadWrite.All` |
          | `CallRecords.Read.All` |

       1. On the **Configured permissions** page, select **Grant admin consent for _tenant name_**.

## Email server profile for Exchange Online with authentication type Oauth (cross-tenant)

To [create an email server profile for Exchange Online that uses Oauth (cross-tenant) authentication](connect-exchange-online.md#create-an-email-server-profile-for-exchange-online), collect the following information from the Azure portal:

- Tenant ID: The tenant ID of the tenant where Exchange Online is configured
- Application ID: The app ID used by Dynamics 365 to connect to Exchange Online
- Client secret: The client secret value used by Dynamics 365 to authenticate as the app
