---
title: "Configure user authentication in Power Virtual Agents"
description: "Configure authentication with your identity provider to enable users to sign in when having a bot conversation."
keywords: "Authentication, IdP,"
ms.date: 1/24/2020
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: authentication
ms.collection: virtual-agent
---

# Configure end-user authentication in Power Virtual Agents

You can configure a Power Virtual Agents bot to provide authentication capabilities, so users can sign in with any [OAuth2 identity provider](/azure/active-directory/develop/v2-oauth2-auth-code-flow), such as Azure Active Directory (Azure AD), a Microsoft account, or Facebook. 

To learn how to add authentication to a bot topic, see [Add user authentication to a Power Virtual Agents bot](advanced-end-user-authentication.md).

Power Virtual Agents supports any identity provider that is compliant with the [OAuth2 standard](/azure/active-directory/develop/v2-oauth2-auth-code-flow).

   
> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RE4n4G2]

## Registering a new app with your identity provider

You will need to register a new app with your identity provider and get a Client ID and Client Secret before you can configure authentication in Power Virtual Agents. 

Make sure to configure the redirect URL to be `https://token.botframework.com/.auth/web/redirect`, and that the assigned API permissions and scopes for the app are the same permissions you need the bot to access.

> [!IMPORTANT] 
> Your app registration redirect URL must be `https://token.botframework.com/.auth/web/redirect`.<br/>
> Ensure that the app has the correct API permissions and its related scopes.

## Configure authentication

1. In Power Virtual Agents, select **Manage** on the side navigation pane, and then go to the **Authentication** tab.

   ![Go to Manage and then Authentication](media/auth-manage-sm.png)

2. Enter the information as described for each of the fields in the following table. The information required depends on your setup and provider. If you have questions about the required information, contact your administrator or identity provider.

3. Click **Save** to finish the configuration.

> [!NOTE]
> The examples provided below are for an Azure AD common endpoint.

Field name | Description
---|---
Connection name | Friendly name for your identity provider connection. This can be any string, but can't be changed once configured.
Service Provider | This field cannot be edited because Power Virtual Agents only supports generic OAuth2 providers.
Client ID | Your Client ID obtained from the identity provider.
Client Secret | Your Client Secret obtained from the identity provider registration.
Scope List delimiter | The separator character for the scope list. Empty spaces (' ') are not supported in this field, but can be used in the **Scopes** field if required by the identity provider. In that case, use a comma (',') for this field, and spaces (' ') in the **Scopes** field.
Authorization URL Template | URL template for authorization, defined by your identity provider. <br />For example, `https://login.microsoftonline.com/common/oauth2/v2.0/authorize`
Authorization URL Query String Template | Query template for authorization, provided by your identity provider. <br />For example, `?client_id={ClientId}&response_type=code&redirect_uri={RedirectUrl}&scope={Scopes}&state={State}`<br />Keys in the query string template will vary depending on the identity provider. 
Token URL Template | URL Template for tokens, provided by your identity provider. <br />For example, `https://login.microsoftonline.com/common/oauth2/v2.0/token` <br />Note: You must replace this with your Identity Provider URL. For Azure Apps, you need to replace the base URL with your Azure App URL.
Token URL Query String Template | Query string separator for the token URL. Usually a question mark '?'.
Token Body Template | Template for the token body. <br />For example, `code={Code}&grant_type=authorization_code&redirect_uri={RedirectUrl}&client_id={ClientId}&client_secret={ClientSecret}`
Refresh URL Template | URL template for refresh. <br />For example, `https://login.microsoftonline.com/common/oauth2/v2.0/token` <br />Note: You must replace this with your Identity Provider URL. For Azure Apps, you want to replace the base URL with your Azure App URL. 
Refresh URL Query String Template | Refresh URL query string separator for the token URL. Usually a question mark '?'.
Refresh Body Template | Template for the refresh body. <br />For example, `refresh_token={RefreshToken}&redirect_uri={RedirectUrl}&grant_type=refresh_token&client_id={ClientId}&client_secret={ClientSecret}`
Scopes | List of scopes you want authenticated users to have once signed in. Make sure you are only setting the necessary scopes, and follow the [Least privilege access control principle](/windows-server/identity/ad-ds/plan/security-best-practices/implementing-least-privilege-administrative-models).

## Test your configuration

After the setup steps are complete, save your configuration and test it by [creating a new topic using authentication](advanced-end-user-authentication.md).


## Remove the authentication configuration

1. Select **Manage** on the side navigation pane, and then go to the **Authentication** tab.

2. Select **Delete connection**.

If authentication is being used in a topic, you will receive a warning that the connection cannot be deleted until references to it are removed from the affected topics. A list of the affected topics will be provided in the warning note.

### Permanently remove the authentication configuration

> [!Note]
> Deleting the authentication information from the bot does not remove it from Azure Bot Service. If you want to clear the configuration from Azure Bot Service, you will need to contact your subscription owner, who will need to follow these steps. If these steps can't be followed, contact your Microsoft Support manager to have the issue resolved.

1. Sign in to the [Azure Portal](https://portal.azure.com).

1. Go to **Bot Services**.

1. Select the connection to be deleted.

1. Delete the connection.

