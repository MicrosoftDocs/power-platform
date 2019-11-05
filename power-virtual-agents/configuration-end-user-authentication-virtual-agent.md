---
title: "Configuring User Authentication"
description: "How to configure User Authentication capabilities in the bot"
keywords: "Authentication, IdP, "
ms.date: 10/11/2019
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "VA"
ms.collection: virtualagent
---

# How to configure User Authentication

The Power Virtual Agents bot can be configured to provide authentication capabilities, providing features to make it easier to create a bot that authenticates users to various identity providers, such as Azure AD (Azure Active Directory), MSA (Microsoft Account), Facebook, and any other OAuth2 provider. This document details the configuration step to enable the authentication capabilities to the bot.

To learn how to use authentication in bot topics, see [Using User Authentication on bot topics](power-virtual-agents/advanced-end-user-authentication-virtual-agent.md).

## Supported Identity Providers

Power Virtual Agents supports any Identity Provider that is compliant with the OAuth2 standard.

### Registering a new App with your Identity Provider
You will need to register a new App with your Identity Provider and get a Client ID and Client Secret before you start this setup. Make sure to configure the Redirect URL to be ```https://token.botframework.com/.auth/web/redirect```, and that the assigned API permissions and scopes for this application are the same permissions you need the bot to access.

> [!IMPORTANT] 
> Your app registration Redirect URL must be ```https://token.botframework.com/.auth/web/redirect```.
> Ensure that the App ID has the correct API permissions and its related scopes.

## Getting started

In the bot Home, navigate to "Manage" > "Authentication" on the left navigation bar. You will see the Authentication setup screen with a form.

> [!WARNING] 
> Add image for configuration screen

## Filling in Identity Provider information

The following fields are mandatory for the authentication configuration. The information about this setup is dependent on your specific setup and provider, so if you have questions about the fields below, contact your administrator, or your specific Identity Provider. The examples provided bellow are for AAD (Azure Active Directory) common endpoint.

### Connection Name

Friendly name for your Identity Provider connection. This can be any string, but can't be changed once configured.

### Service Provider

We only support OAuth2 generic providers today. Support for other providers will be available in the future.

### Client ID

Your client id obtained from the Identity Provider registration.

### Client Secret

Client Secret provided by the Identity Provider registration.

### Scope List delimiter

Separator character for the scope list. Empty spaces (' ') are not supported in this field, but can be used in the Scopes field if required by the Identity provider. In that case, use a comma (',') for this field, and spaces in the Scopes field.

### Authorization URL Template

URL template for authorization, defined by your Identity Provider. For example:
```
https://login.microsoftonline.com/common/oauth2/v2.0/authorize
```

### Authorization URL Query String Template

Query template for authorization, provided by your Identity Provider. For example:
```
?client_id={ClientId}&response_type=code&redirect_uri={RedirectUrl}&scope={Scopes}&state={State}
```
Keys in query string template will vary depending on the Identity Provider. 

### Token URL Template

URL Template for Tokens, provided by your Identity Provider. For example:
```
https://login.microsoftonline.com/common/oauth2/v2.0/token
```

### Token URL Query String Template

Query string separator for Token URL. Usually a question mark '?'.

### Token Body Template 

Template for the token body. For example:
```
code={Code}&grant_type=authorization_code&redirect_uri={RedirectUrl}&client_id={ClientId}&client_secret={ClientSecret}
```

### Refresh URL Template 

URL template for Refresh. For example:
```
https://login.microsoftonline.com/common/oauth2/v2.0/token
```

### Refresh URL Query String Template 
Refresh URL Query String separator for Token URL. Usually a question mark '?'.

### Refresh Body Template 
Refresh Body Template example:
```
refresh_token={RefreshToken}&redirect_uri={RedirectUrl}&grant_type=refresh_token&client_id={ClientId}&client_secret={ClientSecret}
```

### Scopes 

List of scopes you want the authenticated users to have once logged in. Make sure you are only setting the necessary scopes, and follow the "Least privilege access control" principle.

## Test your configuration

Once the setup steps above are complete, save your configuration and test it by creating a new topic using authentication. Use these steps to create a test topic:

> [!WARNING] 
> Add image for testing bot, with dialog built per instructions below

1. On the left navigation pane, go to Topics
1. Select "New Topic"
1. Enter a Name, Description, and a Trigger Phrase
1. Save and select "Go to authoring canvas"
1. Click on the Plus sign to add a new node
1. Select "Call an action"
1. Select "Authenticate"
1. Save the topic
1. Open the test bot by clicking on "Test your bot"
1. Enter the trigger phrase added on step 3
1. Click on the Login card, and enter username and password

If you log in successfully, your configuration is complete. If you run into any issues, make sure your configuration is correct.

## Removing an authentication configuration

If you decide to remove the authentication configuration, you can do so by navigating to "Manage" > "Authentication" and select "Delete connection".

### Permanently removing the authentication configuratoin

> [!Note]
> Deleting the Authentication information from the bot does not remove it from Azure Bot Service. If you want to clear the configuration from Azure Bot Service, you will need to contact your subscription owner, who will need to follow the steps below.

1. Login to the Azure Portal
1. Select the Bot Service in the subscription
1. Go to “Settings”
1. Select the connection to be deleted
1. Delete the connection



