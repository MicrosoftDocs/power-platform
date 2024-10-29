---
title: "Troubleshooting conditional access in authentication   | MicrosoftDocs"
description: Troubleshooting conditional access in authentication
author: Mattp123
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/11/2020
ms.subservice: admin
ms.author: matp
search.audienceType: 
  - admin
---
# Troubleshooting conditional access authentication

## Conditional access isn't enabled correctly

When the Document Associated grid shows a warning message "Conditional access isn't enabled correctly", the error code at the end of the message will guide addressing the configuration.

![Document associated grid cconditional access isn't enabled correctly](./media/troubleshooting-conditional-access-in-authentication/document-associated-grid-conditional-access-incorrect.png "Document associated grid cconditional access isn't enabled correctly")  

### Document Associated Grid warning AADSTS50076 or AADSTS50079 

In this case an external security challenge is required but not satisfied. A common cause is when Multi-Factor Authentication is enabled for SharePoint but not for Dataverse. Use these steps to ensure both are aligned.

1. Open the Microsoft Entra admin center to **SharePoint Access Policy**
1. Select **Access controls** > **Grant** to open the Grant dialog
1. Under **Grant access** check if **Require multifactor authenication** and optionally **Require authentication strength** is checked
1. If either of above is checked, then enable the related Dataverse conditional access access policy if it is not enabled

There are other situations which might cause this issue, if you checked it is not MFA related, please contact Microsoft support and open a ticket for this. 

### Document Associated Grid warning AADSTS50158 

When message shown is AADSTS53000, the error can be related to either Multi-Factor Authentication or or conditional access policy. 

### Document Associated Grid warning AADSTS53003 

When message shown is AADSTS53000, a conditional access has been configured to block issuing a token.

### Document Associated Grid warning AADSTS53001

When message shown is AADSTS53000, the device is not in a domain joined status. Use these steps to fix.

1. Log out or restart your device if you are already logged in 
1. Sign in to your device using your work or school account 
1. Connect to your organization's network through a virtual private network (VPN) or DirectAccess 
1. Clear your browser's cache and restart the browser 
1. Try to use SharePoint integration feature again

### Document Associated Grid warning AADSTS53000

When message shown is AADSTS53000, the device is required to be managed by SharePoint conditional access to access the resource. If this is expected, inform the user how to access within the conditional access policy. If this is not expected, review the SharePoint conditional access within Microsoft Entra admin center **SharePoint Access Policy**.

1. Open the Microsoft Entra admin center to **SharePoint Access Policy**
1. Select **Access controls** > **Grant** to open the Grant dialog
1. Under **Grant access** check if **Require device to be marked as compliant** or **Require Microsoft Entra hybrid joined device** is checked

## Authentication isn't enabled correctly

When the Document Associated grid shows a warning message "Authentication isn't enabled correctly", please contact support to confirm that authentication is enabled for the environment.

![Document associated grid authentication isn't enabled correctly](./media/troubleshooting-conditional-access-in-authentication/document-associated-grid-authentication-incorrect.png "Document associated grid authentication isn't enabled correctly")  
