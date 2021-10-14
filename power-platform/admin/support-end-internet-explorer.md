---
title: "Support end for Internet Explorer | MicrosoftDocs"
description: Information about support end for Internet Explorer.
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/14/2021
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

> [!IMPORTANT]
> With 2022 release wave 2, Internet Explorer 11 will be blocked. Please switch to a modern browser.

Microsoft Internet Explorer and Microsoft Edge Legacy support has ended. This topic outlines the experience that administrators and end users will see related to the support end. 

Users moving to Microsoft Edge (based on Chromium) or another supported modern browser will have a significantly improved experience.  Microsoft Edge (based on Chromium) and Chrome are twice as fast as Internet Explorer. 

The warning message will appear at the top of the Power Platform admin center page or the Dynamics 365 app page. 

## Administrator experience 

Administrators in the Power Platform Admin center and in the model-driven apps Advanced Settings will see a warning message if their tenant has Internet Explorer users.  These messages will appear regardless of the browser the administrator is using. 

> **Alert** <br />
> Internet Explorer support has ended. Ensure users have switched to Microsoft Edge or another modern browser. 

## User experience 

All users using model-driven apps in Internet Explorer will see a warning message at the top of the app.  By switching to Microsoft Edge Chromium or another modern browser, the user will not see this message.  

> **Alert** <br />
> Internet Explorer support has ended. Please switch to Microsoft Edge or another modern browser. 

**Prior to the 2022 Wave 1 release blocking Internet Explorer,** users using model-driven apps in Internet Explorer will see an error message at the top of the app like the following.  

> **Alert** <br />
> Internet Explorer support has ended and will be blocked soon. Please switch to a modern browser.

**With the 2022 Wave 1 release,** users opening model-driven apps in Internet Explorer will be blocked and see a message like this. 

> **Alert** <br />
> Model-driven apps require Microsoft Edge or a supported browser. Please switch to a modern browser.

Administrators wanting to block Internet Explorer for users earlier can request this through support. 


