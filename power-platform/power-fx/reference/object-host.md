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
contributors:
  - jorisdg
---
# Host object in Power Apps

The **Host** object in Power Apps provides information about the current host running the app.

## Description

Similar to a control or [the **App** object](object-app.md), the **Host** object provides properties that identify information from the host running the app. Every app has a **Host** object.

> [!NOTE]
> The host object is currently only available in custom pages and canvas apps.


To access the **Host** object, expand the  [**App**](object-app.md) object at the top of the **Tree view** pane and then select it. In this example, the **Host** object doesn't have any properties that accept formulas.

> [!div class="mx-imgBorder"]
> ![The Host object in the Tree view pane.](media/object-host/hostobject.png)

## BrowserUserAgent property

The text property **BrowserUserAgent** contains the complete user agent string that the browser uses to identify itself when running the app

For example, a browser user agent string might be:

- Mozilla/5.0 (Windows NT 10.0; Win64; x64) 
- AppleWebKit/537.36 (KHTML, like Gecko) 
- Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.78`

> [!NOTE]
> If you're running Power Apps in a native app or using the [the wrap](/power-apps/maker/common/wrap/wrap-how-to) feature in Power Apps, the app is presented via a browser control, which supplies a user agent string.


## OSType property

The **OSType** property provides the name of the operating system where the app is running. The **OSType** is determined from the user agent string sent by the browser to Power Apps. The following are examples of common values for **OSType**:

| Value |
| --- |
| Windows |
| macOS |
| iOS |
| Android |
| Linux |
| ... |

> [!NOTE]
> Don't using the **OSType** to change experience or functionality of your app based on the reported operating system.

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

The **TenantID** property provides the Globally Unique Identifier (GUID) that specifies the Azure Active Directory (AAD) tenant associated with the presently authenticated user.

> [!NOTE]
> Similar to **SessionID**, in embedded scenarios such as Power Apps in Power BI, the tenant ID is the tenant used for the Power Apps session authentication.

```powerapps-dot
Label1.Text: Host.TenantID
```
