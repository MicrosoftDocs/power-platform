---
title: Manage privacy and security settings
description: Learn how to view and manage privacy and security settings for Microsoft Dataverse.
ms.date: 07/25/2023
ms.topic: how-to
ms.component: pa-admin
ms.subservice: admin
author: Mattp123
ms.author: matp 
search.audienceType: admin
ms.custom: bap-template
---

# Manage privacy and security settings

Use these settings to customize the privacy and security of the Dataverse environments that are associated with Dynamics 365 Sales, Customer Service, Field Service, Marketing, and Project Service Automation.

You need to have the System Administrator or System Customizer security role or equivalent permissions to change an environment's privacy and security settings.

1. Sign in to the Power Platform admin center.

1. Select **Environments**, and then select an environment.

1. Select **Settings** > **Product** > **Privacy + Security**.

## Settings

| Settings | Description |
| -------------- | ----------------- |
| **Privacy preference** | [Set error reporting preferences for the organization](#set-error-reporting-preferences-for-the-organization) |
| Show privacy statement link for this organization | Default: Off. Select to display the privacy statement link. |
| Privacy statement URL | Provide users with a link to your organization's privacy statement. If you show the link, it's added to the **Settings** menu. |
| **Default action to take when an error occurs** | [Replace the privacy statement for the organization](#replace-the-privacy-statement-for-the-organization) |
| Ask the user for permission to send an error report to Microsoft | Default: Not selected. |
| Automatically send an error report to Microsoft without user interaction | Default: Not selected. |
| Never send an error report to Microsoft | Default: Not selected. |
| **Blocked attachments** |  |
| Block these file extensions | Prevent upload or download of certain attachment types that are considered dangerous. Separate file extensions with a semicolon.<br/><br/>Default extensions: ade; adp; app; asa; ashx; asmx; asp; bas; bat; cdx; cer; chm; class; cmd; com; config; cpl; crt; csh; dll; exe; fxp; hlp; hta; htr; htw; ida; idc; idq; inf; ins; isp; its; jar; js; jse; ksh; lnk; mad; maf; mag; mam; maq; mar; mas; mat; mau; mav; maw; mda; mdb; mde; mdt; mdw; mdz; msc; msh; msh1; msh1xml; msh2; msh2xml; mshxml; msi; msp; mst; ops; pcd; pif; prf; prg; printer; pst; reg; rem; scf; scr; sct; shb; shs; shtm; shtml; soap; stm; tmp; url; vb; vbe; vbs; vsmacros; vss; vst; vsw; ws; wsc; wsf; wsh |
| Blocked mime types | Prevent upload of certain attachment MIME types that are considered dangerous. Separate MIME types with a semicolon. If you allow some MIME types, any blocked MIME types are ignored and only the MIME types in the allow list are allowed. |
| Allowed mime types | Allow upload of certain attachment MIME types. Separate MIME types with a semicolon.<br/>:::image type="content" source="media/mimetypes.png" alt-text="Screenshot of blocked MIME types in Dataverse environment privacy settings.":::<br/>If you allow some MIME types, any blocked MIME types are ignored and only the MIME types in the allow list are allowed. |
| **Session expiration** | [Security enhancements: User session and access management](user-session-management.md) |
| Set custom session timeout | Default: Off. Select **On** to specify values different from the default values. |
| Enter maximum session length | After the time you set is reached, users must reauthenticate to customer engagement apps. |
| How long before the session expires do you want to show a timeout warning? | After the time you set is reached, users receive an expiration warning. |
| **Inactivity timeout** | [Inactivity timeout](user-session-management.md#inactivity-timeout) |
| Set inactivity timeout | Default: Off. Enable to automatically sign out a user. |
| **Enable sharing** |  Default: Off. Select **On** to allow users to share read-only links to records with other users from this environment. |
| **Content security policy** | [Content security policy](content-security-policy.md) |
| **IP address settings** | |
| Enable IP address based cookie binding | Default: Off. When enabled, helps prevent session hijacking exploits in Dataverse with IP address-based cookie binding. [Block cookie replay attacks in Dataverse](block-cookie-replay-attack.md) |
| Enable IP address based Storage Shared Access Signature (SAS) rule | Default: Off. Restricts who, based on IP address, can use enterprise SAS tokens. [SAS IP Binding](security/data-storage.md#sas-ip-binding) |
| Enable IP address based firewall rule | Default: Off. When enabled, allows you to limit Dataverse access to users by specifying valid IP address ranges. [IP firewall in Power Platform environments](ip-firewall.md) |

## Replace the privacy statement for the organization

 By default, the Microsoft privacy statement is always shown to users who have an administrator role but not to other business users. As an administrator, you can specify a link to your organization's privacy statement, which is then shown to other users in your organization. However, any user who has the System Administrator security role always see the Microsoft privacy statement, not the organization's.

1. Sign in to the Power Platform admin center.

1. Select **Environments**, and then select an environment.

1. Select **Settings** > **Product** > **Privacy + Security**.

1. Under **Privacy Preferences**, turn on **Show privacy statement link for this organization**.

1. In the **Privacy statement URL** box, enter the URL of the page you want to show.

1. Select **Save**.

## Set error reporting preferences for the organization

 When errors occur in the product, it sends data about the problem to Microsoft. This error report allows customer engagement apps to track and address errors relating to Dynamics 365. You can help Microsoft improve products and services when you allow the system to send error reports.

 By default, individual users have a measure of control over whether to send error reports to Microsoft. As an administrator, you can override their preferences and set error reporting preferences for the entire organization. You can prevent users from making changes in how errors are reported and change the default behavior for error reporting,

1. In the Power Platform admin center, select **Environments**, and then select an environment.

1. Select **Settings** > **Product** > **Privacy + Security**.

1. Under **Privacy Preferences**, select a **Default action to take when an error occurs**.

1. Select **Save**.

[!INCLUDE [footer-include](../includes/footer-banner.md)]
