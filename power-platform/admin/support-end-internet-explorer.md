---
title: "Support end for Internet Explorer | MicrosoftDocs"
description: Information about support end for Internet Explorer.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/18/2022
ms.subservice: admin
ms.author: aorth 
author: adrianorth
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Support end for Internet Explorer 

Microsoft Internet Explorer and Microsoft Edge Legacy support has ended. This topic outlines the experience that administrators and end users will see related to the support end. 

Users moving to Microsoft Edge (based on Chromium) or another supported modern browser will have a significantly improved experience.  Microsoft Edge (based on Chromium) and Chrome are twice as fast as Internet Explorer. 

> [!NOTE]
> Dynamics 365 App for Outlook users using Outlook desktop client on Windows 10 lower than 1903 or Office versions lower than 16.0.11629 can continue to use Internet Explorer 11. For more information on Internet Explorer 11 support in Office products [See Microsoft Edge WebView for Office Add-ins](https://devblogs.microsoft.com/microsoft365dev/microsoft-edge-webview-for-office-add-ins/).  

The warning message will appear at the top of the Power Platform admin center page or the Dynamics 365 app page. 

## Administrator experience 

Administrators in the Power Platform Admin center and in the model-driven apps Advanced Settings will see a warning message if their tenant has Internet Explorer users.  These messages will appear regardless of the browser the administrator is using. 

> **Alert** <br />
> Internet Explorer support has ended. Ensure users have switched to Microsoft Edge or another modern browser. 

## User experience 

All users using model-driven apps in Internet Explorer will see a warning message at the top of the app.  By switching to Microsoft Edge Chromium or another modern browser, the user will not see this message.  

> **Alert** <br />
> Internet Explorer support has ended. Please switch to Microsoft Edge or another modern browser. 

Administrators wanting to block Internet Explorer for users earlier can request this through support. 



[!INCLUDE[footer-include](../includes/footer-banner.md)]
