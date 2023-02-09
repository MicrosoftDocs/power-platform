---
title: Host object in Power Apps
description: Reference information including syntax and examples for the Host object in Power Apps.
author: jorisdg
ms.topic: reference
ms.custom: canvas
ms.reviewer: 
ms.date: 02/08/2023
ms.author: jorisde
search.audienceType: 
  - maker
search.app: 
  - PowerApps
contributors:
  - jorisdg
---
# Host object in Power Apps

Provides information about the current host running the app.

## Description

Like a control or [the **App** object](object-app.md), the **Host** object provides properties that identify information from the host running the app. Every app has a **Host** object.

At the top of the **Tree view** pane, expand [the **App** object](object-app.md) and select the **Host** object as you would any other control or screen. At this time however, the **Host** object does not have any properties that accept formulas.

> [!div class="mx-imgBorder"]
> ![The Host object in the Tree view pane.](media/object-host/hostobject.png)

## BrowserUserAgent property

The **BrowserUserAgent** text property contains the full user agent string as presented by the browser running the app.

An example browser user agent string could be: `Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.78`

> [!NOTE]
> Even when running a Power App in a native app or using [the wrap feature in Power Apps](/power-apps/maker/common/wrap/wrap-how-to), the Power App is displayed through a browser control which will provide a user agent string.

## OSType property
The **OSType** property provides the name of the operating system in which the app is running. The OS type is determined from the user agent string the browser is sending to Power Apps. Some examples of common values of **OSType**:

| Value |
| --- |
| Windows |
| Mac OS |
| iOS |
| Android |
| Linux |
| ... |

> [!NOTE]
> We strongly discourage using the **OSType** to change experience or functionality of your app based on the reported operating system.

The **OSType** text can be used in any formula, such as showing it in a label's text property:

```powerapps-dot
Label1.Text: "You're running " & Host.OSType
```

## SessionID property
The **SessionID** property returns the GUID that identifies the current session. This can be useful for troubleshooting purposes.

> [!NOTE]
> In embedded scenarios such as Power Apps in Power BI, the SessionID property returns the underlying Power Apps session ID, not the Power BI session ID.

```powerapps-dot
Label1.Text: $"Provide session ID { Host.SessionID } to your administrator."
```

## TenantID property
The **TenantID** property returns the GUID that identifies the AAD tenant currently logged in user authenticated with.

> [!NOTE]
> Similar to **SessionID**, in embedded scenarios such as Power Apps in Power BI, the tenant ID is the tenant used for the Power Apps session authentication.

```powerapps-dot
Label1.Text: Host.TenantID
```
