---
title: "End of support for Internet Explorer | MicrosoftDocs"
description: Information about end of support for Internet Explorer.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/18/2022
ms.subservice: admin
ms.author: aorth 
author: adrianorth
ms.reviewer: sericks
search.audienceType: 
  - admin
---
# Support end for Internet Explorer 

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Microsoft Internet Explorer and Microsoft Edge Legacy support has ended. This topic outlines the experience that administrators and end users will see related to the support end.
 
Users moving to [Microsoft Edge](https://www.microsoft.com/edge) (based on Chromium) or another supported modern browser will have a significantly improved experience. Experiences in Dynamics / Power Apps are twice as fast on [Microsoft Edge](https://www.microsoft.com/edge) than on Internet Explorer.

The error message will appear at the top of the Power Platform admin center page or the Dynamics 365 app page.

We recommend Dynamics 365 App for Outlook users that use the Outlook desktop client upgrade their clients to Microsoft Outlook versions that use Edge WebView2 or  Microsoft Outlook on the web (OWA).

## Administrator experience 

Administrators in the Power Platform Admin center and in the model-driven apps Advanced Settings will see a warning message if their tenant has Internet Explorer users.  These messages will appear regardless of the browser the administrator is using. 

> **Alert** <br />
> Internet Explorer support has ended. Ensure users have switched to Microsoft Edge or another modern browser. 

## User experience 

All users using Dynamics 365 and canvas apps in the Microsoft Power Platform in Internet Explorer will see an error message at the top of the app. By switching to Microsoft Edge Chromium or another modern browser, the user will not see an error message. From early October 2022, users will be [redirected](https://www.learn.microsoft.com/deployedge/edge-learnmore-neededge) to Microsoft Edge if they have Edge currently installed on their device. Otherwise, they will receive a message informing them why they are blocked and to try using the site on Microsoft Edge. If a user tries accessing Dynamics 365 or Canvas apps in the Microsoft Power Platform in Internet Explorer, they will see the following messages:

> **Alert** <br />
> This website will be blocked in Internet Explorer starting on October 31st. Try using this site in Microsoft Edge. Learn more

This message will appear for users trying to access Dynamics 365 and Microsoft Power Platform in an unsupported version of Microsoft Edge ([Edge Legacy](https://blogs.windows.com/msedgedev/microsoft-edge-legacy-end-of-support)).

> **Alert** <br />
> This website will be blocked in this version of Microsoft Edge starting on October 31st. Try using the latest Edge version. Learn more

Starting October 31, Internet Explorer will be blocked and users will be unable to access Dynamics 365 and Microsoft Power Platform in Internet Explorer. This message will appear for users trying to do so:

> **Alert** <br />
>Unsupported browser. This website is no longer supported in Internet Explorer. Try using this site in Microsoft Edge.

Starting October 31, this message will appear for users trying to access Dynamics 365 and Microsoft Power Platform in an unsupported version of Microsoft Edge ([Edge Legacy](https://blogs.windows.com/msedgedev/microsoft-edge-legacy-end-of-support)).

> **Alert** <br />
> Unsupported browser. This website is no longer supported in this version of Microsoft Edge. Try using the latest Edge version. 

Administrators wanting to block Internet Explorer for users earlier can request this through support. 

[!INCLUDE[footer-include](../includes/footer-banner.md)]
