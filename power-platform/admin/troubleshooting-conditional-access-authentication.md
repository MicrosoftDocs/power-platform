---
title: Troubleshooting conditional access in authentication 
description: Learn how to troubleshoot issues related to conditional access authentication for SharePoint and Dataverse.
author: adrianorth
ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/22/2025
reviewer: sericks
ms.subservice: admin
ms.author: aorth
search.audienceType: 
  - admin
---
# Troubleshooting conditional access authentication

This article outlines how to address warning messages related to conditional access authentication improvements for [Manage your documents using SharePoint](manage-documents-using-sharepoint.md). These warning messages will rollout soon notifying which users will be affected. 

With security improvements in SharePoint integration authentication, you need to keep SharePoint Online and Dataverse conditional access aligned to avoid issues. These sections outline how to review and align conditional access.

## Conditional access isn't enabled correctly

When the Document Associated grid shows a warning message "Conditional access isn't enabled correctly", the error code at the end of the message guides addressing the configuration.

![Document associated grid cconditional access isn't enabled correctly](./media/troubleshooting-conditional-access-in-authentication/document-associated-grid-conditional-access-incorrect.png "Document associated grid cconditional access isn't enabled correctly")  

### SharePoint Document Grid warning AADSTS50076 or AADSTS50079 

When message shown is AADSTS50076 or AADSTS50079, an external security challenge is required but not satisfied. A common cause is when multifactor authentication is turned on for SharePoint, but not for Dataverse. Use these steps to ensure both are aligned.

1. Open the Microsoft Entra admin center to **SharePoint Access Policy** using [Find SharePoint Online conditional access](#find-sharepoint-online-conditional-access).
1. Select **Access controls** > **Grant** to open the **Grant** dialog.
1. Under **Grant access**, check if the **Require multifactor authentication** option, and optionally the **Require authentication strength** option, is selected.
1. If either item is selected, then turn on the related Dataverse conditional access policy, if not already turned on, using [Find Dataverse conditional access](#find-dataverse-conditional-access).

There are other situations which might cause this issue. If you checked and it's not multifactor authentication-related, contact Microsoft support and open a ticket requesting support.

### SharePoint Document Grid warning AADSTS50158 

When message shown is AADSTS50158, the error can be related to either multifactor authentication or conditional access policy.

First, check if multifactor authentication is turned on in Dataverse following the steps in [AADSTS50076](#sharepoint-document-grid-warning-aadsts50076-or-aadsts50079). Turn on Dataverse multifactor authentication if it's not already turned on.

If multifactor authentication is turned on in both Dataverse and SharePoint, then you need to check SharePoint conditional access.

1. When the device is managed, open **Extra SharePoint Access Policy** using [Find SharePoint Online conditional access](#find-sharepoint-online-conditional-access).
1. Check if the device has any network conditions:
   1. Select the link under **Network**.
   1. Review network conditions selected under **Include** and **Exclude**.
1. Check if the device is in locations conditions:
   1. Select the link under **Conditions**.
   1. Select the link under **Locations**.
   1. Review selected network or physical locations.

### SharePoint Document Grid warning AADSTS53001

When message shown is AADSTS53001, the device isn't in a domain-joined status. Use the following steps to resolve the issue.

1. Log out or restart your device if you're already logged in. 
1. Sign in to your device using your work or school account. 
1. Connect to your organization's network through a virtual private network (VPN) or DirectAccess. 
1. Clear your browser's cache and restart the browser. 
1. Try to use the SharePoint integration feature again.

### SharePoint Document Grid warning AADSTS53000

When message shown is AADSTS53000, a SharePoint conditional access policy is preventing the device access to the resource. If blocked access is expected, inform the user how to access within the conditional access policy. If blocked access isn't expected, review the SharePoint conditional access within Microsoft Entra admin center **SharePoint Access Policy**.

1. Open the Microsoft Entra admin center to **SharePoint Access Policy** using [Find SharePoint Online conditional access](#find-sharepoint-online-conditional-access).
1. Select **Access controls** > **Grant** to open the **Grant** dialog.
1. Under **Grant access**, check if the **Require device to be marked as compliant** option or the **Require Microsoft Entra hybrid joined device** option is selected.

### SharePoint Document Grid warning AADSTS530003 

When message shown is AADSTS530003, the access is related to a device. First use [AADSTS53000](#sharepoint-document-grid-warning-aadsts53000) to check if the device is managed and then follow these steps.

1. When the device is managed, open **Extra SharePoint Access Policy** using [Find SharePoint Online conditional access](#find-sharepoint-online-conditional-access).
1. Check if the device is in the supported list:
   1. Select the link under **Conditions**.
   1. Select the link under **Device platforms**.
   1. Review platforms selected under **Include** and **Exclude**.
1. Check if the device is in the supported list:
   1. Select the link under **Conditions**.
   1. Select the link under **Client apps**.
   1. Review the selected client apps and in particular the **Browser** client app.
 1. Check if the device is filtered:
   1. Select the link under **Conditions**.
   1. Select the link under **Filter for devices**.
   1. Review the filtered devices.

### SharePoint Document Grid warning AADSTS500011

When message shown is AADSTS500011, the SharePoint on-premises integration isn't configured correctly. The configuration steps in [Configure server-based authentication with SharePoint on-premises](configure-server-based-authentication-sharepoint-on-premises.md) need to be reviewed carefully to maintain access. 

> [!NOTE]
> First check configurations steps for [SharePoint Server SPN in Microsoft Entra Domain Services](configure-server-based-authentication-sharepoint-on-premises.md#update-the-sharepoint-server-spn-in-microsoft-entra-domain-services) steps 3, 4, and 5.

## Authentication isn't enabled correctly

When the Document Associated grid shows a warning message "Authentication isn't enabled correctly", contact support to confirm that authentication is turned on for the environment.

![Document associated grid authentication isn't enabled correctly](./media/troubleshooting-conditional-access-in-authentication/document-associated-grid-authentication-incorrect.png "Document associated grid authentication isn't enabled correctly")  

## Find conditional access setup

### Find SharePoint Online conditional access

1. Open [Microsoft Entra](https://entra.microsoft.com) as a tenant admin.
1. Select **Applications** > **Enterprise Applications** in the left menu.
1. Clear the filter "Application type == Enterprise Applications".

   ![Clear application type filter](./media/troubleshooting-conditional-access-in-authentication/entra-conditional-access-clear-application-type.png "Clear application type filter")  

1. Search for **Office 365 SharePoint Online** and select the item in the list.

   ![Search for Office 365 SharePoint Online](./media/troubleshooting-conditional-access-in-authentication/entra-conditional-access-search-sharepoint-online.png "Search for Office 365 SharePoint Online")  

1. Select **Conditional Access** to show the list of policy names.

   ![Select Security Conditional Access](./media/troubleshooting-conditional-access-in-authentication/entra-conditional-access-security-conditional-access-policies.png "Select Security Conditional Access")

1. Select **SharePoint Access Policy** in the policy list.

### Find Dataverse conditional access

1. Open [Microsoft Entra](https://entra.microsoft.com) as a tenant admin.
1. Select **Applications** > **Enterprise Applications** in the left menu.
1. Clear the filter "Application type == Enterprise Applications".
   
   ![Clear application type filter](./media/troubleshooting-conditional-access-in-authentication/entra-conditional-access-clear-application-type.png "Clear application type filter")  

1. Search for **Dataverse** and select it in the list.

   ![Search for Dataverse](./media/troubleshooting-conditional-access-in-authentication/entra-conditional-access-search-dataverse.png "Search for Dataverse")  
  
1. Select **Conditional Access** to show the list of policy names.

   ![Select Security Conditional Access](./media/troubleshooting-conditional-access-in-authentication/entra-conditional-access-security-conditional-access-policies.png "Select Security Conditional Access" )  
